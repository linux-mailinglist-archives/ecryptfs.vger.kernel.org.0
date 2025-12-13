Return-Path: <ecryptfs+bounces-743-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD01CBA859
	for <lists+ecryptfs@lfdr.de>; Sat, 13 Dec 2025 12:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A72113013738
	for <lists+ecryptfs@lfdr.de>; Sat, 13 Dec 2025 11:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5B23002B3;
	Sat, 13 Dec 2025 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aUN6h4SL"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE31221A449
	for <ecryptfs@vger.kernel.org>; Sat, 13 Dec 2025 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765623937; cv=none; b=K0qwHVWMjNCWUo1vZjSXxqIkfrr8KWrRtZeAFaE06svY71BSBjxyuNS1qb7veg57BMpL+6vX/QxAgWJP5GqEp1DCLD9MRbckMWUrOM1oBMBCIL54nNvAdZNFr0Knyg+iSMD9jP5niDamjCmJQO7UqK5Oh0VM8p+ldycZHo/FtrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765623937; c=relaxed/simple;
	bh=VUUdqA+upTDv0a3onX2emVj/tWFz0fZKrLN1jwBVgMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ALSBBJkj2gDfRx+v3KpeOB/Oov5W6yYDgwz2rDhlivCFdWCzjMsba0FeVILLF0qQajCRwKSyT9rUWUgWj8Qu9vlpwnRwra42qlH4kg75vEdz8Ksv/OaNKW0BIscMuTDIsXWpxPTb3DEeuSFXmALzNAj2Ys5YOL+sh192XEuQ9Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aUN6h4SL; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765623932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CzqT5afplxtBn5RX+w8uL8eO3ABobtzcr498eIMhBdE=;
	b=aUN6h4SLOjLRftrJuHwtDq7gi+CxqpS4ZQ3pSY53FCFmEzu5z86rgCjuxYEq9g54b0k82g
	IutTyanx5jqof6Sbj6PedtfIinlkWD/xrVMSTa7xBB6p4a/MUaz5bodm0fPgo3gT1eNF/a
	sa1rv9lXpcOkMWpFDBKhcZqS08hQO6U=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ecryptfs: Replace strcpy with strscpy in ecryptfs_set_default_crypt_stat_vals
Date: Sat, 13 Dec 2025 12:04:50 +0100
Message-ID: <20251213110502.302950-2-thorsten.blum@linux.dev>
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
 fs/ecryptfs/crypto.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 69536cacdea8..2c37ee6a8be1 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -21,6 +21,7 @@
 #include <linux/file.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/unaligned.h>
 #include <linux/kernel.h>
 #include <linux/xattr.h>
@@ -717,7 +718,7 @@ static void ecryptfs_set_default_crypt_stat_vals(
 	ecryptfs_copy_mount_wide_flags_to_inode_flags(crypt_stat,
 						      mount_crypt_stat);
 	ecryptfs_set_default_sizes(crypt_stat);
-	strcpy(crypt_stat->cipher, ECRYPTFS_DEFAULT_CIPHER);
+	strscpy(crypt_stat->cipher, ECRYPTFS_DEFAULT_CIPHER);
 	crypt_stat->key_size = ECRYPTFS_DEFAULT_KEY_BYTES;
 	crypt_stat->flags &= ~(ECRYPTFS_KEY_VALID);
 	crypt_stat->file_version = ECRYPTFS_FILE_VERSION;
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


