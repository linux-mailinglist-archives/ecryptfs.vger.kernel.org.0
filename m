Return-Path: <ecryptfs+bounces-1211-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAL+OdTw1WmL/gcAu9opvQ
	(envelope-from <ecryptfs+bounces-1211-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:08:20 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 718003B7753
	for <lists+ecryptfs@lfdr.de>; Wed, 08 Apr 2026 08:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD9673028B03
	for <lists+ecryptfs@lfdr.de>; Wed,  8 Apr 2026 06:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA778361DB2;
	Wed,  8 Apr 2026 06:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BzKa2v2D"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B235CB8B;
	Wed,  8 Apr 2026 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628466; cv=none; b=heraJpzuLSmTSSCB9PGKbMixlvV3/1zAd0RneZA7P+P5lRH/zEqlBbGMs2wIPH1rr9HEC+H0phmJFNT52t0AEld9wRapxxyW7zuSRhRg8pFVx8hg0sXxXDRFfGR9hvcsCQObnX7BjTEIRmgJAzUi6Q4vNGQP7UcUbKBP/nORiHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628466; c=relaxed/simple;
	bh=foFjYLJf17H4SA+gzByqmO2ZMUZXSM7eAtYp5sTAhTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LmVAWVcWh9Jh69CNNgypfnbvzW+Upbrq6F5TNiXb/K+vp1sf9vXzV59Wv0SRY8sBHEOe9tqfFiZ/bCzdbRddC661U+5yNrKq8xkV6okFAk5WmHVfLEwpQEax7a6YXKOk5Spl7jk6VCYf0zO8sZsiJ7GyATg/AgJXnwn3NO5DvHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BzKa2v2D; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nLjSrmBxR53OB2b/0XsjyZK/FpbT7SgRSTYRxIk6cOY=; b=BzKa2v2DqloKm5SXAtX44gZ0Dv
	4RKKNavMLme8ph5otbXDuXnSqAubPZSN3ouadzYR+f+Yw/Cw87MqMAbNXsSQg6rKVhOFCVm3w81m3
	6WX8I5hMuZT9AwE0eYWhVJjpk2g+XZ5jDV/zuqzr+1THMbRhCU1//g9U5LtFW5SrGIAO6zY2wQ1i3
	k6EbjiO9lajpGe48WIfj16oQHtwEp72uNsm+lD04XDN67rMoyVnQqB278xhEWkNRlj+LJ9GSOEupZ
	kzSA7E2obnyy/j2HFrqAqHQEyhcbbF+aOZnlpVsbI2twBw/7mI/pWuv/19Rr2fO8ocztYeBHhZGdi
	3+R9GDBQ==;
Received: from [2001:4bb8:2d1:6f42:152:6810:a349:3502] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM4m-00000008Jyw-2tnW;
	Wed, 08 Apr 2026 06:07:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 6/7] ecryptfs: factor out a ecryptfs_iattr_to_lower helper
Date: Wed,  8 Apr 2026 08:06:41 +0200
Message-ID: <20260408060719.714317-7-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408060719.714317-1-hch@lst.de>
References: <20260408060719.714317-1-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1211-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lst.de:mid,infradead.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 718003B7753
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Prepare for using the code to create a lower struct iattr in multiple
places.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 4ec3e76f0562..a06b84033ff3 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -677,6 +677,20 @@ static const char *ecryptfs_get_link(struct dentry *dentry,
 	return buf;
 }
 
+static void ecryptfs_iattr_to_lower(struct iattr *lower_ia,
+		const struct iattr *ia)
+{
+	memcpy(lower_ia, ia, sizeof(*lower_ia));
+	if (ia->ia_valid & ATTR_FILE)
+		lower_ia->ia_file = ecryptfs_file_to_lower(ia->ia_file);
+	/*
+	 * If the mode change is for clearing setuid/setgid bits, allow the lower
+	 * file system to interpret this in its own way.
+	 */
+	if (lower_ia->ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID))
+		lower_ia->ia_valid &= ~ATTR_MODE;
+}
+
 /**
  * upper_size_to_lower_size
  * @crypt_stat: Crypt_stat associated with file
@@ -921,21 +935,13 @@ static int ecryptfs_setattr(struct mnt_idmap *idmap,
 	if (rc)
 		goto out;
 
-	memcpy(&lower_ia, ia, sizeof(lower_ia));
-	if (ia->ia_valid & ATTR_FILE)
-		lower_ia.ia_file = ecryptfs_file_to_lower(ia->ia_file);
+	ecryptfs_iattr_to_lower(&lower_ia, ia);
 	if (ia->ia_valid & ATTR_SIZE) {
 		rc = truncate_upper(dentry, ia, &lower_ia);
 		if (rc < 0)
 			goto out;
 	}
 
-	/*
-	 * mode change is for clearing setuid/setgid bits. Allow lower fs
-	 * to interpret this in its own way.
-	 */
-	if (lower_ia.ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID))
-		lower_ia.ia_valid &= ~ATTR_MODE;
 
 	inode_lock(d_inode(lower_dentry));
 	rc = notify_change(&nop_mnt_idmap, lower_dentry, &lower_ia, NULL);
-- 
2.47.3


