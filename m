Return-Path: <ecryptfs+bounces-224-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE1F9C1C24
	for <lists+ecryptfs@lfdr.de>; Fri,  8 Nov 2024 12:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1481D1F21B3F
	for <lists+ecryptfs@lfdr.de>; Fri,  8 Nov 2024 11:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102F21E32CE;
	Fri,  8 Nov 2024 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZIDgS/2"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EF11E3DCD;
	Fri,  8 Nov 2024 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731065114; cv=none; b=BU+iZEHlHDZjB4clD5iabORKgJj1x5A27YxsW3twDhK6+dXaREwEe0girB5eT+W6FKCqQVDh23NaixFIzwNWRUJIGjkxm9OvWxdkMzbAZrt2tRiMpFO8/yK6aobZKfho8KUOzo63qPlVRnPm90yxV0o7qNEIR3YMAHEU0vdBHys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731065114; c=relaxed/simple;
	bh=oorU9etKZz31ATOvsE2qkwWf0ZAysP4RE7tBX3sYQJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=psUAkZF7eU6ePU3fsGhnZIeMIrFjIasnN/G4SzemzOrrkgaM7XdztSUY5CgZ5VY7SQ3dGaCfIkDgzZjKEgDO4PwXw0EbE8b01RrML47FB5CJVEMdAPkaXARMWno8Gq7WsVR+9u52Uh5GzWyiWuGRFDXbSh1pPcK6+9wMx82ZJ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZIDgS/2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4314f38d274so23726985e9.1;
        Fri, 08 Nov 2024 03:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731065110; x=1731669910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lPPN5xIzS/w8CYU5eR0ocFrGPTZX7vjfWAjdag9gQtg=;
        b=UZIDgS/2nA5OyA9Jz3qpxw+wBnjTwp3U6JD8dWfpS5Ze2SYbiKK8//1ZMn9smn2kbd
         +6fyrzhcNPH2dDmSfQl6KN6B7HI8PmMdfx5SrFFyCRB2sqzSXYGlZqyKSOfXRUD6NwOZ
         udZRDmxPnehT83lFluiY6E7Yti37oy14joHJ7NKGH7LzXXpF47PbgEG/M/yBFrI4pCAu
         je2rb8o5TkiUKL8DAWJfN3Qp8fZXQPFcdxpBC9oUdyD905sLSZAS4AGENm12RKAhcYe6
         3uGiRjdSwn/I+nkMeTWsowEp/iHqWQ0KYaucLPvSM5vATOw2m15A5j7+rMrgPEZyUWVv
         mTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065110; x=1731669910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPPN5xIzS/w8CYU5eR0ocFrGPTZX7vjfWAjdag9gQtg=;
        b=EOR+8ZBoIHYm4bomZWJXeJCpjwz2BhdMoK2KAZkVqwYlDEWB/RD5OVpBhzB3mVUrqv
         XX4qto0bBjgQO/ylXi7MXnsZFotGyLC4DdIqayJd5eriIyn3E0iYGSVjfZbyvN97kzqr
         ZnVBSn0Dw3rQXM/dpd9oh5gbfKiVplFwnMK0E0/dF0ro9JB/EncLBHL96tNfM43gAirH
         o66tZWt0bwd1WqElRLYO9ZOUK/jCRz+E5+/tB6nBGO9r6tQS4orb5cjCKFDYRtzPYe/t
         rlddFQizeF+JS7a1S6zPJTyDkU+aU9AX7RWcv1vMUF9asR38jG1g4KzaYZaxR4q62YXR
         onbw==
X-Forwarded-Encrypted: i=1; AJvYcCUypt+VXLoIT1rKKEkMZUVN0RtY1LH2F3NNMy2EsC+qhxwjAipLjG/NoxrAt/0YfY9Ws3vcYBprxw==@vger.kernel.org, AJvYcCVkcEDXDVIoQSFOTblgQ+iIxa/SRAOdwgM9LUbHidJ0q3wh9F6Hogpkjgmvby+YTEEJO7wNaeUxqTWlL0Ck@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0HoWC2rAnYEr+4F63oAIVFr27GAeSWMDk6lrqVt/xBOfDpxKe
	1cHngyhCW6+0joSVQnMlnnBr/6GKYv6Fqp+x26gV7uFO+CeLwOqN
X-Google-Smtp-Source: AGHT+IGtCu/powZ0rYyIfXvvEAudEgsxmtLbffeMfZB/PaBUVK7ffLSIvMWZ1WHorKPrLM/ll51prQ==
X-Received: by 2002:a05:600c:19c8:b0:431:4847:47c0 with SMTP id 5b1f17b1804b1-432b74fec2emr22646035e9.7.1731065110415;
        Fri, 08 Nov 2024 03:25:10 -0800 (PST)
Received: from localhost ([194.120.133.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b5e8dsm100926605e9.6.2024.11.08.03.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 03:25:10 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tyler Hicks <code@tyhicks.com>,
	Christian Brauner <brauner@kernel.org>,
	ecryptfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ecryptfs: Fix spelling mistake "validationg" -> "validating"
Date: Fri,  8 Nov 2024 11:25:09 +0000
Message-Id: <20241108112509.109891-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in an error message literal string. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/ecryptfs/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index c9aa80e534c2..8dd1d7189c3b 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -451,7 +451,7 @@ static int ecryptfs_get_tree(struct fs_context *fc)
 	mount_crypt_stat = &sbi->mount_crypt_stat;
 	rc = ecryptfs_validate_options(fc);
 	if (rc) {
-		err = "Error validationg options";
+		err = "Error validating options";
 		goto out;
 	}
 
-- 
2.39.5


