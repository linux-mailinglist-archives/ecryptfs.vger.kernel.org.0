Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772FF34EE48
	for <lists+ecryptfs@lfdr.de>; Tue, 30 Mar 2021 18:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbhC3QqS (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 30 Mar 2021 12:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232505AbhC3Qp2 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 30 Mar 2021 12:45:28 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DF1C061762
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:27 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id c8so16872464wrq.11
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Hq9pyShwqk3aVu8T4UMcQUMVd+iCa+2JYczX4QC4e0=;
        b=HpLrvgthcz399Wo2MCuhSfHNFz7BzM0kk80Jgu14MSml3x044yxa6uBLdruT43zW9A
         arFt7UVkbnWM5mEBuWj6gF/PvEn63aD4IF4fboenFYiEsmV0s4/7bz26qeAKU4LLe+cd
         67u2fVGeFMk20YSqAl52U5BuLr5CG049ZUEJzfSqrcySiom6AT7DkpY6Tg/iCv5Sm0x5
         5cgN0SyFK/zeknSwtFK44wLz4z1GvmEuf0wk3Kd2npKTNmlRW/rdmA0/nyKRS38JdyyY
         Ai0oZIhkgofdNMH1YaeOIbRRQdjQqcPAzIg3m+74acIYigW0aYk5GtfpBqdz0WqVHzVR
         j6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Hq9pyShwqk3aVu8T4UMcQUMVd+iCa+2JYczX4QC4e0=;
        b=FjEBaDK1zKKOrIj/dDXzS2zvSJDQJNmWJIG3ZWk/NENW2FcShNryo0K9/W7Oxp2U/h
         /t/cSGtk5LlyJjDjokHRMsncPAFsBEw5Fq87155oSW4aKyjhcoOdgBN5FCD4O4pszzaN
         r+bsyex7A2DlSH6aapz801qLuxk8w+TNC8dyxxxogMIFPEsFXyNaCPTJS4qiy3kTkMw1
         C36lj1IMBMS4/iZjC4FiD7xyr4KFFKV73Q3qTPD4Pi5IwDPwx/NKggR6yW6+uJFMCOu0
         y7sI5g2ysrXyBM5IeUY84WuIdZQuIwkllcth8Oy+Rg9dgNE7h6lP2lPIC3AiDrWABdDw
         XCCA==
X-Gm-Message-State: AOAM532xNPmvvmQgzwHi2kgBeqfLB5ee13aoqGtz8kwbXmiSH5z1g5xT
        AtCHkWgz/qgb0SWsbOPU77bzmQ==
X-Google-Smtp-Source: ABdhPJzpPeRwgzFeqGfKoardYK8CWO2XpYQ38weBk2G89qmtOYKUC0TNWpuBM95b5xR/4Tp6Y+OOiQ==
X-Received: by 2002:adf:f704:: with SMTP id r4mr34726452wrp.158.1617122726361;
        Tue, 30 Mar 2021 09:45:26 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
        by smtp.gmail.com with ESMTPSA id a15sm25660805wrr.53.2021.03.30.09.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 09:45:25 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Waiman Long <longman@redhat.com>,
        Michal Hocko <mhocko@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Michael A. Halcrow" <mhalcrow@us.ibm.com>,
        ecryptfs@vger.kernel.org
Subject: [PATCH 25/31] fs: ecryptfs: messaging: Add missing param descriptions and demote abuses
Date:   Tue, 30 Mar 2021 17:44:52 +0100
Message-Id: <20210330164458.1625478-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210330164458.1625478-1-lee.jones@linaro.org>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 fs/ecryptfs/messaging.c:15: warning: Function parameter or member 'ecryptfs_msg_ctx_free_list' not described in 'LIST_HEAD'
 fs/ecryptfs/messaging.c:15: warning: expecting prototype for eCryptfs(). Prototype was for LIST_HEAD() instead
 fs/ecryptfs/messaging.c:157: warning: Function parameter or member 'daemon' not described in 'ecryptfs_exorcise_daemon'
 fs/ecryptfs/messaging.c:207: warning: Function parameter or member 'daemon' not described in 'ecryptfs_process_response'
 fs/ecryptfs/messaging.c:207: warning: expecting prototype for ecryptfs_process_reponse(). Prototype was for ecryptfs_process_response() instead
 fs/ecryptfs/messaging.c:262: warning: Function parameter or member 'msg_type' not described in 'ecryptfs_send_message_locked'

Cc: Tyler Hicks <code@tyhicks.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Michael A. Halcrow" <mhalcrow@us.ibm.com>
Cc: ecryptfs@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/ecryptfs/messaging.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ecryptfs/messaging.c b/fs/ecryptfs/messaging.c
index c0dfd9647627a..b38bd742fd973 100644
--- a/fs/ecryptfs/messaging.c
+++ b/fs/ecryptfs/messaging.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 2004-2008 International Business Machines Corp.
@@ -147,7 +147,7 @@ ecryptfs_spawn_daemon(struct ecryptfs_daemon **daemon, struct file *file)
 	return rc;
 }
 
-/**
+/*
  * ecryptfs_exorcise_daemon - Destroy the daemon struct
  *
  * Must be called ceremoniously while in possession of
@@ -181,7 +181,8 @@ int ecryptfs_exorcise_daemon(struct ecryptfs_daemon *daemon)
 }
 
 /**
- * ecryptfs_process_reponse
+ * ecryptfs_process_response
+ * @daemon: eCryptfs daemon object
  * @msg: The ecryptfs message received; the caller should sanity check
  *       msg->data_len and free the memory
  * @seq: The sequence number of the message; must match the sequence
@@ -250,6 +251,7 @@ int ecryptfs_process_response(struct ecryptfs_daemon *daemon,
  * ecryptfs_send_message_locked
  * @data: The data to send
  * @data_len: The length of data
+ * @msg_type: Type of message
  * @msg_ctx: The message context allocated for the send
  *
  * Must be called with ecryptfs_daemon_hash_mux held.
-- 
2.27.0

