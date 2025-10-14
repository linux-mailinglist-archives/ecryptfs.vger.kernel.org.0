Return-Path: <ecryptfs+bounces-490-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD70BDAA65
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 18:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6CCFF4E824C
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 16:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2E730275C;
	Tue, 14 Oct 2025 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xnFLv0Jj"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460F62FFFBB
	for <ecryptfs@vger.kernel.org>; Tue, 14 Oct 2025 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760459949; cv=none; b=ssFWrnt1LaXUt15wuhTa07/i1adGtOh19O4jAApz+TtF4vjpVAK3EKbrXEk/NgnvswKvqW01ihZ5nP1+SF+L2mTOTxQHN0tmnF61r5fQ9R9wiMIQJhngzwMQqN2PbMj2W2fZsnf1f8kNBTiGjePVuiSHepXSCcUV9dPmbfNhlNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760459949; c=relaxed/simple;
	bh=KIdcjicU1xkhUuZ7lS5rBFgv0PumoAcegzgFThh+RDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fq4YQNCOl/710d4uAjHzrI8co/grO1E+a6gsdnaxVv3LiqicASEbBFRnaFs1+UxivYX1EfvzdXz5w7bZRqXvifRRx/DOeyMUHfMZZVHs46k3o53bv77O0M7QnieC5P9j43FyzgycesZ1tTowWyh/NwbtHnfxjjocvrh/jTaQOl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xnFLv0Jj; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-639102bba31so2554271a12.2
        for <ecryptfs@vger.kernel.org>; Tue, 14 Oct 2025 09:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760459945; x=1761064745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m2YZNN0UigJ9JbMENObnZrolpEs9nwRN25izP8uaiU=;
        b=xnFLv0Jjwr0Msthulxk/3VfLVJoJ3QzY5l6+Uvt0xLIyciw7qa5d5MOrlXBEN7LS/J
         vqTIOj2kES0c38/FgaglYCXIaXtmx0V+kN9KDJ7Rm7zI9Pr7FJ8OYwN0PPmxTsvuLOJv
         wdLiLvM+NFMBSFqJEPk02ngy5oIIfGvHAS2R81sGy2upROqTnJR+uUGjNWkUtS+u4Ws/
         IF/18/4B6yZjTi4Zt5vfzTbwSdTmqFGmuO/IAjtL6xCNvNxUh+RWWg6MnMkPRimJfZ6x
         SfPRDLzy6CedsczUDKvdJWE6a45alB9Hl2s3ZBYmKRhl75mU9851oBe5jkdNY0DkBWjo
         tT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760459945; x=1761064745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3m2YZNN0UigJ9JbMENObnZrolpEs9nwRN25izP8uaiU=;
        b=FAOwMS5dWaNGtNoOJJ6/U6Bt75rbiJHCCLEy7MH5HaoZgr14OSxtlhu39KPWXId1jS
         awBVDofvXWADJLSqSNTAxhVzMiqvGeepQiMT5hCTf4pMdFFZp9ZjSdJq101AorhBs4rN
         SZhHIzhfJOE8dkuph7Rgm1eOtunPcTCb9mCLo3yEtABTbtLOLxil+sbZJjPKjEo0N7LH
         fyXWmCDT1VGh2DfkjoCMYm0zphODU+rYLKDuYeD0wtJLQv38HH4oPrub1BFuSLrYyI9a
         lwkCcJP27mGlhtJPgPAvL1dNpE1IElJtafzv/EB0ZjHAPM+yKMxeSCcqraiPx88Fl9Q2
         Me7A==
X-Forwarded-Encrypted: i=1; AJvYcCW8lVceIdCDLRJ9iFbdYjvcr4LpDw7aFoAXD2jY8zjyDOnHFSlT2WpO4WwHhgNnNKV2SSRiPMPHFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdybJZBoYwNevpYDTw7/pUikGz9zC6eloSP0Lcl08m0oXVFGIh
	CwPdNM3Rql3YU61D0fpARu9TvbDF420r9trwUeNJ07rrP96XLoIBTdIUgwh+9B+PgU3awAgT0Ql
	FXgd/DX/crYWaRYUzD+8bsyBZFuNSrxq1GjH3PW/5D11lFB1JmVVpDc8=
X-Gm-Gg: ASbGncu8bxv+BFaP5gOycKocBEoDEKdXAgJdz4K7D+9gS6TQ39o0Ya2pfQJ2SYwhIwF
	ozMkJRsaQOgmaT9WAbjBDJAspqr46bVWjf73i6Z7kZWc6D7/K0GAXuJFLv1qrDdrYD6ubHW/TI6
	TlUdqgngp9leZ2EuKvKoCoZ1n2Ml3pnYBi+CkwF0+8lveOo0Vs73PsZUPzTL8oLbWC7eIbsmmZ4
	9qofkgIr5C04eheuufAYyD1AsKe7Q==
X-Google-Smtp-Source: AGHT+IF5iAWr07Jq9Ca0FW/cfj1AC3c/D4Vx4woo9Rt7MaT1D0cjoFs6PinKWLKqi6oFaEipagDkNxatkgT/Lv7pwD4=
X-Received: by 2002:a17:906:f584:b0:b43:b7ec:b8a1 with SMTP id
 a640c23a62f3a-b50aa38724bmr2732549066b.24.1760459945266; Tue, 14 Oct 2025
 09:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028141955.639633-1-arnd@kernel.org> <Zx-ndBo7wpYSHWPK@casper.infradead.org>
 <ef98d985-6153-416d-9d5e-9a8a8595461a@app.fastmail.com> <20241029043328.GB3213@mit.edu>
 <CANDhNCpsoPcotnrjH6y0yEBf43652DRasSsEnAyEbrKN=tjEfQ@mail.gmail.com> <20251014143916.GA569133@mit.edu>
In-Reply-To: <20251014143916.GA569133@mit.edu>
From: John Stultz <jstultz@google.com>
Date: Tue, 14 Oct 2025 09:38:52 -0700
X-Gm-Features: AS18NWBEWkQuvz6RJmkj-jqOBSb01FLnoGovGoVGZcfxO-4ryZ13MTK-KtFB3l8
Message-ID: <CANDhNCp=06eNkOqNX2dFrnYhpZX0xsEd06U1xCwORk1mwt=MCw@mail.gmail.com>
Subject: Re: ecryptfs is unmaintained and untested
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>, Arnd Bergmann <arnd@kernel.org>, 
	Tyler Hicks <code@tyhicks.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 7:39=E2=80=AFAM Theodore Ts'o <tytso@mit.edu> wrote=
:
> On Mon, Oct 13, 2025 at 11:07:56PM -0700, John Stultz wrote:
> >
> > Yeah. Sadly I'm one, as I needed something to migrate off of when
> > encfs was deprecated.
> >
> > Is there another soon-to-be-deprecated filesystem to encrypt
> > directories I should move to? :)
>
> Well, the closest way of encrypting directories is fscrypt.  The good
> news is that it works on top of btrfs, ext4, f2fs, and ubifs, and it's
> not likely to be deprecated given that it is used by chromeos and
> android.  The bad news is that the integration with traditional Linux
> desktop setups (e.g., login, etc.) was never completed.

Yeah, though to my understanding fscrypt complicates backing up the
data in its encrypted form.
Having the fuse/overlay encryption approaches is nice because you can
just backup the underlying filesystem layer and ignore the overlay
mount.

> This is probably because for many desktop and server configurations,
> using dm-crypt is actually better suited and more secure.  It
> certainly doesn't solve the "just encrypt a directory hierarchy in a
> file system" and the "support multiple users' who might have different
> encryption keys and which are mutually suspicious" use cases.  But
> this appears to not be sufficiently interesting for distributions to
> do that integration work.

Mostly I avoid dm-crypt for personal files as I want the majority of
things (family pictures, etc) to be as simply recoverable as possible.
It's only for a small amount of things like email archives and
tax/financial documents that I'd like to have it be non-trivial to
access if my backup drive or desktop was stolen.

I've wondered if maybe something as simple as fuse mounting a password
protected zip file would do, but I'm guessing something a little more
modern like a fuse + age approach would be better. Unfortunately I'm
not finding anything so far.

thanks
-john

