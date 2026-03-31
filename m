Return-Path: <ecryptfs+bounces-1180-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNoZKOjsy2mlMgYAu9opvQ
	(envelope-from <ecryptfs+bounces-1180-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 31 Mar 2026 17:48:56 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28036C115
	for <lists+ecryptfs@lfdr.de>; Tue, 31 Mar 2026 17:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8732931AE9B4
	for <lists+ecryptfs@lfdr.de>; Tue, 31 Mar 2026 15:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06A9411612;
	Tue, 31 Mar 2026 15:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qGRvxag8"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC52413241;
	Tue, 31 Mar 2026 15:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971490; cv=none; b=ABIQf1Z2EbLwuzd4jYYJxgF5QKsxXSBYwDlmyYBCPSrXQMF5L46yDYM6MvnPW6IxJRLpYsXS5ThIEA74tpYdM66cZVXc/lfpvqaKfgpTCbkHjEDwULPyQhz+dMzEHmYlTl41eroVMAOO3fWLLdWZYTiT4j/iUJL5JGAdnn+/DWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971490; c=relaxed/simple;
	bh=H76LTB30BdcqHyEzqT21ZvVpJgVc9HRxR7yEH8yUutU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGtN5i4qsHQm3wcRjSxaZacUC6aOq7hf0E6pej21SoAB5a/w3JUDTYH+3K4q9eFoajHcepP9JJFf9Zx0oPE0rqj90nX7XQPdGyfr9ua/O6xOpLmOhD7XtkPx4XXEXoetQrJjJdzcmMHu5UIdYejwkIzKTO3u8Gfqs9NHhDUnu+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qGRvxag8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=By6qV0YRXlNIyphJ4ckFEZRXh6fBSH2vTcRPG3AAG7M=; b=qGRvxag8IgrgzWalrk2ujT334m
	nHc/ZUXnY9QnfJf57OoNK3p799P0lVAcLK5ocDunbmcWkD1fdG2gbbPbl8LRvL9BysNmCX8N8x5Si
	0Fbke6m6YSVIgRQOdyyhM3e56Qdzz0q9xCVDgdRt4iELwBDO6JzF45X0w4LtLFIu114SGWpY+VhRU
	cxEkUN/tXfaoGR6ZVCplUkfo4VNSsZWhOfnwa7QULuW9sqDEUNRR0dGawY3fQbQiSCiJebcrHygjk
	xtv5AftlU+4RXWUZ6ULCDwf+y7LUwGi3DgUI8DfOvlzOfV2+bqhVAAxJr06kMBsWebKK0MH+cG0qz
	GJSqcxlw==;
Received: from [2a02:1210:321a:af00:3fa:89ae:5c22:a910] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bAO-0000000DCA6-2oDa;
	Tue, 31 Mar 2026 15:38:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 5/7] ecryptfs: sanitize struct iattr handling in truncate_upper
Date: Tue, 31 Mar 2026 17:37:26 +0200
Message-ID: <20260331153752.4049454-6-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331153752.4049454-1-hch@lst.de>
References: <20260331153752.4049454-1-hch@lst.de>
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
	TAGGED_FROM(0.00)[bounces-1180-lists,ecryptfs=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lst.de:mid,infradead.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F28036C115
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the two callers of truncate_upper handle passing information
very differently.  ecryptfs_truncate passes a zeroed lower_ia and expects
truncate_upper to fill it in from the upper ia created just for that,
while ecryptfs_setattr passes a fully initialized lower_ia copied from
the upper one.

Switch to only passing a lower ia which must have ia_size set to the
expected lower size, which cleans up the logic in truncate_upper and
ecryptfs_truncate.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 7a3da72eb3c6..a7dc25fae8ee 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -709,7 +709,6 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
 /**
  * truncate_upper
  * @dentry: The ecryptfs layer dentry
- * @ia: Address of the ecryptfs inode's attributes
  * @lower_ia: Address of the lower inode's attributes
  *
  * Function to handle truncations modifying the size of the file. Note
@@ -722,8 +721,7 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
  *
  * Returns zero on success; non-zero otherwise
  */
-static int truncate_upper(struct dentry *dentry, struct iattr *ia,
-			  struct iattr *lower_ia)
+static int truncate_upper(struct dentry *dentry, struct iattr *lower_ia)
 {
 	struct inode *inode = d_inode(dentry);
 	struct ecryptfs_crypt_stat *crypt_stat;
@@ -733,7 +731,7 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 	size_t num_zeros;
 	int rc;
 
-	if (unlikely((ia->ia_size == i_size))) {
+	if (unlikely(lower_ia->ia_size == i_size)) {
 		lower_ia->ia_valid &= ~ATTR_SIZE;
 		return 0;
 	}
@@ -742,7 +740,7 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 	if (rc)
 		return rc;
 
-	if (ia->ia_size > i_size) {
+	if (lower_ia->ia_size > i_size) {
 		char zero[] = { 0x00 };
 
 		/*
@@ -751,16 +749,14 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 		 * intermediate portion of the previous end of the file and the
 		 * new and of the file.
 		 */
-		rc = ecryptfs_write(inode, zero, ia->ia_size - 1, 1);
+		rc = ecryptfs_write(inode, zero, lower_ia->ia_size - 1, 1);
 		lower_ia->ia_valid &= ~ATTR_SIZE;
 		goto out;
 	}
 
 	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
 	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
-		truncate_setsize(inode, ia->ia_size);
-		lower_ia->ia_size = ia->ia_size;
-		lower_ia->ia_valid |= ATTR_SIZE;
+		truncate_setsize(inode, lower_ia->ia_size);
 		goto out;
 	}
 
@@ -769,17 +765,17 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 	 * ia->ia_size is located. Fill in the end of that page from
 	 * (ia->ia_size & ~PAGE_MASK) to PAGE_SIZE with zeros.
 	 */
-	num_zeros = PAGE_SIZE - (ia->ia_size & ~PAGE_MASK);
+	num_zeros = PAGE_SIZE - (lower_ia->ia_size & ~PAGE_MASK);
 	if (num_zeros) {
 		rc = ecryptfs_write(inode, page_address(ZERO_PAGE(0)),
-				ia->ia_size, num_zeros);
+				lower_ia->ia_size, num_zeros);
 		if (rc) {
 			pr_err("Error attempting to zero out the remainder of the end page on reducing truncate; rc = [%d]\n",
 				rc);
 			goto out;
 		}
 	}
-	truncate_setsize(inode, ia->ia_size);
+	truncate_setsize(inode, lower_ia->ia_size);
 	rc = ecryptfs_write_inode_size_to_metadata(inode);
 	if (rc) {
 		pr_err("Problem with ecryptfs_write_inode_size_to_metadata; rc = [%d]\n",
@@ -794,13 +790,12 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 	lower_size_before_truncate =
 		upper_size_to_lower_size(crypt_stat, i_size);
 	lower_size_after_truncate =
-		upper_size_to_lower_size(crypt_stat, ia->ia_size);
-	if (lower_size_after_truncate < lower_size_before_truncate) {
+		upper_size_to_lower_size(crypt_stat, lower_ia->ia_size);
+	if (lower_size_after_truncate < lower_size_before_truncate)
 		lower_ia->ia_size = lower_size_after_truncate;
-		lower_ia->ia_valid |= ATTR_SIZE;
-	} else {
+	else
 		lower_ia->ia_valid &= ~ATTR_SIZE;
-	}
+
 out:
 	ecryptfs_put_lower_file(inode);
 	return rc;
@@ -840,15 +835,17 @@ static int ecryptfs_inode_newsize_ok(struct inode *inode, loff_t offset)
  */
 int ecryptfs_truncate(struct dentry *dentry, loff_t new_length)
 {
-	struct iattr ia = { .ia_valid = ATTR_SIZE, .ia_size = new_length };
-	struct iattr lower_ia = { .ia_valid = 0 };
+	struct iattr lower_ia = {
+		.ia_valid	= ATTR_SIZE,
+		.ia_size	= new_length,
+	};
 	int rc;
 
 	rc = ecryptfs_inode_newsize_ok(d_inode(dentry), new_length);
 	if (rc)
 		return rc;
 
-	rc = truncate_upper(dentry, &ia, &lower_ia);
+	rc = truncate_upper(dentry, &lower_ia);
 	if (!rc && lower_ia.ia_valid & ATTR_SIZE) {
 		struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
 
@@ -943,7 +940,7 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 		if (rc)
 			goto out;
 
-		rc = truncate_upper(dentry, ia, &lower_ia);
+		rc = truncate_upper(dentry, &lower_ia);
 		if (rc < 0)
 			goto out;
 	}
-- 
2.47.3


