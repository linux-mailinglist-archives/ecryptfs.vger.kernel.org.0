Return-Path: <ecryptfs+bounces-757-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5DCDB794
	for <lists+ecryptfs@lfdr.de>; Wed, 24 Dec 2025 07:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC4F330092ED
	for <lists+ecryptfs@lfdr.de>; Wed, 24 Dec 2025 06:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AE22F747D;
	Wed, 24 Dec 2025 06:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h61WXPVb"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7FD2ED86F
	for <ecryptfs@vger.kernel.org>; Wed, 24 Dec 2025 06:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557447; cv=none; b=DYscHPELSaxqwWDEkI1hOIitJqqBZQhjY6OuR4GlWGTcRWZM0aZlE81nHH0nkVN0xFcBZbJHNNxp5IK1IerbXIf04nRrxMxcm8jL+k7015UN3p24tPntBg0+ieVqBCyA43qfNasOklQvUMrZLfqySuoYEp81zxPocrX4sEFwNQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557447; c=relaxed/simple;
	bh=hN2PkEDWk4p2E8/jcdhO1Wom2sMdoHiHkGKM9xXk7zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnPFEIH5+RzHmYO0X1dyNFjXI4Dgz6b3inOxisiPOyvvMWaEuxs+I8pdbirPd7+56ldXZdLaoOJrW45E1hUx1z314zjfbN2WcgS5yJ+Mv9qNJikllMxY5/IiBmzmJ7UXNdUTd9b6Q5JTxfyLv1QGE23bFOf9gNMSbRJlQr7o4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h61WXPVb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64daeb28c56so2008540a12.2
        for <ecryptfs@vger.kernel.org>; Tue, 23 Dec 2025 22:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766557444; x=1767162244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIT547IkNANMcip16wm0bsuCj6HL96IGzOppq4Wafpg=;
        b=h61WXPVbMedFU/e6HB4EcnjaqEfssUbGVjWYwDJeJB/AGpRRstOjrqMWuY+yaeS+19
         f7Y+fkZcccie4V6ya09rB356k8sVIIwNbkS1mC12NlOb1UXyyuGhiSruwqNd1IzQS5+e
         yf4yqrwVU8fK7SbbN7rnjQojOZL8edrU98ihLC9Hxuqf4EPlquNO9bX/VjjYVCMsls5k
         FwFZpTIHPEHi+LJPLgmKdT5zgC6PTGfJY8z1MjLEEh/5DCpvEW3Wy371523NhtkfKrQc
         wViKL6Q6ycJBU9L4SXbTeAEoNrnhTxbC0Mi6gVwR5wLt8sV4nW6idREZTln9LRlx4oyO
         TZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557444; x=1767162244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIT547IkNANMcip16wm0bsuCj6HL96IGzOppq4Wafpg=;
        b=t6AbTgKPS01qIDQRq2Ik0sjuaMMmsEmmx6REqyVGPtHBzaBehHrmmfDU2kpecUZYBY
         6tXTdyJWx38DM3P+J1tGmyoirkDcg6vQan3tOyTveDZ4yGXuscr1Gs1jNSpnED6urVU1
         2qIr2w4wNo/An/+TXbY3vnUZmIFDoOrO8ElHwDprPTAahfz9HOG4yuw1xp5elx2MgrLL
         oi0sWPGGCrXo7clsDn6l5+4GjOyXdX7FOz4b+sm9SVZitliQuK9k7ib2Gu/OdJ97rhkm
         cS1zgqKpLD2fdj01j8qQOBSvlN/3zK16IifRh9dwNdtqzezIr+gYBEvJPAUXEWXifTen
         JWuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQZSaYj+Tch0eTGOHRYP1G7GC67BEBVLbDXa1W6ud+Qu8ffCI75WuWfwLj8DOe9m9RrrtYo3v9Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Wtx4SBay+hlxLeHro7n8EKHmnQnLTxTV8GX4W0IGVKM34CDp
	FTZVe2S+o1CHI3PfmvEoA9I36r/4Kunz3XvOoSoZnVS9QUPkpDfFa8gviPghSeU2XVf+jMFFjQz
	PKcnflarCZt7hrl3JY/YDT1SKKapSbCg=
X-Gm-Gg: AY/fxX6GqOPj05IS8WAY2kISTaI+HHZO5t1VpL/4bj3ejb/CKVe7L63ah5H3/yzsPbw
	p7wJdAqYbtK2dkWytWyzcztRrkLkBMggRV9FzW+2XIED6YTUddbW+sZbbT9de1rSvHt44DwJi/K
	Kq+/gSbbgCok+HiDJ6sQ9OOCOb/wIVXbEiL2X1LKUgDwK8gMilVxI+CMNR3+bKly/ze8OSSTzEL
	tKzc6QqVm65ietLOAjS54BHtD1jg97NgSOdk2eFzX4iso1FFCb0v9bBQNGU8WaUJw4UmmvLSJ5B
	HALBGcWer3rZNF4LmA/k1xcARK253A==
X-Google-Smtp-Source: AGHT+IE9U86IMBXEtqmcna1pEcud0+V5I+SOhvPPa8IjOF0zjJte5DVpekxcp5+lCBZn08cKqP7BDAqCSJh6ake+KcU=
X-Received: by 2002:a17:907:97cf:b0:b7a:1b9c:ba5a with SMTP id
 a640c23a62f3a-b803705df81mr1705550666b.32.1766557443686; Tue, 23 Dec 2025
 22:24:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223194153.2818445-1-code@tyhicks.com> <20251223194153.2818445-2-code@tyhicks.com>
In-Reply-To: <20251223194153.2818445-2-code@tyhicks.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 24 Dec 2025 07:23:52 +0100
X-Gm-Features: AQt7F2qFhJorx7_UnWIzjgefPnTxGYx_37q0UlvMwqB2LNaWatC3LkaqqBjrOZo
Message-ID: <CAOQ4uxhnw1sa1xxii+2r69hFs02sagbQt6uLti5TxSnaHk_Kkg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ecryptfs: Fix improper mknod pairing of start_creating()/end_removing()
To: Tyler Hicks <code@tyhicks.com>
Cc: NeilBrown <neil@brown.name>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 9:42=E2=80=AFPM Tyler Hicks <code@tyhicks.com> wrot=
e:
>
> The ecryptfs_start_creating_dentry() function must be paired with the
> end_creating() function. Fix ecryptfs_mknod() so that end_creating() is
> properly called in the return path, instead of end_removing().
>
> Fixes: f046fbb4d81d ("ecryptfs: use new start_creating/start_removing API=
s")
> Signed-off-by: Tyler Hicks <code@tyhicks.com>
> ---
>  fs/ecryptfs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 3978248247dc..e73d9de676a6 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -584,7 +584,7 @@ ecryptfs_mknod(struct mnt_idmap *idmap, struct inode =
*dir,
>         fsstack_copy_attr_times(dir, lower_dir);
>         fsstack_copy_inode_size(dir, lower_dir);
>  out:
> -       end_removing(lower_dentry);
> +       end_creating(lower_dentry);
>         if (d_really_is_negative(dentry))
>                 d_drop(dentry);
>         return rc;
> --

Doh! Who's the dummy who reviewed this patch :-/

FWIW now

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

> 2.43.0
>

