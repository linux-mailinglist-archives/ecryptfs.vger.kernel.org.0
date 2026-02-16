Return-Path: <ecryptfs+bounces-785-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COKyCFsFk2nF0wEAu9opvQ
	(envelope-from <ecryptfs+bounces-785-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 16 Feb 2026 12:54:03 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92999143284
	for <lists+ecryptfs@lfdr.de>; Mon, 16 Feb 2026 12:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 567E03006F09
	for <lists+ecryptfs@lfdr.de>; Mon, 16 Feb 2026 11:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26B3305E32;
	Mon, 16 Feb 2026 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/GuozCP"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DC72FD1BF
	for <ecryptfs@vger.kernel.org>; Mon, 16 Feb 2026 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242840; cv=none; b=b95tRIvTRC7aHmZurwoWTeyO4Z6sOxal+N6rThKVhiiQd9f3MWRGmhF2ut9j7x0koUohWq7Ss4jJVXq0wHWot/wIr6nq59i4ymMoZEIA026S/wiKzuE+xOojgt1mKPwEliWvS+cqgsXWRHxow/4su2hGZYChc6ibh9UOmWF5DR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242840; c=relaxed/simple;
	bh=KAh4XyjTnWAcolgvdTlSSIr2XBjG7K/fvepak+cw1pc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=PeDgXASyB4qEyfGG4ApgJlmFqw9cA27MVthWuonUJgsdUIl03492ApgSml5NSzBifnxpBHrhoemXB80jpCnQuQy9E/x/MAEOg4/KGNUV1MyXMrKZQhViMQCjPXUOV5HAmuudaHCAkY24mKMxOikk3RYuQkFRtMzkSTth1uZQ12w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/GuozCP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so376785766b.2
        for <ecryptfs@vger.kernel.org>; Mon, 16 Feb 2026 03:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771242838; x=1771847638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Is3zhxQHenNpJMaluJOmpzUNW36eR4Zww2/Tfs8Kxqc=;
        b=a/GuozCPH+wjLBNmNnYB+eY7qDjDgQE+800sJSUrtA51OMhFeR/H5vzMtI+3T7oUPi
         1EVanD8p4XYCIHNdgFXciw9AFQ93SkbV51eLh1uEeuCexZfyVEJIT/aPmGLpricsGOT0
         t88fhrDhXhYZPPvX+xFKMHP5Lv6ZLfpkBGDL3W+WNzBbyS8mJDWeL2nlsYikIxOU73Hu
         2NH8NHDn3jovs+c0wYbb1jCGmpRJPyVgxrNg9QR0U5kCzLu8fVv6ZJh4Bi3yuQrDV+f1
         2MPHcB1ud8oI/fi+mkwiuVEVqZyoGMHoHHPXhzTw3+JVlQGCD0YC1IOBuR1COFt18Sta
         L4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771242838; x=1771847638;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Is3zhxQHenNpJMaluJOmpzUNW36eR4Zww2/Tfs8Kxqc=;
        b=GqFGdoBFR5Ycke412vvA9FGbca6H4MOlUJk+9JcQ3ID9Vz/BzFqWLXFX300Nbn4u81
         5lz+YDNJlE9boMdJTNOu0UTwT3f/5rjhf0STBtFfAJI8Z6v2zanut8QdgLARmGr5RGG/
         BYtWC8ZNF2uEMe8sZMfImId/KXy/FmHv/y/EHXsYpUXpImO++QxT/LauaixRQBPrZ8IR
         MUE0BkWMU4kHIst0VJQzfQ7anfKpqorGHRde/pt4eyXEXnN938Ctobs4gltRwOLjyCAD
         EFHI6dJiC4VqJyqc9i6wtU2Hd9jMNOAVUa4/GY0vcHbZgsXESqslblmNgZd9ARkTLCFt
         xbNA==
X-Forwarded-Encrypted: i=1; AJvYcCXBrwRY/myu6YLV2PhAMAzhI5Ckh0vIp2OTX1YTqspJzT/c0IhHbRJeigGp0FmfgO8UNH2Mdw0F8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA5ETX9mthoBkwzEwyAdm+GhpVQ70WjqRGl1ucxAfVb4ZycZ/7
	ZAspMHNqeaU2Zb6SVIJyJAjZGwruDfStvE/i7fh7oX06LSOBnKwZpQbM
X-Gm-Gg: AZuq6aIK8xooUDlSo+GKjS4cTbiLvX8iF7tyv5s2ZoF0xmdx0Ume7q5dc0jYKozHqGH
	4fKYWhufb1Ws2fbA0UpYFvI1C8IVVWUVxAvAr4uInDN/MR6EzpAoIHZ7I/YHl/ura+26lCWOEiE
	HXz2NGjo5MH4A0efbmv1XDYqwjuu1fkrcCP4dAxFBrFh2z5XBfKxMKAHVBP3CBQtNpGEjYHo+14
	k6rWSeNcYAfHxNvL936JpSBpg5oOESWU1MSO1ueaZsebnhMsUgleT4ud4C2EfqbMSjiH2BwM3Hw
	RFkbsGmKyzuzIh8L47tfUdEXAdJNe691FlJSWHFqyiG1uFDMoLUl9gW19wcJpVGaKE4Icq+Fp0o
	L4gTqbiduekzjG+7eC1n7MmP4celXByI7DT+ZAIUaoz8/rBz12Vq1aa/KPQ6OEXzQBFTCz9Bf9I
	Lzo8pVtovr7uCT2HGeT/1Yum8SIW4Rm9L5u01AeSE+z+MnrSNH7UWYQ30v5DxZe5YIlwi4vhE=
X-Received: by 2002:a17:907:3f12:b0:b73:9280:2e7 with SMTP id a640c23a62f3a-b8fb449ad96mr546215266b.34.1771242837544;
        Mon, 16 Feb 2026 03:53:57 -0800 (PST)
Received: from [192.168.0.13] (217-62-96-139.cable.dynamic.v4.ziggo.nl. [217.62.96.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7691c48sm251383066b.59.2026.02.16.03.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:53:57 -0800 (PST)
Message-ID: <d12201a7-70e5-4402-853b-44538feb24af@gmail.com>
Date: Mon, 16 Feb 2026 12:53:56 +0100
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: code@tyhicks.com, root@linuxmint.com
Cc: arnd@arndb.de, arnd@kernel.org, damien.lemoal@opensource.wdc.com,
 ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org, tytso@mit.edu,
 willy@infradead.org
References: <ZyKf6ZSZrETI+4/S@redbud>
Subject: Re: ecryptfs is unmaintained and untested
Content-Language: en-US
From: =?UTF-8?Q?Ren=C3=A9_Herman?= <rene.herman@gmail.com>
In-Reply-To: <ZyKf6ZSZrETI+4/S@redbud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.60 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-785-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[reneherman@gmail.com,ecryptfs@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92999143284
X-Rspamd-Action: no action


> It would be good to discuss how we can get the message out to users to
> migrate off of eCryptfs so that functionality can be reduced and
> eventually it can be removed.
> 
> What do folks think about the following?
> 
> 1. Print loud warnings at mount time that eCryptfs is deprecated and
>    give a specific date when write support will be removed.
> 2. Remove write support at that date, while retaining read-only support
>    to allow any lagging users to move their data to fscrypt or other
>    alternatives.
> 3. Print loud warnings at mount that eCryptfs will be removed and give a
>    specific date.
> 4. Remove it.
> 
> Suggestions on lead times for #2 and #4 would be appreciated.

FWIW. Ever since Ubuntu dropped eCryptfs home-directory encryption 
already in I believe 18.04 from now 8 years ago, Linux Mint has probably 
been the single biggest consumer of eCryptfs: while based on Ubuntu, 
they've added back eCryptfs home-directory encryption in the installer 
ever since Ubuntu dropped it.

In the Mint project lead's latest blog he/they moreover proudly 
announced that their upcoming new & shiny GUI user-management tool will 
now support enabling home-directory also for at runtime added accounts 
(which up to now is done with adduser --encrypt-home from the command 
line only) rather than just the first, installer- created user account, 
and I am pretty much certain that the idea there still is *eCryptfs* 
home-directory-encryption. Mint is not the kind of project that 
routinely goes low-level.

https://blog.linuxmint.com/?p=4991

In any case then this is to say that they seem to not be planning on 
moving off of eCryptfs -- and Linux Mint is (probably?) the most popular 
Linux Distribution for/among new Linux users.

Have been commenting on this a bit as well on their forum, advocating 
for fully doing away with eCryptfs, but quite unsure that'll have any 
meaningful impact. Added the Mint project lead to the CC on this. If 
there's any progress to report on slashing eCryptfs he/they may want to 
be aware.

Regards,
Rene

