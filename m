Return-Path: <ecryptfs+bounces-725-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2FCC7678C
	for <lists+ecryptfs@lfdr.de>; Thu, 20 Nov 2025 23:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 5BC3A2CADC
	for <lists+ecryptfs@lfdr.de>; Thu, 20 Nov 2025 22:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F65271A7C;
	Thu, 20 Nov 2025 22:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LSP8Cexb"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333C4245012
	for <ecryptfs@vger.kernel.org>; Thu, 20 Nov 2025 22:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763677150; cv=none; b=KE/XwV6UhXsAsMjyngx1wgZlOx1gfDbmsprwewUABZ5dmmwhJzQptvCbxtWP/j5uM9x5IkcwMp4UwKkHpIISTUyPZDd2Dx6SSSJoPDDIUrufnOIHOmT6MG9BFG7wGDhuSPXMBTUitPA1i2jkgp0pGeO4hk9hwFKnF1KbVozCULM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763677150; c=relaxed/simple;
	bh=cJSeUxGY8XC3dk5mUKO7+qX0PGXCEVnimCT1P2KcqbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XmVGIWIPo5aOT46/awhkZBbsz4fiwHI7flHU7IqMI+YOtJAIlrwbVFLYSPO5rPgSN4bY37q1UQTFPv6Mc67ok+DJ/rstvkNW4k3Fc0pmBZAkyJxA9S76qTkFBRxAOofN9ISFwc9WJjbVpjxcVR7qeZ2ZKh4+8G515cFI4Ijt4Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LSP8Cexb; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763677136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z7bwPIb7BcXZlPEbuaeQfZQccLAREIARhtmmB75Hwo0=;
	b=LSP8CexbeXjDt0IBfOxyUOqTygzefVMveijKXL6j51cD6H1CQZLEhANoFm2pTZcYdQaVLK
	6uQ42g/TBDP8UPEcHxxZdvC1m3DVBqyXzlYzRRTAP/y7z9sMtdvrbEyH8VGgyyZVLRtDfz
	aHdQ/ucOPmOGZY6Qp/93McUu1HyvfYU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ecryptfs: Drop redundant NUL terminations after calling ecryptfs_to_hex
Date: Thu, 20 Nov 2025 23:17:57 +0100
Message-ID: <20251120221800.9985-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

ecryptfs_to_hex() already NUL-terminates the destination buffers. Drop
the manual NUL terminations.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Remove all redundant NUL terminations after calling ecryptfs_to_hex
- Link to v1: https://lore.kernel.org/lkml/20251120214535.5952-2-thorsten.blum@linux.dev/
---
 fs/ecryptfs/debug.c    | 1 -
 fs/ecryptfs/keystore.c | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/fs/ecryptfs/debug.c b/fs/ecryptfs/debug.c
index cf6d0e8e25a1..c185a8cb5fe2 100644
--- a/fs/ecryptfs/debug.c
+++ b/fs/ecryptfs/debug.c
@@ -28,7 +28,6 @@ void ecryptfs_dump_auth_tok(struct ecryptfs_auth_tok *auth_tok)
 		ecryptfs_printk(KERN_DEBUG, " * passphrase type\n");
 		ecryptfs_to_hex(salt, auth_tok->token.password.salt,
 				ECRYPTFS_SALT_SIZE);
-		salt[ECRYPTFS_SALT_SIZE * 2] = '\0';
 		ecryptfs_printk(KERN_DEBUG, " * salt = [%s]\n", salt);
 		if (auth_tok->token.password.flags &
 		    ECRYPTFS_PERSISTENT_PASSWORD) {
diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 3a6283477d61..9f53069bbc7c 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -908,7 +908,6 @@ ecryptfs_parse_tag_70_packet(char **filename, size_t *filename_size,
 	(*packet_size) += s->packet_size_len;
 	ecryptfs_to_hex(s->fnek_sig_hex, &data[(*packet_size)],
 			ECRYPTFS_SIG_SIZE);
-	s->fnek_sig_hex[ECRYPTFS_SIG_SIZE_HEX] = '\0';
 	(*packet_size) += ECRYPTFS_SIG_SIZE;
 	s->cipher_code = data[(*packet_size)++];
 	rc = ecryptfs_cipher_code_to_string(s->cipher_string, s->cipher_code);
@@ -1777,8 +1776,6 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
 			}
 			ecryptfs_to_hex(new_auth_tok->token.password.signature,
 					sig_tmp_space, tag_11_contents_size);
-			new_auth_tok->token.password.signature[
-				ECRYPTFS_PASSWORD_SIG_SIZE] = '\0';
 			crypt_stat->flags |= ECRYPTFS_ENCRYPTED;
 			break;
 		case ECRYPTFS_TAG_1_PACKET_TYPE:
-- 
2.51.1


