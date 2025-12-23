Return-Path: <ecryptfs+bounces-749-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB6ECDA620
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 20:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5FD4301CA69
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 19:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234C034B425;
	Tue, 23 Dec 2025 19:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="hiK2ySmF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KXwotz2c"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6FC349B15;
	Tue, 23 Dec 2025 19:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766518941; cv=none; b=n54H3V/13J/ne4G+5d8SEq5Bd2nDbS2ne4EkGSiiT3DOTh4LPxfjSGcG2RKW+X8LKBcF0PgFTZtfp29/TOn7ghcoZN/cwhND3VjZXuy6BPq7LXOxLcjKx7TxVMYMH/FYuCsx8uKHw07ZOQfL1y6SW9iBIcgDefd9PQf98LzA9vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766518941; c=relaxed/simple;
	bh=VDSOvfJf2EhvLpJY+5YTYCBviiwHZOXH4tOIofGi8Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eq9R09m1acid9mXbv65eKm2hdyFLLpf6zRKNAKamaK2TNDSsw+HluQki6fb8CiKiCKTq3Xa86A5ABv8uNt39mNbiDyaNQIYvkC8fRSx+uJ0E3n9PCQQUuhXVYXDiPNvKFhsPYpsD9r2DRUJq3Mazm8c01+//+Z+O7ozaij+16Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=hiK2ySmF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KXwotz2c; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id BF6831D00044;
	Tue, 23 Dec 2025 14:42:17 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 23 Dec 2025 14:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1766518937; x=
	1766605337; bh=NNfUUopVHRGea1BeCKEpWzeyAq5Gr+QjH8ip7llYJXU=; b=h
	iK2ySmFmr6hhI1qpLFfUyAnh1kuEUQm6PestopJ4Kc2HO/agTcu61B8Qyjsjtl23
	XC7AJtprqgHoyT1NV4A57TCNCNEJ2/n9+YQaJzDnhVmLBTaCxNrPuw3w1RvOkmMq
	Zm0fKj2UJRAH7vaWuWibgtQ606Q84SAVAG0IbxUiBo8NqQbwscwBxDFGVbJbGhec
	lRhqdxcELlyjXH/AIFF0NrSLtQiJ0qcRMkUcpV0pd2oPM2RjP9DAIPYrzmHYb7Py
	DKhZ8+efkjswd7mwObzfYfHTTp/U5ujN9+aFSwBP6VL6QW+mrqPTU3H9LbVXPUgO
	hVz/HdSAUuhRqgJxQU/yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1766518937; x=1766605337; bh=N
	NfUUopVHRGea1BeCKEpWzeyAq5Gr+QjH8ip7llYJXU=; b=KXwotz2cAhhd9KFjV
	umnQ7FeZtNvfrCehd3Xj8+ekPAlUMVYy7AZTsB24LPKe5gEs2/4FJ/7yqvT9N7k7
	l28CDNaXwSlXpcUhJ/xVjo9uzB/gmwT6quoeZB5eg29314jDGzQ7SZi9XkyB685E
	b/cDaBmqztenN7qrdgnetrcC0m/q5ksaEj2nf/b2dWpw/BlQ3hIpWPS779Ym9IYA
	1npxGSv9majIV+yezWFcWEPSl1syPPOR/0YstZ0w8bajb0/0l+4JqS7sTJ41KMZl
	JP1c0vk/eDQKlmYXA0fqSsgzZvrB3n6zP99ZHt2pDZyxV2oRSCTkBPd78hplt5Sf
	Mfnjw==
X-ME-Sender: <xms:mfBKaWnb60FoK2CCG1IfmVvS7FdnFlmqhuLehtqBPsftG4wGBnuc8g>
    <xme:mfBKaegvCNpjGZKCxa2bKG0JuBuebzPWvIXRC1zdIHMBc-z2MORPNxUq8AXB2Abt5
    IGB2qCSvV9XmxqaztsHZ0NCu6daZycmIgtdSSEIB6rG2D6aPF5Ya8w>
X-ME-Received: <xmr:mfBKaS2qG9LEy5LVi21Tei2aRRg-Ck0BVTw400coHhVVyGSRqIo5pvto58k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdeilecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    etfeeikeekieeuieehffeigeetffekhedtteegkeehgefgffevfeegheevtdejheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesth
    ihhhhitghkshdrtghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepnhgvihhlsegsrhhofihnrdhnrghmvgdprhgtphhtthhopegsrhgruh
    hnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjlhgrhihtohhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegrmhhirhejfehilhesghhmrghilhdrtghomhdprhgtph
    htthhopegvtghrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohguvgesthihhhhitghkshdrtghomh
X-ME-Proxy: <xmx:mfBKafJCdYr4Le-VFAoY4bY_2_Ifi9imUiM0n_SF1QQYxntTgAHBwQ>
    <xmx:mfBKaaxIBVWMfPz0ZyrVcLeQivcRPKihSc_7xtUnEnQiFjEJwGOo0Q>
    <xmx:mfBKaVV0g6cPadX1sX5ibGu4LNgs9GRqpcMoLmE-97fllbHkkBF0ZQ>
    <xmx:mfBKaSikZfU1WahZLAEcCPwK94Eqb_i1mcCBF63ha81rBg0k7qdQ2A>
    <xmx:mfBKaWSZM3QZiCIYc9w_RypW7e3_XSYlsT7TWrnaTfPApYnZQqEvqU6S>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 14:42:17 -0500 (EST)
From: Tyler Hicks <code@tyhicks.com>
To: NeilBrown <neil@brown.name>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ecryptfs: Fix improper mknod pairing of start_creating()/end_removing()
Date: Tue, 23 Dec 2025 13:41:52 -0600
Message-ID: <20251223194153.2818445-2-code@tyhicks.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223194153.2818445-1-code@tyhicks.com>
References: <20251223194153.2818445-1-code@tyhicks.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ecryptfs_start_creating_dentry() function must be paired with the
end_creating() function. Fix ecryptfs_mknod() so that end_creating() is
properly called in the return path, instead of end_removing().

Fixes: f046fbb4d81d ("ecryptfs: use new start_creating/start_removing APIs")
Signed-off-by: Tyler Hicks <code@tyhicks.com>
---
 fs/ecryptfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 3978248247dc..e73d9de676a6 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -584,7 +584,7 @@ ecryptfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	fsstack_copy_attr_times(dir, lower_dir);
 	fsstack_copy_inode_size(dir, lower_dir);
 out:
-	end_removing(lower_dentry);
+	end_creating(lower_dentry);
 	if (d_really_is_negative(dentry))
 		d_drop(dentry);
 	return rc;
-- 
2.43.0


