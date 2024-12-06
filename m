Return-Path: <ecryptfs+bounces-229-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFF19E6E28
	for <lists+ecryptfs@lfdr.de>; Fri,  6 Dec 2024 13:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DC441883A08
	for <lists+ecryptfs@lfdr.de>; Fri,  6 Dec 2024 12:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83054201276;
	Fri,  6 Dec 2024 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="a8s1kPM/"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34AF201100
	for <ecryptfs@vger.kernel.org>; Fri,  6 Dec 2024 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733488202; cv=none; b=KSrh6PwBtxjxciJKrfGYqoMjFT2/Tw4UQLCXUtIR2vyj/EK06iSqCqBYwEERBl9fc/CqoKxTKpkZfuXif6cdNu2FV5TrpNHwkCVJuaEkPci8JZR8BDlUPDudOMKZg0fhWyte03rZUQGtycx2sjKnDLhNfrxfp9NKz8aFQGI6tZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733488202; c=relaxed/simple;
	bh=lfL3g2xy/fL6hgfgwYRPYZurpSCSJPP/bWfS0+SZRHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uv35DTQr1IHOLZn7WoFpeJVazqyxf1vrRiaFGt2gcAykGAznS7IpjWOlADMC0K/GDQYQqrlm9leK6Wg+ikyNG43ssJa8uwsBQaKPwAIxLnbrtIEcO3kQAUNrVEEg3kMXdLH4nsN147a2oLgVPoQWiButLQ3MadDTl8vPADbmE7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=a8s1kPM/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa53ebdf3caso363987466b.2
        for <ecryptfs@vger.kernel.org>; Fri, 06 Dec 2024 04:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1733488198; x=1734092998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xl56NGt25IJfOqhyKFAAdybfQU4BEhl5Dkz2aEPYtU8=;
        b=a8s1kPM/5tRbR00on1G2iq3A29Yp7W3bTVvY/iqAuj1TDx2nJHgC9n0kuS1JEItvHP
         OI3r6Ul/NlzXF0hT2wRxNxtirnWG5tGMC4xW/uAnSrPmzpsyuliqnDB1BnRryxv9xVOD
         dSFqFow3ZK1PC4c5B+v4nRntRT3REqaXnt6Wn2EuAPhpkgP69mlVA1chEwTK55/30VsZ
         ldiQsAW+TmVofxM9EfUM5cqLTFc3edjXXx523/vLvwYmsu93G4x0tEM9watPWwgJ8ov2
         Bb3jCAsJJLtXFVqiNj2aRElFV4YC8lLSIZpw0Pp3IPPYAyHUVcj4sfR2Ef28ml0Tylb7
         7hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733488198; x=1734092998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl56NGt25IJfOqhyKFAAdybfQU4BEhl5Dkz2aEPYtU8=;
        b=vYV3aV8Ja2RWDovgC0ZBETXaJUb7eFEDM8MKactW+WUfN7tSNGdnu71VBriwc098TW
         M4xDL7bLFLbrkXScPCUtvc37OzLvNisl5O+HpfHP+B+GnqqSDCXoMG+405sqRXB3+K+t
         RVcFSFeAfUpSYnwZCVENmvQSIphLnqANiopFDWPvv1krT6aTQJg20ammJ8Oz0ztcm1WY
         wxV5HUTzSelw1xVlH7pnGtBoQ1HnALQfvYxf85Vp4xoKPfM2H89tBghJt1UlyKPbqCZs
         J7Kqyhn6TorPQtyvdAB1sJz6QOj/SIDuwyu36RnUQSSn3/kvyxlP8e0ch1XlWL0vy2or
         j9gA==
X-Gm-Message-State: AOJu0YybGcdKJZ7W19EcZvYmcij+cAIJNURwT4mhjhZr/0diOD5Wyg3e
	h0WSJwLAqEYpr85xHXpNav3lxz8yn201GhL08USprh0=
X-Gm-Gg: ASbGncsPNq4V2XDHGNbKSPg//OomoptT/Ulb988WsiysBvN5nbnNYekWgvM/HfBKpGO
	rlndxwvmUEKuMgeTgO40VdOJc7kEf3DQ1QJNNAlFA/nQV9LB8rF4KK+0NGRcQbiEDLT4cSemMZk
	D8BT3JDQNVH5tpfSbcyZH/6j8/c7U1YFE0BCPzMrYBO0wH3I/+noGf4nSopltOMVwT7zE06K8Kf
	QPThsTbT28SO5VkCgeRjAPiPK5bDycfKnQvisN/rz08ynNEPIuOLbDhrgIUa+4=
X-Google-Smtp-Source: AGHT+IFE35Q+eqK6HYK3Lle8nZ+XYZSGv3or6/WtJaN+SS3zKMuemz2q49H+VAqZ09PqxRRZfCBwNQ==
X-Received: by 2002:a17:906:3ca1:b0:aa6:2d35:3ca2 with SMTP id a640c23a62f3a-aa63a00aad2mr235494466b.23.1733488196825;
        Fri, 06 Dec 2024 04:29:56 -0800 (PST)
Received: from [141.76.91.222] ([141.76.91.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e5c660sm234075066b.19.2024.12.06.04.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 04:29:56 -0800 (PST)
Message-ID: <d5ed2e29-27eb-4960-a8d1-e15119df1306@googlemail.com>
Date: Fri, 6 Dec 2024 13:29:55 +0100
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ecryptfs: set s_time_gran to get correct time granularity
To: =?UTF-8?B?RnJhbmsgSHNpYW8g6JWt5rOV5a6j?= <frankhsiao@qnap.com>,
 "code@tyhicks.com" <code@tyhicks.com>
Cc: "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>
References: <SEZPR04MB6972A94B302FC6AC528823FAB7EE2@SEZPR04MB6972.apcprd04.prod.outlook.com>
Content-Language: de-DE, en-US
From: Bert Wesarg <bert.wesarg@googlemail.com>
Autocrypt: addr=bert.wesarg@googlemail.com; keydata=
 xjMEZyojgxYJKwYBBAHaRw8BAQdABqBkQCyJbN6tTW+Q6Y8DKYSSJqQ0+ki3byVvfkyE2QfN
 KEJlcnQgV2VzYXJnIDxiZXJ0Lndlc2FyZ0Bnb29nbGVtYWlsLmNvbT7CjwQTFggANxYhBC9f
 lW2UC/euthMvNuR9koqZDjkZBQJnKiODBQkB4TOAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQ
 5H2SipkOORn9UgD/Y75qQIN+jhr3DzTZ0/9Y7ZMs6qpQVqsbFSvVs2v2JecBAPandbgAl4tg
 +biNT2y0BdA/0xkaCaNI94ezJbq43rEGzjgEZyojhBIKKwYBBAGXVQEFAQEHQBThpFOoqtdx
 fos8s5X7gZ8fzSPS5aPe9y0QQO9uFVNVAwEIB8J+BBgWCAAmFiEEL1+VbZQL9662Ey825H2S
 ipkOORkFAmcqI4QFCQHhM4ACGwwACgkQ5H2SipkOORlx+AEAoyasab/fdS/mX3VaaSEbKzFS
 fw2VZAaSS+kNf0aVCwEBAOqstI0TATQ9fcLiualVtg+zSobsrD9yeU4UAeCdMiUJ
In-Reply-To: <SEZPR04MB6972A94B302FC6AC528823FAB7EE2@SEZPR04MB6972.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 17.05.24 12:09, Frank Hsiao 蕭法宣 wrote:
> related to: https://bugs.launchpad.net/ecryptfs/+bug/1890486
> 
> This bug happens in the two following situations:
> cp -p: copy a file and preserve its atime and mtime
> touch -r: touch a file and use a ref file's time instead of current time

was there some discussion for this solution. I came to the same conclusion but cannot test it right now.

Thanks
Bert

> 
> In fs/attr.c notify_change(), atime and mtime is truncated by timestamp_truncate(),
> ecryptfs gets wrong s_time_gran (10^9 instead of original fs time granularity) and
> truncates a/mtime to whole second. Setting s_time_gran when mounting ecryptfs
>   solves the issue.
> 
> Signed-off-by: Frank Hsiao 蕭法宣 <frankhsiao@qnap.com>
> 
> diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
> index b2f6a1937d239..19dbe9d1187e1 100644
> --- a/fs/ecryptfs/main.c
> +++ b/fs/ecryptfs/main.c
> @@ -567,6 +567,7 @@ static struct dentry *ecryptfs_mount(struct file_system_type
>   *fs_type, int flags
>   	s->s_blocksize = path.dentry->d_sb->s_blocksize;
>   	s->s_magic = ECRYPTFS_SUPER_MAGIC;
>   	s->s_stack_depth = path.dentry->d_sb->s_stack_depth + 1;
> +	s->s_time_gran = path.dentry->d_sb->s_time_gran;
>   
>   	rc = -EINVAL;
>   	if (s->s_stack_depth > FILESYSTEM_MAX_STACK_DEPTH) {

