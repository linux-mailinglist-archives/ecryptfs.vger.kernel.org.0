Return-Path: <ecryptfs+bounces-1243-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qqO9BBsZV2qlFQEAu9opvQ
	(envelope-from <ecryptfs+bounces-1243-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 07:22:35 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB0175AA71
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 07:22:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=n6yNJ3r9;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1243-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1243-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39BEC30B2346
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 05:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40B63B583C;
	Wed, 15 Jul 2026 05:21:17 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA93B5839;
	Wed, 15 Jul 2026 05:21:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092877; cv=none; b=M5bQR40T2qrL0hgkKyi1LDIB77MiBk8x26K1L6ZxyTfvod0KvcjUrCa8DgbU2xlWoiFEGJQcfEyGc5u3kbAm+hgWItpFLF8UMbAajI91Qf6kYyKLg5LnssfGQ//Te1uOLnuyRTdIXAJpyEb99nrWmsQg05nOjBnO9+Or5Ikxr4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092877; c=relaxed/simple;
	bh=n4XUXUIpzzOBEUqyenPVs9cokPBC09a0gKVSXG6QnNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aSRB5NMWhD7WNSKIJZrlHyL5OwFDvea9+WXEWbMJZFP9VxFE1WDLyvElqD9wPU9EPMjMlXvDlA8oTVW2CWR8N4w8K6NNHAdmLiZeNR3v9yalcIAMFURTpKG+bN1LqBhCABNIp1ONUXoJGrxV3bdqrX03B5jQzZoUJazM8UM4sZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=n6yNJ3r9; arc=none smtp.client-ip=18.194.254.142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1784092838;
	bh=uV5uGd0S/c0RvU1SUv/SFk0bXcnV6jdmYgylj/TptMs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=n6yNJ3r9FemSXTeAEIHeLU4mbgFc0dvD0q5ZsfnHm04lrVR/vu/t8FCpMEAkrWh6M
	 JnKvgutBqPnUCcd2/4wBGjze7IeCYMnvUADzPgZ/PGiNSxKO+TFwgCj8xoFQRljK80
	 YkXLjfuGVZCIDDkf9Zocmugbbki4uESWi7yFa4Aw=
X-QQ-mid: esmtpsz16t1784092820tc3466601
X-QQ-Originating-IP: LQ3R1jm83F+BD+YxVKiBghag1f46Hb5LgAWLZA5DU2w=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Jul 2026 13:20:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9908912495004679430
EX-QQ-RecipientCnt: 9
From: Yichong Chen <chenyichong@uniontech.com>
To: ecryptfs@vger.kernel.org
Cc: Tyler Hicks <code@tyhicks.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH v2 2/3] ecryptfs: fix tag 11 packet exact-fit size check
Date: Wed, 15 Jul 2026 13:20:05 +0800
Message-Id: <32b0cb3aedf9f2352f66183039196980d46daa3d.1784081896.git.chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1784081896.git.chenyichong@uniontech.com>
References: <cover.1784081896.git.chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MeFNLUIt+GJ0QwWWKkJ7k0nzpFziiCOXAmQiRA1qcReN00HZxSjBRjxC
	x+y1AWrr7efYlxRmfvSqp1lTDa8mAk9LTbatSLYyTXpRB06bUSbMI2h1PfbZCo5rd0I6NXw
	BWzaSvrMdwzFjxy8vjclzvnzIucAghXM3x95Oho0xIUUyMkMqdi47kRmf7+EWm050TH3kPO
	SPfqHRKxZa82HcCBtZexjsJ/Z1YB1G4+5akQ1lV2GqD5Wv9vRBsrBjX6UMn0MeN4KhSt5cO
	1oGGSv9ZlpzPMLWgPGkADlryLoek50vcLyYXzwNvbqmVlvAW3R4jaIs4hPmfcc1RTE3toxt
	0q1vxzitf49/+pP/1I2qs0GJqO4RN3Huse/Ak+l2weMXHG5qxGnGavvBnAjESRdlEaQbB6R
	VATYclWq6KWn/2sah119BXUnYv5SQHdljJygjlZJif5DduNxE4eCoXpXEQD3ujSa007cmou
	RZm3EnJJxBCqgzcvhgWaBrmuyOuzHpiBBn8Yy3Kk6PCcS2KNElaCTdugI2KCoKJs4I5gF6t
	TBH4CyPLjaEyL1+UKaR5Ic4YowLpab42qLWQ4oGuDOX5yJRxbvUKYfP642cBmlXypKpfxay
	SJ4rcmeoaww3VmkjyKizQhdB66x77G40B8uQ/D2/rikZKD6I+ZH2azHOnv7aeHdF+qIBYY1
	CbjdaiSWuAZEqur791KE0e25m4v+hXWY8LXDz+UnvXh0O+wYlLwgWODtBoWrxVOKNQPZDSa
	Q4roIDEkWolQIz9Z6/oMRGJpREZseGo1jMwhLmxPKncUVRlOp1IV8Y1P8lPdA6mhVjMXpjT
	HWDpoBY1VFPP//tuskN+hqbidhlvJEr7Kpg/H6uIzvAzbGFdWEKhiSPfJ33Fb/wFDPkN36R
	gjVf1g7oh4grsfZhDcAPlIVPK/sWY/h+kODe1h2s1ebdijkCLuEjZmgIhrWkXD8+Hikmdec
	GUiZf23lvNfE9gR2+4trhmhNwhRIUQqLLu4jNd3i8jmc1Foy15fQmJPyWEqyaBfSmQXL1yF
	ZmY4v7p8OzGAzmFF7f+C5/uHddMxgD43iIjKLzvJpmzFibFTUyJiU3EQPQ08w=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-1243-lists,ecryptfs=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ecryptfs@vger.kernel.org,m:code@tyhicks.com,m:thorsten.blum@linux.dev,m:brauner@kernel.org,m:ebiggers@kernel.org,m:kees@kernel.org,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:chenyichong@uniontech.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[chenyichong@uniontech.com,ecryptfs@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenyichong@uniontech.com,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:from_mime,uniontech.com:mid,uniontech.com:email,uniontech.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACB0175AA71

parse_tag_11_packet() rejects a packet when the already-consumed tag and
length bytes plus the packet body exceed the caller supplied maximum
packet size.  The check currently adds one extra byte, even though
*packet_size already includes the tag byte before the length is parsed.

Remove the extra byte so a tag 11 packet that exactly fits the available
buffer is accepted while oversized packets are still rejected.

Fixes: 237fead61998 ("[PATCH] ecryptfs: fs/Makefile and fs/Kconfig")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/ecryptfs/keystore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 90c2b80..02b5d77 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -1537,7 +1537,7 @@ parse_tag_11_packet(unsigned char *data, unsigned char *contents,
 	}
 	(*packet_size) += length_size;
 	(*tag_11_contents_size) = (body_size - 14);
-	if (unlikely((*packet_size) + body_size + 1 > max_packet_size)) {
+	if (unlikely((*packet_size) + body_size > max_packet_size)) {
 		printk(KERN_ERR "Packet size exceeds max\n");
 		rc = -EINVAL;
 		goto out;
-- 
2.51.0


