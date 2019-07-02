Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC9705D6DE
	for <lists+ecryptfs@lfdr.de>; Tue,  2 Jul 2019 21:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfGBTZ5 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 2 Jul 2019 15:25:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60394 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfGBTZ5 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 2 Jul 2019 15:25:57 -0400
Received: from 162-237-133-238.lightspeed.rcsntx.sbcglobal.net ([162.237.133.238] helo=elm)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <tyhicks@canonical.com>)
        id 1hiOPa-000302-Sf; Tue, 02 Jul 2019 19:25:55 +0000
Date:   Tue, 2 Jul 2019 14:25:51 -0500
From:   Tyler Hicks <tyhicks@canonical.com>
To:     Hariprasad Kelam <hariprasad.kelam@gmail.com>
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs: ecryptfs: crypto: Change return type of
 ecryptfs_process_flags
Message-ID: <20190702192551.GB8314@elm>
References: <20190702174723.GA4600@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702174723.GA4600@hari-Inspiron-1545>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2019-07-02 23:17:24, Hariprasad Kelam wrote:
> Change return type of ecryptfs_process_flags from int to void. As it
> never fails.
> 
> fixes below issue reported by coccicheck
> 
> s/ecryptfs/crypto.c:870:5-7: Unneeded variable: "rc". Return "0" on line
> 883
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---

Thanks for the cleanup! I made some minor tweaks, as noted below, and
pushed it to the eCryptfs next branch.

>  fs/ecryptfs/crypto.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index 509a767..55a633e 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -864,10 +864,9 @@ static struct ecryptfs_flag_map_elem ecryptfs_flag_map[] = {
>   *
>   * Returns zero on success; non-zero if the flag set is invalid

I deleted this line from the function documentation.

>   */
> -static int ecryptfs_process_flags(struct ecryptfs_crypt_stat *crypt_stat,
> +static void ecryptfs_process_flags(struct ecryptfs_crypt_stat *crypt_stat,
>  				  char *page_virt, int *bytes_read)
>  {
> -	int rc = 0;
>  	int i;
>  	u32 flags;
>  
> @@ -880,7 +879,6 @@ static int ecryptfs_process_flags(struct ecryptfs_crypt_stat *crypt_stat,
>  	/* Version is in top 8 bits of the 32-bit flag vector */
>  	crypt_stat->file_version = ((flags >> 24) & 0xFF);
>  	(*bytes_read) = 4;
> -	return rc;
>  }
>  
>  /**
> @@ -1306,12 +1304,9 @@ static int ecryptfs_read_headers_virt(char *page_virt,
>  	if (!(crypt_stat->flags & ECRYPTFS_I_SIZE_INITIALIZED))
>  		ecryptfs_i_size_init(page_virt, d_inode(ecryptfs_dentry));
>  	offset += MAGIC_ECRYPTFS_MARKER_SIZE_BYTES;
> -	rc = ecryptfs_process_flags(crypt_stat, (page_virt + offset),
> +	ecryptfs_process_flags(crypt_stat, (page_virt + offset),
>  				    &bytes_read);

The line was short enough to move the last argument up to the same line
so I went ahead and did that.

Thanks again!

Tyler

> -	if (rc) {
> -		ecryptfs_printk(KERN_WARNING, "Error processing flags\n");
> -		goto out;
> -	}
> +
>  	if (crypt_stat->file_version > ECRYPTFS_SUPPORTED_FILE_VERSION) {
>  		ecryptfs_printk(KERN_WARNING, "File version is [%d]; only "
>  				"file version [%d] is supported by this "
> -- 
> 2.7.4
> 
