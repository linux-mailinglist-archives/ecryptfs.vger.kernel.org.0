Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D17D22E1D1F
	for <lists+ecryptfs@lfdr.de>; Wed, 23 Dec 2020 15:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgLWON1 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 23 Dec 2020 09:13:27 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9916 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728578AbgLWON1 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 23 Dec 2020 09:13:27 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D1FWc1TmBz7K7l;
        Wed, 23 Dec 2020 22:11:56 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 23 Dec 2020 22:12:31 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <ecryptfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] ecryptfs: use DEFINE_MUTEX (and mutex_init() had been too late)
Date:   Wed, 23 Dec 2020 22:13:07 +0800
Message-ID: <20201223141307.615-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 fs/ecryptfs/crypto.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 0681540c48d9..be906b9bbb11 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1590,11 +1590,10 @@ ecryptfs_process_key_cipher(struct crypto_skcipher **key_tfm,
 
 struct kmem_cache *ecryptfs_key_tfm_cache;
 static struct list_head key_tfm_list;
-struct mutex key_tfm_list_mutex;
+DEFINE_MUTEX(key_tfm_list_mutex);
 
 int __init ecryptfs_init_crypto(void)
 {
-	mutex_init(&key_tfm_list_mutex);
 	INIT_LIST_HEAD(&key_tfm_list);
 	return 0;
 }
-- 
2.22.0

