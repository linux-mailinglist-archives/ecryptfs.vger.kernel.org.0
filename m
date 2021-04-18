Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521883636F9
	for <lists+ecryptfs@lfdr.de>; Sun, 18 Apr 2021 19:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhDRRTe (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 18 Apr 2021 13:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhDRRTd (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sun, 18 Apr 2021 13:19:33 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632ACC06174A
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 10:19:05 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id l17so1923969oil.11
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 10:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IfPbDvRpVXNZkCjTosV0fhdI0kbeai9mwZx1gjVjW1U=;
        b=FKl+BqFpmAqmj7h5CPtRIEvh2HqvT9DYZBGdm2aGQZVNzcSfNMhSjqjSF4HwD6zX+o
         IPDqOZCtGI4xdNXLy4TojHs5jmy7Pgu0AqEqnefZscWt+xlm+AhCukyFhHo5v9gkIO0T
         sLz6fPazM+hBh5ECchUYkg4MAQ8nq/NaoBhj2VdaBgfNjNh65ydY4qbF1F1VAvVYeAi+
         lf7poejPh73bxMbbdgYj3wwpmTXVbJt0l+FS4KDIhpTG+M8Me5ePgR0TZJCd+Zjq6Sp4
         Wi2+9UG49Fpg5CG3hKF4EnkAP6DyRugHPnziOYVfrIJbbYgbz3tPcUgyWYnv5BG2oJ+7
         90+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IfPbDvRpVXNZkCjTosV0fhdI0kbeai9mwZx1gjVjW1U=;
        b=K23WxFL7N5nvyG26pZrBqpIorMtnbOPqfj4Rt5dwEr2pcUpHO48BMHJLvV/27rcgss
         jkQdJ/pevzFRajtUvOvFO1IclePuoP3qYvUy43GH+OuljxLKC2e/MLlPeXoi9bS55eLX
         1H0+yOFSooQcLcwW66n+GigBjLJGJeoN5d4Z7jrq62B0N2xEJzerzGCk1H7b0NYAeFQO
         hhEFzVfyki7asgx1bFiOOnLiePbmJ9QsIrKPH77cWkuAFc2vJwCWG6rWZRCK3jdphlD1
         1vOERwE5894DtN3jJzHM9ZIgR16/utmknT2Zas72CUmvwA0h79ikSQKlFnVE6shUUvPI
         oLDA==
X-Gm-Message-State: AOAM532ipJpJmCfHbMjSnUC8GwDfx/m3fFV91+XsYqxHyCcxjlcvbKyX
        7tfK3oG0D6XmaQAySyhF0dOXxRjpGxo4HbEM
X-Google-Smtp-Source: ABdhPJzXltmxS/8vQG3tak+SQj8mmQrawVmzSpxkZbGIphOp0WP5uGFv9htd+oAWaAIAqw/zOD/+UQ==
X-Received: by 2002:a54:488f:: with SMTP id r15mr10484104oic.132.1618766344270;
        Sun, 18 Apr 2021 10:19:04 -0700 (PDT)
Received: from elm (162-237-133-238.lightspeed.rcsntx.sbcglobal.net. [162.237.133.238])
        by smtp.gmail.com with ESMTPSA id b14sm2659729oic.30.2021.04.18.10.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 10:19:03 -0700 (PDT)
Date:   Sun, 18 Apr 2021 12:19:02 -0500
From:   Tyler Hicks <code@tyhicks.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Christian Brauner <christian.brauner@ubuntu.com>,
        James Morris <jamorris@linux.microsoft.com>,
        "Michael A. Halcrow" <mahalcro@us.ibm.com>,
        "Michael C. Thompson" <mcthomps@us.ibm.com>,
        ecryptfs@vger.kernel.org
Subject: Re: [PATCH 26/31] fs: ecryptfs: main: Demote a bunch of
 non-conformant kernel-doc headers
Message-ID: <20210418171902.GB398325@elm>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
 <20210330164458.1625478-27-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330164458.1625478-27-lee.jones@linaro.org>
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2021-03-30 17:44:53, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  fs/ecryptfs/main.c:28: warning: Incorrect use of kernel-doc format:  * Module parameter that defines the ecryptfs_verbosity level.
>  fs/ecryptfs/main.c:30: warning: cannot understand function prototype: 'int ecryptfs_verbosity = 0; '
>  fs/ecryptfs/main.c:40: warning: cannot understand function prototype: 'unsigned int ecryptfs_message_buf_len = ECRYPTFS_DEFAULT_MSG_CTX_ELEMS; '
>  fs/ecryptfs/main.c:52: warning: cannot understand function prototype: 'signed long ecryptfs_message_wait_timeout = ECRYPTFS_MAX_MSG_CTX_TTL / HZ; '
>  fs/ecryptfs/main.c:65: warning: cannot understand function prototype: 'unsigned int ecryptfs_number_of_users = ECRYPTFS_DEFAULT_NUM_USERS; '
>  fs/ecryptfs/main.c:106: warning: Function parameter or member 'dentry' not described in 'ecryptfs_init_lower_file'
>  fs/ecryptfs/main.c:106: warning: Function parameter or member 'lower_file' not described in 'ecryptfs_init_lower_file'
>  fs/ecryptfs/main.c:106: warning: Excess function parameter 'ecryptfs_dentry' description in 'ecryptfs_init_lower_file'
>  fs/ecryptfs/main.c:244: warning: Function parameter or member 'sbi' not described in 'ecryptfs_parse_options'
>  fs/ecryptfs/main.c:244: warning: Excess function parameter 'sb' description in 'ecryptfs_parse_options'
>  fs/ecryptfs/main.c:478: warning: Function parameter or member 'fs_type' not described in 'ecryptfs_mount'
>  fs/ecryptfs/main.c:478: warning: Function parameter or member 'flags' not described in 'ecryptfs_mount'
>  fs/ecryptfs/main.c:478: warning: expecting prototype for ecryptfs_get_sb(). Prototype was for ecryptfs_mount() instead
>  fs/ecryptfs/main.c:645: warning: Function parameter or member 'vptr' not described in 'inode_info_init_once'
> 
> Cc: Tyler Hicks <code@tyhicks.com>
> Cc: Christian Brauner <christian.brauner@ubuntu.com>
> Cc: James Morris <jamorris@linux.microsoft.com>
> Cc: "Michael A. Halcrow" <mahalcro@us.ibm.com>
> Cc: "Michael C. Thompson" <mcthomps@us.ibm.com>
> Cc: ecryptfs@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  fs/ecryptfs/main.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
> index cdf40a54a35d8..0a6ef2472f205 100644
> --- a/fs/ecryptfs/main.c
> +++ b/fs/ecryptfs/main.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   *
>   * Copyright (C) 1997-2003 Erez Zadok
> @@ -24,7 +24,7 @@
>  #include <linux/magic.h>
>  #include "ecryptfs_kernel.h"
>  
> -/**
> +/*
>   * Module parameter that defines the ecryptfs_verbosity level.
>   */
>  int ecryptfs_verbosity = 0;
> @@ -34,7 +34,7 @@ MODULE_PARM_DESC(ecryptfs_verbosity,
>  		 "Initial verbosity level (0 or 1; defaults to "
>  		 "0, which is Quiet)");
>  
> -/**
> +/*
>   * Module parameter that defines the number of message buffer elements
>   */
>  unsigned int ecryptfs_message_buf_len = ECRYPTFS_DEFAULT_MSG_CTX_ELEMS;
> @@ -43,7 +43,7 @@ module_param(ecryptfs_message_buf_len, uint, 0);
>  MODULE_PARM_DESC(ecryptfs_message_buf_len,
>  		 "Number of message buffer elements");
>  
> -/**
> +/*
>   * Module parameter that defines the maximum guaranteed amount of time to wait
>   * for a response from ecryptfsd.  The actual sleep time will be, more than
>   * likely, a small amount greater than this specified value, but only less if
> @@ -57,7 +57,7 @@ MODULE_PARM_DESC(ecryptfs_message_wait_timeout,
>  		 "sleep while waiting for a message response from "
>  		 "userspace");
>  
> -/**
> +/*
>   * Module parameter that is an estimate of the maximum number of users
>   * that will be concurrently using eCryptfs. Set this to the right
>   * value to balance performance and memory use.
> @@ -80,7 +80,7 @@ void __ecryptfs_printk(const char *fmt, ...)
>  	va_end(args);
>  }
>  
> -/**
> +/*
>   * ecryptfs_init_lower_file
>   * @ecryptfs_dentry: Fully initialized eCryptfs dentry object, with
>   *                   the lower dentry and the lower mount set
> @@ -221,7 +221,7 @@ static void ecryptfs_init_mount_crypt_stat(
>  
>  /**
>   * ecryptfs_parse_options
> - * @sb: The ecryptfs super block
> + * @sbi: The ecryptfs super block
>   * @options: The options passed to the kernel
>   * @check_ruid: set to 1 if device uid should be checked against the ruid
>   *
> @@ -466,10 +466,8 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  struct kmem_cache *ecryptfs_sb_info_cache;
>  static struct file_system_type ecryptfs_fs_type;
>  
> -/**
> +/*
>   * ecryptfs_get_sb
> - * @fs_type
> - * @flags

This wasn't quite the right change. This function documentation block
was for ecryptfs_mount(). It was probably ecryptfs_get_sb() in the past
and the docs weren't updated. I've adjusted the function doc header and
added descriptions for @fs_type and @flags.

Tyler

>   * @dev_name: The path to mount over
>   * @raw_data: The options passed into the kernel
>   */
> @@ -635,7 +633,7 @@ static struct file_system_type ecryptfs_fs_type = {
>  };
>  MODULE_ALIAS_FS("ecryptfs");
>  
> -/**
> +/*
>   * inode_info_init_once
>   *
>   * Initializes the ecryptfs_inode_info_cache when it is created
> -- 
> 2.27.0
> 
