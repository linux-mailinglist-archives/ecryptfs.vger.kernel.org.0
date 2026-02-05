Return-Path: <ecryptfs+bounces-781-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJD7J1iShGk43gMAu9opvQ
	(envelope-from <ecryptfs+bounces-781-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 05 Feb 2026 13:51:36 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C308F2D11
	for <lists+ecryptfs@lfdr.de>; Thu, 05 Feb 2026 13:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F74E30010E9
	for <lists+ecryptfs@lfdr.de>; Thu,  5 Feb 2026 12:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2EE4CA6B;
	Thu,  5 Feb 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IYsvs6B/"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E84E3D4125
	for <ecryptfs@vger.kernel.org>; Thu,  5 Feb 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770295894; cv=none; b=DpVf7Tz77d6LF1l8jp/bOsiJSJLUzd/vT1AmTDUGS7EZ3r3CYb7l1Yl64ISCZnbAe4nouLc1Wrjhb+gd5GQNDA1hfr8cp64/wrgFx586fpaZezTsHEQp99JXhFFtuprCTPp46NtkM+7L5JUyi54LcYe4xauz3/BX0Fv0nws+Vf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770295894; c=relaxed/simple;
	bh=6upfWbetZHz5HGSfXXcr9QHTVnjmO7VFbdjmon2KzYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DvvcY85n6c3MMQI3xfmI/75QaO/shl/0K1analF5ZWdZtZlO9PoYah+TeyeHfJCyU5hnvW98tBKFMYHWRbdXZJhpDIfHGWkTBoeLptVGod2i1lqqMy1i0qN4RGHgDZWzMPjT2SiKqWn8gC4euh/+VjEJdP58tP4TfpuCL88/A3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IYsvs6B/; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770295882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UmV6YKo20duzncK88GsUbRYcSlJ16WsHBt5OyoKzpug=;
	b=IYsvs6B/MsM3onOhS5KXo3xy5AW0zzDrOo+HQnJasXm2Tg7h7b5TNq2xJvbCLXDh+iFcGH
	723zBypW7p1WApuEug6htUhXxNSzNQ5Gy8mq9i0K0buW3GDXnC7JPv21goq0QxUK1hKR2t
	Wbaqu0fcOv4m4Y/IawhbQMRN/hXCY44=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] ecryptfs: Replace memcpy + manual NUL termination with strscpy
Date: Thu,  5 Feb 2026 13:51:00 +0100
Message-ID: <20260205125104.1010945-1-thorsten.blum@linux.dev>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-781-lists,ecryptfs=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Queue-Id: 3C308F2D11
X-Rspamd-Action: no action

Use strscpy() to copy the NUL-terminated '->token.password.signature'
and 'sig' to the destination buffers instead of using memcpy() followed
by manual NUL terminations.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/debug.c    | 5 ++---
 fs/ecryptfs/keystore.c | 6 ++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/ecryptfs/debug.c b/fs/ecryptfs/debug.c
index cf6d0e8e25a1..006ab871cda9 100644
--- a/fs/ecryptfs/debug.c
+++ b/fs/ecryptfs/debug.c
@@ -7,6 +7,7 @@
  *   Author(s): Michael A. Halcrow <mahalcro@us.ibm.com>
  */
 
+#include <linux/string.h>
 #include "ecryptfs_kernel.h"
 
 /*
@@ -34,9 +35,7 @@ void ecryptfs_dump_auth_tok(struct ecryptfs_auth_tok *auth_tok)
 		    ECRYPTFS_PERSISTENT_PASSWORD) {
 			ecryptfs_printk(KERN_DEBUG, " * persistent\n");
 		}
-		memcpy(sig, auth_tok->token.password.signature,
-		       ECRYPTFS_SIG_SIZE_HEX);
-		sig[ECRYPTFS_SIG_SIZE_HEX] = '\0';
+		strscpy(sig, auth_tok->token.password.signature);
 		ecryptfs_printk(KERN_DEBUG, " * signature = [%s]\n", sig);
 	}
 	ecryptfs_printk(KERN_DEBUG, " * session_key.flags = [0x%x]\n",
diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index bbf8603242fa..a615489e5a17 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -2457,8 +2457,7 @@ int ecryptfs_add_keysig(struct ecryptfs_crypt_stat *crypt_stat, char *sig)
 	if (!new_key_sig)
 		return -ENOMEM;
 
-	memcpy(new_key_sig->keysig, sig, ECRYPTFS_SIG_SIZE_HEX);
-	new_key_sig->keysig[ECRYPTFS_SIG_SIZE_HEX] = '\0';
+	strscpy(new_key_sig->keysig, sig);
 	/* Caller must hold keysig_list_mutex */
 	list_add(&new_key_sig->crypt_stat_list, &crypt_stat->keysig_list);
 
@@ -2478,9 +2477,8 @@ ecryptfs_add_global_auth_tok(struct ecryptfs_mount_crypt_stat *mount_crypt_stat,
 	if (!new_auth_tok)
 		return -ENOMEM;
 
-	memcpy(new_auth_tok->sig, sig, ECRYPTFS_SIG_SIZE_HEX);
+	strscpy(new_auth_tok->sig, sig);
 	new_auth_tok->flags = global_auth_tok_flags;
-	new_auth_tok->sig[ECRYPTFS_SIG_SIZE_HEX] = '\0';
 	mutex_lock(&mount_crypt_stat->global_auth_tok_list_mutex);
 	list_add(&new_auth_tok->mount_crypt_stat_list,
 		 &mount_crypt_stat->global_auth_tok_list);
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


