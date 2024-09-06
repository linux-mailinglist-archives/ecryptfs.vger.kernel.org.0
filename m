Return-Path: <ecryptfs+bounces-146-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E87796EA25
	for <lists+ecryptfs@lfdr.de>; Fri,  6 Sep 2024 08:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F932B231AF
	for <lists+ecryptfs@lfdr.de>; Fri,  6 Sep 2024 06:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F62713DB9F;
	Fri,  6 Sep 2024 06:26:25 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDF213D8B5
	for <ecryptfs@vger.kernel.org>; Fri,  6 Sep 2024 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725603985; cv=none; b=Z8zrIwkfK4lY3KyKBaBb8+jyka2unIMViOqPzCcILRsvk1n/3ehvZNBW0EHHgwtBK1+KidIgYW10yWz++N3GCa1mz3GLOXGiJidruwc+/eZ/qvOzFZZDo9B37PLhtQ8W1Y2JYfsLPRwxPF/u3nGHe8T4pmF949pDddeGkwj1x5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725603985; c=relaxed/simple;
	bh=DmSW8t+ItVy0n/cFYl0Yqcps3JRGNmmibFP6ecQnPz0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AFLaAemAwdSs5jHmQ8vMFR8bBZLyBXA7JtWS+P58qaqAUCslwG2rMMt7epiyLYiybvEyF+Slav93HTlBzlTD6ngylmPmAE4WOfyLZIr76OxUkMwjMZ+WBrznQj51Qhi9cJacvz5fyeDNDyTyGWelf5ZRbnu4vuvqkcHcX48pdAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4X0R6l2Gm8z1P9FJ;
	Fri,  6 Sep 2024 14:25:19 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A4F718010B;
	Fri,  6 Sep 2024 14:26:19 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 14:26:18 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <code@tyhicks.com>, <brauner@kernel.org>, <walmeida@microsoft.com>,
	<ecryptfs@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH] ecryptfs:  Remove unused declartion ecryptfs_fill_zeros()
Date: Fri, 6 Sep 2024 14:12:41 +0800
Message-ID: <20240906061241.20010-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)

The definition of ecryptfs_fill_zeros() has been removed since
commit b6c1d8fcbade ("eCryptfs: remove unused functions and kmem_cache")
So, Remove the empty declartion in header files.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 fs/ecryptfs/ecryptfs_kernel.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index c586c5db18b5..b3bca2ebec24 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -551,7 +551,6 @@ int ecryptfs_decode_and_decrypt_filename(char **decrypted_name,
 					 size_t *decrypted_name_size,
 					 struct super_block *sb,
 					 const char *name, size_t name_size);
-int ecryptfs_fill_zeros(struct file *file, loff_t new_length);
 int ecryptfs_encrypt_and_encode_filename(
 	char **encoded_name,
 	size_t *encoded_name_size,
-- 
2.17.1


