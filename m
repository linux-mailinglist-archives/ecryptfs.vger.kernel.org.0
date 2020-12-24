Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F992E2735
	for <lists+ecryptfs@lfdr.de>; Thu, 24 Dec 2020 14:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgLXNWq (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Thu, 24 Dec 2020 08:22:46 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9486 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbgLXNWp (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Thu, 24 Dec 2020 08:22:45 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D1rLw18YWzhvJC;
        Thu, 24 Dec 2020 21:21:28 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Thu, 24 Dec 2020 21:21:56 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <ecryptfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH v2 -next] ecryptfs: use DEFINE_MUTEX() for mutex lock
Date:   Thu, 24 Dec 2020 21:22:33 +0800
Message-ID: <20201224132233.30852-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

mutex lock can be initialized automatically with DEFINE_MUTEX()
rather than explicitly calling mutex_init().

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

