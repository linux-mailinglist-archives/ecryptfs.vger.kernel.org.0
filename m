Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1829711F9A5
	for <lists+ecryptfs@lfdr.de>; Sun, 15 Dec 2019 18:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfLORYL (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 15 Dec 2019 12:24:11 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:50914 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfLORYL (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sun, 15 Dec 2019 12:24:11 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 47bWV23vb0z9vJBw
        for <ecryptfs@vger.kernel.org>; Sun, 15 Dec 2019 17:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VzjFO1lHvmMK for <ecryptfs@vger.kernel.org>;
        Sun, 15 Dec 2019 11:24:10 -0600 (CST)
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 47bWV22qlVz9vs7b
        for <ecryptfs@vger.kernel.org>; Sun, 15 Dec 2019 11:24:10 -0600 (CST)
Received: by mail-yb1-f197.google.com with SMTP id x186so4711484yba.6
        for <ecryptfs@vger.kernel.org>; Sun, 15 Dec 2019 09:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pecgs7ML7Vk7tWrjFYP98uMh9IdJ4hgC/me6N1U0MqY=;
        b=jkfJBUJcQoX1yFjzdjzLoe6pY8qFLcPsJcRicv8sUQ3KI7lJHM7wqg+Chr1001bMPD
         W0XsUrqobdn0msYcUN4TjL5exX0UMw7kQoOY6P9+0jUi7bfoxbjBoQJSuMYSE3uSTBFF
         OkOLAYaUMmu20lBSqyQRpbnA45FEYZrOqhcijBpNbSByPR85MMdpUNOj0P8+pdcBYv/H
         z2iFxZy3LIzlFRBYDNsSVARyQdsrcjJQsSoHj001/cE63omL5zHgY9Eypl6Vzl5yFNOq
         cVkZV8X2/NUrc7M9t8coomBP5LcBhg0S7lfU61ZpPEuF6BI6giwm5uzNOQXF5SHOkaCh
         8pzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pecgs7ML7Vk7tWrjFYP98uMh9IdJ4hgC/me6N1U0MqY=;
        b=lftVDX9v6GRTTXOY9J8FsJwVz9c0c/SdFd2yZNGE543qGEOWtHP0IynBJGIII5+SWy
         hrgzvtoGQdoM3MtZ6tgvbGJ4GjfJ4M5Vdw6/THKKZBd2L3YlQRnB9aPibrDLWwEjzIGP
         5lwvLnFjJk70MTTkEDHivgvJeDRE/hcXbRQm4DKMFeq0lS432QWCE/anNobFceSidQOt
         UOCv4ZN6quIZnrAbk+lweT3n7GA7X3394UPviaGejCFe7r9K7TOkmDqZYzW/vEpIGzV2
         JT0i6rmN+DZ0LE7mqGwFvVqk3BmjX5nc579TZ+Oged2kebpsA63DiyvdKQrnbZjnphB3
         OaKg==
X-Gm-Message-State: APjAAAUMmz4habL7q91AvVoGmJlfU9zMuyuIJPTV6fNENCyiS0Ps36Yu
        LJ+jDQcjhN54KqvDFkEohx2SA0dpfdW5Jjnwn5mL9m7pUJzsoOeOxWyHFi7B6BbmloZ76fzgVB0
        CuOAr1ywKR7pbQgzloAijeyY=
X-Received: by 2002:a25:c4c6:: with SMTP id u189mr16155468ybf.145.1576430649875;
        Sun, 15 Dec 2019 09:24:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqztTQTtMit3I1wZgX7qTMNPjPQRMZAa5AVd+u0lgsRsZTteFqWzJH36T48vebwVZixwVly3DA==
X-Received: by 2002:a25:c4c6:: with SMTP id u189mr16155458ybf.145.1576430649672;
        Sun, 15 Dec 2019 09:24:09 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu. [128.101.106.66])
        by smtp.gmail.com with ESMTPSA id 205sm69295ywm.17.2019.12.15.09.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 09:24:09 -0800 (PST)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, Tyler Hicks <tyhicks@canonical.com>,
        ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: replace BUG_ON with error handling code
Date:   Sun, 15 Dec 2019 11:24:04 -0600
Message-Id: <20191215172404.28204-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

In crypt_scatterlist, if the crypt_stat argument is not set up
correctly, we avoid crashing, by returning the error upstream.
This patch performs the fix.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 fs/ecryptfs/crypto.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index f91db24bbf3b..a064b408d841 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -311,8 +311,10 @@ static int crypt_scatterlist(struct ecryptfs_crypt_stat *crypt_stat,
 	struct extent_crypt_result ecr;
 	int rc = 0;
 
-	BUG_ON(!crypt_stat || !crypt_stat->tfm
-	       || !(crypt_stat->flags & ECRYPTFS_STRUCT_INITIALIZED));
+	if (!crypt_stat || !crypt_stat->tfm
+	       || !(crypt_stat->flags & ECRYPTFS_STRUCT_INITIALIZED))
+		return -EINVAL;
+
 	if (unlikely(ecryptfs_verbosity > 0)) {
 		ecryptfs_printk(KERN_DEBUG, "Key size [%zd]; key:\n",
 				crypt_stat->key_size);
-- 
2.20.1

