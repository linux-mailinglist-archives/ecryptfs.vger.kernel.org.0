Return-Path: <ecryptfs+bounces-760-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D80CDC4C0
	for <lists+ecryptfs@lfdr.de>; Wed, 24 Dec 2025 14:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1BFC3033DE5
	for <lists+ecryptfs@lfdr.de>; Wed, 24 Dec 2025 12:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F0D29D28B;
	Wed, 24 Dec 2025 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCAw8+ez"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B982AD16;
	Wed, 24 Dec 2025 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766581130; cv=none; b=qUXqG49fXPUhW0KUjByejgfeoy8OPKRD+jpYC9xcoM5stqWkJqTZkymugtG5JM/Ce/IUKywTNvI+h7i7WDCPQUugkEnpq7PU4ePxo3F5ULm/axCS7ivt0A7szlqZEIx1T/wMU8WiTNaaSdyWNmztQInKt/0Q9ZAL7LH+mowyCY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766581130; c=relaxed/simple;
	bh=c3yKp9aOk7h3Kv16NmcIQ4if0lv/8KPF2WMYIAIKfjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fCwLSIol6br6XA9ZSIeJE3OFhBlZmdKSSlSudthodzGNIgJurb0xtV+0sJJ1gAE0lX6J2cg6mox4RreqibpnMcDkayy89nxYPDpNBH8ALm1Q78zPBKi4QaRkJKB3r64ePa9b4veGbU8pvr6+Hxu0xt4blEcdL5NOg0O09CUenJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCAw8+ez; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FBDC4CEFB;
	Wed, 24 Dec 2025 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766581128;
	bh=c3yKp9aOk7h3Kv16NmcIQ4if0lv/8KPF2WMYIAIKfjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FCAw8+ezbkWl+tQNxJgn9iZqLpIAYBnlRnf0nh5TzU1truh6Aes8WSwd9krpRK4NP
	 Me7ZpOfCecaQ2Giz08UlZ4AIsDnCUkKLfr84uosD7L//Os5+hq1XUfAVUbC7uYwGyq
	 shsICxuUPq/SDNP1C7EZPNC3kAS9e8kIcZe80Y3yX4wZqt8dj25Fvj3Wx1w5n8BKd/
	 zhni4qbGCBxGcUgShbYnyN4IsUYchgqNzY9NOEpjz0BJHo4gBSAdNgg0JCtm0FG4p2
	 YILZ94G8VFZj4+JKoKrX9BqBOYXm5ZKtbZU2Q007PBCwb6cfhIfrYgNpjvW0GBLglL
	 QJouCvymIcY3g==
From: Christian Brauner <brauner@kernel.org>
To: Tyler Hicks <code@tyhicks.com>
Cc: Christian Brauner <brauner@kernel.org>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NeilBrown <neil@brown.name>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Subject: Re: [PATCH 0/2] Fix two regressions from start_creating()/start_removing() conversion
Date: Wed, 24 Dec 2025 13:58:38 +0100
Message-ID: <20251224-zerplatzen-gekocht-a80190941207@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223194153.2818445-1-code@tyhicks.com>
References: <20251223194153.2818445-1-code@tyhicks.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353; i=brauner@kernel.org; h=from:subject:message-id; bh=c3yKp9aOk7h3Kv16NmcIQ4if0lv/8KPF2WMYIAIKfjM=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR6P26xyHh4etPad4lnXaZHOGzg2729xdCmbVnRwco3R zVWyERP7ShlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhIxTuG/3FTJpmZa+Qur37b xjq32v3tUfs1AbOfvFvLbvFLxC7oiR4jw/N/315F7b18rtJGW/oIs15b+YVUt/oTFs/zNhc77Wt YwwUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Tue, 23 Dec 2025 13:41:51 -0600, Tyler Hicks wrote:
> When running the eCryptfs test suite on v6.19-rc2, I noticed BUG splats
> from every test and that the umount utility was segfaulting when tearing
> down after a test. Bisection led me to commit f046fbb4d81d ("ecryptfs:
> use new start_creating/start_removing APIs").
> 
> This patch series addresses that regression and also a mknod problem
> spotted during code review.
> 
> [...]

Applied to the vfs.fixes branch of the vfs/vfs.git tree.
Patches in the vfs.fixes branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.fixes

[1/2] ecryptfs: Fix improper mknod pairing of start_creating()/end_removing()
      https://git.kernel.org/vfs/vfs/c/5f9ad16bccd3
[2/2] ecryptfs: Release lower parent dentry after creating dir
      https://git.kernel.org/vfs/vfs/c/5c56afd204ad

