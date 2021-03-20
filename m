Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24305342E81
	for <lists+ecryptfs@lfdr.de>; Sat, 20 Mar 2021 18:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhCTRGG (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sat, 20 Mar 2021 13:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbhCTRGA (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sat, 20 Mar 2021 13:06:00 -0400
X-Greylist: delayed 3465 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 20 Mar 2021 10:06:00 PDT
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E079C061574
        for <ecryptfs@vger.kernel.org>; Sat, 20 Mar 2021 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:Content-Type:MIME-Version:
        References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=lLZoxS2jnucsow36f/+/xibANjR777Ge9+Ym0kKbvpc=; b=KllN2K/hkTM3EeUXWft/eHxhZU
        KwdnPxKrzdC78hBbNskkRUWhFqjvdw8XdCylXMknUiDffnDK0M2/boumqKHhD4bzvSK/v0GeCfl+K
        wOlEms5d2g+L+Uusz5QPgwzGrQIAlQvu+xzanUZPaqdFwpc2OdFp0v+lnjkek59XpotGtbfQ4dxAy
        1Ozdsm7A6dwvohusQ+uhN2hcft9FnquuM6L/MMQBBUL4f4h5g8pwnrp4yDj3TeUmJXDrv0GxaZISI
        QZ9W7x/yRkJRnUBfZmLbQWpUy1qxtJjxGPR3LzXiZ3fqf2vmSM3Br9J2brTy86EYLNF/qmSvAKOeh
        sXKtWdHw==;
Received: from rdunlap (helo=localhost)
        by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
        id 1lNe94-001vTD-A8; Sat, 20 Mar 2021 16:08:11 +0000
Date:   Sat, 20 Mar 2021 09:08:10 -0700 (PDT)
From:   Randy Dunlap <rdunlap@bombadil.infradead.org>
To:     Aditya Srivastava <yashsri421@gmail.com>
cc:     code@tyhicks.com, lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org, corbet@lwn.net,
        ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        christian.brauner@ubuntu.com
Subject: Re: [PATCH] ecryptfs: fix incorrect kernel-doc comment syntax in
 files
In-Reply-To: <20210320081551.13954-1-yashsri421@gmail.com>
Message-ID: <731fb5fd-b20-c1e-bfe-276845a9a91@bombadil.infradead.org>
References: <20210320081551.13954-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_090810_373986_08DFD58B 
X-CRM114-Status: GOOD (  10.26  )
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "bombadil.infradead.org",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, 20 Mar 2021, Aditya Srivastava wrote: > The opening
    comment mark '/**' is used for kernel-doc comments. > There are files in
   fs/encrypts which follows this syntax, but the content > inside does not comply
    with kernel-doc. > This causes un [...] 
 Content analysis details:   (-0.0 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 NO_RELAYS              Informational: message was not relayed via SMTP
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org



On Sat, 20 Mar 2021, Aditya Srivastava wrote:

> The opening comment mark '/**' is used for kernel-doc comments.
> There are files in fs/encrypts which follows this syntax, but the content
> inside does not comply with kernel-doc.
> This causes unexpected warnings from kernel-doc.
>
> E.g., header comment for fs/ecryptfs/dentry.c follows kernel-doc syntax
> for comments(i.e., '/**'), but the content inside does not.
>
> Running kernel-doc -none on fs/ecryptfs/dentry.c causes these
> unexpected warnings:
> "warning: Incorrect use of kernel-doc format:  * ecryptfs_d_revalidate - revalidate an ecryptfs dentry"
> "warning: Function parameter or member 'dentry' not described in 'ecryptfs_d_revalidate'"
> "warning: Function parameter or member 'flags' not described in 'ecryptfs_d_revalidate'"
> "warning: expecting prototype for eCryptfs(). Prototype was for ecryptfs_d_revalidate() instead"
>
> Similarly for other files too.
>
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> * Applies perfectly on next-20210312
>
> fs/ecryptfs/crypto.c          |  2 +-
> fs/ecryptfs/debug.c           |  2 +-
> fs/ecryptfs/dentry.c          |  2 +-
> fs/ecryptfs/ecryptfs_kernel.h |  2 +-
> fs/ecryptfs/file.c            |  2 +-
> fs/ecryptfs/inode.c           |  2 +-
> fs/ecryptfs/keystore.c        |  6 +++---
> fs/ecryptfs/kthread.c         |  2 +-
> fs/ecryptfs/main.c            | 10 +++++-----
> fs/ecryptfs/messaging.c       |  2 +-
> fs/ecryptfs/miscdev.c         |  2 +-
> fs/ecryptfs/mmap.c            |  6 +++---
> fs/ecryptfs/read_write.c      |  2 +-
> fs/ecryptfs/super.c           |  2 +-
> 14 files changed, 22 insertions(+), 22 deletions(-)
>
