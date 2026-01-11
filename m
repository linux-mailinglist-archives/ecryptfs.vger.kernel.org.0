Return-Path: <ecryptfs+bounces-768-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F5D0EDAF
	for <lists+ecryptfs@lfdr.de>; Sun, 11 Jan 2026 13:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 261713002882
	for <lists+ecryptfs@lfdr.de>; Sun, 11 Jan 2026 12:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7D9331A5C;
	Sun, 11 Jan 2026 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rf0AYcWJ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE4337692
	for <ecryptfs@vger.kernel.org>; Sun, 11 Jan 2026 12:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134534; cv=none; b=tjce3IRJSwCN8kIfI2LQJ3g2zPIeHU3LaLcO44egYOJ6wG1Pv9fP8HK9dUrvo74QYruO0ZZTtBVZ4ve5GDNkTc4KEgxP/QAqAnmWQIpT/iYEvx4Fb7F+V8vLnBXYQ5Gfd+utEWZ8Y5JRgmrkhcG75w/R+5AEJ3qeE6qSRMKnveI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134534; c=relaxed/simple;
	bh=D6NG7HziDMBwQ9hnyhBXX0xFAzsLidFiOiFDJJPoRCs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eukiYYe2PyGmGcD4vueFiK4Bho1hqIuWSSScJnHN+fal/ZliH6aED2/VrBKsGQzTKAY7BGaMGy2GJSYvghh1ylT1RAS75gST/ZzKKXthrqEbSoh1GXtaVaRkDdriiEIUSdeu/QDkfEgJU7jzhxEXs+GnaDSBqSNNOf2VtQLzURY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rf0AYcWJ; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768134530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T73nhPSL+7IX4USb9ZOqSnkArnfPW921Nem7jWIaTls=;
	b=rf0AYcWJi3vWUM7ZnH0ADw4+CmMxC+BOibyvVoQA42+Wb92X0mUh3GaBMNCoAE8rdcfnkm
	/AosYdVxJH0H4eRnn33YrNamQVRXOD2H+ieDkay7AObBQ7ekiN5QPOuceQexOy1Ol7JKAg
	VURGmXDwPzivCqBQMwSP32CdhM6mkNA=
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] ecryptfs: Add missing gotos in ecryptfs_read_metadata
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <20260111010825.GG3634291@ZenIV>
Date: Sun, 11 Jan 2026 13:28:17 +0100
Cc: Tyler Hicks <code@tyhicks.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Zipeng Zhang <zhangzipeng0@foxmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>,
 Michael Halcrow <mhalcrow@us.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 stable@vger.kernel.org,
 ecryptfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <5DD6E30E-4974-42D9-86CF-A6A78CF0492E@linux.dev>
References: <20260111003655.491722-1-thorsten.blum@linux.dev>
 <20260111010825.GG3634291@ZenIV>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Migadu-Flow: FLOW_OUT

On 11. Jan 2026, at 02:08, Al Viro wrote:
> On Sun, Jan 11, 2026 at 01:36:52AM +0100, Thorsten Blum wrote:
>> Add two missing goto statements to exit ecryptfs_read_metadata() when an
>> error occurs.
>> 
>> The first goto is required; otherwise ECRYPTFS_METADATA_IN_XATTR may be
>> set when xattr metadata is enabled even though parsing the metadata
>> failed. The second goto is not strictly necessary, but it makes the
>> error path explicit instead of relying on falling through to 'out'.
> 
> Ugh...  IMO the whole thing from the point we'd successfully allocated
> the page to the point where we start to clear it ought to be in a separate
> helper.  Something like this, perhaps?

I wanted to keep the fix simple, but I'm happy to refactor the function
if that's preferred. Any preferences, Tyler?

Thanks,
Thorsten


