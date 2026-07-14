Return-Path: <ecryptfs+bounces-1240-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BKkfM7fGVWrpsgAAu9opvQ
	(envelope-from <ecryptfs+bounces-1240-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 07:18:47 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BB975112B
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 07:18:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1240-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1240-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lst.de (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6049D30086A5
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 05:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EAC313550;
	Tue, 14 Jul 2026 05:18:43 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AB33128AB;
	Tue, 14 Jul 2026 05:18:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006323; cv=none; b=QOfIy2nVDyzDTgaqxuy53hY5PNmi9NUgf4MFd8C4w/uVap5hIOaRbfuSrWxnlJnTMmYSqvEYNWNUVoj0VYQh9KXdjDdi6j1YD/qexJB9en3VWPhA5pady7c2+QrwVZLObpvZJ1byKX6TYgw22Hdp2CAYIk/985rAC2p4aCJ047g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006323; c=relaxed/simple;
	bh=703JAzi6fC7A2UkmCVKXXpBIcqV6RmtZDpsQOvQSDC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+8SLyRtxF113IUNpP2aIDsN62+B2ipkOOhondPTvxhtMf4mic2Au7fzSp02nqhv1pQFeAgQNtXYX1WZ6ftrdYSBMbnvOZTV4cUOHuXKFAx7qLwWeYWrG1A2hhxXWLCoybwv1e789Z9zHsG6N2LgjPkDoD05EPpCC+OKepAjZ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Received: by verein.lst.de (Postfix, from userid 2407)
	id EE59568BFE; Tue, 14 Jul 2026 07:18:37 +0200 (CEST)
Date: Tue, 14 Jul 2026 07:18:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	Christian Brauner <brauner@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: use filemap_dirty_folio for address space
 operations
Message-ID: <20260714051837.GA31751@lst.de>
References: <20260703090044.1649-1-aditya.ansh182@gmail.com> <alXCix5IKavpp2Pr@elm>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alXCix5IKavpp2Pr@elm>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:code@tyhicks.com,m:aditya.ansh182@gmail.com,m:hch@lst.de,m:brauner@kernel.org,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:adityaansh182@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-1240-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,lst.de,kernel.org,vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29BB975112B

On Tue, Jul 14, 2026 at 12:00:59AM -0500, Tyler Hicks wrote:
> This looks correct to me and I've successfully ran the kernel tests in
> the ecryptfs-utils test suite with the patch applied.
> 
> Adding Christoph for comment since this addresses the concern he
> documented in the code comment below.

Looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

