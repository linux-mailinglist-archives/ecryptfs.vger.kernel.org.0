Return-Path: <ecryptfs+bounces-367-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBC1AFD6C9
	for <lists+ecryptfs@lfdr.de>; Tue,  8 Jul 2025 21:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 339E148224B
	for <lists+ecryptfs@lfdr.de>; Tue,  8 Jul 2025 18:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3A02D9EFB;
	Tue,  8 Jul 2025 18:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNIplY/R"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997E51E49F;
	Tue,  8 Jul 2025 18:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752001195; cv=none; b=rnSM6pv59jNxl0mNZuVTp5/YyGqp7KexhUdhdOX/ONwXqmHAM/80zQfNPxxRyG6PhfrLQrz2uyFSHCpGncJSCo3Gz/+SnYimPk5GMy1Ur/Kch7NHFJeGnMLrBe8BO+hcnt8x7ADBk3Q+YciIo20QSPKLBvPV7ersw5tC10V61BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752001195; c=relaxed/simple;
	bh=TeS60sUn4j0Wulj1x+TWWeWPocHoeNtloW7UhMzJ0Jg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FUIdxqaJAvODvDjXwKTIcoRT1Z8HXP7uNoMHDSbq5l1vVoyoEQgiJO8CPWINT4rIU6OrEPeioH/L5D5hCnwSPKFJa0Stc4mAq1Y3AR6uUeWNOz2tKxYe4ATDyi8oG2VtT5xJfY2BxiIvambmmyiZ2jpHzIseuHniGZfiRqgYBwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNIplY/R; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23c703c471dso2154385ad.0;
        Tue, 08 Jul 2025 11:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752001194; x=1752605994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+gvODUlXN4NLeum/nW6S/O9Ef8OE2ZIogcGd1tvbSg=;
        b=kNIplY/RO+kPgQKbe4G5j43z+tBwXKE3lWtwPuvKs5zT+yZWBn+bWFL3SxGgBy8NjG
         4FyNOyhsXes25380p7rGCjJQf5Rrl2+YCbW2ZAI4ZGyWOJFJCVY35PEEYsoiIEcteFHv
         1/mULhiAVmGbENLbs7QeNzszggOJHK/6VTSXunHopgtslHG0+Vv9aVcnrPx8TFpc3iq5
         Xhvwvy4xSGmdksxcHma3mVSseeECnOU/quVaHR0uln4GQ4IjN6wjtvHZiEDgocLtVhmF
         8CL0JoJoV+vFkiZ2nxJqU92d1wFK6NE5ArqfLnJRH6BC6TMhdGLpvYo/tQ8DSuL7oruz
         3Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752001194; x=1752605994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+gvODUlXN4NLeum/nW6S/O9Ef8OE2ZIogcGd1tvbSg=;
        b=Dc+DoJ83zG4oyukrF1ZyVFpPM0YHMx7r821lc34S2vaR3Azml2wtIdmKTawTBxrSEF
         1kIBDDO2C5V1kAtvJDUSjSHysWy0bAT9gLAxE+d8wlzsI8gF40GKWAtcKD9fqxm6dIFa
         KFsA5I4c/MKLb8lGQX4taLW0Yq2ZUOixhvzSn2sJNlVXyx/F+b05sXIdWwfMkVTDh70M
         SHPX00FSW6vQfsvd5Bnrh8A5DtNrw5pmud9Xt+dZpVB+CgFJVsqUqVtrHsf/VxybkKlO
         gePyQZ9/d0Dgnpzg0C4DfV1PVw59gz1rGVZxkhLGddXu807WYDghMoThYg3qNuiyks35
         iJ1w==
X-Forwarded-Encrypted: i=1; AJvYcCUtfLZWN+1FB4d9Zu2dF12ibmB/K1fNVyy8uhGhcpxfXZl871VbR0Hf+S8llOBhZNlwW+GnlmS0q6OfTXOj@vger.kernel.org, AJvYcCXBMuekKm01N0ScMW9w8pnrF/JUEoTw0SEC1nuFnmiHiewVHb58LxgYgwAZYGcj++wgy/zl2fmvMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4m8tNJTti+S7olE7HTiWzbUyXg4daTDIqCJAJeQg023qpKBlN
	H17rcJNglnlu2f0ucojQOfFDrMSix9JiaSdB3IIcKVTvSaF4ChKafe8d
X-Gm-Gg: ASbGncsfJsyHdZa9SJz/mT90UVr+fVsV4LRm09T/1OhMOiCOMdPgBy6bvP3yWHaFrIw
	OoqmLygWZ9lnP2XIG0oIWfUedsTrjBqfO3yWIVeCpYjsqqng0w3/pt04m5IJVSIERrZJOMKTUfG
	IQUnTvMsOprVTJ6QrFQBRMDNojv0wCUZruuMt5GazSnTSEiU0MHAhY6EiwtipEtCsjXxhkxuOFY
	mvN614f/ovMr2i/TMAVToL9VyBEjp8r2+ONse9tGeHvmy4zKYlpkaBSFo2RYtZYReK/3eFr+jMc
	rCl6ulEM+TNQgEIeQG+9ArIIKHm0+5GNHl3k1fmx73y5ilu0x/8SORiqymGRGEyru2jc
X-Google-Smtp-Source: AGHT+IE/oa63F/9FooZ5+tGC6XFDIN1ywTCearL0G+jYx+luItA5BkR2R0tgt/UPkITS61JuA8rUtw==
X-Received: by 2002:a17:903:1d2:b0:235:278c:7d06 with SMTP id d9443c01a7336-23dd1cdf703mr50478875ad.8.1752001193764;
        Tue, 08 Jul 2025 11:59:53 -0700 (PDT)
Received: from itsmeut.. ([103.215.237.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845bd366sm125892145ad.240.2025.07.08.11.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:59:53 -0700 (PDT)
From: Utkarsh Singh <utkarsh.singh.em@gmail.com>
To: code@tyhicks.com
Cc: Utkarsh Singh <utkarsh.singh.em@gmail.com>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brauner@kernel.org,
	sandeen@redhat.com,
	colin.i.king@gmail.com,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH] ecryptfs: use sysfs_emit() in version_show()
Date: Wed,  9 Jul 2025 00:28:16 +0530
Message-Id: <20250708185815.6708-1-utkarsh.singh.em@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs_emit() helper is the preferred way to format sysfs attribute
output buffers. It provides consistent behavior and prevents potential
buffer overflows.

This patch replaces the use of snprintf() with sysfs_emit() in the
version_show() function.

Signed-off-by: Utkarsh Singh <utkarsh.singh.em@gmail.com>
---
 fs/ecryptfs/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 8dd1d7189c3b..49b8024d6c64 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -764,7 +764,7 @@ static struct kobject *ecryptfs_kobj;
 static ssize_t version_show(struct kobject *kobj,
 			    struct kobj_attribute *attr, char *buff)
 {
-	return snprintf(buff, PAGE_SIZE, "%d\n", ECRYPTFS_VERSIONING_MASK);
+	return sysfs_emit(buff, "%d\n", ECRYPTFS_VERSIONING_MASK);
 }
 
 static struct kobj_attribute version_attr = __ATTR_RO(version);
-- 
2.34.1


