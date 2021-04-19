Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D75A363C70
	for <lists+ecryptfs@lfdr.de>; Mon, 19 Apr 2021 09:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237708AbhDSH1P (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 19 Apr 2021 03:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233438AbhDSH1P (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 19 Apr 2021 03:27:15 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B06C061760
        for <ecryptfs@vger.kernel.org>; Mon, 19 Apr 2021 00:26:45 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id c15so23883094wro.13
        for <ecryptfs@vger.kernel.org>; Mon, 19 Apr 2021 00:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2BaP8TWvorcR2IXXU9ccES/WVlUvsF3IFm5ixOqLO3o=;
        b=VnNUxmSp7rV1E+zt9+v9bbnrLQj2oLUH6GDzULyEn6CsIIuC2iJhE9pdqhq1y1KDdh
         3Jc3LYi8xkNFCs2oNuIKGuVXcXbL/Wh4zGgoCjaWS9QzdNPmPn286/NM+SkWvmbuY6Gu
         g3R3j2cmPVF+NH1jCDNLXsqPIL6YYEjLlXQJ/Qpji1qKlaX3tMMkGELYdqaQvCnQG82+
         grWr+iS8nLaPuFepAqCIg+5XyN4qx3zqU6Ud5lOabUUuUQ7L5jS4489p9ja0aV9NPi6u
         An+OvxWaovvgq/epfyLNuIv2ESxcKg5CJfEcZFUcp9zKseNViMxm3skm2GCfkF4Osn0k
         otzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2BaP8TWvorcR2IXXU9ccES/WVlUvsF3IFm5ixOqLO3o=;
        b=qiyOligpJMI3nOB5pPXam+1nkR46LA+/HlLW47Ii11ezJtFDoH67TfX6BTDAlgNtWW
         Oo3QTr8gLl73885mp2IQ9UqznAgjee2ZOHOQfGA5NsHm4jFJ1nqurYVXZ2oMhMfSxN5N
         HT9uprirKpc5bCZoSxhCTL9AhyjBgD5X4w89hcZHxl29n+N3RsuT4RNDRP+bmenQ+HGs
         7i4Q8h4+3Q+p1lCjByuhwinWP8CiFZDtOkHDPH9cBtX6xYElIH/cjoriXBBMCOOtrG/g
         HS0WuLTwFgj/xbNsATR37VZBepdbSRtNPvG0rzzY6tm9WHQVnpTHXNs0rLzGkonQaFH7
         tuRw==
X-Gm-Message-State: AOAM530LalsnQECziMNV37xYIwh4YPC3HsscX9qrR4MXThcQiytg2IV4
        2g3oYi+PH3BrQNHjo777OsdRWQ==
X-Google-Smtp-Source: ABdhPJxiB6PCNMvbcsVLql5kAlV60E/PKSrqhL/E5Cjb7JzKzneD+W19Bc+ZeApiSVEfX0mGnHTkGQ==
X-Received: by 2002:a5d:5711:: with SMTP id a17mr12824723wrv.342.1618817204632;
        Mon, 19 Apr 2021 00:26:44 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id s64sm18910767wmf.2.2021.04.19.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 00:26:44 -0700 (PDT)
Date:   Mon, 19 Apr 2021 08:26:42 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Tyler Hicks <code@tyhicks.com>
Cc:     linux-kernel@vger.kernel.org,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Bob Peterson <rpeterso@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        cluster-devel@redhat.com, David Howells <dhowells@redhat.com>,
        ecryptfs@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
        James Morris <jamorris@linux.microsoft.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        "Michael A. Halcrow" <mahalcro@us.ibm.com>,
        "Michael A. Halcrow" <mhalcrow@us.ibm.com>,
        "Michael C. Thompsion" <mcthomps@us.ibm.com>,
        Michal Hocko <mhocko@suse.com>,
        "Trevor S. Highland" <trevor.highland@gmail.com>,
        Tycho Andersen <tycho@tycho.pizza>,
        Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 00/31] Rid W=1 warnings from GFS2 and EncryptFS
Message-ID: <20210419072642.GD4869@dell>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
 <20210419050926.GB405651@elm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210419050926.GB405651@elm>
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On Mon, 19 Apr 2021, Tyler Hicks wrote:

> On 2021-03-30 17:44:27, Lee Jones wrote:
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > There is more to do in filesystems.  Another set will follow.
> > 
> > Lee Jones (31):
> ...
> >   fs: ecryptfs: read_write: File headers do not make good candidates for
> >     kernel-doc
> >   fs: ecryptfs: debug: Demote a couple of kernel-doc abuses
> >   fs: ecryptfs: dentry: File headers are not good candidates for
> >     kernel-doc
> >   fs: ecryptfs: kthread: Demote file header and provide description for
> >     'cred'
> >   fs: ecryptfs: file: Demote kernel-doc abuses
> >   fs: ecryptfs: super: Fix formatting, naming and kernel-doc abuses
> >   fs: ecryptfs: messaging: Add missing param descriptions and demote
> >     abuses
> >   fs: ecryptfs: main: Demote a bunch of non-conformant kernel-doc
> >     headers
> >   fs: ecryptfs: miscdev: File headers are not good kernel-doc candidates
> >   fs: ecryptfs: crypto: Supply some missing param descriptions and
> >     demote abuses
> >   fs: ecryptfs: mmap: Help out one function header and demote other
> >     abuses
> >   fs: ecryptfs: inode: Help out nearly-there header and demote
> >     non-conformant ones
> >   fs: ecryptfs: keystore: Fix some kernel-doc issues and demote
> >     non-conformant headers
> 
> I've applied the eCryptfs fixes to the next branch of
> tyhicks/ecryptfs.git. Thanks for the clean-up!

Thanks Tyler, much appreciated.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
