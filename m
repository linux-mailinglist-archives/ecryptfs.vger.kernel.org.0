Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81929363AA3
	for <lists+ecryptfs@lfdr.de>; Mon, 19 Apr 2021 06:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhDSEtz (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 19 Apr 2021 00:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhDSEty (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 19 Apr 2021 00:49:54 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB37BC061760
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 21:48:52 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 101-20020a9d0d6e0000b02902816815ff62so25536407oti.9
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 21:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jL7hJvT0imTo74BlTYm8q4MTMOtukYZw45XfWryvQaI=;
        b=R+jJbKSrFD+iwzFs4bfj+8LPnEV3qlAhl0OO2efaY5kk96+n1kHZqZ2AIMg1QuZ0HQ
         DzwIwcXkRWjgVxn9eHG0fM3zA67R0gYtOcfisL0r2ZIKcBpe0VvRD1dE4rBbx/zP/Mia
         GjRuRHcQRFdqZ7YWictj3Kd4yPAfwto3VctNhXfdYLmSxIcbKd0v6TgOaX8faD+7HAB9
         +6HJ2kJrYkAsMKZ+TiJM9PpER9/hfZjaZiSZRCTz7V9lnJYGjZjpVlEMoCQwB9yVsco+
         inz0peGREMf1Ui8WOF/X7sWq40yH9Gekn78rNiXqM4zwSQUd+v8AOFUgK0ajC4x0lSVZ
         RAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jL7hJvT0imTo74BlTYm8q4MTMOtukYZw45XfWryvQaI=;
        b=aYa9QZMyNCzUKwb42mRB6dTK0saWXASxr5BVO3Mnic4VJzmKA+B9/cj3GO2w2/Y1YA
         NcxCHXKhd5vPII2P20Vki4988s37wEIDA+xgonYO1tS2YKvzXvAp5zKWoXHDYRi5F4Q8
         gT8cKlJSjC4ipx67kyxWsontLmgEOYk/nEFpvMqQMg7rLKJXMhFyPKOEp2k08ITvFENo
         89/GCq2J0hG77SMfqwPF7aanw4FdN2EK0/DWjjRazJuHdDZZ16tYwI5ioFUgohl/G10/
         JP8dpgdQlCIWjsKJIdSGVK/crEZUdhifnGDN2yiKiYF2pXnXag5Le7W0nAkLqulJNfDv
         wrbQ==
X-Gm-Message-State: AOAM5305YAzzW1+ZHBk/7A36XEjnRW0Tf+Ghpo6n8EYGhuMYL7TCvLw/
        +IQqKL5aMfVoQZwaYNU1Ch0w1Y545miNQ7YmV1U=
X-Google-Smtp-Source: ABdhPJzGJD7WgxIzMQKjh6m9uj4cx5zsqGe3mkvIZ82d8zPKT7f7NGGd37eM9aK3h8QZKBe3TkVvwQ==
X-Received: by 2002:a9d:2033:: with SMTP id n48mr202399ota.84.1618807732025;
        Sun, 18 Apr 2021 21:48:52 -0700 (PDT)
Received: from elm (162-237-133-238.lightspeed.rcsntx.sbcglobal.net. [162.237.133.238])
        by smtp.gmail.com with ESMTPSA id v26sm174198ott.4.2021.04.18.21.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 21:48:51 -0700 (PDT)
Date:   Sun, 18 Apr 2021 23:48:50 -0500
From:   Tyler Hicks <code@tyhicks.com>
To:     Christian Brauner <brauner@kernel.org>
Cc:     ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Amir Goldstein <amir73il@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH 1/3] ecryptfs: remove unused helpers
Message-ID: <20210419044850.GF398325@elm>
References: <20210409162422.1326565-1-brauner@kernel.org>
 <20210409162422.1326565-2-brauner@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409162422.1326565-2-brauner@kernel.org>
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2021-04-09 18:24:20, Christian Brauner wrote:
> From: Christian Brauner <christian.brauner@ubuntu.com>
> 
> Remove two helpers that are unused.
> 
> Cc: Amir Goldstein <amir73il@gmail.com>
> Cc: Tyler Hicks <code@tyhicks.com>
> Cc: ecryptfs@vger.kernel.org
> Cc: linux-fsdevel@vger.kernel.org
> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>

I'll pick this patch up now as it looks like it didn't make it into your
v2 of the port to private mounts. I'll review those patches separately.

Thanks!

Tyler

> ---
>  fs/ecryptfs/ecryptfs_kernel.h | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
> index e6ac78c62ca4..463b2d99b554 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -496,12 +496,6 @@ ecryptfs_set_superblock_lower(struct super_block *sb,
>  	((struct ecryptfs_sb_info *)sb->s_fs_info)->wsi_sb = lower_sb;
>  }
>  
> -static inline struct ecryptfs_dentry_info *
> -ecryptfs_dentry_to_private(struct dentry *dentry)
> -{
> -	return (struct ecryptfs_dentry_info *)dentry->d_fsdata;
> -}
> -
>  static inline void
>  ecryptfs_set_dentry_private(struct dentry *dentry,
>  			    struct ecryptfs_dentry_info *dentry_info)
> @@ -515,12 +509,6 @@ ecryptfs_dentry_to_lower(struct dentry *dentry)
>  	return ((struct ecryptfs_dentry_info *)dentry->d_fsdata)->lower_path.dentry;
>  }
>  
> -static inline struct vfsmount *
> -ecryptfs_dentry_to_lower_mnt(struct dentry *dentry)
> -{
> -	return ((struct ecryptfs_dentry_info *)dentry->d_fsdata)->lower_path.mnt;
> -}
> -
>  static inline struct path *
>  ecryptfs_dentry_to_lower_path(struct dentry *dentry)
>  {
> -- 
> 2.27.0
> 
