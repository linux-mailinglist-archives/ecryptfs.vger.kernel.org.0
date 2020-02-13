Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88D6A15CD36
	for <lists+ecryptfs@lfdr.de>; Thu, 13 Feb 2020 22:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgBMV1A (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Thu, 13 Feb 2020 16:27:00 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41541 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727609AbgBMV1A (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Thu, 13 Feb 2020 16:27:00 -0500
Received: by mail-ot1-f65.google.com with SMTP id r27so7060028otc.8
        for <ecryptfs@vger.kernel.org>; Thu, 13 Feb 2020 13:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=C4mIuZvGxmm1V9PfHkr1U+gHxM7XogAd6pv4znsfUCc=;
        b=pajRtELum5U8NO1TcBQaQ0ycGxjRFr0OtN3WiSHVmNn8xvOG0ypNpp+Mc8Zq5+5Xjc
         zWAcNDM7MKfMCR+YLWBiEh118VeqGJcxbEEBoDiPLB59PlsrxGIwPkolt2dorgeoJSaQ
         qMhtB/jiFh0doEzLfYpOdn+Ck1JGEO9NVG7wJB42jBRWdHailOT2e8+xGOsrrtPXVMUz
         87bdc17PT1co1zKGCJeq1PzY6lYTHrdzzhgAEJIRP82wqwAT37hpH0gysg9UTaC/Kyyv
         u3OAWrhTviLBN3YNSYpjWGPvOLcyYcsajp8tuTB3pfffGJDr38BaFArngRpKSeT0jEEL
         My3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=C4mIuZvGxmm1V9PfHkr1U+gHxM7XogAd6pv4znsfUCc=;
        b=b7h68RwFMcUx+7p3D2vxrvzkYLsI7LEep/8HMZclLGAf7O10aj1cOHh2zEvNNLvnew
         fIbKH8sff9X36h2ygtHDnAFTW43Vp6bZV8jQDMwe1Dg04PjIfmfsHoK9uP/xH4lZ2beL
         nCbeqX0IkVRKteiE5avh3TePHGdHP/TFw5g5vhedm46prudHmDRjBAr3dFi73XduS11O
         O0oaY2cAj6lQ4sFxi4rSHRvjEAC5YJqgdoihbYSEh4mhVZoOWoQL6Cb9Vx54zoSceNdB
         Iu5E6r6Jj3fJSJSj9lwCcOGIdWnTteoLqOK8KJhl7izTgZ0CZElfQDW1CCywx00wXG2U
         wazQ==
X-Gm-Message-State: APjAAAUVCu3aNQOxnVQcTexgO8+1sUGM15uiEU3sBxzejBcvgC/sxIqu
        vdns62C/2N4Tf1vELzvpo3iEukb3tSVGNw==
X-Google-Smtp-Source: APXvYqywvSEAyHUGBaroBYEJFn9FmnSv3UgoOPHt/LCygg/Fp1WJcnb5l1EAiY+e29OVzqvM18ASnw==
X-Received: by 2002:a9d:7498:: with SMTP id t24mr15312497otk.290.1581629218200;
        Thu, 13 Feb 2020 13:26:58 -0800 (PST)
Received: from sec.work.tihix.com (162-237-133-238.lightspeed.rcsntx.sbcglobal.net. [162.237.133.238])
        by smtp.gmail.com with ESMTPSA id q6sm1206151otn.73.2020.02.13.13.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 13:26:57 -0800 (PST)
From:   Tyler Hicks <code@tyhicks.com>
To:     ecryptfs@vger.kernel.org
Subject: [PATCH] eCryptfs: Replace deactivated email address
Date:   Thu, 13 Feb 2020 21:26:48 +0000
Message-Id: <20200213212648.20244-1-code@tyhicks.com>
X-Mailer: git-send-email 2.17.1
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Replace a recently deactived email address with one that I'll be able to
personally control and keep alive.

Signed-off-by: Tyler Hicks <code@tyhicks.com>
---
 fs/ecryptfs/ecryptfs_kernel.h | 2 +-
 fs/ecryptfs/main.c            | 2 +-
 fs/ecryptfs/messaging.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 1c1a56be7ea2..e6ac78c62ca4 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -8,7 +8,7 @@
  * Copyright (C) 2004-2008 International Business Machines Corp.
  *   Author(s): Michael A. Halcrow <mahalcro@us.ibm.com>
  *              Trevor S. Highland <trevor.highland@gmail.com>
- *              Tyler Hicks <tyhicks@ou.edu>
+ *              Tyler Hicks <code@tyhicks.com>
  */
 
 #ifndef ECRYPTFS_KERNEL_H
diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index b8a7ce379ffe..e63259fdef28 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -7,7 +7,7 @@
  * Copyright (C) 2004-2007 International Business Machines Corp.
  *   Author(s): Michael A. Halcrow <mahalcro@us.ibm.com>
  *              Michael C. Thompson <mcthomps@us.ibm.com>
- *              Tyler Hicks <tyhicks@ou.edu>
+ *              Tyler Hicks <code@tyhicks.com>
  */
 
 #include <linux/dcache.h>
diff --git a/fs/ecryptfs/messaging.c b/fs/ecryptfs/messaging.c
index d668e60b85b5..be3c318ba5f0 100644
--- a/fs/ecryptfs/messaging.c
+++ b/fs/ecryptfs/messaging.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2004-2008 International Business Machines Corp.
  *   Author(s): Michael A. Halcrow <mhalcrow@us.ibm.com>
- *		Tyler Hicks <tyhicks@ou.edu>
+ *		Tyler Hicks <code@tyhicks.com>
  */
 #include <linux/sched.h>
 #include <linux/slab.h>
-- 
2.17.1

