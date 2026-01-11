Return-Path: <ecryptfs+bounces-769-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D0D0EF47
	for <lists+ecryptfs@lfdr.de>; Sun, 11 Jan 2026 14:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DE973007ED8
	for <lists+ecryptfs@lfdr.de>; Sun, 11 Jan 2026 13:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73F8303A0F;
	Sun, 11 Jan 2026 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jrj7zW5k"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A27262A
	for <ecryptfs@vger.kernel.org>; Sun, 11 Jan 2026 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768137219; cv=none; b=nOCTMxqObjnk13qpy+h4crpS4Z0fyVZVisUrEGf5VNv98G85a7XPIfijuWDbP531TxwVG+2AMehjdNXwQ7euEPkti9fnRnOzuhcKfkQdC8XT2xb3AAtiKvplJHxkGIPm469i5nbq6K64mPusAr9Al0utrbpawEUMZO+r78S8HEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768137219; c=relaxed/simple;
	bh=CgWO6Id73rCP6/y2Y8fou5Y0+7K5wwfPfaPW8MUDL48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rkeQ9mLWW296wXrPhrB+cMVLF3SqZIuwrleQvZL4iVnc9tOpATn/4hruILacJvPI7wzumqO+Avya7mJZZw2I+rEftBeRtxyYBqXzBEr4MTYkpooYf7omrSF3eZKx/3ttT7Zz8JzkJ9LRnE5MH0Hs+DDRFZY0Np6nyxoVJqEzMuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jrj7zW5k; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768137215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GGUP682yaNROfHL+XCP9B1qwuZ5gOAf9MVFN1gTeSiQ=;
	b=jrj7zW5kWBso9CqwcpIaWI/SNXkQH7gaNIdwI5nOtki0NRm2YTSs5qacCeiWzcfs0StZdp
	ZODFfdtgavzygzD0A21/h4C2KOBOflpQKgz10hDCSQy7cxRS+Lf7I6Jo8zXUmW2J1mpqL9
	FQEr8lsreID6gln0rapctB9A+Nk87nk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: Replace memcpy + NUL termination in ecryptfs_copy_filename
Date: Sun, 11 Jan 2026 14:12:58 +0100
Message-ID: <20260111131301.548411-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use kmemdup_nul() to copy 'name' instead of using memcpy() followed by a
manual NUL termination.  Remove the local return variable and the goto
label to simplify the code.  No functional changes.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/crypto.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index d49cdf7292ab..82fc5e1b6324 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1422,21 +1422,11 @@ ecryptfs_encrypt_filename(struct ecryptfs_filename *filename,
 static int ecryptfs_copy_filename(char **copied_name, size_t *copied_name_size,
 				  const char *name, size_t name_size)
 {
-	int rc = 0;
-
-	(*copied_name) = kmalloc((name_size + 1), GFP_KERNEL);
-	if (!(*copied_name)) {
-		rc = -ENOMEM;
-		goto out;
-	}
-	memcpy((void *)(*copied_name), (void *)name, name_size);
-	(*copied_name)[(name_size)] = '\0';	/* Only for convenience
-						 * in printing out the
-						 * string in debug
-						 * messages */
+	(*copied_name) = kmemdup_nul(name, name_size, GFP_KERNEL);
+	if (!(*copied_name))
+		return -ENOMEM;
 	(*copied_name_size) = name_size;
-out:
-	return rc;
+	return 0;
 }
 
 /**
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


