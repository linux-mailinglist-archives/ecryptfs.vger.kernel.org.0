Return-Path: <ecryptfs+bounces-1171-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FVKMBzLyWmK2gUAu9opvQ
	(envelope-from <ecryptfs+bounces-1171-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Mar 2026 03:00:12 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B413547DA
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Mar 2026 03:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AD0030068E4
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Mar 2026 01:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7615E1E8332;
	Mon, 30 Mar 2026 01:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J/6K/Zgk"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBA51B3925
	for <ecryptfs@vger.kernel.org>; Mon, 30 Mar 2026 01:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774832408; cv=none; b=iuvqbODcEXf6jk9OFledOnmVkqq2Ewe1RYTkPP04DouQiGF/0mTrGndiSU+86vD+ymh6M3MZusdGoqrlpQE0I2pgIufnNC23lTOSfc8qOjD6yEbx0ZzIVQZC/nz3NVWCpQfrq6ALiVQbFVEKMAgm5Qze1RVjQT30hQ4Ii2B9W+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774832408; c=relaxed/simple;
	bh=+J7pPGEUpKBcW+QOzkRfuIByZT9NG9m+m8SvCRtj5Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2fYqjbHR1EsJJJ5dzaX87ZG68AwSEZbOvBrklIalOgrANdip3CrV+YjUgUtZeYnqQM0nK7Doi3uVlvj5WBucM9gtiCxpY9cuOEIFSn2dzCfOj7ffBIHf7U78eA45rh2zlx7TofcyKzcJVKzOHFCZ6HuQU2t8YjPk9kimGob35c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J/6K/Zgk; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 30 Mar 2026 02:59:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774832404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ugBzSA5QR6FRemSPq+/Fu3zXNcqHwz0L7cwtobdfOIE=;
	b=J/6K/Zgkjj59VbIaKkxIIILd76+2ykBE5LZBiwUojx2iiWyBUAPvTziCildbmanqoIPcbM
	zOBYU7MPo5FJmsmbh4tF6PukL0FFvO+SqlICc46kn8egQ33CzrZqBHVfU06WYETK3IDYII
	l5Y5EMYgLQTth3Y57hYhaQf+TwdVAnY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Tyler Hicks <code@tyhicks.com>, Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>, Kees Cook <kees@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Chuck Lever <chuck.lever@oracle.com>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: streamline offset formatting in
 ecryptfs_derive_iv
Message-ID: <acnLDxr4UF1dULrm@linux.dev>
References: <20260329212325.371720-2-thorsten.blum@linux.dev>
 <20260329220505.GB2106@quark>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329220505.GB2106@quark>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[tyhicks.com,kernel.org,gmail.com,foxmail.com,oracle.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-1171-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,ecryptfs@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C2B413547DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 03:05:05PM -0700, Eric Biggers wrote:
> On Sun, Mar 29, 2026 at 11:23:25PM +0200, Thorsten Blum wrote:
> > Use the number of characters written by scnprintf() to zero-pad the
> > remaining bytes, instead of clearing the buffer first and then writing
> > the offset.
> [...]
> > +	size_t len;
> [...]
> >  	memcpy(src, crypt_stat->root_iv, crypt_stat->iv_bytes);
> > -	memset((src + crypt_stat->iv_bytes), 0, 16);
> > -	snprintf((src + crypt_stat->iv_bytes), 16, "%lld", offset);
> > +	len = scnprintf(src + crypt_stat->iv_bytes, 16, "%lld", offset) + 1;
> > +	memset(src + crypt_stat->iv_bytes + len, 0, 16 - len);
> 
> This isn't exactly "streamlining" the code.  memset(p, 0, 16) tends to
> get compiled into just two instructions.  In contrast, a variable-length
> memset tends to be several instructions to set up, plus a call
> instruction, and the instructions inside memset() itself.  scnprintf()
> is also a few more instructions than snprintf().
> 
> So I'd say the old version is more "streamlined", actually.  Granted,
> the difference is probably only a few cycles, but it sounds like the
> motivation for this patch is that you assumed the new version is faster?

I meant "streamline" as in write bytes once.

Maybe we should just zero-initialize the 32 bytes in 'src' instead and
keep snprintf(). That removes the need to keep track of 'len' and also
gets rid of the explicit memset(0).

