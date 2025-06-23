Return-Path: <ecryptfs+bounces-366-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEABAE3F7E
	for <lists+ecryptfs@lfdr.de>; Mon, 23 Jun 2025 14:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A4157A8B34
	for <lists+ecryptfs@lfdr.de>; Mon, 23 Jun 2025 12:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB0E24E014;
	Mon, 23 Jun 2025 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4qNk1PT"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D1C2459D0;
	Mon, 23 Jun 2025 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680771; cv=none; b=ihRAxKC2aVh8R6HMpGMRMO4Q3iGx6Fklq083GzBb/iLo3XRSap970QZCr0hx5w12LW6qnvrXcMCn0ghOwZc4rm/49ZRkXvsuXniimtEg2j1ZQOcTI/qHg2gZLwjkIimo7NgE4hlZJpzl7JABOP6AFVg//7u7NKERScHI9RLLZ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680771; c=relaxed/simple;
	bh=vHwahyHa0xYBWoBhaDBKRzJtvd25Ldcj0IdB7exRmAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=htJtN+96wwTmjLGuJVo89C3YOtMtEcRVevhzUhlG1Il7/SomCLlgo3ohTBBkt2BoXVXy2ndTn2st4YUMHIZkOzHp45L3UpaSVdFPLxFtj2QddHfAYYeApI+3lToc6Z6u89oFIB5isMs2nWUSttQs3fdOap+dwudxbj/vX8etX2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4qNk1PT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1636C4CEEA;
	Mon, 23 Jun 2025 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750680771;
	bh=vHwahyHa0xYBWoBhaDBKRzJtvd25Ldcj0IdB7exRmAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4qNk1PT7cr7EBs8hyznVc/05lYlSwitH5fm2P+yng+3EZqOc0u4bixM3qQtugrG5
	 NyRH9Q3q3kiqyD6ZAi4pgA2T3KhZX/oyrmcssLrhQu++AeyoXbCHAyGc3NoPzoA2gE
	 uI7Rw+F3zXd3DHinRLn0xOPUpKD/ZDG3dSkjWTdxiVcUxUdIl+Ah2xp5t7zOFRKuYi
	 zVugKRYdEWbHhPV+0Bc7DUwPFU1Sdp7HmCJIILuEo0QprwvY5g0bNFBA40OgEUwgTU
	 Qrga1tSZVRL8hGFtyaY2bIKNjDgu6uUWJN9qQZTdkXjGwA1vYWQOYFO5IgXjSP1Ct+
	 c0ymDirtriMLg==
From: Christian Brauner <brauner@kernel.org>
To: code@tyhicks.com,
	sandeen@redhat.com,
	colin.i.king@gmail.com,
	Ankit Chauhan <ankitchauhan2065@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/ecryptfs: replace snprintf with sysfs_emit in show function
Date: Mon, 23 Jun 2025 14:12:46 +0200
Message-ID: <20250623-sabotieren-vergab-a7292a33f574@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250619031536.19352-1-ankitchauhan2065@gmail.com>
References: <20250619031536.19352-1-ankitchauhan2065@gmail.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=963; i=brauner@kernel.org; h=from:subject:message-id; bh=vHwahyHa0xYBWoBhaDBKRzJtvd25Ldcj0IdB7exRmAA=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWREuuxft+77utLPkkf2Wb4zSXP9Gbby3uPLi31yW0Okv SUd2/VXdZSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExE0Y/hf3mvT3/QYatwTt5l Fq/qeR6+u6LmwCuRZnt6/kJbo871AowMG0WWePTPees5wXzO6r0P7vBfjQmJNLmtyPrMcNU/l9i rzAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Thu, 19 Jun 2025 08:45:36 +0530, Ankit Chauhan wrote:
> Use sysfs_emit() instead of snprintf() in version_show() function to
> follow the preferred kernel API.
> 
> 

Applied to the vfs-6.17.misc branch of the vfs/vfs.git tree.
Patches in the vfs-6.17.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.17.misc

[1/1] fs/ecryptfs: replace snprintf with sysfs_emit in show function
      https://git.kernel.org/vfs/vfs/c/06a705356d75

