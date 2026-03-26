Return-Path: <ecryptfs+bounces-1166-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLdKHtG9xGk23AQAu9opvQ
	(envelope-from <ecryptfs+bounces-1166-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 06:02:09 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B4832F353
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 06:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 671D03034DE9
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 05:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29241A682A;
	Thu, 26 Mar 2026 05:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="MBcZtEd5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nVjhW2Rz"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED219C540;
	Thu, 26 Mar 2026 05:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501326; cv=none; b=QgG5Zf69dqXwGFr9gE/cOI576K9H7a/FB1/KO+yB+QVmSlcbzngifSgzZGu+TJtCmQKOITaXBFvtEuEPW8nTawBDmDP2i9Gqg7kwaU1j8+FCSZBi2ZVjbPaAUu7YagMUfXwrwsNMiQXDwQlro0w6kfYJP7FHFM3wa9SG/JWWzys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501326; c=relaxed/simple;
	bh=PN8QrzTGtc8scNdSbSJJhfNWDONnT2+qIe224u9xvxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUMwaGkLjTE4uuVZXpKfN5qb66hAnlljI+8COyIXgCC3yKK8eBlMRXG3CQSw1dBySmf1+C24LmTFzryo2Dr73nnnFXkjCtxjXYLTpqA4T+ZT8fP/ASjDPD/Jm9CXhV57y5bnPHeLr2+x6VeJan/VtGy5r5YW99WZgSzcqIIacOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=MBcZtEd5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nVjhW2Rz; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BE19E7A01A7;
	Thu, 26 Mar 2026 01:02:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 01:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774501324; x=1774587724; bh=JSB0dS/mGF
	tQpy9evbvhvVUMqMxMikXbsk2B5fD9fvo=; b=MBcZtEd50q2dPRUcsU7gnjG4kU
	zWyq4aPgBJZ7Vxbn6+2z2shz3RXDY/XV3QxmBVBGALU7mAoqtlcvfHkds7J3yBgU
	zZwJRpLf8LDWC6tasBQRxCTFsFZ0vp+Ws0OMSDKoD6RVNJKQjbEFU+4Sg+wQQOcQ
	jS3++qUylYpJpbmHUOriW1dIB8j63zpUDk4jGNCxkMCxMWu+aQOdLS45MVltfW5V
	jh5lx1iwseRdlK6BD97pcZBI/D18iGx/vFA3eJzQpqxwbBiwyBgwX4VkyUOcI9H3
	YxSc5lp2vfiCEwpyWXkhnM/ihtc93zdtpMPYSQQ7I+59/IcFtNJ1UGDrHEUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774501324; x=1774587724; bh=JSB0dS/mGFtQpy9evbvhvVUMqMxMikXbsk2
	B5fD9fvo=; b=nVjhW2RzYUekdIEpg0mZsrTVCCrG2jwHrPQeGFGyrmoWs4FWwLL
	d+rZQ5uvjpyiyiOcKZM7eLT4bwOpI6gFK1bfuKXOrPxIQ8CwXDg0BsTKC1L1nTre
	xGURqr61HDkbFMALt22KuRDr1QihqVwvxy+lLAIUu1En/VhiFBu+Syak/LMeBxdD
	RSXFNHrUZW3s7CLYI/6Oxr15z5vHrvoqgEsyF/3MxzVQMmLjYCC793/gGGrL8eAx
	ahFXc3L6c79Xi+/bscqrFTUK40uD5eblqKJeMqKbpQaD8usZPh4LdPaZYw4lp6zT
	bWm7OjfhKmxrk4d5sy6Vx0KfvSeUgFvCH4Q==
X-ME-Sender: <xms:zL3EaVCxrzyPuMtd2k1wJ2D7zqq2S6D0xg_dXv6iPjte-UZHqq5-Lg>
    <xme:zL3EabTipm7JY3Sv6F01vnguriEUW8vkgQwDHTHuf8p4zFyeKHx-x9jIXTXWqjtVM
    ZXGseNS9C177kZiFNkQtAhjQrX0eqszS566i7zd7RFtQJdh2fl-Ac0>
X-ME-Received: <xmr:zL3EaTq6DY2Tc8OYFpPsI2AXpP7rVYVeH36uYrYF5d-QlCuqq5nl0TU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdeigeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epgfegkeeiffethefgteffudfhfeejhedvjefhjeekudelffdulefhfeekieeludejnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghr
    tghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhrshhtvg
    hnrdgslhhumheslhhinhhugidruggvvhdprhgtphhtthhopegvtghrhihpthhfshesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zL3EadznMWgtfgly1kmVVrTjJQJ3BExBsX2YNgwN__OwlZyFbKfGDw>
    <xmx:zL3EaYJqMigSWe7UxW_H9aAobH3apuIHRh7bB3yWHBF6V_SLQCKCHA>
    <xmx:zL3EafLlLriiQwre4gLzbSJDWRvmr-MSOGV_9DIWHMW1qOa-tsID0w>
    <xmx:zL3EadthkdNQBO-1zwvxSOXGOGsatXl6ybbkM4BmIOdrEGtluPKLRg>
    <xmx:zL3Eaf1GU0-jdeE5YllGkYm-avOfIMsraa8nKplc3ReMf4gPHWCtVRei>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 01:02:04 -0400 (EDT)
Date: Thu, 26 Mar 2026 00:01:57 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ecryptfs: Use struct_size to improve
 process_response + send_miscdev
Message-ID: <177450083116.1953525.9264734396937294527.b4-ty@b4>
References: <20260205132456.1011140-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205132456.1011140-1-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1166-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tyhicks.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: E0B4832F353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 05 Feb 2026 14:24:51 +0100, Thorsten Blum wrote:
> Use struct_size(), which provides additional compile-time checks for
> structures with flexible array members (e.g., __must_be_array()), to
> determine the allocation size for a new 'struct ecryptfs_message'.
> 
> In send_miscdev(), reuse 'msg_size' instead of recalculating it.
> 
> 
> [...]

Thank you! This has been applied to the next branch of the tyhicks/ecryptfs.git tree.

You can find a direct link below but please be aware that the commit hash is
unstable and, therefore, the URL may not be valid in the future.

[1/1] ecryptfs: Use struct_size to improve process_response + send_miscdev
      https://git.kernel.org/tyhicks/ecryptfs/c/8b9bf58bc3a6f148d990bb697a3b6dbb11672f86

Tyler

