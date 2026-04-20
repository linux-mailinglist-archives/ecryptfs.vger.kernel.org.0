Return-Path: <ecryptfs+bounces-1218-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOZlCRtt5mmBwAEAu9opvQ
	(envelope-from <ecryptfs+bounces-1218-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 20 Apr 2026 20:14:51 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA334329A3
	for <lists+ecryptfs@lfdr.de>; Mon, 20 Apr 2026 20:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D07F301977F
	for <lists+ecryptfs@lfdr.de>; Mon, 20 Apr 2026 18:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E573ACA74;
	Mon, 20 Apr 2026 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pHxAKiCp"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DFB3AC0EC;
	Mon, 20 Apr 2026 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708847; cv=none; b=DzxCUJbp6XoendY8AJSfUx0I8GlyEFg7WkdI9im2D69/VTO9TJgXOrZN2mTVWwwSsMPTm5lKmhjXpwxEP9qmOylRj5OsvUEAN2bO/JVQ8Mf1dUkfbOA/xdR5+9j4COr+SvS5qJXrmxP1u2+lrnNUdZtUm4jjLUmRNiL0RQBpdGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708847; c=relaxed/simple;
	bh=qFVNjp2aqkpL5rh+W2EyYsyBcm0iWddTSCZXJHz5ilY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VW58g6dd7RC+H09Bcomdn3IYWRxin94aN/s8NczZSumlsQMnD2FOVa0oRVyahMQfIkENIh8pdebI6XCsW0ll+NzJsnMPibYw3iiR+or26BsE75gRmjyXmN1/H82sKQ6mA2c2fyoMh9RWWalGUXPLsouHBOGntwdPuOUDhdm9YgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pHxAKiCp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870FFC19425;
	Mon, 20 Apr 2026 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776708847;
	bh=qFVNjp2aqkpL5rh+W2EyYsyBcm0iWddTSCZXJHz5ilY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pHxAKiCppxCRFwmujJ7Q9yI+xDxegify8g2RbNDkXH9OxGVaptM4LjR0m7sWDRpyK
	 b2PR6Q7CZeb+40gLbcOUHbVjebefmk02EVALiiEUHJl+JtED3O8cBXdLQa8teLVSlJ
	 NY4wwI6bVjBKiy4oAU8JZAUyyLNkf39iw4280MGc3YuZWq221VoZf6MAfHL4KLKjcO
	 /eDtGgzcijax77DbxW4ZULuQiRN1u4jPGuIONXYp2TTTGAHair6yT5+0S/Ja+CWjrw
	 8GihJrFz8dJzf4OQoNE3F0vt7YvTABTR3N8oJIzFk44tvnT/xHX1YXbwBG4tDSuQn2
	 u/mkLdqkycTig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDB2393001F;
	Mon, 20 Apr 2026 18:13:33 +0000 (UTC)
Subject: Re: [GIT PULL] eCryptfs changes for 7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aeXFbJRyKkVM9onr@yaupon>
References: <aeXFbJRyKkVM9onr@yaupon>
X-PR-Tracked-List-Id: <ecryptfs.vger.kernel.org>
X-PR-Tracked-Message-Id: <aeXFbJRyKkVM9onr@yaupon>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-7.1-rc1
X-PR-Tracked-Commit-Id: e836ec1819b0cc50e0b45a53b0bdce6c596f0207
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a5e1c3b6093b13c3ae1c5517c694cad7e55e9ed1
Message-Id: <177670881189.1799182.1104782283062466067.pr-tracker-bot@kernel.org>
Date: Mon, 20 Apr 2026 18:13:31 +0000
To: Tyler Hicks <code@tyhicks.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, ecryptfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Thorsten Blum <thorsten.blum@linux.dev>, Frank Hsiao =?utf-8?B?6JWt5rOV5a6j?= <frankhsiao@qnap.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1218-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,ecryptfs@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCA334329A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Mon, 20 Apr 2026 01:20:27 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a5e1c3b6093b13c3ae1c5517c694cad7e55e9ed1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

