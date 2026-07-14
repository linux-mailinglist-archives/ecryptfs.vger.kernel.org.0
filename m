Return-Path: <ecryptfs+bounces-1237-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ezvxGMS4VWrorwAAu9opvQ
	(envelope-from <ecryptfs+bounces-1237-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 06:19:16 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F66750C90
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 06:19:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tyhicks.com header.s=fm1 header.b=SxzUbnJa;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="aNoZ0/4n";
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1237-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1237-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E5913009E2E
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 04:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCAB2848BE;
	Tue, 14 Jul 2026 04:19:11 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7118E26CE11;
	Tue, 14 Jul 2026 04:19:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784002751; cv=none; b=sgceMCSvpLB2uE4xNr/sJ1AnShTyMoxIprQGNBbf8jRquNUKk8Bah2KMn/2VnMeCGZ4lRc2KjJSxMbmHRc2agErampQGapvQH83hEE1GgSN/HhozFwQ1hlS9qLuvLKJ4N0bo8FH9acTkjvb4dpy9ShD/YALng9idO5CSntphAT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784002751; c=relaxed/simple;
	bh=gBL3z9c3ww+0FCeOy8qNQmtn8dsfRtHO5ajXR4WzHmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EasbJJdy3S8DlKSZSwpIazT8ZCxsmJ9KLANnYbfkQg1+Y209t78eN7VY5OrmgkRGP42FsE1kHgBAO8GdGOnYpqMtq0dB2zBfZmksE9FmztrcvoT8B5S4OMCPDAww/6cNnaG/wvDZoZNm3riyoEJTLEK8vdBc3+mF5h4rJEFZR4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=SxzUbnJa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aNoZ0/4n; arc=none smtp.client-ip=103.168.172.158
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A4B4814000E1;
	Tue, 14 Jul 2026 00:19:08 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jul 2026 00:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784002748; x=1784089148; bh=2k7RLmktGe
	B2OhCT9iIenlgWaYC0+7m7DQ3NBx5NBbk=; b=SxzUbnJaNAElrMYRB08+vcZTXg
	aEEdFQMsBt6amiFTXO1tSJ36msxPbHuOfAPNNiGSgj5M8i+E0c4Ajf1AToUolOYF
	GJZkV24SizKnZ7LV53EBzVbJxIJY7zfUIDrziiri41x9frowvtVaa8GeDNrrEEdF
	2AwIGLgF/SWCCzJ4VuQfXbS1/iPoZsXbX6jbanCYpLNOITrUnL/1mM1c3oGP0MMG
	P4jnT+RcBrNigziWjoBVsClAnVQhUcLTAhJiXITFx4z7EM9IJZg4/WHNFUUVvfMk
	vsRg9FKWSWRnX5Q2EHJYomPBqSZBnuC6UYRl2PjeXG1FKIP73bJK6degbb+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784002748; x=1784089148; bh=2k7RLmktGeB2OhCT9iIenlgWaYC0+7m7DQ3
	NBx5NBbk=; b=aNoZ0/4nrqI1tmHPamir1qXc5mgOf5wq96lRWKIFUloEmfZBXSZ
	A00Xoj9ZAhmRPtHgEYBafBFXprU/G9N5VLGsizCQD62jtbpMvUO37dRVNVqaBxIW
	2x6BMwstbyTcaOSGKA2a8H5nylKtNn6TKue5zmm/0ONeJmGXwmXqQtUftPAHAyLA
	eIjj+p3558azHFG6WNDQAQFnRtf6j/TxHJF5YiS3csy+x011yYrE78kuNOhSEPKQ
	qE0+WkUBCXA5B9J7DeRt9avMiljnOKDC9+U+A542ONBH0YdIg33dpZFHYIdRg+ov
	oKd1n4vq7WHxC1mpmznjlwNRDSnqeSBo42Q==
X-ME-Sender: <xms:vLhVarV39FQr9YQzOqitmVUfWyzwYP4MT9qF0swTMbXYZHwcalMOXw>
    <xme:vLhVakVl9Yb8pfE9QMcV1yPWzANYSaZi4DzBvrkas7O_LqP97Z3IZtCWubHR5cRr0
    p-sK2nWjwTSFJxwcOEMj212DpXToF2BxyMKPMCIS1VnrJIhBCH21Jc>
X-ME-Received: <xmr:vLhVajg7RLBbD8jJOPLJxrON-lYvLZyrHcOvxo_2X6gmLAH1GMUoXZ7poC71ZQk_51dFNxkjjLthP0vR>
X-ME-Proxy-Cause: dmFkZTE8IsyW3+Pm54ukEM3IsMKwhe3hJr8PL30KUTR9JQFqRPrxK0UnSUMdPH3amsQ/0l
    lyqf3UNI4XiRjeHufI5yI3W7bKhO22d3X1ykMH+l2sGpqKcxmBml8+RjxW279FoBm/1xsG
    7CZwUbfM5SXm/xAOMV7OyB3iKlF2wWqE0RQYkSQru+JBR23nUfLXkR4JpZnSKNKUO9QH5j
    tut0p2n3xEGViKqeosBtXjPR7pF4L8KlIyqM2iNEmzreKa2LfTm/Nlg9W+REKpZEU0TlZ+
    mlzeQpvV9xStEqD+7L8UE9acVrhcpuhFRPmJ/tkHGpDwHzmSSUPZWFRSP1oqGN97k0VGG+
    AE38+yt7ieRfeWl0u2w8m3++hWFEyVxeRb73yMpRM5oTuQUiw2c7wc0yyphApxV6QRH1u2
    8Xtd9OfDBYVX1R2iiX2s14hpLu8tq3Y+TWwbPUIz/148TtUvkWUfh4AsUYtHeq5q/Rlh9e
    VgOmMwqtQA3tTD+TMFmer36wKNFfbLst772hG89S6aWUSc8eunZCCpwMKrzIJVzJJX7VbG
    sPaNcIEpEwXgu2wdnjw2tMZkN5HRkGSnV2O4oQ3dzMtU4T05OgpP011Y/Tlvo2iylvy5vH
    P/XGRkrfa2mTnTa7A+pUWsYr8S3tJ0jpcslZwnQ/Ozp1Zu9hbCPi1RVMyW0Q
X-ME-Proxy: <xmx:vLhVanb96Y8hQYmHoiLCSNO4NDofACBF0izQ2VvNryS_UwOS7oQjzg>
    <xmx:vLhVaorz7nuW1hY6FpQb2_Xll9qOttq9kgLzBII3USA3HjjC1mdqSw>
    <xmx:vLhVasOJB476neUW9mHJ8EUcsJDuszkySb_2pFgOIEVhi9f3bcwUcQ>
    <xmx:vLhVajpIbufAAH9piSQP12MFbXnZpm8Gc_SN_8MvxorlN9lUIDo_xg>
    <xmx:vLhVasRBwsU1JLF5JxDO-T2aZG1l9QohL2JZQ_aTCTqmQSEDXdhkNOCz>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 00:19:06 -0400 (EDT)
Date: Mon, 13 Jul 2026 23:19:03 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Yichong Chen <chenyichong@uniontech.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Eric Biggers <ebiggers@kernel.org>, Kees Cook <kees@kernel.org>,
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: validate packet parser buffer lengths
Message-ID: <alW4t1KssnzQbl4Y@elm>
References: <20260627090208.27774-1-chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627090208.27774-1-chenyichong@uniontech.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chenyichong@uniontech.com,m:thorsten.blum@linux.dev,m:ebiggers@kernel.org,m:kees@kernel.org,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-1237-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,messagingengine.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58F66750C90

On 2026-06-27 17:02:08, Yichong Chen wrote:
> ecryptfs_parse_packet_set() receives a pointer into the file header,
> but it calculates the remaining packet buffer size from PAGE_SIZE - 8.
> For version 1 headers the packet set starts later in the header, so
> this can overstate the available buffer.
> 
> Pass the actual packet set buffer length from the caller and use the
> remaining length after each parsed packet. Also fix the tag 11 packet
> exact-fit bounds check and reject too-small tag 70 packet bodies before
> subtracting fixed metadata sizes.

My apologies for just now getting to the review of this patch but could
you please split out these two separate fixes (tag 11 exact-fit check
and too-small tag 70 check) into their own patches? I feel like these
are three distinct fixes and should be treated that way in the git
history.

These are nice improvements! I only have one small, additional comment
below.

> 
> Fixes: 237fead61998 ("[PATCH] ecryptfs: fs/Makefile and fs/Kconfig")
> Fixes: 9c79f34f7ee7 ("eCryptfs: Filename Encryption: Tag 70 packets")
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
> ---
>  fs/ecryptfs/crypto.c          |  2 +-
>  fs/ecryptfs/ecryptfs_kernel.h |  3 ++-
>  fs/ecryptfs/keystore.c        | 32 +++++++++++++++++++++++++++-----
>  3 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index 74b02b55e3f6..e67119b6029c 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -1197,7 +1197,7 @@ static int ecryptfs_read_headers_virt(char *page_virt,
>  	} else
>  		set_default_header_data(crypt_stat);
>  	rc = ecryptfs_parse_packet_set(crypt_stat, (page_virt + offset),
> -				       ecryptfs_dentry);
> +				       PAGE_SIZE - offset, ecryptfs_dentry);
>  out:
>  	return rc;
>  }
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
> index f4f56a92bd56..7d2488a10b17 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -580,7 +580,8 @@ int ecryptfs_generate_key_packet_set(char *dest_base,
>  				     size_t *len, size_t max);
>  int
>  ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
> -			  unsigned char *src, struct dentry *ecryptfs_dentry);
> +			  unsigned char *src, size_t src_size,
> +			  struct dentry *ecryptfs_dentry);
>  int ecryptfs_truncate(struct dentry *dentry, loff_t new_length);
>  ssize_t
>  ecryptfs_getxattr_lower(struct dentry *lower_dentry, struct inode *lower_inode,
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index ebebc9551f1f..888599739274 100644
> --- a/fs/ecryptfs/keystore.c
> +++ b/fs/ecryptfs/keystore.c
> @@ -894,6 +894,12 @@ ecryptfs_parse_tag_70_packet(char **filename, size_t *filename_size,
>  		       "rc = [%d]\n", __func__, rc);
>  		goto out;
>  	}
> +	if (s->parsed_tag_70_packet_size < (ECRYPTFS_SIG_SIZE + 2)) {
> +		ecryptfs_printk(KERN_WARNING, "Invalid packet size [%zd]\n",
> +				s->parsed_tag_70_packet_size);
> +		rc = -EINVAL;
> +		goto out;
> +	}
>  	s->block_aligned_filename_size = (s->parsed_tag_70_packet_size
>  					  - ECRYPTFS_SIG_SIZE - 1);
>  	if ((1 + s->packet_size_len + s->parsed_tag_70_packet_size)
> @@ -1537,7 +1543,7 @@ parse_tag_11_packet(unsigned char *data, unsigned char *contents,
>  	}
>  	(*packet_size) += length_size;
>  	(*tag_11_contents_size) = (body_size - 14);
> -	if (unlikely((*packet_size) + body_size + 1 > max_packet_size)) {
> +	if (unlikely((*packet_size) + body_size > max_packet_size)) {
>  		printk(KERN_ERR "Packet size exceeds max\n");
>  		rc = -EINVAL;
>  		goto out;
> @@ -1704,6 +1710,7 @@ decrypt_passphrase_encrypted_session_key(struct ecryptfs_auth_tok *auth_tok,
>   * ecryptfs_parse_packet_set
>   * @crypt_stat: The cryptographic context
>   * @src: Virtual address of region of memory containing the packets
> + * @src_size: Size of the packet set buffer
>   * @ecryptfs_dentry: The eCryptfs dentry associated with the packet set
>   *
>   * Get crypt_stat to have the file's session key if the requisite key
> @@ -1714,7 +1721,7 @@ decrypt_passphrase_encrypted_session_key(struct ecryptfs_auth_tok *auth_tok,
>   * conditions.
>   */
>  int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
> -			      unsigned char *src,
> +			      unsigned char *src, size_t src_size,
>  			      struct dentry *ecryptfs_dentry)
>  {
>  	size_t i = 0;
> @@ -1736,7 +1743,11 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
>  	 * added the our &auth_tok_list */
>  	next_packet_is_auth_tok_packet = 1;
>  	while (next_packet_is_auth_tok_packet) {
> -		size_t max_packet_size = ((PAGE_SIZE - 8) - i);
> +		size_t max_packet_size;
> +
> +		if (i >= src_size)
> +			break;
> +		max_packet_size = src_size - i;
>  
>  		switch (src[i]) {
>  		case ECRYPTFS_TAG_3_PACKET_TYPE:
> @@ -1751,12 +1762,16 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
>  				goto out_wipe_list;
>  			}
>  			i += packet_size;
> +			if (i > src_size) {
> +				rc = -EIO;
> +				goto out_wipe_list;
> +			}
>  			rc = parse_tag_11_packet((unsigned char *)&src[i],
>  						 sig_tmp_space,
>  						 ECRYPTFS_SIG_SIZE,
>  						 &tag_11_contents_size,
>  						 &tag_11_packet_size,
> -						 max_packet_size);
> +						 src_size - i);
>  			if (rc) {
>  				ecryptfs_printk(KERN_ERR, "No valid "
>  						"(ecryptfs-specific) literal "
> @@ -1768,6 +1783,10 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
>  				goto out_wipe_list;
>  			}
>  			i += tag_11_packet_size;
> +			if (i > src_size) {
> +				rc = -EIO;
> +				goto out_wipe_list;
> +			}
>  			if (ECRYPTFS_SIG_SIZE != tag_11_contents_size) {
>  				ecryptfs_printk(KERN_ERR, "Expected "
>  						"signature of size [%d]; "
> @@ -1793,6 +1812,10 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
>  				goto out_wipe_list;
>  			}
>  			i += packet_size;
> +			if (i > src_size) {
> +				rc = -EIO;
> +				goto out_wipe_list;
> +			}
>  			crypt_stat->flags |= ECRYPTFS_ENCRYPTED;
>  			break;
>  		case ECRYPTFS_TAG_11_PACKET_TYPE:
> @@ -2480,4 +2503,3 @@ ecryptfs_add_global_auth_tok(struct ecryptfs_mount_crypt_stat *mount_crypt_stat,
>  	mutex_unlock(&mount_crypt_stat->global_auth_tok_list_mutex);
>  	return 0;
>  }
> -

Please drop this unnecessary line removal.

Tyler

> -- 
> 2.51.0
> 

