Return-Path: <ecryptfs+bounces-364-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E26D5ADFBCC
	for <lists+ecryptfs@lfdr.de>; Thu, 19 Jun 2025 05:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48DCF1881A5A
	for <lists+ecryptfs@lfdr.de>; Thu, 19 Jun 2025 03:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1F127442;
	Thu, 19 Jun 2025 03:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7Akw328"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7370212B0C;
	Thu, 19 Jun 2025 03:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750302980; cv=none; b=PgpgpXtaWvSE3X9WhtnEzjcYVX6F56JZVnq1DuNca+VN1UixQyVIKoTkdyf/cjw/ZVPk0O8TYqwKTk6Hbnjx2fCPOvqpxIK1sff4g8jROkHOwlH2h8U+7n5SzVfq0sc8b8MTwIVgKWmTNQ2p48871fID2kdawxjyUv7h4lijKf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750302980; c=relaxed/simple;
	bh=B7ats7pSZOIURIkwJd9yRJFHCqIePEbrjP9Qt14ypus=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OTLa9vcOMZ5i7mQV4v8pBzzaweH9GDLrIdJn5/ZtTbwhFp7SImA/li9vKJ2X0YixFyLp6p075H4Rt/fJCaQLAazLFulFl5CsBfnU3TSFzDC7ig2Iuo3v8lVT1XEE7jY/tWC4M1x93ofc07jQqH/3uK8JHPKWWMTIMer3J8GbzS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7Akw328; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b31d8dd18cbso401517a12.3;
        Wed, 18 Jun 2025 20:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750302978; x=1750907778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2EDrh/I+Qce7fp+IBF7ObiF7VThEZKMuFvwVKha5rKk=;
        b=d7Akw328DOL1OSGMqGDCo9bLuZuqIX05M7dSELQxqjsQM2f7BGoFMJDoKU9hSwPlvX
         mX2lcSZfO0PvfKukhNFywmiilzYtpZX1fAkmBkRr5l6jJ9ndg51rO8P0FDLqgjvZXJCn
         Wda8rTNdTgfMcwNxWlFIBmeTvZ22xcc6K0N5PINC4Z/3Iv862PhyrHBr2nPmQO0O9Qlc
         /GNvgru/LxB+qNppuqDTFalSQMZ/zwKZHRbFp0lZcWGQUQebRSacp9P4ij4xw/O5ltiA
         81Vwar7LWv9hiAoUTTopTYNQD7RmKBZ6qIRxnYBJaymYW8A1DbihYXRICcxVNC1CVecR
         XCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750302978; x=1750907778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EDrh/I+Qce7fp+IBF7ObiF7VThEZKMuFvwVKha5rKk=;
        b=nEcr9/IA94gRnXnvxbzYse2mbBqrZfSAW+G/bpnBvLJtgw9KrL8B7VuXHICedmcn08
         kRGfbzsuaoqct9dO81dqTybKVNPdRzH10mUkDM4vbM/3IyVaooeyMR6BZ5hd4wfoRK+A
         MiUyKVHOcJSBXQIg5DhQg4o2TS1SS2/FlpRRg/EfNQw1Mt3b+pNx0HPjbBr/9hQq5U8c
         rr0Zq42nI6wd+M7tULJ9VKMmk1tk8Uy/XHDkOzTx5BsOlTFbDMTKtXQIoF82rMC2DLZi
         YOpqYybod+xbBZ7BIcs9ae1cTP/LbLuM8lXFwEwsHN2VXQMQFAftMELw9bbxq/UnrJxo
         glXQ==
X-Forwarded-Encrypted: i=1; AJvYcCURI1Wop8jLc6wFedEl7XqG9HkaUfKsINHb+pmkCB/LqO0342WsKvMMN26A+DNNe/P7IqiuuXhP9z9GGLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlOY30iJyrn/iXS+8nPrvYX4tfeRFwDtHEE1DhaRaPy8AY4tP+
	r0f8pthAPVzFCZgqpA49PIVEyukkxcP8CiaOukhfLL5xyVqsJRxs1T3kyIJpSEAQbXM=
X-Gm-Gg: ASbGncuUWGywHDIKccpRHXwMTmyKqY/zAfT/Rt+tH9fJEadzl1B5Z/i/Qs9GeKHTHVI
	mN1ynLFAKFBkrNlAam9qbc7mrTSKJrNzb1fJ4r6h/aVXk+P9s7kpACOyz0UwWtyFIfF2KFoWgUK
	5fbcHT5OSteOGOnTPPjf0f46rSVgA1/G8jWmj1U/dSxq/SfbNUs+AIJDQj/AUtbYj4U1EiAfNJT
	3vMcUCe4yRFoZ68G413uTQhMpWdQHS7ucXUcBH44CkROtctnbWIAiOKNRcf2HYzHnahaW0Wosk/
	uHA8UX/gdTSyzbE7xthe33G0JXE2Po2+4HJNuP8zBlmMjay+duCcihuVAVtBggfwzVTidLQxKJN
	ig4ycxgAsVV/cz74tMOYuZyw=
X-Google-Smtp-Source: AGHT+IHyinD9SkChyXfI+RQJ/StIm/oUN7jrK+9h6N1ulVRoekb7+hsK/aHVp6IR97KvlSiq1H+evw==
X-Received: by 2002:a17:90b:35c6:b0:311:abba:53d2 with SMTP id 98e67ed59e1d1-313f1ce5d4cmr34430079a91.17.1750302977932;
        Wed, 18 Jun 2025 20:16:17 -0700 (PDT)
Received: from ankitchauhan-Legion-5-15ITH6.. ([2405:201:4042:d128:bfff:ef8c:5b27:fe61])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3158a25617asm1021494a91.33.2025.06.18.20.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 20:16:17 -0700 (PDT)
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
To: code@tyhicks.com,
	brauner@kernel.org,
	sandeen@redhat.com,
	colin.i.king@gmail.com
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ankit Chauhan <ankitchauhan2065@gmail.com>
Subject: [PATCH] fs/ecryptfs: replace snprintf with sysfs_emit in show function
Date: Thu, 19 Jun 2025 08:45:36 +0530
Message-Id: <20250619031536.19352-1-ankitchauhan2065@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sysfs_emit() instead of snprintf() in version_show() function to
follow the preferred kernel API.

Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
---
 fs/ecryptfs/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 8dd1d7189c3b..0db21e592fe7 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -20,6 +20,7 @@
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
 #include <linux/fs_stack.h>
+#include <linux/sysfs.h>
 #include <linux/slab.h>
 #include <linux/magic.h>
 #include "ecryptfs_kernel.h"
@@ -764,7 +765,7 @@ static struct kobject *ecryptfs_kobj;
 static ssize_t version_show(struct kobject *kobj,
 			    struct kobj_attribute *attr, char *buff)
 {
-	return snprintf(buff, PAGE_SIZE, "%d\n", ECRYPTFS_VERSIONING_MASK);
+	return sysfs_emit(buff, "%d\n", ECRYPTFS_VERSIONING_MASK);
 }
 
 static struct kobj_attribute version_attr = __ATTR_RO(version);
-- 
2.34.1


