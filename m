Return-Path: <ecryptfs+bounces-1220-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AYIF87m5mkl1wEAu9opvQ
	(envelope-from <ecryptfs+bounces-1220-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 21 Apr 2026 04:54:06 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2996435A13
	for <lists+ecryptfs@lfdr.de>; Tue, 21 Apr 2026 04:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90F40300F157
	for <lists+ecryptfs@lfdr.de>; Tue, 21 Apr 2026 02:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15A02459C6;
	Tue, 21 Apr 2026 02:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="egcC/YZx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CVvQU1Di"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F4D1E0E14;
	Tue, 21 Apr 2026 02:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776740043; cv=none; b=R2NJWwlpcJxo+LSaKmM95HsC7znWRtq6XDZSwraBTIICPFVEt5MmZ0zSjAG+LyMDFqfxwTzaplz8tsEfi/iOZUg/1/BymvvXGVjZ4MWUzidHwYZVIfq+xO8U9+pIuIbt6xYkR2WHg4U426oVwD78Ki8zZpX7Q3ING5LbWrQPlgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776740043; c=relaxed/simple;
	bh=rnwbfAA/XAEugGY1A5pJ9dXEzFZxvM9igqA4nK+l6Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNuiWFXar1sRneMvYKXx1MI6QW3uGT3AGOqqVYQ4qVFw/Pt9D3vpVz8h4aBDcnu8sQsxPaTlRtXsZDdKLwVmIUW7IJ9AyndXSyUbaaYaxJfGtyTa3ZNVf9+fSwfbWvq9IY4hdzLcOarwHDyWUsP/K92b/d05Z+v4GkEBqfTnLqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=egcC/YZx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CVvQU1Di; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 799A0140009B;
	Mon, 20 Apr 2026 22:54:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Mon, 20 Apr 2026 22:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776740041; x=1776826441; bh=YIa7MCJncf
	EOyftnAwsnn+6QcRATsKcErP1cicmqM9o=; b=egcC/YZx3zQ4KUkTFq3FtIqrwZ
	7Kd9QCz3AHaYpiBUkE+QSEdcH4oBll+ZEmekjwAiRBn2dJzcrGnXCFfi83NrpvOH
	I44dcusg9C86azn1nubaAybU+eNGTxIQZvniFc1L+GGQJep5pCL5zDR9Gz2K+wZV
	xe3rXNRy2qQsSli/kNVEvm80+bJ37RucbsepQrWk2I+THDurGriNpsvqGzY2mu8O
	KyOs4sr38oyj9vCjJDdDpcwYDujEJyZcPMZ6bzYeGIOA2p0ARQisNvvUe4u3xnzz
	9QgQtaMHe0XxVVvVUv37IAilNlAeEAf48knETHIH2mh2oP0ylpykq0qe3/6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776740041; x=1776826441; bh=YIa7MCJncfEOyftnAwsnn+6QcRATsKcErP1
	cicmqM9o=; b=CVvQU1Di9S/qsiGx6PfHqlR59P5ZJrvr+CZ2L7xUoOFQkxXkEX8
	syYkaeX0EW1P/DtYwOKffQngnOyaexM6MyWSnyKeudBUyz1bAd/yz77JavkSRvBk
	uPGmeMTkziTi2qzE8kfR5tp4uWWOt3yfIciOJa6iQKpAEzU3D7V6EAxJQhOzFLru
	hZw3fPJ01UQysppt/Erj8i6KHcbMz847A67IBIGa+nSzPpak38EoAc/y1kjQ1mbY
	3w9FkPx3+YdAF87tPwG7iA23o7ZWJRfPu439YGtc5cmTuSo+UXzeEWEfaXZ+j9W4
	K/f6nAzeBYkEBYhd0rCv2MDC80NDks9Sf9g==
X-ME-Sender: <xms:yebmaQZ8jIiy9d04h0D8Bps4WkMYWJTeWXMea5C70M5pKHDVnHLeIg>
    <xme:yebmaZNA5r0Fn4SC7BQu0UdmeJbEnbLjP44lcReWLl9nYLJGhoXxOFQ2HkTs0g0E8
    vxVKVe-awxWi9Qu7TWN3oBKdQyMW7tzixF3EyhLABm_jOsRtDbm>
X-ME-Received: <xmr:yebmaVbG0mdeKBCLzvHnOgG_z62pmQEEahn1lECmwCds3glPDfKfhQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeitddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    fggeekieffteehgfetffduhfefjeehvdejhfejkeduleffudelhfefkeeiledujeenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheptghouggvsehthihhihgtkhhsrdgtohhmpdhnsggprhgt
    phhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrdhvvghlihgthh
    grhihshhhihiesihhsphhrrghsrdhruhdprhgtphhtthhopegvtghrhihpthhfshesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvhgtqdhprhhojhgvtghtsehl
    ihhnuhigthgvshhtihhnghdrohhrgh
X-ME-Proxy: <xmx:yebmaX0EzkwI9lOE_fiWVJDWpfa5V4UvYnxngo9vlOnCpWeaiuIGJQ>
    <xmx:yebmabdK59xm04XjvEhab2WkWQ35p3dRdwTNJcB-QZuZlSQpyRrLSg>
    <xmx:yebmaYEgfIkwVv7yOTNA9FY6XDivDSHmsLe03c4TlsnPspGuD1ajYA>
    <xmx:yebmac1PDIcOpnLyS08BC9xEpe_iH6-NGAUhxhU0IeRftVR3ZrdFFw>
    <xmx:yebmaRV0TUc3vPcSJBp5yPJsztxPZb_UfipQbXilXviH8IWCOogCYtBV>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Apr 2026 22:54:00 -0400 (EDT)
Date: Mon, 20 Apr 2026 21:53:52 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Alexey Velichayshiy <a.velichayshiy@ispras.ru>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] ecryptfs: remove redundant variable found_auth_tok
Message-ID: <aebmwDc5nTFJpWyX@yaupon>
References: <20260412135010.321286-1-a.velichayshiy@ispras.ru>
 <177673965982.2803793.17321023234031184810.b4-ty@b4>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177673965982.2803793.17321023234031184810.b4-ty@b4>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1220-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim,tyhicks.com:dkim]
X-Rspamd-Queue-Id: A2996435A13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-20 21:50:58, Tyler Hicks wrote:
> On Sun, 12 Apr 2026 16:50:08 +0300, Alexey Velichayshiy wrote:
> > The found_auth_tok variable is no longer needed, as the fact of finding
> > a token is determined directly by jumping to the found_matching_auth_tok
> > label inside the loop.
> > 
> > Remove found_auth_tok, simplifying the function logic.
> > 
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > 
> > [...]
> 
> Thank you! This has been applied to the next branch of the tyhicks/ecryptfs.git tree.
> 
> Note that I made a small change by unsplitting the error message that is passed
> to ecryptfs_printk().
> 
> You can find a direct link below but please be aware that the commit hash is
> unstable and, therefore, the URL may not be valid in the future.
> 
> [1/1] ecryptfs: remove redundant variable found_auth_tok
>       https://git.kernel.org/tyhicks/ecryptfs/c/0be6d8f0e111deb765c0bc01c1fe5d9920fe2fcd

That link is not correct. The correct link is here:

 https://git.kernel.org/tyhicks/ecryptfs/c/eb5e768eaf7c5f6274319e2894ceebf0f3cb5750

Tyler

