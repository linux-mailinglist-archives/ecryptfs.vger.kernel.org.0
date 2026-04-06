Return-Path: <ecryptfs+bounces-1185-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC2LKTBK02legwcAu9opvQ
	(envelope-from <ecryptfs+bounces-1185-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 07:52:48 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1F33A1AC1
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 07:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B496300E619
	for <lists+ecryptfs@lfdr.de>; Mon,  6 Apr 2026 05:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154F632E12E;
	Mon,  6 Apr 2026 05:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="5eQyUCLD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c552v6Es"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3623382C9;
	Mon,  6 Apr 2026 05:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775454765; cv=none; b=mPD79TQbZAJYMN3HJ6TBfCIWey1Y1FI+GudRN/kUfBTFHxvmYClboPnMSP3h/I/h7mFRF853BZ9FJZBjmMMf4A8kG88b332y+3v5gXWLqjcshBwcGlZP3UDIkGL0dlImjg1nDcI13JASPogbkrAgD1hfRMVCZGXO7M/JjXvVlS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775454765; c=relaxed/simple;
	bh=FI49tto1NJ6u4NdN+pNhyBf8V5QcPsUwms9p/KbGSNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9Oksl2xGXsjnbVu6pUnZujocf3jsIlNqOOPNRBD26kkIGVZawZplIUPmtFQpqVxauO9W+/i9N7V8qeai9DWFT8X5VpYTy6RVzlh34c3KYy+DjHs1way//XxdQHvQzYifMXoPRAhOGl1RIZ7YX5atERtlsLUEUoHxNyskLxwz4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=5eQyUCLD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c552v6Es; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D1F3B7A001C;
	Mon,  6 Apr 2026 01:52:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 06 Apr 2026 01:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775454762; x=1775541162; bh=eXbf42kCTk
	69rPH3kuvxrnpAJ2Er5dZDMDVyjR/MmYU=; b=5eQyUCLD3B2BsB3n43nef7yN1j
	F7OdlXkOjfMwpZgW8y7CBM5PzmdEUG4fHhHEVLKvZY/5shOfOUgVhr4TP/a31QgY
	Cj9rCh545f3vr0q59cFgVG7qcBuOz8m7EsKuvBoyaCRBUARCK/1G48R9i5Uz8OFF
	E0GptpZajAg92QZK02d3PnwOH7JR5r75xtT7YEanpEraBNimD8fQaQBGvaNGhecZ
	3YoDT0ufYN9ITZAGBNWdMeKOhyh74Ewzyf2wT5ZF4nc7+3Jte0eSm3fhYsL0TB+l
	NjceEyIrWa4ab3rQWJ8NjJcdzfTttud64xbtR9LuTbfCScRGb3CBMxf0eTtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775454762; x=1775541162; bh=eXbf42kCTk69rPH3kuvxrnpAJ2Er5dZDMDV
	yjR/MmYU=; b=c552v6EsjzASCZj1mHRaH/1cV93IJBs9te1QYyUc9J2/Z83FYCq
	c73N8xvzpWL4bateo8fvA9CuaQZdqKl19AOQ4vUMkHqJhk+6oBOt7jwFL7CaHu8k
	K0vp2HCtKdp1QD+KWeoFaJNOzjiv2U5xGbOFgwbHvtxzJ6/EtPQdjsVHxZQ2pj4u
	iugUUEZbM09qAtsGcQQE+FmRbhofPfoWCZDDGlKGFZiIf/tf9h7OTfY3mrTRngLp
	HuZOw8fAyf8M3IAZz2SB3mm5ti/w4n5wJODQ1XgR2yD5egmqXXaeAWwIYmJOGZaW
	0LzN4Ao7uNmbYCZpFcqn/CaQlQUusTjr7nA==
X-ME-Sender: <xms:KkrTaRo2iUFV1-P0UcQIKBcN1PMFJ0gDI921GBozDLAyLrQZJJ18iQ>
    <xme:KkrTabboyYLS3_TAilrnZQuRssgSojTMkAnErinWDCysNnJ17jY5tDthSz4xGM9AF
    8GGFzvExj24D21Ni5RFrqo3Ta9UFL7S5skj25SwsuRJyKAADWIkt04D>
X-ME-Received: <xmr:KkrTaRQVNd3w--8FiGQfvXDhFNijOMluvk8ClxP8Yk_vv4B7LhmIkXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduieeklecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:KkrTaa5yi7HchMsJSi8mN6JvP8aIxPwsZwAOjSjyExKbam4cELwgBQ>
    <xmx:KkrTaewxo-uwKBJvcLkTk7g5ekmCOv3t_bkSesadRsZr4lxUrH95sg>
    <xmx:KkrTaRQKFQQ0NgsTn8aSm2PnhoR95qhrngPiAWkkn3WuxtZn5ref-w>
    <xmx:KkrTaVVQXbRX6LC4pm8Kkcihzt4BJjVJFAsvfkiA7LbPiN4K-9rsUg>
    <xmx:KkrTaf91S1X6KddlSG3__55-Yi7d2WQtIReq_71PBva2TbljoXIIJzo6>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 01:52:42 -0400 (EDT)
Date: Mon, 6 Apr 2026 00:52:40 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Christoph Hellwig <hch@lst.de>
Cc: ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/7] ecryptfs: cleanup ecryptfs_setattr
Message-ID: <adNKKJRNtyhAW6Kx@yaupon>
References: <20260331153752.4049454-1-hch@lst.de>
 <20260331153752.4049454-3-hch@lst.de>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331153752.4049454-3-hch@lst.de>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-1185-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[ecryptfs];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1F1F33A1AC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-31 17:37:23, Christoph Hellwig wrote:
> Initialize variables at declaration time where applicable and reformat
> conditionals to match the kernel coding style.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This one looks good to me.

Tyler

> ---
>  fs/ecryptfs/inode.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index cf20873a9cc4..46dc867a8860 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -891,25 +891,23 @@ ecryptfs_permission(struct mnt_idmap *idmap, struct inode *inode,
>  static int ecryptfs_setattr(struct mnt_idmap *idmap,
>  			    struct dentry *dentry, struct iattr *ia)
>  {
> -	int rc = 0;
> -	struct dentry *lower_dentry;
> +	struct inode *inode = d_inode(dentry);
> +	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
> +	struct inode *lower_inode = ecryptfs_inode_to_lower(inode);
>  	struct iattr lower_ia;
> -	struct inode *inode;
> -	struct inode *lower_inode;
>  	struct ecryptfs_crypt_stat *crypt_stat;
> +	int rc;
>  
>  	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
>  	if (!(crypt_stat->flags & ECRYPTFS_STRUCT_INITIALIZED))
>  		ecryptfs_init_crypt_stat(crypt_stat);
> -	inode = d_inode(dentry);
> -	lower_inode = ecryptfs_inode_to_lower(inode);
> -	lower_dentry = ecryptfs_dentry_to_lower(dentry);
> +
>  	mutex_lock(&crypt_stat->cs_mutex);
>  	if (d_is_dir(dentry))
>  		crypt_stat->flags &= ~(ECRYPTFS_ENCRYPTED);
> -	else if (d_is_reg(dentry)
> -		 && (!(crypt_stat->flags & ECRYPTFS_POLICY_APPLIED)
> -		     || !(crypt_stat->flags & ECRYPTFS_KEY_VALID))) {
> +	else if (d_is_reg(dentry) &&
> +		 (!(crypt_stat->flags & ECRYPTFS_POLICY_APPLIED) ||
> +		  !(crypt_stat->flags & ECRYPTFS_KEY_VALID))) {
>  		struct ecryptfs_mount_crypt_stat *mount_crypt_stat;
>  
>  		mount_crypt_stat = &ecryptfs_superblock_to_private(
> @@ -922,8 +920,8 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
>  		rc = ecryptfs_read_metadata(dentry);
>  		ecryptfs_put_lower_file(inode);
>  		if (rc) {
> -			if (!(mount_crypt_stat->flags
> -			      & ECRYPTFS_PLAINTEXT_PASSTHROUGH_ENABLED)) {
> +			if (!(mount_crypt_stat->flags &
> +			      ECRYPTFS_PLAINTEXT_PASSTHROUGH_ENABLED)) {
>  				rc = -EIO;
>  				printk(KERN_WARNING "Either the lower file "
>  				       "is not in a valid eCryptfs format, "
> -- 
> 2.47.3
> 

