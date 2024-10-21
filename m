Return-Path: <ecryptfs+bounces-185-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A139A5A27
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 08:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 420361C2132E
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 06:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA170194132;
	Mon, 21 Oct 2024 06:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="VimK3YSm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cp0p5sCZ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521CE19925B
	for <ecryptfs@vger.kernel.org>; Mon, 21 Oct 2024 06:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729490770; cv=none; b=XWSN2gzekdnTlc02GNrtyfCYl3mXgShWQe2wMtb6UgsRPhwCU3Uqt+QjSbTR8By0nL2q0FPR1wJdzC3CGsN0zCUN4FFihNCr6XCMyNj51PpB+RybKR9FCuEY+SwfS5Oupg2btOcXhhoIwGCY8/Q46kyRxGLucZfWHJs/HncrErE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729490770; c=relaxed/simple;
	bh=vnu9OOizGq6/+A2ZL2mfJFEyZpWx6Xoa8kcEpYKFFMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRwtCCMCIsQOcriOjrY6ZuVSp9mvcORZg0mncMftuRW8I77Klw5hEanQS3FnKMuvTZUlzsVWHeCH2O6MekAadVNDO6FdZUyDBEbmbSjIJmhM/9CxwuA9Xqk12aYTZy8spMuZfuQa0b914C4F+zrzHIJ3u80wCglYtx2aQMmly3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=VimK3YSm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cp0p5sCZ; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 6289F138043D;
	Mon, 21 Oct 2024 02:06:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 21 Oct 2024 02:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1729490767; x=1729577167; bh=x04eU3nbnY
	5tGwLaxtSdDR6/DX8uUCAlz0o7y/5bowI=; b=VimK3YSmN2nwv/kwrvQUdyFZ4n
	c3WlCMzED/lEJo/mnKa6cmiQ2Uq7A/OQFQLQgwNMIfPvTTB7w8YSxWnKc3Zu4Ayn
	NskY+VTiYifC0RWFjccCvkc5wWTpCVJ+Xco2x5vewwREb1NTPhGBy4l3YdEX7MJI
	vEZBbQT1iRwL1/MEMT+lB5z8mCEOzI0XrOs45U2JKfWGGPjcOM59fB91OUsjlH89
	psERtoaW6Oc7hjfLI/9MkS9VGdDhTMq2/qrWpv05Ccp+sCDDBP0MVxwwcnjYlQ1D
	zRxg1nvUlZbXpYUGsczAvqgPsWSLE5ZM8AKdtBQ8OU9rmYPxafYIbHsfC1Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729490767; x=1729577167; bh=x04eU3nbnY5tGwLaxtSdDR6/DX8u
	UCAlz0o7y/5bowI=; b=cp0p5sCZD1IPRTY3wEg3DL3CKhzepsL3VesmX7gRtQSL
	EoewdTV67hkVJKR6Bspzyzuxum6q6mQ0WMYKPCrjXhsAY43w8HHvr8jnSpsI+KvT
	tzZQAe2fS9ev//wO4CLOSvi7ZqNZjbfZCRK1372/PWXj1Y73LKphENg486tRzGfX
	9MlwX5sxrys+rQqsdVOQPNwlHP49NV/w7mG+jYMpOfP0UZQ0h4er3stCM1ydQgz+
	DWdPc0FMBW/8r8ycQJe+R+2e4hy13FXWYNQ2Dnrct3D13gWyP5FQkfSL6f5FcSqk
	yX0POzhbtipul7gcedDYaFq/HuoIakfmxwNp+Y/5mA==
X-ME-Sender: <xms:T-8VZ090-F6rtHZFln0Fkkv6tqrf_uB4LrKLmv2qrUiCsRVXIxDW3g>
    <xme:T-8VZ8ubEqtv9nxD4oCsakQjXzjpYY-TxUc3mavmpKVtwJx4QFlZ_KTUiaMtHP6JG
    Z3448K_1GeE1XzwZxc>
X-ME-Received: <xmr:T-8VZ6APaS9R07mWCMS6BYyS45pK6A4qDMrRR98XteuXDSh79-eLSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehkedguddtiecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:T-8VZ0fTKABGxst3qQaalmXDSUognEYt2g5gFL6mY-_URRklpS_rEQ>
    <xmx:T-8VZ5OD61IOTVIUCcXYiROfo-u-8o7u0I8of8Jfstkh4_VqYdqbig>
    <xmx:T-8VZ-mz5yznW_v98vdrXc5KwCYBN8FiVlLiVtWVUUMarrgarOoF7g>
    <xmx:T-8VZ7uBtKVX6-xe6Qg4RNliM9NmMrF_dL6Dz3Xu4Zo3z68bYo8exw>
    <xmx:T-8VZ6pN8U-dXDSdLW39CW2eFEX4XVrN8zlwI54UVSryOm4OMEgl0Axm>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Oct 2024 02:06:06 -0400 (EDT)
Date: Mon, 21 Oct 2024 01:06:02 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: ecryptfs@vger.kernel.org, brauner@kernel.org
Subject: Re: [PATCH 1/2] ecryptfs: Factor out mount option validation
Message-ID: <ZxXvSonU1QQluW1F@redbud>
References: <20241007153448.6357-1-sandeen@redhat.com>
 <20241007153448.6357-2-sandeen@redhat.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007153448.6357-2-sandeen@redhat.com>

On 2024-10-07 10:27:42, Eric Sandeen wrote:
> Under the new mount API, mount options are parsed one at a time.
> Any validation that examines multiple options must be done after parsing
> is complete, so factor out a ecryptfs_validate_options() which can be
> called separately.
> 
> To facilitate this, temporarily move the local variables that tracked
> whether various options have been set in the parsing function, into the
> ecryptfs_mount_crypt_stat structure so that they can be examined later.
> 
> These will be moved to a more ephemeral struct in the mount api conversion
> patch to follow.
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Thanks, Eric!

I was going to push back on storing the *_set bools in the
ecryptfs_mount_crypt_stat struct since those bools only meant to be
short lived and that struct lives for the lifetime of the mount.
However, I see you clean that up in the following patch.

Acked-by: Tyler Hicks <code@tyhicks.com>

Tyler

> ---
>  fs/ecryptfs/ecryptfs_kernel.h |  7 +++++
>  fs/ecryptfs/main.c            | 55 ++++++++++++++++++++---------------
>  2 files changed, 38 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
> index c586c5db18b5..d359ec085a70 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -343,6 +343,13 @@ struct ecryptfs_mount_crypt_stat {
>  	unsigned char global_default_fn_cipher_name[
>  		ECRYPTFS_MAX_CIPHER_NAME_SIZE + 1];
>  	char global_default_fnek_sig[ECRYPTFS_SIG_SIZE_HEX + 1];
> +	/* Mount option status trackers */
> +	bool check_ruid;
> +	bool sig_set;
> +	bool cipher_name_set;
> +	bool cipher_key_bytes_set;
> +	bool fn_cipher_name_set;
> +	bool fn_cipher_key_bytes_set;
>  };
>  
>  /* superblock private data. */
> diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
> index 577c56302314..d03f1c6ccc1c 100644
> --- a/fs/ecryptfs/main.c
> +++ b/fs/ecryptfs/main.c
> @@ -239,18 +239,12 @@ static void ecryptfs_init_mount_crypt_stat(
>   *
>   * Returns zero on success; non-zero on error
>   */
> -static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
> -				  uid_t *check_ruid)
> +static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options)
>  {
>  	char *p;
>  	int rc = 0;
> -	int sig_set = 0;
> -	int cipher_name_set = 0;
> -	int fn_cipher_name_set = 0;
>  	int cipher_key_bytes;
> -	int cipher_key_bytes_set = 0;
>  	int fn_cipher_key_bytes;
> -	int fn_cipher_key_bytes_set = 0;
>  	struct ecryptfs_mount_crypt_stat *mount_crypt_stat =
>  		&sbi->mount_crypt_stat;
>  	substring_t args[MAX_OPT_ARGS];
> @@ -261,9 +255,6 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  	char *fnek_src;
>  	char *cipher_key_bytes_src;
>  	char *fn_cipher_key_bytes_src;
> -	u8 cipher_code;
> -
> -	*check_ruid = 0;
>  
>  	if (!options) {
>  		rc = -EINVAL;
> @@ -285,14 +276,14 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  				       "global sig; rc = [%d]\n", rc);
>  				goto out;
>  			}
> -			sig_set = 1;
> +			mount_crypt_stat->sig_set = 1;
>  			break;
>  		case ecryptfs_opt_cipher:
>  		case ecryptfs_opt_ecryptfs_cipher:
>  			cipher_name_src = args[0].from;
>  			strscpy(mount_crypt_stat->global_default_cipher_name,
>  				cipher_name_src);
> -			cipher_name_set = 1;
> +			mount_crypt_stat->cipher_name_set = 1;
>  			break;
>  		case ecryptfs_opt_ecryptfs_key_bytes:
>  			cipher_key_bytes_src = args[0].from;
> @@ -301,7 +292,7 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  						   &cipher_key_bytes_src, 0);
>  			mount_crypt_stat->global_default_cipher_key_size =
>  				cipher_key_bytes;
> -			cipher_key_bytes_set = 1;
> +			mount_crypt_stat->cipher_key_bytes_set = 1;
>  			break;
>  		case ecryptfs_opt_passthrough:
>  			mount_crypt_stat->flags |=
> @@ -340,7 +331,7 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  			fn_cipher_name_src = args[0].from;
>  			strscpy(mount_crypt_stat->global_default_fn_cipher_name,
>  				fn_cipher_name_src);
> -			fn_cipher_name_set = 1;
> +			mount_crypt_stat->fn_cipher_name_set = 1;
>  			break;
>  		case ecryptfs_opt_fn_cipher_key_bytes:
>  			fn_cipher_key_bytes_src = args[0].from;
> @@ -349,7 +340,7 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  						   &fn_cipher_key_bytes_src, 0);
>  			mount_crypt_stat->global_default_fn_cipher_key_bytes =
>  				fn_cipher_key_bytes;
> -			fn_cipher_key_bytes_set = 1;
> +			mount_crypt_stat->fn_cipher_key_bytes_set = 1;
>  			break;
>  		case ecryptfs_opt_unlink_sigs:
>  			mount_crypt_stat->flags |= ECRYPTFS_UNLINK_SIGS;
> @@ -359,7 +350,7 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  				ECRYPTFS_GLOBAL_MOUNT_AUTH_TOK_ONLY;
>  			break;
>  		case ecryptfs_opt_check_dev_ruid:
> -			*check_ruid = 1;
> +			mount_crypt_stat->check_ruid = 1;
>  			break;
>  		case ecryptfs_opt_err:
>  		default:
> @@ -368,14 +359,25 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  			       __func__, p);
>  		}
>  	}
> -	if (!sig_set) {
> +
> +out:
> +	return rc;
> +}
> +
> +static int ecryptfs_validate_options(
> +		struct ecryptfs_mount_crypt_stat *mount_crypt_stat)
> +{
> +	int rc = 0;
> +	u8 cipher_code;
> +
> +	if (!mount_crypt_stat->sig_set) {
>  		rc = -EINVAL;
>  		ecryptfs_printk(KERN_ERR, "You must supply at least one valid "
>  				"auth tok signature as a mount "
>  				"parameter; see the eCryptfs README\n");
>  		goto out;
>  	}
> -	if (!cipher_name_set) {
> +	if (!mount_crypt_stat->cipher_name_set) {
>  		int cipher_name_len = strlen(ECRYPTFS_DEFAULT_CIPHER);
>  
>  		BUG_ON(cipher_name_len > ECRYPTFS_MAX_CIPHER_NAME_SIZE);
> @@ -383,13 +385,13 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
>  		       ECRYPTFS_DEFAULT_CIPHER);
>  	}
>  	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
> -	    && !fn_cipher_name_set)
> +	    && !mount_crypt_stat->fn_cipher_name_set)
>  		strcpy(mount_crypt_stat->global_default_fn_cipher_name,
>  		       mount_crypt_stat->global_default_cipher_name);
> -	if (!cipher_key_bytes_set)
> +	if (!mount_crypt_stat->cipher_key_bytes_set)
>  		mount_crypt_stat->global_default_cipher_key_size = 0;
>  	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
> -	    && !fn_cipher_key_bytes_set)
> +	    && !mount_crypt_stat->fn_cipher_key_bytes_set)
>  		mount_crypt_stat->global_default_fn_cipher_key_bytes =
>  			mount_crypt_stat->global_default_cipher_key_size;
>  
> @@ -469,7 +471,6 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  	const char *err = "Getting sb failed";
>  	struct inode *inode;
>  	struct path path;
> -	uid_t check_ruid;
>  	int rc;
>  
>  	sbi = kmem_cache_zalloc(ecryptfs_sb_info_cache, GFP_KERNEL);
> @@ -484,12 +485,17 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  		goto out;
>  	}
>  
> -	rc = ecryptfs_parse_options(sbi, raw_data, &check_ruid);
> +	rc = ecryptfs_parse_options(sbi, raw_data);
>  	if (rc) {
>  		err = "Error parsing options";
>  		goto out;
>  	}
>  	mount_crypt_stat = &sbi->mount_crypt_stat;
> +	rc = ecryptfs_validate_options(mount_crypt_stat);
> +	if (rc) {
> +		err = "Error validationg options";
> +		goto out;
> +	}
>  
>  	s = sget(fs_type, NULL, set_anon_super, flags, NULL);
>  	if (IS_ERR(s)) {
> @@ -529,7 +535,8 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
>  		goto out_free;
>  	}
>  
> -	if (check_ruid && !uid_eq(d_inode(path.dentry)->i_uid, current_uid())) {
> +	if (mount_crypt_stat->check_ruid &&
> +	    !uid_eq(d_inode(path.dentry)->i_uid, current_uid())) {
>  		rc = -EPERM;
>  		printk(KERN_ERR "Mount of device (uid: %d) not owned by "
>  		       "requested user (uid: %d)\n",
> -- 
> 2.46.0
> 

