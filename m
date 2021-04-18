Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97427363703
	for <lists+ecryptfs@lfdr.de>; Sun, 18 Apr 2021 19:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhDRRfF (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 18 Apr 2021 13:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbhDRRfE (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sun, 18 Apr 2021 13:35:04 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47105C061760
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 10:34:36 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id c6-20020a4aacc60000b02901e6260b12e2so4760541oon.3
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 10:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aiDBbDlNdCS2FMtreSqkM5dXUdAdhf1EEE5nTHdKML8=;
        b=Ns49uFivuLCigXhCdeoEkzbgrA9uFd5/6k3H0LNs7wdT6bOAK97XJmQ0Q++uBAHYlt
         KhTXacLQTfYDZvREb6VAgvfMIzUoHkbZvu6nNDx3AIw/9f2gxYg2YnxQ+3HYAkh4pAnp
         R+xcrLMPAbr6y5pt/L3mzoyxvoAYAGDT8SMdPLokSiuxF2xVK+8ppMXoRzccMC7LhGmT
         BydTlxNCJGnvUSEF+N0v2JGf0+yhwFldI7F+pi7x6FuofA6Fp24yNAgFl+Mdy8HGIiyX
         65WZsViYiyeOLXjcxnHKVaIE4ncX/neFR4DcoTdWJfDBs1588kb/lWNsFg+wg0bld+hk
         MFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aiDBbDlNdCS2FMtreSqkM5dXUdAdhf1EEE5nTHdKML8=;
        b=prwuCqCKyGYjOnWqkV2KPEhQ8IhOpJCqtQANl91G9Ea6UM1/0rE0rxXTWyRzoV698x
         cGuXmbH6qm9WpgTt5rjE/EFftSFHomGiC0tDdNz8fZyvKUGUuVEO3wkBo2wXMzbUwZHp
         sH9axzhXhuarmueOJTU/nCVRNMXNanLLRsuwm+7dSfEeg5CaQWvNXw+uQUl+6Cz30sdN
         EWs+9+NN2d6J0xeVB5csMZWyM+/Zy/0BmY5aTH1Zl7QPv0OTQYNTqAYSQDUyhh8RQVWt
         4zHnagxi5yaFDD8f1VrHJELYY40usWW9+BdO4x7Mx3T9PmzCYDjEK9gRL7b2SXlJWQoJ
         l8lQ==
X-Gm-Message-State: AOAM53246jVqVRlAtaK5/xXtw1Ca1669UVXDXt0Cg8prq6MVmrltO1yY
        +A7RapZ5hYVag63seMlK7mmRMA==
X-Google-Smtp-Source: ABdhPJwjE7TY6A3Mq7jEAqI+ZwAp96XNj7eaWDTBEJdNhvNPDCeB5jhHSB7nuXQAri3dRpBG/ewEoA==
X-Received: by 2002:a4a:dc4e:: with SMTP id q14mr10880376oov.43.1618767275391;
        Sun, 18 Apr 2021 10:34:35 -0700 (PDT)
Received: from elm (162-237-133-238.lightspeed.rcsntx.sbcglobal.net. [162.237.133.238])
        by smtp.gmail.com with ESMTPSA id t19sm2984537otm.40.2021.04.18.10.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 10:34:35 -0700 (PDT)
Date:   Sun, 18 Apr 2021 12:34:33 -0500
From:   Tyler Hicks <code@tyhicks.com>
To:     Ye Bin <yebin10@huawei.com>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@suse.com>,
        Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>, ecryptfs@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] eCryptfs: Use DEFINE_MUTEX() for mutex lock
Message-ID: <20210418173433.GD398325@elm>
References: <20210409095142.2294032-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409095142.2294032-1-yebin10@huawei.com>
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2021-04-09 17:51:42, Ye Bin wrote:
> mutex lock can be initialized automatically with DEFINE_MUTEX()
> rather than explicitly calling mutex_init().
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>

This looks good to me. Thanks for the fix.

Tyler

> ---
>  fs/ecryptfs/messaging.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ecryptfs/messaging.c b/fs/ecryptfs/messaging.c
> index c0dfd9647627..25ed9baf524e 100644
> --- a/fs/ecryptfs/messaging.c
> +++ b/fs/ecryptfs/messaging.c
> @@ -14,10 +14,10 @@
>  
>  static LIST_HEAD(ecryptfs_msg_ctx_free_list);
>  static LIST_HEAD(ecryptfs_msg_ctx_alloc_list);
> -static struct mutex ecryptfs_msg_ctx_lists_mux;
> +static DEFINE_MUTEX(ecryptfs_msg_ctx_lists_mux);
>  
>  static struct hlist_head *ecryptfs_daemon_hash;
> -struct mutex ecryptfs_daemon_hash_mux;
> +DEFINE_MUTEX(ecryptfs_daemon_hash_mux);
>  static int ecryptfs_hash_bits;
>  #define ecryptfs_current_euid_hash(uid) \
>  	hash_long((unsigned long)from_kuid(&init_user_ns, current_euid()), ecryptfs_hash_bits)
> @@ -359,7 +359,6 @@ int __init ecryptfs_init_messaging(void)
>  		       "too large, defaulting to [%d] users\n", __func__,
>  		       ecryptfs_number_of_users);
>  	}
> -	mutex_init(&ecryptfs_daemon_hash_mux);
>  	mutex_lock(&ecryptfs_daemon_hash_mux);
>  	ecryptfs_hash_bits = 1;
>  	while (ecryptfs_number_of_users >> ecryptfs_hash_bits)
> @@ -383,7 +382,6 @@ int __init ecryptfs_init_messaging(void)
>  		rc = -ENOMEM;
>  		goto out;
>  	}
> -	mutex_init(&ecryptfs_msg_ctx_lists_mux);
>  	mutex_lock(&ecryptfs_msg_ctx_lists_mux);
>  	ecryptfs_msg_counter = 0;
>  	for (i = 0; i < ecryptfs_message_buf_len; i++) {
> 
