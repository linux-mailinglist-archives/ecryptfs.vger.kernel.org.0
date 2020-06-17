Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FCC1FD2C5
	for <lists+ecryptfs@lfdr.de>; Wed, 17 Jun 2020 18:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgFQQuV (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 17 Jun 2020 12:50:21 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51939 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726815AbgFQQuU (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 17 Jun 2020 12:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592412618;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OjK8fyHVTJHn0tJmmKvVefEY8khdS+QHcewRe9SW19w=;
        b=WjQcht4Bs0W+wbaYCphakmQGS6iCKa7jkGpvOFOgRwy7LsZ6IfNCVHfARWw7hzvGNTuME6
        xY8BOA0Ay3VfmDmnvBy5hBjMbKKazjqc0UCe0eiLb3d7fKEf5eGJLvGWurumV0fLVz88lM
        sGGFhuVQfUxnK+PWYUaZHniB+flm0mw=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-nlUoACvUOcSL0-kTr_PRzw-1; Wed, 17 Jun 2020 12:50:16 -0400
X-MC-Unique: nlUoACvUOcSL0-kTr_PRzw-1
Received: by mail-ot1-f71.google.com with SMTP id t3so1286785otc.12
        for <ecryptfs@vger.kernel.org>; Wed, 17 Jun 2020 09:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OjK8fyHVTJHn0tJmmKvVefEY8khdS+QHcewRe9SW19w=;
        b=izssnSmxzPSnBPAbiz2t6NaEUxSWqeRef7NZLGyHFLfSHK2X9NacKi4cNKPmhcZnr3
         Uo2rTjWb4NRLCQ7H2h5xO+OwIt2Ei1MiQM7fYettlRf/iuyzvCA1spvrAUUKRMHYbnMX
         mar6GadafHjwyXWo76wb1f4xc4vSBaEa+uU51KN10Yk1+XzGe8GxSTjWhfiKVIMG99GN
         eUVHWgv8b0qGwjKfu9A/qTn7xdBqaJ2Z5P41j1fgzFCO9o3EjTeKKcb9k1qStMRYbhUO
         O6kZbHAeF0JxvuDq+u+EsA4yvw+Pan9U56NagNmhAekd2xjle6cyxWIgT8tFkM/a4DMh
         yexw==
X-Gm-Message-State: AOAM532i7t2d2uP+zIEjpjWc2hHkzrgzPMM7HeXLOhxuNrPPiXLIDXZy
        1CnqtpyOlkGQe/YKHByu02TtFlMd3SDyKt5UODyFzx9kkEjSRH0hVHETtZ4KgM2AaOAG8Jvzo5p
        9FhEA5Xg9axZOFfzj0m0RrXYyBvsKXNnJCVY=
X-Received: by 2002:a4a:d1ca:: with SMTP id a10mr262814oos.31.1592412615529;
        Wed, 17 Jun 2020 09:50:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvBRe1tN454gReGPRfABUY4hEWGQXUAbPkEy82xsY851yjhGMaPBzfCaZ6uEV13m7NtiwW2+yXK6vJIB388qk=
X-Received: by 2002:a4a:d1ca:: with SMTP id a10mr262789oos.31.1592412615270;
 Wed, 17 Jun 2020 09:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200605183631.GA1720057@eldamar.local> <20200611223711.GA37917@mattapan.m5p.com>
 <20200613125431.GA349352@eldamar.local> <20200613184527.GA54221@mattapan.m5p.com>
 <20200615145035.GA214986@pick.fieldses.org> <20200615185311.GA702681@eldamar.local>
 <20200616023820.GB214986@pick.fieldses.org> <20200616024212.GC214986@pick.fieldses.org>
 <20200616161658.GA17251@lorien.valinor.li> <20200617144256.1028414-1-agruenba@redhat.com>
 <20200617153107.GL266716@pick.fieldses.org>
In-Reply-To: <20200617153107.GL266716@pick.fieldses.org>
From:   Andreas Gruenbacher <agruenba@redhat.com>
Date:   Wed, 17 Jun 2020 18:50:04 +0200
Message-ID: <CAHc6FU5-WGL8OwELQvpu8CsQgqW5o2h92UG3d2E3RUTPnBPgog@mail.gmail.com>
Subject: Re: Umask ignored when mounting NFSv4.2 share of an exported
 Filesystem with noacl (was: Re: Bug#962254: NFS(v4) broken at 4.19.118-2)
To:     "J. Bruce Fields" <bfields@redhat.com>
Cc:     ecryptfs@vger.kernel.org, Salvatore Bonaccorso <carnil@debian.org>,
        Elliott Mitchell <ehem+debian@m5p.com>, 962254@bugs.debian.org,
        Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On Wed, Jun 17, 2020 at 5:31 PM J. Bruce Fields <bfields@redhat.com> wrote:
>
> On Wed, Jun 17, 2020 at 04:42:56PM +0200, Andreas Gruenbacher wrote:
> > Hi Bruce,
> >
> > On Wed, Jun 17, 2020 at 2:58 AM J. Bruce Fields <bfields@redhat.com> wrote:
> > > I think I'll send the following upstream.
> >
> > looking good, but how about using a little helper for this?
>
> I like it.  And the new comment's helpful too.
>
> >
> > Also I'm not sure if ecryptfs gets this right, so taking the ecryptfs
> > list into the CC.
>
> Yes, questions I had while doing this:
>
>         - cachefiles, ecrypfs, devtmpfs, and unix_mknod skip the check,
>           is that OK for all of them?  (Overlayfs too, I think?--that
>           code's harder to follow.
>
>         - why don't vfs_{create,mknod,mkdir} do the IS_POSIXACL check
>           themselves?  Even if it's unnecessary for some callers, surely
>           it wouldn't be wrong?

That's a good question. The security_path_{mkdir,mknod} hooks would
then probably be passed the original create mode before applying the
umask, but at that point it's not clear what the new inode's final
mode will be, anyway.

> I also wondered why both vfs_{create,mknod,mkdir} and the callers were
> calling security hooks, but now I see that the callers are calling
> security_path_* hooks and the vfs_ functions are calling
> security_inode_* hooks, so I guess they're not redundant.
>
> Though now I wonder why some of the callers (nfsd, overlayfs) are
> skipping the security_path_* hooks.

The path based security hooks are only used by apparmor and tomoyo.
Those hooks basically control who (which process) can do what where in
the filesystem, but nfsd isn't aware of the "who", and overlayfs is a
layer below the "where".

Andreas

