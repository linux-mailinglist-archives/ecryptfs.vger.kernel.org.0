Return-Path: <ecryptfs+bounces-1245-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BBuKMbRGV2r4IQEAu9opvQ
	(envelope-from <ecryptfs+bounces-1245-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 10:37:08 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 732B275BF24
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 10:37:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1245-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1245-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EBBFA300998E
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 08:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAAF3CAE80;
	Wed, 15 Jul 2026 08:37:06 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA52C35F5F7;
	Wed, 15 Jul 2026 08:37:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104626; cv=none; b=Jjvg0ZDUkhnfwsiNdwP1lw/uaN0hQat8BTvYKgec9SBkWzVjJ6giHtQTu/vMGSqeRoa6BBlhYXAvy4tuyA8Zei2Moc3IobL5vfyHFG1x0J6cgz3RaY+fYTCJpbZENHrompM/5CxQWZXrQ3M0jW0cDJu6RKdeJdjs6tzU+Cpq77g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104626; c=relaxed/simple;
	bh=tj5tIHJCz8dv/kOvhKzlR98MO/Z8HHSGV2BDJx6CROY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzstZBSE2Ex9BcXj37bIwgd43pMibez5FekrQuyHwTYjFEi9OnMezTB316+qmW5KRr2slQzKXyqwBhQdovAAM1+r1k7qtPT3MTa1Hji/J8qhr2eRqIrQogqjip7PGA2xPy5UJXm8avlV3jcCLQLA4EydrTrEr+doqiInpsFNfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAC3Gt6uRldqI1JHGA--.26200S2;
	Wed, 15 Jul 2026 16:37:02 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Tyler Hicks <code@tyhicks.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Halcrow <mhalcrow@us.ibm.com>
Subject: [PATCH] ecryptfs: validate encoded packet length extent
Date: Wed, 15 Jul 2026 16:37:02 +0800
Message-ID: <20260715083702.29471-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3Gt6uRldqI1JHGA--.26200S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF17JryxKFWUtrykZw1rXrb_yoW8CF4rpF
	1rCa43Xw15tw4UCr4UGan5Wa1UWa9xJw18KrWxXw10ywsrCFyfK3y29390gayrAFW8J3yU
	KrZ8tryfCF12yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeKsjUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:code@tyhicks.com,m:pengpeng@iscas.ac.cn,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mhalcrow@us.ibm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-1245-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,ecryptfs@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[ecryptfs];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iscas.ac.cn:from_mime,iscas.ac.cn:email,iscas.ac.cn:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 732B275BF24

ecryptfs_miscdev_write() accepts a six-byte write as a minimally sized
message.  It then copies two bytes from the packet-length field at byte
offset five, although such an input supplies only the first byte.

Copy only the bytes covered by the current write.  When the first byte
selects the two-byte encoding, reject the message unless it also supplies
the second byte before calling ecryptfs_parse_packet_length().

Fixes: 8bf2debd5f7b ("eCryptfs: introduce device handle for userspace daemon communications")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 fs/ecryptfs/miscdev.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/ecryptfs/miscdev.c b/fs/ecryptfs/miscdev.c
index 5a7d08149922..a99e16db8243 100644
--- a/fs/ecryptfs/miscdev.c
+++ b/fs/ecryptfs/miscdev.c
@@ -360,7 +360,7 @@ ecryptfs_miscdev_write(struct file *file, const char __user *buf,
 	u32 seq;
 	size_t packet_size, packet_size_length;
 	char *data;
-	unsigned char packet_size_peek[ECRYPTFS_MAX_PKT_LEN_SIZE];
+	unsigned char packet_size_peek[ECRYPTFS_MAX_PKT_LEN_SIZE] = { 0 };
 	ssize_t rc;
 
 	if (count == 0) {
@@ -376,11 +376,17 @@ ecryptfs_miscdev_write(struct file *file, const char __user *buf,
 	}
 
 	if (copy_from_user(packet_size_peek, &buf[PKT_LEN_OFFSET],
-			   sizeof(packet_size_peek))) {
+			   min_t(size_t, count - PKT_LEN_OFFSET,
+				 sizeof(packet_size_peek)))) {
 		printk(KERN_WARNING "%s: Error while inspecting packet size\n",
 		       __func__);
 		return -EFAULT;
 	}
+	if (packet_size_peek[0] >= 192 && packet_size_peek[0] < 224 &&
+	    count - PKT_LEN_OFFSET < ECRYPTFS_MAX_PKT_LEN_SIZE) {
+		ecryptfs_printk(KERN_WARNING, "Truncated packet length\n");
+		return -EINVAL;
+	}
 
 	rc = ecryptfs_parse_packet_length(packet_size_peek, &packet_size,
 					  &packet_size_length);
-- 
2.43.0


