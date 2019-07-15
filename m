Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 193226824F
	for <lists+ecryptfs@lfdr.de>; Mon, 15 Jul 2019 04:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfGOCkQ (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 14 Jul 2019 22:40:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbfGOCkQ (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Sun, 14 Jul 2019 22:40:16 -0400
Subject: Re: [GIT PULL] eCryptfs fixes for 5.3-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563158415;
        bh=9FH02/3Hdqa5ERHuroMXsK0MggGoBBK6d2frKzvNqLU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=F5r5awOA3KbuhzNUx6Vp7+C3VTk3JnTg9CsJ/Hfna09jDXs3O5aD61Vb0G+hEGWYj
         gcEJpDxoOC/Ox/E9KNvpnyJil4METR5HeKLmonV/j8OYDH3IQgBOraxgnJwf6m/lJz
         nw2v2MX1z4meyGjxax5yzw/ARpfRFvfdQMzoVViY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190715010612.GA13363@sec>
References: <20190715010612.GA13363@sec>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190715010612.GA13363@sec>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git
 tags/ecryptfs-5.3-rc1-fixes
X-PR-Tracked-Commit-Id: 7451c54abc9139585492605d9e91dec2d26c6457
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa6e951a2a440babd7a7310d0f4713e618061767
Message-Id: <156315841516.18482.6666782783340343610.pr-tracker-bot@kernel.org>
Date:   Mon, 15 Jul 2019 02:40:15 +0000
To:     Tyler Hicks <tyhicks@canonical.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, ecryptfs@vger.kernel.org
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

The pull request you sent on Mon, 15 Jul 2019 01:08:43 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-5.3-rc1-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa6e951a2a440babd7a7310d0f4713e618061767

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
