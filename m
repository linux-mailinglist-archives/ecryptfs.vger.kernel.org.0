Return-Path: <ecryptfs+bounces-1186-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIdeMz9K02legwcAu9opvQ
	(envelope-from <ecryptfs+bounces-1186-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 07:53:03 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F89F3A1AD1
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 07:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46C5D300E5F7
	for <lists+ecryptfs@lfdr.de>; Mon,  6 Apr 2026 05:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C2F3382C9;
	Mon,  6 Apr 2026 05:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="pUc2oqIL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pQJBx43J"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D43090D7;
	Mon,  6 Apr 2026 05:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775454775; cv=none; b=nGY2VB0RrlnnMkaUiXor+AjgwzPH7mheTw/ldjQ5KfXa4UEpBm0efi1Us7P2U8nj8Eir/Y1rXJ7XbnaAqFd+P75+E7Yslb2ZEwZ9oJP1JmMu/OoU7tpdVVymTr+7CK5GZd3u3HLfClzNg0N4ccAfOfe144r0Us9m27+ywtz+Vdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775454775; c=relaxed/simple;
	bh=1WgEqhl99ogH1et3aI1qa583uYYjV6tIKBcpf73Ci9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOCVXjsxaFhjR11g5MKtpb1SzULHxVW9SlqTfhwIKotkQEel+KegJJ7DZ9yGYjEefe0cRTJPk3/FTBnYyEpG3OEwKjDVKyg1KhLe+UyfRg6Wsx0/AmZ70MwUFlYn9M4benR3YDX5zxNdvJ6Uma5scCx5yo7B2OLGbIdbFUstYuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=pUc2oqIL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pQJBx43J; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F3FDD7A001C;
	Mon,  6 Apr 2026 01:52:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 06 Apr 2026 01:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775454773; x=1775541173; bh=KBlRfk8I4J
	t0gnzRm2EEHFPhWp9w3kxqYyNT4FXi9wY=; b=pUc2oqILC4fa9DJ7RwEJAzIO58
	qEzwyCDnz4kJ8W53hamJDDeMUktyOtidy422dWrbJEgPhR36SDzChWHuRftKJm6+
	FhElK7kuuLI9mutYZKwYPdF2UFPMiAkC0254qFUITBzWTrNw680Y8ysnTDAONTRF
	2IyfAm1oHs6vBF27ebvEV7H2LvW3kn5zGk2kyVjoRj7/aIBIowpN9IA5Hcf3NhSk
	WrutvvnrQuUkspiHx7mXPfQUnJuTYmjPwUKm6EmEKbe7mQGfNtmuXUCN96hZnX8T
	ipgV1WcK60B3JmYkDquz8ktMmly9kyLUs6kPBGDogSDZsDXVj/mZD9VuRQhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775454773; x=1775541173; bh=KBlRfk8I4Jt0gnzRm2EEHFPhWp9w3kxqYyN
	T4FXi9wY=; b=pQJBx43JgS3M0b8QsTrAuXQBhH17X9eaj72m7P3qhxD0zQIe7oB
	LelEjajPHv+i6trjC2xJELQUP5kdJ5Wz/EzY4LdHhcH8mPI5zEZDfLg8itKx3TGB
	Hz32bM/DyAPkkYPlamE2tA4wFRNVIL+NsQqCqxBF1Hzw3gEgNCuD2Y3gY3gf0VDn
	aClLBRKed8oPcuDtCV/ifPZ/GI4vBDlClYNn9qRMIukcJZrmWBPUGs97q5RtilEd
	bxsn8hrhAWBmRvRlWx4tkU4yUl0XfC/i4ez4xDhWFS4FruHst1G6A44na3Mwzh2I
	zxGk4ZzPO5VE2gbr6Or7EmMYbb5XbAWIwSw==
X-ME-Sender: <xms:NUrTaVkejDYbfsbNFBivAqOCl64KjRuhIfZGzyk1RfpZ-a_ynoj9GQ>
    <xme:NUrTaYllwy2ce_zuEjT2hzEpYFDvUS3sVWlhWrIGpYkfhO_PKjZL8A5B1qCGNBMwo
    WcoqLLvoDmfEcBy_AsyXwcKNIo0MqckLeYOmureOu1E3X-HCwk6uw>
X-ME-Received: <xmr:NUrTaevMGNxfV6DcZ7HV3KQwopm5R4KzbCfOVvB00I8-VaL7CPh5aKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduieeklecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:NUrTaTnj37u7V2GJVE1j02Qy6f6TWbaF2xO9VVy7w3wdVuZExknaew>
    <xmx:NUrTaRv_13hEHzj1au3rOMYbpcCRrUtMzvjO5i7yq1O_b612FWTMQA>
    <xmx:NUrTaRehPH1qynMJMnLNO1D5rqpoIkxozO2XvmcmDZwHKdvL8zEjdA>
    <xmx:NUrTaZxOqaxKQqwuVw0HqniWYIxAm5UttT27igEI-Kuj3ggcQS11zw>
    <xmx:NUrTaVLYGggEEClCWIIKDzbzpsXAuSKDXY-8o8PBYZE03PbxwInkRPvU>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 01:52:53 -0400 (EDT)
Date: Mon, 6 Apr 2026 00:52:51 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Christoph Hellwig <hch@lst.de>
Cc: ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 3/7] ecryptfs: use ZERO_PAGE instead of allocating zeroed
 memory in truncate_upper
Message-ID: <adNKM-8zHwrR6AbI@yaupon>
References: <20260331153752.4049454-1-hch@lst.de>
 <20260331153752.4049454-4-hch@lst.de>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331153752.4049454-4-hch@lst.de>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-1186-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[ecryptfs];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4F89F3A1AD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-31 17:37:24, Christoph Hellwig wrote:
> Use the existing pre-zeroed memory instead of allocating a new chunk.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Nice improvement!

Tyler

> ---
>  fs/ecryptfs/inode.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 46dc867a8860..57df35a22e9c 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -771,15 +771,8 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
>  	 */
>  	num_zeros = PAGE_SIZE - (ia->ia_size & ~PAGE_MASK);
>  	if (num_zeros) {
> -		char *zeros_virt;
> -
> -		zeros_virt = kzalloc(num_zeros, GFP_KERNEL);
> -		if (!zeros_virt) {
> -			rc = -ENOMEM;
> -			goto out;
> -		}
> -		rc = ecryptfs_write(inode, zeros_virt, ia->ia_size, num_zeros);
> -		kfree(zeros_virt);
> +		rc = ecryptfs_write(inode, page_address(ZERO_PAGE(0)),
> +				ia->ia_size, num_zeros);
>  		if (rc) {
>  			pr_err("Error attempting to zero out the remainder of the end page on reducing truncate; rc = [%d]\n",
>  				rc);
> -- 
> 2.47.3
> 

