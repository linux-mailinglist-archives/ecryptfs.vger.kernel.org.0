Return-Path: <ecryptfs+bounces-1175-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK+4Hsfsy2mlMgYAu9opvQ
	(envelope-from <ecryptfs+bounces-1175-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 31 Mar 2026 17:48:23 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCFA36C0C0
	for <lists+ecryptfs@lfdr.de>; Tue, 31 Mar 2026 17:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6766309C48C
	for <lists+ecryptfs@lfdr.de>; Tue, 31 Mar 2026 15:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDAD421889;
	Tue, 31 Mar 2026 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="csoYo84E"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F58E421A06;
	Tue, 31 Mar 2026 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971476; cv=none; b=lCL41BX/bTYfIN+iyL3spZ1XVg4ALNeH/6kIh2d5l3AytZDk/ZrwrR4oL1WtArvdcU7DYTfzAOfv1EwEWPRgcYgvGXh9eGWXsTFRfZFgeLZll924Wj9R5v86Wf97krUGK351sx7TaEVlOU7Iq18zEsHl3BOJxIqtXFB+dWCcXGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971476; c=relaxed/simple;
	bh=8gCMWE2Qd8IwmVsRTMeWtcJdfWvq3SeUTDnOV07VGEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mo0+CS3IgQt97HQL1Yp8zjaKy9kGT9PMb/HOqgJdlpyWaeERYZl1tk5U480fZ08mj1K5gDc8pQnqk8rxy1LF/aBLkSiES96g/kU8VyTn0Gop27c1FHHto3xjhguuo9932FzDVmPkn4zortijtAYT6eRZk4ZHfynpd06FWEEZQIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=csoYo84E; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=2gbIziB0ZugjBYtni8dyMz1eYZivclVeo4kCTPpshjM=; b=csoYo84E4OcmnBmGePem23o0rc
	K7uSzuHUFOJMROjZZgpExYFr/bEiRB3rH5UbkZHI3R+ZJ7jwUzSRdOVm1QfsHsYQy15Kg7EmMeAHn
	mmX/0Y8pD8lnCzffVn74FBKv51pN8NegdF2gJsnKL1aPs3IfhZtWLxX5MxyIjkC9z9IJKBVJXpvVm
	bUjRI6EP1uNPpPKt9CHIgo6+0hUH7SSZSq8ovWnrY49UbFHuI273XW5r9XvHh5UGlbBU2749z5LBh
	dNYMY2cmmJkjVLbD/DlgBRYSj1OTePxDqrPEfnUkKMxXnslrN/9noo8WF5RMcKdxIWqix/DxY7zf0
	sxllAOaQ==;
Received: from [2a02:1210:321a:af00:3fa:89ae:5c22:a910] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bAA-0000000DC9Q-2wDc;
	Tue, 31 Mar 2026 15:37:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: cleanup truncate handling in ecryptfs
Date: Tue, 31 Mar 2026 17:37:21 +0200
Message-ID: <20260331153752.4049454-1-hch@lst.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1175-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,infradead.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5BCFA36C0C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tyler,

this series cleans up the truncate handling in ecryptfs.  I did
it as preparation for some changes into size changing truncate
VFS interfaces I'm looking into in the moment.  The changes have
passed the regression test suite in the userspace ecryptfs
repository and against the ecryptfs next branch.

Diffstat:
 inode.c |  228 +++++++++++++++++++++++++++-------------------------------------
 1 file changed, 98 insertions(+), 130 deletions(-)

