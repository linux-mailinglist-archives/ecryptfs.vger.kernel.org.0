Return-Path: <ecryptfs+bounces-766-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EA029D0E02E
	for <lists+ecryptfs@lfdr.de>; Sun, 11 Jan 2026 01:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A99A3002853
	for <lists+ecryptfs@lfdr.de>; Sun, 11 Jan 2026 00:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662E213635E;
	Sun, 11 Jan 2026 00:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a4+50NZ3"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD084500950
	for <ecryptfs@vger.kernel.org>; Sun, 11 Jan 2026 00:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768091886; cv=none; b=EsFHy5dGyRkfIQeJidj3mWgCBKZksfouOjne3X1nu8Yf0cVT3a2dljLxMqk+NQLyZCp5QU2PEQtaGOXw4xmAHkqDlWrUb+gitA4QA2HrH895XcSBqhiXgfLu30gI3XTLYIVspvWtRnnGt0CXha94hLN8sV/3yZsmGiwGyqenRlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768091886; c=relaxed/simple;
	bh=KDJYQlHRr9lMKGs53yBP/+oTu5HcUz2nH326y2u4wkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXNyH55ki1tfR2BLvqoyBKgze/wD9MS/5ro0E5w7Wi/CfJegN1kljAKspp54kM2mCNTm6LrQ1rVMCiMSMtN1086XhzJnypCza5mwhHEmyKa6kcv22hN4Bsa/D2yMT4jYPeziamIyBI0DnGVAx452A+ubGvyO44a+EdA+xY+cSyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a4+50NZ3; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768091873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+olqRexjNuwgq+miMhde6thSUMt2UPrlXVYzPacxdTc=;
	b=a4+50NZ3tj7TAIoV03ZMEpF/glj6Uml5sUvEZPgurEFOQGmePFt3Jbib61G6pzgmYh6Hqo
	3E1qxDlkl3vUpm18zk3zLeftn+F5eFXmS2uxERU3BcHiWdoqNoWUhOAqjOepzmlLt6pMoh
	KMoD5oEAz7pbVB7PtpZxQG9bow0I+6M=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ard Biesheuvel <ardb@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Michael Halcrow <mhalcrow@us.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: stable@vger.kernel.org,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: Add missing gotos in ecryptfs_read_metadata
Date: Sun, 11 Jan 2026 01:36:52 +0100
Message-ID: <20260111003655.491722-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add two missing goto statements to exit ecryptfs_read_metadata() when an
error occurs.

The first goto is required; otherwise ECRYPTFS_METADATA_IN_XATTR may be
set when xattr metadata is enabled even though parsing the metadata
failed. The second goto is not strictly necessary, but it makes the
error path explicit instead of relying on falling through to 'out'.

Cc: stable@vger.kernel.org
Fixes: dd2a3b7ad98f ("[PATCH] eCryptfs: Generalize metadata read/write")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/crypto.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 260f8a4938b0..d49cdf7292ab 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1328,6 +1328,7 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
 			       "file xattr region either, inode %lu\n",
 				ecryptfs_inode->i_ino);
 			rc = -EINVAL;
+			goto out;
 		}
 		if (crypt_stat->mount_crypt_stat->flags
 		    & ECRYPTFS_XATTR_METADATA_ENABLED) {
@@ -1340,6 +1341,7 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
 			       "this like an encrypted file, inode %lu\n",
 				ecryptfs_inode->i_ino);
 			rc = -EINVAL;
+			goto out;
 		}
 	}
 out:
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


