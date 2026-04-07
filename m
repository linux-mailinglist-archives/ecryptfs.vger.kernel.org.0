Return-Path: <ecryptfs+bounces-1195-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCCMLXAQ1Wl20AcAu9opvQ
	(envelope-from <ecryptfs+bounces-1195-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:10:56 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 395C83AFC56
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD0CD304A88F
	for <lists+ecryptfs@lfdr.de>; Tue,  7 Apr 2026 14:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209B23B38AF;
	Tue,  7 Apr 2026 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QWQ4XLDy"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D270818;
	Tue,  7 Apr 2026 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570617; cv=none; b=eBM8ENqRGe5DLtd8AXT4VoC83BbAQkgFG9HW+ASD966atwMQeSafwRgIq/nq8eCtx3vpbz/oRmhce7tACIC5QYIzJhGQbpfhsjp/nJ9En940uuvH+/ymLBNvCKUF/tBFYLVZ0emu8v6EWD0kX+CGd7VPBihBviC2h9rqpB1Azb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570617; c=relaxed/simple;
	bh=76nrtXh4MSEfNpanqH/1clK97Vvry1e1M/oe7idLUE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xv9uz6yG025198b7jCSBnSfBpp3KtA6Q1DXPlBch4IIDD47kC9KdIrmuURD6ifl+mptIJKoEQXGx+uEjJRlwtn3iwDljV7NeUBA8ru3vzW0h5gUeRmZn1e/nK6wxvXkyqr1rr3HfT2oxkP9aR3IQoAk7fNspOqRGfUGa0mu5VWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QWQ4XLDy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WbhNEb6lnJ3vwd2bYk33okchQQ1TbDT10BiTysgUS2I=; b=QWQ4XLDyyDcR+ZOP5nmYGTyWKo
	iT2+3CUe4cxMkDz+I9YYhLaMDaZnQWSMIn7BkcR2wYsNTvNmOczmKTIFyjIgVnDyquzltBIeqcdWZ
	JQpyWIKOLJ5H3hVt+iF/c3wRrOp1M5m4GA1NvX2S7BbXpP5f3PH4s2Ps2pIa5DuBpEpjzrc3AY2nO
	ARKdELIn27Co7AfIarlPFyaIhMLMn70+7clHzU7nCQVht55pdUhCp+VGzBuddGGZNAS6IXfh8AqwS
	GGDywUd9+Wlkn9sQXcgEzw4bPk59K2Ua8fMesTcuZmvH2T85TWZ5GpX5Dh3qdbRLFQjzGYo+kOHTw
	C22YjvfQ==;
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA71h-00000006Ymi-2S76;
	Tue, 07 Apr 2026 14:03:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: cleanup truncate handling in ecryptfs v2
Date: Tue,  7 Apr 2026 16:02:36 +0200
Message-ID: <20260407140329.633186-1-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1195-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,infradead.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 395C83AFC56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tyler,

this series cleans up the truncate handling in ecryptfs.  I did
it as preparation for some changes into size changing truncate
VFS interfaces I'm looking into in the moment.  The changes have
passed the regression test suite in the userspace ecryptfs
repository and against the ecryptfs next branch.

Changes since v1:
 - fix a pre-existing spelling error in a comment
 - pass an explicit new_size argument to the main truncate routines
 - fix a comment that kept obsolete information

Diffstat:
 inode.c |  243 +++++++++++++++++++++++++++-------------------------------------
 1 file changed, 105 insertions(+), 138 deletions(-)

