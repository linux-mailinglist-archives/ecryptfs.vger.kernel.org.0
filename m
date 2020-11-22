Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18EEA2BC6B8
	for <lists+ecryptfs@lfdr.de>; Sun, 22 Nov 2020 17:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgKVQLM (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 22 Nov 2020 11:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56563 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727925AbgKVQLF (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sun, 22 Nov 2020 11:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606061463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D4o3+oRulyAmQWJaTM5GlynW0/tmbkOzx3PzhPB5iTg=;
        b=JuTdFtHhsclSCFUt685nObhejVSN718q0xDzBI7qCmYl4/ObRaglwiPh1kkjwftUYKtjGT
        F9V7hg+6Ged1Ypc78HlKhU8yURVG+HfY97vOU+FDQTH2+EktMkCoujoBzuPIEBmLFdUcTH
        U0gcN5s+aBBBeO3IQtZ/9hGSdS8be9I=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-8rDzujdZOJu5EgmsiugvMQ-1; Sun, 22 Nov 2020 11:10:59 -0500
X-MC-Unique: 8rDzujdZOJu5EgmsiugvMQ-1
Received: by mail-qk1-f200.google.com with SMTP id h13so2230971qkl.20
        for <ecryptfs@vger.kernel.org>; Sun, 22 Nov 2020 08:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=D4o3+oRulyAmQWJaTM5GlynW0/tmbkOzx3PzhPB5iTg=;
        b=O5RBHf3bEYdWSFKKFkf2gtzl/2bH3YNrze8jQ0ip8N2CUSfyyWcy5Z3NTkqYVn1M0f
         HC+awDXjqml1tP66SwviPMyohHh/yABFPTVy+tg4KH0bZqj66vs01vlXepg97iJeePjV
         IcAEmqixieahC3k6aEIdqK94cq1Wz1p3IEwOlpDky8jaURdcB69+p7ciec0QP3DYbtaw
         uoB9HoWOoFV0T2G3xqo90ebZUiOdTIM2Qb0hQ8HfENdFmn1ajxOQwSFTE5JXqg1KEw6i
         pSgzaRUbnQ2+r6XKZRB8eJjwRaJRYv8MgxPhiG7KbYu+tCVpQJpqWTMPLOD0izZolCYA
         +T/Q==
X-Gm-Message-State: AOAM531XCGywo0h+d1LmIA3ZTSAxlg78OZckj1+mvTaFws0oZ32ItFmg
        3biJhwnkkNYxq8XohpZ8uaIj26hBCTdl8XmX+RHCXhj6l8wCYXYBmXhf3VFDk9CAo6fO4cmZas1
        ByWSQAqoB/b0sPhhmdDE=
X-Received: by 2002:ac8:5a8c:: with SMTP id c12mr23364792qtc.97.1606061459262;
        Sun, 22 Nov 2020 08:10:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6JfmMkGlJyoaKx6ihYsYbDuDsWkyDwIosiC/apv5eylMrcIvHPxlHVgnFDCnun9WXh4UZ3w==
X-Received: by 2002:ac8:5a8c:: with SMTP id c12mr23364770qtc.97.1606061458997;
        Sun, 22 Nov 2020 08:10:58 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id l3sm2779806qth.13.2020.11.22.08.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2020 08:10:58 -0800 (PST)
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
To:     Matthew Wilcox <willy@infradead.org>
Cc:     joe@perches.com, clang-built-linux@googlegroups.com,
        linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org, tboot-devel@lists.sourceforge.net,
        kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-acpi@vger.kernel.org, devel@acpica.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
        linux-scsi@vger.kernel.org, linux-wireless@vger.kernel.org,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        cluster-devel@redhat.com, linux-mtd@lists.infradead.org,
        keyrings@vger.kernel.org, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, alsa-devel@alsa-project.org,
        bpf@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-nfs@vger.kernel.org, patches@opensource.cirrus.com
References: <20201121165058.1644182-1-trix@redhat.com>
 <20201122032304.GE4327@casper.infradead.org>
 <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
 <20201122145635.GG4327@casper.infradead.org>
From:   Tom Rix <trix@redhat.com>
Message-ID: <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
Date:   Sun, 22 Nov 2020 08:10:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201122145635.GG4327@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org


On 11/22/20 6:56 AM, Matthew Wilcox wrote:
> On Sun, Nov 22, 2020 at 06:46:46AM -0800, Tom Rix wrote:
>> On 11/21/20 7:23 PM, Matthew Wilcox wrote:
>>> On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com wrote:
>>>> The fixer review is
>>>> https://reviews.llvm.org/D91789
>>>>
>>>> A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
>>>> The false positives are caused by macros passed to other macros and by
>>>> some macro expansions that did not have an extra semicolon.
>>>>
>>>> This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
>>>> warnings in linux-next.
>>> Are any of them not false-positives?  It's all very well to enable
>>> stricter warnings, but if they don't fix any bugs, they're just churn.
>>>
>> While enabling additional warnings may be a side effect of this effort
>>
>> the primary goal is to set up a cleaning robot. After that a refactoring robot.
> Why do we need such a thing?  Again, it sounds like more churn.
> It's really annoying when I'm working on something important that gets
> derailed by pointless churn.  Churn also makes it harder to backport
> patches to earlier kernels.
>
A refactoring example on moving to treewide, consistent use of a new api may help.

Consider

2efc459d06f1630001e3984854848a5647086232

sysfs: Add sysfs_emit and sysfs_emit_at to format sysfs output

A new api for printing in the sysfs.  How do we use it treewide ?

Done manually, it would be a heroic effort requiring high level maintainers pushing and likely only get partially done.

If a refactoring programatic fixit is done and validated on a one subsystem, it can run on all the subsystems.

The effort is a couple of weeks to write and validate the fixer, hours to run over the tree.

It won't be perfect but will be better than doing it manually.

Tom

