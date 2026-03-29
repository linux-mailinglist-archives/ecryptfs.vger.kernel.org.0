Return-Path: <ecryptfs+bounces-1170-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJJdHxaiyWlD0QUAu9opvQ
	(envelope-from <ecryptfs+bounces-1170-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Mar 2026 00:05:10 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDFD3543EC
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Mar 2026 00:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4612830022F1
	for <lists+ecryptfs@lfdr.de>; Sun, 29 Mar 2026 22:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01442279DB6;
	Sun, 29 Mar 2026 22:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLxu+WFl"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19A6184540;
	Sun, 29 Mar 2026 22:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774821907; cv=none; b=YPk3L6Jpa0tFB66cAGswCz5h746qOgpQZ6BmI40dzeT6ScpgPfI254FmSc9qCBQJA7X/Q4cNXwJIS4/Kx4lGM7AMvkOJagbhD3HU9njsVl7H8ISQQJEPC6EC4wT/4NEjKjzzg/8V4qTHydNnVaarUGiX5pYFCB9saHv63Uo6Ph4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774821907; c=relaxed/simple;
	bh=UQgLvwsH0vhiiz6F1IM4aXHaQ/G/BgNyHwZku1v+6vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIkmU7v6cpYfY6CyZVGkcwo6rlszj+vuOcUnvcYaLHdH/DM7nMU6E+oc7flp/IYIZdhpmg0BKOT4hYEMUb01ae3nTGZ69extkuRQtlW+3cMPj5o9fsp/mbmzSrxcNqf7F+IxP8/TTrimfPkNHKfrX/Vg4oa4BRt0Zbj3yS3RlEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLxu+WFl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9003C116C6;
	Sun, 29 Mar 2026 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774821907;
	bh=UQgLvwsH0vhiiz6F1IM4aXHaQ/G/BgNyHwZku1v+6vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLxu+WFlul5HjtRj/SX23sIk7Qn6iXAJDjmtLMExrpzOrNkIjAfkmF2zwY+1tuVzk
	 1uHHQ4W+ahwz1rZAR+3P2lTqKEYu7wO6Xcd2DrnsnUt2C7CXckkzEitbDw+uq8oYZv
	 Wb1Jr1/HqD/BnovAdPJTHhSpqn5Zl/QIfmJX226x8FvpfRFce0HmkcRSGBorxuCiby
	 BkEnVyyK1hrCaO7TTN4jDsqFYC1l+79ErU3AjOHYSfbbr61aaaaJVrrIcnokaY5EET
	 UCH+T0Ih9zD0p76E3HbyX1Hn/V8556avVlv6Ond2C4FSp/qiHAXtupeIJ8qkOoNcxY
	 wnMLf8ZlW+2kg==
Date: Sun, 29 Mar 2026 15:05:05 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Tyler Hicks <code@tyhicks.com>, Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>, Kees Cook <kees@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Chuck Lever <chuck.lever@oracle.com>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: streamline offset formatting in
 ecryptfs_derive_iv
Message-ID: <20260329220505.GB2106@quark>
References: <20260329212325.371720-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329212325.371720-2-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[tyhicks.com,kernel.org,gmail.com,foxmail.com,oracle.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-1170-lists,ecryptfs=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,ecryptfs@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0FDFD3543EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 11:23:25PM +0200, Thorsten Blum wrote:
> Use the number of characters written by scnprintf() to zero-pad the
> remaining bytes, instead of clearing the buffer first and then writing
> the offset.
[...]
> +	size_t len;
[...]
>  	memcpy(src, crypt_stat->root_iv, crypt_stat->iv_bytes);
> -	memset((src + crypt_stat->iv_bytes), 0, 16);
> -	snprintf((src + crypt_stat->iv_bytes), 16, "%lld", offset);
> +	len = scnprintf(src + crypt_stat->iv_bytes, 16, "%lld", offset) + 1;
> +	memset(src + crypt_stat->iv_bytes + len, 0, 16 - len);

This isn't exactly "streamlining" the code.  memset(p, 0, 16) tends to
get compiled into just two instructions.  In contrast, a variable-length
memset tends to be several instructions to set up, plus a call
instruction, and the instructions inside memset() itself.  scnprintf()
is also a few more instructions than snprintf().

So I'd say the old version is more "streamlined", actually.  Granted,
the difference is probably only a few cycles, but it sounds like the
motivation for this patch is that you assumed the new version is faster?

- Eric

