Return-Path: <ecryptfs+bounces-232-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D29CCA0AF46
	for <lists+ecryptfs@lfdr.de>; Mon, 13 Jan 2025 07:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1596D3A86C7
	for <lists+ecryptfs@lfdr.de>; Mon, 13 Jan 2025 06:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1322231C8C;
	Mon, 13 Jan 2025 06:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VttzT19s"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B85D145A16
	for <ecryptfs@vger.kernel.org>; Mon, 13 Jan 2025 06:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736749158; cv=none; b=BgNCUKGBziYVzgDJgVlDdrb3CwLR0MvzNnDFaTB707B/ywJAkU5DhOjCt/H2UNKCp2Y8wCpiAPUQHaN4S6sk2BGIvGbSrmXyEalXaU2UovBi4scE0KAj4IdRYm2F5ZGsAZFe9/XgNH3hZclHCJ3eshouMYz67DnxX/UHTDGborQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736749158; c=relaxed/simple;
	bh=JS+4J5lh8Fucg3Gbhf9aAPZyh0H2XmOy45D+czstqF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gXE7QiT3MpPbMJI7oiZwEvboTr36CDpm5OkS+aNYW9VBO+t4tzCWrLE4OgJ4/SfubSZiiiwWhTCH46+KQlqK+LMq+rDeRkeAVivlBHSZVs1FklsIbPgYkEN8rK2PEtTW0hcwQnlRyJAolP3FyXRwSoYqqwJwm+JG3s5kkoC+FbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VttzT19s; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso704071066b.3
        for <ecryptfs@vger.kernel.org>; Sun, 12 Jan 2025 22:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736749155; x=1737353955; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsRvXHGSWUxVyT3HvHK3zRMHjp5k3n6wAVlQb9UAIoo=;
        b=VttzT19s66sUUcMCO9MYS2mBazY2P2Ck+IqK7m/+bmpljh4he/aEoMagid9FIOR8iM
         Uoed4Btr2vfkfCO7HNPO2sYVLmMs2SOdxNzq/m2fmcIySwfmeN/UletaUa9sVWGsd+DQ
         nZtAmlBHOnhP/C9L5WbcUNIhuvftBGF0KHvPQRFma5Bh03HyzWyQkai2bQd9Zzox3v3K
         V38kh0LQ66EJOSVa0m6dVV1OzHhblIJfjoa76QQMm83w8XCKVp6WS5ZpKW64ZnxW7YjX
         kOxGDonShA/XD99/SjhOjPyPg07RSAFjGGCM42xMiI7WTy6Wvbx3o4GXz5Q6iDNZt0wc
         MAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736749155; x=1737353955;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsRvXHGSWUxVyT3HvHK3zRMHjp5k3n6wAVlQb9UAIoo=;
        b=ACncDR1bxUmzz28R3DYREjWCEfjVb3qZkTL2uHmv1dGvE1QS3nS95kULLHEh3b0amI
         lzoCmLhIaduROcK880jNRhUOVd6e3ODlHJDosIF61QCpWEn/s+u2jB/1FmD1BZt3fEYR
         yZiQMfQ9ido347qq9SnmfoBskkc6Es3HNkQFGqs3APeuuwmIUKsxtPMoJM9g9eYo9FUt
         yhh1ef4OtFa5PB0tvaZuLCnMiTzagVP3vVnI9Or9JuMOb8g7P7QZWpusXPQ+i6A2xkws
         PYcF8+NkHMRdhhfdvWBSB1la+nAxGQwd/EdpHhCiDJbdClUaP89TU+WCzY5v1GdXXFDA
         XiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiMBiowVdiSE/O6ymqS6A3cIuC5vLGFWobkBCglw/sJTs8RATvCtAX0sd0szSCWsPSj36EcxRByw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0cSpLW9ZdA4+JezQLS/leY1zP5iw5LH4ZLMzFpnCk65XpAc9P
	vbSvrsCJxsLJWdohCrezj4kz2iIbAgjwTD0MEqaueRFqfy98pT4Q71VbHx/Euvo=
X-Gm-Gg: ASbGncu6ZBHilxkphzbcWPEpi+J6dXcJy2a9zbQPsaVDZQMdsKvCmod2aq47mh0jGdI
	XP0JNi4I+iYZXOSy5CkLVtHrzqm7D34B07gkj6yVnyddigGBH6o9KaWR/p4jN0oELUIMRKvL/tf
	Oi+x40lpWPy9xZOjbpMN4nl4+CQV8K9TZBNDStCZLgOfXy/5fOmHt/Xkvo2Op86qn+2Ue7eYG++
	ezUQd1jzrUNbZnQmjGkz/3U/QBbcnf7E6hME/CrIHE2fK4p7YvdYF0SZACslA==
X-Google-Smtp-Source: AGHT+IFqpX9e3c3D8tjbJ4iafdBuamD/RqHrGmivwZIPI4DdokOcWz0agCCvtb6wFgzixam07yQ7Rg==
X-Received: by 2002:a17:907:c0d:b0:aaf:1183:ec2c with SMTP id a640c23a62f3a-ab2ab6bfc89mr1610144966b.5.1736749155208;
        Sun, 12 Jan 2025 22:19:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060bccsm451648166b.22.2025.01.12.22.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 22:19:14 -0800 (PST)
Date: Mon, 13 Jan 2025 09:19:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Halcrow <mhalcrow@us.ibm.com>
Cc: Tyler Hicks <code@tyhicks.com>,
	Andrew Morton <akpm@linux-foundation.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ecryptfs: use struct_size() to prevent in integer overflow
Message-ID: <cb70e767-1498-4b5b-9d77-0270a6548ab6@stanley.mountain>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

On 32bit systems the "(sizeof(*msg) + msg->data_len" addition can lead
to integer wrapping.  Use struct_size() for safety.

Fixes: 8bf2debd5f7b ("eCryptfs: introduce device handle for userspace daemon communications")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ecryptfs/miscdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/miscdev.c b/fs/ecryptfs/miscdev.c
index 4e62c3cef70f..88882f96e06f 100644
--- a/fs/ecryptfs/miscdev.c
+++ b/fs/ecryptfs/miscdev.c
@@ -325,7 +325,7 @@ static int ecryptfs_miscdev_response(struct ecryptfs_daemon *daemon, char *data,
 	struct ecryptfs_message *msg = (struct ecryptfs_message *)data;
 	int rc;
 
-	if ((sizeof(*msg) + msg->data_len) != data_size) {
+	if (struct_size(msg, data, msg->data_len) != data_size) {
 		printk(KERN_WARNING "%s: (sizeof(*msg) + msg->data_len) = "
 		       "[%zd]; data_size = [%zd]. Invalid packet.\n", __func__,
 		       (sizeof(*msg) + msg->data_len), data_size);
-- 
2.45.2


