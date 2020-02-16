Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85CE816014B
	for <lists+ecryptfs@lfdr.de>; Sun, 16 Feb 2020 02:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgBPBHp (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sat, 15 Feb 2020 20:07:45 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:50385 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgBPBHp (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sat, 15 Feb 2020 20:07:45 -0500
Received: by mail-pj1-f68.google.com with SMTP id r67so5620961pjb.0
        for <ecryptfs@vger.kernel.org>; Sat, 15 Feb 2020 17:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gMukphk8NIj9E9vb7PEjrRZFu631dDjfFGIN4aTIAk0=;
        b=W9O//LCgmISNvWoKtOBnKMX1KaEfIDnwi9Clen7r9fXSEmeCcRXqx2zthDxOIeD9JR
         riypX8/JxYSIbvRHjHPiyW+8THUNJ9Oprk5fIqu5I3jJWsPyKVvxv78BxJ9AY/jxmi30
         pfzpOxgOAzxTyiD3dwBgbVEYd0HhK/lY0CkOxCwwCjRNgiMOnSEcy0zQTn3KADXrp9pE
         HGCR3epnegDmaK0Q+4AGKu5IexqUrIL9Mexv0DNFuiFVCACqdax5c9tBtXq1C7foh0Wj
         PDCFnjUXLr7bTkFQomlXImG4PGekk6vWdscQbqtyEocF2KE7cdHMlcuwGCq+EXe+vkRu
         qJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gMukphk8NIj9E9vb7PEjrRZFu631dDjfFGIN4aTIAk0=;
        b=VTvLxOZXAMDfT4+emDBbwt3+ic6ifWwv+VF/NSJFn1N8eR5phnnlEl5Hnz08Lsnng8
         WjkVR+JXCVIBLcF1J3V82afWo52U18K8UNglZ5BL0raJffkwlJACnvazXjxw2VmbwFnQ
         wuiYUaU18i0lRAPWny8XgnFmXtSRpfOOMPutsG42Gn7LhJ83oDk9V3oTylpG2y0kRiRX
         Z0v40VXfdGh4UCd4mJyOOqo7nrQvN2j8G4gKN+c6jHXNDB5BuVYCovwSd3Ynr4e9DS23
         RcU5AyES9l6yshxkzCMdDQQUd+nRndQ1/2n/UR1Hrwx3+Iz6GIy4rd7MQ5hEvVnUDyRh
         Yerg==
X-Gm-Message-State: APjAAAXOnuEWlXIpBsdR8Gt2WWrCbLVTmQhkhm+As6x55XpFH1RaHzv9
        YLMWYMNOtRCnLWy3hiFDFvtpKFiT14M=
X-Google-Smtp-Source: APXvYqyoyH/LwNM8G487ZgCiKw5p7SK5i4KJ0NoOC3axcDa2OB+Ir35JWeL8ifEhzmXdS5dGUQipVA==
X-Received: by 2002:a17:90a:348a:: with SMTP id p10mr12215432pjb.120.1581815264423;
        Sat, 15 Feb 2020 17:07:44 -0800 (PST)
Received: from elm (wsip-70-168-148-194.oc.oc.cox.net. [70.168.148.194])
        by smtp.gmail.com with ESMTPSA id k2sm12038016pgk.84.2020.02.15.17.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 17:07:43 -0800 (PST)
Date:   Sat, 15 Feb 2020 19:07:31 -0600
From:   Tyler Hicks <code@tyhicks.com>
To:     Brian Kubisiak <brian.kubisiak@gmail.com>
Cc:     ecryptfs@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: add mount option for specifying cipher driver.
Message-ID: <20200216010731.GA260140@elm>
References: <20200210153907.GA348@brian-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210153907.GA348@brian-desktop>
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2020-02-10 07:39:07, Brian Kubisiak wrote:
> When a file's crypto context is initialized, the underlying
> driver used for encryption/decryption is selected by the kernel
> based on the priorities of the different compatible transforms.
> 
> However, it is sometimes useful to force the use of a particular
> crypto driver regardless of the priorities in the kernel.
> 
> Add an ecryptfs_cipher_driver mount option that selects the
> default crypto driver to use for file encryption and decryption.
> The specified driver will be used for all new files and any
> existing files that use the same algorithm.

Hey Brian - Thanks for the patch! It is always nice to see a new
eCryptfs contributor. :)

I think your commit description does a good job of explaining what the
patch does but I'd like some more information about why you'd want this
change.

The existing ecryptfs_cipher mount option allows users to specify the
default cipher to use when creating new files during the lifetime of the
current mount (this preference essentially disappears at unmount). Of
course, this default is ignored in the case of opening an existing file
that was encrypted with a different cipher. I don't quite see how this
new ecryptfs_cipher_driver option comes into player. Can you elaborate
some on the use case you have?

Thanks!

Tyler

> 
> Signed-off-by: Brian Kubisiak <brian.kubisiak@gmail.com>
> ---
>  fs/ecryptfs/crypto.c          | 45 +++++++++++++++++++++++++++++------
>  fs/ecryptfs/ecryptfs_kernel.h |  4 ++++
>  fs/ecryptfs/main.c            | 17 +++++++++++++
>  fs/ecryptfs/super.c           |  4 +++-
>  4 files changed, 62 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index db1ef144c63a..a81f357dbf41 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -570,23 +570,45 @@ int ecryptfs_decrypt_page(struct page *page)
>   */
>  int ecryptfs_init_crypt_ctx(struct ecryptfs_crypt_stat *crypt_stat)
>  {
> +	struct ecryptfs_mount_crypt_stat *mount_crypt_stat;
>  	char *full_alg_name;
>  	int rc = -EINVAL;
> +	int must_free_alg_name = 0;
> 
>  	ecryptfs_printk(KERN_DEBUG,
>  			"Initializing cipher [%s]; strlen = [%d]; "
> -			"key_size_bits = [%zd]\n",
> +			"key_size_bits = [%zd]; driver = \"%s\"\n",
>  			crypt_stat->cipher, (int)strlen(crypt_stat->cipher),
> -			crypt_stat->key_size << 3);
> +			crypt_stat->key_size << 3, crypt_stat->driver);
>  	mutex_lock(&crypt_stat->cs_tfm_mutex);
>  	if (crypt_stat->tfm) {
>  		rc = 0;
>  		goto out_unlock;
>  	}
> -	rc = ecryptfs_crypto_api_algify_cipher_name(&full_alg_name,
> -						    crypt_stat->cipher, "cbc");
> -	if (rc)
> -		goto out_unlock;
> +
> +	mount_crypt_stat = crypt_stat->mount_crypt_stat;
> +	if (crypt_stat->driver[0]) {
> +		/* if a per-file crypto driver is set, use it */
> +		full_alg_name = crypt_stat->driver;
> +	} else if (mount_crypt_stat &&
> +		   mount_crypt_stat->global_default_cipher_driver_name[0] &&
> +		   !strcmp(crypt_stat->cipher,
> +			   mount_crypt_stat->global_default_cipher_name)) {
> +		/* if we do not find a per-file crypto driver, but we are using
> +		 * the same cipher as the mount's default, then use the mount's
> +		 * default cipher driver (if it is set)
> +		 */
> +		full_alg_name = mount_crypt_stat->
> +				global_default_cipher_driver_name;
> +	} else {
> +		/* default to letting the kernel pick the driver to use */
> +		rc = ecryptfs_crypto_api_algify_cipher_name(&full_alg_name,
> +							    crypt_stat->cipher,
> +							    "cbc");
> +		if (rc)
> +			goto out_unlock;
> +		must_free_alg_name = 1;
> +	}
>  	crypt_stat->tfm = crypto_alloc_skcipher(full_alg_name, 0, 0);
>  	if (IS_ERR(crypt_stat->tfm)) {
>  		rc = PTR_ERR(crypt_stat->tfm);
> @@ -600,7 +622,8 @@ int ecryptfs_init_crypt_ctx(struct ecryptfs_crypt_stat *crypt_stat)
>  				  CRYPTO_TFM_REQ_FORBID_WEAK_KEYS);
>  	rc = 0;
>  out_free:
> -	kfree(full_alg_name);
> +	if (must_free_alg_name)
> +		kfree(full_alg_name);
>  out_unlock:
>  	mutex_unlock(&crypt_stat->cs_tfm_mutex);
>  	return rc;
> @@ -757,6 +780,7 @@ static void ecryptfs_set_default_crypt_stat_vals(
>  						      mount_crypt_stat);
>  	ecryptfs_set_default_sizes(crypt_stat);
>  	strcpy(crypt_stat->cipher, ECRYPTFS_DEFAULT_CIPHER);
> +	crypt_stat->driver[0] = '\0';
>  	crypt_stat->key_size = ECRYPTFS_DEFAULT_KEY_BYTES;
>  	crypt_stat->flags &= ~(ECRYPTFS_KEY_VALID);
>  	crypt_stat->file_version = ECRYPTFS_FILE_VERSION;
> @@ -790,6 +814,7 @@ int ecryptfs_new_file_context(struct inode *ecryptfs_inode)
>  	    &ecryptfs_superblock_to_private(
>  		    ecryptfs_inode->i_sb)->mount_crypt_stat;
>  	int cipher_name_len;
> +	int driver_name_len;
>  	int rc = 0;
> 
>  	ecryptfs_set_default_crypt_stat_vals(crypt_stat, mount_crypt_stat);
> @@ -809,6 +834,12 @@ int ecryptfs_new_file_context(struct inode *ecryptfs_inode)
>  	       mount_crypt_stat->global_default_cipher_name,
>  	       cipher_name_len);
>  	crypt_stat->cipher[cipher_name_len] = '\0';
> +	driver_name_len =
> +		strlen(mount_crypt_stat->global_default_cipher_driver_name);
> +	memcpy(crypt_stat->driver,
> +	       mount_crypt_stat->global_default_cipher_driver_name,
> +	       driver_name_len);
> +	crypt_stat->driver[driver_name_len] = '\0';
>  	crypt_stat->key_size =
>  		mount_crypt_stat->global_default_cipher_key_size;
>  	ecryptfs_generate_new_key(crypt_stat);
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
> index 1c1a56be7ea2..91a0a3e9b4ae 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -127,6 +127,7 @@ ecryptfs_get_key_payload_data(struct key *key)
> 
>  #define ECRYPTFS_MAX_KEYSET_SIZE 1024
>  #define ECRYPTFS_MAX_CIPHER_NAME_SIZE 31
> +#define ECRYPTFS_MAX_CIPHER_DRIVER_NAME_SIZE 31
>  #define ECRYPTFS_MAX_NUM_ENC_KEYS 64
>  #define ECRYPTFS_MAX_IV_BYTES 16	/* 128 bits */
>  #define ECRYPTFS_SALT_BYTES 2
> @@ -240,6 +241,7 @@ struct ecryptfs_crypt_stat {
>  	struct crypto_shash *hash_tfm; /* Crypto context for generating
>  					* the initialization vectors */
>  	unsigned char cipher[ECRYPTFS_MAX_CIPHER_NAME_SIZE + 1];
> +	unsigned char driver[ECRYPTFS_MAX_CIPHER_DRIVER_NAME_SIZE + 1];
>  	unsigned char key[ECRYPTFS_MAX_KEY_BYTES];
>  	unsigned char root_iv[ECRYPTFS_MAX_IV_BYTES];
>  	struct list_head keysig_list;
> @@ -343,6 +345,8 @@ struct ecryptfs_mount_crypt_stat {
>  	size_t global_default_fn_cipher_key_bytes;
>  	unsigned char global_default_cipher_name[ECRYPTFS_MAX_CIPHER_NAME_SIZE
>  						 + 1];
> +	unsigned char global_default_cipher_driver_name[
> +		ECRYPTFS_MAX_CIPHER_DRIVER_NAME_SIZE + 1];
>  	unsigned char global_default_fn_cipher_name[
>  		ECRYPTFS_MAX_CIPHER_NAME_SIZE + 1];
>  	char global_default_fnek_sig[ECRYPTFS_SIG_SIZE_HEX + 1];
> diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
> index b8a7ce379ffe..6835dfefcb67 100644
> --- a/fs/ecryptfs/main.c
> +++ b/fs/ecryptfs/main.c
> @@ -155,6 +155,7 @@ void ecryptfs_put_lower_file(struct inode *inode)
> 
>  enum { ecryptfs_opt_sig, ecryptfs_opt_ecryptfs_sig,
>         ecryptfs_opt_cipher, ecryptfs_opt_ecryptfs_cipher,
> +       ecryptfs_opt_ecryptfs_cipher_driver,
>         ecryptfs_opt_ecryptfs_key_bytes,
>         ecryptfs_opt_passthrough, ecryptfs_opt_xattr_metadata,
>         ecryptfs_opt_encrypted_view, ecryptfs_opt_fnek_sig,
> @@ -168,6 +169,7 @@ static const match_table_t tokens = {
>  	{ecryptfs_opt_ecryptfs_sig, "ecryptfs_sig=%s"},
>  	{ecryptfs_opt_cipher, "cipher=%s"},
>  	{ecryptfs_opt_ecryptfs_cipher, "ecryptfs_cipher=%s"},
> +	{ecryptfs_opt_ecryptfs_cipher_driver, "ecryptfs_cipher_driver=%s"},
>  	{ecryptfs_opt_ecryptfs_key_bytes, "ecryptfs_key_bytes=%u"},
>  	{ecryptfs_opt_passthrough, "ecryptfs_passthrough"},
>  	{ecryptfs_opt_xattr_metadata, "ecryptfs_xattr_metadata"},
> @@ -246,6 +248,7 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  	int rc = 0;
>  	int sig_set = 0;
>  	int cipher_name_set = 0;
> +	int cipher_driver_set = 0;
>  	int fn_cipher_name_set = 0;
>  	int cipher_key_bytes;
>  	int cipher_key_bytes_set = 0;
> @@ -258,6 +261,8 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  	char *sig_src;
>  	char *cipher_name_dst;
>  	char *cipher_name_src;
> +	char *cipher_driver_dst;
> +	char *cipher_driver_src;
>  	char *fn_cipher_name_dst;
>  	char *fn_cipher_name_src;
>  	char *fnek_dst;
> @@ -301,6 +306,16 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  			cipher_name_dst[ECRYPTFS_MAX_CIPHER_NAME_SIZE] = '\0';
>  			cipher_name_set = 1;
>  			break;
> +		case ecryptfs_opt_ecryptfs_cipher_driver:
> +			cipher_driver_src = args[0].from;
> +			cipher_driver_dst =
> +				mount_crypt_stat->
> +				global_default_cipher_driver_name;
> +			strncpy(cipher_driver_dst, cipher_driver_src,
> +				ECRYPTFS_MAX_CIPHER_DRIVER_NAME_SIZE);
> +			cipher_driver_dst[ECRYPTFS_MAX_CIPHER_NAME_SIZE] = '\0';
> +			cipher_driver_set = 1;
> +			break;
>  		case ecryptfs_opt_ecryptfs_key_bytes:
>  			cipher_key_bytes_src = args[0].from;
>  			cipher_key_bytes =
> @@ -396,6 +411,8 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  		strcpy(mount_crypt_stat->global_default_cipher_name,
>  		       ECRYPTFS_DEFAULT_CIPHER);
>  	}
> +	if (!cipher_driver_set)
> +		mount_crypt_stat->global_default_cipher_driver_name[0] = '\0';
>  	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
>  	    && !fn_cipher_name_set)
>  		strcpy(mount_crypt_stat->global_default_fn_cipher_name,
> diff --git a/fs/ecryptfs/super.c b/fs/ecryptfs/super.c
> index 6b1853f1c06a..92d133173148 100644
> --- a/fs/ecryptfs/super.c
> +++ b/fs/ecryptfs/super.c
> @@ -149,7 +149,9 @@ static int ecryptfs_show_options(struct seq_file *m, struct dentry *root)
> 
>  	seq_printf(m, ",ecryptfs_cipher=%s",
>  		mount_crypt_stat->global_default_cipher_name);
> -
> +	if (mount_crypt_stat->global_default_cipher_driver_name[0])
> +		seq_printf(m, ",ecryptfs_cipher_driver=%s",
> +			   mount_crypt_stat->global_default_cipher_driver_name);
>  	if (mount_crypt_stat->global_default_cipher_key_size)
>  		seq_printf(m, ",ecryptfs_key_bytes=%zd",
>  			   mount_crypt_stat->global_default_cipher_key_size);
> --
> 2.25.0
> 
