Return-Path: <ecryptfs+bounces-787-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIQkElQJmWn1PAMAu9opvQ
	(envelope-from <ecryptfs+bounces-787-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Sat, 21 Feb 2026 02:24:36 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B53C816BB86
	for <lists+ecryptfs@lfdr.de>; Sat, 21 Feb 2026 02:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31B9B309AA11
	for <lists+ecryptfs@lfdr.de>; Sat, 21 Feb 2026 01:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18E7285CAE;
	Sat, 21 Feb 2026 01:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UryITFR6"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE53D1F16B;
	Sat, 21 Feb 2026 01:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771636833; cv=none; b=CMJLlDEI6/6wrw6XdoG5LQjTWN6g+wO7u7/hJHHhiBNMbF7/84dwXrpLJwPkhfSBmzPV2JPmgHKy+N1LOTbYYMzc8ezlahTwicKfhB42uQm7RH+v3Ouq38moX3yXCwsPAF932aXySBWhtmD3tHCZNbyMH+wxdbVf8ORcMNd3y7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771636833; c=relaxed/simple;
	bh=ZGhYX+MY4UtEpweTnj/Ge/e3VrMLpqy3NwU53SCIcJI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HyQyT2276eBZUF7GNWDi9jhlUR/jfNWfHKdJ1vMG4tWOGu30GjA696jJTs05rC6eKgRbc8bPK5SgX6+2lT5xJ2Zf1LROsOYIShtB73y+8srG4jumS2k0n0iIMElxeGv2JmNqiWRb+aIxj8xPB+qHj3ztLyDvgpjqS/+qH+KsB08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UryITFR6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3994C116C6;
	Sat, 21 Feb 2026 01:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771636833;
	bh=ZGhYX+MY4UtEpweTnj/Ge/e3VrMLpqy3NwU53SCIcJI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UryITFR6v4434H7HkjSooSXujOkxB7pnvMb8JzXmhGdWfsniRRv8J8fqrLQqj+h1m
	 qFFMQoW+uOGUezmmO7+t1lek/BS3dNf6/xxS+aI4/Cv7TlexCJMN/EFeIvUOzDjVy7
	 SPMWf6qyfwUgbW8486e9dlR6m356zTHuRdrrjcoJFaZdc8qK9hexDrKC5EmjbYw+df
	 4xbiugw6/DHXpC4uQj+N7lap5upkQgj0U1IxdMV9AIMgUrrV6D/bgQRy/SVFCNbV8T
	 KQy4Gv2cwGZk2NtI3p+MClzvO5477bBKWprq7euHF0OdcRtPWjXde7W3U68iuDH7wz
	 UzfXzeOjR1N6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA5403808200;
	Sat, 21 Feb 2026 01:20:42 +0000 (UTC)
Subject: Re: [GIT PULL] eCryptfs fixes for 7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aZZhxvVTFRpbVNv2@yaupon>
References: <aZZhxvVTFRpbVNv2@yaupon>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aZZhxvVTFRpbVNv2@yaupon>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-7.0-rc1-fixes
X-PR-Tracked-Commit-Id: 99853d9daef240a45e161d0e33487cda4810b999
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 233a0c0f4498309f98d98a4b6543fa05a12d9587
Message-Id: <177163684161.970518.6724582222782150676.pr-tracker-bot@kernel.org>
Date: Sat, 21 Feb 2026 01:20:41 +0000
To: Tyler Hicks <code@tyhicks.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, ecryptfs@vger.kernel.org
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-787-lists,ecryptfs=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,ecryptfs@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B53C816BB86
X-Rspamd-Action: no action

The pull request you sent on Wed, 18 Feb 2026 19:05:10 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-7.0-rc1-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/233a0c0f4498309f98d98a4b6543fa05a12d9587

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

