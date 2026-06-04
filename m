Return-Path: <ecryptfs+bounces-1224-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TGMzKxLZIWpnPgEAu9opvQ
	(envelope-from <ecryptfs+bounces-1224-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 04 Jun 2026 21:59:14 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D073643112
	for <lists+ecryptfs@lfdr.de>; Thu, 04 Jun 2026 21:59:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tyhicks.com header.s=fm3 header.b=F4iPPXuu;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=lRs9l493;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1224-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1224-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B633B3018D58
	for <lists+ecryptfs@lfdr.de>; Thu,  4 Jun 2026 19:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423313C09FF;
	Thu,  4 Jun 2026 19:54:00 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB33439EF12;
	Thu,  4 Jun 2026 19:53:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780602840; cv=none; b=r52U+deBh8HVi4g3u+kgsIeDXnqsNUjN0kAaZL4kLjVKB491yhHbFPpKCXirpd9t75VS7O0hrDt0mA735D7cGDhACaL8xGFjJZ7uupgFARCBIUsd0KD9Ge2kPMRUGnFJRe89Tg8jlG3OuWuU+ol8/XNJCVO66qTyW0XF+Giu9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780602840; c=relaxed/simple;
	bh=lQhpyV06vE0Qo3eudz9Cus7j5915NvYVfNQj4KZJKmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOy4halbKf4JW7bQtmflie67AqixW7OQOgf+aqEKl58c6GPizsHNaLCs01Mn/QZwluJv+RQ9vz52yzCG9JVrvXY2+5rbS7ldAHJ2ypVimHzuqyPLRZAq4J26aMUwceSlgJsDRdPqsx9GSs4nkrcUSI1oCLAQrhtxsCxUvBteYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=F4iPPXuu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lRs9l493; arc=none smtp.client-ip=202.12.124.148
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 6EEFC1D000DD;
	Thu,  4 Jun 2026 15:53:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 04 Jun 2026 15:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1780602837; x=1780689237; bh=2HS4rQhju6
	ZjWT4qUjv5rOj1YaVbO04xuGlD/vlIcj8=; b=F4iPPXuur/eAv7GY0jLtAnhGLP
	LWW9pY4PlewDG9F+eocRbm4oh2Ej1DW2/Qi7xy/LCbZK4n7LSzcdIXjpN4dYUNe6
	X61Gl6wR1Gx19gZ1EBQ/WJqCsPcASi6VD2Ng6DCj1sSthtReQ/QBeUqQg86754iT
	vKoENegA8BMFskAXkGozwBUwqA7IPAVmDv1dJWBsHXyw6+R599f3vRm7xDaR0zR6
	WbIpd7HvoLVtf9AHBwYZZ19iTSQJaz9Jlng9iEAn8+8Apyym2RYWFwjRU67K7AIu
	BGYC2+9cXPnEtwqui/NZDQfjfMAfOANK1BdozpgL1DObBzI1UB23efV7h2ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780602837; x=1780689237; bh=2HS4rQhju6ZjWT4qUjv5rOj1YaVbO04xuGl
	D/vlIcj8=; b=lRs9l493NADxgKt2+2cMlUj0MaUC8SQkxA1CtR/GeQxcjSPPMFw
	jJKyHwqqJ8mug9vANQcHrbbdNgHOKDN/kuuuTj5J8HA7jDhjzfDF2rVG74+gCKw2
	jjJq3AMbi0w9AVLA0qn8sCcFOyGD6dDZBnTSQgPhYD6AXbWWDOwct8L9KP50jQff
	5C21dzue2NYfdG0gbOHaKxNZc/LdUeu2dyVshlisZ+G+y/8f43NeYeZRSBawJ3Vj
	0W+FbcsPzNTVNaTmCY8Ao2d4fruBA+Z9/mqxM0Ykh12XdCxWX5/jJyruzj4MQgCn
	hlID/nDrEk635NLs6Np5OsmuIcMgL9JDbpA==
X-ME-Sender: <xms:1dchap-3k157NxWj9ulZELXxxLtNEHa1pGR8WeZALbd5_GboaUVwCw>
    <xme:1dchaleMPA1GVAYaDFRgU8CDkZF_pXjCAME0jCeyeDKipFQrtiCyHxaD8dFxBDVkB
    mi4ZVVrAbEk8023-vfPqx9tQiokxjYKEg76Y0ikgRxxYPV_b7Zy9g>
X-ME-Received: <xmr:1dchaqFmc0VEi_nRTgeUi5f-RpVUOBT-mLnMxiXSdI5unRrhLqXxu-s>
X-ME-Proxy-Cause: dmFkZTEFL37vI9Elxit/csRb8NNgSHlcbxS3qPlOUDitpu37Q6ZQXwz8d47qb6Oo5AMimj
    Pgp5YC6Gj8sypR1u+KaPkYcJrYc0tdABnQMEbPT6/D5P2ruOj0l1KF9Crj5IJvShHJhuGI
    bEv5jG16Pm0FKwATRscSbUUmKQr4meEje0+Yc070wBs4aoI164/PAvC+ldYtgZc+9l6fAp
    cWAi6gEoYcmdFi7idJ4/qvVR1hxeHOME7AybbM66SJpBPjE4wCWO0aRDwl5Rr4unLX7QB9
    7+UANXWDsTW3Y8IMSw19ZmCY/Ubh/FnQ9s8L58m4KqtrQJuPNxEK8sVrmXddFd4zGGKNWq
    RD6ay+dg6XtgF4xTud2oVSOsvh7eeYZQOvSqD2Yt7dfZgxwqOZFF06HKoGcZOpRjDJX+eJ
    oewKlMFK48a49f+dHj9OMBnotNOOhjDEDtacCAajlXt1ds0VDQ7UiPmvicXutQC8WsihGW
    Ky1UP50ko+XpW1mq3DqMSTSbw8MUAUAbFjTartuZKom2y9520UY884+TiSbhkXZ+svDMfe
    pJEitr2nVmvZwz3Rtr8LPoNyTWQJw+mztHoeuZA59aijKivGFZX0HLk3reQkonb0itg5U8
    qzAHeQzW5VONsBEOJTGzrHKBPKGQOK5WVgHRicrFakD/dpRKFd8i33IlPPJw
X-ME-Proxy: <xmx:1dcharfZVIXj_QEkrkiY7dDcZnueJFb7rJzSsOhq0yHdxU77p0cjIA>
    <xmx:1dchasEmQtUK9lSjnOVWLbjPmDX305WCU7NsxyZvpdQejczyxN3YdA>
    <xmx:1dchasWmFrf1WH2WrhNCPmcTy2yZszL29ZycNQQEypb6qL5Sy3nT0g>
    <xmx:1dcharINAFB21q2IyxJ4YRwPgkxyg1CQc0Du-ZF19uz-idGki0ljvA>
    <xmx:1dchaiB-5ZOivq_nj15wrItbo2TkQeu0BsHOvIB-XHkbg9KfuWEZ7NKG>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jun 2026 15:53:56 -0400 (EDT)
Date: Thu, 4 Jun 2026 14:53:45 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: use kasprintf in
 ecryptfs_crypto_api_algify_cipher_name
Message-ID: <178060267808.3470631.777472855733570495.b4-ty@b4>
References: <20260518073842.57501-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518073842.57501-4-thorsten.blum@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1224-lists,ecryptfs=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D073643112

On Mon, 18 May 2026 09:38:45 +0200, Thorsten Blum wrote:
> Use kasprintf() to simplify ecryptfs_crypto_api_algify_cipher_name().
> 
> Use const char * for the read-only cipher name and chaining modifier
> while at it.

Thank you! This has been applied to the next branch of the tyhicks/ecryptfs.git tree.

You can find a direct link below but please be aware that the commit hash is
unstable and, therefore, the URL may not be valid in the future.

[1/1] ecryptfs: use kasprintf in ecryptfs_crypto_api_algify_cipher_name
      https://git.kernel.org/tyhicks/ecryptfs/c/95ce5ffd54cf66098f91892f98606c3bd33846fe

Tyler

