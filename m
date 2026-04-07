Return-Path: <ecryptfs+bounces-1199-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI6EJEcP1Wl20AcAu9opvQ
	(envelope-from <ecryptfs+bounces-1199-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:05:59 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD7B3AFAFA
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9CDD030206F2
	for <lists+ecryptfs@lfdr.de>; Tue,  7 Apr 2026 14:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7D02F6184;
	Tue,  7 Apr 2026 14:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fxdjNjgx"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E733B47E8;
	Tue,  7 Apr 2026 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570629; cv=none; b=mPCQZc8pX6NQcwN9XWaopOM5XeDfsaUwjNquRCIHhuqagxXnzt8Cgd1/0EoSZ8ygEKQG8lpSplIrZbJvQK5jkNtONNY+O3VF2abjuW6DQF+WY2vQ2yYddZtAO3eVoH4B5qDz2EUPKswSFgUUuNsDDonPIr8U6EiKIY+m8u3vMbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570629; c=relaxed/simple;
	bh=DpLR+JYR7iEftVwaO1mTLNukv4rP/pYTY8B4qA9kOyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gy7LepkCvEC0ySL4D9InbW9dmXkIo/cNlRORZOkur5AFQCSs11pqUlNuaWXY/AODBrBPu3NLJ2kp+aIKiUcDqrheympEdK/5gDlhY6V9OGLtOdxPhz/j9bwnSea2okXlgb/WES4NAUAOAtXelrjtRrhgR27hcsAwkfYQXARCr64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fxdjNjgx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=x8wHx/06Nif4EID+jlc04LMDvl7rXMKGmefrgkj3IYc=; b=fxdjNjgxSF41PyLNLrIq8qgHl+
	W6ZS8zymM2LKE1pdMwFFiBVgmi7yPyN0qilMgmUaGSzB5adZ1lEYoA9oKeXtfZQUpZJHXvciGMTe1
	fXn729M7UY4SsCnrPnHkYqf9KLlBPkAVDIRroxKhbENcyL97Tgi+EitG/bbel22xeN681dTM30CbY
	iQfr5puNlTE7g2i7kuoun7mDDBjlWHA9qnJRTq4Hvq7rKT2fhaVK8hKBKPbZJydGzInEjMpZ/nOHy
	uwqGmVfHVd5nBg7eMm/YgJLN5xYUYm4dLMNo3YWqzYDj+nT23jnq4IUxtyeOJnDXEvd4CHKYANBGV
	UtH/0X6g==;
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA71w-00000006Ynm-0NJI;
	Tue, 07 Apr 2026 14:03:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 4/7] ecryptfs: combine the two ATTR_SIZE blocks in ecryptfs_setattr
Date: Tue,  7 Apr 2026 16:02:40 +0200
Message-ID: <20260407140329.633186-5-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407140329.633186-1-hch@lst.de>
References: <20260407140329.633186-1-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1199-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:dkim,lst.de:email,lst.de:mid]
X-Rspamd-Queue-Id: 8CD7B3AFAFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify the logic in ecryptfs_setattr by combining the two ATTR_SIZE
blocks.  This initializes lower_ia before the size check, which is
obviously correct as the size check doesn't look at it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index daa63b7dd015..ec6aae5af1f8 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -934,16 +934,15 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 	rc = setattr_prepare(&nop_mnt_idmap, dentry, ia);
 	if (rc)
 		goto out;
-	if (ia->ia_valid & ATTR_SIZE) {
-		rc = ecryptfs_inode_newsize_ok(inode, ia->ia_size);
-		if (rc)
-			goto out;
-	}
 
 	memcpy(&lower_ia, ia, sizeof(lower_ia));
 	if (ia->ia_valid & ATTR_FILE)
 		lower_ia.ia_file = ecryptfs_file_to_lower(ia->ia_file);
 	if (ia->ia_valid & ATTR_SIZE) {
+		rc = ecryptfs_inode_newsize_ok(inode, ia->ia_size);
+		if (rc)
+			goto out;
+
 		rc = truncate_upper(dentry, ia, &lower_ia);
 		if (rc < 0)
 			goto out;
-- 
2.47.3


