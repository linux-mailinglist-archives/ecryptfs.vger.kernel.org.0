Return-Path: <ecryptfs+bounces-225-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA79C3F3E
	for <lists+ecryptfs@lfdr.de>; Mon, 11 Nov 2024 14:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 508771C2278B
	for <lists+ecryptfs@lfdr.de>; Mon, 11 Nov 2024 13:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE47719D8AD;
	Mon, 11 Nov 2024 13:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTkSIlPA"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3A919CC22;
	Mon, 11 Nov 2024 13:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731330392; cv=none; b=ihuuJDbwybP4AOTNv3vu9MQpwdX55LpgXwopU2ygZ6CxtVJ8BI5CK771XOnzjvMWtBuaAp7nPmuqyYRIj1Pax6+7pyO5L/0NptD6PAu47NyS9b+OfoG1m1MiRZRdx0ckb3074wAtHvF3f/n6lITxEf0QG/iJnLhZCBBvj3+43PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731330392; c=relaxed/simple;
	bh=p4803cKuur+nTHiH2XN+bi6bUhrT0USkzF9hWtQRfSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J2xXrgt5RKuUD1z5HS0oeC011T395qT+hjAZAiDanefRPD5g0cCBmkCeqZEt6pjG4GX/lfXtLo+UJJR6jNiEctq1tjI0J4u4kw3Ia8Ukok40FUze88GZySdv1dGe/dzYTnh5TcVLBXthXznNI7dTrJyXa4eohjQcWtZyrQB3p4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTkSIlPA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F4EC4CECF;
	Mon, 11 Nov 2024 13:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731330392;
	bh=p4803cKuur+nTHiH2XN+bi6bUhrT0USkzF9hWtQRfSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VTkSIlPAWpyp9E+DKF7zQMR3mA0/CGt2CnO3u7f1rTVS1tX6sVvpgFody47MtLLWo
	 u8FXu84R0YRfdok5woySFtvvWBTH08QTvyfZ0hlv4PrbUtlCo2v5IuWAKvQmdz2DZC
	 zCNQRqbjR5equTLF3B2vWwvtMTIcGZzsIhJCJSp0FzEtB9qZ+ilqtFLYSJ/33D80uN
	 /YK46OUaLScvUEwknh+KdSFjspTY/Dn+LQaOkhIowYTicZgB0hNWQUQoi+ECQXFOjv
	 c8mWykkV/goP2dxw463YrWRI+GLG6ktmzfC1memCz33ba5zkYAUFYZbs/O8po+t5R+
	 I9cb+eAcnelcA==
From: Christian Brauner <brauner@kernel.org>
To: Tyler Hicks <code@tyhicks.com>,
	ecryptfs@vger.kernel.org,
	Colin Ian King <colin.i.king@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ecryptfs: Fix spelling mistake "validationg" -> "validating"
Date: Mon, 11 Nov 2024 14:06:22 +0100
Message-ID: <20241111-revitalisieren-kapelle-52baa92caa72@brauner>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108112509.109891-1-colin.i.king@gmail.com>
References: <20241108112509.109891-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=brauner@kernel.org; h=from:subject:message-id; bh=p4803cKuur+nTHiH2XN+bi6bUhrT0USkzF9hWtQRfSw=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQbMQYa1ZsZXi3m3yASq3hCUWLFAjE5vRdrZhZWB/Qrv nvS0dvQUcrCIMbFICumyOLQbhIut5ynYrNRpgbMHFYmkCEMXJwCMJGcywx/RRflsz09tTLh1HQu hs+fJm5bJcpndyfvXuI3Fo2Wf6LBXxkZ9nWteBvDytZn5eS3ObVNwvdnzOancWeY1nifvny1M3I SBwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Fri, 08 Nov 2024 11:25:09 +0000, Colin Ian King wrote:
> There is a spelling mistake in an error message literal string. Fix it.
> 
> 

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

[1/1] ecryptfs: Fix spelling mistake "validationg" -> "validating"
      https://git.kernel.org/vfs/vfs/c/ab088c6e4014

