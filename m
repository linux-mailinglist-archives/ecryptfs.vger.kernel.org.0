Return-Path: <ecryptfs+bounces-493-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68629BDAD90
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 19:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 560AA4ECAF2
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 17:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE903016F5;
	Tue, 14 Oct 2025 17:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="fMH2q/eL"
X-Original-To: ecryptfs@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3372B24DCE6
	for <ecryptfs@vger.kernel.org>; Tue, 14 Oct 2025 17:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760464357; cv=none; b=XXzsGaBhgbNX6viDnIy1EmPdzn9GZdchksGJ6DxC/wp95Qs3ZPMWHIrabeOD54jDSmI2OD8mvv2GtLfsubQIgVclvqmClLOj+q+9HCBzLfbAQuC25rh5TvniVh1sqMhX3RROVzuQzOjDdUpxa5cI5N4ARPRZ0TGOfLo3kNbafyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760464357; c=relaxed/simple;
	bh=FmjjXyYDKE/Yk7fJkAB+drvbulYa9bzAOTeJfv02M+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYEwZE57ff2f4kJzoJc0tzYg1EjniInvIlc2CSqW52J0+g+dz+WjXfMi9mvZG62eGp1wZZztQKaB+XV4S4QgN2lApWUCkjgDE4OWn/J6xvyF8WRiHfZieU+wrgpHinpRTdrMf68zAP31ljI3aqeTmChP+7lN3Ja/476dXbgx7EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=fMH2q/eL; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-113-184.bstnma.fios.verizon.net [173.48.113.184])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 59EHqIud022805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 13:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1760464340; bh=YsCObiDZn6NMNieiulOH3PG817/IZ49leYxhOnoaZrs=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=fMH2q/eLPINH4uQNwqu7tmB76SAQn3RBLsxgQAU/Bd97lgA0BSLKgMlnIbUHpanyJ
	 fWP4vQJ4NVu/v+CFqw2tuJVIO5z+YdXB7WkeH1enRdKLeRgxp1oP/yDqStk1Q+WEZH
	 9JeDZwjWUkfU7WtuOaMZYwFlbyilxzCJQdhhFs+X9a+kS0cFdH2A5YwbfXYreAgVYM
	 iaPZkp7Vo4+QE6mIEfwy5JlNdMuSSdFbHVBtZwxoNtiz0hOmYLexK5NM9y5sBpUgTj
	 jzWV+OVWxYRJgBlWRKJlxc9CCiCh9OPze+xez5mToDDyJFLXhZcoBDXC2sCpibvt9e
	 V0Nm/YwFL5onA==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 2A7942E00D9; Tue, 14 Oct 2025 13:52:18 -0400 (EDT)
Date: Tue, 14 Oct 2025 13:52:18 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: John Stultz <jstultz@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>,
        Arnd Bergmann <arnd@kernel.org>, Tyler Hicks <code@tyhicks.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ecryptfs is unmaintained and untested
Message-ID: <20251014175218.GB566507@mit.edu>
References: <20241028141955.639633-1-arnd@kernel.org>
 <Zx-ndBo7wpYSHWPK@casper.infradead.org>
 <ef98d985-6153-416d-9d5e-9a8a8595461a@app.fastmail.com>
 <20241029043328.GB3213@mit.edu>
 <CANDhNCpsoPcotnrjH6y0yEBf43652DRasSsEnAyEbrKN=tjEfQ@mail.gmail.com>
 <20251014143916.GA569133@mit.edu>
 <CANDhNCp=06eNkOqNX2dFrnYhpZX0xsEd06U1xCwORk1mwt=MCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANDhNCp=06eNkOqNX2dFrnYhpZX0xsEd06U1xCwORk1mwt=MCw@mail.gmail.com>

On Tue, Oct 14, 2025 at 09:38:52AM -0700, John Stultz wrote:
> Yeah, though to my understanding fscrypt complicates backing up the
> data in its encrypted form.

Unfortunately, yes, that's correct.  Michael and I did throw around a
rough design for doing encrypted backups and saving the encrypted
per-file encryption key.  Actually doing the _backup_ wasn't that
difficult; but doing the *restore* was very tricky/painful.
Ultimately, we never implemented it because it wasn't necessarily for
the Android/ChromeOS use case, and because we weren't getting a lot of
interest for the desktop, without which having a better
general-purpose backup is lower priority.

> I've wondered if maybe something as simple as fuse mounting a password
> protected zip file would do, but I'm guessing something a little more
> modern like a fuse + age approach would be better. Unfortunately I'm
> not finding anything so far.

Darrick is doing a lot of work to significantly improve the
performance of fuse2fs.  So perhaps fuse mounting a dm-crypt device
backed by a loop device might be a possibility?

	       	    	 	      	   - Ted

