Return-Path: <ecryptfs+bounces-1100-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PvdBX1Or2noTgIAu9opvQ
	(envelope-from <ecryptfs+bounces-1100-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 09 Mar 2026 23:49:33 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 711AE2425D8
	for <lists+ecryptfs@lfdr.de>; Mon, 09 Mar 2026 23:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3DEB3099209
	for <lists+ecryptfs@lfdr.de>; Mon,  9 Mar 2026 22:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F210534F479;
	Mon,  9 Mar 2026 22:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jydRz+Yj"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABAC246766
	for <ecryptfs@vger.kernel.org>; Mon,  9 Mar 2026 22:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773096541; cv=none; b=tb1bc0l+ghupnojhl6evcATkFCOvSFSuihNM9BEKFE4EZrinaMsWmrerXXyngPTlrmXT89lluBgnixFhxgPqGk1F2euqEMx0V2k9o4wZpKvuW27f92sbLLx5vcofr5EBi9aKpz5AIv+v/iet7fLcVvusxAzYOIJzyT3otQT2S38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773096541; c=relaxed/simple;
	bh=bd7WMopfjQDc641OprbrEEynQz0DTBD8Sb0Rqe76dKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Psm1bdmIdp1zTkjqpFy9xyTLv3NzkLA64iEMrD4YRAUhtT+KBLEprJvSTOF5aIPh/cl1raH4KvJobI+g0tjaoAeuI8xyfeFG0dv4UOqxzZN09JV8pgzl+8UdOwT0IcaoFChtLrPOQpStS/XijSILoYeyec6PEYI/0nl85el9SlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jydRz+Yj; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773096538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X/mP8O17vQh3oBCqgCXCueebYZI9yN2a7YxrPGwVILY=;
	b=jydRz+Yj+G7qCNXon7fwQSS8xT3lpHIHxZbs2Sac9SU0OwlG3gNA7l8jtg6gGLJ1eRAGVu
	I8Kl/x8rKyhZX0pfjnqH9CqR39oHNP2dEMxvV8YXF7/pB3ppU7dl4/B7b5jR47Y3q7Jwoi
	Ks23qEotVuuC1v5ivyHRfmgOEyB96oY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Eric Biggers <ebiggers@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Kees Cook <kees@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] ecryptfs: Remove redundant if checks in encrypt_and_encode_filename
Date: Mon,  9 Mar 2026 23:48:24 +0100
Message-ID: <20260309224824.85471-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2267; i=thorsten.blum@linux.dev; h=from:subject; bh=bd7WMopfjQDc641OprbrEEynQz0DTBD8Sb0Rqe76dKM=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnr/SwU+qZ1Hv48cVvixfldn1M40tdKvDdtrta9LxZQa qJ/b0lORykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEyk9RIjw80qQb+KMiYF09ZF 8nVzEutPpWtek7lb+Ld0pi3D6Z8Jjxj+2bKWJWmH+NxuX8X+acH/2BP9qmfuvZ6TfPGRetATW5V uHgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 711AE2425D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1100-lists,ecryptfs=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[tyhicks.com,linux.dev,kernel.org,foxmail.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The outer if already checks if 'mount_crypt_stat' is true. Drop checking
'mount_crypt_stat' again.  Use ecryptfs_printk() while we're at it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/crypto.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 3b59346d68c5..bed7a251d8c6 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1802,8 +1802,9 @@ int ecryptfs_encrypt_and_encode_filename(
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
@@ -1811,9 +1812,8 @@ int ecryptfs_encrypt_and_encode_filename(
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
@@ -1828,9 +1828,8 @@ int ecryptfs_encrypt_and_encode_filename(
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
@@ -1848,9 +1847,9 @@ int ecryptfs_encrypt_and_encode_filename(
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

