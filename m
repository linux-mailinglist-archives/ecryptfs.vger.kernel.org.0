Return-Path: <ecryptfs+bounces-1227-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lm7LFZiRP2pIUgkAu9opvQ
	(envelope-from <ecryptfs+bounces-1227-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Sat, 27 Jun 2026 11:02:16 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E636D1851
	for <lists+ecryptfs@lfdr.de>; Sat, 27 Jun 2026 11:02:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=Jtty+i7A;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1227-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1227-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B54C301CFBA
	for <lists+ecryptfs@lfdr.de>; Sat, 27 Jun 2026 09:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A802236E3;
	Sat, 27 Jun 2026 09:02:13 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BB481ACD;
	Sat, 27 Jun 2026 09:02:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782550933; cv=none; b=VojWgFj+05GuRcCTM9+7mzPJoaE2icWkF0SGO1A0AFmsl/gO71/duJrMa44Jj3eahg32FSADih/x+Ac4p3D3VdzTWzleD+yQeel6G2Qmvnc2/uB6sjpQf0bBl8BmEVqWaPOmly08rkn9vJ3xKNfgTk8iYmrZ4orcBlKlpVL1cAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782550933; c=relaxed/simple;
	bh=CoYce0p7V2+QDPR0QInWeOvhDko7rTxUoMmEFQ3wf7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L5LfNExquqEl8ALiACONajJ47+2QCtdAm6ARqvFoJFS2v4nr9gjPN9AhUuRdQTc/xi+NdBGakHL8pKwSlimmI9YC/2JpIgSMUwwviLk/9ia+P6SZS+6YtwLzzH+ofgOSb9Z+UlAodT+Qnqoz0a4bUAn0zgPvB82Og1rXifSy9ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Jtty+i7A; arc=none smtp.client-ip=54.206.16.166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782550895;
	bh=BjqUJ7SBZabq8bhqtodTaaaYsaiSKy8G6gLc1SmBMUE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Jtty+i7AcFaeJ4a8jL+bRA+086HgS5uj2Y+nl7OglK8PHuhn6zSSb3Vtw1b7aMLnn
	 me/s3DkwtEAgf8OJczwjvC7kUGISz9hNQoXa8625NrEANFCwu4TJ/jAm147n7hpCDV
	 RIeAxjGNrmF/bNvD9D62f8XfAcV+Rfsyk1HEh5dc=
X-QQ-mid: esmtpsz17t1782550890te8b73551
X-QQ-Originating-IP: DTHyUKLRkw8ztzFU+he5hzHs27RSby6zyDRct44tlio=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 Jun 2026 17:01:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 157958484755876001
EX-QQ-RecipientCnt: 6
From: Yichong Chen <chenyichong@uniontech.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Yichong Chen <chenyichong@uniontech.com>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: release message context on send failure
Date: Sat, 27 Jun 2026 17:01:26 +0800
Message-Id: <20260627090126.27607-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NWth7vBa++Gd6mfcxCMtAhrESC/+P5NPU+VKwFQ+bnhguuVq6tB6hGKj
	yMuMhfsMZ7eXmeWmXlN8Q7dy601BVoxcRjK7DGlcdii6mwdw1dtAb5ix1LpovD6f47IqoEX
	EX1VVCUN1AEZozU8IzaNqDp9O3Ub6ZqGmwUhUT4vGa18ZrAEcShwJKcAgLKHFoVnFEdPn7I
	rWoOYHDEngKiBVgSiOH1LVK3wrKhqCxQU++6GogPAgpbM1oj24AhGS6MMHUKQeskmW/sinx
	4ri9/0QWIoe5XHJl3vQhBE3jMOo1bd+4a9W8pVyyhjyoqHu4Sp0K0FeG2ZP+I/nkus6gPXu
	JG6AJlFskIF0XdqvE4dxfikLP7hfm6NB5Cxbh4Mdsx1afnnPuImNWsDEJ3Vgol+YUZhJKkD
	sy1Xe4S40dFcjqy22d56Wr1VeZNnr1CvyPAknXvN5SpG2hHSmxQGOQSgK8cpwXifjc2bDte
	kBOEHhueRWA3IZLEebubM20cjj4APX2qdl4UmzNKrDYuIAqYNKODV8/KqHSqYdE3J9PxR3m
	JqaakulIL4FMOCw4vODEn8/MPCsEzQ5UCYq+Q26NwBAOv4YyRbpFJ3qBxPpzuo4Ljzznv4p
	t804pRDkz7ce47DpX1gDZfDE1COhU2Y2cuNMaJ3ZtRSRvZt9Y8LYAegwlfP0pO/xhXsGEPp
	EpTYZ2E9/fMFQmQVwTuBwsriOyr9+rSNbxUErmdMWgZyqDB0IowAWYtiRFs6tNnIAgeSxCb
	JhJNyx7qGrd6OyoN04XpzukZC/vY9VImPWxiIDIZpZYEfmdzLP+ynIRZWE9rG45bRBWb5Nw
	XNJ6LTl3tucq3xk8Dct1olcas2tqg2I7zZTCkA2g+tzSytTIvRtuqoSK5X+idWzMq0tK351
	IrHQMHrZxvbzJXatWk0sRbaZTeYDe5w14qzfbNUKvAoDKi1JOhDv8t4mWNfeJBuzhTdlBgG
	V13+h7t5AMKYVPYINuRZWaxzywPy/RH+bFb2RxKfCJ11UJOzSfmPaOVxIiR58uNDMLKXFB2
	gGA95kjqeLXFlApsaq8k6Ai/1HrA6Xf5J4b070Tw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1227-lists,ecryptfs=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:code@tyhicks.com,m:thorsten.blum@linux.dev,m:kees@kernel.org,m:chenyichong@uniontech.com,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[chenyichong@uniontech.com,ecryptfs@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenyichong@uniontech.com,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[ecryptfs];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,uniontech.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69E636D1851

ecryptfs_send_message_locked() moves a message context from the free
list to the allocated list before sending the request to the userspace
daemon.

If ecryptfs_send_miscdev() fails, the context is left on the
allocated list and cannot be reused. Move it back to the free list on
failure and clear the caller's pointer.

Fixes: 624ae5284516 ("eCryptfs: remove netlink transport")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/ecryptfs/messaging.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/ecryptfs/messaging.c b/fs/ecryptfs/messaging.c
index 03c60f0850ca..d53c21e82365 100644
--- a/fs/ecryptfs/messaging.c
+++ b/fs/ecryptfs/messaging.c
@@ -284,9 +284,16 @@ ecryptfs_send_message_locked(char *data, int data_len, u8 msg_type,
 	mutex_unlock(&ecryptfs_msg_ctx_lists_mux);
 	rc = ecryptfs_send_miscdev(data, data_len, *msg_ctx, msg_type, 0,
 				   daemon);
-	if (rc)
+	if (rc) {
 		printk(KERN_ERR "%s: Error attempting to send message to "
 		       "userspace daemon; rc = [%d]\n", __func__, rc);
+		mutex_lock(&ecryptfs_msg_ctx_lists_mux);
+		mutex_lock(&(*msg_ctx)->mux);
+		ecryptfs_msg_ctx_alloc_to_free(*msg_ctx);
+		mutex_unlock(&(*msg_ctx)->mux);
+		mutex_unlock(&ecryptfs_msg_ctx_lists_mux);
+		*msg_ctx = NULL;
+	}
 out:
 	return rc;
 }
-- 
2.51.0


