Return-Path: <ecryptfs+bounces-492-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB1BDAB6D
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 18:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 279A91886927
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Oct 2025 16:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74B5303CA3;
	Tue, 14 Oct 2025 16:54:12 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail.lichtvoll.de (lichtvoll.de [37.120.160.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEAD226863;
	Tue, 14 Oct 2025 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.160.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760460852; cv=none; b=t9FSSjTtZcp7iXXXX3CutkOWBkhsnkJ1sXVpu1/3BnPpn9jUB7u+Sk59rUUDE5Nte8m1sSB9cNPHgwDoLMl3kpnMH+QHoRGLdv3sPnV3llSQ5N4Og2ox3On+iZXr+FcStQsDy0eACLioUqREiDvB2hWJBjlcN6/6+8AVQjN4kh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760460852; c=relaxed/simple;
	bh=MNtlUW+Go4VHKes9wK5C1QaotOof6YwbDxBautYjEuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vise3GsoAF/5Y0Os7zB+FqhgZ+dYjulzsBNTrQfEiue2cgos6lYHeDAtVGrAqKuBVjN3ka1wNLvhmxO4A2F9t2ez0jYWWRpkr8IVLaIpQKD0bNnVd7WNKjk9YfVSBWdqlls6S+8DJfR2gNc2CbbBtu+wxiiSH8lq+wENNDxLAiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lichtvoll.de; spf=pass smtp.mailfrom=lichtvoll.de; arc=none smtp.client-ip=37.120.160.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lichtvoll.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtvoll.de
Received: from 127.0.0.1 (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.lichtvoll.de (Postfix) with ESMTPSA id C3E0B156B3B;
	Tue, 14 Oct 2025 16:54:07 +0000 (UTC)
Authentication-Results: mail.lichtvoll.de;
	auth=pass smtp.auth=martin@lichtvoll.de smtp.mailfrom=martin@lichtvoll.de
From: Martin Steigerwald <martin@lichtvoll.de>
To: Theodore Ts'o <tytso@mit.edu>, John Stultz <jstultz@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>,
 Arnd Bergmann <arnd@kernel.org>, Tyler Hicks <code@tyhicks.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, ecryptfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: ecryptfs is unmaintained and untested
Date: Tue, 14 Oct 2025 18:54:07 +0200
Message-ID: <4682858.LvFx2qVVIh@laptop>
In-Reply-To:
 <CANDhNCp=06eNkOqNX2dFrnYhpZX0xsEd06U1xCwORk1mwt=MCw@mail.gmail.com>
References:
 <20241028141955.639633-1-arnd@kernel.org> <20251014143916.GA569133@mit.edu>
 <CANDhNCp=06eNkOqNX2dFrnYhpZX0xsEd06U1xCwORk1mwt=MCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

John Stultz - 14.10.25, 18:38:52 CEST:
> Mostly I avoid dm-crypt for personal files as I want the majority of
> things (family pictures, etc) to be as simply recoverable as possible.
> It's only for a small amount of things like email archives and
> tax/financial documents that I'd like to have it be non-trivial to
> access if my backup drive or desktop was stolen.

See my hints about CryFS or gocryptfs in my other mail as used by Plasma 
Vault. I believe it might suit your use case quite well.

-- 
Martin



