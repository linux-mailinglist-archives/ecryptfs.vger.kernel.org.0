Return-Path: <ecryptfs+bounces-1201-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDiUGFwP1Wl20AcAu9opvQ
	(envelope-from <ecryptfs+bounces-1201-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:06:20 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B7C3AFB21
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07637302B174
	for <lists+ecryptfs@lfdr.de>; Tue,  7 Apr 2026 14:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8881FECCD;
	Tue,  7 Apr 2026 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mhu5yEq5"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AD81A6809;
	Tue,  7 Apr 2026 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570635; cv=none; b=sAPNdFHPo8tfZmFyvyJezeCAJBDkq3Xp8nQsaQMwKIE5rdvhc2GhgFh9Dtjkm4puz8ODrB726rooaxsLAzlwTl1wsVhpgxHE0UCQYKkjAP4D4d/Ma3QykX2Iq86FFS0gQYLUy8BsAJ3i+CxlXvuzP1ix5xXBQnC6qArw1+f65dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570635; c=relaxed/simple;
	bh=bunqpjia8zvvZm5gKB8Xar2iNruQIK7bryMQzs15C/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ULGtoHBn0hkiBkKtS1u8Z0he4XUpd4rH7Xr1YvavOXkZw8Vj0NiDS2HqEv9fzdPJ+RvV98lfq8lQWy8FKjoe38IKI8XH+RFlqXYM1SmaLjKZZNMXxXPoUXl2yf+Kxuwa42Ywgg35mZ/4u37uFy5o4AnNaOISXybG+3EP4T40+5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mhu5yEq5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=FeqBgk8Itfy8S2krTq/hNUKzlvh3qfd6lv4wKl5aUsM=; b=mhu5yEq5IqV308j7p5mfljO8g3
	Hz+ZBgipspNXTjGL9Kb8WfZxkKorrfjwJtBCjWSoLhf1Bf+7+9R56uD36T47VjhSZPZFh1DZTA4J0
	NCLynlWkpcxWHWRFPkDhOCZ+CKTaj3FzN9M1TnEmaNmE5NQ3fRT7BA6XQE48XkvBi54tY42DV9R7X
	VRWwaZK3Qoa2O90Dmm21im10Zsux4miNpuu444SWtepkZtJRmablyx4JtKQZBz45s9z9t228a5S8A
	koBX65bJh2m5XCIxg4e+a9FbokuhKXalqDFEf5y3ydFCvuZN9v22ngT+QLoblbwfEDPJsglvysIUl
	t/ox9iYg==;
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA721-00000006YoW-3bYI;
	Tue, 07 Apr 2026 14:03:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 6/7] ecryptfs: merge ecryptfs_inode_newsize_ok into truncate_upper
Date: Tue,  7 Apr 2026 16:02:42 +0200
Message-ID: <20260407140329.633186-7-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1201-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: A2B7C3AFB21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both callers of ecryptfs_inode_newsize_ok call truncate_upper right
after.  Merge ecryptfs_inode_newsize_ok into truncate_upper to simplify
the logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 53 +++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 36 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 870eb82003be..a7c6171db85b 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -738,6 +738,23 @@ static int truncate_upper(struct dentry *dentry, loff_t new_size,
 		return 0;
 	}
 
+	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
+	lower_size_before_truncate =
+		upper_size_to_lower_size(crypt_stat, i_size);
+	lower_size_after_truncate =
+		upper_size_to_lower_size(crypt_stat, new_size);
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
@@ -756,7 +773,6 @@ static int truncate_upper(struct dentry *dentry, loff_t new_size,
 		goto out;
 	}
 
-	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
 	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
 		truncate_setsize(inode, new_size);
 		lower_ia->ia_size = new_size;
@@ -790,42 +806,15 @@ static int truncate_upper(struct dentry *dentry, loff_t new_size,
 	 * We are reducing the size of the ecryptfs file, and need to know if we
 	 * need to reduce the size of the lower file.
 	 */
-	lower_size_before_truncate =
-		upper_size_to_lower_size(crypt_stat, i_size);
-	lower_size_after_truncate =
-		upper_size_to_lower_size(crypt_stat, new_size);
 	if (lower_size_after_truncate < lower_size_before_truncate)
 		lower_ia->ia_size = lower_size_after_truncate;
 	else
 		lower_ia->ia_valid &= ~ATTR_SIZE;
-
 out:
 	ecryptfs_put_lower_file(inode);
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
@@ -843,10 +832,6 @@ int ecryptfs_truncate(struct dentry *dentry, loff_t new_length)
 	};
 	int rc;
 
-	rc = ecryptfs_inode_newsize_ok(d_inode(dentry), new_length);
-	if (rc)
-		return rc;
-
 	rc = truncate_upper(dentry, new_length, &lower_ia);
 	if (!rc && lower_ia.ia_valid & ATTR_SIZE) {
 		struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
@@ -938,10 +923,6 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 	if (ia->ia_valid & ATTR_FILE)
 		lower_ia.ia_file = ecryptfs_file_to_lower(ia->ia_file);
 	if (ia->ia_valid & ATTR_SIZE) {
-		rc = ecryptfs_inode_newsize_ok(inode, ia->ia_size);
-		if (rc)
-			goto out;
-
 		rc = truncate_upper(dentry, ia->ia_size, &lower_ia);
 		if (rc < 0)
 			goto out;
-- 
2.47.3


