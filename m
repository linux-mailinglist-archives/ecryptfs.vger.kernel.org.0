Return-Path: <ecryptfs+bounces-494-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D38BDB453
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 22:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 938634F97CA
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 20:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699BB30597E;
	Tue, 14 Oct 2025 20:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIDKKyFZ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF322D877C;
	Tue, 14 Oct 2025 20:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760474138; cv=none; b=YjejYp0B0EHXZWZD8EcD9iqvGTNhIzFFXSsG8TSbAetRLYFkvUq6xiwhaVDz4+zbL4S2BGg6Pnk794IEdBinpN6wOnQzvWM1HPqvIt/6sD8IG+nRf2kX96ffq2/mzRgMxMyjxSOmOdoc28MnNq+UjKvPCUjcUnTfH7xpUEzkGYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760474138; c=relaxed/simple;
	bh=dKSUwooapqfKnnp+tXFsmmogWc+n8vHaAutUZmOnCSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maYKtgSpi2+G126VEUGxdLC0mthyP3mQ9mv8P0s9WA2tF0ImrUdfwZZkU+yZghaEQARXwgl4Zke6Xa4G7H352D0bgyEBNAeZ5oqvQvJb0OUBM62REXQdsc9eu8Mhy7uFkKXqk09LzHWXv8awdmNPcTn2f+RhTSAkTPm77X2RSOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIDKKyFZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A56C4CEE7;
	Tue, 14 Oct 2025 20:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760474137;
	bh=dKSUwooapqfKnnp+tXFsmmogWc+n8vHaAutUZmOnCSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIDKKyFZDqxvv9siup0KTO3d3EzU4BklF9FCmghKKfKrZrD546jULUFg0+vFVcHy0
	 TRKzwdaBFIuQ6DFggz9HhQwJtbdRFrnG0nNJQmLetnvQvtZs76c0ggMokH/rS5J+va
	 UI3iDUmKYv+zfB9n2T4VjDdQi6DnZs0oJSwf2S0uOMQr8TIOTx7wXwjezRcHba204z
	 ULwiuvRlC4hDWxcVnusEpSt7hj15FBbnWnj2qG9/4z0+p6zFf84CZ+Y2zTpEaQ5y7z
	 ThU3wcn4NPmwPim1s8Gs+WpCArRfMgde8I5Z0CY+F3hNR/cDvMDjl8bOQQlzWmfXRE
	 /PfblxDQuiKYg==
Date: Tue, 14 Oct 2025 13:35:35 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: John Stultz <jstultz@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Matthew Wilcox <willy@infradead.org>,
	Arnd Bergmann <arnd@kernel.org>, Tyler Hicks <code@tyhicks.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ecryptfs is unmaintained and untested
Message-ID: <20251014203535.GA1916@quark>
References: <20241028141955.639633-1-arnd@kernel.org>
 <Zx-ndBo7wpYSHWPK@casper.infradead.org>
 <ef98d985-6153-416d-9d5e-9a8a8595461a@app.fastmail.com>
 <20241029043328.GB3213@mit.edu>
 <CANDhNCpsoPcotnrjH6y0yEBf43652DRasSsEnAyEbrKN=tjEfQ@mail.gmail.com>
 <20251014143916.GA569133@mit.edu>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014143916.GA569133@mit.edu>

On Tue, Oct 14, 2025 at 10:39:16AM -0400, Theodore Ts'o wrote:
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

The current set of filesystems that support fscrypt is ext4, f2fs,
ubifs, cephfs, and (out-of-tree) Lustre.  btrfs's support for fscrypt is
still under development, I'm afraid.  I'm told it's starting to be
worked on again.

While the main user of the fscrypt kernel feature is Android which has
its own userspace, there's also a userspace tool for general-purpose
Linux distros, also called fscrypt.  See
https://github.com/google/fscrypt and
https://wiki.archlinux.org/title/Fscrypt

I've been maintaining the 'fscrypt' userspace tool, and in the past I've
done quite a bit of work to improve it.  I also use it to encrypt the
home directory on my personal desktop.

It's true that it really could use some love, though.  It's not
something that I've been prioritizing recently, and no one else has
stepped up either.  (Compare to eCryptfs where Ubuntu adopted it, and
Canonical stepped up to develop and maintain ecryptfs-tools.  That's
just not something that's happened for fscrypt.)

There are other userspace programs that use the fscrypt kernel feature
too, such as systemd-homed and a new one called dirlock:
https://lwn.net/Articles/1038859/

- Eric

