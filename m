Return-Path: <ecryptfs+bounces-83-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B457F90150C
	for <lists+ecryptfs@lfdr.de>; Sun,  9 Jun 2024 10:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58E43281DE5
	for <lists+ecryptfs@lfdr.de>; Sun,  9 Jun 2024 08:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA8145BEF;
	Sun,  9 Jun 2024 08:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="blhbqvv0"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403C63C08A;
	Sun,  9 Jun 2024 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717921688; cv=none; b=s75HsizOVppMaJiOSTUcUWdiwfJpLCAC6GDPaO68d5mzw6FyRts5uEFo61RAPhOoymZRzVtNgcsvHpUFTVDTvFHksprkIWnlSX/CeH0peOCiCbftNfGxcXx17lNvE0S+kDSWjRSKCHB6JcsYzOjP1H7wdeAN2rMMkHwTyTvGBAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717921688; c=relaxed/simple;
	bh=5wI1NTKdDad7dOStebKBSk9uWDGpHBDxRnxOxJWOoVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M7qyrUC+yRWgcvBsZrhQxPwua/1eY6hhcTlpMQHCOsFcOMGYAJ5zDiGaaNXAo7DirrpRNy9OnR93NaITbPHPuqVQoVBcsFrQskI93Wpxv+fQvSjQe9j7dY7EJir2BD681zmw+lYNwp98ct6yVfv9RIfgZ6C71/wYPbUxAUrPSPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=blhbqvv0; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xAStzLZkQB6YwSsZPfAII2SYwdVea64Ufn5+/gSYkrE=;
  b=blhbqvv0Wb9SIDXwLzTi0L0Z9DajeIrlkeJbk5bnT7Gfqs4bFlCpK5XG
   gG5EHbmBIY65EQMWVx5yi27suOz6HhOuM+rSLZm7xMOBpg/jRj91zXwzo
   L3RG1ioMbgf9bBJ6WWuX1uxfa7lBLbNMLWWOWt/7ZfXJMSx2IpI0bWRRr
   w=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,225,1712613600"; 
   d="scan'208";a="169696901"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 10:27:49 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Tyler Hicks <code@tyhicks.com>
Cc: kernel-janitors@vger.kernel.org,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 06/14] eCryptfs: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
Date: Sun,  9 Jun 2024 10:27:18 +0200
Message-Id: <20240609082726.32742-7-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240609082726.32742-1-Julia.Lawall@inria.fr>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since SLOB was removed, it is not necessary to use call_rcu
when the callback only performs kmem_cache_free. Use
kfree_rcu() directly.

The changes were done using the following Coccinelle semantic patch.
This semantic patch is designed to ignore cases where the callback
function is used in another way.

// <smpl>
@r@
expression e;
local idexpression e2;
identifier cb,f;
position p;
@@

(
call_rcu(...,e2)
|
call_rcu(&e->f,cb@p)
)

@r1@
type T;
identifier x,r.cb;
@@

 cb(...) {
(
   kmem_cache_free(...);
|
   T x = ...;
   kmem_cache_free(...,x);
|
   T x;
   x = ...;
   kmem_cache_free(...,x);
)
 }

@s depends on r1@
position p != r.p;
identifier r.cb;
@@

 cb@p

@script:ocaml@
cb << r.cb;
p << s.p;
@@

Printf.eprintf "Other use of %s at %s:%d\n"
   cb (List.hd p).file (List.hd p).line

@depends on r1 && !s@
expression e;
identifier r.cb,f;
position r.p;
@@

- call_rcu(&e->f,cb@p)
+ kfree_rcu(e,f)

@r1a depends on !s@
type T;
identifier x,r.cb;
@@

- cb(...) {
(
-  kmem_cache_free(...);
|
-  T x = ...;
-  kmem_cache_free(...,x);
|
-  T x;
-  x = ...;
-  kmem_cache_free(...,x);
)
- }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

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
 


