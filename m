Return-Path: <ecryptfs+bounces-223-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104849BE44E
	for <lists+ecryptfs@lfdr.de>; Wed,  6 Nov 2024 11:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419251C22D3E
	for <lists+ecryptfs@lfdr.de>; Wed,  6 Nov 2024 10:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEF31DE2CC;
	Wed,  6 Nov 2024 10:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RegpO3Nm"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3FA1096F
	for <ecryptfs@vger.kernel.org>; Wed,  6 Nov 2024 10:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730889152; cv=none; b=FnXFuLLyo7Sqzvy2cd5SJfy6DfkujF88cke+x0AHtbC6bw75wRvCOE1o2GWc+IIDeCZgF/G6gr09IgP4Y40vlK4ZtYGgiJ5YC4enLzYTTXm5yDBZNgO/FEox5Au4RJ9Mlq05v30GIbx+rvWyove4sWej5MZtHhUx13+L+/AS8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730889152; c=relaxed/simple;
	bh=RA5ond/SDbW1GNievsRhwsi06rfgVOdkVutOeG+tX3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FScWSwPzvkT0463HCP0hYHUs65wBlkoFFmbu/rVL+OugPlYMDFVi8ZJuuwtGQMbuoPi19k2nYMQo1V0iYi76zj75SeWtcEw26PcdPnTI2yU9e153zlL+jqPlEXRkxz9WNWae/3zCx/ZQE/m89b6HCXWPL19m6X8vw8zcqJDktJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RegpO3Nm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83032C4CED3;
	Wed,  6 Nov 2024 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730889151;
	bh=RA5ond/SDbW1GNievsRhwsi06rfgVOdkVutOeG+tX3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RegpO3Nmvw1IpJ8MhlaGiccf2Lta1G2OOZLyeIMDuBUmVKtT4rhvB8yJN2REafi8u
	 cr2zp0WFFv0rrx4He6ebh0Xr5pjVY5LRATJz3MCpgvZQJOr4rNQBTGLsId0KdzX9D+
	 GiVQfNKxNiw5Ma/M/YjTk5QOg+blI6P2MQxjBB7qL7sdteyCt2OB/b2sz/4Q8SIiri
	 u5JczW5BVwHSnmDwm9Luvf0b3i2fGPsW2VQAvY8zR754erPF6Xdf8mhp43LaUz6iGL
	 lrYIeeDRafMqIA/l3Td+4lgYFnn4o5c8dtrzTHr57/KscQKaSSKN4f+btnOrfVu6nO
	 IAaXMdMOfSqnQ==
From: Christian Brauner <brauner@kernel.org>
To: ecryptfs@vger.kernel.org,
	Eric Sandeen <sandeen@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>,
	code@tyhicks.com
Subject: Re: [PATCH V2 0/2] ecryptfs: convert to the new mount API
Date: Wed,  6 Nov 2024 11:32:20 +0100
Message-ID: <20241106-aufopfern-umrunden-4673a4e29ee6@brauner>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028143359.605061-1-sandeen@redhat.com>
References: <20241028143359.605061-1-sandeen@redhat.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; i=brauner@kernel.org; h=from:subject:message-id; bh=RA5ond/SDbW1GNievsRhwsi06rfgVOdkVutOeG+tX3Y=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaRru+7gvXNuz26ZZZtctwfemxYuMH+ncsbnPdH5l352e FbOlO9p7ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjITRaG/z53nqQrzb+6a4qs 5c4kmX3qmoybjaaxvr1g3fssgD2y4DAjw3vh5xzPL3q5edzuW8fYavGh44S09adfnpMc1Zn6bee f5gEA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Mon, 28 Oct 2024 09:32:37 -0500, Eric Sandeen wrote:
> This is lightly tested with the kernel tests present in ecryptfs-utils,
> but it could certainly use a bit more testing and review, particularly
> with invalid mount option sets.
> 
> This one is a little unique compared to other filesystems in that I
> allocate both an fs context and the *sbi in .init_fs_context; the *sbi
> is long-lived, and the context is only present during the initial mount.
> 
> [...]

Applied to the vfs.ecryptfs branch of the vfs/vfs.git tree.
Patches in the vfs.ecryptfs branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.ecryptfs

[1/2] ecryptfs: Factor out mount option validation
      https://git.kernel.org/vfs/vfs/c/ea901181089a
[2/2] ecryptfs: Convert ecryptfs to use the new mount API
      https://git.kernel.org/vfs/vfs/c/60d5a704083a

