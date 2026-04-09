Return-Path: <ecryptfs+bounces-1213-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dR8ZOs/t1mlYJwgAu9opvQ
	(envelope-from <ecryptfs+bounces-1213-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 09 Apr 2026 02:07:43 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D452D3C4E33
	for <lists+ecryptfs@lfdr.de>; Thu, 09 Apr 2026 02:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE725300D4CA
	for <lists+ecryptfs@lfdr.de>; Thu,  9 Apr 2026 00:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9F39443;
	Thu,  9 Apr 2026 00:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="dCDABhCy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iDZVabFE"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5519B40DFAE;
	Thu,  9 Apr 2026 00:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775693258; cv=none; b=IrBW5agGGKLD0hNleO70zdKBK3muBbE9njqziBMXP/4/Wg4Wcw4bkcn52o/j1qPkqC4QihrgqUWyL6/12XifXhcVzYXnhnTUH7MIhBiqasgr8aqC46X998lvDlE5Jtj4YJmnAKURNXQxugcRMSecIUJbW84LTYuc5ZSJG68iEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775693258; c=relaxed/simple;
	bh=LTJhO4PUlsDSzynoV7ivgbozGedupRbR3Fz1RLTIn/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tg+6qJ23y+hyhjw1QO2wFVoSiwQ/FPkD8QQj3OuIQzt4XlpnnxSMX8t8f0vN+zTTwGuQdnhJhZuMu9yH4STzxcRv7ug3BPy9sito0uGUrzYIrSfM5HftBk5vHTAiwAtz1E0SiBJXwVqUmUZ3Gbs9zOpJ1ptyjqW08OeoR7X78BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=dCDABhCy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iDZVabFE; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 97F327A0096;
	Wed,  8 Apr 2026 20:07:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 08 Apr 2026 20:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775693255; x=1775779655; bh=DQod9pfZn/
	krv3MhRWUI8y7ddd07ZtbE0Brn9XcfkSQ=; b=dCDABhCy2Gf4JS1Wgt+0QZXHQU
	TLYKkScqXdBSsAXoLq0IXLFCyUchN0zc8YoRgpzRPlgcPhFiKcIItXaePYf0HUcR
	LMcEeoZKucPdFtaTY3ZtY+LdK9d7imYMJ971jXpXBhdFalQa0ndZ2pCFc+3RP4aK
	SGwuOwYKOranGX+ZxBaD6n74KfR/dJ08Ludus5GlvH9r68is+RqyRToF4j03jb2E
	O8IMR8E1m48A+/w1bRYdQq5vZjSWjKoE551wYfGRLn5FcH8QRN94JBAkEECuDrXG
	lGihFqEfkZxr4nhz7sZap24THPtXDLF0gtGXy6oPRkV7LaqTfaIfa+IYV84g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775693255; x=1775779655; bh=DQod9pfZn/krv3MhRWUI8y7ddd07ZtbE0Br
	n9XcfkSQ=; b=iDZVabFEyCu9feJN3KSGAeXDFhXL5Fsyr9GAnUI5rWziDyT/VXE
	1OMxVxWj3esH8z7XzWDYtPWGhxlMxw/gemuI70eqCLe6sC7ARXAZvA+xfycKT5uX
	rtoEPY2I694ow1qCG4QG6xHMBqHkOrYmCEKZxLqvKZm0TRK8UX6XWTThrkzMXSZR
	SUYiCwbneFranNPm7LR2MsWUj8H5KN2sXBo5M/7wQaE8GN9EPZghla18baqQQnLA
	Z+A0pSem5xqHrp+5ExIl9wiLjWNOpsdEJ7ElLuApYCMpSYg6XSoqg27YPFrmw86f
	hKCS7qcpIXAavwd08ijZBC6EcHkLXcwkkHw==
X-ME-Sender: <xms:x-3WaT-TKtD5H_e0mq77xrI_YjbMORYAcjgLIMCD0FxjoB0wygwk4g>
    <xme:x-3WaXfPSSui-0FktiVYkGrJRxKoBzNAGrrHKGO4EWtParlYAvYSvbi17VexoFyYB
    L2M2Dtz8VNKdR67x4ftTQp9HorT9gcr-7fdVq9pB3u5fnlDSzueYw>
X-ME-Received: <xmr:x-3WaUG755wWshMsneHVCBys2y1aOgz6QSBh8CY-ivfg8VLKbpcm9ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvgeelkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    ffudfhuddvheeuffeuffeftddukeeukeefgeevffdvgedvteffhfeigeeiheefvdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesth
    ihhhhitghkshdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohephhgthheslhhsthdruggvpdhrtghpthhtohepvggtrhihphhtfhhsse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:x-3WadehZAm7PqzmqVVKkf8bUM1VkvfxOBc_Z1PLKyeAo12b0GA49w>
    <xmx:x-3WaWEcR3sC8aHfczob3r0RsTqS7CnGTSPD9NPBIYHWMtmr0OlTRg>
    <xmx:x-3WaeX7YAt2qT_Pf5IAEu1PaOHalL84U0c0Zdhn20Kl-aQzDDVn8w>
    <xmx:x-3WaVIMoTWqxJx6I6KZCGvhtSy9Z-u8UBaynAIBJEZLi2haH7MVEg>
    <xmx:x-3WaUDRcib9Cd6bduktPd7anhRtjAMIxjcLb1kAE9EwcM_A9v9tyXFc>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Apr 2026 20:07:34 -0400 (EDT)
Date: Wed, 8 Apr 2026 19:07:33 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Christoph Hellwig <hch@lst.de>
Cc: ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/7] ecryptfs: streamline truncate_upper
Message-ID: <adbtxTbIBBeuYBVV@yaupon>
References: <20260408060719.714317-1-hch@lst.de>
 <20260408060719.714317-3-hch@lst.de>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408060719.714317-3-hch@lst.de>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1213-lists,ecryptfs=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tyhicks.com:dkim,messagingengine.com:dkim]
X-Rspamd-Queue-Id: D452D3C4E33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-08 08:06:37, Christoph Hellwig wrote:
> Use a few strategic gotos to keep reduce indentation and keep the
> main reduce size flow outside of branches.  Switch all touched comments
> to normal kernel style and avoid breaks in printed strings for all
> the code touched.

That garbled first sentence is still here. I'll touch it up according to
our email exchange on v1.

Tyler

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ecryptfs/inode.c | 115 +++++++++++++++++++++++---------------------
>  1 file changed, 60 insertions(+), 55 deletions(-)
> 
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 81cf42d01ec5..695573850569 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -725,83 +725,88 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
>  static int truncate_upper(struct dentry *dentry, struct iattr *ia,
>  			  struct iattr *lower_ia)
>  {
> -	int rc = 0;
>  	struct inode *inode = d_inode(dentry);
>  	struct ecryptfs_crypt_stat *crypt_stat;
>  	loff_t i_size = i_size_read(inode);
>  	loff_t lower_size_before_truncate;
>  	loff_t lower_size_after_truncate;
> +	size_t num_zeros;
> +	int rc;
>  
>  	if (unlikely((ia->ia_size == i_size))) {
>  		lower_ia->ia_valid &= ~ATTR_SIZE;
>  		return 0;
>  	}
> +
>  	rc = ecryptfs_get_lower_file(dentry, inode);
>  	if (rc)
>  		return rc;
> -	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
> -	/* Switch on growing or shrinking file */
> +
>  	if (ia->ia_size > i_size) {
>  		char zero[] = { 0x00 };
>  
> +		/*
> +		 * Write a single 0 at the last position of the file; this
> +		 * triggers code that will fill in 0's throughout the
> +		 * intermediate portion of the previous end of the file and the
> +		 * new end of the file.
> +		 */
> +		rc = ecryptfs_write(inode, zero, ia->ia_size - 1, 1);
>  		lower_ia->ia_valid &= ~ATTR_SIZE;
> -		/* Write a single 0 at the last position of the file;
> -		 * this triggers code that will fill in 0's throughout
> -		 * the intermediate portion of the previous end of the
> -		 * file and the new and of the file */
> -		rc = ecryptfs_write(inode, zero,
> -				    (ia->ia_size - 1), 1);
> -	} else { /* ia->ia_size < i_size_read(inode) */
> -		/* We're chopping off all the pages down to the page
> -		 * in which ia->ia_size is located. Fill in the end of
> -		 * that page from (ia->ia_size & ~PAGE_MASK) to
> -		 * PAGE_SIZE with zeros. */
> -		size_t num_zeros = (PAGE_SIZE
> -				    - (ia->ia_size & ~PAGE_MASK));
> -
> -		if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
> -			truncate_setsize(inode, ia->ia_size);
> -			lower_ia->ia_size = ia->ia_size;
> -			lower_ia->ia_valid |= ATTR_SIZE;
> -			goto out;
> -		}
> -		if (num_zeros) {
> -			char *zeros_virt;
> +		goto out;
> +	}
>  
> -			zeros_virt = kzalloc(num_zeros, GFP_KERNEL);
> -			if (!zeros_virt) {
> -				rc = -ENOMEM;
> -				goto out;
> -			}
> -			rc = ecryptfs_write(inode, zeros_virt,
> -					    ia->ia_size, num_zeros);
> -			kfree(zeros_virt);
> -			if (rc) {
> -				printk(KERN_ERR "Error attempting to zero out "
> -				       "the remainder of the end page on "
> -				       "reducing truncate; rc = [%d]\n", rc);
> -				goto out;
> -			}
> -		}
> +	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
> +	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
>  		truncate_setsize(inode, ia->ia_size);
> -		rc = ecryptfs_write_inode_size_to_metadata(inode);
> +		lower_ia->ia_size = ia->ia_size;
> +		lower_ia->ia_valid |= ATTR_SIZE;
> +		goto out;
> +	}
> +
> +	/*
> +	 * We're chopping off all the pages down to the page in which
> +	 * ia->ia_size is located. Fill in the end of that page from
> +	 * (ia->ia_size & ~PAGE_MASK) to PAGE_SIZE with zeros.
> +	 */
> +	num_zeros = PAGE_SIZE - (ia->ia_size & ~PAGE_MASK);
> +	if (num_zeros) {
> +		char *zeros_virt;
> +
> +		zeros_virt = kzalloc(num_zeros, GFP_KERNEL);
> +		if (!zeros_virt) {
> +			rc = -ENOMEM;
> +			goto out;
> +		}
> +		rc = ecryptfs_write(inode, zeros_virt, ia->ia_size, num_zeros);
> +		kfree(zeros_virt);
>  		if (rc) {
> -			printk(KERN_ERR	"Problem with "
> -			       "ecryptfs_write_inode_size_to_metadata; "
> -			       "rc = [%d]\n", rc);
> +			pr_err("Error attempting to zero out the remainder of the end page on reducing truncate; rc = [%d]\n",
> +				rc);
>  			goto out;
>  		}
> -		/* We are reducing the size of the ecryptfs file, and need to
> -		 * know if we need to reduce the size of the lower file. */
> -		lower_size_before_truncate =
> -		    upper_size_to_lower_size(crypt_stat, i_size);
> -		lower_size_after_truncate =
> -		    upper_size_to_lower_size(crypt_stat, ia->ia_size);
> -		if (lower_size_after_truncate < lower_size_before_truncate) {
> -			lower_ia->ia_size = lower_size_after_truncate;
> -			lower_ia->ia_valid |= ATTR_SIZE;
> -		} else
> -			lower_ia->ia_valid &= ~ATTR_SIZE;
> +	}
> +	truncate_setsize(inode, ia->ia_size);
> +	rc = ecryptfs_write_inode_size_to_metadata(inode);
> +	if (rc) {
> +		pr_err("Problem with ecryptfs_write_inode_size_to_metadata; rc = [%d]\n",
> +			rc);
> +		goto out;
> +	}
> +
> +	/*
> +	 * We are reducing the size of the ecryptfs file, and need to know if we
> +	 * need to reduce the size of the lower file.
> +	 */
> +	lower_size_before_truncate =
> +		upper_size_to_lower_size(crypt_stat, i_size);
> +	lower_size_after_truncate =
> +		upper_size_to_lower_size(crypt_stat, ia->ia_size);
> +	if (lower_size_after_truncate < lower_size_before_truncate) {
> +		lower_ia->ia_size = lower_size_after_truncate;
> +		lower_ia->ia_valid |= ATTR_SIZE;
> +	} else {
> +		lower_ia->ia_valid &= ~ATTR_SIZE;
>  	}
>  out:
>  	ecryptfs_put_lower_file(inode);
> -- 
> 2.47.3
> 

