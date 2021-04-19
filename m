Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846BB363B21
	for <lists+ecryptfs@lfdr.de>; Mon, 19 Apr 2021 07:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhDSFwU (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 19 Apr 2021 01:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhDSFwU (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 19 Apr 2021 01:52:20 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2126AC061760
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 22:51:51 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id i20-20020a4a8d940000b02901bc71746525so7502907ook.2
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 22:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iME+CNXDVjC/1XM/JXZLtDKa94anQMGHeai+8ArpCt4=;
        b=AJTC1g5RND1AsB1iCE8i1cAUBi/A6KUYo/fK9hXq3pAEpiZ2F4OHIZmmtSw0OaWBW+
         Sq3FutVSYu7kRnE+s9pZ5KLYDFpzHFqEmnr6aU4hY3Kd+LIci+fY9+0VZRcku5xBt3u9
         ItsVCpzzvLl0TtrsvhXTJ5i3bU46tQmpvHO4Lk5hKwNWczkZGIDwgzJNMG0AaWQk031b
         qevKi/wGcTIyHOscrCJ6ZnnaqaN+sHXv8oZGTPn6ps9Cdv2mk6+kbM2M9+CrwYqcuBWn
         7U7PRUNVYFyWsdVnB/kj+VqrQATNppUl5y/8QCu/qQHfdaDRPhLlGhNRk8yut8VGojQb
         8H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iME+CNXDVjC/1XM/JXZLtDKa94anQMGHeai+8ArpCt4=;
        b=jIMA3WKAZpvfmsJMmMwuZGbARBVdOAAn+55/K4zkTTwjQiupJEMSNaU5DZ9se+e5Lq
         BoGBJt4Vd3pIrZws9xVOnWSJsn6/10KxgPH1ym5nSfLrSE95+7NFjczRPI5cVDKCACJx
         urqpc8tp5HJOE70uovK3c3bX+pCFKfR8e6d8U7I0W1os1b28Fd2x66FIqf34ANDlERb5
         8iewmL54fFPnt/INbZz90g+5f+/Z1AOmM3fbq4POIzr2plyQ15o3cx0KGryvELLcc3w2
         yeyLH42b3T7T1q5cPlYJVEyuw3xPrO0VxZfbNoutV8qO0ge9E8gg/YnEBsDmg2OMepkP
         GJ1Q==
X-Gm-Message-State: AOAM5334Zu8hLYDLgiI9lqA0vrQmsKEZeHssj6Xn0FgHqdVQLXSH6Gap
        tWcnoRlg7j58q23fVP8JYMtFXQ==
X-Google-Smtp-Source: ABdhPJy2LN6e5eOSXgUO222TUeEJmlTHt0vN3uiNm6hxT+swuoMA3rzcYkHdBiqsmpTeDdKjD/A8Ew==
X-Received: by 2002:a4a:e749:: with SMTP id n9mr12305497oov.89.1618811510422;
        Sun, 18 Apr 2021 22:51:50 -0700 (PDT)
Received: from elm (162-237-133-238.lightspeed.rcsntx.sbcglobal.net. [162.237.133.238])
        by smtp.gmail.com with ESMTPSA id 77sm3246764otg.55.2021.04.18.22.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 22:51:50 -0700 (PDT)
Date:   Mon, 19 Apr 2021 00:51:48 -0500
From:   Tyler Hicks <code@tyhicks.com>
To:     Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: fix kernel panic with null dev_name
Message-ID: <20210419055148.GC405651@elm>
References: <20210226210023.77597-1-jeffrey.mitchell@starlab.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226210023.77597-1-jeffrey.mitchell@starlab.io>
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2021-02-26 15:00:23, Jeffrey Mitchell wrote:
> When mounting eCryptfs, a null "dev_name" argument to ecryptfs_mount()
> causes a kernel panic if the parsed options are valid. The easiest way to
> reproduce this is to call mount() from userspace with an existing
> eCryptfs mount's options and a "source" argument of 0.
> 
> Error out if "dev_name" is null in ecryptfs_mount()
> 
> Signed-off-by: Jeffrey Mitchell <jeffrey.mitchell@starlab.io>

Thanks for the fix! I reproduced this on a 4.15 and, while I didn't try
anything older than that, I think it affects the first kernel release
with eCryptfs. I've added the following Fixes tag:

 Fixes: 237fead61998 ("[PATCH] ecryptfs: fs/Makefile and fs/Kconfig")

I've pushed it to the next branch of tyhicks/ecryptfs.git.

Tyler

> ---
>  fs/ecryptfs/main.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
> index e63259fdef28..b2f6a1937d23 100644
> --- a/fs/ecryptfs/main.c
> +++ b/fs/ecryptfs/main.c
> @@ -492,6 +492,12 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  		goto out;
>  	}
>  
> +	if (!dev_name) {
> +		rc = -EINVAL;
> +		err = "Device name cannot be null";
> +		goto out;
> +	}
> +
>  	rc = ecryptfs_parse_options(sbi, raw_data, &check_ruid);
>  	if (rc) {
>  		err = "Error parsing options";
> -- 
> 2.25.1
> 
