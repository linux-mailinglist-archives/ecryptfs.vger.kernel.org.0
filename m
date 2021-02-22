Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82AF321ADB
	for <lists+ecryptfs@lfdr.de>; Mon, 22 Feb 2021 16:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhBVPLZ (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 22 Feb 2021 10:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbhBVPLX (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 22 Feb 2021 10:11:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39048C061574
        for <ecryptfs@vger.kernel.org>; Mon, 22 Feb 2021 07:10:41 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1lECr9-00073v-Mv; Mon, 22 Feb 2021 16:10:39 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1lECr9-0002Lo-7t; Mon, 22 Feb 2021 16:10:39 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     ecryptfs@vger.kernel.org
Cc:     Tyler Hicks <code@tyhicks.com>, kernel@pengutronix.de,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] eCryptfs: fix setattr on empty lower file
Date:   Mon, 22 Feb 2021 16:10:35 +0100
Message-Id: <20210222151035.4168-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ecryptfs@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Depending on the synchronization state of the lower filesystem during a
power cut it can happen that a lower file is empty after that power cut.

An inode_operations::setattr operation fails with -EIO on such files,
because ecryptfs_read_metadata() fails. In e3ccaa976120 ("eCryptfs:
Initialize empty lower files when opening them") a similar problem was
solved in the open() path:

| To transparently solve this problem, this patch initializes empty lower
| files in the ecryptfs_open() error path. If the metadata is unreadable
| due to the lower inode size being 0, plaintext passthrough support is
| not in use, and the metadata is stored in the header of the file (as
| opposed to the user.ecryptfs extended attribute), the lower file will be
| initialized.

Do the same in inode_operations::setattr to allow setattr on empty lower
files.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ecryptfs/crypto.c          | 42 +++++++++++++++++++++++++++++++++
 fs/ecryptfs/ecryptfs_kernel.h |  1 +
 fs/ecryptfs/file.c            | 44 +----------------------------------
 fs/ecryptfs/inode.c           |  2 +-
 4 files changed, 45 insertions(+), 44 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 0681540c48d9..a48116aae02c 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1448,6 +1448,48 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
 	return rc;
 }
 
+int ecryptfs_read_or_initialize_metadata(struct dentry *dentry)
+{
+	struct inode *inode = d_inode(dentry);
+	struct ecryptfs_mount_crypt_stat *mount_crypt_stat;
+	struct ecryptfs_crypt_stat *crypt_stat;
+	int rc;
+
+	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
+	mount_crypt_stat = &ecryptfs_superblock_to_private(
+						inode->i_sb)->mount_crypt_stat;
+	mutex_lock(&crypt_stat->cs_mutex);
+
+	if (crypt_stat->flags & ECRYPTFS_POLICY_APPLIED &&
+	    crypt_stat->flags & ECRYPTFS_KEY_VALID) {
+		rc = 0;
+		goto out;
+	}
+
+	rc = ecryptfs_read_metadata(dentry);
+	if (!rc)
+		goto out;
+
+	if (mount_crypt_stat->flags & ECRYPTFS_PLAINTEXT_PASSTHROUGH_ENABLED) {
+		crypt_stat->flags &= ~(ECRYPTFS_I_SIZE_INITIALIZED
+				       | ECRYPTFS_ENCRYPTED);
+		rc = 0;
+		goto out;
+	}
+
+	if (!(mount_crypt_stat->flags & ECRYPTFS_XATTR_METADATA_ENABLED) &&
+	    !i_size_read(ecryptfs_inode_to_lower(inode))) {
+		rc = ecryptfs_initialize_file(dentry, inode);
+		if (!rc)
+			goto out;
+	}
+
+	rc = -EIO;
+out:
+	mutex_unlock(&crypt_stat->cs_mutex);
+	return rc;
+}
+
 /**
  * ecryptfs_encrypt_filename - encrypt filename
  *
diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index e6ac78c62ca4..3815b3cc4c33 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -589,6 +589,7 @@ int ecryptfs_decrypt_page(struct page *page);
 int ecryptfs_write_metadata(struct dentry *ecryptfs_dentry,
 			    struct inode *ecryptfs_inode);
 int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry);
+int ecryptfs_read_or_initialize_metadata(struct dentry *dentry);
 int ecryptfs_new_file_context(struct inode *ecryptfs_inode);
 void ecryptfs_write_crypt_stat_flags(char *page_virt,
 				     struct ecryptfs_crypt_stat *crypt_stat,
diff --git a/fs/ecryptfs/file.c b/fs/ecryptfs/file.c
index 5fb45d865ce5..14157b312f06 100644
--- a/fs/ecryptfs/file.c
+++ b/fs/ecryptfs/file.c
@@ -124,48 +124,6 @@ static int ecryptfs_readdir(struct file *file, struct dir_context *ctx)
 
 struct kmem_cache *ecryptfs_file_info_cache;
 
-static int read_or_initialize_metadata(struct dentry *dentry)
-{
-	struct inode *inode = d_inode(dentry);
-	struct ecryptfs_mount_crypt_stat *mount_crypt_stat;
-	struct ecryptfs_crypt_stat *crypt_stat;
-	int rc;
-
-	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
-	mount_crypt_stat = &ecryptfs_superblock_to_private(
-						inode->i_sb)->mount_crypt_stat;
-	mutex_lock(&crypt_stat->cs_mutex);
-
-	if (crypt_stat->flags & ECRYPTFS_POLICY_APPLIED &&
-	    crypt_stat->flags & ECRYPTFS_KEY_VALID) {
-		rc = 0;
-		goto out;
-	}
-
-	rc = ecryptfs_read_metadata(dentry);
-	if (!rc)
-		goto out;
-
-	if (mount_crypt_stat->flags & ECRYPTFS_PLAINTEXT_PASSTHROUGH_ENABLED) {
-		crypt_stat->flags &= ~(ECRYPTFS_I_SIZE_INITIALIZED
-				       | ECRYPTFS_ENCRYPTED);
-		rc = 0;
-		goto out;
-	}
-
-	if (!(mount_crypt_stat->flags & ECRYPTFS_XATTR_METADATA_ENABLED) &&
-	    !i_size_read(ecryptfs_inode_to_lower(inode))) {
-		rc = ecryptfs_initialize_file(dentry, inode);
-		if (!rc)
-			goto out;
-	}
-
-	rc = -EIO;
-out:
-	mutex_unlock(&crypt_stat->cs_mutex);
-	return rc;
-}
-
 static int ecryptfs_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct file *lower_file = ecryptfs_file_to_lower(file);
@@ -232,7 +190,7 @@ static int ecryptfs_open(struct inode *inode, struct file *file)
 	}
 	ecryptfs_set_file_lower(
 		file, ecryptfs_inode_to_private(inode)->lower_file);
-	rc = read_or_initialize_metadata(ecryptfs_dentry);
+	rc = ecryptfs_read_or_initialize_metadata(ecryptfs_dentry);
 	if (rc)
 		goto out_put;
 	ecryptfs_printk(KERN_DEBUG, "inode w/ addr = [0x%p], i_ino = "
diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 58d0f7187997..230fee828059 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -912,7 +912,7 @@ static int ecryptfs_setattr(struct dentry *dentry, struct iattr *ia)
 			mutex_unlock(&crypt_stat->cs_mutex);
 			goto out;
 		}
-		rc = ecryptfs_read_metadata(dentry);
+		rc = ecryptfs_read_or_initialize_metadata(dentry);
 		ecryptfs_put_lower_file(inode);
 		if (rc) {
 			if (!(mount_crypt_stat->flags
-- 
2.29.2

