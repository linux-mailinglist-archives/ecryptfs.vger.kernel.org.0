Return-Path: <ecryptfs+bounces-1169-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKUeOniYyWn8zgUAu9opvQ
	(envelope-from <ecryptfs+bounces-1169-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Sun, 29 Mar 2026 23:24:08 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7E354241
	for <lists+ecryptfs@lfdr.de>; Sun, 29 Mar 2026 23:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C577730078F5
	for <lists+ecryptfs@lfdr.de>; Sun, 29 Mar 2026 21:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDE921CA0D;
	Sun, 29 Mar 2026 21:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="goVqdvqZ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219B619CD0A
	for <ecryptfs@vger.kernel.org>; Sun, 29 Mar 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774819446; cv=none; b=GNjp7eFWwGm53QLdUMZ9mpoODO2fojEYwKQaM1Wl3NP7v1LNb/1CSVmPcVHHEyzAgcVCwJh9MXVrHfNfvzbTyFjYshh1GfgNOXlYq0iERMs1CfWtFPM3ZVEG5ObgXe/GRisfRptPyoYBZzQXXau5fOUg9VxWHmkwdprN7rlYe8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774819446; c=relaxed/simple;
	bh=jSGl1sGoYsfcH2zmeHuwrsDSl0JGHJ0IsyXrLNq+r+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5P7etozJmxwnNpCRKQ4OOwaThNBgl7phuxWcvFg/GedSPI/uNgWlu3Pmp3yqekGMNrG9zol9J1FZC4y12s8jyiqsyqYAUtlMaq0WAOv59aSza3ACqChIeC1Sk5YA8CHGHhrbE6ct9LtvZRH5pDh/F3d8XH+jHFaLsaMEntELUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=goVqdvqZ; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774819442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fiYUZRIhPHRfpLy+X1L5rQAd5Zyjsl3Oxk/LrORbXdo=;
	b=goVqdvqZsWZkm+gFLAwe+6Tx45jLevInpYgEc3wVJ4Xq9VPtODC8EJ/bS9tY6T2JwUUiFa
	QgioJnOriO6xEBPJvoFTbHP5UDlWvYq0gByPGf4rZ/eT0Vr7afR1fbkjA/+w51LHh73odQ
	rRtpCQNAAYq2OH8o157A/WK/1hM09Z0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>
Cc: Chuck Lever <chuck.lever@oracle.com>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: streamline offset formatting in ecryptfs_derive_iv
Date: Sun, 29 Mar 2026 23:23:25 +0200
Message-ID: <20260329212325.371720-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904; i=thorsten.blum@linux.dev; h=from:subject; bh=jSGl1sGoYsfcH2zmeHuwrsDSl0JGHJ0IsyXrLNq+r+I=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJknZ/hahd3cru/Kw5XScH1f/NOW8xcEf9tlNj3883ee9 jrGntWfOkpYGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAia/4z/Di2xGdm8iyrboOe NZ1RtVs/i9V1/5ilW26mNevMxLlKHIwMLdyHergeqP6pnMa0fd52D1v/iSeT3j3Oz5y+8rXMf00 ndgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
	TAGGED_FROM(0.00)[bounces-1169-lists,ecryptfs=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[tyhicks.com,linux.dev,kernel.org,gmail.com,foxmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3DC7E354241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the number of characters written by scnprintf() to zero-pad the
remaining bytes, instead of clearing the buffer first and then writing
the offset.

Fix a typo in the kernel-doc and remove the TODO from 2006 while at it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/crypto.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 3b59346d68c5..7fac3ec1a8cd 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -72,7 +72,7 @@ static int ecryptfs_crypto_api_algify_cipher_name(char **algified_name,
 
 /**
  * ecryptfs_derive_iv
- * @iv: destination for the derived iv vale
+ * @iv: destination for the derived iv value
  * @crypt_stat: Pointer to crypt_stat struct for the current inode
  * @offset: Offset of the extent whose IV we are to derive
  *
@@ -84,18 +84,15 @@ void ecryptfs_derive_iv(char *iv, struct ecryptfs_crypt_stat *crypt_stat,
 {
 	char dst[MD5_DIGEST_SIZE];
 	char src[ECRYPTFS_MAX_IV_BYTES + 16];
+	size_t len;
 
 	if (unlikely(ecryptfs_verbosity > 0)) {
 		ecryptfs_printk(KERN_DEBUG, "root iv:\n");
 		ecryptfs_dump_hex(crypt_stat->root_iv, crypt_stat->iv_bytes);
 	}
-	/* TODO: It is probably secure to just cast the least
-	 * significant bits of the root IV into an unsigned long and
-	 * add the offset to that rather than go through all this
-	 * hashing business. -Halcrow */
 	memcpy(src, crypt_stat->root_iv, crypt_stat->iv_bytes);
-	memset((src + crypt_stat->iv_bytes), 0, 16);
-	snprintf((src + crypt_stat->iv_bytes), 16, "%lld", offset);
+	len = scnprintf(src + crypt_stat->iv_bytes, 16, "%lld", offset) + 1;
+	memset(src + crypt_stat->iv_bytes + len, 0, 16 - len);
 	if (unlikely(ecryptfs_verbosity > 0)) {
 		ecryptfs_printk(KERN_DEBUG, "source:\n");
 		ecryptfs_dump_hex(src, (crypt_stat->iv_bytes + 16));

