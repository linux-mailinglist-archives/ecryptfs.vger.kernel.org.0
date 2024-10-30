Return-Path: <ecryptfs+bounces-215-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1999B6FA5
	for <lists+ecryptfs@lfdr.de>; Wed, 30 Oct 2024 23:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5283283377
	for <lists+ecryptfs@lfdr.de>; Wed, 30 Oct 2024 22:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74381991DF;
	Wed, 30 Oct 2024 22:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="mGQazezi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UsnErZQy"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA5E1CEEB6
	for <ecryptfs@vger.kernel.org>; Wed, 30 Oct 2024 22:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730325830; cv=none; b=Gtu3g9vnuNheToOZd8gx0T0MfQJdsqNALeH9jky1SfPwege//TCr9cgklfkvov2Qzkv1UurRyYh/017JVsVWbkvKJhNQYSZOh59PV2QR0jChFcmbh0NBE3WPhrZCBcfCgJlhvqNPsHnmolfVseG9dkleKdfxiax3VwpsjPSRQpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730325830; c=relaxed/simple;
	bh=SE2YJuyFYmFjxfGntH6B4ovVTrioiKi8PoN+SyRuzAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPPFOAc2mhq+mZrDyi5v7PzIuG9e6+RQiY/LoU7l8gIx5DInnrFueC3IrPmhyBoi/UEYbueMBaLa64+8ixooz5tmSMhrWuHe3ujicYHHFr7avmXF+ufP0vTxZ/lpSbJPtvgOFvMyULBZGxNfaFsCBJebFZ34tj8NtJD61jnD2sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=mGQazezi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UsnErZQy; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 764BD11400F1;
	Wed, 30 Oct 2024 18:03:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Wed, 30 Oct 2024 18:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730325825; x=1730412225; bh=OtFScKHnMz
	BlM82ihj2H2FUGxaBfWJaxjJhYFjTW82M=; b=mGQazeziEFyH5NSq/jP/7FLiwF
	F6BDjAVkmgTp1NXwdlaQFaHpSszCRksX1wg3JqAgieCJhAWJhnqgDdCeWSWYs3zs
	Ez3Z4bUEKgXgWekOqIctD3r0od1oDXX2D8znqzatfKsFgkEAYHjzS9q87I2LYr7p
	S6pkTd5q55Cm5Ths1G51pD4cBKaMKwNS4kvNwXjl2dV+b8iKgM5uMUf6h0/txu1F
	aa8+UFSHTlvoCitqFWTLY0XpCM/PKKrS4Ktp1q6Vks92Ci7Y62Jy/zhrBKZ3la2W
	5j85mU2GA+/89I/hLpZ5bbhlD2RRYzZyBzgaG+oVp77shR+W/Mh6x8e3KYgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730325825; x=1730412225; bh=OtFScKHnMzBlM82ihj2H2FUGxaBfWJaxjJh
	YFjTW82M=; b=UsnErZQyBQdV6HgEsPdZ6BK+YR+TAwcN35r7Y9fjHOhv5iCryVS
	ykUGCxETUeOz43OncrBGG0yZN+HdZYv1FzSHTW7DdZJP91VC1ESoJBByfAwkCjka
	5qUiTNj6W9erbShTdMjV+x5ymMBKyveyBysBAEPr+8k/9T58hXwgdiYy3RdD8Aii
	i6NMDYMJsst3mELgz7c3UUbEIfRUExQcQe/8PfgxGKNncBq6Ygw5rrj+DqHrbaMi
	UXno1VB9/wZ1RYtTWQg59EatLaLHZsBA/8V+YqMYK6IofiJoGR1nICa38ELTwYbu
	IZwQK28UcfNGGLeFU83lkcRyYzwClyxRYYQ==
X-ME-Sender: <xms:Qa0iZwyEYvnpqMihsHWIpihxPIATbprIeL_ga3r97mWmZ5TddbfEcg>
    <xme:Qa0iZ0QdmxxQrTp6n4S5Kv8kNOlYPKObJnF4POz20ZehORC_Zqsb7rS2Y6v9fmdhy
    Ct-FwU1HZKDJg2cUII>
X-ME-Received: <xmr:Qa0iZyXmZnSBIBG45ME7MCnYzkeqkazZ0NSCzUmOi2MpyDgxDZlCw8Ea2_KnvBiqBbhs3Fk4nepcVghFli1tAzI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefvhihlvghrucfjihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedvhedvtddthfefhfdtgfelheefgefgudejueevkedu
    veekvdegjedttdefgfelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghrtghpthhtohep
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrnhguvggvnhesrhgvughhrg
    htrdgtohhmpdhrtghpthhtohepvggtrhihphhtfhhssehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepsghrrghunhgvrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Qa0iZ-inlIe4q9HLeTtILPK7jTQ7GCkmujE0GA2En813A94Nd47aYw>
    <xmx:Qa0iZyCySX9Z-m88P9gVEdDS4YB89xcFJw_i0smkGF9U2LVK_bbtMA>
    <xmx:Qa0iZ_Iz0N5yI9fh3_RAajqO345bVQGa29MUvu_RIhnC8whAJsjnZQ>
    <xmx:Qa0iZ5AbBx92TT9e3j1ITXa79fue6YV77kBBf9eW_-SivOhCGogMLg>
    <xmx:Qa0iZ9NlvL7vBrm80k-kd2tEvjgR7ajzfJvsjF3IOrzjweFp5iqt51xw>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Oct 2024 18:03:44 -0400 (EDT)
Date: Wed, 30 Oct 2024 17:03:42 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: ecryptfs@vger.kernel.org, brauner@kernel.org
Subject: Re: [PATCH V2 2/2] ecryptfs: Convert ecryptfs to use the new mount
 API
Message-ID: <ZyKtPmt/BXctOywG@redbud>
References: <20241028143359.605061-1-sandeen@redhat.com>
 <20241028143359.605061-3-sandeen@redhat.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028143359.605061-3-sandeen@redhat.com>

On 2024-10-28 09:32:39, Eric Sandeen wrote:
> Convert ecryptfs to the new mount API.
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Acked-by: Tyler Hicks <code@tyhicks.com>

I'm facing some troubles with my testing setup and cannot do the
additional testing that you mentioned in the cover letter to ensure that
we're still handling the case of mounting with various wrong options.
I'll get that sorted out in the next day or two and report back.

Tyler

> ---
>  fs/ecryptfs/ecryptfs_kernel.h |   7 -
>  fs/ecryptfs/main.c            | 392 +++++++++++++++++-----------------
>  2 files changed, 197 insertions(+), 202 deletions(-)
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
> index d03f1c6ccc1c..c9aa80e534c2 100644
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
> @@ -153,32 +153,30 @@ void ecryptfs_put_lower_file(struct inode *inode)
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
> +enum {
> +	Opt_sig, Opt_ecryptfs_sig, Opt_cipher, Opt_ecryptfs_cipher,
> +	Opt_ecryptfs_key_bytes, Opt_passthrough, Opt_xattr_metadata,
> +	Opt_encrypted_view, Opt_fnek_sig, Opt_fn_cipher,
> +	Opt_fn_cipher_key_bytes, Opt_unlink_sigs, Opt_mount_auth_tok_only,
> +	Opt_check_dev_ruid
> +};
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
> @@ -219,19 +217,20 @@ static void ecryptfs_init_mount_crypt_stat(
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
> @@ -239,145 +238,118 @@ static void ecryptfs_init_mount_crypt_stat(
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
> +			return rc;
> +		}
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
> +			return rc;
>  		}
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
>  
> -	if (!mount_crypt_stat->sig_set) {
> +
> +	mount_crypt_stat = &sbi->mount_crypt_stat;
> +
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
> @@ -385,13 +357,13 @@ static int ecryptfs_validate_options(
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
> @@ -455,17 +427,14 @@ struct kmem_cache *ecryptfs_sb_info_cache;
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
> @@ -473,31 +442,20 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
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
> @@ -516,7 +474,7 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  	s->s_d_op = &ecryptfs_dops;
>  
>  	err = "Reading sb failed";
> -	rc = kern_path(dev_name, LOOKUP_FOLLOW | LOOKUP_DIRECTORY, &path);
> +	rc = kern_path(fc->source, LOOKUP_FOLLOW | LOOKUP_DIRECTORY, &path);
>  	if (rc) {
>  		ecryptfs_printk(KERN_WARNING, "kern_path() failed\n");
>  		goto out1;
> @@ -535,7 +493,7 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  		goto out_free;
>  	}
>  
> -	if (mount_crypt_stat->check_ruid &&
> +	if (ctx->check_ruid &&
>  	    !uid_eq(d_inode(path.dentry)->i_uid, current_uid())) {
>  		rc = -EPERM;
>  		printk(KERN_ERR "Mount of device (uid: %d) not owned by "
> @@ -551,7 +509,7 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  	 * Set the POSIX ACL flag based on whether they're enabled in the lower
>  	 * mount.
>  	 */
> -	s->s_flags = flags & ~SB_POSIXACL;
> +	s->s_flags = fc->sb_flags & ~SB_POSIXACL;
>  	s->s_flags |= path.dentry->d_sb->s_flags & SB_POSIXACL;
>  
>  	/**
> @@ -594,19 +552,19 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
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
> @@ -625,10 +583,54 @@ static void ecryptfs_kill_block_super(struct super_block *sb)
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

