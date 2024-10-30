Return-Path: <ecryptfs+bounces-214-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0279B6E68
	for <lists+ecryptfs@lfdr.de>; Wed, 30 Oct 2024 22:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EA551C2145C
	for <lists+ecryptfs@lfdr.de>; Wed, 30 Oct 2024 21:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F75A14F90;
	Wed, 30 Oct 2024 21:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="Taoe1lOM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NtgccIuK"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF12144CA
	for <ecryptfs@vger.kernel.org>; Wed, 30 Oct 2024 21:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322522; cv=none; b=AWJ7gxqHzEgYfnqWDG9UUDZ4/MjnlUJlNe5trMYki/hUges3V52CwdzQCDP9hnzkMnvemXKOwuAycmifsXiBMeQKwmMfYuvUNZK2iQi3lpk8j+kjkLFHNQRbLXjVk6cFRAFv4dBsHJzejvD4PREAWxrnSqMbAEiuhZVd3QhCF1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322522; c=relaxed/simple;
	bh=MvFuDPqRHtlw+JArg+f6a3+WgB0wklulP+yGUcMl6uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4IuaCRsk77iyMPBgxlrcVLFghFchDt4m6BZW4pIErHDU1x7vCO9m1dJxsFxxnVEmBp4T6WuBvqAMJ8MluWDXlQRqUPzQ5f20XM3OLdgkBRmlEqismWTeKUKRPmiwTtJNcF7vpMUUTcY+O/t7vBwAn7Sg4R6dnIAgAINE0Na20g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=Taoe1lOM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NtgccIuK; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id A233D13801DC;
	Wed, 30 Oct 2024 17:08:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 30 Oct 2024 17:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730322519; x=1730408919; bh=N2UdIzZ/o4
	3LgKD64Q/ihe0vrthcCDCQxcLsZSjJD9I=; b=Taoe1lOM2zULSa6K26RdG1KTIz
	iCmCfMC7owozppADdoSLrvca4qTvPjf8o9c1X/tK7Scon4EmNWMLI8GB87CxriX3
	hxGTDS/vEUOrMffZQZCG7d6R+oipzheHoMHGlWpM40+Hb/xnbc9LlokvjPmXkMTn
	pQSGBU+6iSNk0bYbMF0x2S38KT1kgt5pyt1ruLIpAJTO8Qh0HIgvCvKR4sxcf8K/
	1Pj+E8RXa8oKmiwbtAE1CRRGWGJPYuhl/QkmQhl/YRkdL57XcJ9LVTP+kjc/y0wk
	xWOn69nhABNJBm8denjvb4INQWGPKPp3+MuXIBD9D7gF57gsis78+4a8Z5og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730322519; x=1730408919; bh=N2UdIzZ/o43LgKD64Q/ihe0vrthcCDCQxcL
	sZSjJD9I=; b=NtgccIuKQPALmqbyuNMpbUV2ZQFUlUv2VUMHMaYvKzhPIRWIjAK
	gSv9eABjQy1g1kRZd5UCMGVJ6U/ZvJyHc6OryUCFEoqHHzRxZGvlEfzINXetWTXr
	vn/UYvMqgN7zFgcj7GhGyapRb41UrIAwon1Ut3S9pChT8PgtzlSP4rnoRSf0HykO
	elXV0ZiSrb+5kn8HhqbZ9rLfdWZ8+rHNrxlbQ31wLzLS0ttF1Y0tAslcHv4Tn5lh
	Eoi8sEtIdjDifVLM1Kt0wjt289Mcdjvz7ewgxYBMX2o8P4slEHrigPzPO32wm3oX
	aKGgV30/sFZJPyE5XFJqoXID5TYGbFXpnwA==
X-ME-Sender: <xms:V6AiZ3FhQrFx3qz0a_yiVKqpjg6np_Q5nY9EO_WGbqillfiC9o9XJQ>
    <xme:V6AiZ0Uf8TbDcv3vcXTZtQFhzh1UO7wu2tXZrpaIMrhMddLZqYiNyU3hJHCIWqhLk
    zwK-j51l8tEqupQ2iA>
X-ME-Received: <xmr:V6AiZ5KmvqfrLAEAJFsGocr-3kWqEpm2DFGrXORnZ3F_ROCpnyU896Kl71dWAOaaaNJzXOnPtK6KFe75RkFC9jI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefvhihlvghrucfjihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedvhedvtddthfefhfdtgfelheefgefgudejueevkedu
    veekvdegjedttdefgfelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghrtghpthhtohep
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrnhguvggvnhesrhgvughhrg
    htrdgtohhmpdhrtghpthhtohepvggtrhihphhtfhhssehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepsghrrghunhgvrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:V6AiZ1GETyWLywZlMkN2pxhJ289Y5aVi5940tV-hyehBRBDs65bYsg>
    <xmx:V6AiZ9Xgq8hdInrbufllWjmoNA-zfvjBWUTTN1o88DWrIl9-lGiq1A>
    <xmx:V6AiZwO1cFgcTLg96FP2KzV601E6zrap8XxMy1wFHbo05hmqIdLKqA>
    <xmx:V6AiZ81V_9Vx_WI7CmJhJfLgOEW1PHExf9_jsDB79XeKiDfw-PB7-A>
    <xmx:V6AiZwSYC1NkE_pBVqesmL7VqVPC2rReYz1jv0BOqIV_Lh5FDa5sbOFu>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Oct 2024 17:08:38 -0400 (EDT)
Date: Wed, 30 Oct 2024 16:08:37 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: ecryptfs@vger.kernel.org, brauner@kernel.org
Subject: Re: [PATCH 2/2] ecryptfs: Convert ecryptfs to use the new mount API
Message-ID: <ZyKgVY8ekrJEKLZl@redbud>
References: <20241007153448.6357-1-sandeen@redhat.com>
 <20241007153448.6357-3-sandeen@redhat.com>
 <ZxXwCAydTXeLuVFm@redbud>
 <c24a2f67-a87e-4dd5-bee7-1771c76b51d7@redhat.com>
 <c9874487-f31f-42e8-a715-e010d166e5ac@redhat.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9874487-f31f-42e8-a715-e010d166e5ac@redhat.com>

On 2024-10-28 09:22:35, Eric Sandeen wrote:
> On 10/21/24 9:07 AM, Eric Sandeen wrote:
> 
> >>> +
> >>> +	opt = fs_parse(fc, ecryptfs_fs_param_spec, param, &result);
> >>> +	if (opt < 0)
> >>> +		return opt;
> >>> +
> >>> +	switch (opt) {
> >>> +	case Opt_sig:
> >>> +	case Opt_ecryptfs_sig:
> >>> +		rc = ecryptfs_add_global_auth_tok(mount_crypt_stat,
> >>> +						  param->string, 0);
> >>> +		if (rc) {
> >>> +			printk(KERN_ERR "Error attempting to register "
> >>> +			       "global sig; rc = [%d]\n", rc);
> >>
> >> Are we expected to be using errorf() and friends here rather than
> >> printk()?
> > 
> > That's kind of a debate. If you'd rather get rid of the kernel message and
> > send it out through the mount api message channel instead, I can make that
> > change. But if userspace doesn't capture the message from errorf, that change
> > would lose the message altogether.
> > 
> > I kind of feel like once userspace is really making use of the message channel,
> > we could go back and selectively change printks to the message channel where it
> > makes sense.
> 
> Ok, without any further input I'll send V2 w/ the whitespace and double semicolon
> fixes, and leave the printks etc in place for the reasons stated above.

Apologies. I agree that this was the correct approach for v2.

> If anyone wants to redirect pritnks to the API message channel, that can always
> be done as a followup patch. ecryptfs would certainly not be an outlier if it
> leaves the printks in place for now.

Thanks for that info. I'll review v2 shortly.

Tyler

> 
> -Eric
> 

