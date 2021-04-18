Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7013636F6
	for <lists+ecryptfs@lfdr.de>; Sun, 18 Apr 2021 19:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbhDRRRi (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 18 Apr 2021 13:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhDRRRh (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sun, 18 Apr 2021 13:17:37 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47BF1C061760
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 10:17:09 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 92-20020a9d02e50000b029028fcc3d2c9eso7938229otl.0
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e5GgiM22pWP1aZFXv8DlTMTJWkPxYONKNPyw29JTa8c=;
        b=sx/0/GpEEQnF3d1Y2TiqNlAkGIfHSJobRKzgvg0geuratkSOutC46rWJai44mLLiOG
         2WWPeSCUVHYdCAC65Uqvpi4fjvR+NuD2IvE4tZ2gnEdxf0FKVU8ffO/lGEjWeuVQe/nr
         Au6BKp047FWVKLwy0ojt6rRdugNHtJBa8+TiWdsTRuS5OXqc2LckEa+Vj7sdYNyVwu/T
         IZx0dueQqyBYxVmdaXfTYpX/diTJNou8bZMK448bstO7hr8IDN/pzPaxSfzuTRhVBLO7
         tVaQNpW95PzGVyXydtAT+YqW8cF483x6+ddqrxodRxFvjfpZERr2VvE/P5+PHlRna2Yc
         nXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e5GgiM22pWP1aZFXv8DlTMTJWkPxYONKNPyw29JTa8c=;
        b=lv4uBHqEAtbN5zAE//ZgFwJo1apYl+EaLKYKsLUk2FZwIBK43JrymGLvdKZ62NiXVZ
         VNIzqlkmaMehIFQBE9FQy3/wFfoJFl5um2XeB+KqqVLi7AgFCdMfANQic8GQS7EQIA7I
         +DxIg4ET/lvbr13Qtc3NqEb+ys9F4tp15/KtCdMQ+SxEA7WOARtVcA3WrLdIVSiNo57Y
         AHFieZswSYF74jBdGUhbt3iiiNAeRGFv7IwkeUsHaKpBceaFORuFvNrFByUatFKbmClt
         cKr0SCXQTTA0wJ1TtCZFPwUlb45By5ghm3Vyyei40byylc5Q8srL4kNWArG3aSR5JXIP
         3EIQ==
X-Gm-Message-State: AOAM530woejBEzMVcCzMox4xwNoeDVv68RiBP3Wdulr36Kaq1HXMVl90
        mJDfxDJrdhBkhAffakO6V+t7SzBK7Uhrhlnc
X-Google-Smtp-Source: ABdhPJy8kBG2Vk09CXpw35klZjk1rhjZN5AwiykTU1Uu3CiQedfXQ061SQkqc1TyJdDwpTYie1W7SQ==
X-Received: by 2002:a05:6830:1f02:: with SMTP id u2mr11630748otg.308.1618766228489;
        Sun, 18 Apr 2021 10:17:08 -0700 (PDT)
Received: from elm (162-237-133-238.lightspeed.rcsntx.sbcglobal.net. [162.237.133.238])
        by smtp.gmail.com with ESMTPSA id g5sm2686461oiy.24.2021.04.18.10.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 10:17:08 -0700 (PDT)
Date:   Sun, 18 Apr 2021 12:17:00 -0500
From:   Tyler Hicks <code@tyhicks.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
        "Michael A. Halcrow" <mahalcro@us.ibm.com>,
        "Michael C. Thompson" <mcthomps@us.ibm.com>,
        ecryptfs@vger.kernel.org
Subject: Re: [PATCH 28/31] fs: ecryptfs: crypto: Supply some missing param
 descriptions and demote abuses
Message-ID: <20210418171700.GA398325@elm>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
 <20210330164458.1625478-29-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330164458.1625478-29-lee.jones@linaro.org>
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2021-03-30 17:44:55, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  fs/ecryptfs/crypto.c:29: warning: expecting prototype for eCryptfs(). Prototype was for DECRYPT() instead
>  fs/ecryptfs/crypto.c:360: warning: Function parameter or member 'crypt_stat' not described in 'lower_offset_for_page'
>  fs/ecryptfs/crypto.c:360: warning: Function parameter or member 'page' not described in 'lower_offset_for_page'
>  fs/ecryptfs/crypto.c:637: warning: Function parameter or member 'crypt_stat' not described in 'ecryptfs_compute_root_iv'
>  fs/ecryptfs/crypto.c:1386: warning: Function parameter or member 'ecryptfs_dentry' not described in 'ecryptfs_read_metadata'
>  fs/ecryptfs/crypto.c:1463: warning: Function parameter or member 'filename' not described in 'ecryptfs_encrypt_filename'
>  fs/ecryptfs/crypto.c:1463: warning: Function parameter or member 'mount_crypt_stat' not described in 'ecryptfs_encrypt_filename'
>  fs/ecryptfs/crypto.c:1897: warning: Function parameter or member 'encoded_name_size' not described in 'ecryptfs_encrypt_and_encode_filename'
>  fs/ecryptfs/crypto.c:1897: warning: Function parameter or member 'mount_crypt_stat' not described in 'ecryptfs_encrypt_and_encode_filename'
>  fs/ecryptfs/crypto.c:1897: warning: Function parameter or member 'name_size' not described in 'ecryptfs_encrypt_and_encode_filename'
>  fs/ecryptfs/crypto.c:1897: warning: Excess function parameter 'crypt_stat' description in 'ecryptfs_encrypt_and_encode_filename'
>  fs/ecryptfs/crypto.c:1897: warning: Excess function parameter 'length' description in 'ecryptfs_encrypt_and_encode_filename'
>  fs/ecryptfs/crypto.c:2006: warning: Function parameter or member 'sb' not described in 'ecryptfs_decode_and_decrypt_filename'
>  fs/ecryptfs/crypto.c:2006: warning: Excess function parameter 'ecryptfs_dir_dentry' description in 'ecryptfs_decode_and_decrypt_filename'
> 
> Cc: Tyler Hicks <code@tyhicks.com>
> Cc: Eric Biggers <ebiggers@google.com>
> Cc: "Michael A. Halcrow" <mahalcro@us.ibm.com>
> Cc: "Michael C. Thompson" <mcthomps@us.ibm.com>
> Cc: ecryptfs@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  fs/ecryptfs/crypto.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index 7671412b8f0b4..cdcbcf7b5b6c7 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * eCryptfs: Linux filesystem encryption layer
>   *
>   * Copyright (C) 1997-2004 Erez Zadok
> @@ -350,7 +350,7 @@ static int crypt_scatterlist(struct ecryptfs_crypt_stat *crypt_stat,
>  	return rc;
>  }
>  
> -/**
> +/*
>   * lower_offset_for_page
>   *
>   * Convert an eCryptfs page index into a lower byte offset
> @@ -627,9 +627,8 @@ void ecryptfs_set_default_sizes(struct ecryptfs_crypt_stat *crypt_stat)
>  	}
>  }
>  
> -/**
> +/*
>   * ecryptfs_compute_root_iv
> - * @crypt_stats
>   *
>   * On error, sets the root IV to all 0's.
>   */
> @@ -1370,7 +1369,7 @@ int ecryptfs_read_and_validate_xattr_region(struct dentry *dentry,
>  	return rc;
>  }
>  
> -/**
> +/*
>   * ecryptfs_read_metadata
>   *
>   * Common entry point for reading file metadata. From here, we could
> @@ -1448,7 +1447,7 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
>  	return rc;
>  }
>  
> -/**
> +/*
>   * ecryptfs_encrypt_filename - encrypt filename
>   *
>   * CBC-encrypts the filename. We do not want to encrypt the same
> @@ -1876,10 +1875,11 @@ ecryptfs_decode_from_filename(unsigned char *dst, size_t *dst_size,
>  
>  /**
>   * ecryptfs_encrypt_and_encode_filename - converts a plaintext file name to cipher text
> - * @crypt_stat: The crypt_stat struct associated with the file anem to encode
> + * @encoded_name: The encrypted name
> + * @encoded_name_size: Length of the encrypted name
> + * @mount_crypt_stat: The crypt_stat struct associated with the file anem to encode

s/anem/name/

I'll fix this up when applying.

Tyler

>   * @name: The plaintext name
> - * @length: The length of the plaintext
> - * @encoded_name: The encypted name
> + * @name_size: The length of the plaintext name
>   *
>   * Encrypts and encodes a filename into something that constitutes a
>   * valid filename for a filesystem, with printable characters.
> @@ -1991,7 +1991,7 @@ static bool is_dot_dotdot(const char *name, size_t name_size)
>   * ecryptfs_decode_and_decrypt_filename - converts the encoded cipher text name to decoded plaintext
>   * @plaintext_name: The plaintext name
>   * @plaintext_name_size: The plaintext name size
> - * @ecryptfs_dir_dentry: eCryptfs directory dentry
> + * @sb: Ecryptfs's super_block
>   * @name: The filename in cipher text
>   * @name_size: The cipher text name size
>   *
> -- 
> 2.27.0
> 
