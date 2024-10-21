Return-Path: <ecryptfs+bounces-189-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878399A5BD6
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 08:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F06D2828BC
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 06:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9196D1D04BB;
	Mon, 21 Oct 2024 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="T0wBeubb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G57Nv/sm"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1321D0B98;
	Mon, 21 Oct 2024 06:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729493912; cv=none; b=bpMkDTVE+69O451RsT67F6yF+NgWEe5/Zikz/q4NhNe0ZD6gRFvGJ6hMExkzM1R0Zb3RyORHRq++5xThtoec+Mzv/gMC4AWrOlyMCxhJTu2Ry1ulDSJHiWbDr80BjGbQqkr3UrnhMyaqC5lRQk7nWgeZruMRlR6PAfSGN97bnMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729493912; c=relaxed/simple;
	bh=8oRf9XVhKWLtRu83eI29NTiAnn5/E0C75gqv2oerKaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SpmgYdbJBffCnTJkWxyVTc6riQ3U5qtWG8LvZuAteL0niHjEjhKuK1wl+UiAiTRR04TJGYrcpz9DeFji39e0htjN9yFWKpJmR3tzzqWbTEmcLGjHaJRIcUWQRj62f7JaiM+xyXHx7SEOVpuK+CissVbLyfNIj20HHiUGn3i179Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=T0wBeubb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G57Nv/sm; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id A81501380247;
	Mon, 21 Oct 2024 02:58:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 21 Oct 2024 02:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1729493909; x=1729580309; bh=8oRf9XVhKWLtRu83eI29NTiAnn5/E0C7
	5gqv2oerKaE=; b=T0wBeubbKvEodxIveByGQKZqqLxcf2amuU3iAn+o/KCtvR6B
	PJtcr4p1YMQu2opJ3KWm5KcTKlu/ayTjAF0ZV6Zrky3shnmLBME0rXYhpAqzho8c
	Y9nHYXCreD9r3UJ9vcFOPhI7cf4wfqJo+LEDpbDx5BM3q+K0PNflM6ajKLZ2G43F
	eIi1h5Ns3XuDvZMBAPRqOvFjDoUJLXUcNcpGTYM0HF8os9sK4wmDWF1iRhUuDGk6
	61SAar8Jzc+YiZsKrcUzBcr7OnzyvcGTWZf30QWnXjk6diJpCgd6bRD3plXUb7TX
	9uQSVsb1tJHm9nYltZsPQKs+QtgZo8+4S8ixQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1729493909; x=1729580309; bh=8oRf9XVhKWLtRu83eI29NTiAnn5/E0C75gq
	v2oerKaE=; b=G57Nv/sm6xMD47PMjmj8olPcLmTJBKQnONmBzIe3/xvyEr/XE0h
	mpMsnRkTYcO7U9wN8++B7DTiocZrG5sDV2GibGsVWs2s6xNhWttyBcI/yV3o6sOR
	LQ90LxlGlaN8ZnngCldd9LvcmhqGwYvz19oW/IIb/AX/wzHe7id//huhQEq+lKd/
	HFGDxNApoq2gYr90GUA+wRDZZJnuntoVb0dCehQWriYe9aOa4OA/3XK6YGuQ35lK
	vr6aCu4sRcrK51ICm/avFM/Ax+WKb3EWTquzrf4US1H+dd+CYWKNKCufH8djZ7xd
	uRO157GarDc3mhDfoSjxgFE1PKHzt4OssFQ==
X-ME-Sender: <xms:lfsVZyBtHqWuZ3wIqd9boUd96Y-Tq-tCD7gxCex3wakd4cFkasIMLQ>
    <xme:lfsVZ8hSdUWX3LWh9xZkt6I2wkAb0rQN26HkyabDpMYSfdMmiDr3FCASXeCyJC8tC
    fmrj8VYuvF7SasEmKk>
X-ME-Received: <xmr:lfsVZ1lHFLN8Y7ZMRo7nlCVj8ohNMOKUljAfqVnVe8xEdaDt8s6Xdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehkedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggusehttdertddttddvnecu
    hfhrohhmpefvhihlvghrucfjihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqe
    enucggtffrrghtthgvrhhnpeffvdekffffffekteehgfdthfevteetudfftdeigffghfei
    tedtgeegjeehgefhueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghouggvsehthihhihgt
    khhsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehlihhn
    uhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegvtghrhi
    hpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhgruhhnvghr
    sehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:lfsVZwzDq7DTDLUj1mlvcUdDdngTPP5fxdGwT8ZUqXNi_Jy-1c65Sw>
    <xmx:lfsVZ3SYsv2K8S6E_c19SpkIJvTSCK1csraMXCd6hvnOKJ3cGV7J-g>
    <xmx:lfsVZ7a92R1pMeobfDh6dAmznRAw07YSH_1Xg4EX1O2c9GvuevHLvQ>
    <xmx:lfsVZwTcjIB6JKBPXnKtlwR3zn8KLvtyz_G5HAHI6oTaLPY4ePK9xA>
    <xmx:lfsVZ1NnVKysZSRfPW3-wdNV9FyE7Q4TeoFjkw0VeBNlytwxP6EzqMSJ>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Oct 2024 02:58:28 -0400 (EDT)
Date: Mon, 21 Oct 2024 01:58:26 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	ecryptfs@vger.kernel.org, brauner@kernel.org
Subject: linux-next: Please re-add eCryptfs next branch
Message-ID: <ZxX7khzjUaDOpfOt@redbud>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen - Earlier this year, you dropped the eCryptfs next branch due
to inactivity. I'd like to request that you re-add it back now as there
are some patches piling up to bring eCryptfs up-to-date with the new
mount API, folios, and a few other trivial cleanups.

 git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git#next

Thank you!

Tyler

