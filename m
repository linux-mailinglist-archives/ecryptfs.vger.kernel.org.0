Return-Path: <ecryptfs+bounces-314-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DFAADB3C5
	for <lists+ecryptfs@lfdr.de>; Mon, 16 Jun 2025 16:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40B5F1889B46
	for <lists+ecryptfs@lfdr.de>; Mon, 16 Jun 2025 14:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D6B1F5433;
	Mon, 16 Jun 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dPcaAsgM"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D483208;
	Mon, 16 Jun 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083718; cv=none; b=uoHG1jjyyPSYvFIfzk5lM0Fb687CHWq9zwyJA02iHPKN9W6hvNsGZyeAGprDnTh24Jdcvx1sHJEH0RiUB1cqvvdSLJuxYWjGWYuYOi78X8If23PsdGufiFsfsNd/ZXN2fpaKn8jSuyzo105KN4/xJzDUXIZJepH+7dZ7vjTysFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083718; c=relaxed/simple;
	bh=p3eLjm8AytsTftxYwnahJKsvG3EAJFTXZMzq0TcQ3nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lARs3fbBMDZTdj+WJ2itUVG6CpAtoY89+X5iWpNbEouzPDlSntP6jNJsYt3jLPOgLKERRpi6MMtP02mJ1731q/3bydfWXC8v5/fMEHuJ3FbeeWbHTyQeyWv03K8p1/36k+tmZXn/0J0XUE4RXfZyUIghuBtFex13BzmF+QQyU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dPcaAsgM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04E8C4CEEA;
	Mon, 16 Jun 2025 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750083718;
	bh=p3eLjm8AytsTftxYwnahJKsvG3EAJFTXZMzq0TcQ3nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPcaAsgMAPKPvBzFGTzqSGI85588Sz5g4QRghOyAySdcc9HKYgJxiu6Ev6bc/dPQp
	 Nwe4sDmuL8JHVJN4fa7rt8IgdggwdSj8t5iCLJbrdRVdPdyat445nckuilaD7pQucy
	 SkJyQtsOrtlJT+sEJ9glaW6W3C/apUvzjcF3Ovqs=
Date: Mon, 16 Jun 2025 16:21:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: code@tyhicks.com, brauner@kernel.org, sandeen@redhat.com,
	colin.i.king@gmail.com, skhan@linuxfoundation.org,
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] fs/ecryptfs: use scnprintf() in version show
Message-ID: <2025061642-unaltered-antler-e6fa@gregkh>
References: <20250616104120.370832-1-pranav.tyagi03@gmail.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616104120.370832-1-pranav.tyagi03@gmail.com>

On Mon, Jun 16, 2025 at 04:11:20PM +0530, Pranav Tyagi wrote:
> Replace all snprintf() instances with scnprintf(). snprintf() returns
> the number of bytes that would have been written had there been enough
> space. For sysfs attributes, snprintf() should not be used for the
> show() method. Instead use scnprintf() which returns the number of
> bytes actually written.
> 
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  fs/ecryptfs/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
> index 8dd1d7189c3b..2a97c2b1fc69 100644
> --- a/fs/ecryptfs/main.c
> +++ b/fs/ecryptfs/main.c
> @@ -764,7 +764,7 @@ static struct kobject *ecryptfs_kobj;
>  static ssize_t version_show(struct kobject *kobj,
>  			    struct kobj_attribute *attr, char *buff)
>  {
> -	return snprintf(buff, PAGE_SIZE, "%d\n", ECRYPTFS_VERSIONING_MASK);
> +	return scnprintf(buff, PAGE_SIZE, "%d\n", ECRYPTFS_VERSIONING_MASK);

sysfs_emit() or no change at all please.

