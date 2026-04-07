Return-Path: <ecryptfs+bounces-1202-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NKiGIcP1WlQzwcAu9opvQ
	(envelope-from <ecryptfs+bounces-1202-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:07:03 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 495E13AFB5C
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E583301614F
	for <lists+ecryptfs@lfdr.de>; Tue,  7 Apr 2026 14:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D333B8D75;
	Tue,  7 Apr 2026 14:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lFD0TvJS"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD9A3B4EB4;
	Tue,  7 Apr 2026 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570640; cv=none; b=vEan/2JACsUbmYEFf4XxOk4HbEe78F+unu7YFYKx70S/GhN3yxUlfRfizYZTOY4MQ/b0c+NeFfEpLh65srdP4Ukc6rRrrUiOeE9ho1dBQZWvlFMn+v8HSCx2tBizL7tPyAxTlPbu2rGHU+xg0ZB3SRfkNU9Oi7ia+RvpWJxjkxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570640; c=relaxed/simple;
	bh=ViAmKCyybh+RYGuCPaOuSuILhoybosPGtaakl+xsXP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQqbfDja/cyXYlsWWXkxwy7k75RE2Q7KQ0+aihan5XdL9/chR+f9te0I4MMXeuKbez0bwdd5Pg+e892FdepRwKZW5axwWJf8+f7m8Uo09InwxrlR2TIPfDtxdDHYRwbd8wFEUsuLEZV6Ibj11Q7sKNhSSSBeLCe7ENQFUIYIfPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lFD0TvJS; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+jXvXk9lUceBxq3dkL2FWae2GJ6kNOQonom+yldlPYM=; b=lFD0TvJShr3fANLbXOSRLFedv5
	yuPRsAvcRV6jWDhwwZoXdAfDPJN/fQxqpu5+aUaUIYUretB2yQhHaJSFfUv8hVAFwzsOZ5zXPl9mp
	wt72YWsk3tp+BB4i3U9UeURfatwvZ/TpZkgoSSsNyWUhkBo0Sn43jdrwJKtwFnDdfIaU0hGlNeuXF
	7vWaaCp6nO7Pr7VIHS5y3ouEQyUToLkPT7hNuH/qFMDPHGs+wcFoAj2gWWyerTS82E89+4DTrmC6H
	xI6Q6XPe16W2XQKwlAr5DF9GNODtuUSoGnabe+WVYWYIRJcOcE4itQJl9ZCELsYEsgvQVfV9a/SiG
	EMMGpnsw==;
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA725-00000006Yof-3TkF;
	Tue, 07 Apr 2026 14:03:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 7/7] ecryptfs: call notify_change from truncate_upper
Date: Tue,  7 Apr 2026 16:02:43 +0200
Message-ID: <20260407140329.633186-8-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407140329.633186-1-hch@lst.de>
References: <20260407140329.633186-1-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1202-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:dkim,lst.de:email,lst.de:mid]
X-Rspamd-Queue-Id: 495E13AFB5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Keep all the truncation logic in one place by also moving the call to
notify_change into truncate_upper.  Rename the resulting function to
__ecryptfs_truncate as it deals with both the lower and upper inodes.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 74 ++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 41 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index a7c6171db85b..58ec6229da4c 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -707,25 +707,23 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
 }
 
 /**
- * truncate_upper
+ * __ecryptfs_truncate - change size of an ecryptfs file.
  * @dentry: The ecryptfs layer dentry
  * @new_size: New upper file size.
  * @lower_ia: Address of the lower inode's attributes
  *
- * Function to handle truncations modifying the size of the file. Note
- * that the file sizes are interpolated. When expanding, we are simply
- * writing strings of 0's out. When truncating, we truncate the upper
- * inode and update the lower_ia according to the page index
- * interpolations. If ATTR_SIZE is set in lower_ia->ia_valid upon return,
- * the caller must use lower_ia in a call to notify_change() to perform
- * the truncation of the lower inode.
+ * Function to handle truncations modifying the size of the file. Note that the
+ * lower file sizes are interpolated.  When expanding, we are simply writing
+ * strings of 0's out.  When truncating, we truncate the upper inode and update
+ * the lower_ia according to the page index interpolations.
  *
- * Returns zero on success; non-zero otherwise
+ * Returns zero on success; non-zero otherwise.
  */
-static int truncate_upper(struct dentry *dentry, loff_t new_size,
+static int __ecryptfs_truncate(struct dentry *dentry, loff_t new_size,
 		struct iattr *lower_ia)
 {
 	struct inode *inode = d_inode(dentry);
+	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
 	struct ecryptfs_crypt_stat *crypt_stat;
 	loff_t i_size = i_size_read(inode);
 	loff_t lower_size_before_truncate;
@@ -733,10 +731,8 @@ static int truncate_upper(struct dentry *dentry, loff_t new_size,
 	size_t num_zeros;
 	int rc;
 
-	if (unlikely(new_size == i_size)) {
-		lower_ia->ia_valid &= ~ATTR_SIZE;
+	if (unlikely(new_size == i_size))
 		return 0;
-	}
 
 	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
 	lower_size_before_truncate =
@@ -769,14 +765,13 @@ static int truncate_upper(struct dentry *dentry, loff_t new_size,
 		 * new end of the file.
 		 */
 		rc = ecryptfs_write(inode, zero, new_size - 1, 1);
-		lower_ia->ia_valid &= ~ATTR_SIZE;
 		goto out;
 	}
 
 	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
 		truncate_setsize(inode, new_size);
 		lower_ia->ia_size = new_size;
-		goto out;
+		goto set_size;
 	}
 
 	/*
@@ -806,10 +801,14 @@ static int truncate_upper(struct dentry *dentry, loff_t new_size,
 	 * We are reducing the size of the ecryptfs file, and need to know if we
 	 * need to reduce the size of the lower file.
 	 */
-	if (lower_size_after_truncate < lower_size_before_truncate)
-		lower_ia->ia_size = lower_size_after_truncate;
-	else
-		lower_ia->ia_valid &= ~ATTR_SIZE;
+	if (lower_size_after_truncate >= lower_size_before_truncate)
+		goto out;
+
+	lower_ia->ia_size = lower_size_after_truncate;
+set_size:
+	inode_lock(d_inode(lower_dentry));
+	rc = notify_change(&nop_mnt_idmap, lower_dentry, lower_ia, NULL);
+	inode_unlock(d_inode(lower_dentry));
 out:
 	ecryptfs_put_lower_file(inode);
 	return rc;
@@ -830,18 +829,8 @@ int ecryptfs_truncate(struct dentry *dentry, loff_t new_length)
 	struct iattr lower_ia = {
 		.ia_valid	= ATTR_SIZE,
 	};
-	int rc;
-
-	rc = truncate_upper(dentry, new_length, &lower_ia);
-	if (!rc && lower_ia.ia_valid & ATTR_SIZE) {
-		struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
 
-		inode_lock(d_inode(lower_dentry));
-		rc = notify_change(&nop_mnt_idmap, lower_dentry,
-				   &lower_ia, NULL);
-		inode_unlock(d_inode(lower_dentry));
-	}
-	return rc;
+	return __ecryptfs_truncate(dentry, new_length, &lower_ia);
 }
 
 static int
@@ -869,7 +858,6 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 			    struct dentry *dentry, struct iattr *ia)
 {
 	struct inode *inode = d_inode(dentry);
-	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
 	struct inode *lower_inode = ecryptfs_inode_to_lower(inode);
 	struct iattr lower_ia;
 	struct ecryptfs_crypt_stat *crypt_stat;
@@ -920,13 +908,6 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 		goto out;
 
 	memcpy(&lower_ia, ia, sizeof(lower_ia));
-	if (ia->ia_valid & ATTR_FILE)
-		lower_ia.ia_file = ecryptfs_file_to_lower(ia->ia_file);
-	if (ia->ia_valid & ATTR_SIZE) {
-		rc = truncate_upper(dentry, ia->ia_size, &lower_ia);
-		if (rc < 0)
-			goto out;
-	}
 
 	/*
 	 * mode change is for clearing setuid/setgid bits. Allow lower fs
@@ -935,9 +916,20 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 	if (lower_ia.ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID))
 		lower_ia.ia_valid &= ~ATTR_MODE;
 
-	inode_lock(d_inode(lower_dentry));
-	rc = notify_change(&nop_mnt_idmap, lower_dentry, &lower_ia, NULL);
-	inode_unlock(d_inode(lower_dentry));
+	if (ia->ia_valid & ATTR_SIZE) {
+		if (ia->ia_valid & ATTR_FILE)
+			lower_ia.ia_file = ecryptfs_file_to_lower(ia->ia_file);
+		rc = __ecryptfs_truncate(dentry, ia->ia_size, &lower_ia);
+		if (rc < 0)
+			goto out;
+	} else {
+		struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
+
+		inode_lock(d_inode(lower_dentry));
+		rc = notify_change(&nop_mnt_idmap, lower_dentry, &lower_ia,
+			NULL);
+		inode_unlock(d_inode(lower_dentry));
+	}
 out:
 	fsstack_copy_attr_all(inode, lower_inode);
 	return rc;
-- 
2.47.3


