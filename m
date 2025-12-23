Return-Path: <ecryptfs+bounces-751-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07585CDA824
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 21:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A286B301EFAC
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 20:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE8535FF54;
	Tue, 23 Dec 2025 20:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="VenTTpso";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fBzcW9DQ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4B835FF4B;
	Tue, 23 Dec 2025 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521725; cv=none; b=h8Pc22X+Pj3ellUcC+iHr+zbRaAokihxAUTGtouiq1EhpqlUVRdnpaJgRnUBjdQc1bq3XzbEKeamJL8B/aksBoEbJ2ZgXdO92exg5vLt6Xivw941gVW1CiTLKa0GjwCKLdcpXDJT6sJ0zxxI0LHq0zCoMrM2184X6ixDpn+vb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521725; c=relaxed/simple;
	bh=GVwl5lpk0Q5s3AqIl3i1j0m7nIDAVHmowtKo68RHv0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJXMp9i9TLbZf14yyU5wymNAzGLl6hcH3YwcXOiXkcacdwewCGjws/zM3WdmpjfUoL32gYf1ZdLs3fTcBUs0z1H0VYEgf8NwPi4U8y1GzaJxN3czPqqzR/NpgGTTLusEcoHa5fjqaagvqjmNyTSjL6maNFhxwxZMx1V7A7cc9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=VenTTpso; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fBzcW9DQ; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 324477A00A1;
	Tue, 23 Dec 2025 15:28:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 23 Dec 2025 15:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1766521722; x=1766608122; bh=nBuf5ENwpT
	wJqRbkRr12XVZ6tHLl8Cag0OFzfm027YI=; b=VenTTpso6I5sb1rqh5r46jcefV
	cC6RE1ghepl2mkwR+H5CEDgy9EpA7zurfg6FrdvCLs8dzRK09gQgcsY4qaavPApx
	jYZcEcHH5rLXnSqrBrsVsEOu2FTh0qNhM+rDIWiYR1+AzKvHvcCMuNa3EcWjMOj1
	BgDpVyC5nsq8bhMc1tE1Z2szQtjuqVo15gho4ynXMyGNegh7t8ytP2cQrG46T5fG
	Zfx1fMb8PhxMtTooqje9edfgAjZXlylvSUkedchALWMiG2pjgn/3RIFdEYizWP/n
	iMMyVmekMlHjw47QkToNTGqeAqb72hTAc+PyQIyhFuApkV+ZUTmx4P4/lAFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766521722; x=1766608122; bh=nBuf5ENwpTwJqRbkRr12XVZ6tHLl8Cag0OF
	zfm027YI=; b=fBzcW9DQMnXRZFqiT0ZoVHiuXgsrrPbUWdPoFDV+w1YPWclTMPR
	V1ng8Y2tmaHgqOkff/pn2iLPiQLQdJ8tlbSEpen25l4UNu79mqHHXWf7b6DsZFMj
	JhVHeRz7iT6X0xch89JupARgnmC6xZ8HCl9LgT9R0HlN9H9ey9uvseuxKpHpms/m
	Tl1Pi9KuluNCPOv5R4gJp/AEVLuk5Sh7ojngZkjQ5x/ELsAPRd4b99f2shcRKSHa
	WEhzrJg5EEjCs/1jl+mC1/xOEwFc7Y4lC2xbHIOOsqroMJpamSS/wEN988vPHgy/
	KEWWr7P+lReRUZlg3edh8jcAKG7cm8tQ9UA==
X-ME-Sender: <xms:eftKab9vCJ4tO8YnMAe5t94Dq2DWPDOAlzIf1GQvb9ENtawKhg-6Eg>
    <xme:eftKaRCe_me58QeeODUzFEje1LrXQR36MSLo1m64VseTJvYNg_JMRU08aG8hoCZHd
    G4q1FbwRp8WAFbGdVqclPGrWpWlXHtqCxhJo7JOBe-_QrQIZMagbOnZ>
X-ME-Received: <xmr:eftKaQR8oQYuQypWEcNCINWTy0ROm1BZRNqYDJxKb55ZqR_5YICQEht4OIGbwgo3bgbGBgrZqB0GRs7orLDEqmBd5C_io1TpqhXrXFoFyF4k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    dvhedvtddthfefhfdtgfelheefgefgudejueevkeduveekvdegjedttdefgfelieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesth
    ihhhhitghkshdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepthhhohhrshhtvghnrdgslhhumheslhhinhhugidruggvvhdprhgtph
    htthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhgusges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepvggsihhgghgvrhhssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegvtghrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:eftKaYuEDUOsmHfMC1IMV_9UpJU6hUHwdG6aX7Dlwh9FCJKRZqvH5g>
    <xmx:eftKac3HAnpFKtTgqtNtPuItJUgd_j_E2lZ__KdHrFRUHoR6artNDA>
    <xmx:eftKaZVEe2gMTE02O9ByAXK9ywwfQrZpRCwPyuJqNRAl_22bD7vcwQ>
    <xmx:eftKaXLtuZZQRDQ6X0cEHOwQVZHURv8m9MVQtiIc93TL65_-ACoTQA>
    <xmx:evtKaWj7Fnq5EilQKF3Kmgx80WEo8dl6yJijYrW0nVs_Heh7ovlGLUcp>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 15:28:41 -0500 (EST)
Date: Tue, 23 Dec 2025 14:28:33 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ecryptfs: Replace memcpy + NUL termination in
 ecryptfs_new_file_context
Message-ID: <aUr7cX-QULAhQ1oF@yaupon>
References: <20251219213235.71774-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219213235.71774-1-thorsten.blum@linux.dev>

On 2025-12-19 22:32:33, Thorsten Blum wrote:
> Use strscpy() to copy the NUL-terminated '->global_default_cipher_name'
> to the destination buffer instead of using memcpy() followed by a manual
> NUL termination. Remove the now-unused local variable 'cipher_name_len'.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks for the cleanup!

Acked-by: Tyler Hicks <code@tyhicks.com>

Tyler

> ---
>  fs/ecryptfs/crypto.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index 260f8a4938b0..5d9ec4a1e12d 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -678,7 +678,6 @@ int ecryptfs_new_file_context(struct inode *ecryptfs_inode)
>  	struct ecryptfs_mount_crypt_stat *mount_crypt_stat =
>  	    &ecryptfs_superblock_to_private(
>  		    ecryptfs_inode->i_sb)->mount_crypt_stat;
> -	int cipher_name_len;
>  	int rc = 0;
>  
>  	ecryptfs_set_default_crypt_stat_vals(crypt_stat, mount_crypt_stat);
> @@ -692,12 +691,8 @@ int ecryptfs_new_file_context(struct inode *ecryptfs_inode)
>  		       "to the inode key sigs; rc = [%d]\n", rc);
>  		goto out;
>  	}
> -	cipher_name_len =
> -		strlen(mount_crypt_stat->global_default_cipher_name);
> -	memcpy(crypt_stat->cipher,
> -	       mount_crypt_stat->global_default_cipher_name,
> -	       cipher_name_len);
> -	crypt_stat->cipher[cipher_name_len] = '\0';
> +	strscpy(crypt_stat->cipher,
> +		mount_crypt_stat->global_default_cipher_name);
>  	crypt_stat->key_size =
>  		mount_crypt_stat->global_default_cipher_key_size;
>  	ecryptfs_generate_new_key(crypt_stat);
> -- 
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
> 

