Return-Path: <ecryptfs+bounces-1194-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5P5XCNFZ02lNhgcAu9opvQ
	(envelope-from <ecryptfs+bounces-1194-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 08:59:29 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A228E3A1E69
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 08:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF2F73004624
	for <lists+ecryptfs@lfdr.de>; Mon,  6 Apr 2026 06:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BEF2E1722;
	Mon,  6 Apr 2026 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="qo2ijgYZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UwT6+kdF"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE58A2DEA86;
	Mon,  6 Apr 2026 06:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775458764; cv=none; b=lVgMnlKcX6otkWvZ8XNTzZad+R0A29CDdi912EkO5GD3sCGnHiUFq4S5HodRZy8JEqN4b91pjtVwiQfapUKVpVYC1jA/wMCIbJGONtYT4p3qQoCf7t/xyYo4ETkPNlb/3MmywJtikkMGhq25UAVYf7Q4DC/K06qbuiBnV1pvXIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775458764; c=relaxed/simple;
	bh=0MrP2AnJq1cmxkPRXg2ROaTt7EPbnd1RTbqgylZQYDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mULhApYFP6HIASsK3Wcb+garErArDDrck83xZl82CsXWBzH5uzVjV3ab4LrLe6NFt8oxG1hnhbaHRyCbMIV7Kpa20fZzynclqsv6UqL34lQouadBXcuEG3zcTWgso0ask2+O3c+Mpys48JqScjRhdPz4QuGzq6LXaQx64v7Ho8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=qo2ijgYZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UwT6+kdF; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id E8815EC00AD;
	Mon,  6 Apr 2026 02:59:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 06 Apr 2026 02:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775458761; x=1775545161; bh=4kTy+B0iQ2
	sDHEQUAkg3y1o6USV5OZb+wSZfs6E36zU=; b=qo2ijgYZ7wgp0Bch0rFD5MXE39
	vMFpk4ifv3WinTN9SBbnW0YI14I1BAKwkoXbORhTW6Sd8XpgVFJ7TdvpUnqVRiFR
	yhB/og9YJlq3KMybIynChWG24/NWW6iwF/F2/N2eTwpJPMcdJrjNtTcN4uT+CNtc
	ty5Q1yU9R2kvbwGmGgdTCOKKtv283qIBKUL87gws2SSXMQDc0vM/HH2KNsvTfylM
	eb4iCA0/jRLucgeKMTF9q6peX354QgxHkqAZUfk/jFPfmDHmaRJRT58wmo0/S1S/
	H51qqs0M3tXg9yMp5fmabGHWh6YblduPV94l8uU9079hxdekEE8CPcugTxzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775458761; x=1775545161; bh=4kTy+B0iQ2sDHEQUAkg3y1o6USV5OZb+wSZ
	fs6E36zU=; b=UwT6+kdFBz1ZDvQRQlFAjK/Am5QIPwmFlpMFS8N1cSkBUjkeOrc
	TH99Y9qX/ZKv+dNoF3L+dZskYWPqbpythG52KPeN0cRdG7xRogG9PKOK5ryR8PNM
	QDOJMJgq19HwofT9SM4tpH/Zjj859pK+mDVJq4BqDYL6XEg5w4gWvE9w2RnBMlb6
	zQgpr2xwvDoBWMRumqcl85vZeGTn0w1DCXXmGKUm1ZvlZmfAspZ84ByP7crEJzHc
	JXU6GsPrXZ42fAvVgdMfwEMYX071kYrFrkMOTT3mXRSKpFaHNsnhmMvTMmLWrcUV
	vne+KAhAmwrn8gAOmq6FG+u87PRJLdgT22g==
X-ME-Sender: <xms:yVnTaXR_BDTqHRtfpjm-zTFMNTj6bQetGekT6crzlYhEmxu2z15ZYQ>
    <xme:yVnTaQgAJzAiREmA-1VdW_9V_sy_1B4EsKGhUH9MnVzaUl7_V2VPO3wjDSbHPyLSO
    HReXHW11SCZg2tiEDBnuO-tlmeK9oV5eg25KMefqTwmJZ601hLcpQ>
X-ME-Received: <xmr:yVnTaf6uY-wiZUjHHpyqZwvsdrZdcgLhJGdOFFjPBQ5cbi6oRQHI6Rk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddujedtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    dvhedvtddthfefhfdtgfelheefgefgudejueevkeduveekvdegjedttdefgfelieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesth
    ihhhhitghkshdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohephhgthheslhhsthdruggvpdhrtghpthhtohepvggtrhihphhtfhhsse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:yVnTaVA3Y9Zjz5djfNDNcdk5hg5prndCvh1hQGTbp7IquYFWDVjCCA>
    <xmx:yVnTaeZ2gzc8esUOqnsmuYabQAF0ITdBRs4f-nkLE7EwcOKKzApCVg>
    <xmx:yVnTaYYEAzMQ8xVZHmUVJRV2nD_IAKuabsPbnlJCtPQXmbFa4oMjyQ>
    <xmx:yVnTad9eyzu-muUCeHStpH2lWAnq3JoYqvAHwc5iyg29kD5JkVofXw>
    <xmx:yVnTaVGe8EH8FoTGsFKdnRV6uAc9U0OhnEUfJnDQvSSM2Z95aky1--d4>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 02:59:21 -0400 (EDT)
Date: Mon, 6 Apr 2026 01:59:19 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Christoph Hellwig <hch@lst.de>
Cc: ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 5/7] ecryptfs: sanitize struct iattr handling in
 truncate_upper
Message-ID: <adNZx4T-Beljry59@yaupon>
References: <20260331153752.4049454-1-hch@lst.de>
 <20260331153752.4049454-6-hch@lst.de>
 <adNLfwLA4Iuvvupk@yaupon>
 <adNRPdonh5rP-nbm@yaupon>
 <20260406062713.GA17642@lst.de>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406062713.GA17642@lst.de>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-1194-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[ecryptfs];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A228E3A1E69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-06 08:27:13, Christoph Hellwig wrote:
> On Mon, Apr 06, 2026 at 01:22:53AM -0500, Tyler Hicks wrote:
> > Err... that was a bad suggestion. upper_size should be a loff_t but, now
> > that I'm at the end of the patch series review, I see that's essentially
> > the signature of ecryptfs_truncate() but I'm still not understanding why
> > we're sticking the upper inode size into the lower_ia.
> 
> Because that's what the existing setattr path already does by doing a
> memcpy of the upper ia.  We can explicitly pass it as a separate
> argument, but I'm not really sure that clarifies things as all other
> information gets passed in lower_ia.  I could add a big comment explaining
> all this if it helps?  It took me some time to figure out, so I might as
> well share that with the world.

I think the intent of the current code is to copy all of the existing
iattrs, from upper to lower, but treat lower_ia->ia_size as
"uninitialized" and calculate/initialize it accordingly within
truncate_upper(). I don't think the passed in value of lower_ia->ia_size
was being used anywhere.

I would prefer passing the new upper size as a separate argument.

The end result of this patch series is very nice. Thanks for working on
it!

Tyler

