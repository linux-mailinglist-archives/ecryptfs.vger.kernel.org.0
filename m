Return-Path: <ecryptfs+bounces-1232-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nk0wGhuZRGo9xgoAu9opvQ
	(envelope-from <ecryptfs+bounces-1232-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 01 Jul 2026 06:35:39 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B24FD6E9B50
	for <lists+ecryptfs@lfdr.de>; Wed, 01 Jul 2026 06:35:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tyhicks.com header.s=fm1 header.b=nbGLJH0c;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=LHp4grgi;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1232-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1232-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DE1A300C923
	for <lists+ecryptfs@lfdr.de>; Wed,  1 Jul 2026 04:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378AD3769F5;
	Wed,  1 Jul 2026 04:35:36 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2D367B79;
	Wed,  1 Jul 2026 04:35:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782880536; cv=none; b=Imdq9wTB8mEGsUKWH5/t3D0uZFw8NblK09lv/rRLw8ilFaizpQCwjKfzqSHodPZj7pzvyV4/nB99B/xS87DZX4ZqDPTbGdA5w8qQCFkj/UiUkrp0u7aSG5qi7lwqDce1hjhbCEZvrZbDxfyMa3tZFJQZUdtyGJ0AAiqq6mfdBOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782880536; c=relaxed/simple;
	bh=jlhXAwKS96ZrtHJqLFTAe225ZXxYvR8vVfQMSzO2V/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAtzGWRJ+6oJRuJboEvR6SuC0opqzRDZfeoiLyQbTOuasVT3pSXcb9oY3fg9U6FVOlovzGw3/a8uOumwdxmmWLcpjQb9irLxfZANgWIp84fPRKDoau1N8Mvt8mhTQFIj9x1HFnHxxg8IKkWQQEgAHNf5oscDLc/d2EopoSNNKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=nbGLJH0c; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LHp4grgi; arc=none smtp.client-ip=202.12.124.151
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id A90771D0010B;
	Wed,  1 Jul 2026 00:35:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 01 Jul 2026 00:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1782880533; x=1782966933; bh=elkrL/WEgH
	CG6v9F+/YSthtKoiuBvlkgam9E5LgdDss=; b=nbGLJH0ckPFU7uIH1cXaqROO2M
	fWl9oHUmAMU5xsVrNS7sWk39QlILZWEWgh9ncOcbbJXrcCflhKkm0ZTdpuhhOa8C
	S2kjztiFnsRY4hUDN3g/2v3VefbLXmWxYpdV+xMsmFODRF5DWGXh6Cv2Vgd7HOX8
	MccR2lFaZQN6OAHi6HtMndMiNB5Rlz4GHIBawiXu3UYYqcp39luUrgzYlEg8iP/g
	pMMBHy6ESdjJaTySzckbihpZCNAjFzQ4l8diUxDCgyaF/GcN7f0d8ePi+9r/UB9F
	I3LcQIlHczZo8RMb9E9xU3p5RdiNgCeX50Ev+XradSPnBiBXrKn32JpwasXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782880533; x=1782966933; bh=elkrL/WEgHCG6v9F+/YSthtKoiuBvlkgam9
	E5LgdDss=; b=LHp4grgiZ8ZseoU59sm5iAr6Lg2GAv28c4uwgh5zSfUBd5phrpN
	DmFHIoIl0hm2NCSWLg3o59R71CH6dGBVYRaipoxHiGFbYgporipbFd1N/0ThiatG
	xH8sK96aPvVxdlyHD0Xp3M/t3sIyX6wFKda1EYjz+E5EaM/7Ymp3XQ/MMwchEnSd
	EozkFmdNSq5wScS5jQfj4B2wkUIxhOe6zUGNTr09gpNNP+4aSp8tEjMqnSCBNRIa
	isJ847pEDCy8va0HkU2ONUMQSl0v6Od1KdqHtwSvRWH12WdaOzGjJJnP7JIHVbu1
	IZUHGd5IAY5zWjrG6x0vYwjvfUD5K/RE40Q==
X-ME-Sender: <xms:FJlEavauIdyDntiXnAV5bPG1gf8pvv8rdTlJEiwnbOEmVxJglXM8sQ>
    <xme:FJlEav6s8SHogXk6hExvK2Nv7s-jlsB04PY4oQi74-Ec3oyZhLIrYc69pNyOpkxQB
    ZkL_Ctp6qU-obABaDpolQ_jGjjnUJjXiotDUTkJzUkI8vbabRWlq6M>
X-ME-Received: <xmr:FJlEaiCZkIhNDMHAoLyXPtc11SFGsP_ip2h4BbEeWVy3HLzK3OfeEUI>
X-ME-Proxy-Cause: dmFkZTFdo6PvvftRQvnNFsyv3s2tnWrXaux4MOO8d/y8NZR7T2c8AChGbydOSs6RFNHBwS
    Oy3Rv5miW6jpE9CeIucgnHUbwf+s/PQhyLqdRaos6m3poyJva3eWy2igj5XaOHB21K6mCV
    h4fkSNmwEgRxsqAbkCHHqcPdw1sJ9mZY44YoIh45FsMPEl21pCJQ19CfQrFcoEIVeajjt3
    aPAoIgkceK6YOc9oMh98w2IBp6utwrFS7iEROOLbDOe+23I9lH39sAnrBACMvBeGycjnqz
    rwb9eexEEaSNKFviZpj4Lkhyncyi4AR9+wduiAusXZypXHPwGFxY/NU+KDNxwec46Ef2oH
    rglzspogRnImHizCZxCJBm+wWolat3Jz9EH2GAGf4lVdU6qqGqIjjTvB8g6o4EhAIHSIpP
    FoZpzwwGnqO7q5r7bHcR+S+DLHO5LLr639ymsAVX6nJx7lUIj3BF1aiQk9R5x3Z2sBFXbW
    v7RKPTAJ5BoH19OGM3tbr2vI8URBRtQJW11iJ8mGh3RZu2PaomI73iM60krtT/HhmR+NpC
    qpIeoVwxqWCj0mL+a/XwloXvVUSrLW9KLt9ofzhT1Xhrnwjto3cgrzHwyy127pnK9im9Wd
    Uc2udxJV1xxOHLNUkEOSHvT00utMzah92X606Wjmdk9qq0wWSDXDndpIpjZg
X-ME-Proxy: <xmx:FJlEaldMoPzYRBeSnH5Aiq-oNtPrjrwIfR7lOL9QJv_7s3haLbs9jw>
    <xmx:FJlEahLzQ70Zhn6LIysKdYREo8ZNH6JcX_JkRwSCragmiud07L-UTw>
    <xmx:FJlEag3sWUr3EeWNMl4aCbWT6croO6STdIYRxZETyhdMCo7kBo-tRg>
    <xmx:FJlEajiKHJ0FOVpVqH3-qR5rxTspWeO79MfVuaxQy52ipu95T2o-Vw>
    <xmx:FZlEaoiNP9_czsgVO3zrULIBzJJjuF2NysFdgrzfAFTxXsEQ3x6_In6R>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jul 2026 00:35:32 -0400 (EDT)
Date: Tue, 30 Jun 2026 23:35:30 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Yichong Chen <chenyichong@uniontech.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Taotao Chen <chentaotao@didiglobal.com>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: avoid heap allocation for inode size write
Message-ID: <akSZEhSVoRRVLyRh@yaupon>
References: <20260630030800.191457-1-chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630030800.191457-1-chenyichong@uniontech.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chenyichong@uniontech.com,m:brauner@kernel.org,m:chentaotao@didiglobal.com,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-1232-lists,ecryptfs=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,uniontech.com:email,vger.kernel.org:from_smtp,yaupon:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B24FD6E9B50

On 2026-06-30 11:08:00, Yichong Chen wrote:
> ecryptfs_write_inode_size_to_header() allocates an 8-byte buffer only
> to write the encoded inode size to the lower file header.
> 
> Use a stack __be64 value instead. This avoids an unnecessary allocation
> and removes a failure path without changing the data written to disk.
> 
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>

This is much better. Thanks for the improvement!

I'll put your patches through some testing and then respond when they've
been applied. Thanks!

Tyler

> ---
>  fs/ecryptfs/mmap.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
> index 2c2b12fedeae..0222f98143ab 100644
> --- a/fs/ecryptfs/mmap.c
> +++ b/fs/ecryptfs/mmap.c
> @@ -355,24 +355,17 @@ static int ecryptfs_write_begin(const struct kiocb *iocb,
>   */
>  static int ecryptfs_write_inode_size_to_header(struct inode *ecryptfs_inode)
>  {
> -	char *file_size_virt;
> +	__be64 file_size;
>  	int rc;
>  
> -	file_size_virt = kmalloc(sizeof(u64), GFP_KERNEL);
> -	if (!file_size_virt) {
> -		rc = -ENOMEM;
> -		goto out;
> -	}
> -	put_unaligned_be64(i_size_read(ecryptfs_inode), file_size_virt);
> -	rc = ecryptfs_write_lower(ecryptfs_inode, file_size_virt, 0,
> -				  sizeof(u64));
> -	kfree(file_size_virt);
> +	file_size = cpu_to_be64(i_size_read(ecryptfs_inode));
> +	rc = ecryptfs_write_lower(ecryptfs_inode, (char *)&file_size, 0,
> +				  sizeof(file_size));
>  	if (rc < 0)
>  		printk(KERN_ERR "%s: Error writing file size to header; "
>  		       "rc = [%d]\n", __func__, rc);
>  	else
>  		rc = 0;
> -out:
>  	return rc;
>  }
>  
> -- 
> 2.51.0
> 

