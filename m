Return-Path: <ecryptfs+bounces-206-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5778D9B335F
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 15:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B2F1283578
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 14:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487D21DE2B8;
	Mon, 28 Oct 2024 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HNkfE/ir"
X-Original-To: ecryptfs@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BAD1DE2BF
	for <ecryptfs@vger.kernel.org>; Mon, 28 Oct 2024 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730125362; cv=none; b=C6NMpuTWHIvBaNKaRI6NRNk9nNlhvI6IDPXQEi+OLdClReO6S8VPLC/TUbleE8MnZdikBO2PDlzMWi65rOqCfGZ1VrgUGaKz4mV4EBP62eEBHWzqU4zjoDxZtfQzcRe/vtRUZq0IzVfZRIXRdWXjCXNTXBrgNtRRlTcpwGeW+zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730125362; c=relaxed/simple;
	bh=uhrlBqEuGimrMVuKu+rh/47YQS43YfCflgQuM1c0Umc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=q0VtgMOfe2OVYnB8UZ8a3ku9MAx19vNjBdCI8fdC2LSuDlUal6JSvVtH6bVGg+0Vd+Ddd2TPb38TFF5ZUNAuS4HS4QcoaSX+lwKoIm7wPVyl+gcH1XE8ximemgg8lGpBhNTGGjSc5bk0gRdDcn7dqEMR9TNCTwRK2rKhDgBRaRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HNkfE/ir; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730125359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XqjPghphrA3/EKy0CuKEe4doTVJJdCx/0xWjXgcs56U=;
	b=HNkfE/irM4DZdxIy57rEDSVWAKNaD3xFGKA2IVemhgKnew46yAgwiVj+CrK3rZD9MESIvj
	xMFfNzbMCGa5Zt+4q4DuRun+p/xflRYlE98rI4S+ClKpf3T7zd5m61HV/TA6Ltos+K9XWw
	wSE9DE2rx33Y0KGugCYHQHb5LENHH3Q=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-ZyjeHOLzPdO8WwjC8hJM9Q-1; Mon, 28 Oct 2024 10:22:37 -0400
X-MC-Unique: ZyjeHOLzPdO8WwjC8hJM9Q-1
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-83abf68e7ffso413267639f.1
        for <ecryptfs@vger.kernel.org>; Mon, 28 Oct 2024 07:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730125357; x=1730730157;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqjPghphrA3/EKy0CuKEe4doTVJJdCx/0xWjXgcs56U=;
        b=m3uWztMms9tZM/2Bp+kDpcdNZ2FjrQ/Ae79Q0oQMVR4bWL20sw1eYvLf1oTLDCzNGa
         7+gYgnbCo47AI9v6kaauNQVpC1n8AmR6Am9cabrNmXyVKHIKSeGHRHT/xZ9BLvzZmQSn
         c8/Pgfrbl++pKRGWhcRvorRhqav2HeLtmDtHWs15P8U9TGLnpJjA9yjbh3huEF5vrB/i
         EilH0uh+gbn9F1igsAYolkJM0Bfpq7fBGTKYlU8Nm7meDkhyxcXpoc3Lnh27VzeNQm7W
         YVsBUZ0+Q5zr8xMwPrZaDVIs1Pm/KemENu/5SgP1JWb1psuo2Zs+l8/ayb22dn+j0VtO
         dIBg==
X-Gm-Message-State: AOJu0YxW0IxvS59XnZkQHUAQf5nv7ypZopJAxurfKAIQwHDkGmQQzF/6
	UiaEksv6csrnALyFnSmK/1N1OjjA8zhblh/wNu8Exa/SogfsoB+mvAqBzNARxmuWWZ1quf6Ng8a
	k2jj+ek9Bc2oOreZ/kH3nw7OkHbU+8AQMnQI9twJ1Vx5HiOqqM+AUF0al
X-Received: by 2002:a05:6602:2dce:b0:835:4402:e2eb with SMTP id ca18e2360f4ac-83b1c40ab58mr602642939f.7.1730125356823;
        Mon, 28 Oct 2024 07:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1JN+k/FYl9W4QsVNPKQwvEjNievj/76OJ6rV159E8Vi4Y3bTuXTJG96i1D8y3wKNrejSGDw==
X-Received: by 2002:a05:6602:2dce:b0:835:4402:e2eb with SMTP id ca18e2360f4ac-83b1c40ab58mr602639539f.7.1730125356286;
        Mon, 28 Oct 2024 07:22:36 -0700 (PDT)
Received: from [10.0.0.71] ([65.128.110.20])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc72750c91sm1721983173.92.2024.10.28.07.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 07:22:36 -0700 (PDT)
Message-ID: <c9874487-f31f-42e8-a715-e010d166e5ac@redhat.com>
Date: Mon, 28 Oct 2024 09:22:35 -0500
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ecryptfs: Convert ecryptfs to use the new mount API
From: Eric Sandeen <sandeen@redhat.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, brauner@kernel.org
References: <20241007153448.6357-1-sandeen@redhat.com>
 <20241007153448.6357-3-sandeen@redhat.com> <ZxXwCAydTXeLuVFm@redbud>
 <c24a2f67-a87e-4dd5-bee7-1771c76b51d7@redhat.com>
Content-Language: en-US
In-Reply-To: <c24a2f67-a87e-4dd5-bee7-1771c76b51d7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/24 9:07 AM, Eric Sandeen wrote:

>>> +
>>> +	opt = fs_parse(fc, ecryptfs_fs_param_spec, param, &result);
>>> +	if (opt < 0)
>>> +		return opt;
>>> +
>>> +	switch (opt) {
>>> +	case Opt_sig:
>>> +	case Opt_ecryptfs_sig:
>>> +		rc = ecryptfs_add_global_auth_tok(mount_crypt_stat,
>>> +						  param->string, 0);
>>> +		if (rc) {
>>> +			printk(KERN_ERR "Error attempting to register "
>>> +			       "global sig; rc = [%d]\n", rc);
>>
>> Are we expected to be using errorf() and friends here rather than
>> printk()?
> 
> That's kind of a debate. If you'd rather get rid of the kernel message and
> send it out through the mount api message channel instead, I can make that
> change. But if userspace doesn't capture the message from errorf, that change
> would lose the message altogether.
> 
> I kind of feel like once userspace is really making use of the message channel,
> we could go back and selectively change printks to the message channel where it
> makes sense.

Ok, without any further input I'll send V2 w/ the whitespace and double semicolon
fixes, and leave the printks etc in place for the reasons stated above.

If anyone wants to redirect pritnks to the API message channel, that can always
be done as a followup patch. ecryptfs would certainly not be an outlier if it
leaves the printks in place for now.

-Eric


