Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 671914B22B
	for <lists+ecryptfs@lfdr.de>; Wed, 19 Jun 2019 08:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbfFSGgB (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 19 Jun 2019 02:36:01 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44105 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfFSGgB (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 19 Jun 2019 02:36:01 -0400
Received: from 162-237-133-238.lightspeed.rcsntx.sbcglobal.net ([162.237.133.238] helo=lindsey)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <tyhicks@canonical.com>)
        id 1hdUCN-0001ay-Kp; Wed, 19 Jun 2019 06:36:00 +0000
Date:   Wed, 19 Jun 2019 01:35:56 -0500
From:   Tyler Hicks <tyhicks@canonical.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] ecryptfs: use print_hex_dump_bytes for hexdump
Message-ID: <20190619063555.GC22021@lindsey>
References: <20190517104515.10371-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517104515.10371-1-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2019-05-17 12:45:15, Sascha Hauer wrote:
> The Kernel has nice hexdump facilities, use them rather a homebrew
> hexdump function.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Thanks! This is much nicer. I've pushed the commit to the eCryptfs next
branch.

Tyler

> ---
>  fs/ecryptfs/debug.c | 22 +++-------------------
>  1 file changed, 3 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/ecryptfs/debug.c b/fs/ecryptfs/debug.c
> index 3d2bdf546ec6..ee9d8ac4a809 100644
> --- a/fs/ecryptfs/debug.c
> +++ b/fs/ecryptfs/debug.c
> @@ -97,25 +97,9 @@ void ecryptfs_dump_auth_tok(struct ecryptfs_auth_tok *auth_tok)
>   */
>  void ecryptfs_dump_hex(char *data, int bytes)
>  {
> -	int i = 0;
> -	int add_newline = 1;
> -
>  	if (ecryptfs_verbosity < 1)
>  		return;
> -	if (bytes != 0) {
> -		printk(KERN_DEBUG "0x%.2x.", (unsigned char)data[i]);
> -		i++;
> -	}
> -	while (i < bytes) {
> -		printk("0x%.2x.", (unsigned char)data[i]);
> -		i++;
> -		if (i % 16 == 0) {
> -			printk("\n");
> -			add_newline = 0;
> -		} else
> -			add_newline = 1;
> -	}
> -	if (add_newline)
> -		printk("\n");
> -}
>  
> +	print_hex_dump(KERN_DEBUG, "ecryptfs: ", DUMP_PREFIX_OFFSET, 16, 1,
> +		       data, bytes, false);
> +}
> -- 
> 2.20.1
> 
