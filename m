Return-Path: <ecryptfs+bounces-753-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDFECDAA83
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 22:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1277B30B9E87
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 20:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9C630DED8;
	Tue, 23 Dec 2025 20:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="kshVM/Q8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BHFfTgaN"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC6D20DD48;
	Tue, 23 Dec 2025 20:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766523444; cv=none; b=ooR5PHPmumx93q1Q5Kuib15dkZ+i9X9HZyQpdGvO6qa2Pq++BCiwVo/yO8Nq0CPhkYQOJ6ysX7l5wPIxJkWwmizDMceHhmpuSIU/7xHSiM7sMpQeh6Abn9qMYln/XTak1M1IBe/hJUhnOyPXnaAW62nHWfTZQHh1ZtVI8x/qdYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766523444; c=relaxed/simple;
	bh=D7yGhGUJW83lQE4mFvTOhPn1IeHrp+Ur4iqCvxptNhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqILNS++ibNo9YJuFvuM5voJ6tylXwDlIyZK+ReRUv9XDRpudHhkMQ8k7aeFncg+sBQa7X0j9V3D0vOxqmue2enlsgHtkohxPvVYbKs0obrm51ZmrmSVCvVkr6kkHmmtMxNcP+xSk+rn4lAtoSyGxrvitRl+9ox9S94L/1M9PSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=kshVM/Q8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BHFfTgaN; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id AB5411D00037;
	Tue, 23 Dec 2025 15:57:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 23 Dec 2025 15:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1766523441; x=1766609841; bh=uGXg8ZxwvF
	02UHhYTQhZh8q05iCfPjot7cAdyMcJ964=; b=kshVM/Q847cnLRjjFnXwoS0A9P
	Wq7c06YACacSnEhlgP5YaZbf1343x1/62dZJvrgaWUAwGnxup0gt/JrqmTn3zpzY
	bUggbO0+6NQSeicymHhKD/4wntyl77gjydfu/7LC9mn1gjZUk7yjMGXa6FhNpZvE
	8hAZ2ykwOtaF8Pl6Y8KQt9U5H9XuOmAUt+sgOzIaj3W4aD7ZtVdBBhUbsV33zCo6
	2cXiowxPGtoMS1c2A5Y0aATZWvgqsNAkbNRDh45beusi//DzM8DRLWboQHeBvzyM
	LTKNrnsPlm9H/1Wc3uSR5tAqm+SVTiEKQm2QD/uP5M6l0D3aVpYbFZ3EFP4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766523441; x=1766609841; bh=uGXg8ZxwvF02UHhYTQhZh8q05iCfPjot7cA
	dyMcJ964=; b=BHFfTgaNsVHPEZbaTF5nYkbUbet+2sk0YwKx0TXGEDFcDslVESk
	vIU+m5iK2KqaLDGb9mUymwcOGjVwzeFtGwhqFGhATXbYgYSz19EP7LjWuWKwI50o
	JOF9b5kcEPx7wPRHIC9lNa8ZBBatbOLjld/MPYZr6/hRnXdBg4pYLvWJuMeltGLb
	AZHxGR7FIi72xxC/OUfOxRNHTzQwh7iL6PUeLlgRvtb3MQ+k1V7A5uNNmAxctlsp
	WOboPq4MK5xdvIPBtcncxSXift6TBOOZltTSXfatZhDvVPq1Yl8wZZT+DSF5w7xx
	kH4wE/sQZS8FAz3WA3UniGlE2Eq8WhqtFTg==
X-ME-Sender: <xms:MQJLaeQ1Rhj9TGfXhsIpf-uT6EyBezUJUhyIwJtP4hTlJJLY6nVBvw>
    <xme:MQJLadE5bbSgPrdhnzIbra9sAB4UJ92_qXHb88aFYDL83Q3GAGobWyW0o66MRJ0OD
    -x91GDGDwi5FT9HzB05TtlaeJ-YKdeg2jUUDUJP1CJJbHuMH65SAK8>
X-ME-Received: <xmr:MQJLaTEzleWxkWAXi5iZxSoHirEPCma34qi8e_YRvHvslQUR-JqJXvHCbbt7nODw2T64Px00YKIrPiXTFD64utAQpSPJyyDBxS_LTO74tgqW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    fggeekieffteehgfetffduhfefjeehvdejhfejkeduleffudelhfefkeeiledujeenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheptghouggvsehthihhihgtkhhsrdgtohhmpdhnsggprhgt
    phhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhorhhsthgvnh
    drsghluhhmsehlihhnuhigrdguvghvpdhrtghpthhtoheprghruggssehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvggtrhihphht
    fhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:MQJLabTw4Ao5XACG9quJgi_mEyTM3GhRmAPgRqMIwOzJFKrr9YITQQ>
    <xmx:MQJLaUKrAMZqUpe-BQetbr-PSZ4GgYPqw8Z7_fNMtm2q3w0F8UbH4A>
    <xmx:MQJLaWY7zAOFirtCLYRqfTkMpsZjQMtQLz-tWfqdzElMIXItxC2R-w>
    <xmx:MQJLaW_KnjwjbRmGzLKu68jveWX219jlV_H4DBwzWgE9zPwbdNAJ6w>
    <xmx:MQJLaY9GDz4UENHgutrNL16IOTGbYW4e1E7mETjHQtwLAzo4Fq2UgnX0>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 15:57:20 -0500 (EST)
Date: Tue, 23 Dec 2025 14:57:19 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ecryptfs: Replace strcpy with strscpy in
 ecryptfs_set_default_crypt_stat_vals
Message-ID: <aUsCLz4PRB_P33P3@yaupon>
References: <20251213110502.302950-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213110502.302950-2-thorsten.blum@linux.dev>

On 2025-12-13 12:04:50, Thorsten Blum wrote:
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. Replace
> it with the safer strscpy().
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: Tyler Hicks <code@tyhicks.com>

> ---
>  fs/ecryptfs/crypto.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index 69536cacdea8..2c37ee6a8be1 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -21,6 +21,7 @@
>  #include <linux/file.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/unaligned.h>
>  #include <linux/kernel.h>
>  #include <linux/xattr.h>
> @@ -717,7 +718,7 @@ static void ecryptfs_set_default_crypt_stat_vals(
>  	ecryptfs_copy_mount_wide_flags_to_inode_flags(crypt_stat,
>  						      mount_crypt_stat);
>  	ecryptfs_set_default_sizes(crypt_stat);
> -	strcpy(crypt_stat->cipher, ECRYPTFS_DEFAULT_CIPHER);
> +	strscpy(crypt_stat->cipher, ECRYPTFS_DEFAULT_CIPHER);
>  	crypt_stat->key_size = ECRYPTFS_DEFAULT_KEY_BYTES;
>  	crypt_stat->flags &= ~(ECRYPTFS_KEY_VALID);
>  	crypt_stat->file_version = ECRYPTFS_FILE_VERSION;
> -- 
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
> 

