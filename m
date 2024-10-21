Return-Path: <ecryptfs+bounces-190-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7639A5CCD
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 09:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A4F71F20FE9
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 07:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66708194091;
	Mon, 21 Oct 2024 07:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="vMACdvYk"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9E6194A75;
	Mon, 21 Oct 2024 07:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495445; cv=none; b=HKBRI3zEYR7r8MG4b8LWyGgrXzXLhQGSnLucttlDppMEIk0IzOa1XfHqiRk9QNDYY1c6YeKU26SnGLnRtsgUeoq2Wa3ORZ4cvdKU/1346kn9RC+HHa4yGdQnLj/MwvfsHIulCCkvH4OYKNYh4O7koGrz4aPyywDgFPnbCIm15tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495445; c=relaxed/simple;
	bh=q+H4w7sKGiTSpfTzGtoa91dnIPvr7Ew8oFBqQ32xPOU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qq0ozx4GvfdaOQ7ETCF82kUso23IJl1wtcBeTpvMAKxbkKwCKsDf+vUFt46B1NrDCn065+vgs92yRPrTJd3FLrtop4VdwvsIc1pTMKbypX4HJXPQKqURbRDk/nLHtjfvwW7RAmH5P+ZyXgonvTaMZocYi/zUR6CcRl8deQwXsUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=vMACdvYk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729495437;
	bh=GHAsWmfOxkVGcQZ+lNhoxWPam5bzJzYf2PUWTsiafeU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vMACdvYkHH9cLVzbLq1xzq57v0vtjyRjCSw6T0OWTrUwmAr3lGYjMtgR2PEq1VzQq
	 IW4FXwzEhqSHZlgwDDOSog8/zAUcovYrhyd5vmwAV8wlXp5mNMX7iEaINM+lJJLzYm
	 AXoCUCcLTNbgbHSLBbiK55f/D4wusytxyVk61goY1YH05KKRNkwYR00B2ADUoS4gB8
	 A+G/NbFToB/CXNjHrAMAw2u+7C67MG0H6K3lDee2YPiyxqwTP2PNqeyeN5Yz8YTfu3
	 de+azIMqObQ5EQdzIWzoBzqu9URpMhJWCwHNRBXZZPmLwm6JJmYp4+xQa4HJ1ib2OJ
	 FuY0EVf5yhYwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XX6Hd5z7Dz4w2M;
	Mon, 21 Oct 2024 18:23:57 +1100 (AEDT)
Date: Mon, 21 Oct 2024 18:23:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tyler Hicks <code@tyhicks.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 <ecryptfs@vger.kernel.org>, <brauner@kernel.org>
Subject: Re: linux-next: Please re-add eCryptfs next branch
Message-ID: <20241021182358.7ba51d97@canb.auug.org.au>
In-Reply-To: <ZxX7khzjUaDOpfOt@redbud>
References: <ZxX7khzjUaDOpfOt@redbud>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5RVzRe=BrRo.1MS0vEWyd+F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5RVzRe=BrRo.1MS0vEWyd+F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tyler,

On Mon, 21 Oct 2024 01:58:26 -0500 Tyler Hicks <code@tyhicks.com> wrote:
>
> Hi Stephen - Earlier this year, you dropped the eCryptfs next branch due
> to inactivity. I'd like to request that you re-add it back now as there
> are some patches piling up to bring eCryptfs up-to-date with the new
> mount API, folios, and a few other trivial cleanups.
>=20
>  git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git#next

Done starting tomorrow.
--=20
Cheers,
Stephen Rothwell

--Sig_/5RVzRe=BrRo.1MS0vEWyd+F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcWAY4ACgkQAVBC80lX
0GxqdggAi5xp+DABORpufPen8b5LMdZBftXoI8yzKR4Kt+9qjPgOUWf8xsYzKZPB
q4RaavkZFnGUfUM5iAa0Yk6Bbx+VuEylhJJ4x6pRHmm2VbmMk8comrTqE2aoN4JR
Ry39PmtyLERlgLw+vKYa0PFNUU/7bl12UGEUJfiBlwGj/AtogXzozjtfVa1iGSYR
BNqSB88bt8WmwPmKr698T1AavYRt2pDoHAgaV3XLJ884myMhtspPglg5fweiYhWN
3C0ISPWBN0AzezzMcbjKOkqggifkQQRaDIHGLmmcIcJzyKzQ7rJe8KVLLNJDiuqX
kansXbc4c6VQ9ZZpF+n2JWyNMPT5tg==
=MifD
-----END PGP SIGNATURE-----

--Sig_/5RVzRe=BrRo.1MS0vEWyd+F--

