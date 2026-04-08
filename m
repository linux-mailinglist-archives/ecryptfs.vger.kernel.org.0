Return-Path: <ecryptfs+bounces-1210-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PUNKsnw1WmL/gcAu9opvQ
	(envelope-from <ecryptfs+bounces-1210-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:08:09 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC43B774B
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04AE030252AA
	for <lists+ecryptfs@lfdr.de>; Wed,  8 Apr 2026 06:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511083612ED;
	Wed,  8 Apr 2026 06:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="r5tv3zCe"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2000634DB59;
	Wed,  8 Apr 2026 06:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628463; cv=none; b=ufEnlRYeXArBvRvS6lBf1nk5eyNsLIUhU5MKah8cdETIC3FMmUsb+ujK1rD+KmAPzsspXYYkeADxaByS1uKnQglX1Urwa5Oe7BcOQsBZJsRs0KBdc0jQK/f2V1VGk9rmiO/r2e4FdWtLpNcraXbIwNLWkgb0GoHvw3jvKXbRjnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628463; c=relaxed/simple;
	bh=hJ6RI8ax4j0F2GmUrznL5Ylfc9mFG9oW9MNBqhytwXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OT1/b5lEJ6K0Dq9Qpbkf5Igs/pff4auj0e/Fb3+5+ivwwrQ8+iMiKS8rQI1hLkwzRGJtpZaNFWy/RdnOKHVN4OVesvhXrE2N9KaOjyY6gcoiLQYtR1wfQl6VxUBkCbbbhw7UXng3VG43HUOEE9e7dy//zEbE6nno+u5qNyX+nDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=r5tv3zCe; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Q32HvKzhUL7QRhZoruzNFN4HU7AOSdxP5mhg5WxmuDY=; b=r5tv3zCePQVpH1sAtBRFtoTVJb
	s9bbz2LEd9jfmkYijakaxN2u/p+IvJ3A9QJO6X9G7yaReDAWf1aYWaLtoR8TjeRa1bGHluV73ZJaF
	bEWdyxF5+b3a/DeDJnbLXlkbn+eHqOwmAic5g3ZoU06c4HX2FMz3E/k4I8e7FdmblhlttGnHhWGsg
	bfW6s1p9ai21Kxn8YJ6of2Y8WUH78bvunUh64/5/xehlhKm24Tc3mW5kEvzw5QcEJeDBgqloQgTT0
	jQayzBJ57SAsMbEv3fU8oDnPe9SitS1UelzamJ7rZXMc0VH+8fdH5GMHeSiwjFHNwlyOAWpuTdFon
	/jxuEyJw==;
Received: from [2001:4bb8:2d1:6f42:152:6810:a349:3502] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM4j-00000008Jyq-0xad;
	Wed, 08 Apr 2026 06:07:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 5/7] ecryptfs: merge ecryptfs_inode_newsize_ok into truncate_upper
Date: Wed,  8 Apr 2026 08:06:40 +0200
Message-ID: <20260408060719.714317-6-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1210-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,lst.de:email,lst.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0BFC43B774B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both callers of ecryptfs_inode_newsize_ok call truncate_upper right
after.  Merge ecryptfs_inode_newsize_ok into truncate_upper to simplify
the logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 52 +++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 35 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index ec6aae5af1f8..4ec3e76f0562 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -738,6 +738,23 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 		return 0;
 	}
 
+	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
+	lower_size_before_truncate =
+		upper_size_to_lower_size(crypt_stat, i_size);
+	lower_size_after_truncate =
+		upper_size_to_lower_size(crypt_stat, ia->ia_size);
+	if (lower_size_after_truncate > lower_size_before_truncate) {
+		/*
+		 * The eCryptfs inode and the new *lower* size are mixed here
+		 * because we may not have the lower i_mutex held and/or it may
+		 * not be appropriate to call inode_newsize_ok() with inodes
+		 * from other filesystems.
+		 */
+		rc = inode_newsize_ok(inode, lower_size_after_truncate);
+		if (rc)
+			return rc;
+	}
+
 	rc = ecryptfs_get_lower_file(dentry, inode);
 	if (rc)
 		return rc;
@@ -756,7 +773,6 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 		goto out;
 	}
 
-	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
 	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
 		truncate_setsize(inode, ia->ia_size);
 		lower_ia->ia_size = ia->ia_size;
@@ -791,10 +807,6 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 	 * We are reducing the size of the ecryptfs file, and need to know if we
 	 * need to reduce the size of the lower file.
 	 */
-	lower_size_before_truncate =
-		upper_size_to_lower_size(crypt_stat, i_size);
-	lower_size_after_truncate =
-		upper_size_to_lower_size(crypt_stat, ia->ia_size);
 	if (lower_size_after_truncate < lower_size_before_truncate) {
 		lower_ia->ia_size = lower_size_after_truncate;
 		lower_ia->ia_valid |= ATTR_SIZE;
@@ -806,28 +818,6 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 	return rc;
 }
 
-static int ecryptfs_inode_newsize_ok(struct inode *inode, loff_t offset)
-{
-	struct ecryptfs_crypt_stat *crypt_stat;
-	loff_t lower_oldsize, lower_newsize;
-
-	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
-	lower_oldsize = upper_size_to_lower_size(crypt_stat,
-						 i_size_read(inode));
-	lower_newsize = upper_size_to_lower_size(crypt_stat, offset);
-	if (lower_newsize > lower_oldsize) {
-		/*
-		 * The eCryptfs inode and the new *lower* size are mixed here
-		 * because we may not have the lower i_mutex held and/or it may
-		 * not be appropriate to call inode_newsize_ok() with inodes
-		 * from other filesystems.
-		 */
-		return inode_newsize_ok(inode, lower_newsize);
-	}
-
-	return 0;
-}
-
 /**
  * ecryptfs_truncate
  * @dentry: The ecryptfs layer dentry
@@ -844,10 +834,6 @@ int ecryptfs_truncate(struct dentry *dentry, loff_t new_length)
 	struct iattr lower_ia = { .ia_valid = 0 };
 	int rc;
 
-	rc = ecryptfs_inode_newsize_ok(d_inode(dentry), new_length);
-	if (rc)
-		return rc;
-
 	rc = truncate_upper(dentry, &ia, &lower_ia);
 	if (!rc && lower_ia.ia_valid & ATTR_SIZE) {
 		struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
@@ -939,10 +925,6 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 	if (ia->ia_valid & ATTR_FILE)
 		lower_ia.ia_file = ecryptfs_file_to_lower(ia->ia_file);
 	if (ia->ia_valid & ATTR_SIZE) {
-		rc = ecryptfs_inode_newsize_ok(inode, ia->ia_size);
-		if (rc)
-			goto out;
-
 		rc = truncate_upper(dentry, ia, &lower_ia);
 		if (rc < 0)
 			goto out;
-- 
2.47.3


