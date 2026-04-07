Return-Path: <ecryptfs+bounces-1197-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEoaDngQ1Wl20AcAu9opvQ
	(envelope-from <ecryptfs+bounces-1197-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:11:04 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7761C3AFC65
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3089F304D168
	for <lists+ecryptfs@lfdr.de>; Tue,  7 Apr 2026 14:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB12E315D46;
	Tue,  7 Apr 2026 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GYFYT854"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFD11A6809;
	Tue,  7 Apr 2026 14:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570621; cv=none; b=DTzd0xUHUfliDUNwi61BJaeXxylX9eagct5q2Rz/fDEVFTSR96PLipnapir/Dd1W0aCTnuj3/TVquX9/t1Fyp/5IiK3w6X6o49cnttBwydKsP836D+Sj4cWkGnC9TXxI21u6u6BI22OKUQkuwWdM+kJ1CxbRUgazYB4Wp57WiMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570621; c=relaxed/simple;
	bh=3R02lXLbUGzxIwOq+RyUWwpmX2Ai/6ohJgy8EOVw+JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyZ1OOqUWvV9mBTRr8tN2HU0HDeN3lLSRIZ/P5+32tfZkXsBcAPj2mQwEJfXequPcElMGat1pGEO2bKLC/SpR6odNgUUuPwqUyGmiD3S8YR4nbzMEpmvv2nQgxEOYvF+z/3q/3YyiaYib5JF/MfYE+x3IC8pO8VLJUZi+fbSCZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GYFYT854; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=fpBcYK6RGW+G54hAN4DRQL2rMq8tyCT9JiPZPq4ED+M=; b=GYFYT854yYhzkAqriKCghrgh1o
	eFKiU2xv3JOgZ8p165PPXkVi5nsNuST1xlDaRjg3rLN2M8kAqTFfcxWsXc1xNzOEFV5DJVchmDoSB
	ipwuM2M/JvLtJIHSrtVH2dX2fIYLd6Zx+R6a0jTnJq+vpHCK6+Af0u3ppLk6RHIJVOyydroiHL2vl
	OGHm/fO0A4GJEdjX40YtaQL4SVpm2tBN2+JROINBUE7ud4R0WSCMWBejTIZ7DMvFGWj7g4+ZRaMlW
	8RNmjJDDvcL4TBGeIjrHO4n82UbzSA/LbzKdir1ublz9NoX1RLAXkjio/uZ+U7RgHq06mhQo/gfrB
	oeUJl4ng==;
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA71n-00000006YnB-3YAz;
	Tue, 07 Apr 2026 14:03:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 2/7] ecryptfs: cleanup ecryptfs_setattr
Date: Tue,  7 Apr 2026 16:02:38 +0200
Message-ID: <20260407140329.633186-3-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1197-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 7761C3AFC65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Initialize variables at declaration time where applicable and reformat
conditionals to match the kernel coding style.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 69a5dfaddc5c..695573850569 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -891,25 +891,23 @@ ecryptfs_permission(struct mnt_idmap *idmap, struct inode *inode,
 static int ecryptfs_setattr(struct mnt_idmap *idmap,
 			    struct dentry *dentry, struct iattr *ia)
 {
-	int rc = 0;
-	struct dentry *lower_dentry;
+	struct inode *inode = d_inode(dentry);
+	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
+	struct inode *lower_inode = ecryptfs_inode_to_lower(inode);
 	struct iattr lower_ia;
-	struct inode *inode;
-	struct inode *lower_inode;
 	struct ecryptfs_crypt_stat *crypt_stat;
+	int rc;
 
 	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
 	if (!(crypt_stat->flags & ECRYPTFS_STRUCT_INITIALIZED))
 		ecryptfs_init_crypt_stat(crypt_stat);
-	inode = d_inode(dentry);
-	lower_inode = ecryptfs_inode_to_lower(inode);
-	lower_dentry = ecryptfs_dentry_to_lower(dentry);
+
 	mutex_lock(&crypt_stat->cs_mutex);
 	if (d_is_dir(dentry))
 		crypt_stat->flags &= ~(ECRYPTFS_ENCRYPTED);
-	else if (d_is_reg(dentry)
-		 && (!(crypt_stat->flags & ECRYPTFS_POLICY_APPLIED)
-		     || !(crypt_stat->flags & ECRYPTFS_KEY_VALID))) {
+	else if (d_is_reg(dentry) &&
+		 (!(crypt_stat->flags & ECRYPTFS_POLICY_APPLIED) ||
+		  !(crypt_stat->flags & ECRYPTFS_KEY_VALID))) {
 		struct ecryptfs_mount_crypt_stat *mount_crypt_stat;
 
 		mount_crypt_stat = &ecryptfs_superblock_to_private(
@@ -922,8 +920,8 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 		rc = ecryptfs_read_metadata(dentry);
 		ecryptfs_put_lower_file(inode);
 		if (rc) {
-			if (!(mount_crypt_stat->flags
-			      & ECRYPTFS_PLAINTEXT_PASSTHROUGH_ENABLED)) {
+			if (!(mount_crypt_stat->flags &
+			      ECRYPTFS_PLAINTEXT_PASSTHROUGH_ENABLED)) {
 				rc = -EIO;
 				printk(KERN_WARNING "Either the lower file "
 				       "is not in a valid eCryptfs format, "
-- 
2.47.3


