Return-Path: <ecryptfs+bounces-211-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D049B3D3F
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 22:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4721F22F97
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 21:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E235C200C91;
	Mon, 28 Oct 2024 21:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="iHwthIGI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lif6ZCIb"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAD12003D1;
	Mon, 28 Oct 2024 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730152271; cv=none; b=Sk2h0dNrKAlr+xHw01NIPEjf8CqYBkr/8oWc6CULJ5Bs0WNvf17iVFbYuGBxQlL/y0+up8NGatSMgFWLgZjVi5o/se5ra8L2X6kHadRxXmuLLiuArDDO6s4dO7/Scwq88a9G/JOUPsUh5wpDAOsK7cj37/tDFp5l86VN+tu5y3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730152271; c=relaxed/simple;
	bh=ciCHEcR/+fM1Bl2YmDAEvLge5jLCBjD6TkI766a2eQE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cycrNEKAmUr9dQJQ1SdfSgmawCAfMaxc//rKx4JlTbTRS1aQDSWQpK4/Qt0PwkBYpyGA4AqZZS9XWdVI2DIaKqjyb36ZjtUbWEEp4AqnfxLDCPfv6jzdpSQh4luxLISi2zY54hVRfsU4I6kbnCZVxZALPDLbmgcCrknsH7YtO2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=iHwthIGI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lif6ZCIb; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6C7092540125;
	Mon, 28 Oct 2024 17:51:08 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 28 Oct 2024 17:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730152268;
	 x=1730238668; bh=IVQO6E4XCdu72s0skdgnCFjXITo0nnSfxqYvaYfH1A8=; b=
	iHwthIGID+Esan2AGTcXQRpEp4b/Ly8itsC/ao8ylhEKR3+ewOQl5g3HK23fwf1w
	5JksVgnxgHutBdtcl4SylAAU8Y4zX1PDvU3gYLT8/MWCD+tOWzkPnhGy159J7Gev
	oU8t1QdKvsksFaptbnZ9q+8uR4FamSO8RglhzzsQswwNigeXkxpQzIzQ5CPl01/+
	/YOxg6ry/t5449rU/fpf9PWOOpbNQzFvSotvc+GzOsX3++U3ZodkQ8nZxFA80A5p
	c/Lld04WZHETBF8mgAmFA22UQ+MOSKLDfLQrI5bwO384L3RjjsahLde1gnAtx9AB
	DWD3GeUcq8xLkOAwhr6xwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730152268; x=
	1730238668; bh=IVQO6E4XCdu72s0skdgnCFjXITo0nnSfxqYvaYfH1A8=; b=l
	if6ZCIb/0HuIWtQ23fMP8GJkKyRobpGnxBCj7ZF98D3LHfULaHnQfC5MEI7kWzfE
	sqWssd3fqDAt7FvWBJqKKOtTgvJjvX2VbSM6UxIL2llBTzomFuau2svDVeJsRXRm
	4RMQ0E0E1QHbUNC1oD+GhbiFvYsfD4AI0fSZinfQT2hUiiXH9cH0YTB6Z8Km3UVv
	0E3eh593C//ehra9kxYlrpU//0GilkJJd+5afez5TxIPXQ6cDdADqolHlqvMytFq
	FqAS1lNHcQXJSY5u7q2et7/GgcHQ+VXiUfW/GHA1W7EOHarccMlywe0QrtQeBkIz
	dt9xeZvdvijuLdkJbLc9Q==
X-ME-Sender: <xms:SwcgZygzRO-IpJX6aWGGQxrkrZwKSg_rPXoVI1nymwTnU6jxcUZHEg>
    <xme:SwcgZzDU1UaDGuGvNuTXJ5DKCxpuzLu5PnzmXKnUggmPlII63Z35ws5fW8n-g7Qp6
    3Ka2KwrFuUmS71fcDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejledguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegurghmihgvnhdrlhgvmhhorghlsehophgvnhhsohhurhgtvgdrfigutgdrtghomhdprh
    gtphhtthhopegtohguvgesthihhhhitghkshdrtghomhdprhgtphhtthhopegvtghrhihp
    thhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:SwcgZ6HQTnnXwiXVlqwa5fG1rv19Xxn747pGAAlEuZ8DGXqa8SsPUA>
    <xmx:SwcgZ7TmTq3QNqUL9cAxN_uAG8uG1Zn6CggByeHNMbS84V6DVEGRHQ>
    <xmx:SwcgZ_y2EbD6g2xixT2TlkwWkqIct39RURX52iY3mr8-N8wfrhygpw>
    <xmx:SwcgZ57tJ5twz50V7kH6xpPOD9ezu_jV6Wlhmblk5Fk03qrz06MOcA>
    <xmx:TAcgZ6rZgxiKKCU6nASdh0iFB0Sv2Sg5ic4mCpwqIyguiMoWs_x79H8d>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C44572220071; Mon, 28 Oct 2024 17:51:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 28 Oct 2024 21:50:37 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Matthew Wilcox" <willy@infradead.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Tyler Hicks" <code@tyhicks.com>,
 "Damien Le Moal" <damien.lemoal@opensource.wdc.com>,
 ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <ef98d985-6153-416d-9d5e-9a8a8595461a@app.fastmail.com>
In-Reply-To: <Zx-ndBo7wpYSHWPK@casper.infradead.org>
References: <20241028141955.639633-1-arnd@kernel.org>
 <Zx-ndBo7wpYSHWPK@casper.infradead.org>
Subject: Re: ecryptfs is unmaintained and untested
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 28, 2024, at 15:02, Matthew Wilcox wrote:
> On Mon, Oct 28, 2024 at 02:18:45PM +0000, Arnd Bergmann wrote:
>
> The comment says it doesn't work without CONFIG_BLOCK:
>
>         /*
>          * XXX: This is pretty broken for multiple reasons: ecryptfs does not
>          * actually use buffer_heads, and ecryptfs will crash without
>          * CONFIG_BLOCK.  But it matches the behavior before the default for
>          * address_space_operations without the ->dirty_folio method was
>          * cleaned up, so this is the best we can do without maintainer
>          * feedback.
>
> This comment has been there since June 2021, so I think we can just
> delete ecryptfs now?

I have no opinion on removing ecryptfs, but I don't how possibly
removing it is related to the patch I sent, as far as I can tell
it just means it relies on both CONFIG_BLOCK and CONFIG_BUFFER_HEAD
then.

Is there any indication that the last users that had files on
ecryptfs are unable to update their kernels?

> If we can't delete it for some reason, I think we can use
> filemap_dirty_folio() and remove the setting of invalidate_folio()
> as block_invalidate_folio() is a no-op if there are no folio_buffers.
> ie this in lieu of your patch:
>
> -#ifdef CONFIG_BLOCK
> -       .dirty_folio    = block_dirty_folio,
> -       .invalidate_folio = block_invalidate_folio,
> -#endif
> +       .dirty_folio = filemap_dirty_folio,
>         .writepages = ecryptfs_writepages,

This clearly addresses the build failure as well, so no objections
from me, but I don't understand what the functional difference is
here and would rely on you to write a changelog text for that change.

     Arnd

