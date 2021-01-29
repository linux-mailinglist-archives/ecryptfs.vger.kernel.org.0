Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1510930844D
	for <lists+ecryptfs@lfdr.de>; Fri, 29 Jan 2021 04:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhA2Dor (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Thu, 28 Jan 2021 22:44:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:48360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229757AbhA2Dor (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Thu, 28 Jan 2021 22:44:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C444C64DFB;
        Fri, 29 Jan 2021 03:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611891846;
        bh=YQ+5BI5ZqSn8x1TLpS27Zd0uYGuJdby2+XMjFAOA4uI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=YBqCKrXUoY9H7PMfgzh1FUwmDEu8atSSBW9nl1sExHf3IQBuO+x3fDOKH2e92Di8z
         mEFeerNyJRBX2+f9NxgJ0vsMcn1zDO99uAeGLIm3Lo6AfZ6Y+3DRKCloKUicKYi7i0
         +xiWxVu/WD84s3jddLSgFARGMcAh2obVAte1zQGkGA1Iif+Rb2KI18OPIMV7aN9/n1
         lZgpTHdiSPpR7WbqEHp/XKJH8yPwIhGr1aqtDtHTbpGLLmn6AreqkvGGYO74FtsGo4
         nWNdRb1dy/hnHpvC0DGyVuzu8e3F1hFh7R3H5+2J0FsTqMALo0IyU9NkHyt3I+YqxU
         ieTNrolb1Eviw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B82F6613AE;
        Fri, 29 Jan 2021 03:44:06 +0000 (UTC)
Subject: Re: [GIT PULL] eCryptfs fix for 5.11-rc6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210129012431.GA633037@sequoia>
References: <20210129012431.GA633037@sequoia>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210129012431.GA633037@sequoia>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-5.11-rc6-setxattr-fix
X-PR-Tracked-Commit-Id: 0b964446c63f9d7d7cd1809ee39277b4f73916b5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bec4c2968fce2f44ce62d05288a633cd99a722eb
Message-Id: <161189184666.9193.4035556583382796136.pr-tracker-bot@kernel.org>
Date:   Fri, 29 Jan 2021 03:44:06 +0000
To:     Tyler Hicks <code@tyhicks.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, ecryptfs@vger.kernel.org,
        Miklos Szeredi <mszeredi@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

The pull request you sent on Thu, 28 Jan 2021 19:24:31 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-5.11-rc6-setxattr-fix

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bec4c2968fce2f44ce62d05288a633cd99a722eb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
