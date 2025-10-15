Return-Path: <ecryptfs+bounces-497-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5781BDC252
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Oct 2025 04:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 350D43AF8E5
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Oct 2025 02:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A6F27E056;
	Wed, 15 Oct 2025 02:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWl076AJ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA91E1D7E4A;
	Wed, 15 Oct 2025 02:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760495118; cv=none; b=el70ZAuBGcYHZynNe8tc42mh6Xw9y+6DTOKD90P9aShZfd3dlhRhRrWk4jNr1AqlA+cNBETEvVXEe4pPaVlpDj8omZzPW5taJRQPb4I+qaLYkbShXMciquLslvdEsxClEBTnaWRS4CndIFg0tnReW9aiGsxvMQMpw6h+AcrBF5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760495118; c=relaxed/simple;
	bh=jqZym1TMaABmKiccCPVlIKepa3RgIHJMjFGuWh0WizY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzXFfsyKH6J1yPc0e7x95kSZ+hxvN6at5Lv6eLstaPtWLLbdrPE2EfMTrNim6x89EHDeMupMm/T8ueZ4huG6XUWdJx5+4BT0Wf9h6nxObjPty2vFKjrjSQn59ptNS4Gx7UCkinl+LiWrcfpDkBZav48AIcJJUWS9Mq9k/32P0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWl076AJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8F3C4CEE7;
	Wed, 15 Oct 2025 02:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760495117;
	bh=jqZym1TMaABmKiccCPVlIKepa3RgIHJMjFGuWh0WizY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWl076AJVNJfvKFfTKusNsByr2N3z3wo9ovXYw8h5VELpKysM3ZzNeTJZOQFGQ3aY
	 6bxhoH3jDkQmFZs18O5enai2FSst3E3pqfRwntHjpZTqmPk1KQ0y6xEJgt408wTZXr
	 g0Gkdn9/CqPrCYxkFDidGeefCHapYZZxtF3MCVH6R68x8LC7M1+4NWN/7SkiTSUCK/
	 7zoq4ryLY0wd51rDpVUVAtXVDkjDyG67r8HZIcxODDF60Tus8HwDNj1lDaq9Z2tZHo
	 cOqPJBTz4NVkqizYAeEdXM9TnMuXMfo26TQJ2VXcNWB5+dzr3jeQmHoXuYuW1+NHjn
	 /wciWv5Mevuzg==
Date: Tue, 14 Oct 2025 19:23:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: John Stultz <jstultz@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Matthew Wilcox <willy@infradead.org>,
	Arnd Bergmann <arnd@kernel.org>, Tyler Hicks <code@tyhicks.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ecryptfs is unmaintained and untested
Message-ID: <20251015022344.GA1562@sol>
References: <20241028141955.639633-1-arnd@kernel.org>
 <Zx-ndBo7wpYSHWPK@casper.infradead.org>
 <ef98d985-6153-416d-9d5e-9a8a8595461a@app.fastmail.com>
 <20241029043328.GB3213@mit.edu>
 <CANDhNCpsoPcotnrjH6y0yEBf43652DRasSsEnAyEbrKN=tjEfQ@mail.gmail.com>
 <20251014143916.GA569133@mit.edu>
 <20251014203535.GA1916@quark>
 <20251015013113.GB721110@mit.edu>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015013113.GB721110@mit.edu>

On Tue, Oct 14, 2025 at 09:31:13PM -0400, Theodore Ts'o wrote:
> On Tue, Oct 14, 2025 at 01:35:35PM -0700, Eric Biggers wrote:
> > I've been maintaining the 'fscrypt' userspace tool, and in the past I've
> > done quite a bit of work to improve it.  I also use it to encrypt the
> > home directory on my personal desktop.
> 
> Do you have integration with PAM?  I assume you must if you are
> encrypting your home directory, since there would need to have some
> way to insert the key to unlock your home directory as part of
> single-sign on.  Or are you only encrypting something like the Private
> directory on your home directory, and entering the password separately
> fromo the login password.
> 
> One of the really nice things of the ecryptfs integration, especialy
> on Ubuntu (and I don't remember if Tyler was responsible for that
> work; if so, kudos!) wasthat it was particularly eeamless.

Yes, there's a PAM module called pam_fscrypt.

- Eric

