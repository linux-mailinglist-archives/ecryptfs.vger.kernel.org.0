Return-Path: <ecryptfs+bounces-744-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F7ECBA862
	for <lists+ecryptfs@lfdr.de>; Sat, 13 Dec 2025 12:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17EA43005D0A
	for <lists+ecryptfs@lfdr.de>; Sat, 13 Dec 2025 11:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21731301716;
	Sat, 13 Dec 2025 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qqtmO1jU"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311E31DF24F
	for <ecryptfs@vger.kernel.org>; Sat, 13 Dec 2025 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765623996; cv=none; b=uxXzf8jEGIzEAxMc/t441vtmlnIN7YnLGDuKcS0r7HRXv/kMDH5ANyktnTYnH+Q8v/I4rQ6byRnnwnDTeYZz3fEvRBe/vPN5VwDsImlpBBzq/4ZDhkeFKZdpmeZX1Cga1LvBDrdvWemYHqHyEo8u5PVRsOx2ro91Uz1E6RI7AtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765623996; c=relaxed/simple;
	bh=WGHyGggWTxpgRRhPlUEKnids4lsUqOH8uDlt3tJWNNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gi8Q/TVdKIgnpBG1wRP/lwQ91nj6SjTO22fYcoCRBRwA7iGSmLb23SCm42+pQgnRZxZ/h+Nr6WoZpDjrkRBvYB5V3hL7Vr6NmbcC7mjnTZonXYAIrkNcwIjWsr8RP+r+N5fmV0KGTRbxeNHcx9nfQiVtcV1ZLv/hhGLoDFjaJ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qqtmO1jU; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765623992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UisN06VnS4ntBg70TRxcImYdjLWBN7/2LTlka+rGNV4=;
	b=qqtmO1jUYbs6yMQREP1aa5rGRCWr2AAXwdKHcjVIFLkO19lbUSBsPIEDlSEpgPbxBtNf4Z
	yWOOuxsdVnUPZSrfYhw7zbchwob6PUrdtGNeMk650B8K4Zi4M0ZDoQrIBt5geeT26pNYQn
	jvVqQYH4SVJkIovcAACAx1ak3vKf0OY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ecryptfs: Replace strcpy with strscpy in ecryptfs_cipher_code_to_string
Date: Sat, 13 Dec 2025 12:04:52 +0100
Message-ID: <20251213110502.302950-4-thorsten.blum@linux.dev>
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
on the destination buffer, which can lead to buffer overflows. Since
the parameter 'char *str' is just a pointer with no size information,
extend the function with a 'size' parameter to pass the destination
buffer's size as an additional argument. Adjust the call sites
accordingly.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/crypto.c          | 6 ++++--
 fs/ecryptfs/ecryptfs_kernel.h | 2 +-
 fs/ecryptfs/keystore.c        | 9 +++++++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 2c37ee6a8be1..c99fc60a4e3b 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -934,11 +934,12 @@ u8 ecryptfs_code_for_cipher_string(char *cipher_name, size_t key_bytes)
 /**
  * ecryptfs_cipher_code_to_string
  * @str: Destination to write out the cipher name
+ * @size: Destination buffer size
  * @cipher_code: The code to convert to cipher name string
  *
  * Returns zero on success
  */
-int ecryptfs_cipher_code_to_string(char *str, u8 cipher_code)
+int ecryptfs_cipher_code_to_string(char *str, size_t size, u8 cipher_code)
 {
 	int rc = 0;
 	int i;
@@ -946,7 +947,8 @@ int ecryptfs_cipher_code_to_string(char *str, u8 cipher_code)
 	str[0] = '\0';
 	for (i = 0; i < ARRAY_SIZE(ecryptfs_cipher_code_str_map); i++)
 		if (cipher_code == ecryptfs_cipher_code_str_map[i].cipher_code)
-			strcpy(str, ecryptfs_cipher_code_str_map[i].cipher_str);
+			strscpy(str, ecryptfs_cipher_code_str_map[i].cipher_str,
+				size);
 	if (str[0] == '\0') {
 		ecryptfs_printk(KERN_WARNING, "Cipher code not recognized: "
 				"[%d]\n", cipher_code);
diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 9e6ab0b41337..0d824350f31a 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -577,7 +577,7 @@ int ecryptfs_read_and_validate_header_region(struct inode *inode);
 int ecryptfs_read_and_validate_xattr_region(struct dentry *dentry,
 					    struct inode *inode);
 u8 ecryptfs_code_for_cipher_string(char *cipher_name, size_t key_bytes);
-int ecryptfs_cipher_code_to_string(char *str, u8 cipher_code);
+int ecryptfs_cipher_code_to_string(char *str, size_t size, u8 cipher_code);
 void ecryptfs_set_default_sizes(struct ecryptfs_crypt_stat *crypt_stat);
 int ecryptfs_generate_key_packet_set(char *dest_base,
 				     struct ecryptfs_crypt_stat *crypt_stat,
diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 7f9f68c00ef6..b5204ab3150d 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -954,7 +954,9 @@ ecryptfs_parse_tag_70_packet(char **filename, size_t *filename_size,
 	s->fnek_sig_hex[ECRYPTFS_SIG_SIZE_HEX] = '\0';
 	(*packet_size) += ECRYPTFS_SIG_SIZE;
 	s->cipher_code = data[(*packet_size)++];
-	rc = ecryptfs_cipher_code_to_string(s->cipher_string, s->cipher_code);
+	rc = ecryptfs_cipher_code_to_string(s->cipher_string,
+					    sizeof(s->cipher_string),
+					    s->cipher_code);
 	if (rc) {
 		printk(KERN_WARNING "%s: Cipher code [%d] is invalid\n",
 		       __func__, s->cipher_code);
@@ -1172,7 +1174,9 @@ decrypt_pki_encrypted_session_key(struct ecryptfs_auth_tok *auth_tok,
 	memcpy(crypt_stat->key, auth_tok->session_key.decrypted_key,
 	       auth_tok->session_key.decrypted_key_size);
 	crypt_stat->key_size = auth_tok->session_key.decrypted_key_size;
-	rc = ecryptfs_cipher_code_to_string(crypt_stat->cipher, cipher_code);
+	rc = ecryptfs_cipher_code_to_string(crypt_stat->cipher,
+					    sizeof(crypt_stat->cipher),
+					    cipher_code);
 	if (rc) {
 		ecryptfs_printk(KERN_ERR, "Cipher code [%d] is invalid\n",
 				cipher_code);
@@ -1438,6 +1442,7 @@ parse_tag_3_packet(struct ecryptfs_crypt_stat *crypt_stat,
 		goto out_free;
 	}
 	rc = ecryptfs_cipher_code_to_string(crypt_stat->cipher,
+					    sizeof(crypt_stat->cipher),
 					    (u16)data[(*packet_size)]);
 	if (rc)
 		goto out_free;
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


