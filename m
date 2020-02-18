Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55A48162081
	for <lists+ecryptfs@lfdr.de>; Tue, 18 Feb 2020 06:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgBRFkU (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 18 Feb 2020 00:40:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:43854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725909AbgBRFkU (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Tue, 18 Feb 2020 00:40:20 -0500
Subject: Re: [GIT PULL] eCryptfs fixes for 5.6-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582004420;
        bh=yZBA4laHRvxSN+sE6pN6c7/LKb/QYOQmNjR9+WygDpc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=BY9gUL7ruQBBCzI9eQzQd1/QqEZKC/UJ0B2pjVonCh5JINZm6VozHTwDwiSY0kYxQ
         RwmRYvdvqDJk/7LTVgP/MpMCgHTp/WD2t648Jx2T4Zad6SKKyNlsCud1sgoj60SQfK
         RpjJMna87UCYyAn8ZQltFpop7E/QYql/vz0gYiNY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200217205343.GA280196@elm>
References: <20200217205343.GA280196@elm>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200217205343.GA280196@elm>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git
 tags/ecryptfs-5.6-rc3-fixes
X-PR-Tracked-Commit-Id: 2c2a7552dd6465e8fde6bc9cccf8d66ed1c1eb72
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1da3acc781ce445445d959b41064d209a27bc2d
Message-Id: <158200442005.24167.3412622613576452077.pr-tracker-bot@kernel.org>
Date:   Tue, 18 Feb 2020 05:40:20 +0000
To:     Tyler Hicks <code@tyhicks.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, ecryptfs@vger.kernel.org
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

The pull request you sent on Mon, 17 Feb 2020 14:53:43 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-5.6-rc3-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1da3acc781ce445445d959b41064d209a27bc2d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
