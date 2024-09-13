Return-Path: <ecryptfs+bounces-147-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7D497849C
	for <lists+ecryptfs@lfdr.de>; Fri, 13 Sep 2024 17:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7459C28B217
	for <lists+ecryptfs@lfdr.de>; Fri, 13 Sep 2024 15:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3DD39FCF;
	Fri, 13 Sep 2024 15:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="DI9NeCf/"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636923CF65
	for <ecryptfs@vger.kernel.org>; Fri, 13 Sep 2024 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726240452; cv=none; b=LyuyyLdYaBw47N/8uHgQ/GjMUObKqOr1vnAJFe0Pt7TcmxZRK8wB1y7GD+IVJe7zrDaxcKh07JYdb0M9Q6OZNbK13KvooBGQrZdqrSmWSRwALK1mZ+6MEmlGYKx/vJc95yRSJftxTHVTCjrLtFtfRq+dL4eJL5/z2vaRnDxamRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726240452; c=relaxed/simple;
	bh=ObR1hv+IAKGE5+n+M0is6uawqsDYZfHJC1dew87zhrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=loajX5TRFuF8Paw1LVcz+b49zxg+5S4wSj5HLb0RxAg24HjR0jve/p1OKH89QYjehGMoJHFX9OjBrNoVTuKr/gj3t724PlEdOmMz0VfOUfWMHAFxT9hBPMzDSkQ9xkQkSx+3U1RPbMplXaU6JtfWL90YtjxyXCb9AHMgDD4+1kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=DI9NeCf/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8a7dddd2aaso24693466b.3
        for <ecryptfs@vger.kernel.org>; Fri, 13 Sep 2024 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1726240449; x=1726845249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L8fdMxO/k8qc0ST3VA5tQCvA2jXHRUDqzGSRYQgGklM=;
        b=DI9NeCf/JleUTkjvFLXhpFxVjPOCJs09HPZYA4fik/tv2xWAvn9EsO6HK3xNMDmJzK
         oD61fQ/tviTBSWdX8DlUxyonVu+buXIO9P5aPsnrL962OzmU9U4bOWNUUiW5QhZyAlTa
         4huhQY+cFG4LWoAkaPq/19p9cRj+Ny5PYLSbjG2MH2L7SnpsNZl/NPUUCstfXfpZHBGI
         8tnxuooQ0HfF/5ItV4/bCkoHaHVgTvhferw19akLP4PYkrdnoWwQ9GdFAuYLM7X7lB2e
         1xyXqN9HSO3BZKvC66+W08GGHAxE6Q0ubnWQrGEYPaoZDKQFqEaeEEysi4xl9o+ccnmo
         z4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726240449; x=1726845249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8fdMxO/k8qc0ST3VA5tQCvA2jXHRUDqzGSRYQgGklM=;
        b=mxGDyUn5B67H+nTar1NrGr8PdNNBi1IHy932JS+FFSUfcDNam/sY62DaAfpUVEzPfF
         BJbkiXM/FpPtpW/RAqhRPh83TMPd+RiavwM7SNrfnDVxatA+dPrRG+c1ciER2o/wEaY0
         8gUgrJv0QBaZDj4JGS09ilXqN8JOV4W806lR08tUcz2r6AUvGXNpkvWuFakseivAzecD
         bj7W5KPUs4mrx7c4PuajaDVEqrJtN9sNw1C6wtuOeM8sbgaf0lhvSp6dyzfmpKOw3UqK
         ajyd3s/f/MHoOPy/qS5VAFR9xrX4jqTjc9RklELZdh90Gq0aES3k4LR0K3s0jOL8YOLW
         /DjQ==
X-Gm-Message-State: AOJu0YwgMCvT/Boay7WvI8OUYD5S/3gXXAVrl2tbF8ebIGMRgCMIzkIG
	/HhH3PhDcxWNNhXR4HH/bbNbgdJjwLztHw2UULTuj7Za/1OHxAwzaUAoz06qO3OlMhZqbSX9LTv
	zNq4=
X-Google-Smtp-Source: AGHT+IESEFf52KK3gQ6/Obz07u+t22G9YTRLjzPmfPgKfr3PV7ud54s1CMUB0Y1gA83xviOaxXi6FQ==
X-Received: by 2002:a17:907:9810:b0:a90:136a:4de2 with SMTP id a640c23a62f3a-a9029435418mr282112666b.5.1726240448587;
        Fri, 13 Sep 2024 08:14:08 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-245.dynamic.mnet-online.de. [62.216.208.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5491asm876222966b.198.2024.09.13.08.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 08:14:08 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: code@tyhicks.com,
	brian@kubisiak.com,
	brauner@kernel.org
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] ecryptfs: Fix packet format comment in parse_tag_67_packet()
Date: Fri, 13 Sep 2024 17:12:22 +0200
Message-ID: <20240913151220.2688-3-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s/TAG 65/TAG 67/

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 fs/ecryptfs/keystore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 7f9f68c00ef6..7266fc1a5fc4 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -355,7 +355,7 @@ parse_tag_67_packet(struct ecryptfs_key_record *key_rec,
 	int rc;
 
 	/*
-	 *              ***** TAG 65 Packet Format *****
+	 *              ***** TAG 67 Packet Format *****
 	 *    | Content Type                       | 1 byte       |
 	 *    | Status Indicator                   | 1 byte       |
 	 *    | Encrypted File Encryption Key Size | 1 or 2 bytes |
-- 
2.46.0


