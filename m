Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 425397694BE
	for <lists+ecryptfs@lfdr.de>; Mon, 31 Jul 2023 13:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjGaL0H (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 31 Jul 2023 07:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjGaL0G (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 31 Jul 2023 07:26:06 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96839BF
        for <ecryptfs@vger.kernel.org>; Mon, 31 Jul 2023 04:26:05 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RDwpg2xhlzLnwH;
        Mon, 31 Jul 2023 19:23:23 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 19:26:03 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <code@tyhicks.com>, <brauner@kernel.org>,
        <fmdefrancesco@gmail.com>, <dchinner@redhat.com>,
        <ecryptfs@vger.kernel.org>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next] fs/ecryptfs: remove kernel-doc warnings
Date:   Mon, 31 Jul 2023 19:25:33 +0800
Message-ID: <20230731112533.214216-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Remove kernel-doc warnings:

fs/ecryptfs/mmap.c:270: warning: Excess function parameter 'flags'
description in 'ecryptfs_write_begin'

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 fs/ecryptfs/mmap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
index cb1e998ce54d..e2483acc4366 100644
--- a/fs/ecryptfs/mmap.c
+++ b/fs/ecryptfs/mmap.c
@@ -255,7 +255,6 @@ static int fill_zeros_to_end_of_page(struct page *page, unsigned int to)
  * @mapping: The eCryptfs object
  * @pos: The file offset at which to start writing
  * @len: Length of the write
- * @flags: Various flags
  * @pagep: Pointer to return the page
  * @fsdata: Pointer to return fs data (unused)
  *
-- 
2.17.1

