Return-Path: <ecryptfs+bounces-1164-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIHKDJW9xGk23AQAu9opvQ
	(envelope-from <ecryptfs+bounces-1164-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 06:01:09 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8C132F336
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 06:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C03003016280
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 05:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA1824634F;
	Thu, 26 Mar 2026 05:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="iKouh6yZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MCj9yGMB"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B18FC0A;
	Thu, 26 Mar 2026 05:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501265; cv=none; b=cqffRgWHJtxZQgvxjF1O2J1QY0mzAjpmUFMB6DM6hLKkH+MabAFG88QFKahDloVAFGgtyEh9qybRKe8dI8O9WcqNdO36JI2Xd5kFOzBbH2iZlVqENjlZcGkI9urjYY/ULBvmqT8aD23t9VA/Zars9OW7SSnb/S8FDB/pYoLRVaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501265; c=relaxed/simple;
	bh=Wj0KY45LJasoVSjEwjYIzd5evDmSVXadfdzS23CYwEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDPbUfeOlc6epeBKKbGUVZyXLc034LXNan9cUQnAZeQ2m1TheBeGJrx6BLWeAppo4wSfJ+timcdGYFAxR6JuTA1ykFzKspTTSLJBv+NHwmCeYrVySDDYP4rKc3dDUefkaQtLobzFSxRXUztebHqa24gkcxZSp19tW3ky8PDodJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=iKouh6yZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MCj9yGMB; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id A485E1D00051;
	Thu, 26 Mar 2026 01:01:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 26 Mar 2026 01:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774501262; x=1774587662; bh=hStv+x4N1p
	dKVa/iqOUqGeplsbU7lqjqoXPtBwTcYoU=; b=iKouh6yZ5uLCjdvlN7paFL70qS
	6fOJ9BcifqAWof+eysq77mh/ZOKmJZzdlLWjAG745DJcvXPiEjPN7G0CUQbUALWk
	wWTYPQVtVua3gi3nEI8ZlHopOXqrCYHoD1AL1nory84ZhtQwcITsD/+NDDonS0oo
	VDGl8s97FfBZJGvb66Gb8DF/lFIoLakRPSZD5AzPjht2O9gN+fHP6wYF7F2w9m1y
	1i/lpveLWJm3MXoH60aPURSHYdkNlAXxyHEAvnWRoTINDmoCarKIiuf+Av4Ltef0
	foJjH5EHKN3ijsu2o/RgHQXle8IoN2QfzHvnNbE/3H8FWjRH7m1+DPR0Ea5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774501262; x=1774587662; bh=hStv+x4N1pdKVa/iqOUqGeplsbU7lqjqoXP
	tBwTcYoU=; b=MCj9yGMBwMlRG2Sf8JvMiBQi7zG2QvHE5QgS7RElzQFQFuWVMNj
	Ghq0v72aQdOuRnqb7znuW4b+YENIJAR77prJp6NZ5fKL/WhJypkiS9NQFee7TveR
	5oHAEoEJikxH+u4G84I7vSSwjOZ0eyVwZITdM/Mee5RriFS8nbARvaIHOwDh+DJ1
	skJo1X629EnOlpp+rG8XVX7Z9i00Smz7iggBxwJBeulNls9KErRj+SxxdG1LusoQ
	Rgx+SA2Zdr95OgWqAWAdB6hA8uURqp6SfEr7BFIwYRa4uQBobGZBtIH09Om1oCYz
	oH70qCg1IGWu1PIUNptSzVSvY6nM+aoy+VQ==
X-ME-Sender: <xms:jr3EaV0cTshgYBTMYUO9aRCv3zTudd89FQk97tMUmHHuVNSkpE3FdA>
    <xme:jr3EaRQwuGozofjGvKKS73GMW1MdzhStze8qdC0EcMOZFhzH50OZDSuYQZb0f9v_o
    5RP0oIJClPkapIAbYO0gd7F0GUoXuMUoA9kMQoAtXfpb2uFnwI-P2k>
X-ME-Received: <xmr:jr3EaWxuxnbefPgUAv9VptJGK978PBrq-boxcdwtHyFoEHD0BlcjAd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdeigeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epgfegkeeiffethefgteffudfhfeejhedvjefhjeekudelffdulefhfeekieeludejnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghr
    tghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhrshhtvg
    hnrdgslhhumheslhhinhhugidruggvvhdprhgtphhtthhopegsrhgruhhnvghrsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprghmihhrjeefihhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepiihh
    rghnghiiihhpvghnghdtsehfohigmhgrihhlrdgtohhmpdhrtghpthhtohepkhgvvghsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegvtghrhihpthhfshesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:jr3EaZBcBdCA_PDgYHaLYe2jTuGaOP8B7nsICqCXPnyz-cog9ySyOw>
    <xmx:jr3EaaGp5cpI4VbaKdjYK-wvr-W-qmBIKEoIY7hCPhFJrkB92U6Upw>
    <xmx:jr3EaYO0uT_ODzi26ftARXTjI1SIYTBOkTqk-CnG_lMmNKXrIvvezg>
    <xmx:jr3EaT5DkAqJ6cIe-XpGk9CfJcDYsc-Eu1VXxFcIM3bXB5-jZhqx8g>
    <xmx:jr3Eabs237ARX2jW9gh68yZqIYDQcEBGxaEpQofVS45hy26YP-Dq66R1>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 01:01:01 -0400 (EDT)
Date: Thu, 26 Mar 2026 00:00:55 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Kees Cook <kees@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ecryptfs: Log function name only once in
 decode_and_decrypt_filename
Message-ID: <177450083114.1953525.16480662200050715487.b4-ty@b4>
References: <20260310102654.209016-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310102654.209016-2-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,foxmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-1164-lists,ecryptfs=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tyhicks.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: CA8C132F336
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 10 Mar 2026 11:26:53 +0100, Thorsten Blum wrote:
> ecryptfs_printk() already prints the function name using %s and
> __func__. Drop the redundant function name from the debug log message.

Thank you! This has been applied to the next branch of the tyhicks/ecryptfs.git tree.

You can find a direct link below but please be aware that the commit hash is
unstable and, therefore, the URL may not be valid in the future.

[1/1] ecryptfs: Log function name only once in decode_and_decrypt_filename
      https://git.kernel.org/tyhicks/ecryptfs/c/1601fe9e0423d813b1158a52e051bd3059f74197

Tyler

