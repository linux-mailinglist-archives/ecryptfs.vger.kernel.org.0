Return-Path: <ecryptfs+bounces-157-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A687399BB7F
	for <lists+ecryptfs@lfdr.de>; Sun, 13 Oct 2024 22:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DFD21F217F2
	for <lists+ecryptfs@lfdr.de>; Sun, 13 Oct 2024 20:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77B7196D80;
	Sun, 13 Oct 2024 20:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="kBhJiAsJ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88344158531;
	Sun, 13 Oct 2024 20:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728850697; cv=none; b=k9huYunrH/rByZ+sm3Jpwc6PmnxIjh6ec7F/cfkjHsJxKxhSHyGGXPwld+O4Gvd+ZpHDNMCPy8fpqgG9bxv+JMJHg91/NhugRbqQSGvMywo6MctfPJyaqNBHJXPdbLILnxxAi2PgfLx2/8CtU5w91nf9rZI3YucJaWr2dJ4c8UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728850697; c=relaxed/simple;
	bh=S7pHQi8X4RZymqCk8YJqv27rty/iMunvKNGwHN3L2Mk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HhW+JcU72ux1DPZnf/daKuNPV+gVTm3LaaJtHf9R7lxL8QYE60/tjZ75INbT3gsVTrZPe0Kl9gtR8dISic9Ti2L2xjC01oehGd3yrshrzs09bEIP0V3Eov1Itd3y4aP3utBuXjq2YddL4hC7+5BJtUEQZEM9lnMd6C6L1Rc2eeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=kBhJiAsJ; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ivq+yKVATTsAlI4yKIH4VcgPKbBNdKJviYwzBHfTnik=;
  b=kBhJiAsJw3Dq2dT5NHZUa54RmSa+vEUz4UEbjD2YV2bpjjNC2GlPAjCt
   7oFcmZvoasAo+k1dZdicu8PVYUNE8rSE5vNyLX98XNMoDsThkZhU/9+sd
   waq8kvTgcUwlWFsPPQSaYuWpGppAk3MPeUIWw2RV2i79MkYcPOCN7UWJT
   A=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,201,1725314400"; 
   d="scan'208";a="98968282"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 22:17:59 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Tyler Hicks <code@tyhicks.com>
Cc: kernel-janitors@vger.kernel.org,
	vbabka@suse.cz,
	paulmck@kernel.org,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/17] eCryptfs: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
Date: Sun, 13 Oct 2024 22:16:54 +0200
Message-Id: <20241013201704.49576-8-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241013201704.49576-1-Julia.Lawall@inria.fr>
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since SLOB was removed and since
commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
it is not necessary to use call_rcu when the callback only performs
kmem_cache_free. Use kfree_rcu() directly.

The changes were made using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 fs/ecryptfs/dentry.c |    8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/ecryptfs/dentry.c b/fs/ecryptfs/dentry.c
index acaa0825e9bb..49d626ff33a9 100644
--- a/fs/ecryptfs/dentry.c
+++ b/fs/ecryptfs/dentry.c
@@ -51,12 +51,6 @@ static int ecryptfs_d_revalidate(struct dentry *dentry, unsigned int flags)
 
 struct kmem_cache *ecryptfs_dentry_info_cache;
 
-static void ecryptfs_dentry_free_rcu(struct rcu_head *head)
-{
-	kmem_cache_free(ecryptfs_dentry_info_cache,
-		container_of(head, struct ecryptfs_dentry_info, rcu));
-}
-
 /**
  * ecryptfs_d_release
  * @dentry: The ecryptfs dentry
@@ -68,7 +62,7 @@ static void ecryptfs_d_release(struct dentry *dentry)
 	struct ecryptfs_dentry_info *p = dentry->d_fsdata;
 	if (p) {
 		path_put(&p->lower_path);
-		call_rcu(&p->rcu, ecryptfs_dentry_free_rcu);
+		kfree_rcu(p, rcu);
 	}
 }
 


