Return-Path: <ecryptfs+bounces-1167-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OKXAPK9xGk23AQAu9opvQ
	(envelope-from <ecryptfs+bounces-1167-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 06:02:42 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A048832F363
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 06:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1633301672C
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 05:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B125B25EFBB;
	Thu, 26 Mar 2026 05:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="DXUYo9uO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZnrFsBDQ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFBBFC0A;
	Thu, 26 Mar 2026 05:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501359; cv=none; b=oQ8ETnbF0+WzQAarZEBxp8beYMVR2FEcYwvTY6KYkt8Wc7Cc24JGOqatV5s7ibeK5mUhPh/NuC+bf2Dqo2wh+YpcjXqgQxmYdNKkUvvsqZdmMHJmkJPm42cxIH5Wt+Dj46T7YPaqH4JR3g0TOjZsGs4F+kQrEa/D4v4GYwdY2q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501359; c=relaxed/simple;
	bh=0F6AzdVQLqQyCApMN+h+PUSfUXGOaEQEgpopUaQhW58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USoJFfAEZNg/BTGNzUuS7+FwV95w5BMhWwtp5AQmNOKe5AwVhafFD5CIeJEbfSBr+3jtB/u+n8pfixom2eWkXddeyr939fdAM8VX7G6jok0woKoGaJwYYdKwp3jKmovGLxJm4Fnyodv+g7HswL6FNbfi0DAMpTf3k4kSrivXVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=DXUYo9uO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZnrFsBDQ; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id C8FAC1D0020F;
	Thu, 26 Mar 2026 01:02:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 26 Mar 2026 01:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774501357; x=1774587757; bh=1xFlS01Xnc
	5T1OaRYyuDgpE8OAhyvsZtMzMCqt4XbuM=; b=DXUYo9uOX2Y1vcWnO8xTJ6ogcr
	E8AMrZx0Z2ay4v5TbyP7WjlRs0H4utP/l6JNjK2Qdyo6NqR3SUv7u98+3KGyeGyJ
	rwCrQabhXesxl9oTEqqXjpUmVQR3Q0Uy1OrQqthv7t8m8UFjwnf+ahhneiecPWKW
	iQ69mICxUD8qndxVn3uNjaltHmCTRUuESwsNDe+MHdJGkRfssWQM5hclOi/ryYAQ
	JKwO+eXxO9lqW+JmPRGvJYXv2fL4HQgzPK3wTwGlT1Lq3zszVtEHAaoFAbRWwzWt
	9y1UEra5qzD8L7BWhxgonaV0CfXlfjtX6MIX6I0oDWq8VUyuRXdMkNG2j3Yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774501357; x=1774587757; bh=1xFlS01Xnc5T1OaRYyuDgpE8OAhyvsZtMzM
	Cqt4XbuM=; b=ZnrFsBDQvI4amGMRkGhZpFfAZVP2DaHtJVCKfBiC0PGCiCdN0n6
	7QhIAvv6g2a3zjaj3dBAaCnirVrPCKRUd+fRXs4X5akbG/MzR8KF/qY8dZeBuIDW
	WqRyQtMgXYmu5T9+lXZrOjLGIbgpZOIxSy8ar3hJywZST0JmBzs/UyeGX9vPIL7Y
	QcjRNe+c4keeGHYiXzHZYkAYoaq14pKaOSPcYz9SlkGmaRnXK/Bg+ZFvQF0gJN0a
	UO4sllfXlPihGQdG3wYIghM7tl33EdqG+SgTGD/rDL4RNm+wBqydmn22jpKVXzFN
	npkkhCV5T9KcqbiCfqArMyltAmty6yN+PdA==
X-ME-Sender: <xms:7b3EafqQXvGABlcrYXqAv3aJTINQuCHzeIDwhfBW5qwL_6DFRxbhcg>
    <xme:7b3EaS_G6RHWUM1TBRgoN9GMXNLFoGtNTRg9mE8zPYH7D35s7323pk0Jrv2HqSdOk
    GIm54-OLgd1EX8BRe4ut1SugKfYlpAhewx-vK5NbLvRFAsC_smhWj4>
X-ME-Received: <xmr:7b3EaTdrYYTb_Jdx2Ow60OS2Yo-56QLXvXyu-hcYJlg-xLh7p5RKCRY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdeigeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epgfegkeeiffethefgteffudfhfeejhedvjefhjeekudelffdulefhfeekieeludejnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghr
    tghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhrshhtvg
    hnrdgslhhumheslhhinhhugidruggvvhdprhgtphhtthhopegvsghighhgvghrsheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepsghrrghunhgvrheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvtghrhihp
    thhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:7b3EaUIvsvuveqnvsfQ1y5m9QY_1_sXtHs9vZun468RHz48CD6lnhw>
    <xmx:7b3EabjhMxwNPIuF3mpPlTVGEwulhIRQfN4F6Hseh9BgwR7PtnxPzA>
    <xmx:7b3EaaRvUENDQ2TEtB5KhcexAnnus0VXWTSAlo3_D25NSvUNjsAjGQ>
    <xmx:7b3EadW8APxSFFzqCtUvHZ6QNnM3u0dacLfZgG0Tzb2KqB48G8rE3Q>
    <xmx:7b3EaQs3RVMoqCKDo2LRzxTv-jO6rAqll6vsYcQZf2EgI-nV4XJRDodI>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 01:02:36 -0400 (EDT)
Date: Thu, 26 Mar 2026 00:02:29 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ecryptfs: Fix tag number in encrypt_filename()
 error message
Message-ID: <177450083116.1953525.7354719135504813070.b4-ty@b4>
References: <20260205132535.1011291-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205132535.1011291-1-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1167-lists,ecryptfs=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tyhicks.com:dkim,messagingengine.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A048832F363
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 05 Feb 2026 14:25:32 +0100, Thorsten Blum wrote:
> Report the correct tag number (70) instead of tag 72.
> 
> Use ecryptfs_printk() and reformat the string to silence the checkpatch
> warning: "WARNING: quoted string split across lines".

Thank you! This has been applied to the next branch of the tyhicks/ecryptfs.git tree.

You can find a direct link below but please be aware that the commit hash is
unstable and, therefore, the URL may not be valid in the future.

[1/1] ecryptfs: Fix tag number in encrypt_filename() error message
      https://git.kernel.org/tyhicks/ecryptfs/c/3b7f363b7bba203318c77d91c131123cf059cdbb

Tyler

