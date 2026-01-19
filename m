Return-Path: <ecryptfs+bounces-778-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDC9D3A82D
	for <lists+ecryptfs@lfdr.de>; Mon, 19 Jan 2026 13:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9600D300C9A4
	for <lists+ecryptfs@lfdr.de>; Mon, 19 Jan 2026 12:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C591359FAD;
	Mon, 19 Jan 2026 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MNP7CqPg"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06D722CBF1
	for <ecryptfs@vger.kernel.org>; Mon, 19 Jan 2026 12:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824422; cv=none; b=qt1baIAyrEFVshfaOZkubeCpHhue3dUl7hn5pxvHzxatRx47YgD9Eril6enRID2bGuEaKnbEduuiV6pKRi1Fv/yK0GDFhk2xHGnPzHUk/SQEloniGtIq7L1s0VW4Dr5WOkeAepsw7H3tfWnLMISakDtijNnYDnO2jOLYinqwnlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824422; c=relaxed/simple;
	bh=DqVmoWgtjt0CHFg7yZpgFZbYkSMRd4nJfjJCwFUuI2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=emMSdr5KwTd76zeWX1WmUTpGkNz6MT44jp0Zf1wzm0pRl3YsDU181HWqekvcAV3DtTCn+SipCTy34oHph62N1Xgpu+JBqInJE3UnM5Uk5Xjawvb9i/N50hgwi6DmnqQTfDXtAHsv8zlm3WSRSDN38OD4PHjRAMny55Sak4i7Dpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MNP7CqPg; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768824418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b2MBAWpGjsKDZu9eb6vGXhfLBF99PlZHXbi/O6SAQzw=;
	b=MNP7CqPgkwHTgcvdXUW641vM9d6rCYIu1TE2LSrBnc0nSwC4knedqA44Lu3PQPrhMAwyWp
	JyrFKtkgsJc3Ua74hPazj02Nr8Zna51nDkn8pj/Ky7ZsctuFX4GPkRQkCVoHf9nBdUs6oO
	yYT4kOjc1G+UzbjKoGmlbh2JQ5YC3mk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: Use struct_size to improve process_response + send_miscdev
Date: Mon, 19 Jan 2026 13:05:51 +0100
Message-ID: <20260119120554.1243404-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

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


