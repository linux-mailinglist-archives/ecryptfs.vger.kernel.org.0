Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2197B15EE1F
	for <lists+ecryptfs@lfdr.de>; Fri, 14 Feb 2020 18:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390227AbgBNRi1 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 14 Feb 2020 12:38:27 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:60391 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390131AbgBNRi1 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 14 Feb 2020 12:38:27 -0500
Received: from [12.20.136.66] (helo=elm)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <tyhicks@canonical.com>)
        id 1j2ev2-0004m8-Aw; Fri, 14 Feb 2020 17:38:24 +0000
Date:   Fri, 14 Feb 2020 11:38:18 -0600
From:   Tyler Hicks <tyhicks@canonical.com>
To:     Aditya Pakki <pakki001@umn.edu>
Cc:     kjlu@umn.edu, ecryptfs@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: replace BUG_ON with error handling code
Message-ID: <20200214173818.GB250165@elm>
References: <20191215172404.28204-1-pakki001@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191215172404.28204-1-pakki001@umn.edu>
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2019-12-15 11:24:04, Aditya Pakki wrote:
> In crypt_scatterlist, if the crypt_stat argument is not set up
> correctly, we avoid crashing, by returning the error upstream.
> This patch performs the fix.
> 
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>

Hi Aditya - I wanted to check in to see if you are able to submit a new
revision taking into account the feedback from Markus.

Also, I'm curious if you've been able to hit this BUG_ON() or if you are
just being proactive in cleaning up this function?

Let me know if I can help you prepare a v2 of this patch. Thanks!

Tyler

> ---
>  fs/ecryptfs/crypto.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index f91db24bbf3b..a064b408d841 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -311,8 +311,10 @@ static int crypt_scatterlist(struct ecryptfs_crypt_stat *crypt_stat,
>  	struct extent_crypt_result ecr;
>  	int rc = 0;
>  
> -	BUG_ON(!crypt_stat || !crypt_stat->tfm
> -	       || !(crypt_stat->flags & ECRYPTFS_STRUCT_INITIALIZED));
> +	if (!crypt_stat || !crypt_stat->tfm
> +	       || !(crypt_stat->flags & ECRYPTFS_STRUCT_INITIALIZED))
> +		return -EINVAL;
> +
>  	if (unlikely(ecryptfs_verbosity > 0)) {
>  		ecryptfs_printk(KERN_DEBUG, "Key size [%zd]; key:\n",
>  				crypt_stat->key_size);
> -- 
> 2.20.1
> 
