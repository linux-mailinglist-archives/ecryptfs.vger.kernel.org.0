Return-Path: <ecryptfs+bounces-1163-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBetNFW9xGk23AQAu9opvQ
	(envelope-from <ecryptfs+bounces-1163-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 06:00:05 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A132F327
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 06:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E5733019FC8
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 05:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E309B344DB8;
	Thu, 26 Mar 2026 05:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="iwI6ERJI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G8JpPBDn"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE7C342526;
	Thu, 26 Mar 2026 04:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501202; cv=none; b=u5BIrBscXjhXtFNL1MAlz/Pa054kUZbJkgdE97UGhGzjIeFOhY8p+3ZrfMdy1rHZgq0uF2nZ1n0ZdYCmVqI+zBj8IWmCpRQ/mDHQfDVOKaPZWaW9Hbr788NDdBNwJmaGSlYOgP1jKgm9yFpV8Qhl/93xek/tJZQK7Tli34fdBho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501202; c=relaxed/simple;
	bh=Qna1CsQkSc1LWS7MD0t5pnvwjDudzH8ZoGtJWIbLL9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDDzknRZHzotBZKojgsdfRMKRIfVbimEQZuTLd0mIq9wMFQign8ikZurxGjGqvCYJg7E1I6DPibxnWElBMMxu3Sj2rQQqMTnTetQHRze/DWX7bs6vKf0mNiCOqwhG1kvDZMOMWL2h8+b2+0kXrZlIkyIedEweD8ZSLH2/8Tkx5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=iwI6ERJI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G8JpPBDn; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B16607A017D;
	Thu, 26 Mar 2026 00:59:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 26 Mar 2026 00:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774501197; x=1774587597; bh=BNohwchAEz
	J6UoevjmF9xqy3heM63HRT2PeAJp1S4Mg=; b=iwI6ERJIPVtLfbwGjk2+okKVD3
	XbSVxuUWy4AwoXTNK9BioVpL9W2OCJXiq2rQVP54o+AlpCNdMUfDj6NevzrEuUE0
	OGD215kYNjIaLJbJq2oIF38V6CDz5w4ogomvNGBeiawZo4Prk1TnmEiSYw5du7AN
	8PAYqcZ6Sh3TnrEjTxDIJku9xJF7YP3zNgEdmGeQAFhYnTQ0sRkrhv5tHNeHvDvV
	Ub9mPCiPChaI0odpLWmfIVY3kKz1X/vT3ex0GKux5b69ZcDahQF9rsQZMXjBMxUf
	jqtTVBeZSWnWZFeeRY4M56W4JVL2wPgQJWAtygFsxhGAbU5uJpwr/+vzVNug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774501197; x=1774587597; bh=BNohwchAEzJ6UoevjmF9xqy3heM63HRT2Pe
	AJp1S4Mg=; b=G8JpPBDnprsbdpTkYb3EXpentvtYFyPWq9eKiRo98/o2/R9Faq6
	Nq2qB+RCR4VfQllJHW6lwgDJquKmNo1dUqghpBqawPVObNJCGbk5w3y3FwEgkoBx
	WehjmSUbzVYDSOWkpJSpaZrAlwztk9Gp0K/AXPKdUKR/4E5ug6CXx3ltMzKUBBR2
	CPEGSG4A8VftWH3AWoUgjmLXpkQyVrmBa2u4NJza3zYAmyPNIFZlbrJlmNqf3SMj
	xqyxEY5AFm525RfTIvetKSrOg01eDmc1bS83RpoerVYyPe0l5sO8RJ7cR5QoJ9tp
	kBo024KFZhHJs5A0fmNf+kLcWeFq0VFGOKA==
X-ME-Sender: <xms:Tb3Eab21wm_SO9BXa2W3zmQmT4i4j7qWWFH7FLkuFn_7rfpVcuiNxw>
    <xme:Tb3EafDk9wKphkv8BrkUWLx-g3vRUhdtl67OfAGnJi36wVOfVdGgQJPvA1jmQr0kI
    Ufoflin1RKBpGnOT6iX4ow37GsDEwlm4pmuqao4sggouXVXl4OxR-sm>
X-ME-Received: <xmr:Tb3EaQJK_KkBc-ghEGOSClD4p4DebFTqvMvdXB5qBk_5FSi-XxYXOEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdeigeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epgfegkeeiffethefgteffudfhfeejhedvjefhjeekudelffdulefhfeekieeludejnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghr
    tghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhrshhtvg
    hnrdgslhhumheslhhinhhugidruggvvhdprhgtphhtthhopegvsghighhgvghrsheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepsghrrghunhgvrheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepiihhrghnghiiihhpvghnghdtsehfohigmhgrihhlrdgtohhmpdhrtghp
    thhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrmhhirhejfehilh
    esghhmrghilhdrtghomhdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepvggtrhihphhtfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Tb3EaQkFYxLAZE8xHY9NhLP6l85nUGnKvGHTNjJinMQ4w5_xmIoyiw>
    <xmx:Tb3EaRY3AgZBkbzsQFIad8vodYMCWKKrHNaLmMM2UZzEaBcjyMP5FQ>
    <xmx:Tb3EaU8fg-DDMabrYWDBs50qc73raMweJk3_CoPQ7sug9R0IfeuUNA>
    <xmx:Tb3EaYaHbzjq2A-BrvrgfHhYY7LTlLwJt243gogTanah_glXdLnz_w>
    <xmx:Tb3EaUjyutW8_eUrKq6vxwWsDpvTREDUeak559IpZtNzzgM2yez4FYJL>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 00:59:56 -0400 (EDT)
Date: Wed, 25 Mar 2026 23:59:41 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Kees Cook <kees@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ecryptfs: Remove redundant if checks in
 encrypt_and_encode_filename
Message-ID: <177450083113.1953525.6876607221282674898.b4-ty@b4>
References: <20260309224824.85471-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309224824.85471-3-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,foxmail.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-1163-lists,ecryptfs=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tyhicks.com:dkim]
X-Rspamd-Queue-Id: 227A132F327
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 09 Mar 2026 23:48:24 +0100, Thorsten Blum wrote:
> The outer if already checks if 'mount_crypt_stat' is true. Drop checking
> 'mount_crypt_stat' again.  Use ecryptfs_printk() while we're at it.

Thank you! This has been applied to the next branch of the tyhicks/ecryptfs.git tree.

You can find a direct link below but please be aware that the commit hash is
unstable and, therefore, the URL may not be valid in the future.

[1/1] ecryptfs: Remove redundant if checks in encrypt_and_encode_filename
      https://git.kernel.org/tyhicks/ecryptfs/c/fb1b02dc02da0ff63a5965056db0c9f77842bd19

Tyler

