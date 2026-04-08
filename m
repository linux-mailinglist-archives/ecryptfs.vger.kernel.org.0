Return-Path: <ecryptfs+bounces-1209-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED+EE8Tw1WmL/gcAu9opvQ
	(envelope-from <ecryptfs+bounces-1209-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:08:04 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C604C3B7742
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF4A030221D2
	for <lists+ecryptfs@lfdr.de>; Wed,  8 Apr 2026 06:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A8C34DB59;
	Wed,  8 Apr 2026 06:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Cuezb69E"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12F35CB8B;
	Wed,  8 Apr 2026 06:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628459; cv=none; b=QCFwE8NFEv0jL2uojxK4Ri7+xFsAickn1Pgl8NeT6iVn3qtIS8FIY6qzsBo+0cI9LgJfnvt+8lgqVl6FrZ82BzzAsMN/4MBXZsnf1/Sbnt+OIU7jYu3YKMU0UzWc924wlJ3JQ8KMxLBwQwIJcu3vNdsJQbP6YUeq2B7uuZJuUdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628459; c=relaxed/simple;
	bh=DpLR+JYR7iEftVwaO1mTLNukv4rP/pYTY8B4qA9kOyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDqzegB88BCAhohwE0vuPBdDBYGaBq8kPJPUG4SmRdgG6JQ4a2i14uWIv8AW2CShpUA5nQ05hF2WMAksACENAnJhNKXLldwNIVSQtECJ1CHHaAmomj9m5PP0kJCc/STVgrLXHU9z7w1JqfwH8IOlqKDwntsD185f7pLUkPZqpfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Cuezb69E; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=x8wHx/06Nif4EID+jlc04LMDvl7rXMKGmefrgkj3IYc=; b=Cuezb69EkLuw5WYLxnNbkdZdHz
	LXNjL/HAjcxW7Qbe4WiQPQm45TU7VSPlLEG8fpIOV4ijI3rz6H9+rTq1P/6/yqJMKHyKaTqJOTW/D
	dBJ4dgCsJ8+V1XAwF9P0rnxDI9aLOancC8UgRJ/+keCugyctOsA0Fq0XRQSNVjh2WxWQCK4TKRG4W
	NtnW8oeCZvqXaQckjaGe0XO8a4HRRz772MH/eAJCwRJz0nQdrrEGPkJt7remqpIewLiNZQvmjxN5h
	37bD6sxLyA7ZyU5yJsBgkdXfAi5kVQxzWnTCRCcBuT5GVcibsDfO7zfJzTug44taEyvr5dCVnFPBt
	lAv3/JGw==;
Received: from [2001:4bb8:2d1:6f42:152:6810:a349:3502] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM4f-00000008JyQ-2c7F;
	Wed, 08 Apr 2026 06:07:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 4/7] ecryptfs: combine the two ATTR_SIZE blocks in ecryptfs_setattr
Date: Wed,  8 Apr 2026 08:06:39 +0200
Message-ID: <20260408060719.714317-5-hch@lst.de>
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
	TAGGED_FROM(0.00)[bounces-1209-lists,ecryptfs=lfdr.de];
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
X-Rspamd-Queue-Id: C604C3B7742
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify the logic in ecryptfs_setattr by combining the two ATTR_SIZE
blocks.  This initializes lower_ia before the size check, which is
obviously correct as the size check doesn't look at it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index daa63b7dd015..ec6aae5af1f8 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -934,16 +934,15 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 	rc = setattr_prepare(&nop_mnt_idmap, dentry, ia);
 	if (rc)
 		goto out;
-	if (ia->ia_valid & ATTR_SIZE) {
-		rc = ecryptfs_inode_newsize_ok(inode, ia->ia_size);
-		if (rc)
-			goto out;
-	}
 
 	memcpy(&lower_ia, ia, sizeof(lower_ia));
 	if (ia->ia_valid & ATTR_FILE)
 		lower_ia.ia_file = ecryptfs_file_to_lower(ia->ia_file);
 	if (ia->ia_valid & ATTR_SIZE) {
+		rc = ecryptfs_inode_newsize_ok(inode, ia->ia_size);
+		if (rc)
+			goto out;
+
 		rc = truncate_upper(dentry, ia, &lower_ia);
 		if (rc < 0)
 			goto out;
-- 
2.47.3


