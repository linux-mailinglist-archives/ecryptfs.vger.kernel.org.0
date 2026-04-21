Return-Path: <ecryptfs+bounces-1219-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN3oDi3m5mkl1wEAu9opvQ
	(envelope-from <ecryptfs+bounces-1219-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 21 Apr 2026 04:51:25 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 790E04359A8
	for <lists+ecryptfs@lfdr.de>; Tue, 21 Apr 2026 04:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46E21300EC9B
	for <lists+ecryptfs@lfdr.de>; Tue, 21 Apr 2026 02:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CF1239567;
	Tue, 21 Apr 2026 02:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="RJZbN6bj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KHstyGR9"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7815E175A9B;
	Tue, 21 Apr 2026 02:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776739882; cv=none; b=nwTgHuk88L04L+VxN88J3t57ApFgU3130PYwgKKmrs9JIJYvqKDh1vpf/bLE0MtUOV3PmC4i6hNfp7mLNGh3TVhHtjqfOm9SOMXVLF2pGbptb98JLiGNe3/UMQtxX13mchRg+kbj220gLfXCQ6zk25NfwM73fMrVF0+e8r90D2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776739882; c=relaxed/simple;
	bh=tDAZowYsbtpA089WrsRsJ6m0fK1hgD5uBiRYjTDVQd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdBodxZXCqcJW+pCxg9MpN/gCQyF1ACfe36ZySr+5fQTB618IQrFRbJmPLT4yHGNSmrk9fmrTio65aFnt1LLClgfbG51+DoV1sRJIE7c9JNpRFvxaVHiIC0ggn+uvhNMYvec++BrAiK7SFQqP0j1VGcCFpLlbyVQJPFZaoEEsi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=RJZbN6bj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KHstyGR9; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 480CBEC054B;
	Mon, 20 Apr 2026 22:51:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 20 Apr 2026 22:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776739879; x=1776826279; bh=Z3/x4wPzaF
	FevkUlx1ObTYxOzZJVELcR0RO69ZK/AQA=; b=RJZbN6bjaxBi8N7uLOzb4KSJer
	uAlPUxISfnTUrHOLhs0QL+dxzT5erkOcphx9dIew1o0My7vnOLH/xzKI664Io0dt
	lJ2sv+7whWrWLQ2UkyCOtgED71MhZYufyt+R02j2flcl6KT2yGFieDCoxEr7tgrw
	frwKzb/EKKXUORrflceJ+WoaTJEzlpg9zw7hAMdta6BC8KTD6BMrnf0BNHB3MMVy
	IinzwQKxb3ubVxsHU+fD+jF+MbORO231Svc08oEqJBBmfBO1hN/muZozmQHxmZhd
	kLjq23P1i3F/AZq8AQQRRNyD6IDI+zCVgAeSwohFCqtvKd/YCpsnhrsssK3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776739879; x=1776826279; bh=Z3/x4wPzaFFevkUlx1ObTYxOzZJVELcR0RO
	69ZK/AQA=; b=KHstyGR9pLFRslQdBSnhXJuQCI6uUx48v7TU45vDcim5EzSIYms
	rMx+iCMm3NkEXhxX8w6RqKUaPYerRCp4fE7ZLZmHbiHJ9GLCu9+LOAnXYJFW2k3x
	Y5sPM+kdKI1z1lLd8VoBMd/VlpClc+3zWHJFRs2BVgO0EaH5z8GCv/HrEvcKaaKk
	JclnnMwbxjWUptN9JCkw2DlkIi1Ei4fIenrAZpjPIsOeHmstvGS1AW0kYERjiZvR
	QJjtOB+maSDKy1jyIPkiHqcbIF/7CictOL//j7kCO8ksDywPi1LafRmgQWU5V+vF
	92RpHVRwf8VebBZpYTqSqYwgD+XhVfP260g==
X-ME-Sender: <xms:JubmaXKo42D7dQS61l8nFQ8GDY_6rGhgt3GQy4mkwhXacfvbLOMZog>
    <xme:JubmaY8yfcjijjK2MmfvXKHz4gje96o5z7zcaMcSnBLn8WoCcbM5yVUYpHwPiQypw
    Fe_AX66QyQIRgaQP1RpgMC98uci86RuyFcom4B03SGmE67qv_DOcg>
X-ME-Received: <xmr:JubmaaI20CNMkAMMgEEoPpm8P0gMaOI0h5AbUbOvalshpZ-4MSnYkLQ>
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
X-ME-Proxy: <xmx:Jubmadkcq3jNAdzEHqtsZQSELuz7CFPYrqUIPiFbccGeVnqrAhSmuw>
    <xmx:JubmaeNRvWpwZqhq4kiBFflFo_8nlD5u_OzNvoItiTWObQK2nB4CdA>
    <xmx:JubmaT22nvzZ4vyWPwjWPmPaYym7fAKTJJ8oqFbKqt2Tq8C17Lx3uw>
    <xmx:Jubmadn4nLDxI3JA_zMQUrNaz_a2s7BwLDKgP_YI4YVcyuYNSrPk_g>
    <xmx:J-bmaRh_lHm8WNyEoCkc7PDa9_sO5LwrcGjnLazesYAlNjP1KWzgGOZ3>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Apr 2026 22:51:17 -0400 (EDT)
Date: Mon, 20 Apr 2026 21:50:58 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Alexey Velichayshiy <a.velichayshiy@ispras.ru>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] ecryptfs: remove redundant variable found_auth_tok
Message-ID: <177673965982.2803793.17321023234031184810.b4-ty@b4>
References: <20260412135010.321286-1-a.velichayshiy@ispras.ru>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412135010.321286-1-a.velichayshiy@ispras.ru>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1219-lists,ecryptfs=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 790E04359A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 12 Apr 2026 16:50:08 +0300, Alexey Velichayshiy wrote:
> The found_auth_tok variable is no longer needed, as the fact of finding
> a token is determined directly by jumping to the found_matching_auth_tok
> label inside the loop.
> 
> Remove found_auth_tok, simplifying the function logic.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> [...]

Thank you! This has been applied to the next branch of the tyhicks/ecryptfs.git tree.

Note that I made a small change by unsplitting the error message that is passed
to ecryptfs_printk().

You can find a direct link below but please be aware that the commit hash is
unstable and, therefore, the URL may not be valid in the future.

[1/1] ecryptfs: remove redundant variable found_auth_tok
      https://git.kernel.org/tyhicks/ecryptfs/c/0be6d8f0e111deb765c0bc01c1fe5d9920fe2fcd

Tyler

