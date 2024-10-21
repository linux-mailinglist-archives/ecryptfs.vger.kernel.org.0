Return-Path: <ecryptfs+bounces-187-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C559A5A7D
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 08:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8652F1F216F4
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 06:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBACA194C6C;
	Mon, 21 Oct 2024 06:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="KJ5lZ8ft";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KPgktHI/"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57020194A49;
	Mon, 21 Oct 2024 06:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492694; cv=none; b=s7xZfyeqYpXQnViwgxQODetH4NgKglM18TnAaqL5gUnjFrtOpUmK5TwY5sFiIemJNFmG7/G578GcdMISFXyAcdXoclaulhy3bC3U29yLjcDYvawoDBd2zQtRGk+wOfX1sQk58+4c2gw1xExi637+z2D8bb1bB0hGASaRVKwn9to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492694; c=relaxed/simple;
	bh=cMzOb0CWrKtXwUkg/E9BwQJxNQbYBRDKzqfQRQL0i4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vy5utw8ztJio35yoW+/BFU91WIDHDFbpoPZvlml77a1o7yt/dQlnHToenSObxeOQYYqB5neHB2LF12pKHXTMuavmjiZctAjjZWySrBZ59jfZ6zke9asOql0pGlFUd+En4ScSHIjjONnwiY0ScZhqaitbxSJKP90ldRpSEslt7+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=KJ5lZ8ft; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KPgktHI/; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 6625F1380499;
	Mon, 21 Oct 2024 02:38:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 21 Oct 2024 02:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1729492691; x=1729579091; bh=o9Ym7PWEl7
	8ih7jteyBDtYn1LO1sAJS7F+HzoOQfrFE=; b=KJ5lZ8ftei0l8TQ0TYUWIEZodS
	tslSXRAgDQ/hV0kt4x9ih90TsqKQSxN5oA1e3d8yNSIwMblRvsK7mCmeRfsGW2lx
	D1ULOeVfUPLrVheVCQJazTpEHxZETNh2fXRrNrkvT4eMIH/vFkDl1xWMeksFDXNA
	/uBk38FWP5KrKyUDi8fnKra4g0OHRcKf6XvbjxNM152UzZ2i0U5SnS6u2OIg1fX5
	L/U48pziVLoIoSIl0vEj1guav+N+21b8xtCmaSE1zNpzUd7ve+5YJLfYy00MR7pD
	1wjNGjleHZczoBj89zKYyvB3kOeCFvWCqgQR/rxWt7QvaJt8O2H+aETpkDaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729492691; x=1729579091; bh=o9Ym7PWEl78ih7jteyBDtYn1LO1s
	AJS7F+HzoOQfrFE=; b=KPgktHI/QhjGQneFTuAyQs4LZV+PkkTbhz0jJyT/niq1
	tP0iXCzDF8t/epSeA01XWS7D8m3W66SjExrKmvFHghCydmyDrltecvEB/I0okhGj
	OEIvkXTgICJ4pT49h+z2ZWd1dbsb8XOEa9JINLUfeuRuGR1Mk6Y++PziLNmqU4Wi
	RLJFvyYjlj5/CJuWX0+dSTpXSqE3SS95T6ZvbqQoXM9eTtBuVqPFFRNIk8YMnI9K
	cAYJutpJE+Vx5bfK/7onE0oRqqMWELPyKvUFsjwjYyoHxq1hAmB8Wz5LO81MnhQL
	Gbi+buZBx86nOxegkkrvpUN5AsH48Mwk7+2Kql6+dQ==
X-ME-Sender: <xms:0_YVZ3nFyBa66V0W4o-gl3eY3koWUAjkXJpHbR-5GCn3DuL7JFi4yw>
    <xme:0_YVZ63maFYF-wo20GXQDbmSzydcnosNptfFrxAHmD_3R9pj_Oj0TiCubE1EW48lO
    1iQWZ27Rv0aShiVOjE>
X-ME-Received: <xmr:0_YVZ9r9xa6LU4IFxFKskPQJiw4bL4xEOT5lYP50Hv1qN1uM9i0oFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehkedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefvhihlvghrucfjihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedvhedvtddthfefhfdtgfelheefgefgudejueevkedu
    veekvdegjedttdefgfelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghrtghpthhtohep
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhrshhtvghnrdgslhhumh
    eslhhinhhugidruggvvhdprhgtphhtthhopegsrhhirghnsehkuhgsihhsihgrkhdrtgho
    mhdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gvtghrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:0_YVZ_ldOqLswRAoR9m7cbk6F85oH5LKG1J3HyD7JtbIe0DVB5EHKg>
    <xmx:0_YVZ119F0_z6sY1Yf_bvGpilW-k-NoW-_rPZK2XKa1S87JGkcrBzA>
    <xmx:0_YVZ-uKRICsuSxmIduS9Eazx7VOvBkQElSw2P0jBTOibbMZOL6GnQ>
    <xmx:0_YVZ5XZP3_E26AUfmENj5w5vsa7QtcY2cdrmUgtYymyBhTjHhFS2w>
    <xmx:0_YVZ9-9lXkD-z7fHmHKBBzDi4FeT4o7_fi8Axb4V1p7bt0Fo4tLG-pP>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Oct 2024 02:38:10 -0400 (EDT)
Date: Mon, 21 Oct 2024 01:37:55 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Brian Kubisiak <brian@kubisiak.com>,
	Christian Brauner <brauner@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] ecryptfs: Fix packet format comment in
 parse_tag_67_packet()
Message-ID: <ZxX2wy1leH/fWznR@redbud>
References: <20241018214144.163036-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018214144.163036-2-thorsten.blum@linux.dev>

On 2024-10-18 23:41:42, Thorsten Blum wrote:
> s/TAG 65/TAG 67/
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: Tyler Hicks <code@tyhicks.com>

Thank you, Thorsten!

Tyler

> ---
>  fs/ecryptfs/keystore.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index 7f9f68c00ef6..7266fc1a5fc4 100644
> --- a/fs/ecryptfs/keystore.c
> +++ b/fs/ecryptfs/keystore.c
> @@ -355,7 +355,7 @@ parse_tag_67_packet(struct ecryptfs_key_record *key_rec,
>  	int rc;
>  
>  	/*
> -	 *              ***** TAG 65 Packet Format *****
> +	 *              ***** TAG 67 Packet Format *****
>  	 *    | Content Type                       | 1 byte       |
>  	 *    | Status Indicator                   | 1 byte       |
>  	 *    | Encrypted File Encryption Key Size | 1 or 2 bytes |
> -- 
> 2.47.0
> 

