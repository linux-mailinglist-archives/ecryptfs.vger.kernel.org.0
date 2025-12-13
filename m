Return-Path: <ecryptfs+bounces-745-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 600E3CBA868
	for <lists+ecryptfs@lfdr.de>; Sat, 13 Dec 2025 12:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ACC330424B5
	for <lists+ecryptfs@lfdr.de>; Sat, 13 Dec 2025 11:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C126A3019B0;
	Sat, 13 Dec 2025 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mw3eMmGx"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79ED3019B5
	for <ecryptfs@vger.kernel.org>; Sat, 13 Dec 2025 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765624017; cv=none; b=hRjviAgp1LdJ9237Yop5bVOqKNdfy+qJy6GsZCH+h9u15Ji0YMzxRsUndslJ3xYA2Hy632m1DCTc17T8veYnxC4yGyejVmc4XSyKsyGmluQ05yoowNK7XY33m2SE+OJI5dftDtSwU4llsDu2gd5kdtcImpSGoIYsdsGrBqhs5CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765624017; c=relaxed/simple;
	bh=En4ntuB/h/d+cG1MOeOeR9++42bn42+jxkAlSY/g820=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUm0lMOJsY99RKZfO+755BByno2Va/oDjaiSjQgHqYkcV5cPRZ8EZSORePOQrt4tmeI2QInuxQ3ZklWKla8/QaDP42g0PmrVqpVqbc+Ie+01Vbx54kjuk8BeqWsdVzRElg8n7JNXWHrnxWfgxae80UKxCE818+fBlPA2TW95IW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mw3eMmGx; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765624013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P5ByhitJRUuYQHobAwUT4hcZjvfeOOyco/2QNBpzeMg=;
	b=mw3eMmGxTpdGPF6lWO/Hyur3zQxqfIQ+Ms9GGeX8HUV6IanLRVLugLsgQxQdI9u4kEVm3Y
	aMvxEi/wNVS1tgmKNN106/KDv6a6r25bpDmc5eTtyja1FbQ1J37Vmr07EFEB5utdRJIq/X
	d9oDbG61eDsvQUIPRnzi7XsgoCWNcfQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Ankit Chauhan <ankitchauhan2065@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ecryptfs: Replace strcpy with strscpy in ecryptfs_validate_options
Date: Sat, 13 Dec 2025 12:04:54 +0100
Message-ID: <20251213110502.302950-6-thorsten.blum@linux.dev>
In-Reply-To: <20251213110502.302950-2-thorsten.blum@linux.dev>
References: <20251213110502.302950-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows. Replace
it with the safer strscpy().

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 16ea14dd2c62..636aff7a48cf 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -22,6 +22,7 @@
 #include <linux/fs_stack.h>
 #include <linux/sysfs.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/magic.h>
 #include "ecryptfs_kernel.h"
 
@@ -353,13 +354,13 @@ static int ecryptfs_validate_options(struct fs_context *fc)
 		int cipher_name_len = strlen(ECRYPTFS_DEFAULT_CIPHER);
 
 		BUG_ON(cipher_name_len > ECRYPTFS_MAX_CIPHER_NAME_SIZE);
-		strcpy(mount_crypt_stat->global_default_cipher_name,
-		       ECRYPTFS_DEFAULT_CIPHER);
+		strscpy(mount_crypt_stat->global_default_cipher_name,
+			ECRYPTFS_DEFAULT_CIPHER);
 	}
 	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
 	    && !ctx->fn_cipher_name_set)
-		strcpy(mount_crypt_stat->global_default_fn_cipher_name,
-		       mount_crypt_stat->global_default_cipher_name);
+		strscpy(mount_crypt_stat->global_default_fn_cipher_name,
+			mount_crypt_stat->global_default_cipher_name);
 	if (!ctx->cipher_key_bytes_set)
 		mount_crypt_stat->global_default_cipher_key_size = 0;
 	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


