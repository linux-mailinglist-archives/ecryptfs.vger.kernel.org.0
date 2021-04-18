Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4981A3636FC
	for <lists+ecryptfs@lfdr.de>; Sun, 18 Apr 2021 19:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhDRRYo (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 18 Apr 2021 13:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhDRRYm (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sun, 18 Apr 2021 13:24:42 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010B3C061760
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 10:24:13 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso16361976otm.4
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 10:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QjsnJKZmARmZlWkN7y36NL5XuyIJZ+hNq3K45ObLzro=;
        b=rnUsrJkbdAttKvS34iLkbzU/OQRIcff7LgFU84jvlF54YWPAdH+87oGNa+gw24R3IS
         E8vwDxE4tktNHWrIIC6PGJBYrClmmCfAZ0LPoApLyA4WZCdW+2pVNPdp39kjCIc7fqpg
         IFvCLypmASqWd8xo2EYqWgCUhMJCYfN/UsuiAMMVAm8e73dT9wGP7gpAo1HfPrCgwRGz
         /hxKqNTzkBJaKgFhRUfNbKTj4frGJGtpuwfEu/NVgZB05GgwQhFhBU58ejUz1TOfDS3Y
         VzCb6dMsgYlXtwT9HmlvL/V3PbPD4091ubk4rh+XCxWaKGk13DiHm0TNgKZLe3kNsL1V
         s8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QjsnJKZmARmZlWkN7y36NL5XuyIJZ+hNq3K45ObLzro=;
        b=VJMftWK4KYOI9sU2UTxc2DLlbOkYfjahCu9vbV/u/sGwfFyXdlgDq2nbnymWb0RC1J
         BTmpQsMWNXuBNP87pmS+DlnHfkk9khJ7ETFMO/Hrzk8lTZvAJ8ZcEusH5deXeDc4Y2SD
         R5U8WkVEclcmdMESaoN211UcxZuRtrX2Px1OLD8AyeBHdZ0T12Kr2QEjc+sBrdhTVw7Q
         Z8zJCjcBFXjlJRXee52W2M8LsHgmS2W08vPL9JRJO8s8fGuHBaJkwab/F8n3gYqppGrt
         JCSIwtzT3lJ6xGvLuuTJ6y+RPaxE4i4XROldahGIDsgdDDd6S+NDiiGXPc8msPPSiPLp
         pSgw==
X-Gm-Message-State: AOAM532tvWnzQ/6Gb8+GACmVB7rzO7vMabCB1fvQ+LOqWWwN7vBKnmP+
        eob5VaDoE1vdp0YMmqM06E1O6w==
X-Google-Smtp-Source: ABdhPJxw4YKNTsxjM47tG3YAHQ8rf0dV4qV8S6+F574KX1fVNoH1lslVy4+S4dzw28bGQ98s0YXQCA==
X-Received: by 2002:a05:6830:1d49:: with SMTP id p9mr11850651oth.300.1618766653292;
        Sun, 18 Apr 2021 10:24:13 -0700 (PDT)
Received: from elm (162-237-133-238.lightspeed.rcsntx.sbcglobal.net. [162.237.133.238])
        by smtp.gmail.com with ESMTPSA id k8sm2692088oig.6.2021.04.18.10.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 10:24:12 -0700 (PDT)
Date:   Sun, 18 Apr 2021 12:24:11 -0500
From:   Tyler Hicks <code@tyhicks.com>
To:     Aditya Srivastava <yashsri421@gmail.com>
Cc:     lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org, corbet@lwn.net,
        ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org, christian.brauner@ubuntu.com
Subject: Re: [PATCH] ecryptfs: fix incorrect kernel-doc comment syntax in
 files
Message-ID: <20210418172411.GC398325@elm>
References: <20210320081551.13954-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210320081551.13954-1-yashsri421@gmail.com>
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2021-03-20 13:45:51, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for kernel-doc comments.
> There are files in fs/encrypts which follows this syntax, but the content
> inside does not comply with kernel-doc.
> This causes unexpected warnings from kernel-doc.
> 
> E.g., header comment for fs/ecryptfs/dentry.c follows kernel-doc syntax
> for comments(i.e., '/**'), but the content inside does not.
> 
> Running kernel-doc -none on fs/ecryptfs/dentry.c causes these
> unexpected warnings:
> "warning: Incorrect use of kernel-doc format:  * ecryptfs_d_revalidate - revalidate an ecryptfs dentry"
> "warning: Function parameter or member 'dentry' not described in 'ecryptfs_d_revalidate'"
> "warning: Function parameter or member 'flags' not described in 'ecryptfs_d_revalidate'"
> "warning: expecting prototype for eCryptfs(). Prototype was for ecryptfs_d_revalidate() instead"
> 
> Similarly for other files too.
> 
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Hello Aditya - Thank you for this fix. In the time it took me to review
this patch, someone else submitted a series that fixed all W=1 warnings
under fs/ecryptfs/:

 https://lore.kernel.org/lkml/20210330164458.1625478-1-lee.jones@linaro.org/

I'm going to take Lee's series for simplicity's sake. Thank you again
for taking time to submit your patch.

Tyler

> ---
> * Applies perfectly on next-20210312
> 
>  fs/ecryptfs/crypto.c          |  2 +-
>  fs/ecryptfs/debug.c           |  2 +-
>  fs/ecryptfs/dentry.c          |  2 +-
>  fs/ecryptfs/ecryptfs_kernel.h |  2 +-
>  fs/ecryptfs/file.c            |  2 +-
>  fs/ecryptfs/inode.c           |  2 +-
>  fs/ecryptfs/keystore.c        |  6 +++---
>  fs/ecryptfs/kthread.c         |  2 +-
>  fs/ecryptfs/main.c            | 10 +++++-----
>  fs/ecryptfs/messaging.c       |  2 +-
>  fs/ecryptfs/miscdev.c         |  2 +-
>  fs/ecryptfs/mmap.c            |  6 +++---
>  fs/ecryptfs/read_write.c      |  2 +-
>  fs/ecryptfs/super.c           |  2 +-
>  14 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index 7671412b8f0b..48184ff65f90 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   *
>   * Copyright (C) 1997-2004 Erez Zadok
> diff --git a/fs/ecryptfs/debug.c b/fs/ecryptfs/debug.c
> index 1f65e99f9a41..65702d7fc4b9 100644
> --- a/fs/ecryptfs/debug.c
> +++ b/fs/ecryptfs/debug.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   * Functions only useful for debugging.
>   *
> diff --git a/fs/ecryptfs/dentry.c b/fs/ecryptfs/dentry.c
> index 44606f079efb..acaa0825e9bb 100644
> --- a/fs/ecryptfs/dentry.c
> +++ b/fs/ecryptfs/dentry.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   *
>   * Copyright (C) 1997-2003 Erez Zadok
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
> index 4a62a7dcc4f5..f8aa99e41c48 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   * Kernel declarations.
>   *
> diff --git a/fs/ecryptfs/file.c b/fs/ecryptfs/file.c
> index 5fb45d865ce5..2d8344774885 100644
> --- a/fs/ecryptfs/file.c
> +++ b/fs/ecryptfs/file.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   *
>   * Copyright (C) 1997-2004 Erez Zadok
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 18e9285fbb4c..541b46d76f89 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   *
>   * Copyright (C) 1997-2004 Erez Zadok
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index 2abd219cfeec..475d939ff695 100644
> --- a/fs/ecryptfs/keystore.c
> +++ b/fs/ecryptfs/keystore.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   * In-kernel key management code.  Includes functions to parse and
>   * write authentication token-related packets with the underlying
> @@ -21,7 +21,7 @@
>  #include <linux/slab.h>
>  #include "ecryptfs_kernel.h"
>  
> -/**
> +/*
>   * request_key returned an error instead of a valid key address;
>   * determine the type of error, make appropriate log entries, and
>   * return an error code.
> @@ -576,7 +576,7 @@ ecryptfs_find_auth_tok_for_sig(
>  	return rc;
>  }
>  
> -/**
> +/*
>   * write_tag_70_packet can gobble a lot of stack space. We stuff most
>   * of the function's parameters in a kmalloc'd struct to help reduce
>   * eCryptfs' overall stack usage.
> diff --git a/fs/ecryptfs/kthread.c b/fs/ecryptfs/kthread.c
> index a7c903cb01a0..d1b1c3546972 100644
> --- a/fs/ecryptfs/kthread.c
> +++ b/fs/ecryptfs/kthread.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   *
>   * Copyright (C) 2008 International Business Machines Corp.
> diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
> index cdf40a54a35d..9bc19a092917 100644
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
> diff --git a/fs/ecryptfs/messaging.c b/fs/ecryptfs/messaging.c
> index c0dfd9647627..9f42fca7fc36 100644
> --- a/fs/ecryptfs/messaging.c
> +++ b/fs/ecryptfs/messaging.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   *
>   * Copyright (C) 2004-2008 International Business Machines Corp.
> diff --git a/fs/ecryptfs/miscdev.c b/fs/ecryptfs/miscdev.c
> index 742ece22c1d4..7e741e36dfe7 100644
> --- a/fs/ecryptfs/miscdev.c
> +++ b/fs/ecryptfs/miscdev.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   *
>   * Copyright (C) 2008 International Business Machines Corp.
> diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
> index 2f333a40ff4d..485f6c1e19b5 100644
> --- a/fs/ecryptfs/mmap.c
> +++ b/fs/ecryptfs/mmap.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   * This is where eCryptfs coordinates the symmetric encryption and
>   * decryption of the file data as it passes between the lower
> @@ -78,7 +78,7 @@ static void strip_xattr_flag(char *page_virt,
>  	}
>  }
>  
> -/**
> +/*
>   *   Header Extent:
>   *     Octets 0-7:        Unencrypted file size (big-endian)
>   *     Octets 8-15:       eCryptfs special marker
> @@ -229,7 +229,7 @@ static int ecryptfs_readpage(struct file *file, struct page *page)
>  	return rc;
>  }
>  
> -/**
> +/*
>   * Called with lower inode mutex held.
>   */
>  static int fill_zeros_to_end_of_page(struct page *page, unsigned int to)
> diff --git a/fs/ecryptfs/read_write.c b/fs/ecryptfs/read_write.c
> index 0438997ac9d8..384b383b4a48 100644
> --- a/fs/ecryptfs/read_write.c
> +++ b/fs/ecryptfs/read_write.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   *
>   * Copyright (C) 2007 International Business Machines Corp.
> diff --git a/fs/ecryptfs/super.c b/fs/ecryptfs/super.c
> index 6b1853f1c06a..cc16d044165d 100644
> --- a/fs/ecryptfs/super.c
> +++ b/fs/ecryptfs/super.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   *
>   * Copyright (C) 1997-2003 Erez Zadok
> -- 
> 2.17.1
> 
