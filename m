Return-Path: <ecryptfs+bounces-752-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA91ECDAA28
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 21:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D70C53007628
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 20:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3873D306B3D;
	Tue, 23 Dec 2025 20:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="Bjnq4UMz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SiAXKlhE"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D4288517;
	Tue, 23 Dec 2025 20:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766523298; cv=none; b=YtoxCZEcmGtB/RcEcoIewwAyB+aZq+W7VaKqmWY7A1890Qbe5OfQMbhshj/1XtdOKlrYa6wYgPB6YoOp97DfiIykVMdhtnDoJseYOBEtMFnlxd+PGFrRhUA1E7WGgJw/IQKZu0T6x79Xx342ZAGbPON+NDuJ9ZU8PuX/F51D6uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766523298; c=relaxed/simple;
	bh=mLfT8gCaUUHL0AtMQirmvgbM+KJxSSS7MYLj90Qxasw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtuSw6FskUEMjEp0gzEzcyx2/m6K9oRiCrzc5DMU4F5Cq28amJM7m1IioflWuS3JElEJCqEvG6Kgxl6HdNpxnrUWyfUxtHg4OSmTSHkzA+GMFnSRaPS84G8B8p6iezfzSgUllTb165d7foXjwSJZSxh1Gbn32eZm3OLncna+Njg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=Bjnq4UMz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SiAXKlhE; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 98E2A7A010E;
	Tue, 23 Dec 2025 15:54:55 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 23 Dec 2025 15:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1766523295; x=1766609695; bh=sI+zOWLzzx
	YQpfcVDJYfb2XrwZetA5o+XMvrUxiHmn4=; b=Bjnq4UMzIR4thIFB+/XQIGS/h5
	wwVtEJyOF872vYyLLmJ25/8A7eg8ACiOWDs+Yu/PLFHa4ZItAA/Rpa85hhxFAYwH
	w/oj9mzQ6Sr1oMasDM7a17l/yWr7v7AuHOSSyPZku9LlzGWsnP5Ml1sJK/BnTfCP
	BQ6xrC+bx45Umqo1u/fxNfnsDpUPb4QFOtF2c06AaEzaXU/yeY+IIM3+oa5IsyMZ
	tzHmq+dfQVNf8PmG2Zp9R1pppCSjds0NOZhXAw76RKLOkzo96JIFuiOA1zozgygW
	TwWeFAR1ezoTOVxAondtYICTK0FaOhzoFe37a0wbRCOTe11Zv6I8vsDO9plA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766523295; x=1766609695; bh=sI+zOWLzzxYQpfcVDJYfb2XrwZetA5o+XMv
	rUxiHmn4=; b=SiAXKlhEiOaFSKUGkzlYIYy/UhdiB0KelqUUBWzTz0SVkuwkDlG
	bNP95p0LFALqQW+KVaIupFWJ+azHOSSjIVfJjvhVQ7gbcuRVeR/i0Z0kYXjhqRlf
	GP4+RqVCDB/YOMIGRjVqtOB7eJhxRBdpoPhgIzzB+udYKTkNWvCFdWzztGw44rm+
	tzft4EMPxStAJ82uV2JIBMr88k2/Jztu9DIZG+y6LhZbVjWAI/h242Bo532mioxQ
	hqqYILL+UfvAt6zKr/PR2vr/Kf+LeTS9NbMMvPuemvmilsZiBxoK2Df4HI6qwnef
	77pDtJ4ncD0QpIGRfIKar7fmIpykFKl1cIg==
X-ME-Sender: <xms:nwFLafE9LVmq1D3iNqqDi9F1kNR8GWPTH9HkGrrrkEheUbGS4vn7lQ>
    <xme:nwFLaVpVA5qDKTMhhSaGl7s4VfV2cZLOcvUuTbE1BNtIlg37kiXPirnNPVjdilM2E
    _1vAQ9IjlJmJF_9zPFG2YGY96xH4iWCwjz-5gHxMOvir8IiCEfoejg>
X-ME-Received: <xmr:nwFLaYYCiLMZx59qxDDI59iHyVZvZFxOGZyJjvrKdxuzh9nygMc9AmHzSX8qghcgNRFqbg1D-8pEkpTdxXFeUupKUW_BI3lQD6GKntM2pyuI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdekfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:nwFLaeWV5bl6d4E8w9f9R-JOPbGZZO-uQCujojXOKNu-Lz5MQZNFbQ>
    <xmx:nwFLaR8HkT5Y6ZZSkEnoTbcvChaY2knrQPCK1BOCLT2jkWoUJjuPbA>
    <xmx:nwFLaX_mh2El3LZ2sRKWBZDV-AJ6lKZft2Kfh3CBF5nO9k0ul9jNzw>
    <xmx:nwFLaRQaSyoiM3abDHCrpgNL_N65AIlyEMszu12I-OD6KtjJ9amtCw>
    <xmx:nwFLaYrN8cQGXDNFe4RJHslTnnbe-H6fYSMlEmWbxvfcoTrHFP14nvHS>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 15:54:54 -0500 (EST)
Date: Tue, 23 Dec 2025 14:54:52 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ecryptfs: Drop redundant NUL terminations after
 calling ecryptfs_to_hex
Message-ID: <aUsBnAdoEmQW8wVb@yaupon>
References: <20251120221800.9985-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120221800.9985-3-thorsten.blum@linux.dev>

On 2025-11-20 23:17:57, Thorsten Blum wrote:
> ecryptfs_to_hex() already NUL-terminates the destination buffers. Drop
> the manual NUL terminations.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks again for the cleanup!

Acked-by: Tyler Hicks <code@tyhicks.com>

Tyler

> ---
> Changes in v2:
> - Remove all redundant NUL terminations after calling ecryptfs_to_hex
> - Link to v1: https://lore.kernel.org/lkml/20251120214535.5952-2-thorsten.blum@linux.dev/
> ---
>  fs/ecryptfs/debug.c    | 1 -
>  fs/ecryptfs/keystore.c | 3 ---
>  2 files changed, 4 deletions(-)
> 
> diff --git a/fs/ecryptfs/debug.c b/fs/ecryptfs/debug.c
> index cf6d0e8e25a1..c185a8cb5fe2 100644
> --- a/fs/ecryptfs/debug.c
> +++ b/fs/ecryptfs/debug.c
> @@ -28,7 +28,6 @@ void ecryptfs_dump_auth_tok(struct ecryptfs_auth_tok *auth_tok)
>  		ecryptfs_printk(KERN_DEBUG, " * passphrase type\n");
>  		ecryptfs_to_hex(salt, auth_tok->token.password.salt,
>  				ECRYPTFS_SALT_SIZE);
> -		salt[ECRYPTFS_SALT_SIZE * 2] = '\0';
>  		ecryptfs_printk(KERN_DEBUG, " * salt = [%s]\n", salt);
>  		if (auth_tok->token.password.flags &
>  		    ECRYPTFS_PERSISTENT_PASSWORD) {
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index 3a6283477d61..9f53069bbc7c 100644
> --- a/fs/ecryptfs/keystore.c
> +++ b/fs/ecryptfs/keystore.c
> @@ -908,7 +908,6 @@ ecryptfs_parse_tag_70_packet(char **filename, size_t *filename_size,
>  	(*packet_size) += s->packet_size_len;
>  	ecryptfs_to_hex(s->fnek_sig_hex, &data[(*packet_size)],
>  			ECRYPTFS_SIG_SIZE);
> -	s->fnek_sig_hex[ECRYPTFS_SIG_SIZE_HEX] = '\0';
>  	(*packet_size) += ECRYPTFS_SIG_SIZE;
>  	s->cipher_code = data[(*packet_size)++];
>  	rc = ecryptfs_cipher_code_to_string(s->cipher_string, s->cipher_code);
> @@ -1777,8 +1776,6 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
>  			}
>  			ecryptfs_to_hex(new_auth_tok->token.password.signature,
>  					sig_tmp_space, tag_11_contents_size);
> -			new_auth_tok->token.password.signature[
> -				ECRYPTFS_PASSWORD_SIG_SIZE] = '\0';
>  			crypt_stat->flags |= ECRYPTFS_ENCRYPTED;
>  			break;
>  		case ECRYPTFS_TAG_1_PACKET_TYPE:
> -- 
> 2.51.1
> 

