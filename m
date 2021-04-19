Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDC8363AE2
	for <lists+ecryptfs@lfdr.de>; Mon, 19 Apr 2021 07:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhDSFKA (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 19 Apr 2021 01:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbhDSFJ7 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 19 Apr 2021 01:09:59 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B74C061760
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 22:09:29 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id b3so19545786oie.5
        for <ecryptfs@vger.kernel.org>; Sun, 18 Apr 2021 22:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fABlF+14BfgwTL8mrmDU7zMG3h8rFyGf7GZuESKF/uo=;
        b=r8GN68W5U1zMvQXpILWJgnXUF96294k/mjGkfrf6wnUHEIPjlP9bXpjG5R6R7S9Woh
         vlAqSYFgpJcn+iE2R7zrcTQzFx5vfMgMl6rSczOCnc7JKGF17JBBp1HnVu4Wk/pKlgRK
         G+6OatlZuWFHgDRMtgcX7ykD+6uGh4Nu5/+asDShEbc7jZEeYywVyxVOUIh9VfJuPW/K
         Xsxgoo0rsbkU/0Abzw9FwsWAdtvQTbXT5hmSAhS7A8FEtZNQB3nKje0jMh0jBELbhdw6
         gEWbtw/gUWpp0HOT5B97ShKrJoztUEqbmk3H+iTZnwfrQjHqm+JEZGFwAUHIUBQVegs2
         Dihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fABlF+14BfgwTL8mrmDU7zMG3h8rFyGf7GZuESKF/uo=;
        b=GvI4+tTzkObf7iabhJKnBRipipJZ5jhayq58NWOg5LVJuCkeIynRQgS9BpO+oirvDd
         BqF1XnXTlc3xev6nRF8wVsQLTbsxrWVYDln3TfpCh8kO9TUieUQgNQoI3IZ3gggVJNgV
         K4IBjgEQVjxj3HvsyPgUHFVbwQ+RP1k1I/dr40AKD7wqtAAlUAyKnFjySY+BL/5P59jM
         jmWj28HLO/7JNyHeQNAdJBrto5LvnGK23Qn8nRzr1opWZwYguDHo2JgOtHy0aKllo9tn
         QLaoDHCFAX5sjZrnIGY75iauj8+8WYXxtCyw1WpMzquRbSdJU/li2lO2qqG+lJ5kPcwQ
         wFSQ==
X-Gm-Message-State: AOAM530smk4ObvH9nCq/BxwkryhaPQZFueUgCYR92UUspWE1Y8cx7voR
        dxvQ4OunK+/tvcziPttP2OKnkQ==
X-Google-Smtp-Source: ABdhPJyuYzBsn68fl9VLHc7H54GcpcAV6KleKpLXoBj5CGl6GoWvD7RzUYe+oS5rlv9IZQcBX4jN+w==
X-Received: by 2002:a05:6808:f0a:: with SMTP id m10mr15432070oiw.48.1618808968841;
        Sun, 18 Apr 2021 22:09:28 -0700 (PDT)
Received: from elm (162-237-133-238.lightspeed.rcsntx.sbcglobal.net. [162.237.133.238])
        by smtp.gmail.com with ESMTPSA id v81sm42860oie.13.2021.04.18.22.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 22:09:28 -0700 (PDT)
Date:   Mon, 19 Apr 2021 00:09:26 -0500
From:   Tyler Hicks <code@tyhicks.com>
To:     Lee Jones <lee.jones@linaro.org>
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
Message-ID: <20210419050926.GB405651@elm>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330164458.1625478-1-lee.jones@linaro.org>
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2021-03-30 17:44:27, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> There is more to do in filesystems.  Another set will follow.
> 
> Lee Jones (31):
...
>   fs: ecryptfs: read_write: File headers do not make good candidates for
>     kernel-doc
>   fs: ecryptfs: debug: Demote a couple of kernel-doc abuses
>   fs: ecryptfs: dentry: File headers are not good candidates for
>     kernel-doc
>   fs: ecryptfs: kthread: Demote file header and provide description for
>     'cred'
>   fs: ecryptfs: file: Demote kernel-doc abuses
>   fs: ecryptfs: super: Fix formatting, naming and kernel-doc abuses
>   fs: ecryptfs: messaging: Add missing param descriptions and demote
>     abuses
>   fs: ecryptfs: main: Demote a bunch of non-conformant kernel-doc
>     headers
>   fs: ecryptfs: miscdev: File headers are not good kernel-doc candidates
>   fs: ecryptfs: crypto: Supply some missing param descriptions and
>     demote abuses
>   fs: ecryptfs: mmap: Help out one function header and demote other
>     abuses
>   fs: ecryptfs: inode: Help out nearly-there header and demote
>     non-conformant ones
>   fs: ecryptfs: keystore: Fix some kernel-doc issues and demote
>     non-conformant headers

I've applied the eCryptfs fixes to the next branch of
tyhicks/ecryptfs.git. Thanks for the clean-up!

Tyler
