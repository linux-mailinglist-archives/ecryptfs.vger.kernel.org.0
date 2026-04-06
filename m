Return-Path: <ecryptfs+bounces-1188-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGWCFIlL02mJgwcAu9opvQ
	(envelope-from <ecryptfs+bounces-1188-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 07:58:33 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E763A1B5E
	for <lists+ecryptfs@lfdr.de>; Mon, 06 Apr 2026 07:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 406EC30053D1
	for <lists+ecryptfs@lfdr.de>; Mon,  6 Apr 2026 05:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F573491C4;
	Mon,  6 Apr 2026 05:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="yJNP7tGe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lt3g7lhI"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5301F31B833;
	Mon,  6 Apr 2026 05:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775455107; cv=none; b=G02OPdP7WofIsjnfOthrDjdbwmBDTFQs/prC2yD2RM6eO7+lOYY9p+XXNY19nZ+N5lkKpiCrrjIl3Xge4pt/PRoe1pnax+HioADLzuKcl8KqbrknMS7Et0Br4Ic6IbUEmOIaHE1AEuVL/PiUIMK8xQQPryGKfTfgyUWlFGnJDE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775455107; c=relaxed/simple;
	bh=Z2syZCRUxcfZ3182R/tZWk6f6dHkZgsx5oU/jhr2dLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYxQC0hve2TOpnIJkf96VLlDH/qtxmGJvbAFzMy00MmO1x7c+VRNsRf1Gr3HGBKUWd/7psRFxXkZbqu4HTv5Z38TiCwPKga6rsHQbs+ITlkt8NqP0TYV2+MmdNmHyZXHNOhEKv3MwqLmBZ5nTVojQSza0IQvOmu4DA8gW1uyF9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=yJNP7tGe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lt3g7lhI; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A6F937A0124;
	Mon,  6 Apr 2026 01:58:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 06 Apr 2026 01:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775455105; x=1775541505; bh=M3f8YxGaxD
	sLnBE52bn4EKhAHDhUWCPhwFmKNpqk3aM=; b=yJNP7tGe4QqtutR2sH8OjEOSli
	mUBMEfGKCs2UzbWNtW3m2LTHsvu6s8UxfsjKqnBTqPF/imZ89QnyfMyxS0/VgbUz
	vaJg1BuyDZFyUxCsicOwOZ7upNTZ+FExxNw1jWdd5xfag0uDCOAvJUB6Vj9RhCM3
	v7jZQ1bmdDJQLceMa0EOEGSQVqjUaksROwcqz9UtJLnG3uJt2HZj14V8zHH4EcWd
	bGZKd5JsAiPsk1DD49zVa/0rMmqpTRQDqLF7+ztqZSlq3/rfwS8iySLd2oR6jTc6
	NECMNIYSao/Zhsu4w6cKqUXIvOEYfnYUQLKMxotAfdHo4IT+vJqZdwCxlGmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775455105; x=1775541505; bh=M3f8YxGaxDsLnBE52bn4EKhAHDhUWCPhwFm
	KNpqk3aM=; b=Lt3g7lhIajjkhWtVqdLjSWgmUggdly0wtR/9osFfhmbrLQlkR5V
	7Rt4zoyUsw50FA+hOEAKsLfF4EDweFvWn+wLysbgBTQAL3Ms/ZfCd/cAbbPivaQL
	ZZE4yn8VNQS66GPv75p61XVEDZOtPBZ5QGrT4reT+Hr7HduBZS+CREP2YNIFziuJ
	wxqlnGn/T+9E9iRxltuAcOWvAUHniBl7ef2yoSto8tIvB1oStKu/ZqU70qVPSTew
	NM5eNpdmWaexXIe4EaL9286jSVPihSuSSFnmJxioz0u3AvYwtvtotgJeGkW5iEQg
	50eCsHJ84eR52XhCxVASuWTqh4fkyZxrnsA==
X-ME-Sender: <xms:gUvTaUXmXORTAP9LD95mPLYPdtR9oTofINtmSmTRuUjLYIE3iu4iew>
    <xme:gUvTaQWN1rhJRvZreKtWxnbwjGBzhDigni8Brdtc4dQlLta1oQq9ApeS8Uun1LZAO
    DpDWiQNAuoEtEAySgZ3VJ5Xa5_YEN46C3UNQ4LDwV0Un-bll7NlVAE>
X-ME-Received: <xmr:gUvTabcECjeLXW2hy3Dc5DjpqqzwFFg2St9Dlrm8ZtRwVycaPOAxp_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduieeltdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:gUvTaRXtxYQ8gi1dFmJJGMEtnMI_cshVThEQ4mYM3Lg4Yk3ogGxTvQ>
    <xmx:gUvTacfZdY6o1cHUaRVZb9bqwYBeQ_LBI1ASeCbAhjZ2CxAn30JyDg>
    <xmx:gUvTaVNEeULwIt8tnAVfMZClkCj4aJXsErP0GsQYjP9v-56SC88j_w>
    <xmx:gUvTaSi3cqWSffSvz5JvnuPpgoMbjgAMfvsoI5mFe37KDxuXK4_yeg>
    <xmx:gUvTac5towHA_lfPrIMfe1mFMqS-hIA3pANT4tIh1W11CTZ6QXQeixwH>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 01:58:25 -0400 (EDT)
Date: Mon, 6 Apr 2026 00:58:23 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Christoph Hellwig <hch@lst.de>
Cc: ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 5/7] ecryptfs: sanitize struct iattr handling in
 truncate_upper
Message-ID: <adNLfwLA4Iuvvupk@yaupon>
References: <20260331153752.4049454-1-hch@lst.de>
 <20260331153752.4049454-6-hch@lst.de>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331153752.4049454-6-hch@lst.de>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1188-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tyhicks.com:dkim,lst.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A9E763A1B5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-31 17:37:26, Christoph Hellwig wrote:
> Currently the two callers of truncate_upper handle passing information
> very differently.  ecryptfs_truncate passes a zeroed lower_ia and expects
> truncate_upper to fill it in from the upper ia created just for that,
> while ecryptfs_setattr passes a fully initialized lower_ia copied from
> the upper one.
> 
> Switch to only passing a lower ia which must have ia_size set to the
> expected lower size, which cleans up the logic in truncate_upper and
> ecryptfs_truncate.

This one isn't making sense to me. It is shoving the upper inode size
into the lower_ia->ia_size, which are two different values for encrypted
files. I find that it makes truncate_upper() more confusing to read.

I'm wondering if the following function signature would make more sense
so that we can make better sense of which inode size we're talking about:

 static int truncate_upper(struct dentry *dentry, size_t upper_size,
			   struct iattr *lower_ia)

Tyler

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ecryptfs/inode.c | 39 ++++++++++++++++++---------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 7a3da72eb3c6..a7dc25fae8ee 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -709,7 +709,6 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
>  /**
>   * truncate_upper
>   * @dentry: The ecryptfs layer dentry
> - * @ia: Address of the ecryptfs inode's attributes
>   * @lower_ia: Address of the lower inode's attributes
>   *
>   * Function to handle truncations modifying the size of the file. Note
> @@ -722,8 +721,7 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
>   *
>   * Returns zero on success; non-zero otherwise
>   */
> -static int truncate_upper(struct dentry *dentry, struct iattr *ia,
> -			  struct iattr *lower_ia)
> +static int truncate_upper(struct dentry *dentry, struct iattr *lower_ia)
>  {
>  	struct inode *inode = d_inode(dentry);
>  	struct ecryptfs_crypt_stat *crypt_stat;
> @@ -733,7 +731,7 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
>  	size_t num_zeros;
>  	int rc;
>  
> -	if (unlikely((ia->ia_size == i_size))) {
> +	if (unlikely(lower_ia->ia_size == i_size)) {
>  		lower_ia->ia_valid &= ~ATTR_SIZE;
>  		return 0;
>  	}
> @@ -742,7 +740,7 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
>  	if (rc)
>  		return rc;
>  
> -	if (ia->ia_size > i_size) {
> +	if (lower_ia->ia_size > i_size) {
>  		char zero[] = { 0x00 };
>  
>  		/*
> @@ -751,16 +749,14 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
>  		 * intermediate portion of the previous end of the file and the
>  		 * new and of the file.
>  		 */
> -		rc = ecryptfs_write(inode, zero, ia->ia_size - 1, 1);
> +		rc = ecryptfs_write(inode, zero, lower_ia->ia_size - 1, 1);
>  		lower_ia->ia_valid &= ~ATTR_SIZE;
>  		goto out;
>  	}
>  
>  	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
>  	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
> -		truncate_setsize(inode, ia->ia_size);
> -		lower_ia->ia_size = ia->ia_size;
> -		lower_ia->ia_valid |= ATTR_SIZE;
> +		truncate_setsize(inode, lower_ia->ia_size);
>  		goto out;
>  	}
>  
> @@ -769,17 +765,17 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
>  	 * ia->ia_size is located. Fill in the end of that page from
>  	 * (ia->ia_size & ~PAGE_MASK) to PAGE_SIZE with zeros.
>  	 */
> -	num_zeros = PAGE_SIZE - (ia->ia_size & ~PAGE_MASK);
> +	num_zeros = PAGE_SIZE - (lower_ia->ia_size & ~PAGE_MASK);
>  	if (num_zeros) {
>  		rc = ecryptfs_write(inode, page_address(ZERO_PAGE(0)),
> -				ia->ia_size, num_zeros);
> +				lower_ia->ia_size, num_zeros);
>  		if (rc) {
>  			pr_err("Error attempting to zero out the remainder of the end page on reducing truncate; rc = [%d]\n",
>  				rc);
>  			goto out;
>  		}
>  	}
> -	truncate_setsize(inode, ia->ia_size);
> +	truncate_setsize(inode, lower_ia->ia_size);
>  	rc = ecryptfs_write_inode_size_to_metadata(inode);
>  	if (rc) {
>  		pr_err("Problem with ecryptfs_write_inode_size_to_metadata; rc = [%d]\n",
> @@ -794,13 +790,12 @@ static int truncate_upper(struct dentry *dentry, struct iattr *ia,
>  	lower_size_before_truncate =
>  		upper_size_to_lower_size(crypt_stat, i_size);
>  	lower_size_after_truncate =
> -		upper_size_to_lower_size(crypt_stat, ia->ia_size);
> -	if (lower_size_after_truncate < lower_size_before_truncate) {
> +		upper_size_to_lower_size(crypt_stat, lower_ia->ia_size);
> +	if (lower_size_after_truncate < lower_size_before_truncate)
>  		lower_ia->ia_size = lower_size_after_truncate;
> -		lower_ia->ia_valid |= ATTR_SIZE;
> -	} else {
> +	else
>  		lower_ia->ia_valid &= ~ATTR_SIZE;
> -	}
> +
>  out:
>  	ecryptfs_put_lower_file(inode);
>  	return rc;
> @@ -840,15 +835,17 @@ static int ecryptfs_inode_newsize_ok(struct inode *inode, loff_t offset)
>   */
>  int ecryptfs_truncate(struct dentry *dentry, loff_t new_length)
>  {
> -	struct iattr ia = { .ia_valid = ATTR_SIZE, .ia_size = new_length };
> -	struct iattr lower_ia = { .ia_valid = 0 };
> +	struct iattr lower_ia = {
> +		.ia_valid	= ATTR_SIZE,
> +		.ia_size	= new_length,
> +	};
>  	int rc;
>  
>  	rc = ecryptfs_inode_newsize_ok(d_inode(dentry), new_length);
>  	if (rc)
>  		return rc;
>  
> -	rc = truncate_upper(dentry, &ia, &lower_ia);
> +	rc = truncate_upper(dentry, &lower_ia);
>  	if (!rc && lower_ia.ia_valid & ATTR_SIZE) {
>  		struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
>  
> @@ -943,7 +940,7 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
>  		if (rc)
>  			goto out;
>  
> -		rc = truncate_upper(dentry, ia, &lower_ia);
> +		rc = truncate_upper(dentry, &lower_ia);
>  		if (rc < 0)
>  			goto out;
>  	}
> -- 
> 2.47.3
> 

