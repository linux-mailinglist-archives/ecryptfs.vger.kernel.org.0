Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92FE94B21E
	for <lists+ecryptfs@lfdr.de>; Wed, 19 Jun 2019 08:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfFSGdW (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 19 Jun 2019 02:33:22 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44049 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfFSGdW (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 19 Jun 2019 02:33:22 -0400
Received: from 162-237-133-238.lightspeed.rcsntx.sbcglobal.net ([162.237.133.238] helo=lindsey)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <tyhicks@canonical.com>)
        id 1hdU9f-0001HK-Q8; Wed, 19 Jun 2019 06:33:12 +0000
Date:   Wed, 19 Jun 2019 01:33:08 -0500
From:   Tyler Hicks <tyhicks@canonical.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     viro@zeniv.linux.org.uk, agruenba@redhat.com,
        linux-kernel@vger.kernel.org, ecryptfs@vger.kernel.org
Subject: Re: [PATCH -next] ecryptfs: Make ecryptfs_xattr_handler static
Message-ID: <20190619063307.GA22021@lindsey>
References: <20190614155117.28988-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614155117.28988-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2019-06-14 23:51:17, YueHaibing wrote:
> Fix sparse warning:
> 
> fs/ecryptfs/inode.c:1138:28: warning:
>  symbol 'ecryptfs_xattr_handler' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks for the cleanup! I've pushed this to the eCryptfs next branch.

Tyler

> ---
>  fs/ecryptfs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 1e994d7..18426f4 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -1121,7 +1121,7 @@ static int ecryptfs_xattr_set(const struct xattr_handler *handler,
>  	}
>  }
>  
> -const struct xattr_handler ecryptfs_xattr_handler = {
> +static const struct xattr_handler ecryptfs_xattr_handler = {
>  	.prefix = "",  /* match anything */
>  	.get = ecryptfs_xattr_get,
>  	.set = ecryptfs_xattr_set,
> -- 
> 2.7.4
> 
> 
