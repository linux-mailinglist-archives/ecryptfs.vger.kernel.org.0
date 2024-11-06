Return-Path: <ecryptfs+bounces-222-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A60F49BDD06
	for <lists+ecryptfs@lfdr.de>; Wed,  6 Nov 2024 03:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B7AE1F2190C
	for <lists+ecryptfs@lfdr.de>; Wed,  6 Nov 2024 02:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E171D0DF7;
	Wed,  6 Nov 2024 02:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfwlKML7"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF11D0BA0;
	Wed,  6 Nov 2024 02:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730859961; cv=none; b=ql/YuZ78go72SDGVTZNt24pZge+Fem1swp8cKIDpqSd3IiD/FTAs4LO36C5LSzy3Ssm4AFX4YdUEuPaMmrHbSN/eiQTDu7qpWGoHV0uoacOHqR7M1qXLxSyVtHF+QMtDEKTUCzmlhmUwH/8HqmtF8GX4KqUcbslPW5cOLkkK9ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730859961; c=relaxed/simple;
	bh=Ga2D97KZpZQx6YoyIZmGok19w3T5OcLWLUO8jQGvZpk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=jFAtCnwIFw+ynRoAW5MuZqgUQsM9xrLYxFolB+oUDvNsABL1A+VM94WShAQ3uj4W3ZbL7bMF0bFdJ3FaN2vz/xrpFDEq4VXBn8H0PqdSGY//+cLOOlY3ETNRaiCmSffxfB8lm8TGUlLTHaU9ZyLVYvWZr+60MzEYAAO0/ObQNtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfwlKML7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2110a622d76so47330895ad.3;
        Tue, 05 Nov 2024 18:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730859959; x=1731464759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QId6zyuhVAFO0zUHn6SCG/UmTpu93h5H3UtKXVtla4U=;
        b=nfwlKML78XfWDoapTQpe7dNl17/gGl3761FA48v0czV21Fzgd+NMF1yDkZEzB2dm4T
         zMqJPvcDInS1gPawpmev3Unk/4QMwQW7nbSQn+ijQK7NS6dWtHW1Vh0nlmB6zXIUPWzK
         ih54w+j/MBsAD/bHztKVkHZ5M2G9vBUWSGYzhV8+afHsOig1qvs3xe4iyew2ftTdQvFq
         JyT+9GfMLyBbsH51D5+O5j9LFZBT2yaIlgGUpKYbAqGb/W49izruHu0bS5cKyTZPi2Z3
         6P3YnuYQjQMImTGUhz9KJHy7yPodovjyYck1jYYod32U5zITp+SlfyrthWAW42jCmRer
         21Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730859959; x=1731464759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QId6zyuhVAFO0zUHn6SCG/UmTpu93h5H3UtKXVtla4U=;
        b=sFV7zLzK6RzK3l7DWiiXmo0xNTc253+U3y16o73Jfsc64nwpsCR18r0zRtgdQ57Y4A
         b+0kuD9WGayLi4bZx5xaDUQwDhIzI+iwM1r6nBJTaCx5ec7B9sik/9md/E50hyQ+Qj1c
         kVhTutD3XJYfi65UnsnPAjOLVhlBLUXj7r8wLTedqTN3mRUn9Ievupj8Th7WQRaPPFJA
         VX5KuCaOag1HBs9OVwm4Xn6r2r9NRKTlNv4xPlMJVlf7IBJTRhI7VRxsyIA8S5Rp6Aqr
         aMFRWC8A6TuFZHmfC7Khs7rRh02e4qikTi3vlG6M8BN1PE/0ekadPU+kG6ZI7/waKSsY
         +Npg==
X-Forwarded-Encrypted: i=1; AJvYcCUBiGI+Mi+gJxpRh8B7CIgQqewTqvtbaEItXi1L0/bZRSvG6qbKxPa8JaagaJRYmH6bmA6P4L77Gw==@vger.kernel.org, AJvYcCWGGPAq047Qsbv9fB8fIyFAggn9K3QcY2W5cAI/XMoG/hdKD0gWLq19aNN3yYPTujmCBWE658shD6TkFmvg@vger.kernel.org
X-Gm-Message-State: AOJu0YxUC58ZkUQQtkmiuwnNQ5S0o1EjpdIsRE/ykootNUynNSzeD6UJ
	tFBePgjMR2SuxxJdqpk8BO6RCigcuqv4rcw8oHZceEi6j4K+N7z3aZFg9ourT7Q=
X-Google-Smtp-Source: AGHT+IEpy/fWWcNr48m3F6c9ydWhFBd5TIPprNIIhpRemXcuysthbsmRuuS58b9DvRfzLAMjcKHKrA==
X-Received: by 2002:a17:902:da91:b0:20c:82ea:41bd with SMTP id d9443c01a7336-210c68d4349mr511610375ad.18.1730859959173;
        Tue, 05 Nov 2024 18:25:59 -0800 (PST)
Received: from debian.resnet.ucla.edu (s-169-232-97-87.resnet.ucla.edu. [169.232.97.87])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21105706891sm85661615ad.69.2024.11.05.18.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 18:25:58 -0800 (PST)
From: Daniel Yang <danielyangkang@gmail.com>
To: Tyler Hicks <code@tyhicks.com>,
	"GitAuthor: Daniel Yang" <danielyangkang@gmail.com>,
	ecryptfs@vger.kernel.org (open list:ECRYPT FILE SYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ecryptfs_parse_options(): Replace strcpy with strscpy
Date: Tue,  5 Nov 2024 18:25:26 -0800
Message-Id: <20241106022527.493421-1-danielyangkang@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function strcpy is deprecated. strscpy is recommended to replace
strcpy. Instances of strcpy in ecryptfs_parse_options() don't require
strcpy return value so the different methods of detecting truncation
shouldn't be an issue here.

Signed-off-by: Daniel Yang <danielyangkang@gmail.com>
---
 fs/ecryptfs/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 577c56302..d0b8ce70c 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -379,12 +379,12 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
 		int cipher_name_len = strlen(ECRYPTFS_DEFAULT_CIPHER);
 
 		BUG_ON(cipher_name_len > ECRYPTFS_MAX_CIPHER_NAME_SIZE);
-		strcpy(mount_crypt_stat->global_default_cipher_name,
+		strscpy(mount_crypt_stat->global_default_cipher_name,
 		       ECRYPTFS_DEFAULT_CIPHER);
 	}
 	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
 	    && !fn_cipher_name_set)
-		strcpy(mount_crypt_stat->global_default_fn_cipher_name,
+		strscpy(mount_crypt_stat->global_default_fn_cipher_name,
 		       mount_crypt_stat->global_default_cipher_name);
 	if (!cipher_key_bytes_set)
 		mount_crypt_stat->global_default_cipher_key_size = 0;
-- 
2.39.5


