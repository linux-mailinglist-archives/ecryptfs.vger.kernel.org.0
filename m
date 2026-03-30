Return-Path: <ecryptfs+bounces-1173-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHENBdFSymn27gUAu9opvQ
	(envelope-from <ecryptfs+bounces-1173-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Mar 2026 12:39:13 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C116359819
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Mar 2026 12:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52FFA3045C29
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Mar 2026 10:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE543AA51E;
	Mon, 30 Mar 2026 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qUKm9N0O"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40B33BADBA
	for <ecryptfs@vger.kernel.org>; Mon, 30 Mar 2026 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866943; cv=none; b=fhTicb3R66vhUo0AoXqRB/RL9sXsZZiBjv6kq9Gd6r3q6oJYErVriI0mHGRM5etIdXS/e+UZSM6tHJVXGFMzXmkQq8HjeJjkJHvzXJpupmsAcDpMSgCb31bMBhgm8MFWEvmwtAA7aIhVH0i0l/hfbKSlKAU4Zc3P/Y0UJnTmAWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866943; c=relaxed/simple;
	bh=kvLi/kSD0fId3zDk3U8cYaDP8yKJbUfhGWMEhpWw1ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SdpEXZ1Bw2nqTPI6Df8eTm0pyna8a+QzYW/5mIxNXUOiZ8+ahntWAvMEwv1/L99Lb/NUP0qApp7j+N5r9Yc4SFCeTYPF3jGaBTUFjjZFXVtiI2MLph+9l3C5GC+3y/dyaUJDL62Bn+5WSN0lG4Mia6B4Z7g7+k002X5zcSwWOYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qUKm9N0O; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774866939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uiq7lYrJ56/ZU4crmRRn5AG/pG6F28e+zWcU32cvjx4=;
	b=qUKm9N0ONr2wg+++ELLSvvtnMqWNvNSUZZZB5X9378kQS1qpteFpFYhGxB3Z6/G6aa/d++
	0rLJBmVBc7wwnYyFhdQawT9k0EqdJQcBY72yERKuI8DtpV7vuWXpl9aF9SbCC5eempCnND
	HhsMTotUCMAqJyOEm/9uZFbP6cLSrwY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Kees Cook <kees@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ecryptfs: Fix typo in ecryptfs_derive_iv function comment
Date: Mon, 30 Mar 2026 12:35:15 +0200
Message-ID: <20260330103515.389346-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=665; i=thorsten.blum@linux.dev; h=from:subject; bh=kvLi/kSD0fId3zDk3U8cYaDP8yKJbUfhGWMEhpWw1ZA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmnAh+77LNIPTD366+6S6dnsZ5oaGe5ILIhQkZ/al9T5 /aJdVJuHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjARtV6G/y5vp7rk/8675fjT +8HdFSu0Ukof7NxZKnLj4AQ5U6bzaT8Z/im0HtWK/dGWUnLsWkECb7ar8v5Luxc57/E7MfWbR4z rM24A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1173-lists,ecryptfs=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[tyhicks.com,linux.dev,kernel.org,foxmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C116359819
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

s/vale/value/

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 3b59346d68c5..585bad6577ed 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -72,7 +72,7 @@ static int ecryptfs_crypto_api_algify_cipher_name(char **algified_name,
 
 /**
  * ecryptfs_derive_iv
- * @iv: destination for the derived iv vale
+ * @iv: destination for the derived iv value
  * @crypt_stat: Pointer to crypt_stat struct for the current inode
  * @offset: Offset of the extent whose IV we are to derive
  *

