Return-Path: <ecryptfs+bounces-188-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A509A5AC2
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 08:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E313228204D
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 06:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC1A1D0148;
	Mon, 21 Oct 2024 06:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="JXHEEjuM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wdon8jUS"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225F51D1F4D
	for <ecryptfs@vger.kernel.org>; Mon, 21 Oct 2024 06:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729493197; cv=none; b=eSSaebUqFYTQdr0/VK2l9tQIU4SqMCKgZPuQCLkIfyiT9sXOeDGoB6szUWl7rSQRGjkiiKpLIVMwANSa66Mhu8FUkNIIC1VaooDohjQ7OXrG4Qb3ndRwnjwi03n+EHe6Mb/Ii/gZuDUOjWYGvXCmyWJGQmcHTMJJEGZqk2AAw0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729493197; c=relaxed/simple;
	bh=cPJIbQ3w2wFDCg0q10WGPUhHZ96KoW3KljRhD3ugU2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LX5f2hOhDhJClFeZ4v3hdmqXFXnvWArahmQhBrJ7CdCAYvFch7E4CCnZUnOKt7MZs5UWNzfj1Uyk+KnYnvfxw6UkkpT+9xo9FgVpV4mqiQnq6DAfP7PqD+EW/3xzJGA5jDy/c6LYHKnGL9kDjR+3jWlwhh7zgIR4ZFvPpwoq0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=JXHEEjuM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Wdon8jUS; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 349691380225;
	Mon, 21 Oct 2024 02:46:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Oct 2024 02:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1729493194; x=1729579594; bh=rUdWcEOdfA
	mAjIyYhHjMDT82oi7lReFXs9XXY1sm8Y8=; b=JXHEEjuMFGFkgi0sniObEali0W
	hxTdaNIzXXFA8Rp8kI8wOsUBXntFdVNWsr7p9ry5ER4YcdVSQgDRmFup2MUJVdxB
	Rg5+usdQncJOlHpZQboAkoVeM/6oT53aMZ79yIBGmSt+axruHGA4ojpRZE7lGv1k
	tapSgfr/wWhONel6BkXdFmZi8Ee30ESEHMLSVUhGHqwHj7l5dGq2a6ieDE+rW4Ev
	RFCNtA7LCy0sGPW7hsILAiCzZZmyzPmv4wLZdoNCbj9bnLj9DZRnDwufK5WqMN2e
	JDv78yQvNMAU2wXavRAZal0uqxYPHH9tvtdsq+qkFQ/hcZgc2g8NBz6e8yKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729493194; x=1729579594; bh=rUdWcEOdfAmAjIyYhHjMDT82oi7l
	ReFXs9XXY1sm8Y8=; b=Wdon8jUSx+EZndHUqa0Ls9N7iu4ztQZSv8hGx/ULolHe
	W0AQ8EDuP50+sTy+fix55QkAJ9tOE2RBWNKxwEsVBflJFkDrocV3h6IUIvmz8pWz
	Jqi+hgHRAMbXlJqYbHCp2SdVIaYsq0LVOy1g4GCKyFjmgQdjPrWkjHELSNjdZeyh
	XvaHJ8EheNitWhsdavFIIUB7R4odgYTtD+UXFdjJH5T1JcaHEWt+7h9qCpEP/4hO
	kUBK0bSozqYjfHSrR8RrIz5Qi9pwPV6lJFJ2j2cu64o2JSfYKIGeXpmESA/ImQ0X
	Kp5LVoVufpgQORVI5q6oLeh54cTZbycTFkvKii1l6g==
X-ME-Sender: <xms:yfgVZxP6x8n_cCYgnr0wPhZjU__WDQTmVSpJiDnNbsFzfK-4JwFjww>
    <xme:yfgVZz-oTODVt-WdQ1VkoB5OjEJEu_cOhzKnO9m42KhZGoJDv74_Vysf1HYG2YRFd
    rAYIvQqGKsOvALd1oM>
X-ME-Received: <xmr:yfgVZwSVQBMttENfVDnFn0hx_vbgz7yi_2jWITRwT_vyHsgAoEPLew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehkedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefvhihlvghrucfjihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedvhedvtddthfefhfdtgfelheefgefgudejueevkedu
    veekvdegjedttdefgfelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghrtghpthhtohep
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepiihhrghnghiivghkuhhnudduse
    hhuhgrfigvihdrtghomhdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopeifrghlmhgvihgurgesmhhitghrohhsohhfthdrtghomhdprhgtph
    htthhopegvtghrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegthhgvnhhjuhhnuddtvdeshhhurgifvghirdgtohhm
X-ME-Proxy: <xmx:yfgVZ9t29FSRGmzfG7R__37r-pOCaFRMUh59H2vWKGSj5aB0TTtdtA>
    <xmx:yfgVZ5chB4cJBDW05DDUpO0X28IUvxKPkUBNyNdO24y6vh41Z9JYpg>
    <xmx:yfgVZ52TUVBXDWqUYAkZnEh3dEazHPDV4-UNqrCXfnhf4j5OpXr7GA>
    <xmx:yfgVZ195tCppsi-zALOBfpWpFrABZXWvzCyTMS8kYmeWkIj_lJMIpg>
    <xmx:yvgVZyEh3MR5OESNzjxlmxcPZm8GDxz3q-6IbSEo5lL-sEFMC4cV7OGC>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Oct 2024 02:46:32 -0400 (EDT)
Date: Mon, 21 Oct 2024 01:46:31 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: brauner@kernel.org, walmeida@microsoft.com, ecryptfs@vger.kernel.org,
	chenjun102@huawei.com
Subject: Re: [PATCH] ecryptfs:  Remove unused declartion ecryptfs_fill_zeros()
Message-ID: <ZxX4x4h1QUtIy1Au@redbud>
References: <20240906061241.20010-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906061241.20010-1-zhangzekun11@huawei.com>

On 2024-09-06 14:12:41, Zhang Zekun wrote:
> The definition of ecryptfs_fill_zeros() has been removed since
> commit b6c1d8fcbade ("eCryptfs: remove unused functions and kmem_cache")
> So, Remove the empty declartion in header files.
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>

Acked-by: Tyler Hicks <code@tyhicks.com>

Thank you!

Tyler

> ---
>  fs/ecryptfs/ecryptfs_kernel.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
> index c586c5db18b5..b3bca2ebec24 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -551,7 +551,6 @@ int ecryptfs_decode_and_decrypt_filename(char **decrypted_name,
>  					 size_t *decrypted_name_size,
>  					 struct super_block *sb,
>  					 const char *name, size_t name_size);
> -int ecryptfs_fill_zeros(struct file *file, loff_t new_length);
>  int ecryptfs_encrypt_and_encode_filename(
>  	char **encoded_name,
>  	size_t *encoded_name_size,
> -- 
> 2.17.1
> 

