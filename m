Return-Path: <ecryptfs+bounces-1242-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zkL9FRoZV2qkFQEAu9opvQ
	(envelope-from <ecryptfs+bounces-1242-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 07:22:34 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E78E875AA6E
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 07:22:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=A6gKR5O2;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1242-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1242-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2938330B052F
	for <lists+ecryptfs@lfdr.de>; Wed, 15 Jul 2026 05:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DFD3B5305;
	Wed, 15 Jul 2026 05:21:17 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573D43B52FA;
	Wed, 15 Jul 2026 05:21:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092877; cv=none; b=jtsmwsoZ00KnF9bRS5xFMf4tdHRe42mC24x6CK37fODFyy2QHr+PCXbGDxBJk3za/lIN3nHzbyqiVf6i5fcs/7cE4bA+sCPhQvw8Z6MwCFARptz3r8UP8YoKvqm3Cz+rOKjMUeCdzlX1ymHAdedd+oIIlD/XcFam0qoAuuvmuzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092877; c=relaxed/simple;
	bh=UskOnhAJ3PJfX8vaF7y/hm6wQQhhAkrHP607HMIk2DU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ARRL4C6zIgPF9zvuY7BccIZldFqU1gnEOzBjhA09Kq8Zn7YKdUK9GrWOqr83UT0uKxE9fzM2+etYLAeb256F25ajA7/HPbOznpHIGh4/Xl2IT8fWeu5wRt+7VphHyBSbW2b2CsVcOdeqe7JhGKEbBBjBBmp5c+XNImdLX/LD13s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=A6gKR5O2; arc=none smtp.client-ip=18.132.163.193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1784092834;
	bh=X3rlK1OH4GMTJFOVgoo19DChU6gJsQrW+yP6jj7cu/A=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=A6gKR5O2qT5nHeRzG/h/gj9ydxh7JoOB5rnIu6em87A1O68dODLEsCBbriZAFwzj9
	 k/8YtVw1ddxQmp4OVJ8gDTy8kTxf0crWVGXcx2R9dKk+D4HjinvWJnrlE+IwY/lFAs
	 mkOyL1dp1OFMYMiqVLFfCTPrH3jDUVnNB9L+sPC0=
X-QQ-mid: esmtpsz16t1784092815t67c72903
X-QQ-Originating-IP: F0KctZUHAvhagG6uEuuhs73hGZjgQDOB+EqBDAMm7eo=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Jul 2026 13:20:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16544311245530067291
EX-QQ-RecipientCnt: 9
From: Yichong Chen <chenyichong@uniontech.com>
To: ecryptfs@vger.kernel.org
Cc: Tyler Hicks <code@tyhicks.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH v2 1/3] ecryptfs: pass packet set buffer size to parser
Date: Wed, 15 Jul 2026 13:20:04 +0800
Message-Id: <6ebc85d160ace730618d7998933d3676860480ee.1784081896.git.chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1784081896.git.chenyichong@uniontech.com>
References: <cover.1784081896.git.chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MGdqTfTgRENC/hJBj0t4oTIRZM82xs8Pix97N0aJ9P0tu7/bwfgaj/L0
	Pd5kOfa//4fK67wni1kCf8qlF74aIBuUX0TQ7YndxXjMbsWtmBpSWztyDaSRvMBz54LiElA
	Wz9f0VG+kvtInZvQsIxD27FqR5kNRgO0UKObZo1BcsH0TI2rrII6LmezpvGfdVJtMM2D4GC
	020B4/YzZDiAy11hrKm4Nbq/O4svwL4W6/2SyUxQ1B5f7zucXDItU3hgCA682eEMZaL4Mqc
	833I78mDBDzbgNJsOnbeKCh+qv9gRFMPNE5P52mnRDbrvF3TL04Puw+wu2jH1r9+7fNOC9q
	XPgb5luPNb6BWIMRVEifnEtM5jJ46gDqOB4WiJflwx34/8woTSadk1nZr9mnnXI1JZW3NRr
	xfxSumvHZebgEfOlZvswKzcUvvtUBu6oye6QXXIRHWlxj4kgLIrsNWQTEgsejCCBw7ovjQD
	QTx0Anjqt74jUrsxSK5+ni2bGyj9JbaMp6nXV5qcIUfpUS1UdQZTXLw17cMQVi56xlqCLus
	pG3/A7AQYJlw87yAqfyMdIWXveYCR7/gBgTZTW2zLKi9tSsECLzab3rOXoe6jnUeJ9cnkPD
	/iX78lApZl+5Z/wD0intG+IZKn6DjZfYJLwVYI+UL0RLsI9AA6bx2tYTGp/XP4XErmjj6UN
	TZa4gJmX+TOraO8M8MTb9tc+AyGNcOdTpSbuhXLpSf1LBZsnho34gR9JjZhtOoiLrmMHTMa
	b8K6Y8x4EMwf/Zl++RNhwd5LyDdzwk5jhlEt6k5P1tMilQ9T09fq74Cc1k7QLgMlSk4s//A
	LQFuuo/IvhPrhprblzOtruQ3NOUDuNEO10spvr+/98lTHgudQMq6Kr8uG02A5jaAXphRzCa
	vkVUfjrBfrQsWrRNmOiGtNQ1S8hWcdbGfkYAT1TAytnuXUy8+JB3G9f7KwwnjSdkvkhFtrS
	iS5mtTSFDXR7E3Ga2w+lZO1srp3sScLOck6sRvrqjUpLjaWRcDsqXoGimcBaziU+iHyfTZL
	FJ+3dyJ0/WIed5RfWjJDnxUMu+wZ1NNoPkpG55dvDtdxm2tLwO
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-1242-lists,ecryptfs=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ecryptfs@vger.kernel.org,m:code@tyhicks.com,m:thorsten.blum@linux.dev,m:brauner@kernel.org,m:ebiggers@kernel.org,m:kees@kernel.org,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:chenyichong@uniontech.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[chenyichong@uniontech.com,ecryptfs@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenyichong@uniontech.com,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,uniontech.com:from_mime,uniontech.com:mid,uniontech.com:email,uniontech.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E78E875AA6E

ecryptfs_parse_packet_set() receives a pointer into the file header, but
it calculates the remaining packet buffer size from PAGE_SIZE - 8.  For
version 1 headers the packet set starts later in the header, so this can
overstate the available buffer.

Pass the actual packet set buffer length from the caller and calculate
per-packet limits from the remaining bytes in that buffer.  Recompute the
remaining length after consuming a tag 3 packet before parsing the
following tag 11 packet.

Fixes: 237fead61998 ("[PATCH] ecryptfs: fs/Makefile and fs/Kconfig")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/ecryptfs/crypto.c          |  2 +-
 fs/ecryptfs/ecryptfs_kernel.h |  3 ++-
 fs/ecryptfs/keystore.c        | 23 ++++++++++++++++++++---
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 74b02b5..e67119b 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1197,7 +1197,7 @@ static int ecryptfs_read_headers_virt(char *page_virt,
 	} else
 		set_default_header_data(crypt_stat);
 	rc = ecryptfs_parse_packet_set(crypt_stat, (page_virt + offset),
-				       ecryptfs_dentry);
+				       PAGE_SIZE - offset, ecryptfs_dentry);
 out:
 	return rc;
 }
diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index f4f56a9..7d2488a 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -580,7 +580,8 @@ int ecryptfs_generate_key_packet_set(char *dest_base,
 				     size_t *len, size_t max);
 int
 ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
-			  unsigned char *src, struct dentry *ecryptfs_dentry);
+			  unsigned char *src, size_t src_size,
+			  struct dentry *ecryptfs_dentry);
 int ecryptfs_truncate(struct dentry *dentry, loff_t new_length);
 ssize_t
 ecryptfs_getxattr_lower(struct dentry *lower_dentry, struct inode *lower_inode,
diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index ebebc95..90c2b80 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -1704,6 +1704,7 @@ out:
  * ecryptfs_parse_packet_set
  * @crypt_stat: The cryptographic context
  * @src: Virtual address of region of memory containing the packets
+ * @src_size: Size of the packet set buffer
  * @ecryptfs_dentry: The eCryptfs dentry associated with the packet set
  *
  * Get crypt_stat to have the file's session key if the requisite key
@@ -1714,7 +1715,7 @@ out:
  * conditions.
  */
 int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
-			      unsigned char *src,
+			      unsigned char *src, size_t src_size,
 			      struct dentry *ecryptfs_dentry)
 {
 	size_t i = 0;
@@ -1736,7 +1737,11 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
 	 * added the our &auth_tok_list */
 	next_packet_is_auth_tok_packet = 1;
 	while (next_packet_is_auth_tok_packet) {
-		size_t max_packet_size = ((PAGE_SIZE - 8) - i);
+		size_t max_packet_size;
+
+		if (i >= src_size)
+			break;
+		max_packet_size = src_size - i;
 
 		switch (src[i]) {
 		case ECRYPTFS_TAG_3_PACKET_TYPE:
@@ -1751,12 +1756,16 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
 				goto out_wipe_list;
 			}
 			i += packet_size;
+			if (i > src_size) {
+				rc = -EIO;
+				goto out_wipe_list;
+			}
 			rc = parse_tag_11_packet((unsigned char *)&src[i],
 						 sig_tmp_space,
 						 ECRYPTFS_SIG_SIZE,
 						 &tag_11_contents_size,
 						 &tag_11_packet_size,
-						 max_packet_size);
+						 src_size - i);
 			if (rc) {
 				ecryptfs_printk(KERN_ERR, "No valid "
 						"(ecryptfs-specific) literal "
@@ -1768,6 +1777,10 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
 				goto out_wipe_list;
 			}
 			i += tag_11_packet_size;
+			if (i > src_size) {
+				rc = -EIO;
+				goto out_wipe_list;
+			}
 			if (ECRYPTFS_SIG_SIZE != tag_11_contents_size) {
 				ecryptfs_printk(KERN_ERR, "Expected "
 						"signature of size [%d]; "
@@ -1793,6 +1806,10 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
 				goto out_wipe_list;
 			}
 			i += packet_size;
+			if (i > src_size) {
+				rc = -EIO;
+				goto out_wipe_list;
+			}
 			crypt_stat->flags |= ECRYPTFS_ENCRYPTED;
 			break;
 		case ECRYPTFS_TAG_11_PACKET_TYPE:
-- 
2.51.0


