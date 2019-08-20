Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57466957E4
	for <lists+ecryptfs@lfdr.de>; Tue, 20 Aug 2019 09:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728898AbfHTHKc (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 20 Aug 2019 03:10:32 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36720 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728777AbfHTHKc (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 20 Aug 2019 03:10:32 -0400
Received: from 1.general.tyhicks.us.vpn ([10.172.64.52] helo=elm)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <tyhicks@canonical.com>)
        id 1hzyHl-0001hm-T2; Tue, 20 Aug 2019 07:10:30 +0000
Date:   Tue, 20 Aug 2019 00:10:09 -0700
From:   Tyler Hicks <tyhicks@canonical.com>
To:     Wenwen Wang <wenwen@cs.uga.edu>
Cc:     "open list:ECRYPT FILE SYSTEM" <ecryptfs@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ecryptfs: fix a memory leak bug
Message-ID: <20190820071008.GA22824@elm>
References: <1566278200-9368-1-git-send-email-wenwen@cs.uga.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566278200-9368-1-git-send-email-wenwen@cs.uga.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2019-08-20 00:16:40, Wenwen Wang wrote:
> In parse_tag_1_packet(), if tag 1 packet contains a key larger than
> ECRYPTFS_MAX_ENCRYPTED_KEY_BYTES, no cleanup is executed, leading to a
> memory leak on the allocated 'auth_tok_list_item'. To fix this issue, go to
> the label 'out_free' to perform the cleanup work.
> 
> Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>

Thanks for the patch!

I added the following tags to the commit message:

 Cc: stable@vger.kernel.org
 Fixes: dddfa461fc89 ("[PATCH] eCryptfs: Public key; packet management")

I also added the function name to the commit subject so that it was
unique from your other fix.

I've pushed the fix to the eCryptfs next branch and I'll submit a pull
request for inclusion soon.

Tyler

> ---
>  fs/ecryptfs/keystore.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index 216fbe6..4dc0963 100644
> --- a/fs/ecryptfs/keystore.c
> +++ b/fs/ecryptfs/keystore.c
> @@ -1304,7 +1304,7 @@ parse_tag_1_packet(struct ecryptfs_crypt_stat *crypt_stat,
>  		printk(KERN_WARNING "Tag 1 packet contains key larger "
>  		       "than ECRYPTFS_MAX_ENCRYPTED_KEY_BYTES\n");
>  		rc = -EINVAL;
> -		goto out;
> +		goto out_free;
>  	}
>  	memcpy((*new_auth_tok)->session_key.encrypted_key,
>  	       &data[(*packet_size)], (body_size - (ECRYPTFS_SIG_SIZE + 2)));
> -- 
> 2.7.4
> 
