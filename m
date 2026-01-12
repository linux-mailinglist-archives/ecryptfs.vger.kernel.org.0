Return-Path: <ecryptfs+bounces-771-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0310ED14195
	for <lists+ecryptfs@lfdr.de>; Mon, 12 Jan 2026 17:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FA313029D26
	for <lists+ecryptfs@lfdr.de>; Mon, 12 Jan 2026 16:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E595361DCD;
	Mon, 12 Jan 2026 16:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZGyPNfyh"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38342FA0DD;
	Mon, 12 Jan 2026 16:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235697; cv=none; b=jeUV7vqir1Xy5jwCzPzNWkjdAzdd/7Ix9UKeYKrsXKx87yI+egEPZ0c3o1VzfseH/nQrDKWqZKd5i6hNQ0srJE29roxpLsc1pGT2JncUKcBKpjk5IxgxnRgqMVVx0TwS8px8suSAzY9SDS1NQEMH7rlJ8E3BF5NkMNfG6q8kU7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235697; c=relaxed/simple;
	bh=zTb5lU3bOBv3uhvXWPAdHa//auC3GGXQxT6n5kjBQtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJm/hmRkjw8HwUQXt0bI/zfs7enSepDReD9F+0B442mrxnxsgTEfkFk8YgNSde4TNHgoNlyKv7OHSl8Q1htc6kvV7GMOx3Gp+BxsVEnWPwLfk98M8LZBgE9WHWSmr2ZC5KH5selo+oT2N2lWCxeDEXX83U0eVo74K1czSLI4P9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZGyPNfyh; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768235692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AV3VJYCb2VS3o9hk7CFRfVKvN3jIf3bw5gdD4CzuZq4=;
	b=ZGyPNfyhhabzWRM/QtJGMuDpTlDWBY6sdekCd1ypPn/6nmu5/GoxdQAx1htE9W+sfRJxuu
	an25oLJ8L3rdmZGax25wxZAgVq7JzVTkQ80oKoZH+uDrdR3vpWeahXCLqoYSCP6XniFTVj
	6y62BvNDzQKqA/cLr+i8gVxJjowMDoI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] ecryptfs: Annotate struct ecryptfs_message with __counted_by
Date: Mon, 12 Jan 2026 12:53:11 +0100
Message-ID: <20260112115314.739612-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add the __counted_by() compiler attribute to the flexible array member
'data' to improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
CONFIG_FORTIFY_SOURCE.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/ecryptfs_kernel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 62a2ea7f59ed..f58b12be8267 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -359,7 +359,7 @@ struct ecryptfs_message {
 	/* Inherits from msg_ctx->index */
 	u32 index;
 	u32 data_len;
-	u8 data[];
+	u8 data[] __counted_by(data_len);
 };
 
 struct ecryptfs_msg_ctx {
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


