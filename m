Return-Path: <ecryptfs+bounces-784-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPNULfoXh2nBTQQAu9opvQ
	(envelope-from <ecryptfs+bounces-784-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Sat, 07 Feb 2026 11:46:18 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B451059BF
	for <lists+ecryptfs@lfdr.de>; Sat, 07 Feb 2026 11:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05AA6300CC9B
	for <lists+ecryptfs@lfdr.de>; Sat,  7 Feb 2026 10:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B627D29CB57;
	Sat,  7 Feb 2026 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BChzxnzA"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1F61F4181
	for <ecryptfs@vger.kernel.org>; Sat,  7 Feb 2026 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770461174; cv=none; b=Y7zNeH79ViqZxjOUMBhExkRp469GXuAH29fRrj4ecWd64EK3901eQUu5cpqIa1Lw63gmBkjE1NRsJ53CweIm5EjYvAzudM7Q7/Plzx/ImgPqmwMyh9cgL8p2D/Pn2QWDxWuzoXtRa5mnT+xD4tjwhABzFFgXCERbsKi9/j1YQeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770461174; c=relaxed/simple;
	bh=JP7IYvdxWx9hevIKjxUgOAcVW4RvRUQtOl0pcsQ81J8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o8UijLehSFcjgiOD1WwACLCw+PSqdN78/nThfapam4n7cbZuDgqkRFaKJoLMw3I4JNPGVwHceQFH66N94GLCEGYbNyda1n9Mmu44heSLYP49Yy1NFd0aPko21GVZSP+9AE0fXK9ntGmlxb2+CY6kZXN4kzH0glTAUJ5vzUnS680=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BChzxnzA; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770461171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fTVsflxRgoMm3s1iI4mXwHAZIsBlAqkIBXsh83WCq90=;
	b=BChzxnzA8o0KRUWkzF9xKty+fPcJ3VEjEShdrNsNXkaQ6v+c65TrFvDxeZ6xMKGz0fx+k1
	LkXO2jgK0GGNfOD+PlATtxvMOMhklKtTesGZpOg1KZkMVJJj6Ugb0io3wV2qqobz2RvT+n
	IKJQR8smjIUw3HE9HXYgCdQc6RflVt8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ard Biesheuvel <ardb@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: Remove redundant if checks in encrypt_and_encode_filename
Date: Sat,  7 Feb 2026 11:45:37 +0100
Message-ID: <20260207104540.68558-1-thorsten.blum@linux.dev>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-784-lists,ecryptfs=lfdr.de];
	FREEMAIL_TO(0.00)[tyhicks.com,linux.dev,kernel.org,foxmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,ecryptfs@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 29B451059BF
X-Rspamd-Action: no action

The outer if already checks if 'mount_crypt_stat' is true. Drop checking
'mount_crypt_stat' again.  Use ecryptfs_printk() while we're at it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/crypto.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 7d864c8b1622..692cc5af8cd9 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1818,8 +1818,9 @@ int ecryptfs_encrypt_and_encode_filename(
 		filename->filename_size = name_size;
 		rc = ecryptfs_encrypt_filename(filename, mount_crypt_stat);
 		if (rc) {
-			printk(KERN_ERR "%s: Error attempting to encrypt "
-			       "filename; rc = [%d]\n", __func__, rc);
+			ecryptfs_printk(KERN_ERR,
+				"Error attempting to encrypt filename; rc = [%d]\n",
+				rc);
 			kfree(filename);
 			goto out;
 		}
@@ -1827,9 +1828,8 @@ int ecryptfs_encrypt_and_encode_filename(
 			NULL, &encoded_name_no_prefix_size,
 			filename->encrypted_filename,
 			filename->encrypted_filename_size);
-		if (mount_crypt_stat
-			&& (mount_crypt_stat->flags
-			    & ECRYPTFS_GLOBAL_ENCFN_USE_MOUNT_FNEK))
+		if (mount_crypt_stat->flags
+		    & ECRYPTFS_GLOBAL_ENCFN_USE_MOUNT_FNEK)
 			(*encoded_name_size) =
 				(ECRYPTFS_FNEK_ENCRYPTED_FILENAME_PREFIX_SIZE
 				 + encoded_name_no_prefix_size);
@@ -1844,9 +1844,8 @@ int ecryptfs_encrypt_and_encode_filename(
 			kfree(filename);
 			goto out;
 		}
-		if (mount_crypt_stat
-			&& (mount_crypt_stat->flags
-			    & ECRYPTFS_GLOBAL_ENCFN_USE_MOUNT_FNEK)) {
+		if (mount_crypt_stat->flags
+		    & ECRYPTFS_GLOBAL_ENCFN_USE_MOUNT_FNEK) {
 			memcpy((*encoded_name),
 			       ECRYPTFS_FNEK_ENCRYPTED_FILENAME_PREFIX,
 			       ECRYPTFS_FNEK_ENCRYPTED_FILENAME_PREFIX_SIZE);
@@ -1864,9 +1863,9 @@ int ecryptfs_encrypt_and_encode_filename(
 			rc = -EOPNOTSUPP;
 		}
 		if (rc) {
-			printk(KERN_ERR "%s: Error attempting to encode "
-			       "encrypted filename; rc = [%d]\n", __func__,
-			       rc);
+			ecryptfs_printk(KERN_ERR,
+				"Error attempting to encode encrypted filename; rc = [%d]\n",
+				rc);
 			kfree((*encoded_name));
 			(*encoded_name) = NULL;
 			(*encoded_name_size) = 0;
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


