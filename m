Return-Path: <ecryptfs+bounces-726-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB819C7AD06
	for <lists+ecryptfs@lfdr.de>; Fri, 21 Nov 2025 17:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5C03135B0F1
	for <lists+ecryptfs@lfdr.de>; Fri, 21 Nov 2025 16:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890921EDA0B;
	Fri, 21 Nov 2025 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LdFDw/ag"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFF9277CB8
	for <ecryptfs@vger.kernel.org>; Fri, 21 Nov 2025 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763742010; cv=none; b=MPdhjNvv/7nmCLVW3EAlHKCU4qr/MgqB7X8xpnm/VI4wzhPhoyLF+4yAEcOjNyZd2jSbto36XL9daas/wV6J4lGlDhAqeWGICsK0AXficMvXDfACj3jJsTb9iPqqSTQOGpMkHgnfjx0FErsJEe9F1PN4ukCdFQ3YkVCHFCVsuv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763742010; c=relaxed/simple;
	bh=J/5S/u6Q+OIzq+Q+wU7ePKaK014Vl8L/R9/eMFGqH14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQLBO3yN9MwK8DgxQfPMiRH3oCzq2nax53BFMYuN3MaMXkX95dYBpGAv8wrcLqGE2ydsC+v3J5et+H8hSjdCVZzQwAhgoHBIDZO4v9kX1ztpSBevCy/BLbLVHLI+uYry83jzAJDCACPMee9WE/z+cqTttGIKVEG/2Pev6HcR7dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LdFDw/ag; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763742000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eEjfhRUSaGwQCWk0YFKSL1lurIZX+cS+kJYHPQWEiUY=;
	b=LdFDw/agTalgjoX/1E1NgR5U+v0VGYA/Ibo+ZFAPEEzgfv1d4SJlhNO/kvnAFwFIXcb420
	7jP7rezWut5trAbgmjy+DWoS3bsDKOA/xojTu3EX1/9hwUzTLxxgmPpwBW1SEG3RjwzZUI
	w3J30IODfj72pFW+uoH1fA1FQEppbMo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: Replace memcpy + NUL termination in ecryptfs_new_file_context
Date: Fri, 21 Nov 2025 17:19:21 +0100
Message-ID: <20251121161923.44719-2-thorsten.blum@linux.dev>
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
index c99fc60a4e3b..2af9ed4c7ed7 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -751,7 +751,6 @@ int ecryptfs_new_file_context(struct inode *ecryptfs_inode)
 	struct ecryptfs_mount_crypt_stat *mount_crypt_stat =
 	    &ecryptfs_superblock_to_private(
 		    ecryptfs_inode->i_sb)->mount_crypt_stat;
-	int cipher_name_len;
 	int rc = 0;
 
 	ecryptfs_set_default_crypt_stat_vals(crypt_stat, mount_crypt_stat);
@@ -765,12 +764,8 @@ int ecryptfs_new_file_context(struct inode *ecryptfs_inode)
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
2.51.1


