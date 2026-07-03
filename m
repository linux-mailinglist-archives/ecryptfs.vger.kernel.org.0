Return-Path: <ecryptfs+bounces-1236-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ycCwK+R6R2pYZAAAu9opvQ
	(envelope-from <ecryptfs+bounces-1236-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Fri, 03 Jul 2026 11:03:32 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 467DC7006A9
	for <lists+ecryptfs@lfdr.de>; Fri, 03 Jul 2026 11:03:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bG0WnlT2;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1236-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1236-lists+ecryptfs=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 987CF304A9BA
	for <lists+ecryptfs@lfdr.de>; Fri,  3 Jul 2026 09:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D0B3859D7;
	Fri,  3 Jul 2026 09:01:22 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB393822A8
	for <ecryptfs@vger.kernel.org>; Fri,  3 Jul 2026 09:01:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069282; cv=none; b=VVXjo1vlUTOrYjd9aaKkjSiS+Jk/6S87vfWfAY9+xteusYJjp9uqKF3evexsWymn+7rI43w6mDF0t/FzLsagYjRfKl/OD2emZXRLCcFPToZmMccYHy8S228gTwdsrRrKjKQUQGmQ8apUoaNC15fo4Qr84D4wIPFC/26qgRr1rlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069282; c=relaxed/simple;
	bh=plPuBPDvVMmoqq8HGkW7odDvWN+56ZelpqvoDwCxFm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADEPBqe++WdGILXKeABG35XZgCYeiWtdWpciSAuqgwxVvl0ez3bQHqCDlYj/cEpRpqYKEr6z8G96kbQkc4+HJrq5vM/4knMBhsq/dLlKUgkiydBYPZfzaY+dnsUwcg018wymRjMWrdLo4Gu34YJx5VmLKFi6pg0B3MmhSZtn+xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bG0WnlT2; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cad4170e8eso3770055ad.3
        for <ecryptfs@vger.kernel.org>; Fri, 03 Jul 2026 02:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783069280; x=1783674080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DpL8woiCxyDID9Fjvu39ftJpVrBiFir6LWiq352ksZk=;
        b=bG0WnlT2gqOkyptUvEQcA7aQ9e6fFQj50bVYv2RqGS6geRqh+UDP5O+yyTtldDzEVU
         l60AY6ouV19fFkzLNEYQGrSalKfr18uJanAFzrS0zWdFQCZVw02eypHNq+M4dvL2PCjY
         EQGgpvLpT17aQaIthLdfv7wv+lOq99okvUcVWojVPyhvXSXIRMLCcRwqNMAGWucXPjV+
         PQjtQiMvkIaTu8/0FZeuE3f8qRqkbRBm5vrLpgfDbS1TAODMkSsYDksV3GJmoosTVYU5
         5Rk6oR3Hz/U3RiGQQ/2Feg0N98SEf0rG6Ftu8pC5F7eJCRi8iMs5HSmMtOnPhA/SNitr
         0HLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783069280; x=1783674080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpL8woiCxyDID9Fjvu39ftJpVrBiFir6LWiq352ksZk=;
        b=dBxW68DvNl5uaQMExrzLGcPMe4r411tJXA8WCPP4w4uUvBcCsoZAzjaC5ech3Fc9Ga
         pQGkhrEhSIoFYwcVkuWlM0lGQ8fcsc1/vZoL1hkkYArwtLvAslhOFlG6I5/uRzreSE71
         T477BVIlwaJuFRoJOfnImXJpE8nsj+/hJblLqrFypOAh0HWYVJr6Ktle+aEpFHtf5PXd
         9jopfdvPR4cBpWuovjVYBBNNrskzNZ3+9jZBqCabcgsv1ogNpIKUzIw0677pebZ3nT14
         YYsw+IeJSTuY59a5C5FBjl7w8F4YaBnT/pM8Lb051rQQ+pRgFY68taPhPp4csw7Qu6p4
         aQ9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqQs9/iKsjvc5oxslT4aP1RRGufkBOoEmWXns5GK4TSnk/zfk9Gj4ZLIiuqPr70aBF7sq6Wz8z1tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVIm/zPawCLbB1TEsr6w8gBhUUJiLCMymzhl9s5JgjThnZmKJD
	GgIDHOmWfCUasJymIg+Smi8hRM5f2MCtit3/2hQ9BvqAdljaaCruP2ab
X-Gm-Gg: AfdE7cmNKwKcWFve9oTmcMh0Ufs3/dQcxTiTQ4QweUyAv1J8Pcj1++aKv1sgjID7j9I
	+mZo9B52Y+Y7PwmH1Z462OyVdHvGKb+/ceC4qN9vNt7K+zqyJEy1B0GrwvGijCfIif1+bdfags/
	e9Oe3VNLANk6Nlt4Wu53urHz6Fk59C2mka0iQABTnpZSmCcnBDN1H1qz4RxQ89V1SHC9DcIMp8v
	5KBGDAjpIbGT+0zkOtDEq7wkSzOFD2GmoLHPsId6dzUj2Ao2cLVlNkWgDSRT7Iqo5GkH3UDb2GG
	63XYvg3kHJBAI8aDoI9ozkiEfjGO8dW9lelRs2iAWelcooHptYHSaT5ZCugXLYv6fIQri8a8Q50
	rHuGi+sJNrrWEAgMDXPXLQKVdzHnN+ItcBZ9DUzPHZM8X5Hfmum43/6ycQxToVvagCe5/Djx8uj
	nLTcBmadCy4uthw+xLfKa6Wl/Ofxt2Zj9/DwLGWXD3IXvyQhTL6CvS1H3vUdmnqVCkB/r97pKJY
	p4DpHhkm6bHgVRBIfRLAPxtOAnvj1+HG/iLqy7eLF8ACgt3UUrCqTtFttOnlkGBHD642Zti0Zw6
	iGYRU2qmy3Iq0GhWDlTMq8zO6huS
X-Received: by 2002:a17:902:e841:b0:2c8:e13a:f23a with SMTP id d9443c01a7336-2ca7e8db6c6mr104602745ad.28.1783069279936;
        Fri, 03 Jul 2026 02:01:19 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-b.c.d33bddc1d573818c7-tp.internal (236.148.124.34.bc.googleusercontent.com. [34.124.148.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260acsm6293145ad.6.2026.07.03.02.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:01:19 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: Christian Brauner <brauner@kernel.org>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH] ecryptfs: use filemap_dirty_folio for address space operations
Date: Fri,  3 Jul 2026 09:00:44 +0000
Message-ID: <20260703090044.1649-1-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-1236-lists,ecryptfs=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:code@tyhicks.com,m:brauner@kernel.org,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aditya.ansh182@gmail.com,m:adityaansh182@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[adityaansh182@gmail.com,ecryptfs@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adityaansh182@gmail.com,ecryptfs@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 467DC7006A9

ecryptfs does not use buffer_heads. The legacy block_dirty_folio and
block_invalidate_folio mapping operations were only added as a
temporary compatibility fallback under CONFIG_BLOCK.

Since ecryptfs does not attach private metadata (such as buffer_heads)
to its folios, block_dirty_folio is unnecessary.

Modernize ecryptfs to use filemap_dirty_folio for its dirty_folio
address space operation. This allows removing the block_dirty_folio
and block_invalidate_folio fallbacks, removing the buffer_head header
include, and removing the CONFIG_BLOCK dependency inside ecryptfs_aops.

Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
---
 fs/ecryptfs/mmap.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
index 2c2b12fedeae..a057472b409c 100644
--- a/fs/ecryptfs/mmap.c
+++ b/fs/ecryptfs/mmap.c
@@ -510,21 +510,8 @@ static sector_t ecryptfs_bmap(struct address_space *mapping, sector_t block)
 	return block;
 }
 
-#include <linux/buffer_head.h>
-
 const struct address_space_operations ecryptfs_aops = {
-	/*
-	 * XXX: This is pretty broken for multiple reasons: ecryptfs does not
-	 * actually use buffer_heads, and ecryptfs will crash without
-	 * CONFIG_BLOCK.  But it matches the behavior before the default for
-	 * address_space_operations without the ->dirty_folio method was
-	 * cleaned up, so this is the best we can do without maintainer
-	 * feedback.
-	 */
-#ifdef CONFIG_BLOCK
-	.dirty_folio	= block_dirty_folio,
-	.invalidate_folio = block_invalidate_folio,
-#endif
+	.dirty_folio	= filemap_dirty_folio,
 	.writepages = ecryptfs_writepages,
 	.read_folio = ecryptfs_read_folio,
 	.write_begin = ecryptfs_write_begin,
-- 
2.47.3


