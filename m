Return-Path: <ecryptfs+bounces-1214-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEO/KzXu1mlYJwgAu9opvQ
	(envelope-from <ecryptfs+bounces-1214-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 09 Apr 2026 02:09:25 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5373C4E62
	for <lists+ecryptfs@lfdr.de>; Thu, 09 Apr 2026 02:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4259D30014B3
	for <lists+ecryptfs@lfdr.de>; Thu,  9 Apr 2026 00:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5B1F9D9;
	Thu,  9 Apr 2026 00:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="qfkl7ylb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aIQ7vJEG"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BED9443;
	Thu,  9 Apr 2026 00:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775693315; cv=none; b=GF34Pw0a2e5wF+yRzZZhgBCmfh/rAc4iDCpctbluWk/MjksegN7UVy0x76Rb9Bdm8bD3KzXCzNyuo5oAxSDV0c8mELjx/Beu7HXnhrsFFMLcrdaZXP+HOLcGWY+C0g498aijIxgoXzwrfm3wB3yw63WEB+tjGEIHrqEcXGCMmvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775693315; c=relaxed/simple;
	bh=N0Cps7UntECLGaAVGiQMr8gGUdV8Rv8ZspYaDdWb/dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHSMbNDVm0nFnzWgZqtKqsRO8uFPgZWzzUaEZS4NtjFhIuglNqz9a1QMR1CRN2JfR1W+51beft6l2OOiibKjprtGMghTJq3KnwkNn1o8DMXrOo/9TJ9AN/2/AUxrsJdjJ+9GXSNRpltP5RRoQi+CAzKRKTl9U9wU1Aj8Ld7fu2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=qfkl7ylb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aIQ7vJEG; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 755F37A0096;
	Wed,  8 Apr 2026 20:08:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 08 Apr 2026 20:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775693313; x=1775779713; bh=/lD/53cfRi
	BLzUCJk3u1mN5tnby4897Uo/MAXFDzg80=; b=qfkl7ylbZskKyxeaPdJApzS3g1
	dpJK/vZcTnXgUIQJLQ0K20ienSHQFSOTyH7MS6JABBHcysV1dtGm9VZeZsPRC5+s
	nY2V24vmx7WHQyQlqu4QRYhhjuPaj4NfU60aE6Km6E5PwFdg83GJjLGJl/K07nVE
	8RFQF09o0evOozmLmP8PhkHzhiZJ1uRevsVP3Et29U6wKool8V/uhWKt3bfzckf3
	o5wfiY+NFUYFr+wvMLw3ob7O9iZ74LwP4WWlCjrtHU+BDFkRkpbtcMaWQIs8b7NM
	XbI2CyA+WNTAz11EQypsGU+t9iXFwJjHNvAnIcUMykK1cjcSD8ScvlppkgiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775693313; x=1775779713; bh=/lD/53cfRiBLzUCJk3u1mN5tnby4897Uo/M
	AXFDzg80=; b=aIQ7vJEGG8v4MbXxCeR0NipAjM2u3JOFImZ7Mef9X3OJ5s7PSaf
	PNo5+11Y5mrPyxQp4p957rs75SWzPwSw39z4PvWwXIU5DnGRwNij07fRHAN8lzam
	DT63HjFI+DKWcyi56HP+osswLiL0Qht+DUg0mo5WMHK6D82iOYBdrYD78mlsZoSf
	rI2sQJH9lLYii50tVBb6oB5RJqEoajlKfWyfhppr0iqyMgI3tmyL95lmiPQUsJz2
	6wInZ36DovxDPun8xQ3szfgz4ZOGRIFfxJpzOXDWNlW9QJ5O5czS1kuUGZvHC6nm
	a2HqgDkjcJ1JIbaWP6J10578V3zAGd3mo9Q==
X-ME-Sender: <xms:Ae7WaQjMKP7qgtayQZ3GK_7jrC9RiDG3xguFcUMB3LwwdKb6pTyYlA>
    <xme:Ae7WaQyT2M7rsIkfNTx1HnzcUx9sNd12azujVcbD68uf1R-AyX-njn-vYE3zdo8wj
    xuep4pZClCLNpA367M2xmmxe8M5ZJuisyvcdjFbFl3clMsKSvJ3-uUn>
X-ME-Received: <xmr:Ae7WabLfxAfqtBe4NMiNuujFlp4Loo-ny15qNtRjmwU-6W8QJXeuIgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvgeelkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    fggeekieffteehgfetffduhfefjeehvdejhfejkeduleffudelhfefkeeiledujeenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheptghouggvsehthihhihgtkhhsrdgtohhmpdhnsggprhgt
    phhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhtghhsehlshhtrd
    guvgdprhgtphhtthhopegvtghrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:Ae7WafSrds5XMlS4X6XXsCPOF_VxobJzkTPyX31lJI8v22aZMh_G0A>
    <xmx:Ae7Wabp4xxFvROi0DSLtLc8jnGqz4PppQadh6aTBd9svMgcVCT9Zrg>
    <xmx:Ae7WacpDDMO7VaoE0W1kSdAbp6cCdU9m2MIweqzFEwCD52qBA434Ng>
    <xmx:Ae7WadNmQimb5Oht24c_3-sMeekoLq0S8nCoUlv-Zmo2JnLyDMdrPg>
    <xmx:Ae7WaVUDnFviTFadG1zNNa21qZZg85go5nOtSv8caBeISA5_psbRuTDl>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Apr 2026 20:08:32 -0400 (EDT)
Date: Wed, 8 Apr 2026 19:08:18 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Christoph Hellwig <hch@lst.de>
Cc: ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: cleanup truncate handling in ecryptfs v3
Message-ID: <177569313058.651226.4527748422361374416.b4-ty@b4>
References: <20260408060719.714317-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408060719.714317-1-hch@lst.de>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1214-lists,ecryptfs=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,tyhicks.com:dkim]
X-Rspamd-Queue-Id: 0D5373C4E62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 08 Apr 2026 08:06:35 +0200, Christoph Hellwig wrote:
> this series cleans up the truncate handling in ecryptfs.  I did
> it as preparation for some changes into size changing truncate
> VFS interfaces I'm looking into in the moment.  The changes have
> passed the regression test suite in the userspace ecryptfs
> repository and against the ecryptfs next branch.
> 
> Changes since v2:
>  - change the calling convention to only pass the upper ia to
>    __ecryptfs_truncate
> 
> [...]

Thank you! This has been applied to the next branch of the tyhicks/ecryptfs.git tree.

You can find a direct link below but please be aware that the commit hash is
unstable and, therefore, the URL may not be valid in the future.

[1/7] ecryptfs: cleanup ecryptfs_setattr
      https://git.kernel.org/tyhicks/ecryptfs/c/8f61364322a07ff6c35691b575d6fbda8e71e29d
[2/7] ecryptfs: streamline truncate_upper
      https://git.kernel.org/tyhicks/ecryptfs/c/b109187378615e683d8d8a24f4bc246bd3fb7b26
[3/7] ecryptfs: use ZERO_PAGE instead of allocating zeroed memory in truncate_upper
      https://git.kernel.org/tyhicks/ecryptfs/c/b19fe74e0fc970cef90bb78ddb473ae0356bce94
[4/7] ecryptfs: combine the two ATTR_SIZE blocks in ecryptfs_setattr
      https://git.kernel.org/tyhicks/ecryptfs/c/472dea1d2235439c0c25850d53deffc517cc8c61
[5/7] ecryptfs: merge ecryptfs_inode_newsize_ok into truncate_upper
      https://git.kernel.org/tyhicks/ecryptfs/c/081447ecfc255cb63b6e392cd01d9f684d4df5b8
[6/7] ecryptfs: factor out a ecryptfs_iattr_to_lower helper
      https://git.kernel.org/tyhicks/ecryptfs/c/5d1f0e8cd9482ddb5318f765f7ca508ce707cf83
[7/7] ecryptfs: keep the lower iattr contained in truncate_upper
      https://git.kernel.org/tyhicks/ecryptfs/c/e836ec1819b0cc50e0b45a53b0bdce6c596f0207

Tyler

