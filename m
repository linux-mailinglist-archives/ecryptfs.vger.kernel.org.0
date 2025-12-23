Return-Path: <ecryptfs+bounces-754-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3ECDAA8C
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 22:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A05F300B923
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 20:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B4A2EA749;
	Tue, 23 Dec 2025 20:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="f0hy7++q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OzMd7Rm8"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7971D295DB8;
	Tue, 23 Dec 2025 20:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766523561; cv=none; b=uqAAV4VjeiZmJgoR3MvPFOkPHuoA4xFVsckNfhDr1xFSXnzGPOx0E+EQsNtQuBlWM2+JqMLVT+NZH3g9PIVLoc1pRBDfW+tRS12gSq6fs3HR8XXK4nztKMLnuvhH/4ssnVqenEykFTsad8A97xEeD8UOXQFv5bEjWs72fYEahYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766523561; c=relaxed/simple;
	bh=zbaxNfXmggpWvpRRzgBlL89gaT56VqM6YnZyQXk3Tmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5U50C1MePYENnfqrU7jUTJ7aFoOsu9MGboOyEoqHy+JDlqXK5EpTD2SoFaXMWpGTnDGlVFJ4oUYryVUqMyccn/0UnA4oWcaoL1g21EoFMP08KOnxCh0fDu+3gBzTdK5iQlINLNpbTS9CscHj4o5mteMAfe/OsYn4QZOAJqXj44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=f0hy7++q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OzMd7Rm8; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 8F18F1D000DE;
	Tue, 23 Dec 2025 15:59:18 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 23 Dec 2025 15:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1766523558; x=1766609958; bh=UNBnCtS/0I
	GgjFPDqJSQi57eZijg58X4Gb/hjbB1zac=; b=f0hy7++qlwnTZVSmDkP+A/uOym
	vtyYUqd4vpkDiQ7caUms4YFOqmxZHXPGMqHaHOElGnl6ZuMPTlgXBeIAIcR+i8Ds
	j9msARLfk3jAJlPx75JIqHrr/V0feahFJjV09XpFflb6hpfisxIHKolAdRN+9BH2
	9r1g5H2OQkVWFDMTRhL+nbY4/+bZCBBVpGGFdq2w2J66GqtodEZ8w0JsMH0G3pXK
	2xthWzr2vneSi5U6nK4fN3p83zjrh2rAS+9NBVTyNwkDwhRNsrOp5FH7hRUYFWJt
	bGhjIFpEmCHbfm6/IijRafcC+nOOTEad0Mpt11GX9DY4+Y2WX/e+Efu9vh7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766523558; x=1766609958; bh=UNBnCtS/0IGgjFPDqJSQi57eZijg58X4Gb/
	hjbB1zac=; b=OzMd7Rm8V/NtCfESzx7ti8YcfKGBqY1GInE8EvT9d52vvpjImy1
	msjMzXpPZw628Lvx26p97qOFlx56mSR62i4+uJL+hSeCweZVq+ZeIijgbp7VYVoR
	3ifOJqHGJ8kLz2D+2sUibmi/iOS2Yu+6XQ6AdvGV2roBCA6s8r1m4Sc//RJz/nUk
	R5LXyy9O6dST8lFsvtbHhzCTQgM99AcEMziS8bO6DJ6SNr6SfFrVJskacMkYkYBu
	rZ8H8JdTz29iSBBmKfT6bQh8T5YLAPy5cvKhlcUebEsGvK6cIjanaMAH34lNnHAJ
	eTgL11VgsNaG84PvFyeoroH+sjKUyJDIhAg==
X-ME-Sender: <xms:pgJLaUQSDTwQiO9Q4o_tWpvernASiwAsBHD2dDn5MyPk6Md7PtD7Ag>
    <xme:pgJLaQ3aEq0RA0WPJi8oc7swlh4CcB3clKCFC_nTaSKkXr3fmXU1aoa-ngA6hga90
    Py66a7E0DEqyRH0G3L4OH6OGcvcsMGNXt_lTpiWNFF412q2JnYosA>
X-ME-Received: <xmr:pgJLaYBDd36ngA55QX4V7s-700nltK4x1EnQsweWaFZu8u5Sb8L1plz4kUUYYmJ12dYDuoMZdN3yxUUAaGjBIreJbJ5UQrm3icrUo836Fpnd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    fggeekieffteehgfetffduhfefjeehvdejhfejkeduleffudelhfefkeeiledujeenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheptghouggvsehthihhihgtkhhsrdgtohhmpdhnsggprhgt
    phhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhorhhsthgvnh
    drsghluhhmsehlihhnuhigrdguvghvpdhrtghpthhtohepvggsihhgghgvrhhssehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepsghrrghunhgvrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhirhhoseii
    vghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegvtghrhihpthhfshesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:pgJLaUjbVa5fYf86pJXOT85nd_cHPqFwF4t6mPf4YTtoKfjDSFeUxQ>
    <xmx:pgJLaSOcLxySJx8CTXFs3KcpwYCsVm9SqBSroWh4rwvNbsWcOafn6Q>
    <xmx:pgJLac_qiPF_QGtBGLwtitn6XPiwv5yr2LTahYfFT-NQ7n5Ur1KMWA>
    <xmx:pgJLabdE2VVpHeH4ZwcfodegeoX_jKExr0egoBPqDGOJdEWPnKm7Lw>
    <xmx:pgJLaT1l1gOQZBEbXyi9kX9I-Sym7qbA39wzWj5TqkNTMFHfIeCwOAGE>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 15:59:17 -0500 (EST)
Date: Tue, 23 Dec 2025 14:59:16 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ecryptfs: Replace strcpy with strscpy in
 ecryptfs_cipher_code_to_string
Message-ID: <aUsCpC_80ZCoUdDM@yaupon>
References: <20251213110502.302950-2-thorsten.blum@linux.dev>
 <20251213110502.302950-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213110502.302950-4-thorsten.blum@linux.dev>

On 2025-12-13 12:04:52, Thorsten Blum wrote:
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. Since
> the parameter 'char *str' is just a pointer with no size information,
> extend the function with a 'size' parameter to pass the destination
> buffer's size as an additional argument. Adjust the call sites
> accordingly.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: Tyler Hicks <code@tyhicks.com>

> ---
>  fs/ecryptfs/crypto.c          | 6 ++++--
>  fs/ecryptfs/ecryptfs_kernel.h | 2 +-
>  fs/ecryptfs/keystore.c        | 9 +++++++--
>  3 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index 2c37ee6a8be1..c99fc60a4e3b 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -934,11 +934,12 @@ u8 ecryptfs_code_for_cipher_string(char *cipher_name, size_t key_bytes)
>  /**
>   * ecryptfs_cipher_code_to_string
>   * @str: Destination to write out the cipher name
> + * @size: Destination buffer size
>   * @cipher_code: The code to convert to cipher name string
>   *
>   * Returns zero on success
>   */
> -int ecryptfs_cipher_code_to_string(char *str, u8 cipher_code)
> +int ecryptfs_cipher_code_to_string(char *str, size_t size, u8 cipher_code)
>  {
>  	int rc = 0;
>  	int i;
> @@ -946,7 +947,8 @@ int ecryptfs_cipher_code_to_string(char *str, u8 cipher_code)
>  	str[0] = '\0';
>  	for (i = 0; i < ARRAY_SIZE(ecryptfs_cipher_code_str_map); i++)
>  		if (cipher_code == ecryptfs_cipher_code_str_map[i].cipher_code)
> -			strcpy(str, ecryptfs_cipher_code_str_map[i].cipher_str);
> +			strscpy(str, ecryptfs_cipher_code_str_map[i].cipher_str,
> +				size);
>  	if (str[0] == '\0') {
>  		ecryptfs_printk(KERN_WARNING, "Cipher code not recognized: "
>  				"[%d]\n", cipher_code);
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
> index 9e6ab0b41337..0d824350f31a 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -577,7 +577,7 @@ int ecryptfs_read_and_validate_header_region(struct inode *inode);
>  int ecryptfs_read_and_validate_xattr_region(struct dentry *dentry,
>  					    struct inode *inode);
>  u8 ecryptfs_code_for_cipher_string(char *cipher_name, size_t key_bytes);
> -int ecryptfs_cipher_code_to_string(char *str, u8 cipher_code);
> +int ecryptfs_cipher_code_to_string(char *str, size_t size, u8 cipher_code);
>  void ecryptfs_set_default_sizes(struct ecryptfs_crypt_stat *crypt_stat);
>  int ecryptfs_generate_key_packet_set(char *dest_base,
>  				     struct ecryptfs_crypt_stat *crypt_stat,
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index 7f9f68c00ef6..b5204ab3150d 100644
> --- a/fs/ecryptfs/keystore.c
> +++ b/fs/ecryptfs/keystore.c
> @@ -954,7 +954,9 @@ ecryptfs_parse_tag_70_packet(char **filename, size_t *filename_size,
>  	s->fnek_sig_hex[ECRYPTFS_SIG_SIZE_HEX] = '\0';
>  	(*packet_size) += ECRYPTFS_SIG_SIZE;
>  	s->cipher_code = data[(*packet_size)++];
> -	rc = ecryptfs_cipher_code_to_string(s->cipher_string, s->cipher_code);
> +	rc = ecryptfs_cipher_code_to_string(s->cipher_string,
> +					    sizeof(s->cipher_string),
> +					    s->cipher_code);
>  	if (rc) {
>  		printk(KERN_WARNING "%s: Cipher code [%d] is invalid\n",
>  		       __func__, s->cipher_code);
> @@ -1172,7 +1174,9 @@ decrypt_pki_encrypted_session_key(struct ecryptfs_auth_tok *auth_tok,
>  	memcpy(crypt_stat->key, auth_tok->session_key.decrypted_key,
>  	       auth_tok->session_key.decrypted_key_size);
>  	crypt_stat->key_size = auth_tok->session_key.decrypted_key_size;
> -	rc = ecryptfs_cipher_code_to_string(crypt_stat->cipher, cipher_code);
> +	rc = ecryptfs_cipher_code_to_string(crypt_stat->cipher,
> +					    sizeof(crypt_stat->cipher),
> +					    cipher_code);
>  	if (rc) {
>  		ecryptfs_printk(KERN_ERR, "Cipher code [%d] is invalid\n",
>  				cipher_code);
> @@ -1438,6 +1442,7 @@ parse_tag_3_packet(struct ecryptfs_crypt_stat *crypt_stat,
>  		goto out_free;
>  	}
>  	rc = ecryptfs_cipher_code_to_string(crypt_stat->cipher,
> +					    sizeof(crypt_stat->cipher),
>  					    (u16)data[(*packet_size)]);
>  	if (rc)
>  		goto out_free;
> -- 
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
> 

