Return-Path: <ecryptfs+bounces-165-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B6A9A0ED2
	for <lists+ecryptfs@lfdr.de>; Wed, 16 Oct 2024 17:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79C4C1F22A7A
	for <lists+ecryptfs@lfdr.de>; Wed, 16 Oct 2024 15:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC9F206066;
	Wed, 16 Oct 2024 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TLiIwfXY"
X-Original-To: ecryptfs@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162B63FBA5
	for <ecryptfs@vger.kernel.org>; Wed, 16 Oct 2024 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093571; cv=none; b=Dd5QCtiSVkMkvxF+sSYVp8fg0j5WDFUyFLX6MLbsSRY3ROJHOfWPct2qjcKQ8x8Gzvm21JUxBxF2Xzvz7qsL2S2J9yNKAJv18X2qd/uJ/l/Ch8pD207lSD5KudGhmdxOJHkYT3GU3IEQDnW6n2ytogRIjdR/sJUwd1/nPDzp19w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093571; c=relaxed/simple;
	bh=XyqEDOo98M3gVMois/KJaRipc1xqyzX8zJ93OKFsZN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4ymGW1FPrgWHcwsVHX/nEP+Vs44fvj48ME1wONtzphw7gAszXmwfXOpomXG/toiOzmBtm3i4sURL6bxOC15Aynck2tuWI3cw5vmJUeZX0Au7GFn0OxFpn2yUzdviRqxUN53sYiuv3kuGkddHlK40jGRxU2zEPeWEBYBHzvuROw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TLiIwfXY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729093568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vg4XzeAsY3lfRfO2lhwoYiV8xLnO43kCtIl8u9fF6wI=;
	b=TLiIwfXYx15tbMfEcFUH+HfdoUmRwD9CYSOaK8ls9vB5HmuImWgq6Jl1W4Z3rE8shpxsZA
	MZHu0E+VKMoD+XEwxNd9l6uTHDZTz4L3igq9dY6SdrlsHXJ7i6ywSXAds5GmR6oG/smTYE
	an7N5FxkdXS/jtNcnOb7fPqE38Au9/M=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-2k6RflpiPTCF5vl4EvSryw-1; Wed, 16 Oct 2024 11:46:07 -0400
X-MC-Unique: 2k6RflpiPTCF5vl4EvSryw-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a3c72d4ac4so48385ab.3
        for <ecryptfs@vger.kernel.org>; Wed, 16 Oct 2024 08:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729093566; x=1729698366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vg4XzeAsY3lfRfO2lhwoYiV8xLnO43kCtIl8u9fF6wI=;
        b=TIF2Fj/13uYd+brqotaL1YesDa4vH4Qy7sKIzbLm2cGf5bW4VBs3v2nQACxY7FK75u
         JrwGVTJYrZq9RzwczuKoTLSllulffnp4fAmF0W+uJIe8sYV+vXJwpF4rL8tCXV8+w0z1
         pRTa5Ew5goYX4fOS+xv4KsMcZhcB7ZOZsu44nLDHLOFbMC1VIHsWDyOkvNG6afkoBEM+
         7PXRXSY9qINRjRt3UkgE1Nz5lzoTdgOfAf/YzQXZEE8uOVD7UQ1PYpC4gvC+l8aa2+2W
         p8/osq6hfiZKUFbvC2si/HcZ0eTuGZVOMP1Z7zM6oGAut/DNagLVTMFTS8ycbkzxTWPF
         E9yw==
X-Gm-Message-State: AOJu0YzLXrN4rei443F/xkNUh/NGkHMnboWQH4Lt51fEK8B/A4gYryPm
	SuBVi41sV7kGE5PwKGywRNNoSZvUPhh87HKdtfIJ2O1N8AfEhyPY+3XMTlDPpUNlMmz412bnA/p
	dwx2/5hp6h01lQ7itDFxqfsID+zq+mtbghMQ557YtcVTNdnu0CodPaUYeOZbuHnPHEb5D0n8k/5
	e3TLjP0yZKBbd6wjaDR5zc+r7ZbuoOFc/bfcNWXiTJ6g==
X-Received: by 2002:a05:6e02:1566:b0:3a3:b07b:6b1 with SMTP id e9e14a558f8ab-3a3b5ff217dmr159039745ab.26.1729093566013;
        Wed, 16 Oct 2024 08:46:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFZzShR1y4d86dIGbjrYPlBVIy859oZO0Lm7XLunMcCPEMd21JgLJd7h0KVF+U93FQdrHW2Q==
X-Received: by 2002:a05:6e02:1566:b0:3a3:b07b:6b1 with SMTP id e9e14a558f8ab-3a3b5ff217dmr159039495ab.26.1729093565602;
        Wed, 16 Oct 2024 08:46:05 -0700 (PDT)
Received: from [10.0.0.71] (67-4-202-127.mpls.qwest.net. [67.4.202.127])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a3d70aeea2sm8680875ab.32.2024.10.16.08.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 08:46:04 -0700 (PDT)
Message-ID: <6e4704d7-7196-4dcf-92f0-2d0e346fc69f@redhat.com>
Date: Wed, 16 Oct 2024 10:46:03 -0500
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ecryptfs: convert to the new mount API
To: ecryptfs@vger.kernel.org
Cc: code@tyhicks.com, brauner@kernel.org
References: <20241007153448.6357-1-sandeen@redhat.com>
Content-Language: en-US
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <20241007153448.6357-1-sandeen@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/7/24 10:27 AM, Eric Sandeen wrote:
> This is lightly tested with the kernel tests present in ecryptfs-utils,
> but it could certainly use a bit more testing and review, particularly
> with invalid mount option sets.
> 
> This one is a little unique compared to other filesystems in that I
> allocate both an fs context and the *sbi in .init_fs_context; the *sbi
> is long-lived, and the context is only present during the initial mount.
> 
> Allocating sbi with the filesystem context means we can set options
> into it directly, rather than needing to do it after parsing. And it's
> particularly simple to do it this way given that there is no remount.
> 
> I could squash these two patches into one if you prefer, but
> I thought maybe breaking out the first change made review a little
> easier.
> 
> Thanks,
> -Eric
> 

Ping on this, I guess.

In theory ecryptfs is slated to be deprecated and removed, per
https://lore.kernel.org/ecryptfs/ZCuSLNnFQEdOHW0c@sequoia/ but I'm not
sure that patch ever got sent.

I think this conversion is simple enough, and given that ecrypytfs is still
in the tree, it'll stand in the way of removing the old infrastructure
whenever the last filesystem finally gets converted, but to be fair we have
a little ways to go there.

If it's really going to be removed soon (ala reiserfs) then I suppose these
patches can be ignored.

Thanks,
-Eric


