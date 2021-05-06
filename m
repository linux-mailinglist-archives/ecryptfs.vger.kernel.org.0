Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335D53759DA
	for <lists+ecryptfs@lfdr.de>; Thu,  6 May 2021 19:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236420AbhEFR6l (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Thu, 6 May 2021 13:58:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:40552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236341AbhEFR6l (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Thu, 6 May 2021 13:58:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1449661154;
        Thu,  6 May 2021 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620323863;
        bh=VeSoGsTV+o+DIg0jSwMT1NXLAnZJUY0O3nBlQcRsyMI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=nnpxTyS+PJJNWD8A7kRSH43omDqanqTynRG6orOR3Qg87hpyWtatRM7KTbUBm2KoV
         cS6pVp20sv5ibLzGIX5QnfXpDnW5wIhFgNis9OOo0q7UWxic42Mr4D8h/PdrqGHuB1
         T0agOEvAlsj633bAEgDFKAfGWGlYrVNGX5sfbq/9qe4eaVAGQ1pbmOg3T84MzEFJ6M
         vkURG+SLSD+QQDy9NwiOZXfNf2uDL8qkyiEUI4iV4s4AhJDPXfpFEoGtPIddNnmunH
         Y4Gk8uze28DhPbdz5lVbP5BAJRkFgpjD5NHV3ZwTVI3ArMA63zOaZDXn+5oam/zVFK
         /OE6l9WWLiCTg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0E88C609AC;
        Thu,  6 May 2021 17:57:43 +0000 (UTC)
Subject: Re: [GIT PULL] eCryptfs updates for 5.13-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210506022851.GA622556@elm>
References: <20210506022851.GA622556@elm>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210506022851.GA622556@elm>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-5.13-rc1-updates
X-PR-Tracked-Commit-Id: 9046625511ad8dfbc8c6c2de16b3532c43d68d48
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 682a8e2b41effcaf2e80697e395d47f77c91273f
Message-Id: <162032386305.1989.10037069998243079729.pr-tracker-bot@kernel.org>
Date:   Thu, 06 May 2021 17:57:43 +0000
To:     Tyler Hicks <code@tyhicks.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, ecryptfs@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

The pull request you sent on Wed, 5 May 2021 21:28:51 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-5.13-rc1-updates

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/682a8e2b41effcaf2e80697e395d47f77c91273f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
