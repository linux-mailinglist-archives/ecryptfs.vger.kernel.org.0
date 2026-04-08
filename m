Return-Path: <ecryptfs+bounces-1204-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOmzMA2r1Wm28gcAu9opvQ
	(envelope-from <ecryptfs+bounces-1204-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 03:10:37 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D23B5DD7
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 03:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F45930107E3
	for <lists+ecryptfs@lfdr.de>; Wed,  8 Apr 2026 01:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF80F192D8A;
	Wed,  8 Apr 2026 01:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="flCTnGJR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OJMvNuQx"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED76C3191A5;
	Wed,  8 Apr 2026 01:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775610634; cv=none; b=KWWJXY3eQPLgprkakZPr8uvzQO5cmn+bhmrBvi451/JfVGDMWnPmhGnwlcx/tHKyyW6E8V8Sh8EGF64S0u5nU3p8SiK8W8PYVrm6Hg9HZjsWWX7hlzfwWal+VxinWquAgFmcJ2XJR+AYF2tfjXqdyv5zLzUK0Wsg0JUdT+w8HmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775610634; c=relaxed/simple;
	bh=X/vMTQg9Mg7optEV0JTWExto9WjwKniw/bC23pvy7pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEZg3Lw9jWXpIljpN9a5Tw7fom59BoNGsEcaHJ/VTv+ix9bQh/RRMtRHnb76YwB1vinXnaR8E/P84eFvnBmVEgzQR6mHXUeECRLu7f9kltB1Fxq76m8P+659kEvORhj/nSEmg0wgESZZAG2P7fke/3LHzsAh271AH1iSMJ787/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=flCTnGJR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OJMvNuQx; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 157F77A0260;
	Tue,  7 Apr 2026 21:10:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 07 Apr 2026 21:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775610631; x=1775697031; bh=XwjmQG1Z6q
	2YIpUddDTDKCwUA8dhQbQ+9xl0vnD4fmA=; b=flCTnGJRBjNc+p3V/SyD2ZUWkN
	Fxnu6sGSMj3FsCVYCv5sA7kJcUni3xz7p0awTndmwZzy6qCf6Pyom5uSpldNj53l
	NcJ65vOXz2ew6gfFhm2FryRqGLufCgufHpuWyXgIbcHjXY1b/MHoDjcjb0E1xxr7
	iADVDHhg8BnbfRF9LiDcgxzZwKP4UjoIoOgx8n5TUWiK9cgpCDE4xG10j+FVn8/V
	0kTWfOT6vgpw8iAY3peuLnUqH7JygpR/LgQ4E5kt5DHhQb3VPQWpllSuGIiSfwd8
	VVVbP79F2Ews/H4fbLGtF5xOkvD9OLGsJ6BeCvVDGAs7Usd0NY1jF3+sRObg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775610631; x=1775697031; bh=XwjmQG1Z6q2YIpUddDTDKCwUA8dhQbQ+9xl
	0vnD4fmA=; b=OJMvNuQxQdgGd4hnFFnnSGozLGfWAzfLwTFVVSmE3fELI0AhiWb
	FiCzbk8v8GNZqtXT7GQo6Wm1Vc/N4a08zY+gI4zUK26mWc5xRZXmsfDG7iV8x1A/
	ngBrRUVLY2Vayj9G3ZiHDw0jHAd+FPIV3ziy6MxrDjIkyKwRz4hd4HVewXsXVn/E
	ADa57Do4t6GH7onNwCqkMs5idVoml7yNVKW7Yd13unw7n6IneVi92kFTPgjJGbWy
	tobDmqVQMFGmW/sffbTyopk1bxG4pKkaz6KfIAOPR7+b+n/y8rGnuadDEdzQ3YaB
	EV9p/eN/pWZfC/1x99Psf5eYi1Bos3iFuGA==
X-ME-Sender: <xms:B6vVaZZJm1Z6aEPhRDDiiw7a4e-MRvgpLawS6nOfOpkOq_0wCdXrqQ>
    <xme:B6vVaYKcTTe-R8MxMeRZfaIpq9sJdG2AvjynEL7JLxlS9vSSuU4aiZ_95LCuojXbZ
    9V5-QJYQCz7TXicwOqWJTzoqd2Atks-l2xjL3zn8vzyvzM5EKv0ym8>
X-ME-Received: <xmr:B6vVafDq4bTM13Lm7JqvGhb4jOGaGr4JP2XQ9eEUf1OTYhMAFjXIuMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvvddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    etfeffjefgudekleduleeljeevtdfhvdefhfejhfehgffhtddvueellefhgfelheenucff
    ohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgs
    pghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhgthhesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegvtghrhihpthhfshesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhfshguvghvvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:B6vVaVopFr3CNV2LKVh0L3kJtxZqu7dIOR-MkAI0nkD5s3GYtvvSbw>
    <xmx:B6vVaSiBYQQqYUNAEMl7KynMDms5yvXXadFIRxuIiozh0jaIzaSj-g>
    <xmx:B6vVaaCunJsacfnd_Hs4Bmg_vrNMPjV2WZ_U0iPHo8MIDro8ZltrlA>
    <xmx:B6vVafEnBDBp4B1brQsuZJlw4l9aHyNFx0pycMM-wtcofNZg4yLdLw>
    <xmx:B6vVaRdYYLm4WKOw2UIALAP7F93vy1eLIcNNEycHKA5i-kVZPAt7jnQt>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Apr 2026 21:10:30 -0400 (EDT)
Date: Tue, 7 Apr 2026 20:10:29 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: cleanup truncate handling in ecryptfs v2
Message-ID: <adWrBVPMUj0otxi_@yaupon>
References: <20260407140329.633186-1-hch@lst.de>
 <adUZs-oTFj5t1Lnh@infradead.org>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adUZs-oTFj5t1Lnh@infradead.org>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1204-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:url,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 052D23B5DD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-07 07:50:27, Christoph Hellwig wrote:
> On Tue, Apr 07, 2026 at 04:02:36PM +0200, Christoph Hellwig wrote:
> > Hi Tyler,
> > 
> > this series cleans up the truncate handling in ecryptfs.  I did
> > it as preparation for some changes into size changing truncate
> > VFS interfaces I'm looking into in the moment.  The changes have
> > passed the regression test suite in the userspace ecryptfs
> > repository and against the ecryptfs next branch.
> 
> So right after I posted this I came up with an idea how to better
> pass arguments to the low-level truncate helper as the size + lower_ia
> kept irking me.  The branch here:
> 
> https://git.infradead.org/?p=users/hch/misc.git;a=shortlog;h=refs/heads/ecryptfs-truncate
> 
> simply only passed the upper ia, which feels a lot cleaner.  It passes
> the ecryptfs test suite, but otherwise is hot off the press.  If you
> like the new version I'll send it out tomorrow.
> 

Yep, that's the right thing to do. Thanks for give it more thought.

I only had time to do a diff between v1 and this branch. The code
changes look good. One tiny typo in a code comment:

s/file systen/file system/

Tyler

