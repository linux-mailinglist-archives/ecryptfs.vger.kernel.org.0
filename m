Return-Path: <ecryptfs+bounces-491-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B31BDAB55
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 18:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2FA0B4EC46D
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 16:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0318301027;
	Tue, 14 Oct 2025 16:52:17 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail.lichtvoll.de (lichtvoll.de [37.120.160.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866A52D9ED9;
	Tue, 14 Oct 2025 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.160.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760460737; cv=none; b=eW9WuN0aEVLY2ff2rsA5FmBZ5JNKznQ/4pdZCYN1o2+ld3fdpDLop/8mhWObYLYJIo3fhbEM+7/VYWbo+Am5C17G8bUR8PssG1rQ9IgqjsoZMAgTixH9SQtgJDGtZxIy2MwevAkh+Tqi7lqI3xW0WHd5f0JVOfa5genFjJInF7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760460737; c=relaxed/simple;
	bh=Ogftr4mGtojZOo1E2jUvNWxbrmqKR2GW6h56BUTIq1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QyPYo347veYkHp5BNdE7JmNCi7fujpNg7Mz3SVBwaDg2zuIdfxtgeSLQLE3otDD97nR5VfjhQOOA0DcfmDJagCt3j1lC5BXnvrNrqafF920oJ5bGXMFjsbkFsaU3K9TAGRKg1Gin1KHAwzhFX3Er+3SlF4lH8ph2goH2sKKaqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lichtvoll.de; spf=pass smtp.mailfrom=lichtvoll.de; arc=none smtp.client-ip=37.120.160.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lichtvoll.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtvoll.de
Received: from 127.0.0.1 (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.lichtvoll.de (Postfix) with ESMTPSA id 4FFC6156B2E;
	Tue, 14 Oct 2025 16:52:10 +0000 (UTC)
Authentication-Results: mail.lichtvoll.de;
	auth=pass smtp.auth=martin@lichtvoll.de smtp.mailfrom=martin@lichtvoll.de
From: Martin Steigerwald <martin@lichtvoll.de>
To: John Stultz <jstultz@google.com>, Theodore Ts'o <tytso@mit.edu>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>,
 Arnd Bergmann <arnd@kernel.org>, Tyler Hicks <code@tyhicks.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, ecryptfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: ecryptfs is unmaintained and untested
Date: Tue, 14 Oct 2025 18:52:08 +0200
Message-ID: <6199587.lOV4Wx5bFT@laptop>
In-Reply-To: <20251014143916.GA569133@mit.edu>
References:
 <20241028141955.639633-1-arnd@kernel.org>
 <CANDhNCpsoPcotnrjH6y0yEBf43652DRasSsEnAyEbrKN=tjEfQ@mail.gmail.com>
 <20251014143916.GA569133@mit.edu>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi.

Theodore Ts'o - 14.10.25, 16:39:16 CEST:
> This is probably because for many desktop and server configurations,
> using dm-crypt is actually better suited and more secure.  It
> certainly doesn't solve the "just encrypt a directory hierarchy in a
> file system" and the "support multiple users' who might have different
> encryption keys and which are mutually suspicious" use cases.  But
> this appears to not be sufficiently interesting for distributions to
> do that integration work.

If it is just about encrypting a sub directory of the home directory there=
=20
has been work to support that on Plasma desktop via Plasma Vault. It=20
supports CryFS as default, EncFS (with a security warning about it) and=20
gocryptfs. CryFS is interesting as it also obfuscates the directory=20
hierarchy as well as object names. All of them are FUSE filesystems.

Maybe one of these =E2=80=93 excluding EncFS =E2=80=93 could be used for en=
crypting the=20
complete home directory of a user. Preferably CryFS maybe. But I bet it=20
will be quite a bit slower than ecryptfs=C2=B9. And I am not aware of any o=
ther=20
desktop or distribution integration work regarding CryFS, gocryptfs or=20
another alternative.

[1] "The increase in security when compared to other file systems comes at=
=20
a performance cost. CryFS is fast enough to be used in practice. I'm=20
getting a read speed to 170MB/s and a write speed of 80MB/s on my SSD=20
machine, but other file systems are even faster."

https://www.cryfs.org/comparison

Best,
=2D-=20
Martin



