Return-Path: <ecryptfs+bounces-485-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80495BD7879
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 08:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA71D1920BC6
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 06:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EA830DD2D;
	Tue, 14 Oct 2025 06:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CcJtUZCz"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6E330CD9D
	for <ecryptfs@vger.kernel.org>; Tue, 14 Oct 2025 06:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760422094; cv=none; b=p5JamH/SO/ibjvr8wmSDMN3408jLiKDmb+1vVFEKAFEyLB7vVRiplF5jMWubTZF0KVm+xyf8wb70Pu3xsSH1k5IERBSuqGT5mgAyI0oy6VyRL+Fnw1mnzSfgZW1k/1zFb/kx0MezzOx2S6v716J0chtpGAIcvSQU1rykS8gHmmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760422094; c=relaxed/simple;
	bh=lof0YmaEG+LixcrlFfIQ7Ogl4ET9WZzFbwtodBp/9N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuTmgM23DSBTuOP8EbPPM063L9eRYr34HiDNrv1h6eWd2tgTf4vQn6Nt9oNFbTZ6seJLsHtYl2o4s/y6B7gN49YysbCXQCPAdu7Zuxf9vy4/Q2DqvH4T5DESEevmHkIflfVGSZp9JebCSDh0k74mTDMgJbP2CQXCg9uzOg9Zhz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CcJtUZCz; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so923017766b.3
        for <ecryptfs@vger.kernel.org>; Mon, 13 Oct 2025 23:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760422089; x=1761026889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lof0YmaEG+LixcrlFfIQ7Ogl4ET9WZzFbwtodBp/9N0=;
        b=CcJtUZCzLKwef2qI/CAlnpT8LJuw+YBJESBvjS8IJHRmV1xox3O/l7nZz1ruPh9kx/
         dM15/ZMjyqyrAccFGAdWXGLdmJvTne6V7EZJAB1diKNklyN7ZtCHB1UDZk+pBUeAYKmQ
         YzGxl5yT7qPWV6g/C63rOC00e+4HvfnOzsqfR3eBr/H6SkLsygvjNnVkDGGlPa8VNPRO
         /5jfmiFYcagW0Dxtm/0aA7hPhif9s5XDQGc9YOfWHZRrWNxH5LKVKVPoSAGa2zWLkLpb
         cVGaSKOg3Qp5F7VGXPvZdjAGzhulpdX9+NkOgQJKls3QhKWcc16Fj2K5vtQzuEmc1sGJ
         lnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760422089; x=1761026889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lof0YmaEG+LixcrlFfIQ7Ogl4ET9WZzFbwtodBp/9N0=;
        b=YoGgRZPwiTWmhuEJ7GCsLQqwwm0J1v63aWQhyfIjxkSIzSRdGWo67qgCO33u8ZemPB
         d/+rRgn97A9sgLBgAi/0VoVJmC/eRNgsCuIntiUSi1npMpR5vCJ7i8QZ1s3J9grj0cGt
         xvxceeoNNqdQ3RT3HZiNe55NIn9V8xcvHeU8xAVhK8LOqvW+JbtcoLbqfyXFAOz6Zmo2
         06YHJLBh/vgeTcK7c6mYYRvvgJ11lFxM33KOWHDF7v3NgenPgq0D85mTCdh5asSjz2Vz
         RdikFVvmroGr7K/4wHOsQYUmaMu7yyJ30loS/vNZEMMtguK+d5T40Vu/m/KwpaihH4Zm
         40Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVPWOzi3Cy+esH2fc4Ltyg/uHcdxBMWXx4J9dky33L0ihxqWTRmehKRtnwWBuJCh2yEbQbSQewJ9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzagCuEZLfcQ0ISjRIzXodRzfDQeeoJHAD63zNnCjykDPioXdCU
	GNNQ6/f1u6RFGJhLrYiC095o1AYRX8SIHhsdthgYCRENiovAJrsYwwPaVmReVxpT+QStWU9lkOs
	9gGZcLxzzIuOWocQaVsS5Q/sSQkKgBxT7LtSmfZw=
X-Gm-Gg: ASbGncu0nHbO0cViIdPT/EE28g+SRcRm9lR1f1qKYTlZ3S+xi5icGg+ZQWPpR4vB6Hc
	SeTZULyOYL0NGCIVkU9qp1a0fQji5N5DLQZwhLnJ8UCI3UTTzIYXsvjKWWXkmf/LrlN4akGHc2e
	Z05dzFSiK6ZslBDhKVXs+DS/egBMBEa/+1HdKKqNS+qn68clK00XtmqIXp6/k1sXoYh6w1qYHIg
	O+DUiM34oo7SeRBKkF6BKpkElPwLSFouQeHZiQM7iFpQNDSkF/DGa/mg7n9JQ==
X-Google-Smtp-Source: AGHT+IGgdgiIGSvQYNIALqQ9pUoUutRB3h3EQJkldTUgUBPgd6YP8ch3nDyhEbNc4+8Rle8rXUNdTCWvtn+Bk1FuOVQ=
X-Received: by 2002:a17:907:d86:b0:b3f:d9e9:baab with SMTP id
 a640c23a62f3a-b50aa8a9056mr2856602866b.27.1760422088618; Mon, 13 Oct 2025
 23:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028141955.639633-1-arnd@kernel.org> <Zx-ndBo7wpYSHWPK@casper.infradead.org>
 <ef98d985-6153-416d-9d5e-9a8a8595461a@app.fastmail.com> <20241029043328.GB3213@mit.edu>
In-Reply-To: <20241029043328.GB3213@mit.edu>
From: John Stultz <jstultz@google.com>
Date: Mon, 13 Oct 2025 23:07:56 -0700
X-Gm-Features: AS18NWBRClzXhRlv_9uytilT7uxCBXfaLucmkCNNwGt2ZbA0vKObHGKWy_fvfp0
Message-ID: <CANDhNCpsoPcotnrjH6y0yEBf43652DRasSsEnAyEbrKN=tjEfQ@mail.gmail.com>
Subject: Re: ecryptfs is unmaintained and untested
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>, Arnd Bergmann <arnd@kernel.org>, 
	Tyler Hicks <code@tyhicks.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 9:33=E2=80=AFPM Theodore Ts'o <tytso@mit.edu> wrote=
:
> On Mon, Oct 28, 2024 at 09:50:37PM +0000, Arnd Bergmann wrote:
> > On Mon, Oct 28, 2024, at 15:02, Matthew Wilcox wrote:
> > >
> > > This comment has been there since June 2021, so I think we can just
> > > delete ecryptfs now?
> >
> > I have no opinion on removing ecryptfs, but I don't how possibly
> > removing it is related to the patch I sent, as far as I can tell
> > it just means it relies on both CONFIG_BLOCK and CONFIG_BUFFER_HEAD
> > then.
> >
> > Is there any indication that the last users that had files on
> > ecryptfs are unable to update their kernels?
>
> Debian is still shipping ecryptfs-utils and is building and including
> the ecryptfs kernel module in their distro kernel.`
>
> So it seems likely that there are probably a non-zero (although
> probably relatively small) number of ecryptfs users out there.

Yeah. Sadly I'm one, as I needed something to migrate off of when
encfs was deprecated.

Is there another soon-to-be-deprecated filesystem to encrypt
directories I should move to? :)

I definitely think we need some loud warnings and Tylers' suggestion
for a read-only grace period would be helpful.

thanks
-john

