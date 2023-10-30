Return-Path: <ecryptfs+bounces-4-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA97DBB66
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Oct 2023 15:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A174FB20CE4
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Oct 2023 14:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D401E1772C;
	Mon, 30 Oct 2023 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzR15MZS"
X-Original-To: ecryptfs@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7401015E8C
	for <ecryptfs@vger.kernel.org>; Mon, 30 Oct 2023 14:08:01 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FF2C0
	for <ecryptfs@vger.kernel.org>; Mon, 30 Oct 2023 07:07:59 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40839652b97so32954815e9.3
        for <ecryptfs@vger.kernel.org>; Mon, 30 Oct 2023 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698674878; x=1699279678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+x6+LsrjZdB8dHUELRSubYTsHMKRqi5GBjTWofSCMDk=;
        b=XzR15MZSaJ5rcYRcqgEh7c8vUnMlL5v9R+zWTwbI4usZ3aPhMF5rinw2t9iEsxbYEy
         H5gp4XB4XlAF/bySz4rt+PGc1f9nyW3YWafsXXMnE/bOlaJUML8A/VkrmnMLZRS7GJ3k
         QAHXipYM3oM7fyBAzg8G9PLSi2//LurYS2cgeE8y21NB+MrZWFOi9KJcUk2uz7GvyuvZ
         9DhRI/ZZbSo9WlgwrqMO3uyewsXb+6ijOq3wlwgL9zZFDAO5RLCee/dqzKe0IV2X0e+o
         X6QWMr3R1z9/hSMtDLx0pBB29Is//qmbc7/DrsFFH8bxOV15bcdUt3Miq1oRUyfipYIP
         nqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698674878; x=1699279678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+x6+LsrjZdB8dHUELRSubYTsHMKRqi5GBjTWofSCMDk=;
        b=Ge8pHyL4em5P56KnAvNxx6i2ZIsR/VNm57Ccev2Y+RuYGgcKpebGCFSEFDpnWq66uv
         GQ2h/yD8b1H0vKKqrLioPVsQePk57HTxaJDGKsIc1IXVqK8bGVF6AoUpiMy47eN6lP+w
         +97hZRsB7UoN26ce2DvunzZvTWi1dOq1c5xmBHiPqGgXMGsag9DSGkb7Hqj+g0P7flHL
         NNQlrEZ832KmGn6+s3pML0J9CjVNB9Zy6D3koFYovKN94Fb4TWICjrKA8w3jNz27NdZt
         EaEjEdarvC3CoLxpN32CLZrahnYsmUlYcV4oYFU1iZNhgw4TLqVKp8GmdxKifO8piKWc
         G7zQ==
X-Gm-Message-State: AOJu0Yxe2DFwLcT/WNlFKYZ/uWLxKFT2HG1t0j7jsOI1+O3mTnfbJBSp
	8PsAZdFV+VLcea/6onCrjiodvQ==
X-Google-Smtp-Source: AGHT+IHa3PONe2ZHFjs1Ut/yXYmZH5eEEBpHXQF4IG+q5Drd25RgyRrQwRp16iOxIIUmK+4amlW37A==
X-Received: by 2002:a05:600c:35cd:b0:406:872d:7725 with SMTP id r13-20020a05600c35cd00b00406872d7725mr8744073wmq.1.1698674878017;
        Mon, 30 Oct 2023 07:07:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g10-20020a5d46ca000000b0031980783d78sm8241952wrs.54.2023.10.30.07.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 07:07:57 -0700 (PDT)
Date: Mon, 30 Oct 2023 17:07:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tyler Hicks <code@tyhicks.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, ecryptfs@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: Simplify
 ecryptfs_crypto_api_algify_cipher_name()
Message-ID: <72f7eca6-3566-46fd-9ff9-386b4077d55d@kadam.mountain>
References: <2c4bd387e8036854d3338400038fdde8dce3806a.1698672391.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c4bd387e8036854d3338400038fdde8dce3806a.1698672391.git.christophe.jaillet@wanadoo.fr>

On Mon, Oct 30, 2023 at 02:27:32PM +0100, Christophe JAILLET wrote:
> Use kasprintf() instead of hand writing it.
> It is much less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


