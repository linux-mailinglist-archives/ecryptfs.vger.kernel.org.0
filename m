Return-Path: <ecryptfs+bounces-774-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C999D162FE
	for <lists+ecryptfs@lfdr.de>; Tue, 13 Jan 2026 02:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5CEAF3006452
	for <lists+ecryptfs@lfdr.de>; Tue, 13 Jan 2026 01:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9973423D7DE;
	Tue, 13 Jan 2026 01:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="jtdzSYJ/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I5TpEJ8e"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1712157480;
	Tue, 13 Jan 2026 01:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768268479; cv=none; b=GGRv1VsnAETWLGm1WKBIVpxo2oXC0dzZjxoU8PaUVt6p4kD8Auc3Hrh+6GUxllc+JKGDongfRacq1AtxBwdCjKAcN0ghmoICW2+yT6JKk0ThrbYkXoVG+eZ+txFz+FVWyUc4ywvYUeYOrKpPTip5WqbES239G3RCQZbmlA1K9mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768268479; c=relaxed/simple;
	bh=rxwMOqe/qt1KlRwViHXcOb6ztHRisi4CpbVb+aV8PM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rww0M+YMW+ey0jLzaN2Lem3EKVL8xA0nnDhh6AuNWX2+lnRLj7+uhyQ1yr+kPIstx/hcH2j6oeFTNwN5BeDd5mZ7lCCEhrC+sFsZcpft7V3k9IyCm4CksKpmQkHOW9qzNxhr+RwUidddjU/bynBJ/SaOru14/N9m47XPbWm/yvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=jtdzSYJ/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I5TpEJ8e; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CA35414000A9;
	Mon, 12 Jan 2026 20:41:16 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 12 Jan 2026 20:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768268476; x=1768354876; bh=XgzNYEb/hr
	pXlRspJxbPf+Ybi2ysVkRdwsSKqp0L/K8=; b=jtdzSYJ/cwbc4wrv7n9UTIIjWp
	TXdSuA+EBMs7D5m54jwtYdC+L8/LqIGiuw06nD9PzOJf88avfmyIlEbQXsfVLjhN
	/Jlv4CHP9zPdO8JNq8rX1K4VAEwIdOOV7j/7wALgWh85IKNMFaHefNbSMTRBMJbg
	bZBqZXZyrIc34TxtuPzkZtbNgi/+NQslIOK6OszpgirOe6/1oAD5wWXdsAYG5Q5f
	hpgFVlhVLym4jUQwkjQNg8zX7Vb+3FEpQW3yjnALbCtViSfysjtkEwediMuA3JAO
	Pt6MptxOonki1B7qeItjw1HGt5erdF/bSwsEBM5k0Imnm4RWCTu+qSgcLhmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768268476; x=1768354876; bh=XgzNYEb/hrpXlRspJxbPf+Ybi2ysVkRdwsS
	Kqp0L/K8=; b=I5TpEJ8exKaHokeUriMECgXtYkpubNnnU1IUBOxZ5ie1Y7VIN1U
	Ud+7xO1Juwm0uqGRimYK8h8IWI7+Z+Yt14QVEaDZHNb7C5Z4rVgfZMGJrpoYu9QR
	49NmsG+j79Kw/MGXCyd6H7tXwph33ebXrk9MZFetj/nbsg8t6e6m7sYU8AGNiV1p
	7HhntJwMZv3hbseBTUyvQmTZ6XbXoI6XiiiDTw9XnqvjVYQI+kFK40pgpy0oQ1BT
	x9QYvKL9y2yjVEslgFhYD0UkFWvdsIDlBj8RVdpYldWpNED8YhHdJUyohpcOfZUx
	I8tQLc+dNUykgjgyafONBjyZV/hJUlZdBbA==
X-ME-Sender: <xms:vKJladukOU2g6uXIb8ff5ZLJXahFGC0pJ95iUU0RIgC9VVe9bzG83A>
    <xme:vKJlaUt5BPIvdy35Bbrba6Uhd7y6sqUEyWCKw3NPtjdgfIPCBs5Wkkok9gmsdZ3i2
    IhbwhTZqkDIhc5ZXM6xyyPAJxJuQ7p9V54g5RzWlS-WR7fXpcePk1K9>
X-ME-Received: <xmr:vKJlaaFKU-NzX1aieG97aD4JLMpRiVKjAh8nnOGe8kDBGhv67mmKoYORkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeltdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epffduhfduvdehueffuefffedtudekueekfeegveffvdegvdetfffhieegieehfedvnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghouggvse
    hthihhihgtkhhsrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepthhhohhrshhtvghnrdgslhhumheslhhinhhugidruggvvhdprh
    gtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhushhtrghv
    ohgrrhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdr
    uhhkpdhrtghpthhtohepvggsihhgghgvrhhssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvggtrhihphhtfhhssehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vKJlaXM_1ADIHyYa4QG7ifK7aP3mZTuQwZFuJ2fUYrdrswLvLGn_bw>
    <xmx:vKJlaRJxLxOgqJP1XZwz-jd7NlUPLw5iyekTJl-9stecxrZHQOBPqw>
    <xmx:vKJlaY-7kmCKYjlReMZUeD9i1lJXlNgdoiwhGEW312cvTrCqJ69z_Q>
    <xmx:vKJlaVGPIaX4QFJi4MNJpyiSR6ZPZmh35foAaoo3oCHvPcoV3Mg0nQ>
    <xmx:vKJlafGjkVlhQe-6xLDcW9smHSARjTvWLSGMbCN-X-nH5IzOGEYyOvgC>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Jan 2026 20:41:14 -0500 (EST)
Date: Mon, 12 Jan 2026 19:41:12 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: Annotate struct ecryptfs_message with
 __counted_by
Message-ID: <aWWiuLuqdhIIPgkJ@yaupon>
References: <20260112115314.739612-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112115314.739612-2-thorsten.blum@linux.dev>

On 2026-01-12 12:53:11, Thorsten Blum wrote:
> Add the __counted_by() compiler attribute to the flexible array member
> 'data' to improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
> CONFIG_FORTIFY_SOURCE.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Nice! I wasn't aware of this attribute. I'm surprised it isn't
documented under Documentation/.

Acked-by: Tyler Hicks <code@tyhicks.com>

Thank you!

Tyler

> ---
>  fs/ecryptfs/ecryptfs_kernel.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
> index 62a2ea7f59ed..f58b12be8267 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -359,7 +359,7 @@ struct ecryptfs_message {
>  	/* Inherits from msg_ctx->index */
>  	u32 index;
>  	u32 data_len;
> -	u8 data[];
> +	u8 data[] __counted_by(data_len);
>  };
>  
>  struct ecryptfs_msg_ctx {
> -- 
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
> 

