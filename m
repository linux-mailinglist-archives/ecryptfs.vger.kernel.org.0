Return-Path: <ecryptfs+bounces-1174-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFhoDCNTymn27gUAu9opvQ
	(envelope-from <ecryptfs+bounces-1174-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Mar 2026 12:40:35 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A1B359895
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Mar 2026 12:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81780305DA75
	for <lists+ecryptfs@lfdr.de>; Mon, 30 Mar 2026 10:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324023BC661;
	Mon, 30 Mar 2026 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XGfAqmBe"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0D3BBA0D
	for <ecryptfs@vger.kernel.org>; Mon, 30 Mar 2026 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866957; cv=none; b=tDVpX/mCYHp73gRcgZ1ZXD9bnnBXM0u/R+48aF18qPkz3Mw4PXZRut0TlFI2Mo6Wbz4YRoNd63rukusVoTQB2ieEsybvnFvhCVADp9vUyif5Wgk0XuJBnJXRCZOrTLl8j7Ci83VFJBEBzLtw5jpR0tUu1fqqwzz8/x8tVMZDVgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866957; c=relaxed/simple;
	bh=i6Yuwo4RTk2gB2RMasRmLtxpxX83S/slTd/WcePBHP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GbXlBMXi0tvVBvuZxOJBwwIP7tusSvCX60LJmdqZ9rOpTPxpvPl8ZOsPa5UMj/+4RN8Digu6VDONLEhCSDjvBLPp7y6IleANHved6TUd686swaicxUDOizL0g+iyecehz+nFhloK9ufPeg0BA8cESh6g7eL2SIfxRM+8+odjVHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XGfAqmBe; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774866953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQnDJppw4Lt1MmEwTXnpkr/2Fa3d5p5uRIHkXoRQKqc=;
	b=XGfAqmBedw/LZGap5xyaRcME+aTiP7GEktaqwhm6B8mmj7SFtYsav4REfQ2wuLsVyP33D8
	b4mzDDnQlTZsoHNQlP0wKrpTgiSMEc7O6P2QrnX6XbzWPoAsqzpXnifcU6IYbNZ1Wa89Z1
	NKB1je4u1MWw2WPuAt1S30jelNxcE4s=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ecryptfs: Drop TODO comment in ecryptfs_derive_iv
Date: Mon, 30 Mar 2026 12:35:17 +0200
Message-ID: <20260330103515.389346-6-thorsten.blum@linux.dev>
In-Reply-To: <20260330103515.389346-4-thorsten.blum@linux.dev>
References: <20260330103515.389346-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=thorsten.blum@linux.dev; h=from:subject; bh=i6Yuwo4RTk2gB2RMasRmLtxpxX83S/slTd/WcePBHP4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmnAl8mTwszm3Mz6u+emolWsrtPifbc3zP1dPDOMmWDt TEtaiw8HaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjARpr8M/5P1Q9J4ZJb3O/7Z JxCYonA+rF5hkRLH9rdRm29xG6w65cnIsMb+TPl+pUlVm0UEmTyaN8Y6t3HeuHvkTdnzxZJrAh2 7GAE=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1174-lists,ecryptfs=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,foxmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[tyhicks.com,linux.dev,kernel.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[ecryptfs];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83A1B359895
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the TODO from 2006.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/crypto.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 585bad6577ed..92fbd28e9178 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -89,10 +89,6 @@ void ecryptfs_derive_iv(char *iv, struct ecryptfs_crypt_stat *crypt_stat,
 		ecryptfs_printk(KERN_DEBUG, "root iv:\n");
 		ecryptfs_dump_hex(crypt_stat->root_iv, crypt_stat->iv_bytes);
 	}
-	/* TODO: It is probably secure to just cast the least
-	 * significant bits of the root IV into an unsigned long and
-	 * add the offset to that rather than go through all this
-	 * hashing business. -Halcrow */
 	memcpy(src, crypt_stat->root_iv, crypt_stat->iv_bytes);
 	memset((src + crypt_stat->iv_bytes), 0, 16);
 	snprintf((src + crypt_stat->iv_bytes), 16, "%lld", offset);

