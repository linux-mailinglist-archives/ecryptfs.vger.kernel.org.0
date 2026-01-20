Return-Path: <ecryptfs+bounces-779-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLNeDNUacGkEVwAAu9opvQ
	(envelope-from <ecryptfs+bounces-779-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 21 Jan 2026 01:16:21 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4824E662
	for <lists+ecryptfs@lfdr.de>; Wed, 21 Jan 2026 01:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81F4E7E6DCC
	for <lists+ecryptfs@lfdr.de>; Tue, 20 Jan 2026 11:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC43B410D0C;
	Tue, 20 Jan 2026 11:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ocFaVdYe"
X-Original-To: ecryptfs@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5841322D
	for <ecryptfs@vger.kernel.org>; Tue, 20 Jan 2026 11:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907020; cv=none; b=PG4PPTP0IdObvd62kinZwXz0D4X3TbOAon7+FV9LtOyz4o9SPFSTEDJfZkFOGN/y5bhiAFYs+o6iKnv484J9A3YMgCgGj7QnLDkzJXM1VfbnNgooLgTOTBnDNl3zTTsjJHpgoOIh2WmuMg3a9LhUPibjrZxFqJMobOMBDXBheqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907020; c=relaxed/simple;
	bh=vGAiSd5RINZ18iLVlfJyKMx/ilvW9bhLBsN6bupcwUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lw+zhJt2mZ7IqFdyIfn5App5plCYVPNrAAjbyxJZ01ATFqe/C2eQYBNyK3vVs+5JSb1HWsMeQIaRIrUnU87bkeEkSJQUHUq3XKrXDzGKWolSqKJRfewFPaCHxZLrnDdkrCvP36GfEtKGM9XXD9W54v8J96/Yrlv6j9RVCULsYn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ocFaVdYe; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768907006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F9INFmCeG8m4mTLtVGVLw1SNSXYLotttmqstDkwTK9g=;
	b=ocFaVdYe9xZEGEi53fBef0ENSUjUOzJWCCAU1HfdoS7XiprR1f2EQPrAwTSDiC64XGeUrw
	JZBGsM5U0g1WAFs5H1c+hq8RSELQVuLly6RQw2jUGZpSkcBFUHVYZcDs9JyAnksy7Idg18
	xIXfQ09UtZcQ4yxXMi9DjlpE5dDBRo0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tyler Hicks <code@tyhicks.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: Fix tag number in encrypt_filename() error message
Date: Tue, 20 Jan 2026 12:03:13 +0100
Message-ID: <20260120110316.1257158-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linux.dev,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-779-lists,ecryptfs=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 9C4824E662
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Report the correct tag number (70) instead of tag 72.

Use ecryptfs_printk() and reformat the string to silence the checkpatch
warning: "WARNING: quoted string split across lines".

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ecryptfs/crypto.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 260f8a4938b0..6012e4360096 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1378,9 +1378,9 @@ ecryptfs_encrypt_filename(struct ecryptfs_filename *filename,
 			mount_crypt_stat, NULL,
 			filename->filename_size);
 		if (rc) {
-			printk(KERN_ERR "%s: Error attempting to get packet "
-			       "size for tag 72; rc = [%d]\n", __func__,
-			       rc);
+			ecryptfs_printk(KERN_ERR,
+				"Error attempting to get packet size for tag 70; rc = [%d]\n",
+				rc);
 			filename->encrypted_filename_size = 0;
 			goto out;
 		}
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


