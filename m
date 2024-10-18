Return-Path: <ecryptfs+bounces-184-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EBC9A4912
	for <lists+ecryptfs@lfdr.de>; Fri, 18 Oct 2024 23:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F089B1F26ED5
	for <lists+ecryptfs@lfdr.de>; Fri, 18 Oct 2024 21:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D80118FC65;
	Fri, 18 Oct 2024 21:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C+iDkVGi"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D6418C332
	for <ecryptfs@vger.kernel.org>; Fri, 18 Oct 2024 21:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729287737; cv=none; b=XBFQXOE9aG9mBLNVwkku8OgM0Gx4bplvtuBVv4mbyP3/LWl1KftHhohR8d0IvilYOzXDp8FogBs1h95Gxca26aBY2hOui6+MQQU9IztizxNe81VIEKoWOL301KoQUtbi6grqrznUz9LPBbS2+EoofjyuaP907xhCuv+Nxj/KGSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729287737; c=relaxed/simple;
	bh=4eLz8Jgbz5a48CeyB/rTm/lRqPKjyXMUHycaiAPcLeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dlnVG4VaUllIhJ1zJ/PHQl+4Ywr2gRtHmEzwUFyxt7wcewWZFZ49Bu0cV03EUPQ6WRF2l114UaExfrrMp6KssC99iZ3pP2Ay4aNnIeUG8kMur0Gbo6qx9++o8gn6ohM7svdxqpYahRKlyB4KxY+JiGf2D0SLE2JprrVjylcsG7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C+iDkVGi; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729287731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7EScYlRb8xeUL4sQWu5BTVxE5ql4FkcuPVnEW/yEe/8=;
	b=C+iDkVGitSB9uDsFryudjQ3x4k/PK6pQqou0h50mtwYGHMEHN3lRHIumQwwnxzeOYKesVf
	QfL/xrhCdww031zJJJhyAan7g4DS9xPg3N4Vo+qmGFzt0fanuHVaHSjMfh2zXmHAHMG5mB
	0JerjWVGtJpSzY3QFmixstZxfxFY4KI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Brian Kubisiak <brian@kubisiak.com>,
	Christian Brauner <brauner@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ecryptfs: Fix packet format comment in parse_tag_67_packet()
Date: Fri, 18 Oct 2024 23:41:42 +0200
Message-ID: <20241018214144.163036-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

s/TAG 65/TAG 67/

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/keystore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 7f9f68c00ef6..7266fc1a5fc4 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -355,7 +355,7 @@ parse_tag_67_packet(struct ecryptfs_key_record *key_rec,
 	int rc;
 
 	/*
-	 *              ***** TAG 65 Packet Format *****
+	 *              ***** TAG 67 Packet Format *****
 	 *    | Content Type                       | 1 byte       |
 	 *    | Status Indicator                   | 1 byte       |
 	 *    | Encrypted File Encryption Key Size | 1 or 2 bytes |
-- 
2.47.0


