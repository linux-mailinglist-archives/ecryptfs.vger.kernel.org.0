Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A422B644
	for <lists+ecryptfs@lfdr.de>; Mon, 27 May 2019 15:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbfE0NW5 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 27 May 2019 09:22:57 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:17165 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726515AbfE0NW5 (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Mon, 27 May 2019 09:22:57 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E56B778096EA122E6112;
        Mon, 27 May 2019 21:22:54 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.96) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Mon, 27 May 2019
 21:22:53 +0800
Subject: Re: [PATCH 1/4] ecryptfs: remove unnessesary null check in
 ecryptfs_keyring_auth_tok_for_sig
To:     <tyhicks@canonical.com>, <viro@zeniv.linux.org.uk>
References: <20190527131559.16088-1-yuehaibing@huawei.com>
CC:     <linux-kernel@vger.kernel.org>, <ecryptfs@vger.kernel.org>
From:   YueHaibing <yuehaibing@huawei.com>
Message-ID: <193c19d5-94df-de12-49a0-878c434a9069@huawei.com>
Date:   Mon, 27 May 2019 21:22:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190527131559.16088-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Pls ignore this, will fix patch title

On 2019/5/27 21:15, YueHaibing wrote:
> request_key and ecryptfs_get_encrypted_key never
> return a NULL pointer, so no need do a null check.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/ecryptfs/keystore.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index 95662fd46b1d..a1afb162b9d2 100644
> --- a/fs/ecryptfs/keystore.c
> +++ b/fs/ecryptfs/keystore.c
> @@ -1626,9 +1626,9 @@ int ecryptfs_keyring_auth_tok_for_sig(struct key **auth_tok_key,
>  	int rc = 0;
>  
>  	(*auth_tok_key) = request_key(&key_type_user, sig, NULL);
> -	if (!(*auth_tok_key) || IS_ERR(*auth_tok_key)) {
> +	if (IS_ERR(*auth_tok_key)) {
>  		(*auth_tok_key) = ecryptfs_get_encrypted_key(sig);
> -		if (!(*auth_tok_key) || IS_ERR(*auth_tok_key)) {
> +		if (IS_ERR(*auth_tok_key)) {
>  			printk(KERN_ERR "Could not find key with description: [%s]\n",
>  			      sig);
>  			rc = process_request_key_err(PTR_ERR(*auth_tok_key));
> 

