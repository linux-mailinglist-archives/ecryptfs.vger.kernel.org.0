Return-Path: <ecryptfs+bounces-1178-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAP3KGrty2m5MgYAu9opvQ
	(envelope-from <ecryptfs+bounces-1178-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 31 Mar 2026 17:51:06 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D460136C1DB
	for <lists+ecryptfs@lfdr.de>; Tue, 31 Mar 2026 17:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1DD530B59F9
	for <lists+ecryptfs@lfdr.de>; Tue, 31 Mar 2026 15:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8372241C2EF;
	Tue, 31 Mar 2026 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ga+AnbZh"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A06F421A1A;
	Tue, 31 Mar 2026 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971485; cv=none; b=QDEaNEB1EPCS1UXX9zhmLE8ZzB5rTHqONlT70A4ZsOAn6Dvas2ToM/jplcAf3qrR3uFAVseRmrVh2m2qSuS6UbyolLVsGgto3j2YeJLP4cqioersqKRwb3wQNgB0hbCYqpIyo4oi8dpdrI+//6yEonsd+3ZR6ZVjpr+OwCkuOgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971485; c=relaxed/simple;
	bh=4wXym15Bogo8Ju977m/LlbUf31v2+/6uLNnEWPATUog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AEMhgGXwpSenTO2aeEv8Qc9IWih3af1JNLW6SHQdVC9Cpk7j0HYQ3CQ2P5ls6SBKHWqbgt1msjr+VTO/s8bauTcPiI73I2PEXkfa7fnkfLBh4BB2j7UrcWB91MeDLBVjuQy5nfBAKz7b75ORzFH0FonLcqNJvbfAFgJ+woRzQV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ga+AnbZh; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6hn3tdtXrEUMNcVPclkeD1+ZFxIXR08KyoYdZjcsx58=; b=ga+AnbZhKpDCzF/btlqM2shiAw
	Nx831bFb+YyQnRJ7LR6Ql/GXyxk/R1ZhCyy5TIJnTuvWx5YdmDTfcYjpwGMaZXEO48E2+/Mak1V7Q
	YiFm3fXdti2V/t0SHb+GXgJ1DUSM7/F9tdsxt6zueS08kc3sAYjLjvUET3mFxiofLpbcfjIAyLno9
	4OVTZiJjoSLPZV1jef0mhn/mXw1t/hMgBLgDlTprCOFunmhHqY9AdY5RtG95Mg9MmpaTrOU2gZgG1
	eaimuvXxgfnqHApZIv9zFRseejw/2aOq8oMwIfvr/jkfackpvbZfSo7qQAaJtMYaHrA8V5olmgfqb
	nYThRDRQ==;
Received: from [2a02:1210:321a:af00:3fa:89ae:5c22:a910] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bAJ-0000000DC9s-1nRN;
	Tue, 31 Mar 2026 15:38:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 3/7] ecryptfs: use ZERO_PAGE instead of allocating zeroed memory in truncate_upper
Date: Tue, 31 Mar 2026 17:37:24 +0200
Message-ID: <20260331153752.4049454-4-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1178-lists,ecryptfs=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lst.de:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:dkim]
X-Rspamd-Queue-Id: D460136C1DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the existing pre-zeroed memory instead of allocating a new chunk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 46dc867a8860..57df35a22e9c 100644
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


