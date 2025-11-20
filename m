Return-Path: <ecryptfs+bounces-723-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B1BC764DC
	for <lists+ecryptfs@lfdr.de>; Thu, 20 Nov 2025 22:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 1A9FA28CBA
	for <lists+ecryptfs@lfdr.de>; Thu, 20 Nov 2025 21:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61B82D9EFA;
	Thu, 20 Nov 2025 21:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sXKix0bG"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60C121D58B
	for <ecryptfs@vger.kernel.org>; Thu, 20 Nov 2025 21:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763672531; cv=none; b=A/y3WGfjOIyJpJH3CdYdQRQjLI5gTG4ykznwwsWn5KL4aOOFkKgn/2T27mgigxyqm3E/C4S9v0iotRXM2BZngS2fZ3OO4LI9nVoW0nvRdhJl4zRjE9Yu88cyKsqUysmoZ+kpq6ldgQ23wL4K6Cb0heQy9wspLLsmfa+R3QGubq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763672531; c=relaxed/simple;
	bh=/0+yps8XPK9y7qXVhFTt8YRHYbrP0bw+XV/jpR32Xy0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=l7gHr7sJiPXxaDMyIgz3vkRgW7BbTuZtHglEpfZwm+dXOiJzrd3PUxDy/d77EupBddS4rEYPNvPBlir0YPW2gHIEktxlpA3CgoRdrq2eJ368YnRzaKMubnMgvbmCL8jSJF0LuE0ZOGqqBPx+0I90Dqa0qXM2fbFzxOcrQkntfFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sXKix0bG; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763672525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fVqlf4PSMAtsIkR0CmK3Eg1WYRI0DRj+w+t48dW3t0=;
	b=sXKix0bGHf+o6v00WI3s/0oDpVBatFuWH1i7jUIkP5h8ctVGhRUYUAxg/BueehSTPUJJwe
	YBUO7E++B8ZA9zNhIP1VuSvG8uNGWqJfHbx5LZSQ0QpyRua+1G8PEx0eTRpWgevkao638M
	D6E37YpGq+lzGoUyXMR4PtgfSX90Lks=
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [RESEND PATCH] ecryptfs: Fix packet format comment in
 parse_tag_67_packet()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <ZxX2wy1leH/fWznR@redbud>
Date: Thu, 20 Nov 2025 22:02:02 +0100
Cc: Brian Kubisiak <brian@kubisiak.com>,
 Christian Brauner <brauner@kernel.org>,
 ecryptfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3B155F44-5937-4841-BC45-DE873F020DAC@linux.dev>
References: <20241018214144.163036-2-thorsten.blum@linux.dev>
 <ZxX2wy1leH/fWznR@redbud>
To: Tyler Hicks <code@tyhicks.com>
X-Migadu-Flow: FLOW_OUT

On 21. Oct 2024, at 08:37, Tyler Hicks wrote:
> On 2024-10-18 23:41:42, Thorsten Blum wrote:
>> s/TAG 65/TAG 67/
>> 
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> 
> Acked-by: Tyler Hicks <code@tyhicks.com>
> 
> Thank you, Thorsten!

I just noticed that this has been in linux-next for more than a year,
but never made it to master. Does anybody know why?

Thanks,
Thorsten


