Return-Path: <ecryptfs+bounces-186-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C649A5A2B
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 08:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4B081F20F77
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 06:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7B61EEF9;
	Mon, 21 Oct 2024 06:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="AJnAxqwK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q2M1CKDH"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84F8DF49
	for <ecryptfs@vger.kernel.org>; Mon, 21 Oct 2024 06:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729490960; cv=none; b=S3k5pXve0sl7qo5Jb19263t9+XgoX6A2yHIb5lwjNU3JpynYGCbCCuxz5uWT9WxjlGHPpsATrAAIxmd7zDTzyh4UUTG/SOuR/l03baTpRibYYzUSF2ZZ1/qvBX5OCgpB6i/6gsi2YstW78hv/GKGerfXY2sWIFiPPfa9QfTbQGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729490960; c=relaxed/simple;
	bh=a2z5X3SGxt5hPHrZhTjpGq2dbSpeEZQhmNBct8CYm34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OR1iiBCwQoXE1JwTCj8Zv/+UjDPHaESG/mzVcy4pRcEiCoPeipGygsot8KbaPjcE8/3h1WpEQgr4MZLeb8N6wAZ/bvP8PKCyl7/sBeWzSA91bS9O44iA9q4wDi6v2gDz/9z60ENVlsw1/c3xQfkFStBd2kQ0Zf2vpowov8xzUl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=AJnAxqwK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q2M1CKDH; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id EA15313803AC;
	Mon, 21 Oct 2024 02:09:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 21 Oct 2024 02:09:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1729490955; x=1729577355; bh=MW9I6ynWfu
	cr2sy7dfCKmXvMYZXLcEyT51gqhV51xU0=; b=AJnAxqwKwL8vJgQp4MZJDCz+Z8
	bOYBu2p9SJEF1V0hQbFOR7JJVnwy+CQyvGJI9cuN9z3nih0XRK9wleCcsjYLMZ8p
	HCKzz4xJ7oqv93MzaBJN7xdlOEIqFiY3t7KcdOP5Rj06p3qNwmkveN6t20qzmyti
	6d0H2R+tTlDi8I72vXwv4GWzDOZs6qT7YH1v1qAkv68Lbig/5yAK2YdA4AYLiy0T
	4IK60qeBFPx11uvJ+heG7Xz9JP9LaAarkUyOTXn3DgeRyknSVvUiIS2LCnbit4Sc
	lghRT/dtGzaRMUi1GthLY9O1ASHPZpCnwqcVsFnVvES/StiQAeQnszd4Rm/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729490955; x=1729577355; bh=MW9I6ynWfucr2sy7dfCKmXvMYZXL
	cEyT51gqhV51xU0=; b=Q2M1CKDH/+zy7V7WbH5cIyFiw0MIyy1MszxmS7fxRAfa
	24LL7SGKlX/Ga43Ucytcty+DQyZ278F1T1uJsqrcLFRazr6m8A62aFursBUedDEE
	NQQdbSdrqAIgq9X83tkUVH7tF2RaFC2PISpqYO08irmYt0YYJmeote1UTgcwCGt2
	LbgcNamFp1Cfwi3JLrBkVV2+7Ga3YUT0A0kUHUa9vbkit/F8kqPncwGqcQ/E8UpP
	sEIf+BJv3pNRBNZD9LWhgRAyUtACYW9XOZag8SUphxkeDiCLhLMxGQVrrDwaHjL8
	aAzj+UxXLfDvr3FnVdrmZ8wPMyyqofcewARa1/r6/Q==
X-ME-Sender: <xms:C_AVZ_R6JOKYPjpIOsZuOJZ8epDzYX4ND92Olay5r2rhFmakmaToOg>
    <xme:C_AVZwyu5UjAqQkFioiT2e-Woqw4oy-sT_D-QFvBG-VJ5UO0jOAhV7Y6ptQiC145H
    fXoLGQmqwhvRz5qRfg>
X-ME-Received: <xmr:C_AVZ007mjZ_I7nXz5rENtMOTwrU0r9vzKR_LMWqwDy-Dk-qPZ7O5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehkedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdortddttddv
    necuhfhrohhmpefvhihlvghrucfjihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeffudfhuddvheeuffeuffeftddukeeukeefgeevffdv
    gedvteffhfeigeeiheefvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghrtghpthhtohep
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrnhguvggvnhesrhgvughhrg
    htrdgtohhmpdhrtghpthhtohepvggtrhihphhtfhhssehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepsghrrghunhgvrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:C_AVZ_DZ0YY8SrLg6NnQr55kv4e4crrvvLKk_Ut0LfqP7FsqHa5asg>
    <xmx:C_AVZ4gvqzZmrBT75yai8pl7cpQk966bMC3eAGMGzV5Lb58IZlmI5A>
    <xmx:C_AVZzoJ3lUFVR6DePxGjOi0cx5blI2A50Bek_sGhsFyuHqHdFLHGg>
    <xmx:C_AVZzib6UsTSvDGN3TaXgzfzsHOTlAZnuGY1ttVCRlgeuzEvUkPOg>
    <xmx:C_AVZxucZDoHYNYSKIoNv7wTHcJNslGR4pYXl7cOUKNs40ji6t_-pS_9>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Oct 2024 02:09:15 -0400 (EDT)
Date: Mon, 21 Oct 2024 01:09:12 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: ecryptfs@vger.kernel.org, brauner@kernel.org
Subject: Re: [PATCH 2/2] ecryptfs: Convert ecryptfs to use the new mount API
Message-ID: <ZxXwCAydTXeLuVFm@redbud>
References: <20241007153448.6357-1-sandeen@redhat.com>
 <20241007153448.6357-3-sandeen@redhat.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007153448.6357-3-sandeen@redhat.com>

On 2024-10-07 10:27:43, Eric Sandeen wrote:
> Convert ecryptfs to the new mount API.
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> ---
>  fs/ecryptfs/ecryptfs_kernel.h |   7 -
>  fs/ecryptfs/main.c            | 393 +++++++++++++++++-----------------
>  2 files changed, 198 insertions(+), 202 deletions(-)
> 
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
> index d359ec085a70..c586c5db18b5 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -343,13 +343,6 @@ struct ecryptfs_mount_crypt_stat {
>  	unsigned char global_default_fn_cipher_name[
>  		ECRYPTFS_MAX_CIPHER_NAME_SIZE + 1];
>  	char global_default_fnek_sig[ECRYPTFS_SIG_SIZE_HEX + 1];
> -	/* Mount option status trackers */
> -	bool check_ruid;
> -	bool sig_set;
> -	bool cipher_name_set;
> -	bool cipher_key_bytes_set;
> -	bool fn_cipher_name_set;
> -	bool fn_cipher_key_bytes_set;
>  };
>  
>  /* superblock private data. */
> diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
> index d03f1c6ccc1c..a7829983304e 100644
> --- a/fs/ecryptfs/main.c
> +++ b/fs/ecryptfs/main.c
> @@ -15,10 +15,10 @@
>  #include <linux/module.h>
>  #include <linux/namei.h>
>  #include <linux/skbuff.h>
> -#include <linux/mount.h>
>  #include <linux/pagemap.h>
>  #include <linux/key.h>
> -#include <linux/parser.h>
> +#include <linux/fs_context.h>
> +#include <linux/fs_parser.h>
>  #include <linux/fs_stack.h>
>  #include <linux/slab.h>
>  #include <linux/magic.h>
> @@ -153,32 +153,31 @@ void ecryptfs_put_lower_file(struct inode *inode)
>  	}
>  }
>  
> -enum { ecryptfs_opt_sig, ecryptfs_opt_ecryptfs_sig,
> -       ecryptfs_opt_cipher, ecryptfs_opt_ecryptfs_cipher,
> -       ecryptfs_opt_ecryptfs_key_bytes,
> -       ecryptfs_opt_passthrough, ecryptfs_opt_xattr_metadata,
> -       ecryptfs_opt_encrypted_view, ecryptfs_opt_fnek_sig,
> -       ecryptfs_opt_fn_cipher, ecryptfs_opt_fn_cipher_key_bytes,
> -       ecryptfs_opt_unlink_sigs, ecryptfs_opt_mount_auth_tok_only,
> -       ecryptfs_opt_check_dev_ruid,
> -       ecryptfs_opt_err };
> -
> -static const match_table_t tokens = {
> -	{ecryptfs_opt_sig, "sig=%s"},
> -	{ecryptfs_opt_ecryptfs_sig, "ecryptfs_sig=%s"},
> -	{ecryptfs_opt_cipher, "cipher=%s"},
> -	{ecryptfs_opt_ecryptfs_cipher, "ecryptfs_cipher=%s"},
> -	{ecryptfs_opt_ecryptfs_key_bytes, "ecryptfs_key_bytes=%u"},
> -	{ecryptfs_opt_passthrough, "ecryptfs_passthrough"},
> -	{ecryptfs_opt_xattr_metadata, "ecryptfs_xattr_metadata"},
> -	{ecryptfs_opt_encrypted_view, "ecryptfs_encrypted_view"},
> -	{ecryptfs_opt_fnek_sig, "ecryptfs_fnek_sig=%s"},
> -	{ecryptfs_opt_fn_cipher, "ecryptfs_fn_cipher=%s"},
> -	{ecryptfs_opt_fn_cipher_key_bytes, "ecryptfs_fn_key_bytes=%u"},
> -	{ecryptfs_opt_unlink_sigs, "ecryptfs_unlink_sigs"},
> -	{ecryptfs_opt_mount_auth_tok_only, "ecryptfs_mount_auth_tok_only"},
> -	{ecryptfs_opt_check_dev_ruid, "ecryptfs_check_dev_ruid"},
> -	{ecryptfs_opt_err, NULL}
> +enum { Opt_sig, Opt_ecryptfs_sig,
> +       Opt_cipher, Opt_ecryptfs_cipher,
> +       Opt_ecryptfs_key_bytes,
> +       Opt_passthrough, Opt_xattr_metadata,
> +       Opt_encrypted_view, Opt_fnek_sig,
> +       Opt_fn_cipher, Opt_fn_cipher_key_bytes,
> +       Opt_unlink_sigs, Opt_mount_auth_tok_only,
> +       Opt_check_dev_ruid };

checkpatch complains about these lines starting with spaces rather than
a tab. I think that's a valid nit. Can we switch to tabs?

> +
> +static const struct fs_parameter_spec ecryptfs_fs_param_spec[] = {
> +	fsparam_string	("sig",			    Opt_sig),
> +	fsparam_string	("ecryptfs_sig",	    Opt_ecryptfs_sig),
> +	fsparam_string	("cipher",		    Opt_cipher),
> +	fsparam_string	("ecryptfs_cipher",	    Opt_ecryptfs_cipher),
> +	fsparam_u32	("ecryptfs_key_bytes",	    Opt_ecryptfs_key_bytes),
> +	fsparam_flag	("ecryptfs_passthrough",    Opt_passthrough),
> +	fsparam_flag	("ecryptfs_xattr_metadata", Opt_xattr_metadata),
> +	fsparam_flag	("ecryptfs_encrypted_view", Opt_encrypted_view),
> +	fsparam_string	("ecryptfs_fnek_sig",	    Opt_fnek_sig),
> +	fsparam_string	("ecryptfs_fn_cipher",	    Opt_fn_cipher),
> +	fsparam_u32	("ecryptfs_fn_key_bytes",   Opt_fn_cipher_key_bytes),
> +	fsparam_flag	("ecryptfs_unlink_sigs",    Opt_unlink_sigs),
> +	fsparam_flag	("ecryptfs_mount_auth_tok_only", Opt_mount_auth_tok_only),
> +	fsparam_flag	("ecryptfs_check_dev_ruid", Opt_check_dev_ruid),
> +	{}
>  };
>  
>  static int ecryptfs_init_global_auth_toks(
> @@ -219,19 +218,20 @@ static void ecryptfs_init_mount_crypt_stat(
>  	mount_crypt_stat->flags |= ECRYPTFS_MOUNT_CRYPT_STAT_INITIALIZED;
>  }
>  
> +struct ecryptfs_fs_context {
> +	/* Mount option status trackers */
> +	bool check_ruid;
> +	bool sig_set;
> +	bool cipher_name_set;
> +	bool cipher_key_bytes_set;
> +	bool fn_cipher_name_set;
> +	bool fn_cipher_key_bytes_set;
> +};
> +
>  /**
> - * ecryptfs_parse_options
> - * @sbi: The ecryptfs super block
> - * @options: The options passed to the kernel
> - * @check_ruid: set to 1 if device uid should be checked against the ruid
> - *
> - * Parse mount options:
> - * debug=N 	   - ecryptfs_verbosity level for debug output
> - * sig=XXX	   - description(signature) of the key to use
> - *
> - * Returns the dentry object of the lower-level (lower/interposed)
> - * directory; We want to mount our stackable file system on top of
> - * that lower directory.
> + * ecryptfs_parse_param
> + * @fc: The ecryptfs filesystem context
> + * @param: The mount parameter to parse
>   *
>   * The signature of the key to use must be the description of a key
>   * already in the keyring. Mounting will fail if the key can not be
> @@ -239,145 +239,118 @@ static void ecryptfs_init_mount_crypt_stat(
>   *
>   * Returns zero on success; non-zero on error
>   */
> -static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options)
> +static int ecryptfs_parse_param(
> +	struct fs_context *fc,
> +	struct fs_parameter *param)
>  {
> -	char *p;
> -	int rc = 0;
> -	int cipher_key_bytes;
> -	int fn_cipher_key_bytes;
> +	int rc;
> +	int opt;
> +	struct fs_parse_result result;
> +	struct ecryptfs_fs_context *ctx = fc->fs_private;
> +	struct ecryptfs_sb_info *sbi = fc->s_fs_info;
>  	struct ecryptfs_mount_crypt_stat *mount_crypt_stat =
>  		&sbi->mount_crypt_stat;
> -	substring_t args[MAX_OPT_ARGS];
> -	int token;
> -	char *sig_src;
> -	char *cipher_name_src;
> -	char *fn_cipher_name_src;
> -	char *fnek_src;
> -	char *cipher_key_bytes_src;
> -	char *fn_cipher_key_bytes_src;
> -
> -	if (!options) {
> -		rc = -EINVAL;
> -		goto out;
> -	}
> -	ecryptfs_init_mount_crypt_stat(mount_crypt_stat);
> -	while ((p = strsep(&options, ",")) != NULL) {
> -		if (!*p)
> -			continue;
> -		token = match_token(p, tokens, args);
> -		switch (token) {
> -		case ecryptfs_opt_sig:
> -		case ecryptfs_opt_ecryptfs_sig:
> -			sig_src = args[0].from;
> -			rc = ecryptfs_add_global_auth_tok(mount_crypt_stat,
> -							  sig_src, 0);
> -			if (rc) {
> -				printk(KERN_ERR "Error attempting to register "
> -				       "global sig; rc = [%d]\n", rc);
> -				goto out;
> -			}
> -			mount_crypt_stat->sig_set = 1;
> -			break;
> -		case ecryptfs_opt_cipher:
> -		case ecryptfs_opt_ecryptfs_cipher:
> -			cipher_name_src = args[0].from;
> -			strscpy(mount_crypt_stat->global_default_cipher_name,
> -				cipher_name_src);
> -			mount_crypt_stat->cipher_name_set = 1;
> -			break;
> -		case ecryptfs_opt_ecryptfs_key_bytes:
> -			cipher_key_bytes_src = args[0].from;
> -			cipher_key_bytes =
> -				(int)simple_strtol(cipher_key_bytes_src,
> -						   &cipher_key_bytes_src, 0);
> -			mount_crypt_stat->global_default_cipher_key_size =
> -				cipher_key_bytes;
> -			mount_crypt_stat->cipher_key_bytes_set = 1;
> -			break;
> -		case ecryptfs_opt_passthrough:
> -			mount_crypt_stat->flags |=
> -				ECRYPTFS_PLAINTEXT_PASSTHROUGH_ENABLED;
> -			break;
> -		case ecryptfs_opt_xattr_metadata:
> -			mount_crypt_stat->flags |=
> -				ECRYPTFS_XATTR_METADATA_ENABLED;
> -			break;
> -		case ecryptfs_opt_encrypted_view:
> -			mount_crypt_stat->flags |=
> -				ECRYPTFS_XATTR_METADATA_ENABLED;
> -			mount_crypt_stat->flags |=
> -				ECRYPTFS_ENCRYPTED_VIEW_ENABLED;
> -			break;
> -		case ecryptfs_opt_fnek_sig:
> -			fnek_src = args[0].from;
> -			strscpy(mount_crypt_stat->global_default_fnek_sig,
> -				fnek_src);
> -			rc = ecryptfs_add_global_auth_tok(
> -				mount_crypt_stat,
> -				mount_crypt_stat->global_default_fnek_sig,
> -				ECRYPTFS_AUTH_TOK_FNEK);
> -			if (rc) {
> -				printk(KERN_ERR "Error attempting to register "
> -				       "global fnek sig [%s]; rc = [%d]\n",
> -				       mount_crypt_stat->global_default_fnek_sig,
> -				       rc);
> -				goto out;
> -			}
> -			mount_crypt_stat->flags |=
> -				(ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES
> -				 | ECRYPTFS_GLOBAL_ENCFN_USE_MOUNT_FNEK);
> -			break;
> -		case ecryptfs_opt_fn_cipher:
> -			fn_cipher_name_src = args[0].from;
> -			strscpy(mount_crypt_stat->global_default_fn_cipher_name,
> -				fn_cipher_name_src);
> -			mount_crypt_stat->fn_cipher_name_set = 1;
> -			break;
> -		case ecryptfs_opt_fn_cipher_key_bytes:
> -			fn_cipher_key_bytes_src = args[0].from;
> -			fn_cipher_key_bytes =
> -				(int)simple_strtol(fn_cipher_key_bytes_src,
> -						   &fn_cipher_key_bytes_src, 0);
> -			mount_crypt_stat->global_default_fn_cipher_key_bytes =
> -				fn_cipher_key_bytes;
> -			mount_crypt_stat->fn_cipher_key_bytes_set = 1;
> -			break;
> -		case ecryptfs_opt_unlink_sigs:
> -			mount_crypt_stat->flags |= ECRYPTFS_UNLINK_SIGS;
> -			break;
> -		case ecryptfs_opt_mount_auth_tok_only:
> -			mount_crypt_stat->flags |=
> -				ECRYPTFS_GLOBAL_MOUNT_AUTH_TOK_ONLY;
> -			break;
> -		case ecryptfs_opt_check_dev_ruid:
> -			mount_crypt_stat->check_ruid = 1;
> -			break;
> -		case ecryptfs_opt_err:
> -		default:
> -			printk(KERN_WARNING
> -			       "%s: eCryptfs: unrecognized option [%s]\n",
> -			       __func__, p);

I think we lost this error message, which can be helpful for users when
debugging mount(2) failures.

See below in your new code where we handle the default case for what I
think we should include.

> +
> +	opt = fs_parse(fc, ecryptfs_fs_param_spec, param, &result);
> +	if (opt < 0)
> +		return opt;
> +
> +	switch (opt) {
> +	case Opt_sig:
> +	case Opt_ecryptfs_sig:
> +		rc = ecryptfs_add_global_auth_tok(mount_crypt_stat,
> +						  param->string, 0);
> +		if (rc) {
> +			printk(KERN_ERR "Error attempting to register "
> +			       "global sig; rc = [%d]\n", rc);

Are we expected to be using errorf() and friends here rather than
printk()?

> +			return rc;;

There's an extra semicolon here.

>  		}
> +		ctx->sig_set = 1;
> +		break;
> +	case Opt_cipher:
> +	case Opt_ecryptfs_cipher:
> +		strscpy(mount_crypt_stat->global_default_cipher_name,
> +			param->string);
> +		ctx->cipher_name_set = 1;
> +		break;
> +	case Opt_ecryptfs_key_bytes:
> +		mount_crypt_stat->global_default_cipher_key_size =
> +			result.uint_32;
> +		ctx->cipher_key_bytes_set = 1;
> +		break;
> +	case Opt_passthrough:
> +		mount_crypt_stat->flags |=
> +			ECRYPTFS_PLAINTEXT_PASSTHROUGH_ENABLED;
> +		break;
> +	case Opt_xattr_metadata:
> +		mount_crypt_stat->flags |= ECRYPTFS_XATTR_METADATA_ENABLED;
> +		break;
> +	case Opt_encrypted_view:
> +		mount_crypt_stat->flags |= ECRYPTFS_XATTR_METADATA_ENABLED;
> +		mount_crypt_stat->flags |= ECRYPTFS_ENCRYPTED_VIEW_ENABLED;
> +		break;
> +	case Opt_fnek_sig:
> +		strscpy(mount_crypt_stat->global_default_fnek_sig,
> +			param->string);
> +		rc = ecryptfs_add_global_auth_tok(
> +			mount_crypt_stat,
> +			mount_crypt_stat->global_default_fnek_sig,
> +			ECRYPTFS_AUTH_TOK_FNEK);
> +		if (rc) {
> +			printk(KERN_ERR "Error attempting to register "
> +			       "global fnek sig [%s]; rc = [%d]\n",
> +			       mount_crypt_stat->global_default_fnek_sig, rc);

Same errorf() question here.

> +			return rc;
> +		}
> +		mount_crypt_stat->flags |=
> +			(ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES
> +			 | ECRYPTFS_GLOBAL_ENCFN_USE_MOUNT_FNEK);
> +		break;
> +	case Opt_fn_cipher:
> +		strscpy(mount_crypt_stat->global_default_fn_cipher_name,
> +			param->string);
> +		ctx->fn_cipher_name_set = 1;
> +		break;
> +	case Opt_fn_cipher_key_bytes:
> +		mount_crypt_stat->global_default_fn_cipher_key_bytes =
> +			result.uint_32;
> +		ctx->fn_cipher_key_bytes_set = 1;
> +		break;
> +	case Opt_unlink_sigs:
> +		mount_crypt_stat->flags |= ECRYPTFS_UNLINK_SIGS;
> +		break;
> +	case Opt_mount_auth_tok_only:
> +		mount_crypt_stat->flags |= ECRYPTFS_GLOBAL_MOUNT_AUTH_TOK_ONLY;
> +		break;
> +	case Opt_check_dev_ruid:
> +		ctx->check_ruid = 1;
> +		break;
> +	default:

To retain the unrecognized option warning, I think we need this:


                printk(KERN_WARNING "%s: eCryptfs: unrecognized option [%s]\n",
                       __func__, param->key);

Tyler

> +		return -EINVAL;
>  	}
>  
> -out:
> -	return rc;
> +	return 0;
>  }
>  
> -static int ecryptfs_validate_options(
> -		struct ecryptfs_mount_crypt_stat *mount_crypt_stat)
> +static int ecryptfs_validate_options(struct fs_context *fc)
>  {
>  	int rc = 0;
>  	u8 cipher_code;
> +	struct ecryptfs_fs_context *ctx = fc->fs_private;
> +	struct ecryptfs_sb_info *sbi = fc->s_fs_info;
> +	struct ecryptfs_mount_crypt_stat *mount_crypt_stat;
> +
> +
> +	mount_crypt_stat = &sbi->mount_crypt_stat;
>  
> -	if (!mount_crypt_stat->sig_set) {
> +	if (!ctx->sig_set) {
>  		rc = -EINVAL;
>  		ecryptfs_printk(KERN_ERR, "You must supply at least one valid "
>  				"auth tok signature as a mount "
>  				"parameter; see the eCryptfs README\n");
>  		goto out;
>  	}
> -	if (!mount_crypt_stat->cipher_name_set) {
> +	if (!ctx->cipher_name_set) {
>  		int cipher_name_len = strlen(ECRYPTFS_DEFAULT_CIPHER);
>  
>  		BUG_ON(cipher_name_len > ECRYPTFS_MAX_CIPHER_NAME_SIZE);
> @@ -385,13 +358,13 @@ static int ecryptfs_validate_options(
>  		       ECRYPTFS_DEFAULT_CIPHER);
>  	}
>  	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
> -	    && !mount_crypt_stat->fn_cipher_name_set)
> +	    && !ctx->fn_cipher_name_set)
>  		strcpy(mount_crypt_stat->global_default_fn_cipher_name,
>  		       mount_crypt_stat->global_default_cipher_name);
> -	if (!mount_crypt_stat->cipher_key_bytes_set)
> +	if (!ctx->cipher_key_bytes_set)
>  		mount_crypt_stat->global_default_cipher_key_size = 0;
>  	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
> -	    && !mount_crypt_stat->fn_cipher_key_bytes_set)
> +	    && !ctx->fn_cipher_key_bytes_set)
>  		mount_crypt_stat->global_default_fn_cipher_key_bytes =
>  			mount_crypt_stat->global_default_cipher_key_size;
>  
> @@ -455,17 +428,14 @@ struct kmem_cache *ecryptfs_sb_info_cache;
>  static struct file_system_type ecryptfs_fs_type;
>  
>  /*
> - * ecryptfs_mount
> - * @fs_type: The filesystem type that the superblock should belong to
> - * @flags: The flags associated with the mount
> - * @dev_name: The path to mount over
> - * @raw_data: The options passed into the kernel
> + * ecryptfs_get_tree
> + * @fc: The filesystem context
>   */
> -static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags,
> -			const char *dev_name, void *raw_data)
> +static int ecryptfs_get_tree(struct fs_context *fc)
>  {
>  	struct super_block *s;
> -	struct ecryptfs_sb_info *sbi;
> +	struct ecryptfs_fs_context *ctx = fc->fs_private;
> +	struct ecryptfs_sb_info *sbi = fc->s_fs_info;
>  	struct ecryptfs_mount_crypt_stat *mount_crypt_stat;
>  	struct ecryptfs_dentry_info *root_info;
>  	const char *err = "Getting sb failed";
> @@ -473,31 +443,20 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  	struct path path;
>  	int rc;
>  
> -	sbi = kmem_cache_zalloc(ecryptfs_sb_info_cache, GFP_KERNEL);
> -	if (!sbi) {
> -		rc = -ENOMEM;
> -		goto out;
> -	}
> -
> -	if (!dev_name) {
> +	if (!fc->source) {
>  		rc = -EINVAL;
>  		err = "Device name cannot be null";
>  		goto out;
>  	}
>  
> -	rc = ecryptfs_parse_options(sbi, raw_data);
> -	if (rc) {
> -		err = "Error parsing options";
> -		goto out;
> -	}
>  	mount_crypt_stat = &sbi->mount_crypt_stat;
> -	rc = ecryptfs_validate_options(mount_crypt_stat);
> +	rc = ecryptfs_validate_options(fc);
>  	if (rc) {
>  		err = "Error validationg options";
>  		goto out;
>  	}
>  
> -	s = sget(fs_type, NULL, set_anon_super, flags, NULL);
> +	s = sget_fc(fc, NULL, set_anon_super_fc);
>  	if (IS_ERR(s)) {
>  		rc = PTR_ERR(s);
>  		goto out;
> @@ -516,7 +475,7 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  	s->s_d_op = &ecryptfs_dops;
>  
>  	err = "Reading sb failed";
> -	rc = kern_path(dev_name, LOOKUP_FOLLOW | LOOKUP_DIRECTORY, &path);
> +	rc = kern_path(fc->source, LOOKUP_FOLLOW | LOOKUP_DIRECTORY, &path);
>  	if (rc) {
>  		ecryptfs_printk(KERN_WARNING, "kern_path() failed\n");
>  		goto out1;
> @@ -535,7 +494,7 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  		goto out_free;
>  	}
>  
> -	if (mount_crypt_stat->check_ruid &&
> +	if (ctx->check_ruid &&
>  	    !uid_eq(d_inode(path.dentry)->i_uid, current_uid())) {
>  		rc = -EPERM;
>  		printk(KERN_ERR "Mount of device (uid: %d) not owned by "
> @@ -551,7 +510,7 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  	 * Set the POSIX ACL flag based on whether they're enabled in the lower
>  	 * mount.
>  	 */
> -	s->s_flags = flags & ~SB_POSIXACL;
> +	s->s_flags = fc->sb_flags & ~SB_POSIXACL;
>  	s->s_flags |= path.dentry->d_sb->s_flags & SB_POSIXACL;
>  
>  	/**
> @@ -594,19 +553,19 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  	root_info->lower_path = path;
>  
>  	s->s_flags |= SB_ACTIVE;
> -	return dget(s->s_root);
> +	fc->root = dget(s->s_root);
> +	return 0;
>  
>  out_free:
>  	path_put(&path);
>  out1:
>  	deactivate_locked_super(s);
>  out:
> -	if (sbi) {
> +	if (sbi)
>  		ecryptfs_destroy_mount_crypt_stat(&sbi->mount_crypt_stat);
> -		kmem_cache_free(ecryptfs_sb_info_cache, sbi);
> -	}
> +
>  	printk(KERN_ERR "%s; rc = [%d]\n", err, rc);
> -	return ERR_PTR(rc);
> +	return rc;
>  }
>  
>  /**
> @@ -625,10 +584,54 @@ static void ecryptfs_kill_block_super(struct super_block *sb)
>  	kmem_cache_free(ecryptfs_sb_info_cache, sb_info);
>  }
>  
> +static void ecryptfs_free_fc(struct fs_context *fc)
> +{
> +	struct ecryptfs_fs_context *ctx = fc->fs_private;
> +	struct ecryptfs_sb_info *sbi = fc->s_fs_info;
> +
> +	kfree(ctx);
> +
> +	if (sbi) {
> +		ecryptfs_destroy_mount_crypt_stat(&sbi->mount_crypt_stat);
> +		kmem_cache_free(ecryptfs_sb_info_cache, sbi);
> +	}
> +}
> +
> +static const struct fs_context_operations ecryptfs_context_ops = {
> +	.free		= ecryptfs_free_fc,
> +	.parse_param	= ecryptfs_parse_param,
> +	.get_tree	= ecryptfs_get_tree,
> +	.reconfigure	= NULL,
> +};
> +
> +static int ecryptfs_init_fs_context(struct fs_context *fc)
> +{
> +	struct ecryptfs_fs_context *ctx;
> +	struct ecryptfs_sb_info *sbi = NULL;
> +
> +	ctx = kzalloc(sizeof(struct ecryptfs_fs_context), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +	sbi = kmem_cache_zalloc(ecryptfs_sb_info_cache, GFP_KERNEL);
> +	if (!sbi) {
> +		kfree(ctx);
> +		ctx = NULL;
> +		return -ENOMEM;
> +	}
> +
> +	ecryptfs_init_mount_crypt_stat(&sbi->mount_crypt_stat);
> +
> +	fc->fs_private = ctx;
> +	fc->s_fs_info = sbi;
> +	fc->ops = &ecryptfs_context_ops;
> +	return 0;
> +}
> +
>  static struct file_system_type ecryptfs_fs_type = {
>  	.owner = THIS_MODULE,
>  	.name = "ecryptfs",
> -	.mount = ecryptfs_mount,
> +	.init_fs_context = ecryptfs_init_fs_context,
> +	.parameters = ecryptfs_fs_param_spec,
>  	.kill_sb = ecryptfs_kill_block_super,
>  	.fs_flags = 0
>  };
> -- 
> 2.46.0
> 

