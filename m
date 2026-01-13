Return-Path: <ecryptfs+bounces-775-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 789DDD16334
	for <lists+ecryptfs@lfdr.de>; Tue, 13 Jan 2026 02:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0181E300EDA4
	for <lists+ecryptfs@lfdr.de>; Tue, 13 Jan 2026 01:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BE722B8CB;
	Tue, 13 Jan 2026 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="cBSsPmH2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MZ3hzyzm"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB1B280A5A;
	Tue, 13 Jan 2026 01:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768268799; cv=none; b=kWK7EpUAZGN664fo7uvQNAHi+bFz4zU0MJo4csK4qmE4z8M6g+PahoLsi0YoHWpGSU1PQ85ILNvOY+ImY6eDHc3834GYt70LbcPkq+2VhQGCesvjFFrPCSHV0neLKDZ3oJrjcCfrzkrabAiJvuty6FxJbDukQwU2zWTEHrGmrXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768268799; c=relaxed/simple;
	bh=xy1sGf+pUoNZ/zdW5inxLNmzi5LIcUEAyEE5lPHXVhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWSracwGCHgo5+56Co2WZWx4XYCZdsyXKfKm2rYrwMtuk1t3SQGU3vIkv8nuvEPQ5NKRBC5JD35uDIKfHew5XI8BR5meGKqE6kuiG4YczQHucGMqwnDENTrFR3iNxalCeWsXfzVFEt+XhLfFzYN8hmQ7OQTearaP43WHr5am/tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=cBSsPmH2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MZ3hzyzm; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3B2031400160;
	Mon, 12 Jan 2026 20:46:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 12 Jan 2026 20:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768268797; x=1768355197; bh=QmKeX7BuSl
	5CIwavgtq4hl7mD6uErJ6+/+1ubJESrzM=; b=cBSsPmH2SzIqAOSKPkQ9/NQB48
	XBPk6907pWh2FfLamvl6VQjkVy5PRRzDOljsvNndInZ5g8oddZ5ojUmtDn88EBUz
	pipI2A1cps/AtOGgMMzJ4ZFZEoGIgNCol6e5OMF2hFqjtQglMesR16jEAmlU0F38
	hGNactvxK86q8vYd5tqT4P7ouGRj7XGe/kMVXffU9n6eY/2hqDCOW3ObnMognuoX
	XuUit63be0qTOG+1kyTdXwpc7Fy0ZJG0ZqU5fupmiQTAKFaVXJTHWGAtah1TiP+x
	Tz0rpaNUBIogSzmsFEwJM0Sqjgvnnh4ntrgNZbE+d7Ob8X28dOD9fRxR271A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768268797; x=1768355197; bh=QmKeX7BuSl5CIwavgtq4hl7mD6uErJ6+/+1
	ubJESrzM=; b=MZ3hzyzmGgkty0btDgfSXNCkBPd3bal8MHGj7qxB92YNFYx5Jff
	FQO4MxbKOIxZ9ohJtuLy3ayWhS9+24uN8YH+6ibqx0AUXIALaMR6+PCdhNESK5S2
	kNbm59it46/Hr1GnXxl6wKY37aP3d6FzSiH4qHzIVbcW0xEZKRCYBVAB0IeKT7Yi
	zheQaw4VVdnTSdB3OjmYCVEj3A9Jlp35LC05BnivgG+8e6tNHq0XfSJ9A59NqYRg
	hx530j7IcF0IwLePhPt4DmqxYAfYkHe54mYl2y5VLPfaCcMqwPCDh5alq+SR63BX
	QmP1VawUr9u3P5N2d047MCKFjVW6/N6kQ9g==
X-ME-Sender: <xms:_KNlac_UegsqMjFvGEdfMRirVOtryKBXS4lcRhqAxQ2X--Eav1kKYQ>
    <xme:_KNlaVYEAn4fzVirLEzTvaxox8KPx8u-2B5al34CzWthUxsrZa1IB-MflCP2Ns8r1
    zQK4AdPGOudP6oCwsYkRMLLSb-ds5Td5tmWwbG783G5-8CdIQt7bQU>
X-ME-Received: <xmr:_KNlaQPxvVFSnW1bTGWLhp-N2FOIOWsTcvCRH5l1lu5xm3dm8cZpqa4W7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeltdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epvdehvddttdfhfefhtdfgleehfeeggfdujeeuveekudevkedvgeejtddtfefgleeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghouggvse
    hthihhihgtkhhsrdgtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehthhhorhhsthgvnhdrsghluhhmsehlihhnuhigrdguvghvpdhrtg
    hpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhgruhhnvghr
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepiihhrghnghiiihhpvghnghdtsehfohigmhgrihhlrdgtohhm
    pdhrtghpthhtohepvggtrhihphhtfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_KNlaRCweY9UxS_exBuOimrWhXSRVWRXW9xyIsBcIjBqDb_Dnzn5GQ>
    <xmx:_KNlaXKymA0I9dw2Z7V4Qh1T-cyfky4_Iiwo64XPmQim0MVF3YPqSg>
    <xmx:_KNlaaNh1-VuaXN62HcC1I8rfeq0oy1HuEs3oMGrJ_4KpSPQ3LJsDA>
    <xmx:_KNlaV7CPU5OQ1lPjHfy6xUk3nuGs4uqk-ppG2ChgGHkkcGVsMuB9A>
    <xmx:_aNlaVxCC8UOKV0Sh3dsVmxCwXUgjrkEcoq4N2uq1zrUpAde6iLQaQJ5>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Jan 2026 20:46:34 -0500 (EST)
Date: Mon, 12 Jan 2026 19:46:31 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: Replace memcpy + NUL termination in
 ecryptfs_copy_filename
Message-ID: <aWWj9yHse6qVqxHN@yaupon>
References: <20260111131301.548411-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111131301.548411-1-thorsten.blum@linux.dev>

On 2026-01-11 14:12:58, Thorsten Blum wrote:
> Use kmemdup_nul() to copy 'name' instead of using memcpy() followed by a
> manual NUL termination.  Remove the local return variable and the goto
> label to simplify the code.  No functional changes.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thank you for the simplification.

Acked-by: Tyler Hicks <code@tyhicks.com>

Tyler

> ---
>  fs/ecryptfs/crypto.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index d49cdf7292ab..82fc5e1b6324 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -1422,21 +1422,11 @@ ecryptfs_encrypt_filename(struct ecryptfs_filename *filename,
>  static int ecryptfs_copy_filename(char **copied_name, size_t *copied_name_size,
>  				  const char *name, size_t name_size)
>  {
> -	int rc = 0;
> -
> -	(*copied_name) = kmalloc((name_size + 1), GFP_KERNEL);
> -	if (!(*copied_name)) {
> -		rc = -ENOMEM;
> -		goto out;
> -	}
> -	memcpy((void *)(*copied_name), (void *)name, name_size);
> -	(*copied_name)[(name_size)] = '\0';	/* Only for convenience
> -						 * in printing out the
> -						 * string in debug
> -						 * messages */
> +	(*copied_name) = kmemdup_nul(name, name_size, GFP_KERNEL);
> +	if (!(*copied_name))
> +		return -ENOMEM;
>  	(*copied_name_size) = name_size;
> -out:
> -	return rc;
> +	return 0;
>  }
>  
>  /**
> -- 
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
> 

