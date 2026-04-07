Return-Path: <ecryptfs+bounces-1200-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oISsKd8O1WlQzwcAu9opvQ
	(envelope-from <ecryptfs+bounces-1200-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:04:15 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCC23AFA8A
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A3CA300D4DF
	for <lists+ecryptfs@lfdr.de>; Tue,  7 Apr 2026 14:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93723B38AF;
	Tue,  7 Apr 2026 14:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hiDrAO4A"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25101FECCD;
	Tue,  7 Apr 2026 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570632; cv=none; b=kqaQWhPin+YYfzbPN33by24txic+R9zIsvXfwfTkCforAQgBeIpUljr4giWksZkGQAg6yBar7h3wT/hTAbt4Qp0KzWeByufHt2D5QUrO2Zfvw30q6ZPUSzEuDJfDKDFZ6lqyzQVNkCByUWbUHVG1lx+EDtGaXALkUjC0bUk3XoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570632; c=relaxed/simple;
	bh=g9wwDM3nlA+2RjJA+AQVQe5XDP11bNhmoS709FnBVOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxeulEkbYno3ws8kmKmMlFLpsiNRqD5jxmRPlBIzudmhP/f7399bDPZw65WkHMmxc6w2nuYbNt68KB8dpXYj7jwQ0ltAa4wurH5GbGzuhnDDN7ufB8vsjPJV6ShYI67dSK3s5Pae+u6MYNeC3FrkKTa9vlVUOAIZ6rGBuM+z/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hiDrAO4A; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=bSiIaW1Ig4Ixmt6MBDru9rxRT3ijZRjjuzS5zZ3f1TU=; b=hiDrAO4APElv1cDtstRRSUrZj8
	QHb44zw4sBFOxCoHlipirvqZveKcBPo6hc1yRxsUpilZCCyzdCAq5outMyDqaoi3SrludJX+Iav2g
	OzWAIdJ4QkNANoephS8CZDG9Dcb2nl9GcURtVa87vZk6NIBbTspmLJPG4Ihx3zuJ7KcT0jvRCv3Of
	Nbm4wDIzv7l7YfVtHJ7qgyjoGtbYIrrts+idsqJ6hZEOKOhnijbn2Jc+2CYE9KRLRndf6A+lG66iM
	hOE9b0dntxo6OxOsOq8X9lf2S07XQr61fVDyGgesnlRS4bzxNRUsEWIQv8tKkPP9W9oLkAq1NN+9y
	AnMFwxfQ==;
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA71y-00000006YoH-3kYv;
	Tue, 07 Apr 2026 14:03:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 5/7] ecryptfs: sanitize struct iattr handling in truncate_upper
Date: Tue,  7 Apr 2026 16:02:41 +0200
Message-ID: <20260407140329.633186-6-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1200-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim]
X-Rspamd-Queue-Id: 4CCC23AFA8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the two callers of truncate_upper handle passing information
very differently.  ecryptfs_truncate passes a zeroed lower_ia and expects
truncate_upper to fill it in from the upper ia created just for that,
while ecryptfs_setattr passes a fully initialized lower_ia copied from
the upper one.

Switch to only passing a new upper size and the lower ia.  This cleans up
the logic in truncate_upper and ecryptfs_truncate.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 49 ++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index ec6aae5af1f8..870eb82003be 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -709,7 +709,7 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
 /**
  * truncate_upper
  * @dentry: The ecryptfs layer dentry
- * @ia: Address of the ecryptfs inode's attributes
+ * @new_size: New upper file size.
  * @lower_ia: Address of the lower inode's attributes
  *
  * Function to handle truncations modifying the size of the file. Note
@@ -722,8 +722,8 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
  *
  * Returns zero on success; non-zero otherwise
  */
-static int truncate_upper(struct dentry *dentry, struct iattr *ia,
-			  struct iattr *lower_ia)
+static int truncate_upper(struct dentry *dentry, loff_t new_size,
+		struct iattr *lower_ia)
 {
 	struct inode *inode = d_inode(dentry);
 	struct ecryptfs_crypt_stat *crypt_stat;
@@ -733,7 +733,7 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 	size_t num_zeros;
 	int rc;
 
-	if (unlikely((ia->ia_size == i_size))) {
+	if (unlikely(new_size == i_size)) {
 		lower_ia->ia_valid &= ~ATTR_SIZE;
 		return 0;
 	}
@@ -742,7 +742,7 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 	if (rc)
 		return rc;
 
-	if (ia->ia_size > i_size) {
+	if (new_size > i_size) {
 		char zero[] = { 0x00 };
 
 		/*
@@ -751,35 +751,34 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 		 * intermediate portion of the previous end of the file and the
 		 * new end of the file.
 		 */
-		rc = ecryptfs_write(inode, zero, ia->ia_size - 1, 1);
+		rc = ecryptfs_write(inode, zero, new_size - 1, 1);
 		lower_ia->ia_valid &= ~ATTR_SIZE;
 		goto out;
 	}
 
 	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
 	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
-		truncate_setsize(inode, ia->ia_size);
-		lower_ia->ia_size = ia->ia_size;
-		lower_ia->ia_valid |= ATTR_SIZE;
+		truncate_setsize(inode, new_size);
+		lower_ia->ia_size = new_size;
 		goto out;
 	}
 
 	/*
-	 * We're chopping off all the pages down to the page in which
-	 * ia->ia_size is located. Fill in the end of that page from
-	 * (ia->ia_size & ~PAGE_MASK) to PAGE_SIZE with zeros.
+	 * We're chopping off all the pages down to the page in which new_size
+	 * is located.  Fill in the end of that page from new_size & ~PAGE_MASK
+	 * to PAGE_SIZE with zeros.
 	 */
-	num_zeros = PAGE_SIZE - (ia->ia_size & ~PAGE_MASK);
+	num_zeros = PAGE_SIZE - (new_size & ~PAGE_MASK);
 	if (num_zeros) {
-		rc = ecryptfs_write(inode, page_address(ZERO_PAGE(0)),
-				ia->ia_size, num_zeros);
+		rc = ecryptfs_write(inode, page_address(ZERO_PAGE(0)), new_size,
+				num_zeros);
 		if (rc) {
 			pr_err("Error attempting to zero out the remainder of the end page on reducing truncate; rc = [%d]\n",
 				rc);
 			goto out;
 		}
 	}
-	truncate_setsize(inode, ia->ia_size);
+	truncate_setsize(inode, new_size);
 	rc = ecryptfs_write_inode_size_to_metadata(inode);
 	if (rc) {
 		pr_err("Problem with ecryptfs_write_inode_size_to_metadata; rc = [%d]\n",
@@ -794,13 +793,12 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 	lower_size_before_truncate =
 		upper_size_to_lower_size(crypt_stat, i_size);
 	lower_size_after_truncate =
-		upper_size_to_lower_size(crypt_stat, ia->ia_size);
-	if (lower_size_after_truncate < lower_size_before_truncate) {
+		upper_size_to_lower_size(crypt_stat, new_size);
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
@@ -840,15 +838,16 @@ static int ecryptfs_inode_newsize_ok(struct inode *inode, loff_t offset)
  */
 int ecryptfs_truncate(struct dentry *dentry, loff_t new_length)
 {
-	struct iattr ia = { .ia_valid = ATTR_SIZE, .ia_size = new_length };
-	struct iattr lower_ia = { .ia_valid = 0 };
+	struct iattr lower_ia = {
+		.ia_valid	= ATTR_SIZE,
+	};
 	int rc;
 
 	rc = ecryptfs_inode_newsize_ok(d_inode(dentry), new_length);
 	if (rc)
 		return rc;
 
-	rc = truncate_upper(dentry, &ia, &lower_ia);
+	rc = truncate_upper(dentry, new_length, &lower_ia);
 	if (!rc && lower_ia.ia_valid & ATTR_SIZE) {
 		struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
 
@@ -943,7 +942,7 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 		if (rc)
 			goto out;
 
-		rc = truncate_upper(dentry, ia, &lower_ia);
+		rc = truncate_upper(dentry, ia->ia_size, &lower_ia);
 		if (rc < 0)
 			goto out;
 	}
-- 
2.47.3


