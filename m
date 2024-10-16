Return-Path: <ecryptfs+bounces-164-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9119A0808
	for <lists+ecryptfs@lfdr.de>; Wed, 16 Oct 2024 13:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE3CFB25014
	for <lists+ecryptfs@lfdr.de>; Wed, 16 Oct 2024 11:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4281CACDB;
	Wed, 16 Oct 2024 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmsyOlcf"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2047207208;
	Wed, 16 Oct 2024 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729076816; cv=none; b=Y2MNy7H4dLkVla0He1rWrGy+zWlUaiielMipnoPGQmUC1touIz1DNPglZQtdSDOYsfnbFBhBpXgJNGPjdBBTdK5DHHoPzbWR2AnwF/1vD6/OV92AlaObm41ePJsvyotz5+SMyytQpw+jQa9NBTFlcn4khOfg8A6z+e+sUSTFJBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729076816; c=relaxed/simple;
	bh=QCZ0riA4KXlYTzoJ/11/Bb/+xk6ORhOod0g4QC/ZDhA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czFiQX1iquXseCiqb1UacASpIeZyY8ITc8kD8aTIqU9HLB0ySyjLlKJOkTPz1pieR4xJurOvkkfh0w4oMrpwS3WFG6QYL7ruDv9kaiZ5jEQ7rm1i3yeWTYtIjf8BqjKzIyq08FJId4rNbQ1e/WQglwriU5aSpKT2LaQjCvTZKJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmsyOlcf; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e59dadebso5361701e87.0;
        Wed, 16 Oct 2024 04:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729076813; x=1729681613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYyqrJz2TEk2igPzsfZXes1hSgjCxocHugD9O2531Pc=;
        b=WmsyOlcfEdv0/NTJZu3h3PFXK8E6WQSiVsA6YpFWRiMW6UeWsOeCcohAGaTpV/3f3h
         vAVwEbA5qa5H/oaulIePTAhkIQdpA0kpjAZgbMCOsHM/KRM8rFJfC9UdjVCcj86IoMaX
         eFzeYfWlzsdOz7VeJEXckGm4wx+/BWCu3xxVm71tPfYbKlabCnhBKZpg87qEa2UT5+0f
         noexxOlZdfqGf1GqiuEA72VkbqmkSVieFczadUGWzlLD3vnyw4tQUH6Y/kAXi7OMqOaq
         I1HqMakbHVUKHrGr0DbBXk0ivMuXGw6uoMFikVA7hHzR/6+zPYsOvNvtHOXyzsNEnnZ8
         GOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729076813; x=1729681613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYyqrJz2TEk2igPzsfZXes1hSgjCxocHugD9O2531Pc=;
        b=ZMUJTBhkfv+WvHJS78rIckT867jvEnI9N5oLPMRFZ55B0GmU3RkKqyeXtRH847hKZF
         26ZIp7fgb0oazyqp4tbbNC7ztcsk/nDZT+HQMXO9vr/yg3T9t3yW7K/H7AWDFmhl9bL8
         wnqgWIfHKvJOlEBC5XTtgVqLorkxgt6NTG83q5Usjomrar0NR0YbETJPV0V7JHI40zXq
         dHqipmfmlDYdFA1WJd4UI9RLaSk0d07YGJ3XLljC6UeaPNa3NORizBBqhl7nlbuTJJqv
         NPjMK7RZ+1P3L6ygGk8uz6ry1ASJyNAQ+kcyUix94rBv+ZblLdhz64S4CLWhdtByLGOS
         m1EA==
X-Forwarded-Encrypted: i=1; AJvYcCVNnnhPxar1fcXpsVWDuHS+/F5H83yWev6E2HOLfpDNhEvrdRZBzlDCVUoL60AjMp1lPphCo/YnmoUog5gM+t8S@vger.kernel.org, AJvYcCWqYs2GMJcRxQUqx6kcN0yML0Z90aSD9VXHAtAs2FpfgJzEWM6i/PwfiU1l4SvTCdE+4g+ho5uM4BjthxPv@vger.kernel.org, AJvYcCXUvkpva8zISGof0/zr+eLKnTdxLbkgk8hbf4JQd99zVXxLiQTRQ4kLnyOwf64w4IdoI+myuwGrbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXrPSkYA0P7NAzp3mVGSP2s0Bq/fcchWV66wHhXr0j77nI26xA
	0GG44Ec/efomMceLbxQnsv0SaCTDa568r7F3Yzu92XSTt/awC8AFfcKXUw==
X-Google-Smtp-Source: AGHT+IFzsH7xHJlaGwKRRrNEdurssvvGtU48fA0LNdlbvPDyKgpsdVl06DnG+xIbJhMyfP53PkJ0Rw==
X-Received: by 2002:a05:6512:3b13:b0:539:ea54:8d28 with SMTP id 2adb3069b0e04-53a03f0476dmr2780355e87.11.1729076812735;
        Wed, 16 Oct 2024 04:06:52 -0700 (PDT)
Received: from pc636 (host-95-203-1-67.mobileonline.telia.com. [95.203.1.67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ffff40c7sm417960e87.146.2024.10.16.04.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 04:06:52 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 16 Oct 2024 13:06:50 +0200
To: Julia Lawall <Julia.Lawall@inria.fr>, Tyler Hicks <code@tyhicks.com>
Cc: Tyler Hicks <code@tyhicks.com>, kernel-janitors@vger.kernel.org,
	vbabka@suse.cz, paulmck@kernel.org, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/17] eCryptfs: replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <Zw-eSn0_Tmg4aiqV@pc636>
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
 <20241013201704.49576-8-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013201704.49576-8-Julia.Lawall@inria.fr>

On Sun, Oct 13, 2024 at 10:16:54PM +0200, Julia Lawall wrote:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.
> 
> The changes were made using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  fs/ecryptfs/dentry.c |    8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/fs/ecryptfs/dentry.c b/fs/ecryptfs/dentry.c
> index acaa0825e9bb..49d626ff33a9 100644
> --- a/fs/ecryptfs/dentry.c
> +++ b/fs/ecryptfs/dentry.c
> @@ -51,12 +51,6 @@ static int ecryptfs_d_revalidate(struct dentry *dentry, unsigned int flags)
>  
>  struct kmem_cache *ecryptfs_dentry_info_cache;
>  
> -static void ecryptfs_dentry_free_rcu(struct rcu_head *head)
> -{
> -	kmem_cache_free(ecryptfs_dentry_info_cache,
> -		container_of(head, struct ecryptfs_dentry_info, rcu));
> -}
> -
>  /**
>   * ecryptfs_d_release
>   * @dentry: The ecryptfs dentry
> @@ -68,7 +62,7 @@ static void ecryptfs_d_release(struct dentry *dentry)
>  	struct ecryptfs_dentry_info *p = dentry->d_fsdata;
>  	if (p) {
>  		path_put(&p->lower_path);
> -		call_rcu(&p->rcu, ecryptfs_dentry_free_rcu);
> +		kfree_rcu(p, rcu);
>  	}
>  }
>  
> 
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

