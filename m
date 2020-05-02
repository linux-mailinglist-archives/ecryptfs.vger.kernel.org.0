Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B0F1C234D
	for <lists+ecryptfs@lfdr.de>; Sat,  2 May 2020 07:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgEBFdq (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sat, 2 May 2020 01:33:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:39282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727815AbgEBFdp (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Sat, 2 May 2020 01:33:45 -0400
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E349F2495C;
        Sat,  2 May 2020 05:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588397625;
        bh=jq54d1r7a1DdG4P2T20EFr5Sm0y5npMj6hm6FZVE7ZI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2q6VFgcDhqwTtPax6sj8y89VG0iWV50ASfANjIUKqdiQlWQslRXxpIP5hjar2RQR7
         pjbYI270igk5GthJXu0s9yRVJ8n4/82LISYSr6/FUJdb2a95BsW9/MlbW+SwMRjtdZ
         0snNb9uDEhbSbPbos+mhz855MmDWZk8xrn/ELw0Q=
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     ecryptfs@vger.kernel.org
Subject: [PATCH 14/20] ecryptfs: use crypto_shash_tfm_digest()
Date:   Fri,  1 May 2020 22:31:16 -0700
Message-Id: <20200502053122.995648-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502053122.995648-1-ebiggers@kernel.org>
References: <20200502053122.995648-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

Instead of manually allocating a 'struct shash_desc' on the stack and
calling crypto_shash_digest(), switch to using the new helper function
crypto_shash_tfm_digest() which does this for us.

Cc: ecryptfs@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ecryptfs/crypto.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 2c449aed1b9209..0681540c48d985 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -48,18 +48,6 @@ void ecryptfs_from_hex(char *dst, char *src, int dst_size)
 	}
 }
 
-static int ecryptfs_hash_digest(struct crypto_shash *tfm,
-				char *src, int len, char *dst)
-{
-	SHASH_DESC_ON_STACK(desc, tfm);
-	int err;
-
-	desc->tfm = tfm;
-	err = crypto_shash_digest(desc, src, len, dst);
-	shash_desc_zero(desc);
-	return err;
-}
-
 /**
  * ecryptfs_calculate_md5 - calculates the md5 of @src
  * @dst: Pointer to 16 bytes of allocated memory
@@ -74,11 +62,8 @@ static int ecryptfs_calculate_md5(char *dst,
 				  struct ecryptfs_crypt_stat *crypt_stat,
 				  char *src, int len)
 {
-	struct crypto_shash *tfm;
-	int rc = 0;
+	int rc = crypto_shash_tfm_digest(crypt_stat->hash_tfm, src, len, dst);
 
-	tfm = crypt_stat->hash_tfm;
-	rc = ecryptfs_hash_digest(tfm, src, len, dst);
 	if (rc) {
 		printk(KERN_ERR
 		       "%s: Error computing crypto hash; rc = [%d]\n",
-- 
2.26.2

