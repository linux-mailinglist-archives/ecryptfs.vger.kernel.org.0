Return-Path: <ecryptfs+bounces-1184-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGYnLiJK02legwcAu9opvQ
	(envelope-from <ecryptfs+bounces-1184-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 07:52:34 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC23A1AAB
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 07:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBD35300F14F
	for <lists+ecryptfs@lfdr.de>; Mon,  6 Apr 2026 05:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E1A3382C9;
	Mon,  6 Apr 2026 05:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="j2R1mifb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qVyahMET"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27113090D7;
	Mon,  6 Apr 2026 05:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775454750; cv=none; b=hV+2zeKV8kjH3/YOENuQELwZizeju1VRHeFmPmAFDwW+6WHEa+CrSV7G37FvlcXKpTvoJjeVKsOWiyv4ovD6NdW10u4IpnKp5Z95TOlW08g3aVKYgor4aE3MnU+5VChTbbisVI/HINt9MxJVORUw9m4wr+ve8h2d931gqA8PvhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775454750; c=relaxed/simple;
	bh=StyoTtiFauK1NiIHx2nmnaY/PWfJuf/+KfywM5p8fFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOjTJ6iyvonRiZPoGICzIsWRyLbX1rFmvxeD2lMtlHjEFwsCEUGykFIhRRc/yBqyo2xhkyyQo0qowleYoCKZOfdN0Fd9GyYZJIbIzSUCA6CPt/WY/qeb/IdHNqJm/6q94t0OkLt3svgnKBEb5QZo1mn0DvZLthdV37YHGHHlc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=j2R1mifb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qVyahMET; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 236951D00060;
	Mon,  6 Apr 2026 01:52:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 06 Apr 2026 01:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775454747; x=1775541147; bh=Hcq4NYCmJB
	JQ46frfHk7PYTcI6CUok84E6cFHjFP7fw=; b=j2R1mifbFJTWpZkcvS5Ykl3wJF
	1mcpSucTkJMqpGgmlI9Ld6RCrIHDPzIC1LbI1BQiXQmQMPWIvBrrh332jAbL27oo
	+0WRX8sD18funGAqvixE9i99czLMIfVR1H0jnFpkpyDLa5yJhQWboWRaBh9n2wHx
	2e5RCvuAvBzN+HeprRf8I1UH5tu7vzUtt4AkADshM4Qhwji4vHR1fheIX+LFgPbJ
	XbpE00JTmTcfP8m3ogACxCFQsVy7eJhe4bv1mVgeY+N9PSmR+eBo3NN+YXebXl6g
	L+Dq11vY1ePrGIEfGsBXtrcbB/YK50wGll2vCYq0pg//9KSLseB4Xfb4urDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775454747; x=1775541147; bh=Hcq4NYCmJBJQ46frfHk7PYTcI6CUok84E6c
	FHjFP7fw=; b=qVyahMET2Z569JWdszrlBQlEpb9uABMjS6eyWNcRoZiy1Og77lG
	ecATPFYNd2SwIXFwx5xJnfrkgNXZ/NRJgm95EBknrFaefzCI5OKgxiW67cHXKvb6
	0tqe9LpnrqP0INc+TG4oU+7m4pLq3d4q8bxRwrWxxYOVryspCrTO4i1AxM1Miy7I
	u8AY4rLBMP+ctxD9R5lM2EgGy1l/UMal+lRrOCfzVyDUIWnpnqL1mwOSxkRm9INY
	8252aW5cKpDXn8D1yM18CMQLyeqVQaeIgKh4LA60zTQs6X20OYPfk+1SKwmEMXjq
	cjdEvnvYokD4JfBc0eMO2deMWj2PgH/knBg==
X-ME-Sender: <xms:G0rTaWYZ3c5B_o218_OEC1j5usEDxX9YOVe2rGPgNUK4vNZUH68j9A>
    <xme:G0rTaRL4x38rTsX6Gu_uJobpTDlaxROHSYQEIFmOsZUQh1E-887_OgH1YQR8EIFBX
    vPdJLrZ-wyHJH-H6DrocpdGdYt-F1YUgi0U6wunf8YEed1hpdEkSyg>
X-ME-Received: <xmr:G0rTaUBH_sdAFIcp0ZtAYzecPXRBWKtHUjbm39MP0iHnXSDYzbhlnPM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduieeklecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    ffudfhuddvheeuffeuffeftddukeeukeefgeevffdvgedvteffhfeigeeiheefvdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesth
    ihhhhitghkshdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohephhgthheslhhsthdruggvpdhrtghpthhtohepvggtrhihphhtfhhsse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:G0rTaWpX2dQzbE5hMk9SysH4M33TtEKDxogVd1YEKf26AbWE-thvvg>
    <xmx:G0rTafh9ntQR18nDNZql2tVxAd-8ng9pdezaLwwLbPSy1U7CnYPMEA>
    <xmx:G0rTaTAzd4C4L5j4tbhTWuIWKfZMggFaSZMhYVwkiK2UQF9HZR6o0Q>
    <xmx:G0rTaUH55wg-1SC9mxSC58UJsrkD1E26IhISRvytui4LVXl6P95MMQ>
    <xmx:G0rTaVtjsHpLic-fHTKDcrxFvvu6xBLCbc9pL5s47FLQhQYxwx9wMr2K>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 01:52:26 -0400 (EDT)
Date: Mon, 6 Apr 2026 00:52:05 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Christoph Hellwig <hch@lst.de>
Cc: ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/7] ecryptfs: streamline truncate_upper
Message-ID: <adNKBUZrbBzZGCpf@yaupon>
References: <20260331153752.4049454-1-hch@lst.de>
 <20260331153752.4049454-2-hch@lst.de>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331153752.4049454-2-hch@lst.de>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-1184-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[ecryptfs];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1CCC23A1AAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-31 17:37:22, Christoph Hellwig wrote:
> Use a few strategic gotos to keep reduce indentation and keep the
> main reduce size flow outside of branches.  Switch all touched comments

I think that first sentence was supposed to say, "Use a few strategic
gotos to reduce indentation and keep the main flow outside of branches."
Could you confirm?

> to normal kernel style and avoid breaks in printed strings for all
> the code touched.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ecryptfs/inode.c | 115 +++++++++++++++++++++++---------------------
>  1 file changed, 60 insertions(+), 55 deletions(-)
> 
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 8ab014db3e03..cf20873a9cc4 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -725,83 +725,88 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
>  static int truncate_upper(struct dentry *dentry, struct iattr *ia,
>  			  struct iattr *lower_ia)
>  {
> -	int rc = 0;
>  	struct inode *inode = d_inode(dentry);
>  	struct ecryptfs_crypt_stat *crypt_stat;
>  	loff_t i_size = i_size_read(inode);
>  	loff_t lower_size_before_truncate;
>  	loff_t lower_size_after_truncate;
> +	size_t num_zeros;
> +	int rc;
>  
>  	if (unlikely((ia->ia_size == i_size))) {
>  		lower_ia->ia_valid &= ~ATTR_SIZE;
>  		return 0;
>  	}
> +
>  	rc = ecryptfs_get_lower_file(dentry, inode);
>  	if (rc)
>  		return rc;
> -	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
> -	/* Switch on growing or shrinking file */
> +
>  	if (ia->ia_size > i_size) {
>  		char zero[] = { 0x00 };
>  
> +		/*
> +		 * Write a single 0 at the last position of the file; this
> +		 * triggers code that will fill in 0's throughout the
> +		 * intermediate portion of the previous end of the file and the
> +		 * new and of the file.

Since we're touching this comment, we might as well fix the typo:

 s/new and of the file/new end of the file/

I can do both of these small changes when merging, if we don't have a
better reason to respin this series.

Tyler

> +		 */
> +		rc = ecryptfs_write(inode, zero, ia->ia_size - 1, 1);
>  		lower_ia->ia_valid &= ~ATTR_SIZE;
> -		/* Write a single 0 at the last position of the file;
> -		 * this triggers code that will fill in 0's throughout
> -		 * the intermediate portion of the previous end of the
> -		 * file and the new and of the file */
> -		rc = ecryptfs_write(inode, zero,
> -				    (ia->ia_size - 1), 1);
> -	} else { /* ia->ia_size < i_size_read(inode) */
> -		/* We're chopping off all the pages down to the page
> -		 * in which ia->ia_size is located. Fill in the end of
> -		 * that page from (ia->ia_size & ~PAGE_MASK) to
> -		 * PAGE_SIZE with zeros. */
> -		size_t num_zeros = (PAGE_SIZE
> -				    - (ia->ia_size & ~PAGE_MASK));
> -
> -		if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
> -			truncate_setsize(inode, ia->ia_size);
> -			lower_ia->ia_size = ia->ia_size;
> -			lower_ia->ia_valid |= ATTR_SIZE;
> -			goto out;
> -		}
> -		if (num_zeros) {
> -			char *zeros_virt;
> +		goto out;
> +	}
>  
> -			zeros_virt = kzalloc(num_zeros, GFP_KERNEL);
> -			if (!zeros_virt) {
> -				rc = -ENOMEM;
> -				goto out;
> -			}
> -			rc = ecryptfs_write(inode, zeros_virt,
> -					    ia->ia_size, num_zeros);
> -			kfree(zeros_virt);
> -			if (rc) {
> -				printk(KERN_ERR "Error attempting to zero out "
> -				       "the remainder of the end page on "
> -				       "reducing truncate; rc = [%d]\n", rc);
> -				goto out;
> -			}
> -		}
> +	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
> +	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
>  		truncate_setsize(inode, ia->ia_size);
> -		rc = ecryptfs_write_inode_size_to_metadata(inode);
> +		lower_ia->ia_size = ia->ia_size;
> +		lower_ia->ia_valid |= ATTR_SIZE;
> +		goto out;
> +	}
> +
> +	/*
> +	 * We're chopping off all the pages down to the page in which
> +	 * ia->ia_size is located. Fill in the end of that page from
> +	 * (ia->ia_size & ~PAGE_MASK) to PAGE_SIZE with zeros.
> +	 */
> +	num_zeros = PAGE_SIZE - (ia->ia_size & ~PAGE_MASK);
> +	if (num_zeros) {
> +		char *zeros_virt;
> +
> +		zeros_virt = kzalloc(num_zeros, GFP_KERNEL);
> +		if (!zeros_virt) {
> +			rc = -ENOMEM;
> +			goto out;
> +		}
> +		rc = ecryptfs_write(inode, zeros_virt, ia->ia_size, num_zeros);
> +		kfree(zeros_virt);
>  		if (rc) {
> -			printk(KERN_ERR	"Problem with "
> -			       "ecryptfs_write_inode_size_to_metadata; "
> -			       "rc = [%d]\n", rc);
> +			pr_err("Error attempting to zero out the remainder of the end page on reducing truncate; rc = [%d]\n",
> +				rc);
>  			goto out;
>  		}
> -		/* We are reducing the size of the ecryptfs file, and need to
> -		 * know if we need to reduce the size of the lower file. */
> -		lower_size_before_truncate =
> -		    upper_size_to_lower_size(crypt_stat, i_size);
> -		lower_size_after_truncate =
> -		    upper_size_to_lower_size(crypt_stat, ia->ia_size);
> -		if (lower_size_after_truncate < lower_size_before_truncate) {
> -			lower_ia->ia_size = lower_size_after_truncate;
> -			lower_ia->ia_valid |= ATTR_SIZE;
> -		} else
> -			lower_ia->ia_valid &= ~ATTR_SIZE;
> +	}
> +	truncate_setsize(inode, ia->ia_size);
> +	rc = ecryptfs_write_inode_size_to_metadata(inode);
> +	if (rc) {
> +		pr_err("Problem with ecryptfs_write_inode_size_to_metadata; rc = [%d]\n",
> +			rc);
> +		goto out;
> +	}
> +
> +	/*
> +	 * We are reducing the size of the ecryptfs file, and need to know if we
> +	 * need to reduce the size of the lower file.
> +	 */
> +	lower_size_before_truncate =
> +		upper_size_to_lower_size(crypt_stat, i_size);
> +	lower_size_after_truncate =
> +		upper_size_to_lower_size(crypt_stat, ia->ia_size);
> +	if (lower_size_after_truncate < lower_size_before_truncate) {
> +		lower_ia->ia_size = lower_size_after_truncate;
> +		lower_ia->ia_valid |= ATTR_SIZE;
> +	} else {
> +		lower_ia->ia_valid &= ~ATTR_SIZE;
>  	}
>  out:
>  	ecryptfs_put_lower_file(inode);
> -- 
> 2.47.3
> 

