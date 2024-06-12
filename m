Return-Path: <ecryptfs+bounces-87-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D99905ECD
	for <lists+ecryptfs@lfdr.de>; Thu, 13 Jun 2024 00:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 923771C21105
	for <lists+ecryptfs@lfdr.de>; Wed, 12 Jun 2024 22:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE1E12CD9B;
	Wed, 12 Jun 2024 22:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="jK/qHLGv"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C87A12C530
	for <ecryptfs@vger.kernel.org>; Wed, 12 Jun 2024 22:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718232783; cv=none; b=r5vYGbZsPh8siS81gAKlMcb4A8ehhWgDO0m3EiO4AkU5iDAhkyAAqSX4VGNm3hrRUiPAzJY1HMQBWVIvovRii880Q2dT5OxcV+24mBiQgfbjnQOs6KbvE8Bk5yPB6uCVH7q+RDo55drOKuH62i3XuJVgLDmGGi7H5/oQ3SpTD5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718232783; c=relaxed/simple;
	bh=L3qaXQNUUVxh4Q0Q3RMUhGqp7sJ7EFx4+fzYvA3H52A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnhABadrxbBGOFToVx7B8LkVH78mkG5MUei6ePJj+BDmVyp1ds4KlQFsDj0AsFMdegpc5X3YPQqpAzTqNI+n+SH0fYpM70/Ams3QApC73bQSnz5L56hJGGE8S8AslywrOSorzShcwC+QZBimQin3/5dSclXZpi85WJ8laDbi9+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=jK/qHLGv; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c036a14583so41501a91.1
        for <ecryptfs@vger.kernel.org>; Wed, 12 Jun 2024 15:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718232780; x=1718837580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HCKGfocKzBU0+xeBiPtl1Ex5TwQcMh3k2EBSdA3xSn0=;
        b=jK/qHLGvI0kV5kxk0TrIxYpm7MMWZSt3v741kn091VcRmXCARzl9rtz9vI0V4zfu7H
         GR7OsA8rw93QhkXvQIEMPEP+ta1DBYG5sB4JUmu07Tv/2GANeCt1pLwqhfXTP0ahkAD5
         ZTQg4WCW4uehb5S/Ej6DidDnexG6/OhTOov6AbzeQ+7JnKgZpxmW153617GINF5uGI3M
         bvEbqQdnnimNSgV49Rv813WRNApxGQj6/2ZP1jfsA74AzF066dcloIIa4indI8oXIvGP
         goAx3kwz5WfjuKZAE4S35MwK1J/RTxvBGAzcxGcOoDyJZ9mlG1dAmdToy+7D2b5ryiAm
         rhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718232780; x=1718837580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCKGfocKzBU0+xeBiPtl1Ex5TwQcMh3k2EBSdA3xSn0=;
        b=iYQQAvnOqdGcTTvfKE45UTRZY+QDeEU52lg1WPwSDhJ1fhNEVY3l25cYjXIeJxjaIx
         nk5WjZfW/E12WasvrWVQUoCZ0fd4AXHS3WQMrbrHFWWLCUWuVCPNUSSXI2mEQ58FMUBf
         ZMRIW3m0Rjkwhyd8zteTvuvn9mzeGbpGvnWrvomi/PA46bPWswfx00L+BRDjBFDiSKwB
         /rIZjLnbYPniNomuNG4EY8lvHT08nIGQ3IJTh+c+9fdmj9suv9vtA+gRUBIHtuTODugo
         Xchb97oNRXJEXJ09uzujT5hPCIn/wFCFRtuNma+XxKVPI85f2j43jee8xCvVQM0bwqd9
         RgRg==
X-Forwarded-Encrypted: i=1; AJvYcCWj4dPKMpVWErmaWGvSrOjn/9WGB+ttIvr9cgpaXupEBUlZn0p5s0i47asoEB99JtyXp5ovFu45jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM3SGzOAIbfjsvN7SRTsmNDAgP8hBebvfhKLVASfhxAqKsczc7
	fmaOSosFQGvvrq7BJ6bcYWQnZHO1oO/ta496mkYEISU3+/PWPMlxRTqqF0BOQOU=
X-Google-Smtp-Source: AGHT+IH5UZSMoyLCwmMYbQsnXovMsmtOxcZgzfit4qNG1yAnUakar4EveGlx5xiJfFg6llU0rCt4rg==
X-Received: by 2002:a05:6a20:5647:b0:1af:acda:979d with SMTP id adf61e73a8af0-1b8a9b4e85fmr2859600637.1.1718232780575;
        Wed, 12 Jun 2024 15:53:00 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb3d2c5sm73821b3a.105.2024.06.12.15.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 15:53:00 -0700 (PDT)
Message-ID: <7e58e73d-4173-49fe-8f05-38a3699bc2c1@kernel.dk>
Date: Wed, 12 Jun 2024 16:52:57 -0600
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
To: paulmck@kernel.org, Jakub Kicinski <kuba@kernel.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, linux-block@vger.kernel.org,
 kernel-janitors@vger.kernel.org, bridge@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org,
 ecryptfs@vger.kernel.org, Neil Brown <neilb@suse.de>,
 Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
 linux-can@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 Vlastimil Babka <vbabka@suse.cz>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/24 4:37 PM, Paul E. McKenney wrote:
> [PATCH 09/14] block: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> 	I don't see a kmem_cache_destroy(), but then again, I also don't
> 	see the kmem_cache_create().  Unless someone can see what I am
> 	not seeing, let's wait.

It's in that same file:

blk_ioc_init()

the cache itself never goes away, as the ioc code is not unloadable. So
I think the change there should be fine.

-- 
Jens Axboe


