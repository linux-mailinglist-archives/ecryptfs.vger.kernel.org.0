Return-Path: <ecryptfs+bounces-1244-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 51aQCn8ZV2quFQEAu9opvQ
	(envelope-from <ecryptfs+bounces-1244-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 07:24:15 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CAD75AA8E
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 07:24:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=TWf2bKuZ;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1244-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1244-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 480803118623
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 05:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30503B4EBD;
	Wed, 15 Jul 2026 05:21:30 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB20D3B5854;
	Wed, 15 Jul 2026 05:21:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092890; cv=none; b=nru0YwMNR+dNpJp91o8mtWfdmSPShanIJjA/2tX/e5xPGVS+7tJb8xVL0cLXOoZ4EdfGxZjB5baRLvNNqBbl/N72IedQiRDxUsuBTt734FLsjT9iU1/AWQvcv0hp5kg0m0Z2TezyoJAlhx+m7FtCibe2MmTPNKmYpiLeJMQFL8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092890; c=relaxed/simple;
	bh=QTD39YOTQptiaIHylilwDz2RZxD9N/9RwKyJDQTQOfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sJt65N9+k0MJXDSnTmM1WfhSMXxoi82XgYhXp5cBP2DVrEpnmkxelEKn9pYstzh6cZxtDawxjxtKemkBMqMmPOret0Mj0TFDURoR2V1DpM5HFoNrt4+4FinIy32W/0eq4XqSQ3zA05uQntPUV2qMGjCADsvM8Sq7vo6zMw8M9oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=TWf2bKuZ; arc=none smtp.client-ip=54.204.34.130
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1784092842;
	bh=VFYv6SVUxgTl3IH1Il5m6Lw6uwCALWN7Qm2KUslpPLg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=TWf2bKuZ142CKjuTFJz1Ra1o9ZaQ5nh9vOlb10tfdXosD2XiAe0knelW51k84Q/1i
	 YC8x9R6MgcSWAQrtAoFGATuLS6PtlSTuv57p7MGdyY37Dwl7V9LVLyHZ07TSEwJ+9/
	 NG//wB9vHwwW9qvpmGPVNlU5eALj7Fq1+CuneISw=
X-QQ-mid: esmtpsz16t1784092825t2f5cd86a
X-QQ-Originating-IP: aocFq+llOLD8qlWzw9LFNVNLL/RdEUnqWFKVLETDgn0=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Jul 2026 13:20:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7522504236989646418
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
Subject: [PATCH v2 3/3] ecryptfs: reject too-small tag 70 packets
Date: Wed, 15 Jul 2026 13:20:06 +0800
Message-Id: <ee7c048de44df27f44be1ff8e48c3e47ef523c77.1784081896.git.chenyichong@uniontech.com>
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
X-QQ-XMAILINFO: NCzI/oQKSQE0UIY/0Co6MK6/VaB5L4CuOZlKTd+ZAJvIT4vQh/argH4T
	zuy3rcXomXdhXRKUfQK10Pe+FEQaZTuZMRX1scjGA3V8L8XkEKG+ZaMSfH5Entg/IaXK0qz
	285NTFqf1eLcdunC+8K11RaKKB8JyljrU+s2C+l+xmJjhg8+xIT34PNRkiIov2xj29O+nvp
	DIGTG5RQTRUuY1DCmpEz3jxIE8JARnOlLks8CU+GGnoeHC2mC1wpTUuyhTEXYyCHk3Mep1W
	atFlP34CPEcE3C0kBmDozsuSKz+6i2LgbNxev4+nd6AllSyDRnrIDeZBncUYSszozzxT9kA
	qnFrCGkmZ9RDlL8qG0bP3CiJcJaWg2sHtK3yBBoHb/Ak0HXKWzhCde/Ih/meFLd3JqJB2FF
	BhBYTtvU2oUwPH/VRnPJAxrIzpb5kGlzmNJ2/chB1NBpJMjdsru7gH9kibssmdVeW0AYZIg
	HuneVichiu8G3DXy23wNY3Ys3XlP4oHG1U7pdd6ZJUIbx0UedhxNnlxbOBfoWhZI7VBU77p
	hK6jih/g7M8vN00aA3tcJMVDxylapPcVT3Cr/8CrSV/XylZCNqgqACY4Q1AjJVqzYlMzCQp
	vnRHU8rzhgx+NyeUawSrxCy+r6MEDCSkegYLzEU6hgMpcubYu0hat20OK4dKe/Nu5jgxIK+
	FlNOUuJDA4Vp1tDpWXqQC+noXaFNlYEGUwsEMiRsHHr68Bdnirio1e7+N0Sc7TBEVNeMFWo
	Y4QMQfZgO/QyuNAA0B1fM1UtrHNGigqTeqfco39sc0ffVRs7CoMvsCABPNk4IhkIhxXhYto
	pIDOseEbk7yG1gpD4BmhT0R0h7zpoMfVI0Imyt2JgD86oosesP0BwhboIapUI0gaK9E7s2o
	nxnhHWPuh/RbWceCOIaZAauIVjye20fgB6bpidN0uVRW5/R6ZrJl7VpSKTuQ1EmtosZtYhH
	OhiZPsbHWjpLRnb/pXOylL8arhpJId4ZA2vq1lau9EOLmJDu8obe8KxE0iKCI32Hv/PuL24
	c3odiTfxjrsAAvIYdXXYlCPmYQHByOEM+92++XS4Zqsrvx1aek1QDwSG4XHkw=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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
	TAGGED_FROM(0.00)[bounces-1244-lists,ecryptfs=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,uniontech.com:from_mime,uniontech.com:mid,uniontech.com:email,uniontech.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73CAD75AA8E

ecryptfs_parse_tag_70_packet() subtracts fixed metadata fields from the
parsed packet body size to derive the encrypted filename size.  A
malformed packet with a body smaller than those fixed fields can underflow
that size calculation.

Reject tag 70 packets before the subtraction unless the body contains the
signature, cipher code, and at least one byte of encrypted filename data.

Fixes: 9c79f34f7ee7 ("eCryptfs: Filename Encryption: Tag 70 packets")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/ecryptfs/keystore.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 02b5d77..a525a8c 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -894,6 +894,12 @@ ecryptfs_parse_tag_70_packet(char **filename, size_t *filename_size,
 		       "rc = [%d]\n", __func__, rc);
 		goto out;
 	}
+	if (s->parsed_tag_70_packet_size < (ECRYPTFS_SIG_SIZE + 2)) {
+		ecryptfs_printk(KERN_WARNING, "Invalid packet size [%zd]\n",
+				s->parsed_tag_70_packet_size);
+		rc = -EINVAL;
+		goto out;
+	}
 	s->block_aligned_filename_size = (s->parsed_tag_70_packet_size
 					  - ECRYPTFS_SIG_SIZE - 1);
 	if ((1 + s->packet_size_len + s->parsed_tag_70_packet_size)
-- 
2.51.0


