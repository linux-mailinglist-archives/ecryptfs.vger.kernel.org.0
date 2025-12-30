Return-Path: <ecryptfs+bounces-764-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE3ACE8A51
	for <lists+ecryptfs@lfdr.de>; Tue, 30 Dec 2025 04:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CBCB300F89C
	for <lists+ecryptfs@lfdr.de>; Tue, 30 Dec 2025 03:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB0A1F30C3;
	Tue, 30 Dec 2025 03:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="YVo1JTmS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rKFLYBqJ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B1D1DE2C9;
	Tue, 30 Dec 2025 03:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767065436; cv=none; b=NGLtudIq3fgHZNly3a31xJ8ZQFENheT4S+78yAt3f1OOqZyKEe1n6FT058K4G0oX8wDZ/mJ6GhxyI14zm9l2fwx9V08CKkaU54LmiVVaPFKwB1CgjipcRWmPYgxoB7aCT22NCEue0HlWEIgtIoFEH3yjv4DkXLOfmGVInPs8bYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767065436; c=relaxed/simple;
	bh=BWkpJKbcW5+1mW37dEOlhscY1jwsRKcaPtxoc0Df4JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BM6ksX7OeRpzgoTkE7+CQYca73dNtLoL7HXXb/ZCtYWSpKozII0BIGjWl9XLf2sGvehi++a8ftTSDzq1y7A9g7X5EaEcW3M1a07CIE6VXYI7pE112tnabjpEXHSBwH2GlXzkNRIByKDZsY2x17ngoBhUWWP93ufJQxmmNLU22hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=YVo1JTmS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rKFLYBqJ; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 7E2E71D00091;
	Mon, 29 Dec 2025 22:30:33 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 29 Dec 2025 22:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767065433;
	 x=1767151833; bh=Bz9V9oIZ0xUwxl+6gE1ob+yaZzlW9m/PuYQ4kB3xzMs=; b=
	YVo1JTmSH37SuGwGxdzDG9k5BvnMB8OveWVkWu+omvum60zWSimeDEoHUs8a5G4+
	StxC3Lt52xEWFp2Jm4WV+O/V9r8b2syuXpYJLjGSvrtuvDA7hiB46gV9wYKSLXBm
	9JgW9ikvZmTnDmXKNconOo1uyzgSJ/OBAjqxu4/4r6ahJoZ7PcajCyajcHLPhCVf
	v5b5P4jk/Jzq+uxAl3uSEDQHwl69mgiezu49ckYUldhl+sWezvchPhAIORvgNyd+
	p1DHp+nb7sXdwlVj3N6V25//hk182wCWW6R968Qk+L75/800yQIPzjYCbWt+OhD8
	iA21UO7G+rDtrLDcKuqWUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767065433; x=
	1767151833; bh=Bz9V9oIZ0xUwxl+6gE1ob+yaZzlW9m/PuYQ4kB3xzMs=; b=r
	KFLYBqJQCHaE4NfUJWNDzksjqI1uz31XD5yZQeW7LLmrztUzXrrcc68zo2iHMpCy
	uxpbtpML16obZnT+9h3kBoZeaYS+2SZg3G+JZ3tGMhMatwSNf2u+f9Ibr8Beiq0P
	BS93ZXvwOGejAraKbEHYWfAMONEOWc2pSSjZyjHqyvPbwWRUtSTv7sZTrakwMPb6
	m4dXT6q9fBJWAV7LhzEToOOjvvUYoh2sDmXpXrEQvvR06gX7rgrqkCFc9cRm9RSC
	XETjHIubkT/Teu9nHTi1qNHtXnMW+4v/cvYQLfXO7vxpy7aScufxjmxWxVm7YBWz
	xcRRBWqcN8ETNAxwfLDSA==
X-ME-Sender: <xms:WUdTafbGai4UTABKvU2AXDRjvTWk4bYH9C77J1TBI-N6x0gSXHQ97w>
    <xme:WUdTafEor_9FuqTrd3feh13xUlOqJcwt21WExNJ6mfNNze-zgH-vIBzc3khEf4ys6
    IwJPpt42LMQLkVIhyJjsIAKawwI7MOSYhEoBEuwHDV9-cSngMMoymI>
X-ME-Received: <xmr:WUdTaQLJPUCbTnNzYs2iR0KLqiGY7C1_RLlNZk5i1fMw0RYAK12z5m9ON_XItcsR6N8uhjb9OndAACcTWGc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejkeelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epgfeklefhfeelhfeuudetteeuhfeuffdvhfettedvleehffduudelkeeuheejueehnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghr
    tghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghmihhrjeefih
    hlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughushhtihhnrdhkihhrkhhlrghnuges
    ghhmrghilhdrtghomhdprhgtphhtthhopehnvghilhessghrohifnhdrnhgrmhgvpdhrtg
    hpthhtohepsghrrghunhgvrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhlrgih
    thhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvggtrhihphhtfhhssehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:WUdTaaPBCzlJSwpfOZJ4JztO0AbloE0nxQXuvtad12e26s0yIKhFGA>
    <xmx:WUdTaQlAGCoIkwcrUaNThWC-yfvt4xiVYRuWlPrVaVjkOur1CGnI5Q>
    <xmx:WUdTae5UkBq76gS01c5-cbVUm9QVa4Yru-teIriNd3Qro2O49QPlmw>
    <xmx:WUdTaU27tj6ZeNZXkhq_jcW8iH7bUNv6tsTEY_2by2XbW3akbqIqfA>
    <xmx:WUdTaYd9GAtz3Oymxvjpz2Xzxydi2rU4HnTbPl0RoBWXYS8ks_osECne>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 22:30:30 -0500 (EST)
Date: Mon, 29 Dec 2025 21:30:18 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Amir Goldstein <amir73il@gmail.com>,
	Dustin Kirkland <dustin.kirkland@gmail.com>
Cc: NeilBrown <neil@brown.name>, Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix two regressions from
 start_creating()/start_removing() conversion
Message-ID: <aVNHSjJVRGKjDBi0@elm>
References: <20251223194153.2818445-1-code@tyhicks.com>
 <176679755972.16766.8394247113563710609@noble.neil.brown.name>
 <CAOQ4uxjp_Rgz7guv0wR6Bg40JuCiZP1L49wt_iUVnWqJjE2DLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxjp_Rgz7guv0wR6Bg40JuCiZP1L49wt_iUVnWqJjE2DLQ@mail.gmail.com>

On 2025-12-27 19:15:18, Amir Goldstein wrote:
> On Sat, Dec 27, 2025 at 3:06 AM NeilBrown <neilb@ownmail.net> wrote:
> >
> > On Wed, 24 Dec 2025, Tyler Hicks wrote:
> > > When running the eCryptfs test suite on v6.19-rc2, I noticed BUG splats
> > > from every test and that the umount utility was segfaulting when tearing
> > > down after a test. Bisection led me to commit f046fbb4d81d ("ecryptfs:
> > > use new start_creating/start_removing APIs").
> > >
> > > This patch series addresses that regression and also a mknod problem
> > > spotted during code review.
> > >
> > > Tyler
> > >
> > > Tyler Hicks (2):
> > >   ecryptfs: Fix improper mknod pairing of
> > >     start_creating()/end_removing()
> > >   ecryptfs: Release lower parent dentry after creating dir
> > >
> > >  fs/ecryptfs/inode.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > Thanks for finding and fixing these.
> > both
> >   Reviewed-by: NeilBrown <neil@brown.name>
> >
> > I note that in https://lore.kernel.org/all/ZCuSLNnFQEdOHW0c@sequoia/ you
> > said of ecryptfs:
> >
> >     I'll send a patch to deprecate and mark for removal in 2025.
> >
> > Did it ever get marked for removal?  Is there a chance that it might be
> > removed?

I never did that, as I did hear from some folks that depend on it. Not a
lot of people but there were some.

> If it does get removed I wonder how I and other users would access my
> ecryptfs folders?

I have thought about stripping out the write abilities, after a warning
period, so that existing files could be read and migrated away but it
wouldn't grow new users.

> It sounds to me like the road to deprecation should go through creating
> a FUSE alternative in ecryptfs-utils, before the kernel driver is deprecated.
> 
> Tyler, are there any problems with doing that?
> I could give it a shot if I have your blessing.

That is a nice idea and I'd be happy if you did it! Do note that
ecryptfs-utils is even more stale than the kernel driver and hasn't seen
a release in a very long time. It is still stored in bzr instead of
git!

I'm not sure if Dustin Kirkland (cc'ed) has the bandwidth to make new
ecryptfs-utils releases to deliver a FUSE alternative but, if not, it
could be a good time to move to git and host new releases on GitHub or
maybe kernel.org.

Tyler

> 
> Thanks,
> Amir.

