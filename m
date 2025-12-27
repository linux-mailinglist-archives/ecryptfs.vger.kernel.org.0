Return-Path: <ecryptfs+bounces-762-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E70CDF331
	for <lists+ecryptfs@lfdr.de>; Sat, 27 Dec 2025 02:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBB36300100C
	for <lists+ecryptfs@lfdr.de>; Sat, 27 Dec 2025 01:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D15221FBA;
	Sat, 27 Dec 2025 01:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b="oCVjS7f6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E9cJ6Fm+"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A022256F;
	Sat, 27 Dec 2025 01:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766797571; cv=none; b=Xzs68yQuDrUfBm2V4WfMDAUsQWseQJ8XNW2gZDD1NBTVpU2xPbQRTGjeAlYjcfl4AApjXrcKW+gkeVUGbzaxZLfmBRJOTx2Vybib/f7qn3r/tL6uEwUemVTq2SvuG+A5Ej1PxscqOcMNB3LAcvDB+NM9uxmpmpaK5S8IigUV8sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766797571; c=relaxed/simple;
	bh=NGHj5sL/YYuLkZYPsqVwatkaAf6spSy3cIDwRqxIr8A=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=KRzyR1rIK/EyfoWbwiYfAheDBxQqHLEbBpel9LZm+w7PSo4Phy1VDrjgnZleX9p6okevSZ/Z4QfE0OGTNAza0WTb77EbrcK3vYhJge4vqHnvN/gZKW4XtirrY/GU84D9DVKIH0haqfor05edXhtKPC6jYVCsihVJoFHLgruGFHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net; spf=pass smtp.mailfrom=ownmail.net; dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b=oCVjS7f6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E9cJ6Fm+; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 48D6E7A0040;
	Fri, 26 Dec 2025 20:06:08 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 26 Dec 2025 20:06:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
	1766797568; x=1766883968; bh=tzFKenmNlFYBAT7fyzCpih1uo+o14qLZLaw
	wBB1kw/w=; b=oCVjS7f6itF4yShxlWpNJA8OYGcf9ogeNA63XYkv3vSbdm/VVCq
	YO3+TJQowrgNzelghiFlm/uCf+XzYcGl4rqiQd8nsjMMrATT5XTPTY0Vr6PPgz1D
	ww0GxmklEn/jfUHFcS5bytm9MX8ecLUdZ7Nr7IeLQrGP5LtLMmtiADERXIbmL6ke
	xhzq/mrjoQtar5x1KNnsNgwmgWaXwn7Xp2f9ohfvuCp4QeJnJSXaJCYEvsuOdrpV
	SrGnr7m2/mNGqAWh2o1evahF1loHW88EZNglxAs7o5zoiOrOLw7ekDrKAJ57DwX1
	ilIrPlT51z5wtIE+nsw7NIeBXtMa1GlKm9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766797568; x=
	1766883968; bh=tzFKenmNlFYBAT7fyzCpih1uo+o14qLZLawwBB1kw/w=; b=E
	9cJ6Fm+TJJsTVCZ4UnI0m/gy/L5cTYB2k07IQEu3X1ggVNK+ULzJ972HBgJPPjal
	ioydOcu8df5mP02nEbA6ZtTPK8rFghZtjHpaDQYlxwkdKu8p+IBpGkohjhIkWzHF
	1HNi1oNXIX6in+YtS2+bLuvLG5Nh7GkuCLbrIWNoM+ukaij9gvDir4RqPkfdSsSt
	GO/kC1mKr+bJ/dgE5W3vWfFLw089oxeqUT4hn23Ermwf1ujiCo0gW3ws+8wSoLVh
	XGvBDVjXNhduQr2vp9EHcTh4sl/i1GBxaouKn0pKUW7QkDicPOfPq57NGKKADXqk
	2CCDfoXPtay5ufxgzc2bQ==
X-ME-Sender: <xms:ADFPaQmMBHarbxB2GOPtJaDQs9hbmU4_UvjjLl6ARZC5BcK89Oii9g>
    <xme:ADFPaZIl-R80u6jW7EHvN4JFuyshfKVa2PTS16lNBVX6uULQDIZSMa5ERWyOC8VoI
    eaFrY8m6qUGc1y9siK_azvBZ197AmDhd8KFY8i7NTjXdxH7iw>
X-ME-Received: <xmr:ADFPaV764xkkZlGV6S66n6fLLft6F9OKZiiWfka7XHgPKlp1vVPVXvuKG5kiQIkd240Sm83EkL-LvzjO4Hubg8DlZDbCPIs3WEnDKnuh21hn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeileeljecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpegtgfgghffvvefujghffffkrhesthejredttddtjeenucfhrhhomheppfgvihhluehr
    ohifnhcuoehnvghilhgssehofihnmhgrihhlrdhnvghtqeenucggtffrrghtthgvrhhnpe
    egheefveehheetteduheejudeihfeuheeivedvjeekueefveekleeiffffudfhveenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhgvihhlsgesohifnhhmrghilhdrnhgvthdpnhgspghr
    tghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvggtrhihphht
    fhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghouggvsehthihhih
    gtkhhsrdgtohhmpdhrtghpthhtohepjhhlrgihthhonheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepsghrrghunhgvrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghmih
    hrjeefihhlsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ADFPad0s2rp5x8bhdzoSggnYXb2jmFFWVypqrCUDIxy9mKUDnTIFXw>
    <xmx:ADFPabce-KKKb9m0Us_8Gg-oyZRbieBSNrXITdOoRt05lJvg6PtLPw>
    <xmx:ADFPaTeCv1AD9I7UFEe00haeT9ihxraEWSHvrfqmIMX2TB_xYXmmzQ>
    <xmx:ADFPaWy3fxj0s0diuezJlto4xVGovnPu04NtapKZCsZ0C1DUB-hiqw>
    <xmx:ADFPaUouIE3PR2ZUEegebuEyXsguaLGEAYgKbqJDp45BEUlHrMpkkgB0>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Dec 2025 20:06:06 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Tyler Hicks" <code@tyhicks.com>
Cc: "Christian Brauner" <brauner@kernel.org>,
 "Jeff Layton" <jlayton@kernel.org>, "Amir Goldstein" <amir73il@gmail.com>,
 ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix two regressions from
 start_creating()/start_removing() conversion
In-reply-to: <20251223194153.2818445-1-code@tyhicks.com>
References: <20251223194153.2818445-1-code@tyhicks.com>
Date: Sat, 27 Dec 2025 12:05:59 +1100
Message-id: <176679755972.16766.8394247113563710609@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Wed, 24 Dec 2025, Tyler Hicks wrote:
> When running the eCryptfs test suite on v6.19-rc2, I noticed BUG splats
> from every test and that the umount utility was segfaulting when tearing
> down after a test. Bisection led me to commit f046fbb4d81d ("ecryptfs:
> use new start_creating/start_removing APIs").
> 
> This patch series addresses that regression and also a mknod problem
> spotted during code review.
> 
> Tyler
> 
> Tyler Hicks (2):
>   ecryptfs: Fix improper mknod pairing of
>     start_creating()/end_removing()
>   ecryptfs: Release lower parent dentry after creating dir
> 
>  fs/ecryptfs/inode.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks for finding and fixing these.
both
  Reviewed-by: NeilBrown <neil@brown.name>

I note that in https://lore.kernel.org/all/ZCuSLNnFQEdOHW0c@sequoia/ you
said of ecryptfs:

    I'll send a patch to deprecate and mark for removal in 2025.

Did it ever get marked for removal?  Is there a chance that it might be
removed?

Thanks,
NeilBrown

