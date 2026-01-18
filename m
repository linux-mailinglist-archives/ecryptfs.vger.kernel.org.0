Return-Path: <ecryptfs+bounces-777-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1441D39889
	for <lists+ecryptfs@lfdr.de>; Sun, 18 Jan 2026 18:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E85BB300D14E
	for <lists+ecryptfs@lfdr.de>; Sun, 18 Jan 2026 17:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB9C2E8897;
	Sun, 18 Jan 2026 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PL3O5eVL"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF41A2EA480
	for <ecryptfs@vger.kernel.org>; Sun, 18 Jan 2026 17:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768757469; cv=none; b=hYrrxfb5gNEXj/8wxA4tpIMeqxZ6y4hr7PgGI/+1VdLilnFhPTOSkTTueQ9P7bXEHms/pmI4yBPVRCw+0mz0HZniWC/NOWRIlECN5pr4JUWfnUpWk9HXvrJW1R1krVizohh8aKlrsmcBERMDwiy4XOT3bJkaicSHE7PJGgcdw+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768757469; c=relaxed/simple;
	bh=6upfWbetZHz5HGSfXXcr9QHTVnjmO7VFbdjmon2KzYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nPnvXz23qJXFigrXoTc9wxiHu+MTXtBGda+R62m3N0+eY2JrSrfkIaq+9lwBV/5XPzuki4fk/ssO2UEFa41pfqzHlaFN/b1PM5eaqO+UtX2wfCeMlz8XL4wxmJBGAe/fyaOvRINSmojkUmyi2y54Tv2Dck06cUx0DkajNxGGZlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PL3O5eVL; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768757460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UmV6YKo20duzncK88GsUbRYcSlJ16WsHBt5OyoKzpug=;
	b=PL3O5eVLZQGsL7BimLk15RZoVPWvV/RI6le4APkk1azBCYO7HiiHJ3rlI+TVaMqxDggvyq
	FXqbKu6JaJMq9DyA/xmZmHYZCmHHj8p/LJLenuBH1VVmSTeN/+Juc3FBtB3JFozw4wkg/r
	MfOVpdoXOl+u6zvjcxpN2F6glRYMuos=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Eric Biggers <ebiggers@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Baolin Liu <liubaolin@kylinos.cn>,
	Slark Xiao <slark_xiao@163.com>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: Replace memcpy + manual NUL termination with strscpy
Date: Sun, 18 Jan 2026 18:30:49 +0100
Message-ID: <20260118173055.1197250-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

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


