Return-Path: <ecryptfs+bounces-747-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE26CD1F8E
	for <lists+ecryptfs@lfdr.de>; Fri, 19 Dec 2025 22:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01D9B302E5D4
	for <lists+ecryptfs@lfdr.de>; Fri, 19 Dec 2025 21:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E2925CC7A;
	Fri, 19 Dec 2025 21:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lTgFm/yf"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C2622173A;
	Fri, 19 Dec 2025 21:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766179971; cv=none; b=WKkvdi2EYjLItg/m+4N54WskKV8X6iG6ZcexrCcBjfl4vC840pphaKGZdyGF0As3dO7khllIHOMlPQ89dHFrvL5JVX0v66kj8ekUFgh0BemkpOWpyymtSOHlJEtlsso1vddosjreEYW3gPTgTu/mYtMZv2LYXFBunYDeg6vBEh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766179971; c=relaxed/simple;
	bh=9v+Ia+mHVG8vRADNH/CgL6+gcf0gFJVTLoBbaJyRKb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cwXEZXAs4KzE9sK0vQEJX2WmxQUvLDQ03S7zkFD8fUiVbjlnmDe+2v7Rr9QldiMIFbA/IzmqQ3O766gCaG/XJfAyWn/7iajP9jZTBTxzl19f5H6kiQRTjUZI+BnXC2FQ5EgAdZzQeyTcrXV1SftkhOeI+WdXVRjmoBnWEJwrcIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lTgFm/yf; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766179962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G/wcwG9hAx9NsOjz05/9ai2gs2Iy8ARwZaDRCO1pwP4=;
	b=lTgFm/yf44ylXZr48US/0ylQ2o9yui2SpNwxTN20Dj3nwT9NUnzHuyruS9Rx4Etuo0ODSS
	exnwIw0yJcw76311lUZfK6dkCxteso031JI3sLGOEmSYPoR8BxZ4c7WirHafujxImdwu7L
	U5qeyBE7jDJPKhs5OBwm03PERKQJu/8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Christian Brauner <brauner@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] ecryptfs: Replace memcpy + NUL termination in ecryptfs_new_file_context
Date: Fri, 19 Dec 2025 22:32:33 +0100
Message-ID: <20251219213235.71774-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use strscpy() to copy the NUL-terminated '->global_default_cipher_name'
to the destination buffer instead of using memcpy() followed by a manual
NUL termination. Remove the now-unused local variable 'cipher_name_len'.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/crypto.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 260f8a4938b0..5d9ec4a1e12d 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -678,7 +678,6 @@ int ecryptfs_new_file_context(struct inode *ecryptfs_inode)
 	struct ecryptfs_mount_crypt_stat *mount_crypt_stat =
 	    &ecryptfs_superblock_to_private(
 		    ecryptfs_inode->i_sb)->mount_crypt_stat;
-	int cipher_name_len;
 	int rc = 0;
 
 	ecryptfs_set_default_crypt_stat_vals(crypt_stat, mount_crypt_stat);
@@ -692,12 +691,8 @@ int ecryptfs_new_file_context(struct inode *ecryptfs_inode)
 		       "to the inode key sigs; rc = [%d]\n", rc);
 		goto out;
 	}
-	cipher_name_len =
-		strlen(mount_crypt_stat->global_default_cipher_name);
-	memcpy(crypt_stat->cipher,
-	       mount_crypt_stat->global_default_cipher_name,
-	       cipher_name_len);
-	crypt_stat->cipher[cipher_name_len] = '\0';
+	strscpy(crypt_stat->cipher,
+		mount_crypt_stat->global_default_cipher_name);
 	crypt_stat->key_size =
 		mount_crypt_stat->global_default_cipher_key_size;
 	ecryptfs_generate_new_key(crypt_stat);
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


