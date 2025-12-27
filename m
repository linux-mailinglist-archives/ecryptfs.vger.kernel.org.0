Return-Path: <ecryptfs+bounces-763-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CFBCE00F8
	for <lists+ecryptfs@lfdr.de>; Sat, 27 Dec 2025 19:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F32B0300AB3E
	for <lists+ecryptfs@lfdr.de>; Sat, 27 Dec 2025 18:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F7C195811;
	Sat, 27 Dec 2025 18:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3mNS3Dp"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2140D3B2BA
	for <ecryptfs@vger.kernel.org>; Sat, 27 Dec 2025 18:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766859331; cv=none; b=fav4aZln4VoTO+ZoVLpaRavZBuEsC6danU/9HSyrW47kCMjejXL5HcRvqcTqmQ0xTdzd7LBshOjwpRDWkZlogROWCbARbDPlLtyywXuG65tQo24TnNYz9BhfSFSWPHbn1sHAEzMSSQHmzniYHfnGmR7SuwAH0k4bXx6fDxqfuB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766859331; c=relaxed/simple;
	bh=oi25ehhNkfoOPRjoPeM8ltuzBN0lkTmTDtkNbAHStQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uRMPxeaXC36qwISgkM0I2JDHwu0PtBsOfZrS35UoZiLs6DUiUmGQn17vKTkXhHMSGNL/JWRJuTSsMqYqSW5HJH//N5pOd8G/ePwHOYulrdYuz3Pqw85zTkX19cuLa+qSGo8VGYXiRHwKHSImHTR6I/gocbz1gmKCTimnsxSUsTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3mNS3Dp; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b713c7096f9so1249392866b.3
        for <ecryptfs@vger.kernel.org>; Sat, 27 Dec 2025 10:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766859328; x=1767464128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hG1f8K8KHtzwOvlcE6MNFEBQ7CKzCJCZNrilZ7SnN6s=;
        b=G3mNS3DpT1PMKeHv2PEeixl/dR0VfgXRWvERtOb/fYGi69zxaJWN6T+KviMrcoEFqC
         bigaR1Ky0OtoEks3verr2dk5dkwKbQI/btO5HiYGCi+jVDunXR5QTe6I73tQO9l16d8q
         l6JWskV3qAp9bYFpDwnuRyBh0bqngTeZLmWrkgvNnTMRT9d+x4WhRcccoevIebWkkqOw
         S29WB+x8rxin2TbcZFSOwI2TI9kFC3fkTYjSI0vxiFVEaU5AF409dI1rQQirSD2gRTr2
         hGoLKIxjgId6VylHdRJjONt31vcTl3pTVmmOv5/FExpsNI2TZt+cUZng66XRowsPfH79
         dtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766859328; x=1767464128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hG1f8K8KHtzwOvlcE6MNFEBQ7CKzCJCZNrilZ7SnN6s=;
        b=VkvX3oLCgL/e0UaQaLfb8rZKW+d1lx783PpuNX5N02+y25oWzsaU5H2FS4c8lvnTob
         TtiuFh2tIIiTN1mKrZu6BolcrzVGkI1ZIUds2GGllyGFbo6Wh+9Hlnc7K1OBbRzlT2ed
         bCVW0dUNTiauc67/3NzDE+gF+JPMyhBiUAOZIsW55zAtTmC1M60o+jgjaiVn3T8sFx55
         tj/72zns+k5/2bY/kcdfePCg5OF1LYto/0jPu5mN0j3kcvxLNhWDjq1jq+ixwekDmxsj
         dBa+zBRcIzj8rM7u2uj3I/Pgc0dZOGZf9DTt6eJtC7NMc6/VqzNI+ZBwX7Y78FprPO+S
         M1GA==
X-Forwarded-Encrypted: i=1; AJvYcCXmeBLkmcMbtVbq3CTaYB71F+ttRnwJpSXf7VyMm7SjLstn0TatHyoac0G5XqpQg0fXmYB0Y2EneQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw36+V/vWB2YFrcRPcEAZ1fuJUCM89QZgAzEojkuyM/u9OAYvnE
	jMZllj3VBdCDkwjuNYTo0gf8Wrt5UODxp1vJWCDdAnWlQdOTn7x+L0gjprKVX1DZgQavVVaLX4s
	4CfWuoatO4jO5hRW9Pugm84wh9AtrFiw=
X-Gm-Gg: AY/fxX6QQzVFHLAzxd7U24nDxP7+Ti/QNYrfSE45cJsed361dov+FtF1trmwbCQzzYk
	kv6khS5Dyu3y0ETC/Bcdgb+AP0A4+QD/5O+E7tXN6PNMNDXyH3cmn4JZr39HqkezGvzP0TdILiI
	xVcLiF0OQFgwtreWXZAdzveBlRgvrstwYr4ql51h3rUUfldgspsIfQNX/hrcm76hzcDVGa+1yeh
	gomPc5B/6fpYM8Kr1DOPn8dyMgxVDEHuiYkEx3VwC07zEouHVe6fiD9441UVdA6z1x73CTRZEtK
	pa6QlJ8Pl4eXZW92kR7GxeZ2yXoX
X-Google-Smtp-Source: AGHT+IEp8InTZ6MHUODkec6Gx6n7+rj4sIjQ9dgu2yobilRFJVmGoVIQrvwKj66thp+Zc/xg6VWxgP2Kt4xz3XDY7R0=
X-Received: by 2002:a17:906:2082:b0:b80:3fb7:84f with SMTP id
 a640c23a62f3a-b803fb70d84mr1884980966b.38.1766859328176; Sat, 27 Dec 2025
 10:15:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223194153.2818445-1-code@tyhicks.com> <176679755972.16766.8394247113563710609@noble.neil.brown.name>
In-Reply-To: <176679755972.16766.8394247113563710609@noble.neil.brown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 27 Dec 2025 19:15:18 +0100
X-Gm-Features: AQt7F2rPmTS3Re65WAAf_sQNIOrFF8xSUrXk9jN9hAqVEIEofSkxf1kJbuuLTug
Message-ID: <CAOQ4uxjp_Rgz7guv0wR6Bg40JuCiZP1L49wt_iUVnWqJjE2DLQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix two regressions from start_creating()/start_removing()
 conversion
To: NeilBrown <neil@brown.name>
Cc: Tyler Hicks <code@tyhicks.com>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 3:06=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> On Wed, 24 Dec 2025, Tyler Hicks wrote:
> > When running the eCryptfs test suite on v6.19-rc2, I noticed BUG splats
> > from every test and that the umount utility was segfaulting when tearin=
g
> > down after a test. Bisection led me to commit f046fbb4d81d ("ecryptfs:
> > use new start_creating/start_removing APIs").
> >
> > This patch series addresses that regression and also a mknod problem
> > spotted during code review.
> >
> > Tyler
> >
> > Tyler Hicks (2):
> >   ecryptfs: Fix improper mknod pairing of
> >     start_creating()/end_removing()
> >   ecryptfs: Release lower parent dentry after creating dir
> >
> >  fs/ecryptfs/inode.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Thanks for finding and fixing these.
> both
>   Reviewed-by: NeilBrown <neil@brown.name>
>
> I note that in https://lore.kernel.org/all/ZCuSLNnFQEdOHW0c@sequoia/ you
> said of ecryptfs:
>
>     I'll send a patch to deprecate and mark for removal in 2025.
>
> Did it ever get marked for removal?  Is there a chance that it might be
> removed?

If it does get removed I wonder how I and other users would access my
ecryptfs folders?

It sounds to me like the road to deprecation should go through creating
a FUSE alternative in ecryptfs-utils, before the kernel driver is deprecate=
d.

Tyler, are there any problems with doing that?
I could give it a shot if I have your blessing.

Thanks,
Amir.

