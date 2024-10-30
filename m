Return-Path: <ecryptfs+bounces-213-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE39B6E5E
	for <lists+ecryptfs@lfdr.de>; Wed, 30 Oct 2024 22:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41B85281F28
	for <lists+ecryptfs@lfdr.de>; Wed, 30 Oct 2024 21:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09DA1F4700;
	Wed, 30 Oct 2024 21:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="Jxq7SdXe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YarRtNLf"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85014F90;
	Wed, 30 Oct 2024 21:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322426; cv=none; b=NE14MRt+x4Yx0kecH7QWgD0EQQrGP0ZXdnmmMz6FfJJE5JTcu0j7WPmgVWSa47yNxsjRRe4+ARAeAlS1mfMOjylUIO4onFrEpRZ5uUvOBy2Af6FDT6PYyXiFAHIbRzf6HASVlayjKzn52a8mXcebGxT/Q35VjrVavFqpehMi0IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322426; c=relaxed/simple;
	bh=1fFvRA8Ti6aNmkII/E3CoPBzL8mG2bnG0r4usRcmrOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGUvUtlvPjBLCHHQoAQnCl90OClL56mu3QgmltEWZ1LFQHozCNTqf7rXx7+qjbtym99YTJDcMeNt+ZVbZOzuH/sJhSAmgvT5/rGJhB8ZnlQ3bVHFtoMaMktk2cA8V2B9Ek6/wiWCyDqwhw9QL7MIEn1brTRyYdEOcTa3Y3Co5qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=Jxq7SdXe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YarRtNLf; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 3050013801CC;
	Wed, 30 Oct 2024 17:07:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 30 Oct 2024 17:07:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730322423; x=1730408823; bh=UcDpvOVrCi
	ePv+GG2jgcrKxzk05VQ6RMJOQDsRm2Wsg=; b=Jxq7SdXexDBEz4imZuZgzjDNjh
	zdVqiF8jXz7QDZWqB9aWURKKREAgdFOQl++cxBOA2F85/CKeBX7R9JH/g0WDoLJU
	D6r8z+EDWw/F3p7Naw2ixkYO4FLI3HZTGuXD8aJF5DIUKZuM/eIVE20JzoNlSIBb
	WY14DJZiwEkLT/sAzbYEIBbmIDHTixEMGBtMtJtVroMAfeJ9w+M/KtBFE1MbsP9a
	avff/fHpUzCmhAIHIci424C0q76rKJYfGK/Hsf0s5J4g8Too18mXco4dDcaqPvVy
	ob2dXahle2m7NZ7MZk+KpSP51jTxF814Vwgqb5pNjWQnZi2OKUDsLE9HjR8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730322423; x=1730408823; bh=UcDpvOVrCiePv+GG2jgcrKxzk05VQ6RMJOQ
	DsRm2Wsg=; b=YarRtNLf5Bgv3nudJgNkE9rqq4RFaptlzFLiK9mjf9wXmmR5elo
	ZwWSYtsx/BAsFxFh8KgJf+3273HeHfuec9e46QHabHPYxM80lQM4rIBTAfxIdH02
	8AeJonT5m3tvL2t8y3K46+96gv1Fxcj3jwxx2dE18BGYQzqk5nSMh+XVqmP+fkLx
	tl40EyUpCBfWQ6ZmpShDd59mdbC/k0B9SBKFouPb6edmPRsBmPRW0VmI+WzQGTtN
	T/jVubRn2XaogBi1LY0H3gQPYFuM7cq86Ac1K6AusVKMsLj/56/k/802GSrXPLnn
	hhgOKliCZFY1f77Z2Zhvv3LbmICO1TKfvSg==
X-ME-Sender: <xms:9p8iZyntvIZKyd2sxdrBWgG8F6PYs3vPZXhNGEFt5dRvAZdnx-EgVQ>
    <xme:9p8iZ53sRZMW8CJY_5N0xo-XtWLB1MnNVZiKVC5jCAwalOvNKoapD6JLrtgRz7_79
    dA88iL5n8OY_Nn_OHE>
X-ME-Received: <xmr:9p8iZwold8VdCpUID6T91bGnaItMwWoB7y4h4MW_5rbz7xKrczcAGAqR-xCTnwRQZBnNoOJCSW-zWbRHfip2Pr8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefvhihlvghrucfjihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedvhedvtddthfefhfdtgfelheefgefgudejueevkedu
    veekvdegjedttdefgfelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghrtghpthhtohep
    jedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthihthhsohesmhhithdrvgguuh
    dprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepfihilhhlhies
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepuggrmhhivghnrdhlvghmohgrlhesohhpvghnshhouhhrtggvrdif
    uggtrdgtohhmpdhrtghpthhtohepvggtrhihphhtfhhssehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:9p8iZ2ktHTU-Itco9mEDQSjyI5hilV35HN51DXmyhhv4hOIApWR2Hw>
    <xmx:9p8iZw1wSPsvyJVz24ov4rOuVzWQwbf_j6J6PxO-MjcVP7xRKP5iHg>
    <xmx:9p8iZ9v_ZSVzPOmuz8ZvnfpsupxA8esOy-hSyrd_Q_PguyTS4O04SQ>
    <xmx:9p8iZ8VDzspnJlNTLRCT1N44WrxFp8ljd1Xo7zKSVygnvK_0rdnvug>
    <xmx:958iZxnYJ_rEqNxZMEa-a1MRdvNthH-lR_T8A4yPRwkWcmUEqjJ4foof>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Oct 2024 17:07:01 -0400 (EDT)
Date: Wed, 30 Oct 2024 16:06:49 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ecryptfs is unmaintained and untested
Message-ID: <ZyKf6ZSZrETI+4/S@redbud>
References: <20241028141955.639633-1-arnd@kernel.org>
 <Zx-ndBo7wpYSHWPK@casper.infradead.org>
 <ef98d985-6153-416d-9d5e-9a8a8595461a@app.fastmail.com>
 <20241029043328.GB3213@mit.edu>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029043328.GB3213@mit.edu>

On 2024-10-28 21:33:28, Theodore Ts'o wrote:
> On Mon, Oct 28, 2024 at 09:50:37PM +0000, Arnd Bergmann wrote:
> > On Mon, Oct 28, 2024, at 15:02, Matthew Wilcox wrote:
> > >
> > > This comment has been there since June 2021, so I think we can just
> > > delete ecryptfs now?
> > 
> > I have no opinion on removing ecryptfs, but I don't how possibly
> > removing it is related to the patch I sent, as far as I can tell
> > it just means it relies on both CONFIG_BLOCK and CONFIG_BUFFER_HEAD
> > then.
> > 
> > Is there any indication that the last users that had files on
> > ecryptfs are unable to update their kernels?
> 
> Debian is still shipping ecryptfs-utils and is building and including
> the ecryptfs kernel module in their distro kernel.`
> 
> So it seems likely that there are probably a non-zero (although
> probably relatively small) number of ecryptfs users out there.

It would be good to discuss how we can get the message out to users to
migrate off of eCryptfs so that functionality can be reduced and
eventually it can be removed.

What do folks think about the following?

1. Print loud warnings at mount time that eCryptfs is deprecated and
   give a specific date when write support will be removed.
2. Remove write support at that date, while retaining read-only support
   to allow any lagging users to move their data to fscrypt or other
   alternatives.
3. Print loud warnings at mount that eCryptfs will be removed and give a
   specific date.
4. Remove it.

Suggestions on lead times for #2 and #4 would be appreciated.

Tyler

