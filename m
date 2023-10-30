Return-Path: <ecryptfs+bounces-3-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FF37DBAE5
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Oct 2023 14:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9038B20D3D
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Oct 2023 13:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444EA171A6;
	Mon, 30 Oct 2023 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="G7g6nIpo"
X-Original-To: ecryptfs@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF32315E81
	for <ecryptfs@vger.kernel.org>; Mon, 30 Oct 2023 13:35:08 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 792F0A2
	for <ecryptfs@vger.kernel.org>; Mon, 30 Oct 2023 06:35:07 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id xSIoq4DJYLilFxSIpqpweO; Mon, 30 Oct 2023 14:27:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698672455;
	bh=/DkN5aD3T5Ca9TtQI/yHLRzDeLFOsujUxsYE2YCrNlU=;
	h=From:To:Cc:Subject:Date;
	b=G7g6nIpo2eAt6Fz7quD13L6Gm0WeEBDbpvi0RJGBjXKcpZ/DjQCWzwqv1Gl94Ny3h
	 2idDLo5gCuCq53k/KKKiHBbbfY7iDz8q27xlbLOO14yiW+GsHza75cm1yx5yOw1Ao6
	 ibW7+WoTLu+LEh2x+VLRI4CbFOe4vC573ziiA9w3TVvjK/DDSEO2RNHU+2tSMdwiP6
	 C9VIbwhQ4ild3H21VcKgM35kPS1bHYQfHJ9tydWYUTMJrpxSUvV3W/Moak3qPuXLHN
	 FTkIQ6QrqnE1P5INGirV7puw3fhCYpZtInVGoB9xzjZVEMEEHuDC6ibJXK2v4pPf+n
	 t/m2nhemHB+Pw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 30 Oct 2023 14:27:35 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Tyler Hicks <code@tyhicks.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	ecryptfs@vger.kernel.org
Subject: [PATCH] ecryptfs: Simplify ecryptfs_crypto_api_algify_cipher_name()
Date: Mon, 30 Oct 2023 14:27:32 +0100
Message-Id: <2c4bd387e8036854d3338400038fdde8dce3806a.1698672391.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kasprintf() instead of hand writing it.
It is much less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/ecryptfs/crypto.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 044863c0d824..00d795658cf5 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <asm/unaligned.h>
 #include <linux/kernel.h>
+#include <linux/sprintf.h>
 #include <linux/xattr.h>
 #include "ecryptfs_kernel.h"
 
@@ -78,22 +79,12 @@ static int ecryptfs_crypto_api_algify_cipher_name(char **algified_name,
 						  char *cipher_name,
 						  char *chaining_modifier)
 {
-	int cipher_name_len = strlen(cipher_name);
-	int chaining_modifier_len = strlen(chaining_modifier);
-	int algified_name_len;
-	int rc;
+	*algified_name = kasprintf(GFP_KERNEL, "%s(%s)",
+				   chaining_modifier, cipher_name);
+	if (!(*algified_name))
+		return -ENOMEM;
 
-	algified_name_len = (chaining_modifier_len + cipher_name_len + 3);
-	(*algified_name) = kmalloc(algified_name_len, GFP_KERNEL);
-	if (!(*algified_name)) {
-		rc = -ENOMEM;
-		goto out;
-	}
-	snprintf((*algified_name), algified_name_len, "%s(%s)",
-		 chaining_modifier, cipher_name);
-	rc = 0;
-out:
-	return rc;
+	return 0;
 }
 
 /**
-- 
2.34.1


