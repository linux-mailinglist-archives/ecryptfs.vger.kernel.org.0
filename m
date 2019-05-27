Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 729032B625
	for <lists+ecryptfs@lfdr.de>; Mon, 27 May 2019 15:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbfE0NTD (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 27 May 2019 09:19:03 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41652 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726063AbfE0NTD (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Mon, 27 May 2019 09:19:03 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id D34D62D9B9A9D570627A;
        Mon, 27 May 2019 21:18:46 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 27 May 2019
 21:18:38 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <tyhicks@canonical.com>, <viro@zeniv.linux.org.uk>
CC:     <linux-kernel@vger.kernel.org>, <ecryptfs@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH 1/4] ecryptfs: remove unnessesary null check in ecryptfs_keyring_auth_tok_for_sig
Date:   Mon, 27 May 2019 21:15:59 +0800
Message-ID: <20190527131559.16088-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

request_key and ecryptfs_get_encrypted_key never
return a NULL pointer, so no need do a null check.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/ecryptfs/keystore.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 95662fd46b1d..a1afb162b9d2 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -1626,9 +1626,9 @@ int ecryptfs_keyring_auth_tok_for_sig(struct key **auth_tok_key,
 	int rc = 0;
 
 	(*auth_tok_key) = request_key(&key_type_user, sig, NULL);
-	if (!(*auth_tok_key) || IS_ERR(*auth_tok_key)) {
+	if (IS_ERR(*auth_tok_key)) {
 		(*auth_tok_key) = ecryptfs_get_encrypted_key(sig);
-		if (!(*auth_tok_key) || IS_ERR(*auth_tok_key)) {
+		if (IS_ERR(*auth_tok_key)) {
 			printk(KERN_ERR "Could not find key with description: [%s]\n",
 			      sig);
 			rc = process_request_key_err(PTR_ERR(*auth_tok_key));
-- 
2.17.1


