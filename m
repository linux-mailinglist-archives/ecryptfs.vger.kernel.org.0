Return-Path: <ecryptfs+bounces-1187-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INRYOkhK02legwcAu9opvQ
	(envelope-from <ecryptfs+bounces-1187-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 07:53:12 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 674FE3A1AE0
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 07:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F8B5300E61C
	for <lists+ecryptfs@lfdr.de>; Mon,  6 Apr 2026 05:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F173491C4;
	Mon,  6 Apr 2026 05:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="5CeGLqYS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S+IMyXYK"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D03382C9;
	Mon,  6 Apr 2026 05:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775454789; cv=none; b=qk54axSRE2g1FTLoAWqZSUJz1k2yp8kYCbZ/eOvOmKeqDyoqJBU0gVmpYX9S2t6b/ksrDfnmpw3SrU4XH1Y8II33jTFT9zLEXe4IGIFiDqBE5YR5nJ6VXl1+26GAS6OBEQ9Vo6Kf6Is1b3F701HVvP00gaDax2mIyHt3f0RccAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775454789; c=relaxed/simple;
	bh=VgwmESG6Y0qIRt4ZB6SsJ3x1NTLpG5J8mxvYvBjqUfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVTwZ6fon7jnDTxn13AYi1WULKsS9NCaPRduyty3YbKMqO0eUWKGwWrwjgjOFEMBe5+PqSnDGwaUdStM1jVB5JQL0QtabEe0CJvV7HAg8b7icIDeTihyAFHRcJCiZ+KFw0YINDaYH4H1QjUfIXFjrIdvcxmPfieuv9c9U42Uk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=5CeGLqYS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S+IMyXYK; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 92CE67A001C;
	Mon,  6 Apr 2026 01:53:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 06 Apr 2026 01:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775454787; x=1775541187; bh=REVSmFV/oP
	9PYCixymjsQc/OzSeB+OVqxDrHpSuL95Q=; b=5CeGLqYSrczkBkuQ5wfCan5Bpp
	Apl9aAja9tKQb+GA4JZbYmVNMF4aNAnKibFZ6UqqQg5m5khWmGmp7/zP/+MeAn8n
	5nYTHO6zD7EoO2EQhrLyhFoAWqmJy2lcpabibYRUuTHZcfaqpJuj2r64vu5Glo/1
	haCqYXOkvrOGnyLSBwV3Pv60oioHibzcfATN0KlHz81MjdvacsIoq1aZxxSzeFNC
	oKCa00GSXnewLqouRMTNmIK+dLZEIJiepE2Me+myD6npaZbHal07/80DX4L14jTI
	DAlkLFUhTaHh/RnLlEzSgDJYTyEH9roByDYStB8vT0VmSqnsJXugJEZa9UBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775454787; x=1775541187; bh=REVSmFV/oP9PYCixymjsQc/OzSeB+OVqxDr
	HpSuL95Q=; b=S+IMyXYKEMZlqkFA8vBMjfaxZZU4dx6ChOw37uHadZXbLZTrjwn
	dQlSAXr/FIBOha51G7w4UO6mypz/kUGQLoOhqPPJnTGwhNnxJSeS/sP2ys/Agn5h
	VzT8y5x+f7FpVrL1iHUBAbFCuct6SHqPVGhFUExbcMlXORoqsups11i2RRtJSRnJ
	+VCQ2B3WVlYq5PC90hf1SH3GzuzqyyNVxKUGp23SNkgKQND4IGWG1/18K0Ns+7j8
	s/vX08iR0MNX9TNg7QTr6fTe8bCPedDtcQsMMs62E6JTe0C839qSNlJzPjveE8cp
	GUKqRcJT6ydE8F5CVS0fKGcG/gha9W9DOHA==
X-ME-Sender: <xms:Q0rTaZQ2BrYxCWpG7ah4mR4bsyQCMZdvI5BoqIkzXSj2S111Fjm_Lw>
    <xme:Q0rTaZqwfyhJWfG0mk4hAEcHbYLqf7vlbeb5vNsIOpU7Oj-8TmoEIVZt3e2XbRQQg
    CzT0mjzfUuDgmo4gt5yD-Vh1zquOP-bjzfYHmP9fvklWC2FKiK0jA>
X-ME-Received: <xmr:Q0rTabwOkls1JB-mySXvZn5xcgufNHLtMXrYi5byV9S5rplafRgmxOc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduieeklecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    dvhedvtddthfefhfdtgfelheefgefgudejueevkeduveekvdegjedttdefgfelieenucev
    lhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesth
    ihhhhitghkshdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohephhgthheslhhsthdruggvpdhrtghpthhtohepvggtrhihphhtfhhsse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Q0rTaeI3kEH8KaseMuPz3fIKIukjOYLquLqzwNR4P8LI0slPlvFYMQ>
    <xmx:Q0rTadKXI2CgtcswPq6Uqoz_VjchkgMEXKrOuYjk5ybSNMTgXGxgfA>
    <xmx:Q0rTaTteEGlSE_Coo-RIsBfUEzjlb05rXvP4WUcQxiSJpsGp1JGsMA>
    <xmx:Q0rTaSQvJVLVt7p8ADyJ3SK6fShUiGf6rwgHXpL7ZCBxyGN57g7j0w>
    <xmx:Q0rTaa1-yAS_7PWNxm7uk0eGFnJxvk0VlKxrEjSSDn-n2g3J-YV9usBk>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 01:53:06 -0400 (EDT)
Date: Mon, 6 Apr 2026 00:53:05 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Christoph Hellwig <hch@lst.de>
Cc: ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/7] ecryptfs: combine the two ATTR_SIZE blocks in
 ecryptfs_setattr
Message-ID: <adNKQTyMdsR8wErw@yaupon>
References: <20260331153752.4049454-1-hch@lst.de>
 <20260331153752.4049454-5-hch@lst.de>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331153752.4049454-5-hch@lst.de>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-1187-lists,ecryptfs=lfdr.de];
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
X-Rspamd-Queue-Id: 674FE3A1AE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-31 17:37:25, Christoph Hellwig wrote:
> Simplify the logic in ecryptfs_setattr by combining the two ATTR_SIZE
> blocks.  This initializes lower_ia before the size check, which is
> obviously correct as the size check doesn't look at it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This one looks good to me, as well.

Tyler

> ---
>  fs/ecryptfs/inode.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 57df35a22e9c..7a3da72eb3c6 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -934,16 +934,15 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
>  	rc = setattr_prepare(&nop_mnt_idmap, dentry, ia);
>  	if (rc)
>  		goto out;
> -	if (ia->ia_valid & ATTR_SIZE) {
> -		rc = ecryptfs_inode_newsize_ok(inode, ia->ia_size);
> -		if (rc)
> -			goto out;
> -	}
>  
>  	memcpy(&lower_ia, ia, sizeof(lower_ia));
>  	if (ia->ia_valid & ATTR_FILE)
>  		lower_ia.ia_file = ecryptfs_file_to_lower(ia->ia_file);
>  	if (ia->ia_valid & ATTR_SIZE) {
> +		rc = ecryptfs_inode_newsize_ok(inode, ia->ia_size);
> +		if (rc)
> +			goto out;
> +
>  		rc = truncate_upper(dentry, ia, &lower_ia);
>  		if (rc < 0)
>  			goto out;
> -- 
> 2.47.3
> 

