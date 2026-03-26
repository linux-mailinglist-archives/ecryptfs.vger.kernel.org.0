Return-Path: <ecryptfs+bounces-1165-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNFBOrC9xGk23AQAu9opvQ
	(envelope-from <ecryptfs+bounces-1165-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 06:01:36 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B832F345
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 06:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C037301B170
	for <lists+ecryptfs@lfdr.de>; Thu, 26 Mar 2026 05:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB511E633C;
	Thu, 26 Mar 2026 05:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="Sk5XaeEx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lxXLx+Yk"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DDF19C540;
	Thu, 26 Mar 2026 05:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501294; cv=none; b=UzNuL/s8W1zP6U7fCIQ2msK8ih28m1idBaYpuxaYeU2r2kYzqzBv9+6Sy7xCp4dRhH1hVTLX9tPBjprDhPhHM34cLZchOPAW+x9s6xC6lc2/mukJeDApYgSxss/v/JNaVtJlWREDHSdB1s7kXwzCw9LSHdnosq1tyYc2L4C5E2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501294; c=relaxed/simple;
	bh=geSwXrdQXNuKO5UWbey8+GgTLnjJJnLQPNIoSosRm7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+QXZeDJUVML72gXr/PEzAOF9VnOVojtLfnMrjJT+EH6OEVRNrDPZKciMFyLqkjkw3Rx8x/Dpzir/riabuuDvJ8WkpT7+qaQxohgpGvCSojygxq+SiIlbaIjriOr84BaLR2uQ4sR4WI7yBAQQpv1vBLWQhI0865+Qw7SOhFbjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=Sk5XaeEx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lxXLx+Yk; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 46D5D1D001A6;
	Thu, 26 Mar 2026 01:01:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 26 Mar 2026 01:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774501292; x=1774587692; bh=n9FYWhiau2
	vON1o8Jtbi0bVJHg4pfh6nY9TkKsOjDKk=; b=Sk5XaeExWvLuf/e/GtxtLl8fIC
	KZUd6l4VgRXYMqlJCmiO8gh8R0bdqLFZCGYOxbXFNq5f+k9dTmX0qy4WMnmWPMJ3
	NivxAmpcUNzHQNATJD6Kt7zDu6FFYZ04XWfDaNDQqaYSSwxoIdX5uHewQ3zVqsDV
	tNWjuruwWKgtRFJG41WhJkJSu/Y8bEAcBL1h01Hn2uG3Xda52DZH9A3K4FD7nnU7
	5hYotuBSs/s+chI3oJurmmanZcxD/tgyKE6fpJkoeOt4jQG3qiHzN646smDl0HyN
	qyRNyRm7JGJu0oND4He9t2eV8N4Lb8vz/F+Bjp/q0WxXiJSij7gmltYKdpjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774501292; x=1774587692; bh=n9FYWhiau2vON1o8Jtbi0bVJHg4pfh6nY9T
	kKsOjDKk=; b=lxXLx+Yk3FjnB94Ow2YUuUuhEXk5+BohvcdMkirCU9N9yGWvPKK
	vhO13rc8qpMF2v9CGb0Ff9OOaNlNzgP19G3IQeYIC5c3n6D2Ccs3uyE0xNxC/m/M
	Z3Ne9+nbbzrzs6ConvqmRqGvuO1bhvqqEq4Yp8J0Ax/riqK27zQO5D4CndDnELbS
	nEgxiUiMD4slDh6249+Al8/jOtIC5TYKYs0QijAoL8+Xlo1/X3zDWinxvRF1JZP0
	7zHp+W1b0/XMAkZiaTSditGLKIOQihglnNPU96jt67RfmALiyUk58lTglU9fpo7W
	Y0J+cQcTvXgx51ESwO0UA8lsXMKyZjXT4Dw==
X-ME-Sender: <xms:q73EaXEiUshNT0Ub36USyxjslIJr1hjnjYbXEt7Ob3v5I5lOi5Zugw>
    <xme:q73EadqfA7gw_IlNSFPgdf7JToLq7fT4PURF9R6cKZAADLVn4KM0Upyw_JRe0AJJd
    gmt5qTzYZQTnVgMdDZ1ELLqCwcf6hFNONfn04AdlAJBwfN6ZULLJ-8>
X-ME-Received: <xmr:q73EaQa7lmogJ9AWF6icQCXPrP6dyq2iw1B0xyKUK7URu-Wh44AHUVc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdeigeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epgfegkeeiffethefgteffudfhfeejhedvjefhjeekudelffdulefhfeekieeludejnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghr
    tghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhrshhtvg
    hnrdgslhhumheslhhinhhugidruggvvhdprhgtphhtthhopegvsghighhgvghrsheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvtghrhihp
    thhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rL3EaWUk7forl1dbqDCy_KJVpEM9ABMoz1O1C3ckXbmjGFKHPvGYrA>
    <xmx:rL3EaZ-zzxZHI5j-QHFVbi5LaOqGVKLu-4dZhXSZnUMrouuU8rkAAA>
    <xmx:rL3Eaf9YMsmzHw8MH8AU0g2QWNdbuWPikuz3r7AikOmrEGYkTLS84g>
    <xmx:rL3EaZTavP6smILGgR_gtq95ldRNQQyvHN3d8mF3s4QQN_lTk2vsDQ>
    <xmx:rL3EaQruzpT3QJKmropIMje5mNK1mMG_NmspNSUkPYWyYwUNXwbQ-d3->
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 01:01:31 -0400 (EDT)
Date: Thu, 26 Mar 2026 00:01:26 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ecryptfs: Replace memcpy + manual NUL termination
 with strscpy
Message-ID: <177450083115.1953525.17155877442789981964.b4-ty@b4>
References: <20260205125104.1010945-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205125104.1010945-1-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1165-lists,ecryptfs=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tyhicks.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 672B832F345
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 05 Feb 2026 13:51:00 +0100, Thorsten Blum wrote:
> Use strscpy() to copy the NUL-terminated '->token.password.signature'
> and 'sig' to the destination buffers instead of using memcpy() followed
> by manual NUL terminations.

Thank you! This has been applied to the next branch of the tyhicks/ecryptfs.git tree.

You can find a direct link below but please be aware that the commit hash is
unstable and, therefore, the URL may not be valid in the future.

[1/1] ecryptfs: Replace memcpy + manual NUL termination with strscpy
      https://git.kernel.org/tyhicks/ecryptfs/c/f7a1c0283f135833db164cc0fac8d422fed2079e

Tyler

