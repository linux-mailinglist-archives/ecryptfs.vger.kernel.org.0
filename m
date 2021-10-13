Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00F442C0BD
	for <lists+ecryptfs@lfdr.de>; Wed, 13 Oct 2021 14:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234564AbhJMM7C (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 13 Oct 2021 08:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234642AbhJMM67 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 13 Oct 2021 08:58:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B830C061753
        for <ecryptfs@vger.kernel.org>; Wed, 13 Oct 2021 05:56:56 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1madoU-0004Lp-PF; Wed, 13 Oct 2021 14:56:54 +0200
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1madoU-00F0tt-2i; Wed, 13 Oct 2021 14:56:54 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     ecryptfs@vger.kernel.org
Cc:     Tyler Hicks <code@tyhicks.com>, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2] eCryptfs: fix setattr on empty lower file
Date:   Wed, 13 Oct 2021 14:56:52 +0200
Message-Id: <20211013125652.3578336-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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

Changes since v1 (https://www.spinics.net/lists/ecryptfs/msg01397.html):
- In ecryptfs_setattr() ecryptfs_read_or_initialize_metadata() can't be
  called directly as &crypt_stat->cs_mutex would be locked, but in
  ecryptfs_settattr() that mutex is already locked. Create a
  locked/unlocked version of ecryptfs_read_or_initialize_metadata() and
  use the latter one in ecryptfs_setattr().

 fs/ecryptfs/crypto.c          | 61 +++++++++++++++++++++++++++++++++--
 fs/ecryptfs/ecryptfs_kernel.h |  3 +-
 fs/ecryptfs/file.c            | 44 +------------------------
 fs/ecryptfs/inode.c           |  2 +-
 4 files changed, 63 insertions(+), 47 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index e3f5d7f3c8a0a..a14d3ef40259f 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1377,7 +1377,7 @@ int ecryptfs_read_and_validate_xattr_region(struct dentry *dentry,
  *
  * Returns zero if valid headers found and parsed; non-zero otherwise
  */
-int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
+static int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
 {
 	int rc;
 	char *page_virt;
@@ -1443,7 +1443,64 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
 	return rc;
 }
 
-/*
+int ecryptfs_read_or_initialize_metadata_locked(struct dentry *dentry)
+{
+	struct inode *inode = d_inode(dentry);
+	struct ecryptfs_mount_crypt_stat *mount_crypt_stat;
+	struct ecryptfs_crypt_stat *crypt_stat;
+	int rc;
+
+	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
+	mount_crypt_stat = &ecryptfs_superblock_to_private(
+						inode->i_sb)->mount_crypt_stat;
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
+	return rc;
+}
+
+int ecryptfs_read_or_initialize_metadata(struct dentry *dentry)
+{
+	struct inode *inode = d_inode(dentry);
+	struct ecryptfs_crypt_stat *crypt_stat;
+	int rc;
+
+	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
+
+	mutex_lock(&crypt_stat->cs_mutex);
+
+	rc = ecryptfs_read_or_initialize_metadata_locked(dentry);
+
+	mutex_unlock(&crypt_stat->cs_mutex);
+
+	return rc;
+}
+
+/**
  * ecryptfs_encrypt_filename - encrypt filename
  *
  * CBC-encrypts the filename. We do not want to encrypt the same
diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 5f2b49e13731a..af71d6f7da91d 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -573,7 +573,8 @@ int ecryptfs_encrypt_page(struct page *page);
 int ecryptfs_decrypt_page(struct page *page);
 int ecryptfs_write_metadata(struct dentry *ecryptfs_dentry,
 			    struct inode *ecryptfs_inode);
-int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry);
+int ecryptfs_read_or_initialize_metadata(struct dentry *dentry);
+int ecryptfs_read_or_initialize_metadata_locked(struct dentry *dentry);
 int ecryptfs_new_file_context(struct inode *ecryptfs_inode);
 void ecryptfs_write_crypt_stat_flags(char *page_virt,
 				     struct ecryptfs_crypt_stat *crypt_stat,
diff --git a/fs/ecryptfs/file.c b/fs/ecryptfs/file.c
index 18d5b91cb573e..4721aba376784 100644
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
index 16d50dface59a..bdeeb89d1dc95 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -916,7 +916,7 @@ static int ecryptfs_setattr(struct user_namespace *mnt_userns,
 			mutex_unlock(&crypt_stat->cs_mutex);
 			goto out;
 		}
-		rc = ecryptfs_read_metadata(dentry);
+		rc = ecryptfs_read_or_initialize_metadata_locked(dentry);
 		ecryptfs_put_lower_file(inode);
 		if (rc) {
 			if (!(mount_crypt_stat->flags
-- 
2.30.2

