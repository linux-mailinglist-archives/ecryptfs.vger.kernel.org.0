Return-Path: <ecryptfs+bounces-755-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DB1CDAA50
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 22:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF4D330071BD
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 21:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD071C84B8;
	Tue, 23 Dec 2025 21:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="QPhZyY7I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ksq7lKvU"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB8E33993;
	Tue, 23 Dec 2025 21:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766523626; cv=none; b=gNlSV4C4QCIMvt5sVcScETlZi0CC0gdUEChVJnlTs100b2de03M7QqlIvoC4ITdyaCXHypkuHQbuZ5kzuDMx2mEC3uVxS39FcXjA+mrAkcFuolXhujNdLl6/rsLIWP8GSeeHXaCnAGvNKLlukOQJ6Iqvx3Ogr44CRHfsj9U4AiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766523626; c=relaxed/simple;
	bh=1+kImc52QW/MLATL6kSK4BWrIpt3MTApOO7Bys0Nstg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMYwMyHHxx0YPFqIVAtxkzn7AQKHsa9ViOCQqTvpUgYtECIcWiK+wAf/YqvEv5B3rl06uQIEMYQNhzrek28OjZFzxOUmXuhdh1wuISa6D+5iIB2VihaHSEFFmo8FecaN2EcdRmLhdMlMJPWxJmyeqYlXe1tr7jZYZJwlWoqKJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=QPhZyY7I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ksq7lKvU; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 785DC7A0125;
	Tue, 23 Dec 2025 16:00:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 23 Dec 2025 16:00:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1766523622; x=1766610022; bh=bFtG1lf84D
	6xJMXShoI8fXuAfz7L2gisaWCA6ZiiNxg=; b=QPhZyY7IEiOCnJksbkMCkl8vW3
	T4AAD2Yxw9Q0Gt8zAZR5fHukuE6OpcnXy2GbvF3l7mAqCIV5ahTKNrkqvPvDfH5y
	OoNEZB5iQ5kG7KXU3s0Xp0MGpPD6nxugv+tAHsu/2SQdtykyMs/KPBkr/7QLEns8
	kqKVlanAj2cgxuV6oD6yAd11L295r0rUMowERhSdG664AvkAyww6QmHN7bspExQe
	x/ds3Yk13UOHyPXVgUiDENnpxgDgu3KqGocXlMpDDkWaR48lJbI0ChenVNRgFHU8
	lLbx9qH9amjzsbaoHvrIckOhBQWpE4I7e6vA+ycdy2KuOvlCJa/rUxv5WrKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766523622; x=1766610022; bh=bFtG1lf84D6xJMXShoI8fXuAfz7L2gisaWC
	A6ZiiNxg=; b=ksq7lKvU80vdvwFLEu7B2MgmkhTsM+cTF2cQIo1Ue/UQ7ivYzRc
	eiakP9xjsPZBzm7NYugnUXrdnCINI9B6WetqZ7KBTsaEh/A93KxzXeXy481cWAFu
	ogxkraRXo4lUL+i8hqG/U+ct3DqhzkSYvvmYrP5ptonRHvPCWZfVP76SsB8ahflL
	RTfv2ho3QuytYBzHBoyrRHdg8FtqaDut5xbROVZOf5ONRpnXxrN76kVbS2E5JaWx
	tafc88XhtoI/kMaKoKX6KEt7owshYRky7VrKhuUbleMxUlRI0dKrb2OUYjxTOQGJ
	6ZiCxC2e/DpJNBn8ZaHViyZDRV+eTeCSbhg==
X-ME-Sender: <xms:5gJLaaKa6ZqdDCNaFyx7hIX7qbJ7GKybhHKmyLGLkD_l7n0zDYoA7A>
    <xme:5gJLaUtDcBIaZaHIGahsOkCPmw2uH80mpORBKuTm4drowxbcH0kBqUg2zMmdSkVdW
    p1cu2E3wJZH2kUFVCUXPvZynuRLILLfA16-yQPLojcCb71006ybHAxc>
X-ME-Received: <xmr:5gJLaeXdg1AAksBVgmUggcjruZmBbyt7QECSiFb8XqkcjUgDpSt3oAWVuuqMVWK_wk7THsImt0Pm-gPzWJkqinswKEVOaY3zF7zbUD0U_rHe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    fggeekieffteehgfetffduhfefjeehvdejhfejkeduleffudelhfefkeeiledujeenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheptghouggvsehthihhihgtkhhsrdgtohhmpdhnsggprhgt
    phhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhorhhsthgvnh
    drsghluhhmsehlihhnuhigrdguvghvpdhrtghpthhtohepsghrrghunhgvrheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepvhhirhhoseiivghnihhvrdhlihhnuhigrdhorhhgrd
    hukhdprhgtphhtthhopegrnhhkihhttghhrghuhhgrnhdvtdeiheesghhmrghilhdrtgho
    mhdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvtghrhihpthhfshesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:5gJLafjtKfRZzVtx-k6OImOJBE7st0D4vnKBY_BRcjVpuBv9_xWuKA>
    <xmx:5gJLaWpSx5MjeNTBy-ZeexPaMW8mW6Rufdz6cmExzFc_m6yoqynokA>
    <xmx:5gJLaVEJQ_fCpObOh9I179-pcKi_VdqJyFIhtPLVoOaRCEV5odpFYw>
    <xmx:5gJLab65nB-SvERC-DYH70ZVxjaskNUEZ1dwntGXp88XAwhiLr4ahw>
    <xmx:5gJLaflml_PJ0DMfoxHrUxgkZL7Jajfch83dll4XSKtyFJdUeI1JMB_q>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 16:00:21 -0500 (EST)
Date: Tue, 23 Dec 2025 15:00:19 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Ankit Chauhan <ankitchauhan2065@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ecryptfs: Replace strcpy with strscpy in
 ecryptfs_validate_options
Message-ID: <aUsC4zAbPoZFxGNx@yaupon>
References: <20251213110502.302950-2-thorsten.blum@linux.dev>
 <20251213110502.302950-6-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213110502.302950-6-thorsten.blum@linux.dev>

On 2025-12-13 12:04:54, Thorsten Blum wrote:
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. Replace
> it with the safer strscpy().
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: Tyler Hicks <code@tyhicks.com>

> ---
>  fs/ecryptfs/main.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
> index 16ea14dd2c62..636aff7a48cf 100644
> --- a/fs/ecryptfs/main.c
> +++ b/fs/ecryptfs/main.c
> @@ -22,6 +22,7 @@
>  #include <linux/fs_stack.h>
>  #include <linux/sysfs.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/magic.h>
>  #include "ecryptfs_kernel.h"
>  
> @@ -353,13 +354,13 @@ static int ecryptfs_validate_options(struct fs_context *fc)
>  		int cipher_name_len = strlen(ECRYPTFS_DEFAULT_CIPHER);
>  
>  		BUG_ON(cipher_name_len > ECRYPTFS_MAX_CIPHER_NAME_SIZE);
> -		strcpy(mount_crypt_stat->global_default_cipher_name,
> -		       ECRYPTFS_DEFAULT_CIPHER);
> +		strscpy(mount_crypt_stat->global_default_cipher_name,
> +			ECRYPTFS_DEFAULT_CIPHER);
>  	}
>  	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
>  	    && !ctx->fn_cipher_name_set)
> -		strcpy(mount_crypt_stat->global_default_fn_cipher_name,
> -		       mount_crypt_stat->global_default_cipher_name);
> +		strscpy(mount_crypt_stat->global_default_fn_cipher_name,
> +			mount_crypt_stat->global_default_cipher_name);
>  	if (!ctx->cipher_key_bytes_set)
>  		mount_crypt_stat->global_default_cipher_key_size = 0;
>  	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
> -- 
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
> 

