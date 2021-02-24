Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67FC323B52
	for <lists+ecryptfs@lfdr.de>; Wed, 24 Feb 2021 12:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234871AbhBXLdy (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 24 Feb 2021 06:33:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234327AbhBXLdy (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 24 Feb 2021 06:33:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD93C06174A
        for <ecryptfs@vger.kernel.org>; Wed, 24 Feb 2021 03:33:13 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1lEsPn-0008Fg-Jm; Wed, 24 Feb 2021 12:33:11 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1lEsPn-0002GP-48; Wed, 24 Feb 2021 12:33:11 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     ecryptfs@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] ecryptfs: Fix typo in message
Date:   Wed, 24 Feb 2021 12:30:59 +0100
Message-Id: <20210224113059.28445-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ecryptfs@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

ecryptfs_decrypt_page() issues a warning "Error encrypting extent". This
should be "Error decrypting extent" instead.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ecryptfs/crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index a48116aae02c..0fed4ff02f69 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -535,7 +535,7 @@ int ecryptfs_decrypt_page(struct page *page)
 		rc = crypt_extent(crypt_stat, page, page,
 				  extent_offset, DECRYPT);
 		if (rc) {
-			printk(KERN_ERR "%s: Error encrypting extent; "
+			printk(KERN_ERR "%s: Error decrypting extent; "
 			       "rc = [%d]\n", __func__, rc);
 			goto out;
 		}
-- 
2.29.2

