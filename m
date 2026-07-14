Return-Path: <ecryptfs+bounces-1238-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rhXhFKbCVWossgAAu9opvQ
	(envelope-from <ecryptfs+bounces-1238-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 07:01:26 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5837750FC7
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 07:01:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tyhicks.com header.s=fm1 header.b=kE+VslfX;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=JnE06WuO;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1238-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1238-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 964B330528B0
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 05:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F532DA757;
	Tue, 14 Jul 2026 05:01:06 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52BD2DC791;
	Tue, 14 Jul 2026 05:01:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005266; cv=none; b=rWo6UoC4V+O4rpQBrfGYgrHNKGoukLVM6W7PC4XDxNbWPPtaSiodh6amOxFAzJIVrB4wZHhhhqSelSFlHd5rAjZnij/icJqBP55cUMvvlpoRVRKNBdng7HGQPrNw96QHKPWCDzYLTddfsyC3KV4E+OYkXZ1X52sb/Hyfy0avebU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005266; c=relaxed/simple;
	bh=r5kVwbzZXDrQt06gepry3W29dv0WR2DwavXWHYXyt5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7zCR25nf5Wr33w/HcFeT3R91bOsb+mJ4BxfbYnjfbB4MJ4JjVVtL/qPvKnyZx5Blvpl+vtBuUA1J+HvAghDCbzgWeQJJghF1B1nM98YCPEPEQ5DIdMYzvXvi1H3hzTPooW413ZZ0CDK/KbdwXka8aRmM9peNdf0SOn0YPloQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=kE+VslfX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JnE06WuO; arc=none smtp.client-ip=103.168.172.147
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 1C497EC0177;
	Tue, 14 Jul 2026 01:01:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 14 Jul 2026 01:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784005264; x=1784091664; bh=+cwBk161SS
	3UuNqbC94GvXgpGs2bozCaS5y9RituKbY=; b=kE+VslfXkGkezhMQ/hxZ+B0IYU
	FVuBfJ7BwnnLa1jNWwcqlj5GnhrDa0kRoDOVbOlJ4LPAE6mpo1Py84tVqaQfGvMO
	q0zlvMcgcP1x1tRL3xoJMoPz5DVgbWqJRtFF8/LWkJ7TKnJ/DuIlKD2AiXwoizTh
	N+YoKkR04pv7j3V7hUkxaSj5pITB+ZwhtGzGiSPsK2PmSfASBaaYuiWZpum1xHoT
	rzJ31b6OU+Fo6cWolgJNMrWGwoU08uvLZsYGpc+BQeeeV9Hj+lXNCYK0iUS4ixi8
	4KUmgLZysMrGnaTN0ZQ7epk7KODJtGW8f0xNpZVZpA8oGz+55u7G9MnreD+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784005264; x=1784091664; bh=+cwBk161SS3UuNqbC94GvXgpGs2bozCaS5y
	9RituKbY=; b=JnE06WuOEg5c6qCpWjfPLbc84I59xuA/yFpElRKOgAAGIZwQTwt
	CYLenYpllenmrAPbzUpOrXJFz0lrJqq7WzgOnflQaq3ckyUDb9L7WiHlswj4RpK8
	73Ay3JknuoFqS3NNpd9cIHB/MwkFT6HZKyJtz4XQjJ9KSZXZvxWhlx/o5MladNre
	HZJ3QWJvw8vQsm2qOYhd3fqvDnaRv9cQE9e+Rb5La3tRQxsOpiDNsVqex+HvJJRS
	ZNw1p/vF+2EWbAnAq+lK4jr0PoAYrzZsQgIc5PbWvC4v6U76FCZZ48Mf3XEoVMVz
	UAbFdi4eWsLUHaxybWoV/q1meNsheYcD0oQ==
X-ME-Sender: <xms:kMJVauXiLY0apxgReGyHENCCn8RjgaZTZXw_wmc7WC0tb2l6fULqdQ>
    <xme:kMJVasGDIJ237ABDMa0bPAZ76NmcDgAi016paNO0MJ6vvK7fawBcAXmCuEEOmf-os
    KvsRiMy5oOLajwBpXw8gD20PGJ044ztI-TPUqAztSAsdRgGnNaC6Ug>
X-ME-Received: <xmr:kMJVaic8OSa4zjxSwTjPN74P_CFaDGV7ZzQF-uIIr6ulSA_w2d-xJiMZz7QamthKcEqwch-MLE9aJrel>
X-ME-Proxy-Cause: dmFkZTGcNI4D8OeFqi8luv7qzpUT1BY9mHdEHCiQV2jLC6iP5sG2sSt/c0k0x8+DEX8q60
    TrxMe16cE9IB8/VrvXMOvz8It0w5hg5gAAWjPUHntblebgmBAh844pKc+vrAw4YJM4Lhbr
    kTpk8PNv2b++Zdb1m1yshRVqjZceDgs1X6FqCJ31VqwxGwE7PfAPwba5gy3CqMj6YRHNf0
    ynMeJjL33bzdVbY/fdj+cZAigwFK8grFn8kyE+4B9ksjt31phmT7+cEe5JUwF4dYvmTYfJ
    HbmgCno0RSvlBF6YpvV2FHsHXwiYfZU4DINJK85e/Ce0xs1qMdG3I1g1vCURbxSN3pXbj6
    Hgmrs7z0/vJEFMTND15bq3kCCwKcSp7dUXZj+IkjTwkIx+axwfiM1Sb61lN/suQNNK9Mav
    eFH1XWZLO4vLHM06oELO6vazYZsDYV7XgZU+ufqhQd2ecPJ0pbI2ImOSQ3P42KitGKkKfP
    HwnvahAFQDww0eiEhHtpb+8obAAtWKYin+S7XOWGjO5jFnCpCtUJMC+vSibKxi1GsNd3ry
    4OQWKMSctJ6cmR06yStTyrU71lBPoJSYJbDl6lGzqrckgIkaPEpiqiD0+900/KtqVxd6R5
    V4kEND14GNpjYxkyt0miPHAgrMtJSMFSvvSSElD3JZL/apqRo70/ze3ZmkVg
X-ME-Proxy: <xmx:kMJValIAWvwBb9P8eLmMrsOp7f5xnk2V0v-fj11NZ1obehg02MlOJg>
    <xmx:kMJVavEWbQzYt3mmow6-ljGtLEeujYahs6kXmWVbnBU4eToUt9mdCQ>
    <xmx:kMJVagCMrGjP9JXEgQClYJrjyeOJ7vC1tzOGdHOjJewhH4hng3kzVQ>
    <xmx:kMJVaq_2AvDgvt6t9MLqJwDUejjkpZFq73HYV0KJDWPbwwFZ-JWwwQ>
    <xmx:kMJVaggRPfIryuxfA40_j88EGosaxyVAEfuyHNz16_-71VcS5qKjfrmt>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 01:01:02 -0400 (EDT)
Date: Tue, 14 Jul 2026 00:00:59 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>,
	Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: use filemap_dirty_folio for address space
 operations
Message-ID: <alXCix5IKavpp2Pr@elm>
References: <20260703090044.1649-1-aditya.ansh182@gmail.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703090044.1649-1-aditya.ansh182@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aditya.ansh182@gmail.com,m:hch@lst.de,m:brauner@kernel.org,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:adityaansh182@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[tyhicks.com];
	FREEMAIL_TO(0.00)[gmail.com,lst.de];
	FORGED_SENDER(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-1238-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5837750FC7

On 2026-07-03 09:00:44, Aditya Prakash Srivastava wrote:
> ecryptfs does not use buffer_heads. The legacy block_dirty_folio and
> block_invalidate_folio mapping operations were only added as a
> temporary compatibility fallback under CONFIG_BLOCK.
> 
> Since ecryptfs does not attach private metadata (such as buffer_heads)
> to its folios, block_dirty_folio is unnecessary.
> 
> Modernize ecryptfs to use filemap_dirty_folio for its dirty_folio
> address space operation. This allows removing the block_dirty_folio
> and block_invalidate_folio fallbacks, removing the buffer_head header
> include, and removing the CONFIG_BLOCK dependency inside ecryptfs_aops.
> 
> Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>

This looks correct to me and I've successfully ran the kernel tests in
the ecryptfs-utils test suite with the patch applied.

Adding Christoph for comment since this addresses the concern he
documented in the code comment below.

Tyler

> ---
>  fs/ecryptfs/mmap.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
> index 2c2b12fedeae..a057472b409c 100644
> --- a/fs/ecryptfs/mmap.c
> +++ b/fs/ecryptfs/mmap.c
> @@ -510,21 +510,8 @@ static sector_t ecryptfs_bmap(struct address_space *mapping, sector_t block)
>  	return block;
>  }
>  
> -#include <linux/buffer_head.h>
> -
>  const struct address_space_operations ecryptfs_aops = {
> -	/*
> -	 * XXX: This is pretty broken for multiple reasons: ecryptfs does not
> -	 * actually use buffer_heads, and ecryptfs will crash without
> -	 * CONFIG_BLOCK.  But it matches the behavior before the default for
> -	 * address_space_operations without the ->dirty_folio method was
> -	 * cleaned up, so this is the best we can do without maintainer
> -	 * feedback.
> -	 */
> -#ifdef CONFIG_BLOCK
> -	.dirty_folio	= block_dirty_folio,
> -	.invalidate_folio = block_invalidate_folio,
> -#endif
> +	.dirty_folio	= filemap_dirty_folio,
>  	.writepages = ecryptfs_writepages,
>  	.read_folio = ecryptfs_read_folio,
>  	.write_begin = ecryptfs_write_begin,
> -- 
> 2.47.3
> 

