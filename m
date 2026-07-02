Return-Path: <ecryptfs+bounces-1235-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IXbiNI33RWq8HAsAu9opvQ
	(envelope-from <ecryptfs+bounces-1235-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 02 Jul 2026 07:30:53 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C56126F3920
	for <lists+ecryptfs@lfdr.de>; Thu, 02 Jul 2026 07:30:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=fWmqqy8j;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1235-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1235-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9688D302974F
	for <lists+ecryptfs@lfdr.de>; Thu,  2 Jul 2026 05:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523BF226CFE;
	Thu,  2 Jul 2026 05:30:51 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D21A267;
	Thu,  2 Jul 2026 05:30:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782970251; cv=none; b=rGVyjiYFEqs5wvOqgr7XC6afXigFETqf0yfs5No/DwrxEph1juWBEnHJXBWNavPLt8KFtS6OmLnxCahfIxzCvzc1hmaa3JS7+S5hS302tZnsdh8tSe04bAeA4yI9ES2683xWNnYUg2jfRJfdyW6mWkqiqjV+nPSn5PE1pQ0pCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782970251; c=relaxed/simple;
	bh=bs8kwZ2Gmyom7uG0xlORn8h5aW2NyD17OJ4iwK45rug=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H6ctyTllW77IBbELFfmMgjE1aLOunizi6Tq4muE+ifW2OvWoSkUon8uIXGpZxO5N7HtFMFdCJizWVZmplLv+J47CeVGHHVZIjPivbShaeiHcxbWrgvshB8x8e4SM9no4lNBRgST8VTgSPPpllbp+qFhnNfClvnmZ/1tiQanHV2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fWmqqy8j; arc=none smtp.client-ip=54.204.34.129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782970208;
	bh=oa4OjCQwmZo7whVMEJXm5iOg9INSScnNRhMPWrQYEPI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=fWmqqy8jupBKAZaVI3XQe3WxW/QMDdiIVdrmzzqtgJ+vpHAxWbFP55yIJ1WFVE/sy
	 FC8Z4aXUtrWRP13oceZiEdGj6DPgFTrmPJRNYdmSEJxT4HcTiv4khipD8VoilnLFfa
	 V7xGTiH6ymAMdisOLqMnuIY8rdlxiI1+1Ozw/M68=
X-QQ-mid: zesmtpgz7t1782970202ta37691aa
X-QQ-Originating-IP: IOVYlfA173KaHchzAQqDxn+Taq+yI4Gp0Bb6x19ECKY=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Jul 2026 13:30:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5247616715261738597
EX-QQ-RecipientCnt: 9
From: Yichong Chen <chenyichong@uniontech.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Yichong Chen <chenyichong@uniontech.com>,
	Michael Halcrow <mhalcrow@us.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: show filename encryption options
Date: Thu,  2 Jul 2026 13:29:58 +0800
Message-Id: <20260702052958.313951-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MAMW4dxoxFytU24cJuiE/gr67WsKcQswT4f6rCZ9ugragPHL9LK+Tudh
	RdUwNmR1eAHlwrO5Na5iNidzFpgVapyci2dqc7RC291I5xmsO+bJBULbtHiPZDJlRiq2caK
	u0BP4VsEgWa1Ddd52sjDOUbqOp8B6Vrn/qCBVgSGpgdRESsA3swOIY/0ex5i4yIesJQ3cKE
	j5Mciyi5zzQvCNn+wCZ4AvJ/ehQEhQ4AwYbWjJ0/DEtotyUxQ+uiEL7vUnx7VfTm2s+m5Mo
	6d6g91IWHKvTUyZrCvPICcbYC5uKGRZgWzVJOj/M6vD4HBxnJuvnL3QXX9xEfpwOG+DM32V
	GRDl9PKO5bSawelAvMxAJOp+pCAJ2NVvAeCRgr9Lsmk7gZJr5tVmDGXzFwA/PlzqBSuU5p6
	byW1wX2b3oj0yxWrZeCc/JPK0mqI5HgrmDKs/8xUdG1Fg6eYkls5KxP2QatfWcGRrnj4M20
	UifxqdeRVYa3e2ORY0uPhursSRKktzXefvROBE1V6VHHVX6gm1hYFIWvQUe8vYry6cPntvo
	ILh3+KReqIkfgPQ69ALO/ec58tKVUS7lFXNqDrl/QLNUpw85wpgEWmS4PW/yhobS9pr4/HR
	fUWdh5asDfJMpC5Pgqt5ZgeQPUQZRyJXCMjAp1JFRmAw0GJ+ZPE6Az8EGvcMO5MJNCf9xE0
	Qf+3CHjz7R9LfpiGA5hiyfZj0slEpvfzG/q57gE6bt1l3dN0oq86qygh5SG0fwLx/J8abQD
	XZeo5Rk0TOlwcCU8BLjDwoc5EByrpbWaIdfvugVuQ/RJrIwoYk6btvUgG5CxAz0jTmNCNW2
	UAjBz2QjSb7OJEITElCnDhfkyYlghmLf4/mitGh2hK8hz2luT7BMuRPVDyK0clyGPVnubD2
	5kOtOEzGB87oGtJbrvT5bJ++9HRwxUi4fb9eU5t/SQntQz+WYh1xHufuWmtq6Tmb2oC7eHV
	9rFj/u04Lki8vrduqogQm7Q09Li8YBKPdUVYJpb48SmdP2sQ+2clnzzYTVBeRC1GC1iv5sD
	kTrjZE15jd5pF8qmdaMJQPKHLudLSeEneUJzQc+2oWs73rgaDh
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
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
	TAGGED_FROM(0.00)[bounces-1235-lists,ecryptfs=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:code@tyhicks.com,m:ardb@kernel.org,m:ebiggers@kernel.org,m:brauner@kernel.org,m:chenyichong@uniontech.com,m:mhalcrow@us.ibm.com,m:akpm@linux-foundation.org,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,uniontech.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C56126F3920

ecryptfs_show_options() prints most user-visible mount options but
omits the filename encryption cipher and key size.

Print ecryptfs_fn_cipher and ecryptfs_fn_key_bytes when filename
encryption is enabled so that the displayed mount options reflect the
active filename encryption settings.

Fixes: 87c94c4df014 ("eCryptfs: Filename Encryption: mount option")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/ecryptfs/super.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ecryptfs/super.c b/fs/ecryptfs/super.c
index 3bc21d677564..686b2b4a9cb5 100644
--- a/fs/ecryptfs/super.c
+++ b/fs/ecryptfs/super.c
@@ -150,6 +150,13 @@ static int ecryptfs_show_options(struct seq_file *m, struct dentry *root)
 	if (mount_crypt_stat->global_default_cipher_key_size)
 		seq_printf(m, ",ecryptfs_key_bytes=%zd",
 			   mount_crypt_stat->global_default_cipher_key_size);
+	if (mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES) {
+		seq_printf(m, ",ecryptfs_fn_cipher=%s",
+			   mount_crypt_stat->global_default_fn_cipher_name);
+		if (mount_crypt_stat->global_default_fn_cipher_key_bytes)
+			seq_printf(m, ",ecryptfs_fn_key_bytes=%zd",
+				   mount_crypt_stat->global_default_fn_cipher_key_bytes);
+	}
 	if (mount_crypt_stat->flags & ECRYPTFS_PLAINTEXT_PASSTHROUGH_ENABLED)
 		seq_printf(m, ",ecryptfs_passthrough");
 	if (mount_crypt_stat->flags & ECRYPTFS_XATTR_METADATA_ENABLED)
-- 
2.51.0


