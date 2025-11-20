Return-Path: <ecryptfs+bounces-724-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 199CBC766D4
	for <lists+ecryptfs@lfdr.de>; Thu, 20 Nov 2025 22:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9B8A135F0CA
	for <lists+ecryptfs@lfdr.de>; Thu, 20 Nov 2025 21:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C89371A2E;
	Thu, 20 Nov 2025 21:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eWaeSMQJ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D130C31D757
	for <ecryptfs@vger.kernel.org>; Thu, 20 Nov 2025 21:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675297; cv=none; b=OIXXd/BCXwRljYxHSAU8X5TpWFOKzsbgX7aSvq2pxbYdB0JqM6ntWpZYKq5J6DVb5TbT9vuP1dOPA+0UEc9OGFl1VddSXcFnLc6Eii3DGlqpINRLpf9W5nevHxOjeXk6s88uO3IQF76PQNzkTE6QdntmQjfFLy+RweC6UGga8qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675297; c=relaxed/simple;
	bh=ZpLvQ1lINqo+k94kKlQDd7Y3RyCcBxaSd/Pmj8E988s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YZwpr6uuAD+xM3P4fvfeaU1lhrFCLyRXf5yJT4XO1EkHt7Fae7gfVs3y9Y7++NQzX7YNT3meo32vuD/qRgIndktlB/pAEb764aVBi0IYzxIkOSBTvGDz7zRZa9tuYdUm/WPJDP+Jz6hwnaQo6pY3/tZwzfIqSlDewHEmwGpL02A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eWaeSMQJ; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763675281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=duWqcUo3510DqxytY/GVenrT9tSxQ9UeuFc0cdTfYbM=;
	b=eWaeSMQJPqqPNIPAvXp9MgXE4jXAhGJ0zcbjA0h1CD8RaHbmZW0NJazxty/ZHka3HqBEnv
	5pMSxPSeaqo1LE9IFji32upJt7jYJvmPTaYBCS/Xo5+IW+jzmJ+H6D1/FbefRQyZTTNatP
	9QTt6biOgkStaW93ltzicwHNzZmV6jA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: Drop redundant NUL termination in ecryptfs_parse_tag_70_packet
Date: Thu, 20 Nov 2025 22:45:33 +0100
Message-ID: <20251120214535.5952-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

ecryptfs_to_hex() already NUL-terminates ->fnek_sig_hex. Drop the manual
NUL termination.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/keystore.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index b5204ab3150d..87990c0d4e2d 100644
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
-- 
2.51.1


