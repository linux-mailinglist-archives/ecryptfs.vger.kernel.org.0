Return-Path: <ecryptfs+bounces-1183-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDaPENruzmktsAYAu9opvQ
	(envelope-from <ecryptfs+bounces-1183-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Fri, 03 Apr 2026 00:34:02 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E238ED18
	for <lists+ecryptfs@lfdr.de>; Fri, 03 Apr 2026 00:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D67D3301DCCE
	for <lists+ecryptfs@lfdr.de>; Thu,  2 Apr 2026 22:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6674B1DC198;
	Thu,  2 Apr 2026 22:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="b2WtBiOf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="u5TeBOIM"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2323594A;
	Thu,  2 Apr 2026 22:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169143; cv=none; b=W60oOeQmk3ZZ7r95AUfL47xx8LnI++0qW8jMWesclCfX7MLR1UbKrHosi3jbj8r9PAlBTQAgKZbX30w549aOey6IZ4lkC0uRUAxJY21nkLVZsb6tWCx9g8dU2W/M4kCBp4a8FmVse/2J8hfehLNY1HTVNVMYjo51FlQzQkIhtkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169143; c=relaxed/simple;
	bh=nbnLW3snGpL5Vs8vYGojj8g8Qvq25S7ke+/89RV9a/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTRdmulc8S2/KrPVOfgtW2MAVbUWheiSN2vHTCtpbE2RUjeDnYXN0tG1xK7l2/wee8FKRpiBDJUWF3r62kzGWTpXOYLpLkl9TPnIMEaW2NsODCGJFcT8+KjRAcUgcbkBweuDB9ql2Bz1X9OWD9jM7GlcJfgnSO1CwPLV/L88mr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=b2WtBiOf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=u5TeBOIM; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 16D2BEC01F2;
	Thu,  2 Apr 2026 18:32:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 02 Apr 2026 18:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775169141; x=1775255541; bh=J9UYts3CLn
	xn6JKrtp0DZdSGuXzSuCfxGpxBFFj9RhU=; b=b2WtBiOf3X3ETwhCEFhvRv/nyT
	sFpFO3rXyy8PwhNaxg6NO51anv8VvtkSHGhnAFPlD69ESnJ5HeRzj+FK6uU4tpVl
	12p/POcn/hxBdcgQYXivFTtzn8sUAuuKt+y3qeiFFygy6EvWO0Zu5vqFbUWC8tqK
	lIrUZlL/F/K6xuAqbJljZ3CnIB2hJ2NRL6GfORoNew5vuyOn43juad16vspis6c0
	2LHfU4ZwWe2JJMhl1ehu3GhZQUD/MrGfvMssE8LXTdnPIzCX88ZoSw8Zwe5biTXg
	arZsp19nZ1IFlVajj+I4Y1g79mnPVrFLUXwsjVvkN8WhGnRfCG903TusYQ9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775169141; x=1775255541; bh=J9UYts3CLnxn6JKrtp0DZdSGuXzSuCfxGpx
	BFFj9RhU=; b=u5TeBOIMQPx4EJu+AIr/39D0DUV+P+F1ijWMzl4JHG0RIin+/zf
	lqeVVC/0uz5ccHqAv+/ogOS1tQaDMKnmoiNE0UT7RbEVfYPCUCFD6DMQkGEUMNOl
	rVFQXAW7DAj5rs26jybXVQWyLtCLggb3UyN5pOHNaAxNUfnHdISjJ40WMyyQQJYs
	l19W9feS0D10dSwCh4SoTzbpkyN6Zb9ZHRDHrFXxlzpu+s1WKHqwdwj1kOY8XaEq
	hyWWUVg2lvyPH3r+VECsig/2i75ns/IEZuZVzObi1cfY6ixS7UY3iwEt2L/nmCcX
	eJOxqxA7+Rrd4RBdy2ztVOACqy8Ki+wY+Gw==
X-ME-Sender: <xms:dO7OaWSS7AAYSeBLmYfpZws2LZiSr1cLnqxhbLf6MkVh64yFpbxKdA>
    <xme:dO7OaRykcnWX9kKbF3S8zInFX_0B3QhqsiJ6tWdmDK2RNAHT3JoM5NxLpFhGPmd3H
    47bL9k084VqHT584YffaWpogCKewr14Y_7bRKEajI-quDO_tHINbcBi>
X-ME-Received: <xmr:dO7Oaepw0SbAaldc5m1Lzj0-I4SKqibzfIPlxFzgNsvpguKo6763qoM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcujfhi
    tghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnhepgf
    egkeeiffethefgteffudfhfeejhedvjefhjeekudelffdulefhfeekieeludejnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghrtghp
    thhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhorhhsthgvnh
    drsghluhhmsehlihhnuhigrdguvghvpdhrtghpthhtohepsghrrghunhgvrheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepvggsihhgghgvrhhssehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepiihhrghnghii
    ihhpvghnghdtsehfohigmhgrihhlrdgtohhmpdhrtghpthhtohepjhhlrgihthhonheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegrmhhirhejfehilhesghhmrghilhdrtghomhdprhgtphhtthhopegvtghrhi
    hpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dO7OaU1gyXjxHOS0hCL5r1xkv1OiUy4ji-nEvyoT2QxCz01utA_rwg>
    <xmx:dO7OaezwuXClfh76VvCjBtPxC1gSx78-R-SrY95qQ0m4_CIxKFmhSg>
    <xmx:dO7OaYgiqDG77S4vW1l4SLQq1_7R2V-ghpz2QjS95wP2darVM1wI2w>
    <xmx:dO7OaZonS_Cl27jtjjq8uypgGg_37HdXV3fl6hBqBv7Y1mLjIludfA>
    <xmx:de7OacRIMaGmZV7j4i1N56wdcWv4Hlx-Hhue2K2KWzBX3X8KosAGkHll>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Apr 2026 18:32:20 -0400 (EDT)
Date: Thu, 2 Apr 2026 17:32:05 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Jeff Layton <jlayton@kernel.org>, Kees Cook <kees@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ecryptfs: Fix typo in ecryptfs_derive_iv function
 comment
Message-ID: <177516904164.1945072.18035208218429192718.b4-ty@b4>
References: <20260330103515.389346-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330103515.389346-4-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,foxmail.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-1183-lists,ecryptfs=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,tyhicks.com:dkim]
X-Rspamd-Queue-Id: 900E238ED18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 12:35:15 +0200, Thorsten Blum wrote:
> s/vale/value/

Thank you! Both patches have been applied to the next branch of the tyhicks/ecryptfs.git tree.

You can find a direct link below but please be aware that the commit hash is
unstable and, therefore, the URL may not be valid in the future.

[1/2] ecryptfs: Fix typo in ecryptfs_derive_iv function comment
      https://git.kernel.org/tyhicks/ecryptfs/c/c8717a7fa5d2ea9048f398c16ab61d8e4c8f83b8
[2/2] ecryptfs: Drop TODO comment in ecryptfs_derive_iv
      https://git.kernel.org/tyhicks/ecryptfs/c/cd3b3094df0ee0f147957e7a7a1103990fdd6641

Tyler

