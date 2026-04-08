Return-Path: <ecryptfs+bounces-1208-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGNgDrjw1WmL/gcAu9opvQ
	(envelope-from <ecryptfs+bounces-1208-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:07:52 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4959F3B7724
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33342301CFAE
	for <lists+ecryptfs@lfdr.de>; Wed,  8 Apr 2026 06:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B4B35E940;
	Wed,  8 Apr 2026 06:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WVKJvVlQ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBC434DB59;
	Wed,  8 Apr 2026 06:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628455; cv=none; b=aks5+35/IFXUpZYT+2LYZuL+bdReYzZGTY/WnMrTMCe7jlkkobzIydMMf2vP5e+sYbGDgQyCGZ8HKlZtyh+kLZI3536wBJuNTbWsSTx9pQUrc3sZL2dar43+bKLeVN0qZRDxdPKXCB6UxCakFd6PQQgkUPVqIBKg3mq0gOg+sX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628455; c=relaxed/simple;
	bh=SzuhLG65FeCfSADNPY6sE7RMoVsiHkL6EfznsDyFJJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbM96QkLsEaNagaTkMyMTwCZjn3pzJs5U/bQs+8n+BGfg+M04PglDXmz/XM0DzIDupl+izmQPmGL1BZEsOI+J5Q1aRpxUX+mYfn4ytAIwv0MIKsuhPLhRScYw5M/DemmB4m+jD8NfilQYuV50bWqd9p1xATKvZ5Al8fWL2xxjeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WVKJvVlQ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=uop5iib8V28wb5Rw5iMutCNVJf64/gxfx9aa2uF3lpU=; b=WVKJvVlQNOgHnMKN0HbaWlMsdK
	qOsngjJhetHUcubJXBniyk7DQ1REAVWkUP/tJCx0QNyi4Rky/qA/XXnTMKloln0nBCj3g5BofHalt
	muqgRRtKBEkYyos/p+tc1SF1SWFmTb0uFhJZDkN1BT/d9TcV24MTNWBZuW0uXNeK5+d7cluTw3jXh
	+boqVKQ+4tq9iFcUVDjKCrCibMFYNuLVj9kyEEWgNv9Yczolrp4fKl4Fwkk8L7ISw133z7GV1kXNM
	MFfHrK42QP8RFc4aEpIgIgR62iLFvG8kD/dFmWLwlO39i1Vg21VwNtpG5HBT/3HaVnzoNh9W6QpiV
	OgzlNHTA==;
Received: from [2001:4bb8:2d1:6f42:152:6810:a349:3502] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM4c-00000008JyJ-00Br;
	Wed, 08 Apr 2026 06:07:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 3/7] ecryptfs: use ZERO_PAGE instead of allocating zeroed memory in truncate_upper
Date: Wed,  8 Apr 2026 08:06:38 +0200
Message-ID: <20260408060719.714317-4-hch@lst.de>
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
	TAGGED_FROM(0.00)[bounces-1208-lists,ecryptfs=lfdr.de];
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
X-Rspamd-Queue-Id: 4959F3B7724
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the existing pre-zeroed memory instead of allocating a new chunk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 695573850569..daa63b7dd015 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -771,15 +771,8 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 	 */
 	num_zeros = PAGE_SIZE - (ia->ia_size & ~PAGE_MASK);
 	if (num_zeros) {
-		char *zeros_virt;
-
-		zeros_virt = kzalloc(num_zeros, GFP_KERNEL);
-		if (!zeros_virt) {
-			rc = -ENOMEM;
-			goto out;
-		}
-		rc = ecryptfs_write(inode, zeros_virt, ia->ia_size, num_zeros);
-		kfree(zeros_virt);
+		rc = ecryptfs_write(inode, page_address(ZERO_PAGE(0)),
+				ia->ia_size, num_zeros);
 		if (rc) {
 			pr_err("Error attempting to zero out the remainder of the end page on reducing truncate; rc = [%d]\n",
 				rc);
-- 
2.47.3


