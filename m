Return-Path: <ecryptfs+bounces-1229-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rlm0FE+XQGr4gQkAu9opvQ
	(envelope-from <ecryptfs+bounces-1229-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Sun, 28 Jun 2026 05:38:55 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66B6D3081
	for <lists+ecryptfs@lfdr.de>; Sun, 28 Jun 2026 05:38:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=elGLVc9C;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1229-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1229-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 572AB3013ED8
	for <lists+ecryptfs@lfdr.de>; Sun, 28 Jun 2026 03:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FA422370A;
	Sun, 28 Jun 2026 03:38:49 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD318146D5A;
	Sun, 28 Jun 2026 03:38:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782617929; cv=none; b=lks1R3mZ8dk+SZBfVuao9zicwKmGxcmM6vCPVjTgAADoqeNZX3B5TTdaWQ72wO/6oIgJQRjk7m1A5sBA1k6dDp5hb62q+GKqLPVFCtIbNj2poFlwgDkdwyHYUZu5uCPLP5OtjfDm1PNaJbXOC0EPY3SVfHxvNFbGPpZuLP2J7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782617929; c=relaxed/simple;
	bh=/aHz4edd/P3X7ULoItTG87Uq1YYfY7HwimlH9JVkCS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7ozlDPr3Foi3l9q4vj3COK58M1n6BFRy7dU6FvUFdSNHKXaEwK4Ex+9dAMOtNyCgzx+rdls1aMEnaqJ4XUOTE82t+hhR4S+kM3Ran4t9b0V8Xt7Z7iMfU5pkwUyB8cB4vQgaom9btzw4RaBV5je2eHxFGf0PnDpORjeplRy7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=elGLVc9C; arc=none smtp.client-ip=54.254.200.92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782617868;
	bh=TuzjWcLHqQcn73ddBY6/ziQdPiCirtbwsCWy3ht2hMA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=elGLVc9CMxoNwPeMAKLgfh78lDsNOR+CkbWMvQV0sOB6PfFa3LlZbkor1nHWUUswU
	 niyZt8Z7TpyWE3nKnSCLx2ost3IPta+zBts8XKFXMEmyBE5K3e1xg41/YAglRMXAZZ
	 uZZARjEuzBfZvWgI/cfonNBSxSF+wG5O/upfoCas=
X-QQ-mid: esmtpgz13t1782617850ta60c0b98
X-QQ-Originating-IP: N9Yt2UwlLekNMIMAuVrO7055L3N3MTN1jX5vTRlMjns=
Received: from uniontech.com ( [59.175.25.120])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Jun 2026 11:37:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16470627901518307323
EX-QQ-RecipientCnt: 8
From: Yichong Chen <chenyichong@uniontech.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michael Halcrow <mhalcrow@us.ibm.com>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] ecryptfs: hold msg ctx list lock when cleaning daemon queue
Date: Sun, 28 Jun 2026 11:37:25 +0800
Message-ID: <4C38E7F6BF114337+20260628033725.11296-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OKhYnE1LzMsBkk0w5YANnS0RjauIIpmy22Bzcj3VHQraAKbH5jZqxrDM
	C4zgy/IIqEdJ+DAxGRkxjhflL/p7NSkHm6GhTU4eAK6vQiqmvvHSPZlXFcKv8eTKRDjzLFp
	OTEYdQ1Ehg0I+UyPhnBjNKmKH3OE12QZURyk9DCCvGU+dK7zCkcRcS7DODSjjlo8cjly9tQ
	QsFrsGgxE3U7MDg4GWLyh5Zwm0zdn6+FPWqnxxrZXnFBq2Poh1hu3/cA0D0WZXZSOZjApVq
	oVnQ3u6HfD/4lHqv6Yu2yX8DmphYelhpOfH4AvIaq+YaYbuBihr0Rin0csuR+dInrNd/LCY
	96QajRtdbk1p8nqJjKMMoRJ96ivFYf1UxLLtvTBfOWb52HWpzxaXUNu8w0Sj5QWBMLsj4Hi
	b5uafl88m5Uv5d9LC8ADPskPtd5328Thfs7iA7qboyn0rnnD3bJZJ3gxeEjo+qfHWmDHCMA
	XwDmdMqWVKAfaz9mh/XChyD6RP+qE/GRNsB3UUvLK4N27kek5MPnTOog3QV3F6vvsa3Be8d
	d4GRBXMOosn1JauYdgX58qORbFDi1eeeflAYBbQoTeKdOsP2qc8ob8EVxvpY6dEqnwi3Gj9
	heWlS2Sl211J7dSlDZ2pGhDDKMnYx+O4mgsNWmJpvpwJXr9XOQNP9XlzOFqVISGqblD7MTu
	JYVdweVz5G/a/REdaWDAl4W9Ls+MHoaQb5YG4mxgnthlbtE7viqECAD1WWMDzS86NpLbxgb
	F02wMl8P3Dl5TOGs4N2uFi5lMGQWjwo72BBD7GK9Nmwaf+qkxjH8OQxMh06g4NOyyF+FQYu
	gwsA8goILgSVgODgRc/XkJiHJLlI8GytTYsAmRcb6CKgn0w6CsYIbFtwviyOY8a9TNc8ZTm
	jPwtRPp2KsnWdfXrTytzJBJaDG5JiP2zgEv6Pn5UbGAJd5dhrlvHIWwv6+lazVixEJLWl3m
	7Qm420SFhKqz9wcCIc/fg2OoPIdKUpjUDhGq95f25+A/r+Iif0Vma1ljwFio/5biwXOk=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1229-lists,ecryptfs=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chenyichong@uniontech.com,ecryptfs@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:code@tyhicks.com,m:kees@kernel.org,m:thorsten.blum@linux.dev,m:akpm@linux-foundation.org,m:mhalcrow@us.ibm.com,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chenyichong@uniontech.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenyichong@uniontech.com,ecryptfs@vger.kernel.org];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[ecryptfs];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD66B6D3081

ecryptfs_exorcise_daemon() drops queued messages from a dying daemon
without holding ecryptfs_msg_ctx_lists_mux, but
ecryptfs_msg_ctx_alloc_to_free() requires that lock.

Take the list lock while moving the queued contexts back to the free
list to avoid racing with other global msg ctx list users.

Fixes: f66e883eb618 ("eCryptfs: integrate eCryptfs device handle into the module.")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/ecryptfs/messaging.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ecryptfs/messaging.c b/fs/ecryptfs/messaging.c
index 03c60f0850ca..ecdfd965b87e 100644
--- a/fs/ecryptfs/messaging.c
+++ b/fs/ecryptfs/messaging.c
@@ -166,6 +166,7 @@ int ecryptfs_exorcise_daemon(struct ecryptfs_daemon *daemon)
 		mutex_unlock(&daemon->mux);
 		goto out;
 	}
+	mutex_lock(&ecryptfs_msg_ctx_lists_mux);
 	list_for_each_entry_safe(msg_ctx, msg_ctx_tmp,
 				 &daemon->msg_ctx_out_queue, daemon_out_list) {
 		list_del(&msg_ctx->daemon_out_list);
@@ -174,6 +175,7 @@ int ecryptfs_exorcise_daemon(struct ecryptfs_daemon *daemon)
 		       "the out queue of a dying daemon\n", __func__);
 		ecryptfs_msg_ctx_alloc_to_free(msg_ctx);
 	}
+	mutex_unlock(&ecryptfs_msg_ctx_lists_mux);
 	hlist_del(&daemon->euid_chain);
 	mutex_unlock(&daemon->mux);
 	kfree_sensitive(daemon);
-- 
2.48.1


