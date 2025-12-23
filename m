Return-Path: <ecryptfs+bounces-756-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B35CDAA98
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 22:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D464B301E6D6
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 21:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6179C2C11FA;
	Tue, 23 Dec 2025 21:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="kVWrGwd+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l0CYbCVE"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A793298CD5;
	Tue, 23 Dec 2025 21:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766523837; cv=none; b=Ydl2M5k3LXfT94WzN4/KxCi6aYw2YlAQEHB1VY5lYy9ctinqPBCDLN4SzaZhGOUiAEp+A4f5AKfOh4BZxTOHPe3B/InEGAGWmBQPEZh4EbZgWKyc4qQ4ej0L3E5tPMv7TwVuXbYChtp8cPZsUw7KDXIT2zctZ8cI2gXq8bmGeuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766523837; c=relaxed/simple;
	bh=0Cttns0QvsbksxzEnD5sWxBt7gNaA3F9+yVAdv5BBFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4OfRbZG5+0BPLPdXiu6RdRDCfM50/ZBd1/7R2JbbZUchCM9W/KOLg+U5pgRhR/6oypZJe2yIlvS/9119msZ4KPYV9BsOIZ8IUWKB4GHD0TqXEuz16eILxoE6vUbQi4nI3iLc0o1NsgpBCtCZqtgG1VGiby61txbadU9S2pm+B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=kVWrGwd+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l0CYbCVE; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 876557A0087;
	Tue, 23 Dec 2025 16:03:54 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 23 Dec 2025 16:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1766523834; x=1766610234; bh=KDBi0BYtxm
	8Irou6z00GnhkncKBNnm0ljWrGuDx1osk=; b=kVWrGwd+nQIZJLg5YyCUCjhHCg
	Hjvuncl+JYTeNnjE0PmwsDdtlqmVhaSb2szfCaZY5YDy5U+VOcdLmOakI3RJUfzL
	JPowr/0IcLgoXR0817UoWpL5QuJkuNXAIctj3AnkMUyqPUIxILE8LZbqY7P45Oom
	U02S6HkyoGDW2bandG4kyAbIw0XxeaBheMf5bJIMOJSGsgGlbOaeegGRrSHmGpY3
	CBmPjB+dMz4+ysQuIvx1ks4gNovdlTopY9ZU4RW4NxdQROxOuUEq5QbjQpxXuC+P
	IBSme1HWP5M3iMWesJtgn4LypdxTdtJCiutTkpmH/LZens8TRanbYVrhbuWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766523834; x=1766610234; bh=KDBi0BYtxm8Irou6z00GnhkncKBNnm0ljWr
	GuDx1osk=; b=l0CYbCVE5pYQpm1MltusooJyt4dbRBmasvOAx7kScsZUS3NfBeB
	6j2zH5t4GQjmVnjk/XqlWErVk6s2ueCUftAcYyEP8id7s0hbzvFVMYW2CJoB3M+l
	GwtILX5LrhkHjIncqSNdW8zyna6yPRwx+La19sovV2UBS2Yu3wB8uJYlax4DhOpv
	WrttwdbWXPjygqc9UKaiYUzp1oGAfUFDBh/ewyGbxKEPeXr3p212UCQwWsilXY7t
	AYARuLG4ptT81yzHQ7ZjZmAE9RggzO81zR4PLzLTzC4tj8tuY38Hz8kRKtHmVNVK
	XgjpMYj0kBcSSWE+DP1sPi7sG9kJysozgpQ==
X-ME-Sender: <xms:uQNLactTc_iH1D2vfU1F0brTc5RUV2eZ_yoGlFpN2Mb9Ty9RtQ3a-Q>
    <xme:uQNLaXQdp4gIEXbGcAnhG0C6DKs9KUdq3fF1HyBSKSlY5F6EAu0MoG0NCx9-LdcJ9
    gKYom5-sjKHSH70OEpI8dWB6bQvhvwfs52SNPazrlfCaI7z3Lx81g>
X-ME-Received: <xmr:uQNLaSP4zr_IOm3rjelvHMIBLL4reDAbPe8jNv05VUiLmBr1P8je-4p56fCTe6U1J3rdInvBFRuPu21VlxNeQU1bAue42jrxW51RRCPzSZZ7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    dvhedvtddthfefhfdtgfelheefgefgudejueevkeduveekvdegjedttdefgfelieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesth
    ihhhhitghkshdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhiuhgsrgholhhinhduvddufeekseduieefrdgtohhmpdhrtghpth
    htohepvggtrhihphhtfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhiuhgsrgholhhinheskhihlhhinhhoshdrtghn
X-ME-Proxy: <xmx:uQNLacZm6QY3SrYrgTMDmSmvWMV_8rjjm-KVYVgOZH28os0QqeQJpg>
    <xmx:uQNLacy5KZ6HYKd0xHtDsnOrQfvJfqTuW-DnkY1FBy9oq2ywT_yWsA>
    <xmx:uQNLaXJK7h-C-hmo4LK5AUXkm1KIuNwJDazrOFdj55Ewi5VqTl8pbQ>
    <xmx:uQNLaWqxgs9z79oA53-eHThIDlI_-U87mDKVzmZbrrnSzVg-Q2Ft8A>
    <xmx:ugNLaYBvNxMbflR0gwOO8rvIpjYnqNbM3zXRDzcHfmcBXNmoiu7P61EZ>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 16:03:53 -0500 (EST)
Date: Tue, 23 Dec 2025 15:03:52 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v1] ecryptfs: simplify list initialization in
 ecryptfs_parse_packet_set()
Message-ID: <aUsDuNRNQF6BzVCw@yaupon>
References: <20251111121325.28975-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111121325.28975-1-liubaolin12138@163.com>

On 2025-11-11 20:13:25, Baolin Liu wrote:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> In ecryptfs_parse_packet_set(),use LIST_HEAD() to declare and
> initialize the 'auth_tok_list' list in one step instead of
> using INIT_LIST_HEAD() separately.
> 
> No functional change.
> 
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Thank you!

Acked-by: Tyler Hicks <code@tyhicks.com>

Tyler

> ---
>  fs/ecryptfs/keystore.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index 7f9f68c00ef6..ea00ba20a459 100644
> --- a/fs/ecryptfs/keystore.c
> +++ b/fs/ecryptfs/keystore.c
> @@ -1759,7 +1759,7 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
>  	size_t i = 0;
>  	size_t found_auth_tok;
>  	size_t next_packet_is_auth_tok_packet;
> -	struct list_head auth_tok_list;
> +	LIST_HEAD(auth_tok_list);
>  	struct ecryptfs_auth_tok *matching_auth_tok;
>  	struct ecryptfs_auth_tok *candidate_auth_tok;
>  	char *candidate_auth_tok_sig;
> @@ -1772,7 +1772,6 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
>  	struct key *auth_tok_key = NULL;
>  	int rc = 0;
>  
> -	INIT_LIST_HEAD(&auth_tok_list);
>  	/* Parse the header to find as many packets as we can; these will be
>  	 * added the our &auth_tok_list */
>  	next_packet_is_auth_tok_packet = 1;
> -- 
> 2.39.2
> 

