Return-Path: <ecryptfs+bounces-1231-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vRYPIXqNRGpfwwoAu9opvQ
	(envelope-from <ecryptfs+bounces-1231-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 01 Jul 2026 05:46:02 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A777A6E988B
	for <lists+ecryptfs@lfdr.de>; Wed, 01 Jul 2026 05:46:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tyhicks.com header.s=fm1 header.b="+cB/uZg5";
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=ZADKGo6U;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1231-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1231-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAAE1301D311
	for <lists+ecryptfs@lfdr.de>; Wed,  1 Jul 2026 03:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9BD286D70;
	Wed,  1 Jul 2026 03:46:00 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4F718DB1F;
	Wed,  1 Jul 2026 03:45:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782877560; cv=none; b=QOwzynNMrnjGn9o/FGpAQhvpZX78O0iFfmYbMEhvEtLu88etVlWcss9tTdLgUxRcUiY2i8VH2uMgsMYURpEE8YKIVRVg6bANUYN6lmkJtJsVeFqGXyO+xwUWNluafjdSQCs3NOFARIZcLjf7roOQ3JVfUTizKhzSKwYYZbr09yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782877560; c=relaxed/simple;
	bh=eaPBH/6sdGIqblv7TIlSP66nbTGsiuwEXH8L4y0Onow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkTEgKEy82ezGQ+8YPjSF3MPt6ogE2krJxeVXUBsaaav92fDjioWiseR0bZurx6slsC/eyEYu8sV28g0Hc795Vf7aiBse8H3NDzvz3pewuH0xOvgQDrj/AComN3WqGxDRaViocenYu4HQsnFTI79w0YMyhItsVhSdnVDo+76IHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=+cB/uZg5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZADKGo6U; arc=none smtp.client-ip=202.12.124.151
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 5AEB11D0011E;
	Tue, 30 Jun 2026 23:45:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 30 Jun 2026 23:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1782877557; x=1782963957; bh=bAuxncmnHq
	mUQ7YU8kZ0VntL/R0qZmlPNJTnrZed/GE=; b=+cB/uZg5pJgL2vBqacfSkAuSj4
	jJIReiHE0nPeoYlR5++T5OtI3PAtnwQBu6QsVzXfjoMqVUJIOGaILw8JcextACF/
	rqNMOr/L94Uckt6I0fYPryGFxw4twzZLkETeVgmfqR4Jexx+Gl00KWtOmRqmQ4Kx
	Iy5BBf+9SmBa+9P6pOqpc5DX5QagJSeqO0TzgBsM98RKhD9Vg4WCktKZxY0czhjV
	/d0wolkqJLTrx+0eUBoLq+Rn9Lsvdxuay8uYsvCxcy51T6SNpgOzgkiLzd3/oUxB
	4ErLyrZRcApo5YhTRMf2bfZGpRu9kvCCkg2P8WMqZOeB+GOnmiMFovlA/4fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782877557; x=1782963957; bh=bAuxncmnHqmUQ7YU8kZ0VntL/R0qZmlPNJT
	nrZed/GE=; b=ZADKGo6UqWzOXg4avdWhr8qZz4Nf7jHgqKTl2hM3cMvfuxvrEGM
	95D5dru7uWjJmU0dlaVsWd1c1huIgyFVgw1vhIj+GIrj8eVLtxjNKhU3mWTA59Ej
	TDC1CSxLXcIziOYmg9dW8OCLFZ+hc3ERlnmNquBpr9jp0ZamKlfUO5WjHOASjl5D
	N0vF7Q9QQJ9sY5RmkMKks8l1sdgvJJQ1orC32Hs0VbcUMMzMyXqKkavxl1ksRuQY
	Oi4UtZGtcAmFiTrigCiNgynbDkaeUhSwxnKMOCp9ZvZqm2mstbhoG0WBYTrfXCQP
	ZjyPx3JG1BeTqDMFY6jUwQnADXc73YzGs3w==
X-ME-Sender: <xms:dI1Eaqz6GaIpX553wctDyhk5VLIeTJHvjd5dv5iZKjD3UoJ_NJkH6w>
    <xme:dI1EanxtdyB3Z7AekNAAZIV2Fj9OaERfmt9WSHj_J11dl9ZPr9rPX4eqNP8cs_Et5
    rJCHW48Kh7XHz0YB-Yazrft2MlA8JuAXZ3Kw1ne_q6hh4Yp7Nvdx4Po>
X-ME-Received: <xmr:dI1EasbCnMpBeGvtOPms183rJWRJlrvAz5GmY0pNyco15B_wPTnN50U>
X-ME-Proxy-Cause: dmFkZTFqXvXPjdywYh6eNJ2k9qv6UonLtrcRwhCxN7q7nY/sDQZ06gg9vG63yU/E7sXnxh
    pxLC/OL51vz4GtYiiF7lvhW/gVPXsBqA6BqJVPVW33EN1LypfZZK4m/V3UJHs2DFRm/epb
    I7oIk8qnpuq5h3IwbQiTJLk7AcrRCbK1h+RFaH6ThtSfhP6Z8I/YmD3he5oR1CUs8h8665
    rYCTz/UAyL7BqVLT3+ARVoSgr1OBXI4c37LihQcKClOqyRfsaEHzlpnteZnKBm6X2P0+KX
    mYSm4+L9jR6aviY2a/1r2AMkFx/v1d2ey5FwHGDMTPxhNlZDmuhnOr0dMOYD8qPJdLjMSh
    4tVm4vAVLVbAA6TEUQymyM/zRBDK3q4g0kZIWQ0UnX77S9C+I9PEaTXkUKkC+/YzMi1H0r
    uBgifz8DwjrWFDQFDSFESDL07hI/v/KGDSVlfAx+1PKsi1P3EOshY/YkvGAd2rdvSPNdhG
    VPnwI+SyZYDz0ejmyQLyfV5BliLsR6xKxLxPZgVuIUSbiXZlMWzQ0hJV5y1qnC6Ygfwwn7
    71kMtCeckJeL6nXTlaV4KbJ9IHQU8Oud+fSM36zTgxFanaNfzMHPfMmPcMu3PxOscXM0Ri
    7+j3U3QdBOBkdZGsxKBCll6eye4vZo5ZIF3vXSaBXYNl0cqb6uEEVdIPStFA
X-ME-Proxy: <xmx:dI1EagUsQWJXvx47HbgoI8zJB-XI8DNXQ6rlT_mjo3DKQpHZ7VFiYQ>
    <xmx:dI1EaiiEIaQai9Nv32X-FeQoQFONyKxzudx7WajBThxys6x9eA8jpQ>
    <xmx:dI1Eamt2Uns6-PHDiNJceJFOpId3oLpo3sxYPluSZ0kZuN4wXboRkg>
    <xmx:dI1Eaj7o59VMG0Rszl7MUPogRh2IhEjlnJ_iqgnGdYT1EoRj_i8J5w>
    <xmx:dY1EanvZzPN00SNtEiyDJJbz8dlUcIOhoKeFq_tDSfNnt-ZMCgkPsRdI>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Jun 2026 23:45:56 -0400 (EDT)
Date: Tue, 30 Jun 2026 22:45:38 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Yichong Chen <chenyichong@uniontech.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, Kees Cook <kees@kernel.org>,
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: release message context on send failure
Message-ID: <akSNYl2MglViekHR@yaupon>
References: <20260627090126.27607-1-chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627090126.27607-1-chenyichong@uniontech.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chenyichong@uniontech.com,m:thorsten.blum@linux.dev,m:kees@kernel.org,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-1231-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tyhicks.com:dkim,tyhicks.com:from_mime,messagingengine.com:dkim,yaupon:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A777A6E988B

On 2026-06-27 17:01:26, Yichong Chen wrote:
> ecryptfs_send_message_locked() moves a message context from the free
> list to the allocated list before sending the request to the userspace
> daemon.
> 
> If ecryptfs_send_miscdev() fails, the context is left on the
> allocated list and cannot be reused. Move it back to the free list on
> failure and clear the caller's pointer.

Hi - Thanks for the fix!

> 
> Fixes: 624ae5284516 ("eCryptfs: remove netlink transport")

I think the correct Fixes tag is:

Fixes: f66e883eb618 ("eCryptfs: integrate eCryptfs device handle into the module.")

Do you agree that is when this bug was first introduced?

The rest of the patch looks good to me.

Tyler

> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
> ---
>  fs/ecryptfs/messaging.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ecryptfs/messaging.c b/fs/ecryptfs/messaging.c
> index 03c60f0850ca..d53c21e82365 100644
> --- a/fs/ecryptfs/messaging.c
> +++ b/fs/ecryptfs/messaging.c
> @@ -284,9 +284,16 @@ ecryptfs_send_message_locked(char *data, int data_len, u8 msg_type,
>  	mutex_unlock(&ecryptfs_msg_ctx_lists_mux);
>  	rc = ecryptfs_send_miscdev(data, data_len, *msg_ctx, msg_type, 0,
>  				   daemon);
> -	if (rc)
> +	if (rc) {
>  		printk(KERN_ERR "%s: Error attempting to send message to "
>  		       "userspace daemon; rc = [%d]\n", __func__, rc);
> +		mutex_lock(&ecryptfs_msg_ctx_lists_mux);
> +		mutex_lock(&(*msg_ctx)->mux);
> +		ecryptfs_msg_ctx_alloc_to_free(*msg_ctx);
> +		mutex_unlock(&(*msg_ctx)->mux);
> +		mutex_unlock(&ecryptfs_msg_ctx_lists_mux);
> +		*msg_ctx = NULL;
> +	}
>  out:
>  	return rc;
>  }
> -- 
> 2.51.0
> 

