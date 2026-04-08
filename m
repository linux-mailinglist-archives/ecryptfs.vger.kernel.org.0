Return-Path: <ecryptfs+bounces-1206-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL7ICqnw1WmL/gcAu9opvQ
	(envelope-from <ecryptfs+bounces-1206-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:07:37 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 700ED3B7705
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EC3F301E3CB
	for <lists+ecryptfs@lfdr.de>; Wed,  8 Apr 2026 06:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1D035E959;
	Wed,  8 Apr 2026 06:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HyFjKAeG"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD63A34DB59;
	Wed,  8 Apr 2026 06:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628448; cv=none; b=a0QuTpHUxFS586wZcriW+CeLefBTUNbs7sJLs5n9HItyJ2PGa2OKqlla4bT5kkDNCLSCxR+AleH7BWLBkoWSCt2DBSQZoYAfsKQty/9/npQzhhi53zIp8Rq1hLe+JYTMNHjG4KQr5iT7ghDF2X9e+loEd8aFyQWZxp89Pz6NJhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628448; c=relaxed/simple;
	bh=X2hO08Yp+TzJ2JnO4UvvZGC8GJhD8ysyfMR9Ivd6Toc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zml4z4qt1Sg7r4x3qEZlL5I0pfFd491+S/TuGsokdKK1VldWtJyMfKLRqpAmHO/nGrrXejfpvh/gEk6aXC2pq3pc7bVZFLXUSVazG+WGQIoMLFzoiSqFr8ndBDOmiegxgMeN4DEwBbefRJc8Nluwgiq+g5gHo32iTI4T1cokfJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HyFjKAeG; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+yiuSRW5KKvvnc3x7Kqe/gM6+Csp7SaeV6Ijd8A65KE=; b=HyFjKAeGPjOHxh2F7i4CaRwbTi
	yyAS7YDYbAdpMUi0SqQXG+KFkOoXi/DnBApH/DSbftbsd/wP5WRHqKG65G0Ho1oLB+qYKQk97z9F+
	kxxjwJi0+mnywrrq99JBYS1ys9E2mAQfAn039LTW7kp5vv9d/zeBDJFOUZ40vAPeUvh2hv4bDeFIw
	POgRtOuy+XKDpFjOQdaKOy0Ewk/2yB41fpSQJF75dhiifzy2uKXS7zQ9Ujr5UhxLKUqosGeVxrQ3Q
	TdDNIxvDsLsmJaptmXP4X8Kj9wouwJ6A5U4v0UxaqJkREYBzYzv2np7MTADNpSPyD6AZ/wmWbJdwV
	fqTcvIMQ==;
Received: from [2001:4bb8:2d1:6f42:152:6810:a349:3502] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM4U-00000008Jy2-434h;
	Wed, 08 Apr 2026 06:07:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 1/7] ecryptfs: cleanup ecryptfs_setattr
Date: Wed,  8 Apr 2026 08:06:36 +0200
Message-ID: <20260408060719.714317-2-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1206-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lst.de:mid,infradead.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 700ED3B7705
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Initialize variables at declaration time where applicable and reformat
conditionals to match the kernel coding style.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 8ab014db3e03..81cf42d01ec5 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -886,25 +886,23 @@ ecryptfs_permission(struct mnt_idmap *idmap, struct inode *inode,
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
@@ -917,8 +915,8 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
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


