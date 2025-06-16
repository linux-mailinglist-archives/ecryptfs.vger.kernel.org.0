Return-Path: <ecryptfs+bounces-313-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7178ADAD91
	for <lists+ecryptfs@lfdr.de>; Mon, 16 Jun 2025 12:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E821A3B1499
	for <lists+ecryptfs@lfdr.de>; Mon, 16 Jun 2025 10:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECA3294A11;
	Mon, 16 Jun 2025 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVCSI9yR"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019DC277C98;
	Mon, 16 Jun 2025 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070494; cv=none; b=SBZeSpMU0/je7DljlyqV0+iQVsBkmGpy7kUWYMZO/N4N4vScj7dXCsiByOKOXnu0FWvHvMeb5NF9kpzMtoVT0y9bu5ft73yMwjhv/TuCtfSkAVXSCng0/b3qkTOafUQqOpRYPbAWNP/AhXk8Y8bimCcEjc8Jb8j7WN8FEEJ6VR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070494; c=relaxed/simple;
	bh=V2vEf1txavranr9WehRAx38ioCKVOHTKJXZmVUR0ohs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+ooKQohl4mxKCk/nd2XKJ4CdQXBFte5DOXYV4DRbqOVqw55JLhadwx9ftJOoI0wM26/Z2sjKRHZUdpb/g87JHMT6l1ruJee3mIgd/5AYniJqQEtjXGp4tWSXJb7uYAw1n0UvWwerHF7UXYVdMuSLS0+orUQ3ssK8mg7t6Tu7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVCSI9yR; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7487d2b524eso2123835b3a.0;
        Mon, 16 Jun 2025 03:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750070492; x=1750675292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7htFOZxdAd0AZk3HoT2TGIMCVLzxW3F5ddbQjitwc+o=;
        b=HVCSI9yRflGQD8nOFwiXHVUJ72x6QdMlCrpnjQfZaKvz7yJse0sFB8HsdknKVVlEmT
         du8qt/s/NHQs7W9BwTCGzqhFxGxsoj8SQhWzjwEgtmUtbxESUlY7M+Ka/bVNCfF6IN4+
         +YnKJZTS5jlL4yHkNVmqhooL43gGBp3MzKRGWJbdEvffd/xJwdA98O0eSHFKIHl5rCFU
         qQoZxmLdUHLyh459nyPTHD3Dxhcx9LxcH+mAs7tiMqIRx6l0arLzvo2giOjEF5b4A9d6
         oGfznHAeiqN6uRtu2II0FNo+bAUXgWsJUmSqxlazc6cnE9G2Vps2OpDQjeCPFionCkzu
         xzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070492; x=1750675292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7htFOZxdAd0AZk3HoT2TGIMCVLzxW3F5ddbQjitwc+o=;
        b=wDWjs1oc/77lygGHgu5iyLWb3BFqkzv6fEbg+rKFrdYLeqZTxXqMlAV5y2d8yirGH9
         1TdG22KGKDGbVgUIvtY1i1uXVFZ0EvSQJgnzw5d1h6ZFU5GiYFDimS4GCvgcSURL4yPH
         lTmFoxNm+1bViZ4ACREwEZpM3M4FUIMFMVeZssOOXKOdZfYSNd1ipTEYIpgpalvxzOfj
         rCWvD3ZL5MmhDCg7n4clnQDFva89pFFCfkYPeYiHMcxQLVByqsmoR/mxhqU5BNS1iS49
         NrY9wJj0aMy7qWD0cVnRCuJRlWLSwG5i7CObWQXf9PtmfCVhhbxI3HJfETqlbSIU+KXX
         8scA==
X-Forwarded-Encrypted: i=1; AJvYcCVbSc37kF/bfsv/gvPeIRLyKaUjXjOOLcGrVo4qytCw6YnD0P3lHGiKsLzjlX8AiPH7B+eSSckT7Q==@vger.kernel.org, AJvYcCX2ycHLKZdvfEuMN0fT12hpeQd2C6VUKd6WeVScwPul54lhfSKUknslZoK3HwmhZoDlyMCQegv1arBdc2Zh@vger.kernel.org
X-Gm-Message-State: AOJu0YzPvlIG42+x1QGRcfosHDYDslGd1bB9MiPuiaw0Gzqoe+yOUof8
	510kWdxugpcTJRRrEJ7sgN0iKf2R7jMaKJZEMLVhtbTNB/0csWMMpqBL
X-Gm-Gg: ASbGncuRoZ6M5pJzFAMGN5kx2hQRI4WwuCegbU4RzPulcVzBxz2vKOMUptwor/JpkOk
	ugVDsY1o/iGc4/afu6pVW0Kc9QAyQN8gvMvOuKUuK09ZhmOvrj3dCciZKKav7yIVED4wZow6zqU
	Qi5H/1GwGq3XXHu4qFTkKqTSWzwDg1vXq6ytUzrvZ5DCIx8dn1mZbiP/MKBPGt2+dWhJBi8hydt
	BDx/Ns5W6q8mEIteHd12OLKHC27UldNb8Lq+hCbeQKr8hlxNJZMwP2L7Hdq5zARCqDtMnz4bP/X
	J5OwvAz1++uiuYL0qK7wLcwSN57H+EsflEPoBja6Ppe9C11jbm0UyaMEFRBouPRRMcDt7nALoQj
	kSJ41mDc=
X-Google-Smtp-Source: AGHT+IHJOJ6onIIMZqicZrrWs0JqkgSdx0gliCNfsg73RZ0DBjdADGctqIxGkjQ/9vTtLs74zMRE3w==
X-Received: by 2002:a05:6a00:1994:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-7489d050f48mr14158247b3a.24.1750070492184;
        Mon, 16 Jun 2025 03:41:32 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083ba7sm6669992b3a.102.2025.06.16.03.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:41:31 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: code@tyhicks.com
Cc: brauner@kernel.org,
	sandeen@redhat.com,
	colin.i.king@gmail.com,
	skhan@linuxfoundation.org,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] fs/ecryptfs: use scnprintf() in version show
Date: Mon, 16 Jun 2025 16:11:20 +0530
Message-ID: <20250616104120.370832-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all snprintf() instances with scnprintf(). snprintf() returns
the number of bytes that would have been written had there been enough
space. For sysfs attributes, snprintf() should not be used for the
show() method. Instead use scnprintf() which returns the number of
bytes actually written.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 fs/ecryptfs/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 8dd1d7189c3b..2a97c2b1fc69 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -764,7 +764,7 @@ static struct kobject *ecryptfs_kobj;
 static ssize_t version_show(struct kobject *kobj,
 			    struct kobj_attribute *attr, char *buff)
 {
-	return snprintf(buff, PAGE_SIZE, "%d\n", ECRYPTFS_VERSIONING_MASK);
+	return scnprintf(buff, PAGE_SIZE, "%d\n", ECRYPTFS_VERSIONING_MASK);
 }
 
 static struct kobj_attribute version_attr = __ATTR_RO(version);
-- 
2.49.0


