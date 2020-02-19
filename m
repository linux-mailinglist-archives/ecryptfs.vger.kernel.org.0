Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D44A0164A69
	for <lists+ecryptfs@lfdr.de>; Wed, 19 Feb 2020 17:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgBSQbF (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 19 Feb 2020 11:31:05 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40993 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgBSQbE (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 19 Feb 2020 11:31:04 -0500
Received: by mail-oi1-f194.google.com with SMTP id i1so24352010oie.8
        for <ecryptfs@vger.kernel.org>; Wed, 19 Feb 2020 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1aoHAWv0nOCtw8PzftLhxJ+T1Z3zgiGL46zbgAB0G28=;
        b=pacyCfqwIjO2J01FAfD97//5zct9TbRFge7KIfF3OFQXuRJ4uk5OKoep9Fb4aaGcOg
         Ks5wh9O2URq6VzzEOOfHNSRVaLE00fhQ1MahJTpt0unx8tZ2dCoQP2o2x/ZnCP/e6aXN
         0I91egxoVgLVTjPLR53Fp5HduxBIk2lOV3tI4cSbOwf5/W46C/oiZBmoxDCFnBxO4BRj
         hnXG8Ol3LZJu1+B4DhC2UvSFBWnIw0NtOIyi2mwH+00WUV/xTZoyEiBRkpj/cSWR253Z
         YT0rzBVXQ3ZlS5MrCfYlPIXqTRxcARr1HDHk31LOEHI73pQnwUq/r6fxAubsF8ZT0W2S
         ApUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1aoHAWv0nOCtw8PzftLhxJ+T1Z3zgiGL46zbgAB0G28=;
        b=MZXipXdRgGFZ6BY/KwoR8Mu/eERAO2l5aykyu54uWmdBi4YIHdelhB68rhnsvxoTaE
         DyZJqorAa6MxcSuLR89/d/9cQJco1GdbkPkBeZ45GG/p7YlLlQLR2TXZmErtdxhugL12
         b2KZK4+qiJnNH37HnPbysOybEnr3UXRl7AGf2XF8CKIBrNT0x4n5PsTvKTMn2Q406jHm
         4zBBrqRFRQ5wuPc6AzXQa6UcIhg9V7FvFALQZGpxeUyCs9pVH97ZFFm1SPcVthoci6iM
         dHjMai4RkedDQCOHaFYHz/ZGxHmR/MlsXhHYWp0UJYPhVZdxMMtqOod7sLfbi6wQS8br
         SvlQ==
X-Gm-Message-State: APjAAAUPRzXKnKn7m5ZSt0E83hBBqVgrmTFw8OmlB7456WJjjmABWwIx
        y/qlPSUSdDvsw1T87EEuS+riVWmPq+E=
X-Google-Smtp-Source: APXvYqyvvnJ2VdvoMhc+aWIPY+W0ikXJbMMwxdUknCQwa2QgWHZOQfC2g1hFnnWNiPPvOO/dj2j97w==
X-Received: by 2002:aca:db43:: with SMTP id s64mr4886843oig.144.1582129863085;
        Wed, 19 Feb 2020 08:31:03 -0800 (PST)
Received: from elm (162-237-133-238.lightspeed.rcsntx.sbcglobal.net. [162.237.133.238])
        by smtp.gmail.com with ESMTPSA id b15sm65534otl.60.2020.02.19.08.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 08:31:02 -0800 (PST)
Date:   Wed, 19 Feb 2020 10:30:50 -0600
From:   Tyler Hicks <code@tyhicks.com>
To:     Brian Kubisiak <brian.kubisiak@gmail.com>
Cc:     ecryptfs@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: add mount option for specifying cipher driver.
Message-ID: <20200219163050.GA354535@elm>
References: <20200210153907.GA348@brian-desktop>
 <20200216010731.GA260140@elm>
 <20200219014218.GA17588@neutron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219014218.GA17588@neutron>
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2020-02-18 17:42:18, Brian Kubisiak wrote:
> Hi Tyler,
> 
> > Can you elaborate some on the use case you have?
> 
> On many modern embedded SoCs, there are multiple implementations of the same
> crypto algorithm---usually a CPU-based implementation using ISA extensions and a
> "security engine" implementation that implements crypto primitives on dedicated
> silicon. There are a few tradeoffs involved (performance, CPU overhead,
> resistance to side-channels attacks, etc), so it is not always clear which
> implementation is best.
> 
> An SoC that I've been working on has both the CPU implementation and the
> security engine implementation of the cbc(aes) algorithm at the same priority,
> so the one picked to perform the encryption for a given ecryptfs mount is
> somewhat random.

Have you looked into the possibility of increasing the priority of the
implementation that you prefer on your SoC?

If that's not feasible, have you considered blacklisting the module
providing the implementation that you don't prefer?

> My intention with this patch is to be able to select which
> implementation gets used for the mount using the
> ecryptfs_cipher_driver option instead of having the kernel pick.

I don't think allowing users to specify a cipher driver is a good idea.
eCryptfs has always assumed that the crypto subsystem knows best about
the ideal implementation of "cbc(aes)" and I believe that this is how
the crypto subsystem expects eCryptfs to make use of their API.

In addition to the design objection above, I'm worried about users
shooting themselves in the foot with this mount option. For example,
"ecryptfs_cipher_driver=ecb_aes_aesni" and
"ecryptfs_cipher_driver=xts_aes_aesni" are accepted. eCryptfs is only
implemented to operated in a (modified) CBC mode and letting users force
their way into using anything else is dangerous/insecure.

Lets see if we can address your problem in the crypto subsystem (or with
the module blacklist) rather than creating this amount of flexibility in
eCryptfs.

Tyler

> The fact that this would also effectively override the ecryptfs_cipher option is
> an unintended side effect, since the crypto_alloc_skcipher() function will take
> either the algorithm name or the driver name. Maybe there is a better way to do
> this?
> 
> Thanks,
> Brian
