Return-Path: <ecryptfs+bounces-205-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2301A9B3334
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 15:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCD121F2237D
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 14:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFAE1DD54A;
	Mon, 28 Oct 2024 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YromjrQF"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A030613D539;
	Mon, 28 Oct 2024 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730125199; cv=none; b=UdYfGDIthjybOk67JsQanqYWiaYgXt7DFUu//k25SnrswF2IpJA7efe/ry+8h2fHQ05YEQ0NtgZHRegdQ9lt9KRHes3QnUlngTGoyZF+1vpNaDajn6YNJ09Jn9FrgdrLJRTbewjAcBYKkoCSsMilSuF6RAuO4JsF0/p24yxfUsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730125199; c=relaxed/simple;
	bh=tqIGXfWySVqmxwbK2vYBkyXaDOuE2luc6nOJqDyrECc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fh+mujIKL+DF2PgT70pRW0C2sRCizWwz1CKb5tlLfvRoj2MnavHx0ucPoP9aiZ8Q2wndm5ncodo+dkIVhj5QjD0VjbaS7EmG1nGYe4c/sPD9vMW+DRl4oESbB3Ntbf0aF6CFe6A3Z3oxhOo0CPQEoAmMEM8nP/H9ni4VOTcAeT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YromjrQF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139F5C4CEC3;
	Mon, 28 Oct 2024 14:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730125199;
	bh=tqIGXfWySVqmxwbK2vYBkyXaDOuE2luc6nOJqDyrECc=;
	h=From:To:Cc:Subject:Date:From;
	b=YromjrQFrPchwFDEmAVQjA0yJg8/CYb4ec5x4sDlJ7HyTqtgIgFOjlEdummqsmOt0
	 wJCQE9IH3EO/5j6V35PYYaLaC91lU2VyjdKiYxHXhJmgDh2UV2g0uKqC9p+tXq0ave
	 nmtVzamzhU9S7zpHBO/3y6XS2M+EEeEnKgVseZ0DpmIH3uGwDUYE92C7dSGE92HKmY
	 lKrrUavBuJnD42yTJd69n2FXa55I0FeiSCh2cnP0e63zABLsiTPX3w4iDZSjnIQZsq
	 niNtKQ1quRfVErzRLJw1t9qwQgboXOUVDZBe5BN/wVoMgL8lbGRbYUKtGzhQe87wNR
	 1965g4vlU9oiQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Tyler Hicks <code@tyhicks.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] eccryptfs: select CONFIG_BUFFER_HEAD
Date: Mon, 28 Oct 2024 14:18:45 +0000
Message-Id: <20241028141955.639633-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The ecryptfs file system uses functions from fs/buffer.c that
are only available when CONFIG_BUFFER_HEAD is enabled:

ld.lld-20: error: undefined symbol: block_dirty_folio
>>>               vmlinux.o:(ecryptfs_aops)
ld.lld-20: error: undefined symbol: block_invalidate_folio
>>>               vmlinux.o:(ecryptfs_aops)

When CONFIG_BLOCK is turned off completely, this is not needed,
so add a conditional 'select BUFFER_HEAD'.

Fixes: 7ba13abbd31e ("fs: Turn block_invalidatepage into block_invalidate_folio")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Ideally we would not depend on buffer heads and instead remove
the dependency here, but I could not immediately figure out how
to do that.
---
 fs/ecryptfs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ecryptfs/Kconfig b/fs/ecryptfs/Kconfig
index 1bdeaa6d5790..b3c603c4f808 100644
--- a/fs/ecryptfs/Kconfig
+++ b/fs/ecryptfs/Kconfig
@@ -2,6 +2,7 @@
 config ECRYPT_FS
 	tristate "eCrypt filesystem layer support"
 	depends on KEYS && CRYPTO && (ENCRYPTED_KEYS || ENCRYPTED_KEYS=n)
+	select BUFFER_HEAD if BLOCK
 	select CRYPTO_ECB
 	select CRYPTO_CBC
 	select CRYPTO_MD5
-- 
2.39.5


