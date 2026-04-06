Return-Path: <ecryptfs+bounces-1193-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB4iMyRY02nZhQcAu9opvQ
	(envelope-from <ecryptfs+bounces-1193-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 08:52:20 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCD33A1E2F
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 08:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F42053016C93
	for <lists+ecryptfs@lfdr.de>; Mon,  6 Apr 2026 06:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66D620DD51;
	Mon,  6 Apr 2026 06:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="I5P/QTts";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j4Xm9gHE"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72683B1B3;
	Mon,  6 Apr 2026 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775458336; cv=none; b=FrBq6OxusD0vTkvd76mlvbj9VTfFAR8g9GZsQeAnz9BBV6l54+yYw/vmumvapYMc4xShqyN/pN6woexVcyhwXcxMgZBjbM06bKnNK64yKRBMGLmGgEw1p0l8BahmsYACKQdI+jU9U2VieEs1XbkboxTodY220zqzQnQD4rkRrG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775458336; c=relaxed/simple;
	bh=xbFyQBkaIDts5ezDzo14SiAra4IdNp28dlYwHKiJhrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CErkTE2PYhwFlfsGoBkrSKgTM0vsP3oz8o5u1Y9ZDDxoMcp81fhTdbX82GIbEt01GmJsFOX7/kqwoYer+HMqrsx6Wk9itvVe1Z0cZVnAwBGorykx0Zd6MpJcZwz9kMPaC8D3iG5AuDv79HLITsXMokRx3eJIkBRN7/4emHWZNVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=I5P/QTts; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j4Xm9gHE; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1CC51140006E;
	Mon,  6 Apr 2026 02:52:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 06 Apr 2026 02:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775458334; x=1775544734; bh=JfP31O1r41
	Pi+ohazfgoSeIiuBCUrRip+lCO5kpcZOU=; b=I5P/QTtsaAynozdFYW4Cg5wulj
	D+g/iJy9v+KrUmTv+SD/HesIX1mFuUOKo0LFtU8w49QvsJ95y8uBLNpqnTO/HP8O
	/N6R7DRwolzUtNpIljkFFnR/F3WCTQhX7QjWITHcve6eDmi/+d0AzXN/K1b/38Da
	/eX0ZwMcwLfLUErHRH4XnOoizmSIrGXbQeo2XDgMJUL1fjO94x/LcXAzhAaNN2Yy
	3/GVCNC9sVnCxagDq0KS74MGsHDA9SOfjrdC/dCgdK4m1gVNFMYZTxE8GsOshIwn
	YuJC04wdXPmhAs+bySt5gfxuO6Qu61One1S1RIWtiTG+LL5C7xYg2+qBOgPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775458334; x=1775544734; bh=JfP31O1r41Pi+ohazfgoSeIiuBCUrRip+lC
	O5kpcZOU=; b=j4Xm9gHEZO5pD37t8fqSvUxJIR8Cn7A3zpwl6UuhM6vEASjgm1k
	K6LkvNy19ezXyFUaexWzVqYVEZC0Vxd8f0sI57S/9HFcpn+JQQPojTcVAwOPxP6R
	EI+Lky6DX9GW9tuzBYHGOKAy23ch460Hks+PAG48erUqi31gcCc752g9xuwmM9vL
	/nEf1+iUyl7H/Gz9d3XyZrNJDo8PlOWR56RXNtZ+LMkqpsPgzGIqWGhD1a10YLL9
	XSyo60KyDrTRnxUUwZUb7AQvfgmNOtby55HUhHw8s6hDF2ptPsQt35HsvCPDd02C
	uyc1Y7SqS25dCUJrW0SQFT9Mq2dF70HEBIg==
X-ME-Sender: <xms:HljTaY5AzbNO9TGy9aln4duocuL3tT_hwtq67amdAIEWsnKBePy59g>
    <xme:HljTaRqUFoYj1w7Gwwh0SBAdkT5eoTG9dfUJWRSIU8loAWdWBgUtNNJ_SEO8ka7xS
    U5MP-urM8SLQKa0as27zYpWNwf9j79dzTm4k7qgHRGc1DWPHJ9etzI>
X-ME-Received: <xmr:HljTaajmBd_nOHJakEeSnwzPA2lECi8yBWTSsk2DTMSnzuI4nXG9CcE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddujedtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    dvhedvtddthfefhfdtgfelheefgefgudejueevkeduveekvdegjedttdefgfelieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesth
    ihhhhitghkshdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohephhgthheslhhsthdruggvpdhrtghpthhtohepvggtrhihphhtfhhsse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:HljTabKmL6ApkndqrM_YLoWv6kzvq0hcDNzxk_LW1wbSKA-y68y-eQ>
    <xmx:HljTaaDv-HlmIkYe55l25TqYPsB1yxak6u6RMhQHkb1t0Saw1scp0Q>
    <xmx:HljTabiH9qDt5lBbbuF_C1xhHSABM64dUkQAyrTVdiCCjY6GsoihTg>
    <xmx:HljTaSkncSLtxxa-1M3SHxmb3wGJaL0y1tYE-33khl6K48lDdLjqxg>
    <xmx:HljTaWOj5Y_PaovcHGHPWmeczGwGrwJfW4AcsgANL-P92xqLYkMtvJAB>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 02:52:13 -0400 (EDT)
Date: Mon, 6 Apr 2026 01:52:11 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Christoph Hellwig <hch@lst.de>
Cc: ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 7/7] ecryptfs: call notify_change from truncate_upper
Message-ID: <adNYG1QzgRvBFm5n@yaupon>
References: <20260331153752.4049454-1-hch@lst.de>
 <20260331153752.4049454-8-hch@lst.de>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331153752.4049454-8-hch@lst.de>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-1193-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[ecryptfs];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2FCD33A1E2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-31 17:37:28, Christoph Hellwig wrote:
> Keep all the truncation logic in one place by also moving the call to
> notify_change into truncate_upper.  Rename the resulting function to
> __ecryptfs_truncate as it deals with both the lower and upper inodes.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ecryptfs/inode.c | 61 +++++++++++++++++++++------------------------
>  1 file changed, 28 insertions(+), 33 deletions(-)
> 
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index c87ee3c6ecba..256beed0e47d 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -707,7 +707,7 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
>  }
>  
>  /**
> - * truncate_upper
> + * __ecryptfs_truncate
>   * @dentry: The ecryptfs layer dentry
>   * @lower_ia: Address of the lower inode's attributes
>   *
> @@ -721,9 +721,10 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
>   *
>   * Returns zero on success; non-zero otherwise
>   */
> -static int truncate_upper(struct dentry *dentry, struct iattr *lower_ia)
> +static int __ecryptfs_truncate(struct dentry *dentry, struct iattr *lower_ia)

Could you update the function documentation, as well? This sentence is
no longer true:

 * ... If ATTR_SIZE is set in lower_ia->ia_valid upon return,       
 * the caller must use lower_ia in a call to notify_change() to perform         
 * the truncation of the lower inode.                         

The rest looks good.

Tyler

>  {
>  	struct inode *inode = d_inode(dentry);
> +	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
>  	struct ecryptfs_crypt_stat *crypt_stat;
>  	loff_t i_size = i_size_read(inode);
>  	loff_t lower_size_before_truncate;
> @@ -731,10 +732,8 @@ static int truncate_upper(struct dentry *dentry, struct iattr *lower_ia)
>  	size_t num_zeros;
>  	int rc;
>  
> -	if (unlikely(lower_ia->ia_size == i_size)) {
> -		lower_ia->ia_valid &= ~ATTR_SIZE;
> +	if (unlikely(lower_ia->ia_size == i_size))
>  		return 0;
> -	}
>  
>  	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
>  	lower_size_before_truncate =
> @@ -767,13 +766,12 @@ static int truncate_upper(struct dentry *dentry, struct iattr *lower_ia)
>  		 * new and of the file.
>  		 */
>  		rc = ecryptfs_write(inode, zero, lower_ia->ia_size - 1, 1);
> -		lower_ia->ia_valid &= ~ATTR_SIZE;
>  		goto out;
>  	}
>  
>  	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
>  		truncate_setsize(inode, lower_ia->ia_size);
> -		goto out;
> +		goto set_size;
>  	}
>  
>  	/*
> @@ -803,10 +801,14 @@ static int truncate_upper(struct dentry *dentry, struct iattr *lower_ia)
>  	 * We are reducing the size of the ecryptfs file, and need to know if we
>  	 * need to reduce the size of the lower file.
>  	 */
> -	if (lower_size_after_truncate < lower_size_before_truncate)
> -		lower_ia->ia_size = lower_size_after_truncate;
> -	else
> -		lower_ia->ia_valid &= ~ATTR_SIZE;
> +	if (lower_size_after_truncate >= lower_size_before_truncate)
> +		goto out;
> +
> +	lower_ia->ia_size = lower_size_after_truncate;
> +set_size:
> +	inode_lock(d_inode(lower_dentry));
> +	rc = notify_change(&nop_mnt_idmap, lower_dentry, lower_ia, NULL);
> +	inode_unlock(d_inode(lower_dentry));
>  out:
>  	ecryptfs_put_lower_file(inode);
>  	return rc;
> @@ -828,18 +830,8 @@ int ecryptfs_truncate(struct dentry *dentry, loff_t new_length)
>  		.ia_valid	= ATTR_SIZE,
>  		.ia_size	= new_length,
>  	};
> -	int rc;
> -
> -	rc = truncate_upper(dentry, &lower_ia);
> -	if (!rc && lower_ia.ia_valid & ATTR_SIZE) {
> -		struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
>  
> -		inode_lock(d_inode(lower_dentry));
> -		rc = notify_change(&nop_mnt_idmap, lower_dentry,
> -				   &lower_ia, NULL);
> -		inode_unlock(d_inode(lower_dentry));
> -	}
> -	return rc;
> +	return __ecryptfs_truncate(dentry, &lower_ia);
>  }
>  
>  static int
> @@ -867,7 +859,6 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
>  			    struct dentry *dentry, struct iattr *ia)
>  {
>  	struct inode *inode = d_inode(dentry);
> -	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
>  	struct inode *lower_inode = ecryptfs_inode_to_lower(inode);
>  	struct iattr lower_ia;
>  	struct ecryptfs_crypt_stat *crypt_stat;
> @@ -918,13 +909,6 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
>  		goto out;
>  
>  	memcpy(&lower_ia, ia, sizeof(lower_ia));
> -	if (ia->ia_valid & ATTR_FILE)
> -		lower_ia.ia_file = ecryptfs_file_to_lower(ia->ia_file);
> -	if (ia->ia_valid & ATTR_SIZE) {
> -		rc = truncate_upper(dentry, &lower_ia);
> -		if (rc < 0)
> -			goto out;
> -	}
>  
>  	/*
>  	 * mode change is for clearing setuid/setgid bits. Allow lower fs
> @@ -933,9 +917,20 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
>  	if (lower_ia.ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID))
>  		lower_ia.ia_valid &= ~ATTR_MODE;
>  
> -	inode_lock(d_inode(lower_dentry));
> -	rc = notify_change(&nop_mnt_idmap, lower_dentry, &lower_ia, NULL);
> -	inode_unlock(d_inode(lower_dentry));
> +	if (ia->ia_valid & ATTR_SIZE) {
> +		if (ia->ia_valid & ATTR_FILE)
> +			lower_ia.ia_file = ecryptfs_file_to_lower(ia->ia_file);
> +		rc = __ecryptfs_truncate(dentry, &lower_ia);
> +		if (rc < 0)
> +			goto out;
> +	} else {
> +		struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
> +
> +		inode_lock(d_inode(lower_dentry));
> +		rc = notify_change(&nop_mnt_idmap, lower_dentry, &lower_ia,
> +			NULL);
> +		inode_unlock(d_inode(lower_dentry));
> +	}
>  out:
>  	fsstack_copy_attr_all(inode, lower_inode);
>  	return rc;
> -- 
> 2.47.3
> 

