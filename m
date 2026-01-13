Return-Path: <ecryptfs+bounces-776-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 084EBD1B1D1
	for <lists+ecryptfs@lfdr.de>; Tue, 13 Jan 2026 20:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CFB53019B4A
	for <lists+ecryptfs@lfdr.de>; Tue, 13 Jan 2026 19:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109F534EEF6;
	Tue, 13 Jan 2026 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVhj80jr"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13E1347DD;
	Tue, 13 Jan 2026 19:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768334001; cv=none; b=ELA7+xvCY/VEpHkiboolrbzF0ZgYApB3CdPjC0kqVV8pAwNaWaIC3/RHKQIWUfSRD2vMJgW6SOXzu+fVgZT4tp32H5Trr2G2/EZMVnoeR7DnQ1hQLvJK4u7SMnOOHSMxHZsdGKp6Sh/Bcne1eJJrmTxSWNa2JGihL43oxoTf7Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768334001; c=relaxed/simple;
	bh=aqxAaSrsDCNdUxD2Za4yUVZQTHnN15yZjNCOZxWZuHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WXJL7i2v2Ar6cnxuJm86ZSPtpQg+8zXlnAdlKw7KjPyF8bSbwINymuYlxvqcVSpE60CoQ0YMe9ntefJLrgvSE/RtUpFnuhmwnp0ASoddUtcEze86YH/MMt+Tis2dKhwQxNXL8q4KryZ35WAUTii+PwN8kvRgvyxAwnqup49HRTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVhj80jr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E09C116C6;
	Tue, 13 Jan 2026 19:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768334000;
	bh=aqxAaSrsDCNdUxD2Za4yUVZQTHnN15yZjNCOZxWZuHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YVhj80jraWPdpRMmQGptuKQ2otdLmhbQxbG+8F9GyfxT3+d8kV8w9DffXVUZItqxS
	 V66eFy2BfMJQDVmuvtg9ZoNzeH0CazMUU6iNSP5+xKkTqvr61oIBEW2IY+GsrG/hbA
	 OKzae86/nV9UbILWK8sVkfhOQS3saSEPAbmYScu1jrWpJBYemDQtuJ23aj3fa3ZWmQ
	 cJHd/8E844oerPxLJtLDVDotbIjkdec68BHvQ507q7qRQ3eYM1zNXII6QlBMDIfb8e
	 wLIcE48Hz3FJP6jSDM/QwTtk32FqTc/aa05lEjCJ6qW4m0hjawoTWSnxLbgp+e8b3w
	 AaZDxuwzy7P5w==
From: Kees Cook <kees@kernel.org>
To: Tyler Hicks <code@tyhicks.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: Kees Cook <kees@kernel.org>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: Annotate struct ecryptfs_message with __counted_by
Date: Tue, 13 Jan 2026 11:53:18 -0800
Message-Id: <176833399676.1997306.7599866273501067094.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112115314.739612-2-thorsten.blum@linux.dev>
References: <20260112115314.739612-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 12 Jan 2026 12:53:11 +0100, Thorsten Blum wrote:
> Add the __counted_by() compiler attribute to the flexible array member
> 'data' to improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
> CONFIG_FORTIFY_SOURCE.
> 
> 

Applied to for-next/hardening, thanks!

[1/1] ecryptfs: Annotate struct ecryptfs_message with __counted_by
      https://git.kernel.org/kees/c/574d944d2ff3

Take care,

-- 
Kees Cook


