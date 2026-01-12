Return-Path: <ecryptfs+bounces-773-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4467D1507E
	for <lists+ecryptfs@lfdr.de>; Mon, 12 Jan 2026 20:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C041300EBB2
	for <lists+ecryptfs@lfdr.de>; Mon, 12 Jan 2026 19:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4ED638E103;
	Mon, 12 Jan 2026 19:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="ivz5Uvc0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iTTE5Tjx"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B183242D9;
	Mon, 12 Jan 2026 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768245818; cv=none; b=QW6oRz4DAo9pAtqDja8rPl4hj4DlQE7Hjh2Dk7Nkqvi9ETxeVSKNa17qAem0k+Jw7GJSXwkw78UtvSxd5J8uBs/Mpab2io7O74SHvA1FsfMNSvxJoCgvhJVnKabvB2PYnEdupM3ExbadMbJ3zrNpbMPGdzuuWL128j1cvVAilkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768245818; c=relaxed/simple;
	bh=VrQ+HuNDrrBvHmxfxFB3ppJO0NCjlmdu3wF4xgRXfVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GV+7FOJ/gBEVqX6ppYb//vh4RmhoL8EmtjgxXAVLSYicbZ74xf/3E2sngvmjH2NkyNmBVrpXFqj52KP/w60WJDMlZYpEprMAGqkdMnEvwPNOsY9PrAJPBGJaaH0EjMSywHYS8PbISBZpo96gZ05dqvLtjggrk2sKRSBV8AEjt+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=ivz5Uvc0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iTTE5Tjx; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ED97414000D5;
	Mon, 12 Jan 2026 14:23:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 12 Jan 2026 14:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768245815; x=1768332215; bh=WsK+GQRd8+
	amlKYl2ufesV7Qu4UKibxO52zq09OpqnM=; b=ivz5Uvc0kQT2sZqdiyEDI6y/hP
	qFT3Cr+qkxd4N2exh3+nPVIZsh6TcULTVi6SfXYEmz4EMj72y7cVg8ncLBKcTNoM
	Yjopn+Xd2Zgm/dO4iGfn63Mtm/oivTH7vbYHKgao++bSxlC1MBU+Oq2Dx0GuQwRB
	Xv/UhKqn/5IQ5lR1CbpSeNLVbBEYUiSZxz5HS/qT72Je/bbdRP97MKaWe7buxjXx
	DK4VOSIHwKlaVtnnuQFIMxeeR8/yCeEfwFbraoZ1Z4oWLNJtpCJP+3x8GW8YjXh7
	eer5erwaon9RUz0PkllnkwbHCF6/Pt/JNtt0qJm5fmJTmd8hRcEQY3BmZ6MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768245815; x=1768332215; bh=WsK+GQRd8+amlKYl2ufesV7Qu4UKibxO52z
	q09OpqnM=; b=iTTE5TjxrySxroUSioP1GJiHGGPLg+0LCdb4jLURf31hahKzaiw
	xbeV/icKFUYy4TZMwJADaGXZ44p9YTPzieLyQrK3xtZQ03f9P3lXcRvxh5RwyyVw
	Np1JAZ3OgrHmJw3apRU6Ub7ZZrR7rptytZxqK5Sk6BiRlona+BJ3MYSDt7VSWINk
	oVqyVC9Kl1YTVM6uks/iDlKIctEc0Z2VrQC1Q5OV4mlIAWAjnwONsBCvo2+19cDV
	TWpUyUO1iOEYBQAQZmhcQKN7vHRLleLkAC5pJD5FOpvawpCPWwjXq6icRjT7gqgd
	Cn3C4Eu3JptqvNXUHG2Gl+MwOUkcyf063ew==
X-ME-Sender: <xms:N0plaU4W31GyVQiA_KgH0IinhgR4Jf0BOO6Ppey3h5I1ScBg61bZ2w>
    <xme:N0plaUIZZ-DGZv1CJ17uCOskbn5OZ2SHN0wlqgXxEPjNpR83phtDc0L51cQv81Ev0
    kiz6n19r6jVrmskpi1Q65ly2Uk72rY9j2S5PejhzEOiq-v4ahGw>
X-ME-Received: <xmr:N0placxQvai2PhEhGLM42cbCrKPjK48hD4svwsFVN16EK9Xtojvmsfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudekvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epffduhfduvdehueffuefffedtudekueekfeegveffvdegvdetfffhieegieehfedvnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghouggvse
    hthihhihgtkhhsrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepthhhohhrshhtvghnrdgslhhumheslhhinhhugidruggvvhdprh
    gtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhrtghpthht
    oheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopeiihhgrnhhgiihiphgvnh
    hgtdesfhhogihmrghilhdrtghomhdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphht
    thhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegvtg
    hrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:N0placKBJ0pH_7Pr19dEBDOz6yToets4ix9ANGG45vCUsaIE6VDi9A>
    <xmx:N0plabWmCbwJsEHJIm_TKD-uXTb-IxNxkfcO2h6exw7pJ4hg9u6TVA>
    <xmx:N0plafYD8B17U9DmeoJlqoLe6jwtbpL1W8zQnL0vhCyLI8HoAiOTzg>
    <xmx:N0plaSzt2SWVxWMFaCnDUaTQDF_aWA8swFhH5V5v1UeoCF4jCJ67pg>
    <xmx:N0plaZyhu659jpzm98vPwCeZUhFbrLVnVdMTLXW7aPdoRgfw7t6O3gC2>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Jan 2026 14:23:33 -0500 (EST)
Date: Mon, 12 Jan 2026 13:23:30 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: Add missing gotos in ecryptfs_read_metadata
Message-ID: <aWVKMoUMBwnYWCPw@yaupon>
References: <20260111003655.491722-1-thorsten.blum@linux.dev>
 <20260111010825.GG3634291@ZenIV>
 <5DD6E30E-4974-42D9-86CF-A6A78CF0492E@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5DD6E30E-4974-42D9-86CF-A6A78CF0492E@linux.dev>

On 2026-01-11 13:28:17, Thorsten Blum wrote:
> On 11. Jan 2026, at 02:08, Al Viro wrote:
> > On Sun, Jan 11, 2026 at 01:36:52AM +0100, Thorsten Blum wrote:
> >> Add two missing goto statements to exit ecryptfs_read_metadata() when an
> >> error occurs.
> >> 
> >> The first goto is required; otherwise ECRYPTFS_METADATA_IN_XATTR may be
> >> set when xattr metadata is enabled even though parsing the metadata
> >> failed. The second goto is not strictly necessary, but it makes the
> >> error path explicit instead of relying on falling through to 'out'.
> > 
> > Ugh...  IMO the whole thing from the point we'd successfully allocated
> > the page to the point where we start to clear it ought to be in a separate
> > helper.  Something like this, perhaps?
> 
> I wanted to keep the fix simple, but I'm happy to refactor the function
> if that's preferred. Any preferences, Tyler?

I typically like the multi-patch approach of a minimal, easy-to-backport
fix first and then a more complete cleanup/improvement in the followup
patch(es).

Tyler

> 
> Thanks,
> Thorsten
> 

