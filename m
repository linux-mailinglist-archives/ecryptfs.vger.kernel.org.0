Return-Path: <ecryptfs+bounces-80-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E68B1786
	for <lists+ecryptfs@lfdr.de>; Thu, 25 Apr 2024 01:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97538B21BAE
	for <lists+ecryptfs@lfdr.de>; Wed, 24 Apr 2024 23:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7FC16F825;
	Wed, 24 Apr 2024 23:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OGpXuUG6"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6EF16F291
	for <ecryptfs@vger.kernel.org>; Wed, 24 Apr 2024 23:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003077; cv=none; b=OgKQtwtAGlSak3ZhN/UHj6NQsSKZqJwkYSHwiKKcV964A10qTnOYLTXSqj2zWR9pOBvR6o+i/r6C7kF0wx154ByptUAJ59dsGwyMJ82mwIcVWUZjnRPGLXJYEtWcKTW7mrtVn9WeBb5waJqmtLtceMqg7/WRL6Ew7AE3327Ca2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003077; c=relaxed/simple;
	bh=2BPOK2dXp68uRp32sm3Gx35HN6cr79+4gRYJiNQfSb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cOhGIvxaF9IioPabX922peq/WhDdNGjKrJNwsCCopx3+Vtka6dcuJCFkqP2yvMnLLZs2GCx/MnSB7ftjivnRHKWEEo+0aWzGh+qJGrRlNhCikUjndKQ1FTTLjFi/dqWlkybmDJp9uRiPli2DmtDltTzl1r29PajiT9lOAIf4cTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OGpXuUG6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1eab16c8d83so1370775ad.3
        for <ecryptfs@vger.kernel.org>; Wed, 24 Apr 2024 16:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714003075; x=1714607875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e23zJ4CHX7X9QHhycswSvTOYU8EPrilYR7yjQqTKu0w=;
        b=OGpXuUG6Wkwod7xRqgxyzZmooVCbNdmE1ig7rqUoSx8FjAW5zJ5xm5DjC717BX4t1i
         KQmPN4+Z1stCbQSXEprOyU0F3FSImrrD6FecJakpDxIsMXQisRv/dDvpXuPzb9WvJIhj
         QYitEDyrr52UxMLEU8jfknewcrKs/HSnTfoHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714003075; x=1714607875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e23zJ4CHX7X9QHhycswSvTOYU8EPrilYR7yjQqTKu0w=;
        b=Z/v7q+AR8SemO1459PrpK+yZ6If6wXx6nvGAf+zB1q17wJQOLjohj8lVLokf9rpc3f
         TnA5o8NjzoqFU5AcfbxoZax+9IomreY10ypzhl37TwSvzVhqnRt/O5q67LGJPc/lsNiE
         xH+l0I6umvJU/876oq4z+3gl95ld/9KcR3BQ28fO8O/xVtlNtOT1oCHN52MrxY2P0qj7
         TCr4oGJeFEdHGAvOtwvPkuJDbzlyEWlCFr8GVQaPAKjsbVeSAiCzryRrD/ERWbgpDfk9
         qFn13/HWVyn51jjtv6BuQYsBm2aW1Uve7UM+iqujw+luPg4fnh1tp+tSpHAsrvfMHxaD
         Ifdw==
X-Forwarded-Encrypted: i=1; AJvYcCUlYCYn3K0XZEL3KMsmvU+4DA7Rf+E0oQA8c8v9At90OfI60LRSQbPr/Fc2m98FZcnieXaaS0gxb4uLiDWCy9kIzWCotp+g4uI=
X-Gm-Message-State: AOJu0YzYEbhMLedND46n4ZAvRlWSVTDTGcPhfd6878C6RxfJ8nKFGvFI
	CeQaAn8Q8t+7S0hVmmVz0oEfxx24SfOtEyVv3KszVNZoO12bZMd2SuHnaHKBQA==
X-Google-Smtp-Source: AGHT+IEg6R3vEh56TTakIcvssFRBm6oKPIjqtowedm88ZBAYnPxmpoFXQv3vGsHKFQfG284GpQnxiw==
X-Received: by 2002:a17:903:2445:b0:1e5:4f00:3751 with SMTP id l5-20020a170903244500b001e54f003751mr4274814pls.3.1714003075262;
        Wed, 24 Apr 2024 16:57:55 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902780300b001e7b8c21ebesm12661739pll.225.2024.04.24.16.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 16:57:54 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Tyler Hicks <code@tyhicks.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] fs: ecryptfs: replace deprecated strncpy with strscpy
Date: Wed, 24 Apr 2024 16:57:48 -0700
Message-Id: <171400306698.3284237.12157230203492551357.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321-strncpy-fs-ecryptfs-crypto-c-v1-1-d78b74c214ac@google.com>
References: <20240321-strncpy-fs-ecryptfs-crypto-c-v1-1-d78b74c214ac@google.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 21 Mar 2024 00:38:54 +0000, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces. A good alternative is strscpy() as it guarantees
> NUL-termination on the destination buffer.
> 
> In crypto.c:
> We expect cipher_name to be NUL-terminated based on its use with
> the C-string format specifier %s and with other string apis like
> strlen():
> |	printk(KERN_ERR "Error attempting to initialize key TFM "
> |		"cipher with name = [%s]; rc = [%d]\n",
> |		tmp_tfm->cipher_name, rc);
> and
> |	int cipher_name_len = strlen(cipher_name);
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] fs: ecryptfs: replace deprecated strncpy with strscpy
      https://git.kernel.org/kees/c/9a2780409552

Take care,

-- 
Kees Cook


