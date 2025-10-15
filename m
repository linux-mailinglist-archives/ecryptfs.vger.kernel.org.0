Return-Path: <ecryptfs+bounces-496-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6DBDBFC6
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Oct 2025 03:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BF731882145
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Oct 2025 01:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D2118024;
	Wed, 15 Oct 2025 01:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="Dfa7KSPo"
X-Original-To: ecryptfs@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F82AD3D
	for <ecryptfs@vger.kernel.org>; Wed, 15 Oct 2025 01:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760491910; cv=none; b=LCBtgglDydopNMvR0We2sMV9kSXG5U8hmPsaBONrrFr320F6uSXlDHmy+PpxVV09NcRTVZ9B2d8YDgFwiqqjgRNn1K1hd2b77/iDjtGU076MaN3CnehfTN6HebKKx/WBzAvAIbVr5DYUIwAn3CWgcJ+Z5+qjqk7jVMq/kY3aau0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760491910; c=relaxed/simple;
	bh=M/4WTdFcwEa5xAbwiq8cAcf9jJBGEuskC0nRmZAv6I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVG1TABDwlGYJBtdHSH8oDGyBUVx0iTrlRnyBfK6iVjXEyzea0NPZ0j4IVEJeEAm2bI9ZF510rkb6sKVq0Qxk3MEmaDudgCbBbij+SOyz+l6QXr/M/V+7ZF37X5mMJml1Mm+ST2C9G766+vjUY/HEu9z7SKl2rur3oZdWyiRadM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=Dfa7KSPo; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-113-184.bstnma.fios.verizon.net [173.48.113.184])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 59F1VDlY022961
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 21:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1760491875; bh=2RtiZaXCkU5C0B0P6i/L3fLC4Ws6GbczpRT5zZBylEg=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=Dfa7KSPo/F8jpn6vZDVyPfJ7hJqEtUHstsz6ZUKb8yEMIyUR1AHMahQRMIPNVUNKF
	 VijkGe1eweh2SV4jsjjcNSDuobQGdtssyyeCP9xHowl2H1KNv6ZK1fHO6BZeVRhzrG
	 Row+zx7fM+22jQ8mm1Uiuk0y+FqbVz2WyAAWy8tIbBSRYnrNLNQRcjF1T3qbI4djGg
	 57kYkcb+dWz4m/FC4KX1tbCub1+foBmtqvpK6o0KsfZrln0JznecB/zhfbDOdegYq9
	 9LDs1pTiH0SlpgIjZbGMWuovfRLZGFmOCBpsLOPq3XhUVYuimK9S2xqHV8FqVpydAg
	 OIUh2N9cnojMw==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 0E0FC2E00D9; Tue, 14 Oct 2025 21:31:13 -0400 (EDT)
Date: Tue, 14 Oct 2025 21:31:13 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Cc: John Stultz <jstultz@google.com>, Arnd Bergmann <arnd@arndb.de>,
        Matthew Wilcox <willy@infradead.org>, Arnd Bergmann <arnd@kernel.org>,
        Tyler Hicks <code@tyhicks.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ecryptfs is unmaintained and untested
Message-ID: <20251015013113.GB721110@mit.edu>
References: <20241028141955.639633-1-arnd@kernel.org>
 <Zx-ndBo7wpYSHWPK@casper.infradead.org>
 <ef98d985-6153-416d-9d5e-9a8a8595461a@app.fastmail.com>
 <20241029043328.GB3213@mit.edu>
 <CANDhNCpsoPcotnrjH6y0yEBf43652DRasSsEnAyEbrKN=tjEfQ@mail.gmail.com>
 <20251014143916.GA569133@mit.edu>
 <20251014203535.GA1916@quark>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014203535.GA1916@quark>

On Tue, Oct 14, 2025 at 01:35:35PM -0700, Eric Biggers wrote:
> I've been maintaining the 'fscrypt' userspace tool, and in the past I've
> done quite a bit of work to improve it.  I also use it to encrypt the
> home directory on my personal desktop.

Do you have integration with PAM?  I assume you must if you are
encrypting your home directory, since there would need to have some
way to insert the key to unlock your home directory as part of
single-sign on.  Or are you only encrypting something like the Private
directory on your home directory, and entering the password separately
fromo the login password.

One of the really nice things of the ecryptfs integration, especialy
on Ubuntu (and I don't remember if Tyler was responsible for that
work; if so, kudos!) wasthat it was particularly eeamless.

	     	     	     	    - Ted

