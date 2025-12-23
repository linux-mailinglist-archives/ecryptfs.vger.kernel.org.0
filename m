Return-Path: <ecryptfs+bounces-748-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E8BCDA61A
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 20:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FBC73002E92
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 19:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E15D349B15;
	Tue, 23 Dec 2025 19:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="ANw4cVLg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="frNaSjpq"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E883128A3;
	Tue, 23 Dec 2025 19:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766518932; cv=none; b=JYwM+yWN18yJT5qMS9K/daT77O+pseh4zCG7laTsHJS/ZO0mX9fZrKNDqGeZki+44IRTXeOcYb12GBlUnOEe56iXYiUhN+O8/Vx+oaKmUyBGalG8cNmnAPVp8FUZPtdvhJfI+dTdLDuEngUE/JdnwDY8xLTQ2Nj8ARQMyjQ6SEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766518932; c=relaxed/simple;
	bh=OQTJGJNWqxXU1nWguhK7yFMB60oIR4XFtVOVPcYevkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mUbmUs+zABY28pg0YVpaPTB+g5D35plxrKU1eVk9x44zIa1RQSkSp5IDiW/z8QnMue/giLun+2C6y2JVQmS/eCoOPEDwBfDOiihTlDbkaqRB97etd33huU2qIffyr651k6fhEQ66epjNNTGfopto/awgCG1zNTn99uoUWksGLdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=ANw4cVLg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=frNaSjpq; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EEFD87A0083;
	Tue, 23 Dec 2025 14:42:07 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 23 Dec 2025 14:42:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1766518927; x=1766605327; bh=1XC+sNukP38+K18E99RS9
	+txkoGEKY99PBLYqYUPDWg=; b=ANw4cVLgIPUiRW9xqU0EPVcuK/m6QYkKuiJpa
	sx9uQGA/Cyj/aydsAuM61SBz/RnThj16rPpNP7IAcVqJcnZDXoszaWqiw95g0xyo
	Ji7SCJ98K2gCiIt51mmgA7Wrpe1mUrHw5z1bTNNI3+eb9HF24QA1HdZDnJkbjxg1
	MMQ340q1Uyyvj8LaFXwP1MdgS2RkDvrWsJbXaoHGTmFKWKPkadtqLISHzpPp9L22
	FI9GMfXkkGcAxNV6QyaHJSBlMscLRw+VVdf7cLeylI7cOTzo4lS+34IfMdZbeJ/P
	U6gmmZ1bJA/bIGCILhUO55cT2doFcW3M1jp18LuU81W4PuyGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766518927; x=1766605327; bh=1XC+sNukP38+K18E99RS9+txkoGEKY99PBL
	YqYUPDWg=; b=frNaSjpqFBQ0nf7b8M+3BM6rShAc5eG14xkxm0dq4Dw7iw02N1n
	TkOwWzF17WyZz3KZgUZV01JtOOgm/0fvE89JEPr4DJKjvI8dmO0Om3gTSrEdyp0K
	V+lo/jFkH1mE8xsmrN0wXhKOZecEyeXg/tw1gqZDfqMEjb/9WQvieGetm/qoRBqJ
	Cj11nn3oPxE1ZOfQov8xW6xtB4SM5LJCy7JfAosgg7c3syw/kfdwoth5w90nbEWo
	zMlI6sQNmB4uBpe9/2OePKCIS3boELhsk88acKJvqCf/fVuUECzT6+MfF+erxBZD
	yLH5QJ4jWB7RCbNo7DoWvGRx1HosLUh+gnA==
X-ME-Sender: <xms:j_BKae1qU6htbD_bieubwWZmvyGVRZ_hKNFbsGCMsFLOGrLhxb7r7Q>
    <xme:j_BKaRzjwESFL3HO_D50-5ygQBRzNBK1zHph3agjOwBgVFNVf-rRSESC9jimrEsgI
    ej04JktbMzD5BFmsCpio9Jo-AW5PSKFQPtngwlHo7BBA399UzrBDv0>
X-ME-Received: <xmr:j_BKaVGvsH-EDlT1wpuCfFFCJ578VUu1l769AXDUHU2fw0jo6996go3cmLs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdeilecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhihlvghrucfjihgt
    khhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeejte
    etjedvfeelkedutdfgleegjedufeeigeefkeejheetvdeggfefffdvgedukeenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesthihhh
    hitghkshdrtghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepnhgvihhlsegsrhhofihnrdhnrghmvgdprhgtphhtthhopegsrhgruhhnvg
    hrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjlhgrhihtohhnsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopegrmhhirhejfehilhesghhmrghilhdrtghomhdprhgtphhtth
    hopegvtghrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gtohguvgesthihhhhitghkshdrtghomh
X-ME-Proxy: <xmx:j_BKaUbLtkpJMKOxAstLXNTgzc6WNq61TT0Sz9iYDZbvNfl_QAQrmg>
    <xmx:j_BKaXDM15ZYAbPYnxMpmRhVo0FgBgFo-S6xSi-sJhL9brD5tHbOvw>
    <xmx:j_BKacmmN0Eisq5HabUD8orkfhmfzLwtPThq0XDwcDXsOTUbtPJ_sQ>
    <xmx:j_BKaYxXY2etTJ9pUwx9J1W8CAnQOf19JtZEz-Pe4pORjEzNHlSEzg>
    <xmx:j_BKaVhon2Pg0UiN57_L8-fF3j0Y_H-RbdNXTSpQxFOQ9j_2EUweax5N>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 14:42:07 -0500 (EST)
From: Tyler Hicks <code@tyhicks.com>
To: NeilBrown <neil@brown.name>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Fix two regressions from start_creating()/start_removing() conversion
Date: Tue, 23 Dec 2025 13:41:51 -0600
Message-ID: <20251223194153.2818445-1-code@tyhicks.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running the eCryptfs test suite on v6.19-rc2, I noticed BUG splats
from every test and that the umount utility was segfaulting when tearing
down after a test. Bisection led me to commit f046fbb4d81d ("ecryptfs:
use new start_creating/start_removing APIs").

This patch series addresses that regression and also a mknod problem
spotted during code review.

Tyler

Tyler Hicks (2):
  ecryptfs: Fix improper mknod pairing of
    start_creating()/end_removing()
  ecryptfs: Release lower parent dentry after creating dir

 fs/ecryptfs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
-- 
2.43.0


