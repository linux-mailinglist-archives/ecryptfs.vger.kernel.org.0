Return-Path: <ecryptfs+bounces-1212-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DdQG73w1WmL/gcAu9opvQ
	(envelope-from <ecryptfs+bounces-1212-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:07:57 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E77A93B7731
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE860302086D
	for <lists+ecryptfs@lfdr.de>; Wed,  8 Apr 2026 06:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757C7361DB2;
	Wed,  8 Apr 2026 06:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JnfTPfRQ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3102434DB59;
	Wed,  8 Apr 2026 06:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628470; cv=none; b=H5TG660jG0MgMkgGONlGt+0e3Yx6K4wa60XuogOpft0iFN2k1TS5fLDJ6ng2u21lI2kYW+luk24k/BhNXdnH0ZIH/zyFpSNwS7KPYoqWEDCnFAnjeUgi5r7uycHpukUKIfmFNT+R2E4TtMUpQ0AmO73cEN54sB+S35mLwyAfLX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628470; c=relaxed/simple;
	bh=/+cEc/sl6Jpt+AB662KlHBujY3ZE8kDW5e1ERvY6q1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6SkztHXu0Vb+vwNThm2k3TrUJz8U0WfG3/eEcS4KHynDA13OGulurD6R9h6fJT607bIkz3J13F/knLS3c/bFU7dGH1Hk9cxfjmv+rjVmFYB7VpvrlGI0cniHSwmvu5zN33HWarztPD+DUl00Tjc9MCA6a8SDlgo2f/y3ar2EA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JnfTPfRQ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9/hv42li9JzxkRKRPCaopbGtGKz56+GoiKohgJ9W7UM=; b=JnfTPfRQd9a5TwLuAKksAvr/ZZ
	57YT1PD+51OR7ksrR3t7tuI8ch7n+L+fCQDpzMot7FuDjFtEGsDHh6Iw767IlqvnmYBBwZwdhKZ3X
	l3tydTpJTyRXZm9BqpdE9z7fM5ZoMPKFDU1rp2ZrBALTmO2e7oktMRFDy31yIvN8kfEo9SPbMsy6y
	eNtj8CLq+gP8v4sQR4641LZ4zTBWKtqx/fsozDRM63ORj9nF+lS/bBP/jYSJaUiIIJ3Orq0ehC+/H
	2Nl7ZgZ7wTBOJTOFnpaJIsve6iDtjz2ZbJkmOqTHZHCuAyppRkrKqGh9mHsm4E+CvTOylpti3FPik
	x9Txb6fg==;
Received: from [2001:4bb8:2d1:6f42:152:6810:a349:3502] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM4q-00000008JzS-10v2;
	Wed, 08 Apr 2026 06:07:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 7/7] ecryptfs: keep the lower iattr contained in truncate_upper
Date: Wed,  8 Apr 2026 08:06:42 +0200
Message-ID: <20260408060719.714317-8-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408060719.714317-1-hch@lst.de>
References: <20260408060719.714317-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1212-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,lst.de:email,lst.de:mid]
X-Rspamd-Queue-Id: E77A93B7731
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the two callers of truncate_upper handle passing information
very differently.  ecryptfs_truncate passes a zeroed lower_ia and expects
truncate_upper to fill it in from the upper ia created just for that,
while ecryptfs_setattr passes a fully initialized lower_ia copied from
the upper one.  Both of them then call notify_change on the lower_ia.

Switch to only passing the upper ia, and derive the lower ia from it
inside truncate_upper, and call notify_change inside the function itself.
Because the old name is misleading now, rename the resulting function to
__ecryptfs_truncate as it deals with both the lower and upper inodes.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 82 ++++++++++++++++++++-------------------------
 1 file changed, 36 insertions(+), 46 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index a06b84033ff3..546c1fe692c0 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -721,36 +721,33 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
 }
 
 /**
- * truncate_upper
+ * __ecryptfs_truncate
  * @dentry: The ecryptfs layer dentry
  * @ia: Address of the ecryptfs inode's attributes
- * @lower_ia: Address of the lower inode's attributes
  *
- * Function to handle truncations modifying the size of the file. Note
- * that the file sizes are interpolated. When expanding, we are simply
- * writing strings of 0's out. When truncating, we truncate the upper
- * inode and update the lower_ia according to the page index
- * interpolations. If ATTR_SIZE is set in lower_ia->ia_valid upon return,
- * the caller must use lower_ia in a call to notify_change() to perform
- * the truncation of the lower inode.
+ * Handle truncations modifying the size of the file.  Note that the file sizes
+ * are interpolated.  When expanding, we are simply writing strings of 0's out.
+ * When truncating, we truncate the upper inode and update the lower_ia
+ * according to the page index interpolations.
  *
  * Returns zero on success; non-zero otherwise
  */
-static int truncate_upper(struct dentry *dentry, struct iattr *ia,
-			  struct iattr *lower_ia)
+static int __ecryptfs_truncate(struct dentry *dentry, const struct iattr *ia)
 {
+	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
 	struct inode *inode = d_inode(dentry);
 	struct ecryptfs_crypt_stat *crypt_stat;
 	loff_t i_size = i_size_read(inode);
 	loff_t lower_size_before_truncate;
 	loff_t lower_size_after_truncate;
+	struct iattr lower_ia;
 	size_t num_zeros;
 	int rc;
 
-	if (unlikely((ia->ia_size == i_size))) {
-		lower_ia->ia_valid &= ~ATTR_SIZE;
+	ecryptfs_iattr_to_lower(&lower_ia, ia);
+
+	if (unlikely((ia->ia_size == i_size)))
 		return 0;
-	}
 
 	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
 	lower_size_before_truncate =
@@ -783,15 +780,13 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 		 * new end of the file.
 		 */
 		rc = ecryptfs_write(inode, zero, ia->ia_size - 1, 1);
-		lower_ia->ia_valid &= ~ATTR_SIZE;
 		goto out;
 	}
 
 	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
 		truncate_setsize(inode, ia->ia_size);
-		lower_ia->ia_size = ia->ia_size;
-		lower_ia->ia_valid |= ATTR_SIZE;
-		goto out;
+		lower_ia.ia_size = ia->ia_size;
+		goto set_size;
 	}
 
 	/*
@@ -821,12 +816,15 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 	 * We are reducing the size of the ecryptfs file, and need to know if we
 	 * need to reduce the size of the lower file.
 	 */
-	if (lower_size_after_truncate < lower_size_before_truncate) {
-		lower_ia->ia_size = lower_size_after_truncate;
-		lower_ia->ia_valid |= ATTR_SIZE;
-	} else {
-		lower_ia->ia_valid &= ~ATTR_SIZE;
-	}
+	if (lower_size_after_truncate >= lower_size_before_truncate)
+		goto out;
+
+	lower_ia.ia_size = lower_size_after_truncate;
+set_size:
+	lower_ia.ia_valid |= ATTR_SIZE;
+	inode_lock(d_inode(lower_dentry));
+	rc = notify_change(&nop_mnt_idmap, lower_dentry, &lower_ia, NULL);
+	inode_unlock(d_inode(lower_dentry));
 out:
 	ecryptfs_put_lower_file(inode);
 	return rc;
@@ -844,20 +842,12 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
  */
 int ecryptfs_truncate(struct dentry *dentry, loff_t new_length)
 {
-	struct iattr ia = { .ia_valid = ATTR_SIZE, .ia_size = new_length };
-	struct iattr lower_ia = { .ia_valid = 0 };
-	int rc;
-
-	rc = truncate_upper(dentry, &ia, &lower_ia);
-	if (!rc && lower_ia.ia_valid & ATTR_SIZE) {
-		struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
+	const struct iattr ia = {
+		.ia_valid	= ATTR_SIZE,
+		.ia_size	= new_length,
+	};
 
-		inode_lock(d_inode(lower_dentry));
-		rc = notify_change(&nop_mnt_idmap, lower_dentry,
-				   &lower_ia, NULL);
-		inode_unlock(d_inode(lower_dentry));
-	}
-	return rc;
+	return __ecryptfs_truncate(dentry, &ia);
 }
 
 static int
@@ -887,7 +877,6 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 	struct inode *inode = d_inode(dentry);
 	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
 	struct inode *lower_inode = ecryptfs_inode_to_lower(inode);
-	struct iattr lower_ia;
 	struct ecryptfs_crypt_stat *crypt_stat;
 	int rc;
 
@@ -935,17 +924,18 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 	if (rc)
 		goto out;
 
-	ecryptfs_iattr_to_lower(&lower_ia, ia);
 	if (ia->ia_valid & ATTR_SIZE) {
-		rc = truncate_upper(dentry, ia, &lower_ia);
-		if (rc < 0)
-			goto out;
-	}
+		rc = __ecryptfs_truncate(dentry, ia);
+	} else {
+		struct iattr lower_ia;
 
+		ecryptfs_iattr_to_lower(&lower_ia, ia);
 
-	inode_lock(d_inode(lower_dentry));
-	rc = notify_change(&nop_mnt_idmap, lower_dentry, &lower_ia, NULL);
-	inode_unlock(d_inode(lower_dentry));
+		inode_lock(d_inode(lower_dentry));
+		rc = notify_change(&nop_mnt_idmap, lower_dentry, &lower_ia,
+				NULL);
+		inode_unlock(d_inode(lower_dentry));
+	}
 out:
 	fsstack_copy_attr_all(inode, lower_inode);
 	return rc;
-- 
2.47.3


