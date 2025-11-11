Return-Path: <ecryptfs+bounces-664-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0CDC4DA01
	for <lists+ecryptfs@lfdr.de>; Tue, 11 Nov 2025 13:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCD684E3CC3
	for <lists+ecryptfs@lfdr.de>; Tue, 11 Nov 2025 12:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1062FF673;
	Tue, 11 Nov 2025 12:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JmVDgK4U"
X-Original-To: ecryptfs@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1309C351FAC;
	Tue, 11 Nov 2025 12:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762863223; cv=none; b=HzRRbVEKAKEwNvZff6NmzIyrcOn4ei025GuC96a8bxAJhZwG+KiRQ0A4yx/2rWP6bAXdqSLtoynhyu1EqxwoBwDff/2Nt4LlWIsdeSuKnDg8H3QRjROnquYMkdna4evz2s1i3jsQfQSEtGVxl9KZeuUaxV0hyhJIkDp8L6PDMYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762863223; c=relaxed/simple;
	bh=coxUQViBR1RqRY+TnZ78OftXlHg4KH/M8tbofuBt2zE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jEWvLZ5SnD1Gzuiw5Mizox2Tvnl975MsR/QEgFQZW2VifDaY32qD8TvRK7bESKwMRhhIzFpNJczq4nVWs0wy41NCKwlGOa5AzfQtbi0MAh1pfNguzy9T3oSURXRY+N37smbwpP3y1NUFPcbF8CD98P8foPeyyVQchzqblew8J9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JmVDgK4U; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9N
	Ah2B4J4geH0u3icDbPabpPyQvP6uL+iQxTBKXZpv4=; b=JmVDgK4UAGTtA+iaXZ
	dqSxtWPmbOIiL00Dl15LPthzogT8KuZcjK8BPzt9EckP56W9ZQ+YOjqhGGsRef4D
	nc6JN5jFItE3JfUG7yNOPeyVqD3B/jlyPDdT23uLPohC83jeFArjIejnso8PFtZt
	GD9HVxlQCsUWyyUi8eab9CdrA=
Received: from liubaolin-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3v5FmKBNpEkgaDQ--.3180S2;
	Tue, 11 Nov 2025 20:13:27 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: code@tyhicks.com
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1] ecryptfs: simplify list initialization in ecryptfs_parse_packet_set()
Date: Tue, 11 Nov 2025 20:13:25 +0800
Message-Id: <20251111121325.28975-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v5FmKBNpEkgaDQ--.3180S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtryrCry5CryDJr48KFWDXFb_yoW8JF45pw
	sxCrs3tw1rtrs8KFWUCF4kGay5X3yUZrWfJayftw4ayan3tryYyr4akFWUu3WUCFW5Jw1U
	Kr4ktw18KF92krJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ua38OUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwghDDmkTKGh4VwAA3S

From: Baolin Liu <liubaolin@kylinos.cn>

In ecryptfs_parse_packet_set(),use LIST_HEAD() to declare and
initialize the 'auth_tok_list' list in one step instead of
using INIT_LIST_HEAD() separately.

No functional change.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ecryptfs/keystore.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 7f9f68c00ef6..ea00ba20a459 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -1759,7 +1759,7 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
 	size_t i = 0;
 	size_t found_auth_tok;
 	size_t next_packet_is_auth_tok_packet;
-	struct list_head auth_tok_list;
+	LIST_HEAD(auth_tok_list);
 	struct ecryptfs_auth_tok *matching_auth_tok;
 	struct ecryptfs_auth_tok *candidate_auth_tok;
 	char *candidate_auth_tok_sig;
@@ -1772,7 +1772,6 @@ int ecryptfs_parse_packet_set(struct ecryptfs_crypt_stat *crypt_stat,
 	struct key *auth_tok_key = NULL;
 	int rc = 0;
 
-	INIT_LIST_HEAD(&auth_tok_list);
 	/* Parse the header to find as many packets as we can; these will be
 	 * added the our &auth_tok_list */
 	next_packet_is_auth_tok_packet = 1;
-- 
2.39.2


