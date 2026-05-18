Return-Path: <ecryptfs+bounces-1222-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKajCZbDCmoI7gQAu9opvQ
	(envelope-from <ecryptfs+bounces-1222-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 18 May 2026 09:45:26 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DEA568087
	for <lists+ecryptfs@lfdr.de>; Mon, 18 May 2026 09:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 546F83000FF6
	for <lists+ecryptfs@lfdr.de>; Mon, 18 May 2026 07:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292593002AB;
	Mon, 18 May 2026 07:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ck39mhSs"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD0B1917CD
	for <ecryptfs@vger.kernel.org>; Mon, 18 May 2026 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089968; cv=none; b=QMpYww3KVdZdq2z8q1jDSU2a5joNpNczH71o2kuY0m0aq6Vh4KKadS7NVlJhV11W4HWA+FreLhZlApeLtI2AJ4yZz1MwR61Fp6hCjNeFh5Ily71T/JriexvyIOsPvZgE9e+Mi0KkMgxaEBNAUo3ArYdzTR3hbQqgQOQCosMnPCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089968; c=relaxed/simple;
	bh=PsvpaOiLWPDgUnJ2TSsBJL323TZYhkkewYe75m3ukKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ijZM3JvuQ82m7EWv0/PboFVJYx6hZbcz/pnzZ1RY/CeDRUk6kdisyQK/uip1fZIz5mpBb8Z2L6w2GHfBJBxI2op/nv/wZ4RO6U0jWLk7+vIPpH4HVLD5Dt9N/Ns0A0ud5JWhcGPvRUl4lAzQlGUqfmQBXjxO6NjwfdBKKD5YDGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ck39mhSs; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779089963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EvOhjXrTEhaGFgkEgCnzjTZP4SlNBCOU1PI5l4LuI7g=;
	b=ck39mhSsM29mbAw83FQnkQeAYi4caLkb6o45OhC9n5zqZGfLX9Bh60QtQM4b3zFRXJxahj
	zp7la6iy2IusI0q9wWcVYMy4mR3RDbgVlJOGG96cvIFu3v2JlttZ4shPHUW2KGnXgRifys
	MuFH2BtPmSY+04Z4/9e/tDshW+3EhOM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>
Subject: [PATCH] ecryptfs: use kasprintf in ecryptfs_crypto_api_algify_cipher_name
Date: Mon, 18 May 2026 09:38:45 +0200
Message-ID: <20260518073842.57501-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=thorsten.blum@linux.dev; h=from:subject; bh=PsvpaOiLWPDgUnJ2TSsBJL323TZYhkkewYe75m3ukKw=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlch5hWXJLYqWous+rus7TN0/ct92/Q+LWH/9OVVf9f9 ev+2z2ztKOUhUGMi0FWTJHlwawfM3xLayo3mUTshJnDygQyhIGLUwAmEsHJyLDm33afnz++Rd/a Lxb0ZaPh6xvvF7/8dOycyNpKy6JJ+4QnMPyVPb3M7dy1mBT+B+pXozbW3Gw//XXxz7CF1/bs+zf h/fnZvAA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 67DEA568087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1222-lists,ecryptfs=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Action: no action

Use kasprintf() to simplify ecryptfs_crypto_api_algify_cipher_name().

Use const char * for the read-only cipher name and chaining modifier
while at it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/crypto.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 5ef67b2674ee..74b02b55e3f6 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -49,25 +49,15 @@ void ecryptfs_from_hex(char *dst, char *src, int dst_size)
 }
 
 static int ecryptfs_crypto_api_algify_cipher_name(char **algified_name,
-						  char *cipher_name,
-						  char *chaining_modifier)
+						  const char *cipher_name,
+						  const char *chaining_modifier)
 {
-	int cipher_name_len = strlen(cipher_name);
-	int chaining_modifier_len = strlen(chaining_modifier);
-	int algified_name_len;
-	int rc;
+	(*algified_name) = kasprintf(GFP_KERNEL, "%s(%s)", chaining_modifier,
+				     cipher_name);
+	if (!(*algified_name))
+		return -ENOMEM;
 
-	algified_name_len = (chaining_modifier_len + cipher_name_len + 3);
-	(*algified_name) = kmalloc(algified_name_len, GFP_KERNEL);
-	if (!(*algified_name)) {
-		rc = -ENOMEM;
-		goto out;
-	}
-	snprintf((*algified_name), algified_name_len, "%s(%s)",
-		 chaining_modifier, cipher_name);
-	rc = 0;
-out:
-	return rc;
+	return 0;
 }
 
 /**

