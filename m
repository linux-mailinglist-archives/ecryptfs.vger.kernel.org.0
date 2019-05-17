Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31B162172D
	for <lists+ecryptfs@lfdr.de>; Fri, 17 May 2019 12:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbfEQKpS (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 17 May 2019 06:45:18 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35507 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728390AbfEQKpS (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 17 May 2019 06:45:18 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sha@pengutronix.de>)
        id 1hRaMX-0004R0-63; Fri, 17 May 2019 12:45:17 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1hRaMW-0002i5-Oc; Fri, 17 May 2019 12:45:16 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     ecryptfs@vger.kernel.org
Cc:     Tyler Hicks <tyhicks@canonical.com>, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] ecryptfs: use print_hex_dump_bytes for hexdump
Date:   Fri, 17 May 2019 12:45:15 +0200
Message-Id: <20190517104515.10371-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ecryptfs@vger.kernel.org
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

The Kernel has nice hexdump facilities, use them rather a homebrew
hexdump function.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ecryptfs/debug.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/fs/ecryptfs/debug.c b/fs/ecryptfs/debug.c
index 3d2bdf546ec6..ee9d8ac4a809 100644
--- a/fs/ecryptfs/debug.c
+++ b/fs/ecryptfs/debug.c
@@ -97,25 +97,9 @@ void ecryptfs_dump_auth_tok(struct ecryptfs_auth_tok *auth_tok)
  */
 void ecryptfs_dump_hex(char *data, int bytes)
 {
-	int i = 0;
-	int add_newline = 1;
-
 	if (ecryptfs_verbosity < 1)
 		return;
-	if (bytes != 0) {
-		printk(KERN_DEBUG "0x%.2x.", (unsigned char)data[i]);
-		i++;
-	}
-	while (i < bytes) {
-		printk("0x%.2x.", (unsigned char)data[i]);
-		i++;
-		if (i % 16 == 0) {
-			printk("\n");
-			add_newline = 0;
-		} else
-			add_newline = 1;
-	}
-	if (add_newline)
-		printk("\n");
-}
 
+	print_hex_dump(KERN_DEBUG, "ecryptfs: ", DUMP_PREFIX_OFFSET, 16, 1,
+		       data, bytes, false);
+}
-- 
2.20.1

