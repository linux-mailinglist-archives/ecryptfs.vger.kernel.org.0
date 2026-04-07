Return-Path: <ecryptfs+bounces-1196-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGaCDsoO1WlQzwcAu9opvQ
	(envelope-from <ecryptfs+bounces-1196-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:03:54 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2A23AFA4F
	for <lists+ecryptfs@lfdr.de>; Tue, 07 Apr 2026 16:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A325E301DA6B
	for <lists+ecryptfs@lfdr.de>; Tue,  7 Apr 2026 14:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9673B6BF5;
	Tue,  7 Apr 2026 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ThxFrEmq"
X-Original-To: ecryptfs@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5E3B7B9E;
	Tue,  7 Apr 2026 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570619; cv=none; b=n8XuDHBEi5loeKnKJ0SMvM3uY6rDVNgbE99SxyqHcWxWCVPxjbeBKdXDMqKIM9y+TnN/EAXL9gBknIgfkEo/V3AvDGEWVh2Ni6Dy2E9fDqItMjmhUzZt26COv5l/c5Ijy6vLQPlG6B5i0LqGeUhCsSX/bqAE7/rfZi1tz03ALpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570619; c=relaxed/simple;
	bh=uVX0D2uA3p4120da3ZNuPlMQ9v/BQ8tMNqPrSIQrSXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rxb1/AKwdgl4XQZTPC/pyNDkuhZH+UsZkY9OfFPbcV7OGSTWLluvgiv6wGUhG3AKfJAYc/cO4Vvfr08c1/hgtqLm4jmtyTFL9gD4oHlOLLaWL4z9i+LH4+OBaR0Em2sl0Srxxwfc0B3pH5Y1RcM5TXC4jwyw9mUmgwVelMnc3vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ThxFrEmq; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=xwWOkYqF1hFBXtGC01N/akNP+QF+1u4boHKNbYk2Smw=; b=ThxFrEmqJMzFI/ulPfoWNWg4DH
	6IGq5XuCOzkodkIalmCrEsqTg/dhAdQv/QDym/X3bJB9E2/pVmgjoXsr5BQTMC3jRnkcUV4IXSqRH
	5581MdNAZcxiHiX9M3jfrwufXxYUtjxWQui7EHxbV5H8Gwa4WqXm7FKonj3TWXJqRz+z11dXHGR1I
	ZndEP+MeS5MPjn6ePD3ejM71VGvyNxZL3LFt39jFhJ0Qsssjuefiswk/zHnRW7U0FdVNOT2geN6/1
	OgLtS0qxhbZknH4ux8QXCopyEmGEr1ziQdh1ow/oiJB8cPGnireW4OnYPAK1nCpuEedLLeMOF4B/G
	WOTKF3Kw==;
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA71k-00000006Yn3-1isI;
	Tue, 07 Apr 2026 14:03:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 1/7] ecryptfs: streamline truncate_upper
Date: Tue,  7 Apr 2026 16:02:37 +0200
Message-ID: <20260407140329.633186-2-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1196-lists,ecryptfs=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim]
X-Rspamd-Queue-Id: BD2A23AFA4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a few strategic gotos to keep reduce indentation and keep the
main reduce size flow outside of branches.  Switch all touched comments
to normal kernel style and avoid breaks in printed strings for all
the code touched.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ecryptfs/inode.c | 115 +++++++++++++++++++++++---------------------
 1 file changed, 60 insertions(+), 55 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 8ab014db3e03..69a5dfaddc5c 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -725,83 +725,88 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
 static int truncate_upper(struct dentry *dentry, struct iattr *ia,
 			  struct iattr *lower_ia)
 {
-	int rc = 0;
 	struct inode *inode = d_inode(dentry);
 	struct ecryptfs_crypt_stat *crypt_stat;
 	loff_t i_size = i_size_read(inode);
 	loff_t lower_size_before_truncate;
 	loff_t lower_size_after_truncate;
+	size_t num_zeros;
+	int rc;
 
 	if (unlikely((ia->ia_size == i_size))) {
 		lower_ia->ia_valid &= ~ATTR_SIZE;
 		return 0;
 	}
+
 	rc = ecryptfs_get_lower_file(dentry, inode);
 	if (rc)
 		return rc;
-	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
-	/* Switch on growing or shrinking file */
+
 	if (ia->ia_size > i_size) {
 		char zero[] = { 0x00 };
 
+		/*
+		 * Write a single 0 at the last position of the file; this
+		 * triggers code that will fill in 0's throughout the
+		 * intermediate portion of the previous end of the file and the
+		 * new end of the file.
+		 */
+		rc = ecryptfs_write(inode, zero, ia->ia_size - 1, 1);
 		lower_ia->ia_valid &= ~ATTR_SIZE;
-		/* Write a single 0 at the last position of the file;
-		 * this triggers code that will fill in 0's throughout
-		 * the intermediate portion of the previous end of the
-		 * file and the new and of the file */
-		rc = ecryptfs_write(inode, zero,
-				    (ia->ia_size - 1), 1);
-	} else { /* ia->ia_size < i_size_read(inode) */
-		/* We're chopping off all the pages down to the page
-		 * in which ia->ia_size is located. Fill in the end of
-		 * that page from (ia->ia_size & ~PAGE_MASK) to
-		 * PAGE_SIZE with zeros. */
-		size_t num_zeros = (PAGE_SIZE
-				    - (ia->ia_size & ~PAGE_MASK));
-
-		if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
-			truncate_setsize(inode, ia->ia_size);
-			lower_ia->ia_size = ia->ia_size;
-			lower_ia->ia_valid |= ATTR_SIZE;
-			goto out;
-		}
-		if (num_zeros) {
-			char *zeros_virt;
+		goto out;
+	}
 
-			zeros_virt = kzalloc(num_zeros, GFP_KERNEL);
-			if (!zeros_virt) {
-				rc = -ENOMEM;
-				goto out;
-			}
-			rc = ecryptfs_write(inode, zeros_virt,
-					    ia->ia_size, num_zeros);
-			kfree(zeros_virt);
-			if (rc) {
-				printk(KERN_ERR "Error attempting to zero out "
-				       "the remainder of the end page on "
-				       "reducing truncate; rc = [%d]\n", rc);
-				goto out;
-			}
-		}
+	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
+	if (!(crypt_stat->flags & ECRYPTFS_ENCRYPTED)) {
 		truncate_setsize(inode, ia->ia_size);
-		rc = ecryptfs_write_inode_size_to_metadata(inode);
+		lower_ia->ia_size = ia->ia_size;
+		lower_ia->ia_valid |= ATTR_SIZE;
+		goto out;
+	}
+
+	/*
+	 * We're chopping off all the pages down to the page in which
+	 * ia->ia_size is located. Fill in the end of that page from
+	 * (ia->ia_size & ~PAGE_MASK) to PAGE_SIZE with zeros.
+	 */
+	num_zeros = PAGE_SIZE - (ia->ia_size & ~PAGE_MASK);
+	if (num_zeros) {
+		char *zeros_virt;
+
+		zeros_virt = kzalloc(num_zeros, GFP_KERNEL);
+		if (!zeros_virt) {
+			rc = -ENOMEM;
+			goto out;
+		}
+		rc = ecryptfs_write(inode, zeros_virt, ia->ia_size, num_zeros);
+		kfree(zeros_virt);
 		if (rc) {
-			printk(KERN_ERR	"Problem with "
-			       "ecryptfs_write_inode_size_to_metadata; "
-			       "rc = [%d]\n", rc);
+			pr_err("Error attempting to zero out the remainder of the end page on reducing truncate; rc = [%d]\n",
+				rc);
 			goto out;
 		}
-		/* We are reducing the size of the ecryptfs file, and need to
-		 * know if we need to reduce the size of the lower file. */
-		lower_size_before_truncate =
-		    upper_size_to_lower_size(crypt_stat, i_size);
-		lower_size_after_truncate =
-		    upper_size_to_lower_size(crypt_stat, ia->ia_size);
-		if (lower_size_after_truncate < lower_size_before_truncate) {
-			lower_ia->ia_size = lower_size_after_truncate;
-			lower_ia->ia_valid |= ATTR_SIZE;
-		} else
-			lower_ia->ia_valid &= ~ATTR_SIZE;
+	}
+	truncate_setsize(inode, ia->ia_size);
+	rc = ecryptfs_write_inode_size_to_metadata(inode);
+	if (rc) {
+		pr_err("Problem with ecryptfs_write_inode_size_to_metadata; rc = [%d]\n",
+			rc);
+		goto out;
+	}
+
+	/*
+	 * We are reducing the size of the ecryptfs file, and need to know if we
+	 * need to reduce the size of the lower file.
+	 */
+	lower_size_before_truncate =
+		upper_size_to_lower_size(crypt_stat, i_size);
+	lower_size_after_truncate =
+		upper_size_to_lower_size(crypt_stat, ia->ia_size);
+	if (lower_size_after_truncate < lower_size_before_truncate) {
+		lower_ia->ia_size = lower_size_after_truncate;
+		lower_ia->ia_valid |= ATTR_SIZE;
+	} else {
+		lower_ia->ia_valid &= ~ATTR_SIZE;
 	}
 out:
 	ecryptfs_put_lower_file(inode);
-- 
2.47.3


