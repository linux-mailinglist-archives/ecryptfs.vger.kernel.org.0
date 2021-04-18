Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D932363707
	for <lists+ecryptfs@lfdr.de>; Sun, 18 Apr 2021 19:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbhDRRi5 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 18 Apr 2021 13:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbhDRRix (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sun, 18 Apr 2021 13:38:53 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD547C061760
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 10:38:21 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso16382772otm.4
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 10:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4Uxy/H46ztQJA5yFK5/pTHWRVi7fZP2Q+MrW5rsMwqY=;
        b=Gva1qvx4iFfSYu3tVAAa/nf0Gygn2Z/8jvJycdnWsP853BjMLCiqZbYk193OnUPt7a
         S1Brb3IGQ/eznu5B+yANi72um/2cpBe/KLXGVXV2MPRmygjBNq486GBXhayHE7o9PCMd
         JshnV5VAWeiDC1mO1UDSNAUdJQn0RD8lhwD/IsZ+4durD12wasQazXTHEZgm3X6BR5Ki
         46UInMYZSP9tR2tI2P5Qmk7TcHLUrExeMBJx2/rr/4pvkGSGnzRgKyD13nbzFpwbzrZW
         55FwlzzGhyT8r6L8nx1RTyyVIR6SXSqyhSeN6XN15/LWeQLcZdxkZwE6ekVcL7wp739D
         Z7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Uxy/H46ztQJA5yFK5/pTHWRVi7fZP2Q+MrW5rsMwqY=;
        b=YqyPo0cN+EWYHci7S7VQJ1nI136n7fFeGb3+n6Qmvozcu+MGV25u1lJ/sMWYdEPZmS
         p48UYFoJgF8rl6S4gyrTbuA56GkLPsnXTQtydcoPVGXDB9vtqQ62anIczuIMIq6iCI8l
         ozDSXb53q/U9KQ+FRU9v9dxjzBvdw5ZgyrX7Pqjw93EVvMWTGMuAyMWsXRwsWAFrN90M
         o1+9sbdYrBOsaKjfPYgHosI0XfDwJQegfcPUalGGKtloQ/RFc8BEChsXx1GB62W5m5PO
         bcP5k/Avo1p1KWGAd4mehbCzi7QAUR29vi/Dbxy4HvnwOKKdmTcl71uRT7FaIvstphPq
         Srog==
X-Gm-Message-State: AOAM531ClZaig8O/XdJS7B0x7y/nThz8P+mGa067E8IT8vpFoN7DImQP
        2XAKFqyWFV1pdLSvF+rKG2GTJGQAlBNrzQv1Hyw=
X-Google-Smtp-Source: ABdhPJyUlglvgYT5lkSeMHQ7k65T4T9H4d6kPTiZnBydiNyBWmK3DZY+EBeemqwHrg9qf44ksrKyeg==
X-Received: by 2002:a05:6830:4111:: with SMTP id w17mr12028953ott.99.1618767501020;
        Sun, 18 Apr 2021 10:38:21 -0700 (PDT)
Received: from elm (162-237-133-238.lightspeed.rcsntx.sbcglobal.net. [162.237.133.238])
        by smtp.gmail.com with ESMTPSA id n104sm2920071ota.27.2021.04.18.10.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 10:38:20 -0700 (PDT)
Date:   Sun, 18 Apr 2021 12:38:19 -0500
From:   Tyler Hicks <code@tyhicks.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: Fix typo in message
Message-ID: <20210418173819.GE398325@elm>
References: <20210224113059.28445-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224113059.28445-1-s.hauer@pengutronix.de>
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2021-02-24 12:30:59, Sascha Hauer wrote:
> ecryptfs_decrypt_page() issues a warning "Error encrypting extent". This
> should be "Error decrypting extent" instead.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Thanks! This looks good. I'll add the following fixes line while
applying:

Fixes: 0216f7f79217 ("eCryptfs: replace encrypt, decrypt, and inode size write")

Tyler

> ---
>  fs/ecryptfs/crypto.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index a48116aae02c..0fed4ff02f69 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -535,7 +535,7 @@ int ecryptfs_decrypt_page(struct page *page)
>  		rc = crypt_extent(crypt_stat, page, page,
>  				  extent_offset, DECRYPT);
>  		if (rc) {
> -			printk(KERN_ERR "%s: Error encrypting extent; "
> +			printk(KERN_ERR "%s: Error decrypting extent; "
>  			       "rc = [%d]\n", __func__, rc);
>  			goto out;
>  		}
> -- 
> 2.29.2
> 
