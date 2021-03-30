Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE3E34EE51
	for <lists+ecryptfs@lfdr.de>; Tue, 30 Mar 2021 18:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbhC3Qq2 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 30 Mar 2021 12:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbhC3QpW (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 30 Mar 2021 12:45:22 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5865CC061762
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:22 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 12so8739297wmf.5
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DaNdccJQSe+wPmzjhr1peXjH90D+OVefCIbZEGcLTaQ=;
        b=Ve5Yj9iYlRH5RgSIh/wn7gbX6fU+u1ARVJhcOMlqTwULJL+bRM7diTnL7rt8rpzOkt
         U+d7AMOH6ykr+OQjbOihwsjSSlmV7zL+eMjoHyN4kZk2EmO422B9OVLB/P+uSxw41HY+
         7fLQQTwgfo+YC2KXe2+PXcLi5CvB6RCsBVUVdZMus8KK5+JGmEjnrh+3syt+xJKdbO2p
         llufuG1tEAPXhrCAPDUvJvcTYilnfwLwlNBkWHK14gb/u7MGbUumf+upBYYphNQW5At/
         9qyYKSVXOLzSCdUrwM8kuxLnoTvM99bbE54GAq/gwEWkW+hRNE/SVK9GOlulK8GSS3d1
         ZAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DaNdccJQSe+wPmzjhr1peXjH90D+OVefCIbZEGcLTaQ=;
        b=DUCdrwsS0z+w/yE59dahpjGhXklmRBqd6qu6s7lrhlzrLwC4OMztL/2lVps5JmfNQM
         xBYpvjdXRdwCrUEjxE/mnDXMHhIVc5dNP+qw++758233p5i8VvtVkgx+x6vmMndAzsmD
         NkMAedTW8m9XRBslA/kFyMIhi3YaogEe17A/7hXOuGFksZwkNY1D6lAsE9Hi5lv965iM
         ptZlg55WhIR39wfsJCeAOLC9ub85ubR3+Phdtr+QX4dO5gJRHDpXHoYQ2OzCsx4r3Ktl
         n86VlsoUfMDQq8tP7uGJoeIngryxH603ZgCNfjp8sToD6McVFV8lInJ58gGwu/0vK+RW
         cELg==
X-Gm-Message-State: AOAM530cL3E2PCzJkv8VuRrSU7BOFXnag6w45Vx95chkQz8xAdhRVZwm
        Eslv5Xm0RYzycRCT0V8ge5Fc7w==
X-Google-Smtp-Source: ABdhPJyiLR3DTUFeDG1TnJCgAHyLfD2FJurgFsjgX05L+x4yHI0QSu8W8HfgJGH2WojVA2y0bxM1FQ==
X-Received: by 2002:a1c:1d14:: with SMTP id d20mr4991457wmd.36.1617122721086;
        Tue, 30 Mar 2021 09:45:21 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
        by smtp.gmail.com with ESMTPSA id a15sm25660805wrr.53.2021.03.30.09.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 09:45:20 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
        "Michael A. Halcrow" <mahalcro@us.ibm.com>,
        ecryptfs@vger.kernel.org
Subject: [PATCH 20/31] fs: ecryptfs: debug: Demote a couple of kernel-doc abuses
Date:   Tue, 30 Mar 2021 17:44:47 +0100
Message-Id: <20210330164458.1625478-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210330164458.1625478-1-lee.jones@linaro.org>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 fs/ecryptfs/debug.c:13: warning: Incorrect use of kernel-doc format:  * ecryptfs_dump_auth_tok - debug function to print auth toks
 fs/ecryptfs/debug.c:19: warning: Function parameter or member 'auth_tok' not described in 'ecryptfs_dump_auth_tok'
 fs/ecryptfs/debug.c:19: warning: expecting prototype for eCryptfs(). Prototype was for ecryptfs_dump_auth_tok() instead

Cc: Tyler Hicks <code@tyhicks.com>
Cc: "Michael A. Halcrow" <mahalcro@us.ibm.com>
Cc: ecryptfs@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/ecryptfs/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ecryptfs/debug.c b/fs/ecryptfs/debug.c
index 1f65e99f9a414..cf6d0e8e25a16 100644
--- a/fs/ecryptfs/debug.c
+++ b/fs/ecryptfs/debug.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  * Functions only useful for debugging.
  *
@@ -9,7 +9,7 @@
 
 #include "ecryptfs_kernel.h"
 
-/**
+/*
  * ecryptfs_dump_auth_tok - debug function to print auth toks
  *
  * This function will print the contents of an ecryptfs authentication
-- 
2.27.0

