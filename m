Return-Path: <ecryptfs+bounces-772-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB34D14E53
	for <lists+ecryptfs@lfdr.de>; Mon, 12 Jan 2026 20:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CEE2302A13A
	for <lists+ecryptfs@lfdr.de>; Mon, 12 Jan 2026 19:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E7F318EF1;
	Mon, 12 Jan 2026 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="Kq+sPy2H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pE16u0vH"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753D9311C31;
	Mon, 12 Jan 2026 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768245729; cv=none; b=DVIjTiaWN9ufbOFdUYGSzR5EQitQW6qamdM0JtaNMSVk0O2oN/1zWCxDfVEapnQpaprIH1Aplv4aNDWrvxWqRdVCsSob4oNCVUnI/AehaCd87EyUOubx+ATwyZoQqcPPNmTfT+xhq247glcDtPpjWeI7EZe7NhnhPB+VmBLLuMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768245729; c=relaxed/simple;
	bh=5aHSUaWvuAA12ZziPYYRXct1+AGzBqhGXB8nHi93WfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvgDpl3ceCmFUlLBM5wgbmjmHKUBAs47HlXlsQsGuW3L0Z0ka7qdG/aNgcWGnzyDtohEaROHk1EGygmotnIQbaA/bXer+x0Eoi6TI/e7k7WFLwrjJScKIrq4GpWqrwN8efIHbBrXQK5nvpYySFakri0JuBydIOGspHApj2ZUgOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=Kq+sPy2H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pE16u0vH; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A99B314000D0;
	Mon, 12 Jan 2026 14:22:06 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 12 Jan 2026 14:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768245726; x=1768332126; bh=1USmkfqEoV
	DKAaDeCDvD/SgrMPZzbQ1SV/gBjGQD2jE=; b=Kq+sPy2HtnJm7Udwy5hNidEqzG
	WDA5X3K5v93K7RyBpphhtDkCSkQc9+okoYXZr8TRkobzckQ3bVqQqwfczI3cAP+c
	jlaZ7EW01KV0fYh0e8KCjF8Aa3+0e5+Zow2V72KdCNPqlbqgKmpUGmqn2KYzM9N9
	Qd74jesIkdWBdgpXOb9jBPLeE/Jr6UVZTNP+4ALznR36G5rzN+fsMksm3yxmk8DQ
	5jLl48W2qt6RbIwHUx4FCls4O95JFLwTxH5/6e718uNTuHsNJFXglcyfiArpwXNE
	RduVw7YscwohjBaFgHjkMolBJdPpSj4ChrbP8MwUxoZX6b+UWvXuAbK0KbXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768245726; x=1768332126; bh=1USmkfqEoVDKAaDeCDvD/SgrMPZzbQ1SV/g
	BjGQD2jE=; b=pE16u0vHGM1Sz5jJO1aeiULvKovqRPycEw2udIWoVxdqNhCVGyi
	tuYDg7m9u1UU0eWDaGGu4UVSjNeTDpvbL9nrr/g2swtBWoXoAnJ03HrBODhgguYD
	jFpOmH4zbqY6O6c0y++BeX2bXQ1D7KM5JrBwOVsvAS/gLYuMtZfawjY+ZM7PNUci
	U0ze/Foc4VjKPjIaScaLxX8QQIgfNbygKM6e6wLRGCGHPMBdVdGB06Ep2DBXJSRG
	uu81je8LvsN47g9SMSBMDNZmGvzeuSNVhKz5uNLD9jRuAV3P2U5RYmA2m94/4v1k
	Dj9T2yFrfAEVrorb8MViSuqG2xc5VBSOr2A==
X-ME-Sender: <xms:3kllaRXrEfgrjyBE3KaJaZjcOrhv5LREkWnprsTUp5w2_RdTas69NQ>
    <xme:3kllaSCs07dmXOvkwErpG9rHXV4g_cLedc0srSz_JS3wvMpbvxjThQZ1-zNIDOPij
    xsaJhFw_sa255oG82Z5M_S5FgnRWg2WGHJiYE8IKK0hW3gcrU6uHEw>
X-ME-Received: <xmr:3kllaeEFTKh7M994Dm52hftOLOk6QYFF2zNAQcWiVPwmJ1Zi0hfOVcs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudekvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epvdehvddttdfhfefhtdfgleehfeeggfdujeeuveekudevkedvgeejtddtfefgleeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghouggvse
    hthihhihgtkhhsrdgtohhmpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehthhhorhhsthgvnhdrsghluhhmsehlihhnuhigrdguvghvpdhrtg
    hpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopeiihhgrnhhgiihi
    phgvnhhgtdesfhhogihmrghilhdrtghomhdprhgtphhtthhopegsrhgruhhnvghrsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprh
    gtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegvtghrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:3kllab6N3vaGnbDWencLSkaQ73U6sr-GG7Osez-kBfarwiZKnKeQPg>
    <xmx:3kllaclG6fJ2VL4xDGlb2VW3xWfEUW52z8zOB3P1PRv5Tc036SNonA>
    <xmx:3kllae66rMIZFhJdh341OL59uOY0LgzctwXQ2KiOHeOp5FrLSe3elQ>
    <xmx:3kllaVRDAycS8Ha_ie3cXuaxrDLr1Gdfnx9vPq0xFrlCK_zUg18sHg>
    <xmx:3kllafnV7LxhAM41N-Zv0ozuwRI88jP2wQi92Y99AUittfz8sLWYutjC>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Jan 2026 14:22:04 -0500 (EST)
Date: Mon, 12 Jan 2026 13:21:45 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: Add missing gotos in ecryptfs_read_metadata
Message-ID: <aWVJyRtk-7Wijd8J@yaupon>
References: <20260111003655.491722-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111003655.491722-1-thorsten.blum@linux.dev>

On 2026-01-11 01:36:52, Thorsten Blum wrote:
> Add two missing goto statements to exit ecryptfs_read_metadata() when an
> error occurs.
> 
> The first goto is required; otherwise ECRYPTFS_METADATA_IN_XATTR may be
> set when xattr metadata is enabled even though parsing the metadata
> failed. The second goto is not strictly necessary, but it makes the
> error path explicit instead of relying on falling through to 'out'.

Hey Thorsten - It seems like there's a bug here but I don't think this
is the actual bug. At the top of ecryptfs_read_metadata(), we call
ecryptfs_copy_mount_wide_flags_to_inode_flags() to copy the mount-wide
crypt_stat flags to the inode's crypt_stat flags. Therefore, the current
code is already redundant in setting ECRYPTFS_METADATA_IN_XATTR after
ecryptfs_read_headers_virt(). No matter if it succeeds or fails.

This logic is confusing but, IIRC, the goal is to handle files with
header metadata and files with xattr metadata within the same mount. I
think the real bug may be that we're not clearing the inode's
ECRYPTFS_METADATA_IN_XATTR flag when the mount crypt stat has the
ECRYPTFS_XATTR_METADATA_ENABLED flag set and
ecryptfs_read_headers_virt() returns success. I haven't looked at what
impact that has elsewhere in the code.

However, it has been a long time since I've looked at this code. I'd
like your thoughts. Thanks!

Tyler

> 
> Cc: stable@vger.kernel.org
> Fixes: dd2a3b7ad98f ("[PATCH] eCryptfs: Generalize metadata read/write")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  fs/ecryptfs/crypto.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index 260f8a4938b0..d49cdf7292ab 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -1328,6 +1328,7 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
>  			       "file xattr region either, inode %lu\n",
>  				ecryptfs_inode->i_ino);
>  			rc = -EINVAL;
> +			goto out;
>  		}
>  		if (crypt_stat->mount_crypt_stat->flags
>  		    & ECRYPTFS_XATTR_METADATA_ENABLED) {
> @@ -1340,6 +1341,7 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
>  			       "this like an encrypted file, inode %lu\n",
>  				ecryptfs_inode->i_ino);
>  			rc = -EINVAL;
> +			goto out;
>  		}
>  	}
>  out:
> -- 
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
> 

