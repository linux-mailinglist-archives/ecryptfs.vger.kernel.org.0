Return-Path: <ecryptfs+bounces-782-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKaHFzuahGmh3gMAu9opvQ
	(envelope-from <ecryptfs+bounces-782-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 05 Feb 2026 14:25:15 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D193DF3352
	for <lists+ecryptfs@lfdr.de>; Thu, 05 Feb 2026 14:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC8A830058F8
	for <lists+ecryptfs@lfdr.de>; Thu,  5 Feb 2026 13:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB94D3D6495;
	Thu,  5 Feb 2026 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F2ePWrC/"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BAE3C1969
	for <ecryptfs@vger.kernel.org>; Thu,  5 Feb 2026 13:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297912; cv=none; b=EWKuU24Vz6I8h4nr/LYfRENmydF1DgkT+R/d0y6o931n2H9Fi02VvmzC5Qh2I+R8ZlsCbmbvJxgF37S+jIyX2NlQ1NMge/rBtrLWfcYEvTCM5+gsBhwxQdUky5CnV0B84QUXM6MUMSxReP0ruu+wwj1M4BRF2J8+lQ4mB9KG/AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297912; c=relaxed/simple;
	bh=DqVmoWgtjt0CHFg7yZpgFZbYkSMRd4nJfjJCwFUuI2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQjAt1TeoLewiKvPgYH4nJJ/krs+WJPfdkzvZ91YdIQpG+MfUFmOFy7HZpjHzAcZsboX/QFjvgzJk6Cp14BC9oaj7S8w5UzVkwemzRYGZ1P7FLuVEwEVIxjWgV6FuQSa0pS3gbIsk9QWKcaFzvShZTnZGl2cow9fej4gsPupp74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F2ePWrC/; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770297909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b2MBAWpGjsKDZu9eb6vGXhfLBF99PlZHXbi/O6SAQzw=;
	b=F2ePWrC/I3vqVuuBvFPC9X+CStsZiSi2v9hwBZXiTt2X9daSDKFkQ8A18hcVQiHg3nF7Ud
	k97l+dP1q78Smu9CYf+Z1NE7+OExfsVdU91Wxpt6SLonWRbC5ZCPrQau/zD2AmWf7ygBKE
	DCRYJKn4KeUYedkYuJO3qc9Jvk26r94=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] ecryptfs: Use struct_size to improve process_response + send_miscdev
Date: Thu,  5 Feb 2026 14:24:51 +0100
Message-ID: <20260205132456.1011140-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-782-lists,ecryptfs=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,ecryptfs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[ecryptfs];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D193DF3352
X-Rspamd-Action: no action

Use struct_size(), which provides additional compile-time checks for
structures with flexible array members (e.g., __must_be_array()), to
determine the allocation size for a new 'struct ecryptfs_message'.

In send_miscdev(), reuse 'msg_size' instead of recalculating it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/messaging.c | 3 ++-
 fs/ecryptfs/miscdev.c   | 7 +++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/ecryptfs/messaging.c b/fs/ecryptfs/messaging.c
index 6318f3500e5c..c176d4a33ca2 100644
--- a/fs/ecryptfs/messaging.c
+++ b/fs/ecryptfs/messaging.c
@@ -6,6 +6,7 @@
  *   Author(s): Michael A. Halcrow <mhalcrow@us.ibm.com>
  *		Tyler Hicks <code@tyhicks.com>
  */
+#include <linux/overflow.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/user_namespace.h>
@@ -232,7 +233,7 @@ int ecryptfs_process_response(struct ecryptfs_daemon *daemon,
 		       msg_ctx->counter, seq);
 		goto unlock;
 	}
-	msg_size = (sizeof(*msg) + msg->data_len);
+	msg_size = struct_size(msg, data, msg->data_len);
 	msg_ctx->msg = kmemdup(msg, msg_size, GFP_KERNEL);
 	if (!msg_ctx->msg) {
 		rc = -ENOMEM;
diff --git a/fs/ecryptfs/miscdev.c b/fs/ecryptfs/miscdev.c
index 4e62c3cef70f..5a7d08149922 100644
--- a/fs/ecryptfs/miscdev.c
+++ b/fs/ecryptfs/miscdev.c
@@ -10,6 +10,7 @@
 #include <linux/hash.h>
 #include <linux/random.h>
 #include <linux/miscdevice.h>
+#include <linux/overflow.h>
 #include <linux/poll.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
@@ -148,8 +149,10 @@ int ecryptfs_send_miscdev(char *data, size_t data_size,
 			  u16 msg_flags, struct ecryptfs_daemon *daemon)
 {
 	struct ecryptfs_message *msg;
+	size_t msg_size;
 
-	msg = kmalloc((sizeof(*msg) + data_size), GFP_KERNEL);
+	msg_size = struct_size(msg, data, data_size);
+	msg = kmalloc(msg_size, GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -159,7 +162,7 @@ int ecryptfs_send_miscdev(char *data, size_t data_size,
 	msg_ctx->msg->data_len = data_size;
 	msg_ctx->type = msg_type;
 	memcpy(msg_ctx->msg->data, data, data_size);
-	msg_ctx->msg_size = (sizeof(*msg_ctx->msg) + data_size);
+	msg_ctx->msg_size = msg_size;
 	list_add_tail(&msg_ctx->daemon_out_list, &daemon->msg_ctx_out_queue);
 	mutex_unlock(&msg_ctx->mux);
 
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


