Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D3734EE4B
	for <lists+ecryptfs@lfdr.de>; Tue, 30 Mar 2021 18:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbhC3QqX (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 30 Mar 2021 12:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbhC3Qp3 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 30 Mar 2021 12:45:29 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84288C061762
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:29 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id o16so16947119wrn.0
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t6GmnG64GsPwytaU0/N3AmdS5iAMF6uRwq0ZgidJKkg=;
        b=hncoozz8Ov+xPXswjLab58DQgL44hWqRFd8Cxp7RovW9ZIWCVIZ32wEVd1VSBGkpQM
         CVx8AQB+5uZBYDlefcB2bpgCWmafdRcl/MWjgO4kwrs0mdhEoO201hM1p7pz7lwQiyXo
         UsBxSwzMY2dE6Yal/adv3ZwXDcRrPnXRJN0ka0H/XaD2Zkd6kbiHUA6HjByOskhnx4lS
         qH8cHns7ijwasZbS18pqr/einjjXCAahUjpk/K9kGtxbWOScecYwPiteBQWka8wTWWYO
         vEBtx3eSmnKNhfFjd/2s4wYgrtPQrmk174B2+UeEzj2rEbNpcozHVH7vCHkMt6HSKlW0
         r5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t6GmnG64GsPwytaU0/N3AmdS5iAMF6uRwq0ZgidJKkg=;
        b=RSqpReeEzQCjDCEWS+kys4b/QOKkVB+NnTut4atYl/AN+v1daQYGcJDERI1cBKWG8q
         WeqX88RNTrvavZQBzOMuQ2D43SbvYFaYPBZSoOME+OdI9fxvSaPchuI/w5iiHo3KIhrG
         FPToOA38lwno0/BEo8V9KrgFCSLmhZUXLyQyQsHblgXJjnRmlrdNly7v/NF1ZqmjMHy5
         LBzRio428ofZN2Vn+q0Sgmwc9uby91f5x9FsLtsEn33QhdxZFD9OokDYLLNNjvD/nTCM
         rk42OyEk7Sbvin0gkqHxTChWB1+dq1myBv/3BLPK9BNg+HHG/hmcUmon6dHMV3RPnCRd
         eCYw==
X-Gm-Message-State: AOAM530MmH5vvh3/4Wgc+uBXD1KN4ONUUu5nqAR9AzZaur+4BEz8kcBS
        wXTF3sW+6MvC4xff+LZOPVUOJw==
X-Google-Smtp-Source: ABdhPJxvX4J7ei59WCWAiyO9w0JEXfQyawlW7o9MuLyONtBmKaqCEa+8t+nZY9X7UuO14Bfy0Vd0LQ==
X-Received: by 2002:a5d:5641:: with SMTP id j1mr35256417wrw.100.1617122728287;
        Tue, 30 Mar 2021 09:45:28 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
        by smtp.gmail.com with ESMTPSA id a15sm25660805wrr.53.2021.03.30.09.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 09:45:27 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
        "Michael A. Halcrow" <mhalcrow@us.ibm.com>,
        ecryptfs@vger.kernel.org
Subject: [PATCH 27/31] fs: ecryptfs: miscdev: File headers are not good kernel-doc candidates
Date:   Tue, 30 Mar 2021 17:44:54 +0100
Message-Id: <20210330164458.1625478-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210330164458.1625478-1-lee.jones@linaro.org>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Supply description for the 'daemon' param too.

Fixes the following W=1 kernel build warning(s):

 fs/ecryptfs/miscdev.c:19: warning: cannot understand function prototype: 'atomic_t ecryptfs_num_miscdev_opens; '
 fs/ecryptfs/miscdev.c:323: warning: Function parameter or member 'daemon' not described in 'ecryptfs_miscdev_response'

Cc: Tyler Hicks <code@tyhicks.com>
Cc: "Michael A. Halcrow" <mhalcrow@us.ibm.com>
Cc: ecryptfs@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/ecryptfs/miscdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ecryptfs/miscdev.c b/fs/ecryptfs/miscdev.c
index 742ece22c1d43..4e62c3cef70fb 100644
--- a/fs/ecryptfs/miscdev.c
+++ b/fs/ecryptfs/miscdev.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 2008 International Business Machines Corp.
@@ -312,6 +312,7 @@ ecryptfs_miscdev_read(struct file *file, char __user *buf, size_t count,
 
 /**
  * ecryptfs_miscdev_response - miscdevess response to message previously sent to daemon
+ * @daemon: eCryptfs daemon object
  * @data: Bytes comprising struct ecryptfs_message
  * @data_size: sizeof(struct ecryptfs_message) + data len
  * @seq: Sequence number for miscdev response packet
-- 
2.27.0

