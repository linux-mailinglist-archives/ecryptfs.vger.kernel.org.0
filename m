Return-Path: <ecryptfs+bounces-1189-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id m0nHMhRO02kchAcAu9opvQ
	(envelope-from <ecryptfs+bounces-1189-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 08:09:24 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5977E3A1BD9
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 08:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2AA393001861
	for <lists+ecryptfs@lfdr.de>; Mon,  6 Apr 2026 06:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1D6346774;
	Mon,  6 Apr 2026 06:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="mBZDzHNd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ktjtSkAU"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F45C3559C9;
	Mon,  6 Apr 2026 06:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775455756; cv=none; b=FF9+twHZ2Rg88tRZdrf0slKnduxpmUrc0O59+2bxg61krWLovFT/I4+aenYcumZka6PXzKwHMc/iccm5f9TDUAH0U7WoGo0uzx3joDd/9N5hYMk9VZwdCx11qElSZYfapBrbbejsWMOsoLOMZrob4BWyDKRy2SW2O1y+ob9QGTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775455756; c=relaxed/simple;
	bh=vLSpNgH+np/nRXsfyuGV99zjujfwgAD5u9LBurNsNMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZvbcmTzICLeXrJMaZSsfqRw6u1T/bfeOXggXvlPgbZhy9kavFhZqBhth/f0h5mprOSja/3lPlM3/dpFpwlaXVJ4Uq4GaFQmoiU8+0fUdmNejPOeARUxi6NmOO4H3k8cm5FevPfMF2KGQjtwUvtBl7Q4VKH6oOwLJJulgWasCpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=mBZDzHNd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ktjtSkAU; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 9C44CEC0141;
	Mon,  6 Apr 2026 02:09:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 06 Apr 2026 02:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775455754; x=1775542154; bh=4LGqyFu0T1
	m8auGh4JIjH9wjPcINe7epog/BgmIdCXY=; b=mBZDzHNd0UZ3cdjEy/AulWTkwB
	1iLYnO+2F+BF0aQlQ3cLYQe0vJ1NLOjxdwH25/ywKB0rRDXKyw9TYMQcDXnU/Z/k
	gW7IwDmi86B3/J05MWZr2hKRJwmCByKjALgh3gvoVMQT5DgkAKGVjdRK2KYAqUpj
	1Izu+sGZ1FiFT0VLTVFpHUEmo13sd8ujsy6STgOktKGiPlPpj+uZsswEZW+vT7Jx
	oyyUugDAFQabByxBCHz9M1DT6WjdI+lTFcaUpgcltLHm9xXrcwcj5i3DAT2x3TWZ
	m0gTQSTK0HkRd35a9+XvO9seYJnf2Z4Aqu1fV5qw2Xb4Bk90P3PvE/yB3Iug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775455754; x=1775542154; bh=4LGqyFu0T1m8auGh4JIjH9wjPcINe7epog/
	BgmIdCXY=; b=ktjtSkAUACeqxfkXsEwo4cXdCXvO5lqFH52tLGpCdDcsZ2EyyJP
	eCw3Ug+2Xad+UwWvTbmVMExdIzcyZIIobxzHrat3dyXVpZaKzWdC68ZSR2PxnWwX
	BliLFVs2RpZy3oqrxFBkhfb0Vuac+fjcCBSakzAhoB4W1dfASCG7Xrgxp61j13Pq
	qa+lhO1wqT3IwZIjoymeei+n49pmn706E+OvimcD9wZw3vLgWu30SO1ohNGp4AcG
	WQmfabhRNV8p/xl5fCiXaD3+az8mqmtVSGbK0nRi5q4wQHXKppGEP4dfEQT601xI
	BWOGnJKn04D1O7MiwZoZbmXS9P5Ea0T4xXw==
X-ME-Sender: <xms:Ck7TaRCJnFBl0eh5JQqtnKGp7lu3Uo31I9ErV_s2650H_VftLin5Zg>
    <xme:Ck7TaXQ_VRlU_O_xU1dxO3JGDpVZZ9vxqY98TgbCswVLA5YlNvvQ1kadG2BpzB2gR
    jg3N7cUkwwO4opyVPJk_9DImXa9zOBMcJNve9ZHZhYID62a6XEgKbUk>
X-ME-Received: <xmr:Ck7Tafq3n-EarcQ3Qk0TlVyQD6woEIw9z8U3Ox4Q5Zaa44dSauDiCeI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduieelfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Ck7TaZxyVQG6AoNddIyM29g_RnAlIcB5pn2nXgAODgP06GsktFUO8A>
    <xmx:Ck7TaUL-_LPvCP_rtr4Gzio118R7w0FfpZmROnVUGUSncYB9UoOIeQ>
    <xmx:Ck7TabJOLvPJywe2RnDXCJ-s5sV_xsCQIQ9cm-BFzuDUHJ0zHaNenQ>
    <xmx:Ck7TaZt7bXv2awGLcW1_Irpng0c01oUC9SZOnmgWvGjS03lq6hznlw>
    <xmx:Ck7Tab0DL04zVovFcpLTbD8tq4U3KSPsNgpQQoyxSXxXDFfEXnOYqcKv>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 02:09:14 -0400 (EDT)
Date: Mon, 6 Apr 2026 01:09:12 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Christoph Hellwig <hch@lst.de>
Cc: ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 6/7] ecryptfs: merge ecryptfs_inode_newsize_ok into
 truncate_upper
Message-ID: <adNOCD5DvV7yaU_Z@yaupon>
References: <20260331153752.4049454-1-hch@lst.de>
 <20260331153752.4049454-7-hch@lst.de>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331153752.4049454-7-hch@lst.de>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1189-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,messagingengine.com:dkim,tyhicks.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5977E3A1BD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-31 17:37:27, Christoph Hellwig wrote:
> Both callers of ecryptfs_inode_newsize_ok call truncate_upper right
> after.  Merge ecryptfs_inode_newsize_ok into truncate_upper to simplify
> the logic.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This one looks good to me.

Tyler

> ---
>  fs/ecryptfs/inode.c | 53 +++++++++++++++------------------------------
>  1 file changed, 17 insertions(+), 36 deletions(-)
> 
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index a7dc25fae8ee..c87ee3c6ecba 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -736,6 +736,23 @@ static int truncate_upper(struct dentry *dentry, struct iattr *lower_ia)
>  		return 0;
>  	}
>  
> +	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
> +	lower_size_before_truncate =
> +		upper_size_to_lower_size(crypt_stat, i_size);
> +	lower_size_after_truncate =
> +		upper_size_to_lower_size(crypt_stat, lower_ia->ia_size);
> +	if (lower_size_after_truncate > lower_size_before_truncate) {
> +		/*
> +		 * The eCryptfs inode and the new *lower* size are mixed here
> +		 * because we may not have the lower i_mutex held and/or it may
> +		 * not be appropriate to call inode_newsize_ok() with inodes
> +		 * from other filesystems.
> +		 */
> +		rc = inode_newsize_ok(inode, lower_size_after_truncate);
> +		if (rc)
> +			return rc;
> +	}
> +
>  	rc = ecryptfs_get_lower_file(dentry, inode);
>  	if (rc)
>  		return rc;
> @@ -754,7 +771,6 @@ static int truncate_upper(struct dentry *dentry, struct iattr *lower_ia)
>  		goto out;
>  	}
>  
> -	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
>  	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
>  		truncate_setsize(inode, lower_ia->ia_size);
>  		goto out;
> @@ -787,42 +803,15 @@ static int truncate_upper(struct dentry *dentry, struct iattr *lower_ia)
>  	 * We are reducing the size of the ecryptfs file, and need to know if we
>  	 * need to reduce the size of the lower file.
>  	 */
> -	lower_size_before_truncate =
> -		upper_size_to_lower_size(crypt_stat, i_size);
> -	lower_size_after_truncate =
> -		upper_size_to_lower_size(crypt_stat, lower_ia->ia_size);
>  	if (lower_size_after_truncate < lower_size_before_truncate)
>  		lower_ia->ia_size = lower_size_after_truncate;
>  	else
>  		lower_ia->ia_valid &= ~ATTR_SIZE;
> -
>  out:
>  	ecryptfs_put_lower_file(inode);
>  	return rc;
>  }
>  
> -static int ecryptfs_inode_newsize_ok(struct inode *inode, loff_t offset)
> -{
> -	struct ecryptfs_crypt_stat *crypt_stat;
> -	loff_t lower_oldsize, lower_newsize;
> -
> -	crypt_stat = &ecryptfs_inode_to_private(inode)->crypt_stat;
> -	lower_oldsize = upper_size_to_lower_size(crypt_stat,
> -						 i_size_read(inode));
> -	lower_newsize = upper_size_to_lower_size(crypt_stat, offset);
> -	if (lower_newsize > lower_oldsize) {
> -		/*
> -		 * The eCryptfs inode and the new *lower* size are mixed here
> -		 * because we may not have the lower i_mutex held and/or it may
> -		 * not be appropriate to call inode_newsize_ok() with inodes
> -		 * from other filesystems.
> -		 */
> -		return inode_newsize_ok(inode, lower_newsize);
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * ecryptfs_truncate
>   * @dentry: The ecryptfs layer dentry
> @@ -841,10 +830,6 @@ int ecryptfs_truncate(struct dentry *dentry, loff_t new_length)
>  	};
>  	int rc;
>  
> -	rc = ecryptfs_inode_newsize_ok(d_inode(dentry), new_length);
> -	if (rc)
> -		return rc;
> -
>  	rc = truncate_upper(dentry, &lower_ia);
>  	if (!rc && lower_ia.ia_valid & ATTR_SIZE) {
>  		struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
> @@ -936,10 +921,6 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
>  	if (ia->ia_valid & ATTR_FILE)
>  		lower_ia.ia_file = ecryptfs_file_to_lower(ia->ia_file);
>  	if (ia->ia_valid & ATTR_SIZE) {
> -		rc = ecryptfs_inode_newsize_ok(inode, ia->ia_size);
> -		if (rc)
> -			goto out;
> -
>  		rc = truncate_upper(dentry, &lower_ia);
>  		if (rc < 0)
>  			goto out;
> -- 
> 2.47.3
> 

