Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7951A34EE2D
	for <lists+ecryptfs@lfdr.de>; Tue, 30 Mar 2021 18:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhC3QpM (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 30 Mar 2021 12:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbhC3QpD (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 30 Mar 2021 12:45:03 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05417C061762
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:02 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id x16so16870300wrn.4
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wj7QJj3J1iXDZqjFd2EjWvYDk/YLZB6mDqda5uCd8PA=;
        b=iNeVxqGDFi765BMHSIsKhPjo2kVNCRjHsd+1YYnsdfiONCeidAKcQUphdQVNdW2APX
         b3Jpcjza4rV3y23DKrD5ZdK6dX9yJgy59/sS4bGNPMd/gkUztl6FYedo0u7kZEb4F8Hu
         l6BHc6uV2ZifxDTGSfNYFh5cjE9BmdIFNFosYAiOk2DffJswa6G4W6iGfVUJKCcuQGhH
         K6fs0VUJ1up2Orjp7FgFt1pKV7oiMhazBsbIfZunINNfjtxh9CLsclK1jWaQGREzoFLY
         vDrk/AmOvT3SqZ56vH5mtxd3Jkb/ToToKfrbDVkUPH3uULMfw4RTCyYoXV+Eea9/qO/y
         FToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wj7QJj3J1iXDZqjFd2EjWvYDk/YLZB6mDqda5uCd8PA=;
        b=C8ZJkJEFRipMFGvCQlgdsj/Fr4k8vhJ3G8fg+XpSIwTd72KF6fXqM2AkLuCeVhNapV
         r3yAJ1vO8Cm487awk6MKiR9hmu6+CNYx2Fi1cGJkZmhd51sxLXV1DU4QSqewwLGqJzRF
         BjENPhauyU9tLxNje79LBUOGJi1HwsM0lv71sMJ3k+zZkyusJJuUmHeLSDXtJuftyV+Y
         /oa7K4FPurpZvv1tcDm9Px/AIfQe7xchJtaZ1ntSYgEWnaZq7TODsqA+3fkLswWa8Vew
         3FMiJRdpVr9wvCKYZXQR2PrQmr3OvkDgRhFgNgClkXJ92V5V3T+nfg6ey9c+KyheMqjC
         C23w==
X-Gm-Message-State: AOAM5303w/xwTQVWBVOxeR2u9Y0hZMa+0QaL78KYo1W4kotZU/D1VUt+
        L339FE2cl29hIJct3d0aDcQzOH6HgyvvEw==
X-Google-Smtp-Source: ABdhPJw8bSgOwdXD8SiSGcskMEroP9a/+g+c6gm5CplNsn6AiBePVMzP4YHscQ1ycolGdTZ/nJ1MXA==
X-Received: by 2002:a05:6000:1789:: with SMTP id e9mr35389492wrg.237.1617122701533;
        Tue, 30 Mar 2021 09:45:01 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
        by smtp.gmail.com with ESMTPSA id a15sm25660805wrr.53.2021.03.30.09.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 09:45:00 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Bob Peterson <rpeterso@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        cluster-devel@redhat.com, David Howells <dhowells@redhat.com>,
        ecryptfs@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
        James Morris <jamorris@linux.microsoft.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        "Michael A. Halcrow" <mahalcro@us.ibm.com>,
        "Michael A. Halcrow" <mhalcrow@us.ibm.com>,
        "Michael C. Thompsion" <mcthomps@us.ibm.com>,
        Michal Hocko <mhocko@suse.com>,
        "Trevor S. Highland" <trevor.highland@gmail.com>,
        Tycho Andersen <tycho@tycho.pizza>,
        Tyler Hicks <code@tyhicks.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH 00/31] Rid W=1 warnings from GFS2 and EncryptFS
Date:   Tue, 30 Mar 2021 17:44:27 +0100
Message-Id: <20210330164458.1625478-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

There is more to do in filesystems.  Another set will follow.

Lee Jones (31):
  fs: gfs2: dir: Finish off mostly complete headers demote others
  fs: gfs2: xattr: Help out some kernel-doc header demote non-conformant
    ones
  fs: gfs2: bmap: Demote half-complete kernel-doc headers fix others
  fs: gfs2: glops: Fix a couple of kernel-doc misdemeanours demote
    others
  fs: gfs2: log: Fix a couple of param descriptions and demote
    non-conformant headers
  fs: gfs2: lops: Help out worthy kernel-doc headers and demote others
  fs: gfs2: glock: Fix some deficient kernel-doc headers and demote
    non-conformant ones
  fs: gfs2: aops: Fix a little potential doc-rot
  fs: gfs2: meta_io: Add missing description for 'rahead' param
  fs: gfs2: inode: Fix worthy function headers demote others
  fs: gfs2: file: Strip out superfluous param description and demote
    kernel-doc abuse
  fs: gfs2: ops_fstype: Fix a little doc-rot
  fs: gfs2: quota: Fix incorrect param name in 'gfs2_quotad'
  fs: gfs2: rgrp: Fix a few kernel-doc misdemeanours
  fs: gfs2: recovery: Provide missing param descriptions and remove one
    other
  fs: gfs2: super: Fix kernel-doc issues where feasible demote one other
  fs: gfs2: util: Fix one conformant kernel-doc header and demote a
    bunch of abuses
  fs: gfs2: lock_dlm: Demote incomplete kernel-doc header
  fs: ecryptfs: read_write: File headers do not make good candidates for
    kernel-doc
  fs: ecryptfs: debug: Demote a couple of kernel-doc abuses
  fs: ecryptfs: dentry: File headers are not good candidates for
    kernel-doc
  fs: ecryptfs: kthread: Demote file header and provide description for
    'cred'
  fs: ecryptfs: file: Demote kernel-doc abuses
  fs: ecryptfs: super: Fix formatting, naming and kernel-doc abuses
  fs: ecryptfs: messaging: Add missing param descriptions and demote
    abuses
  fs: ecryptfs: main: Demote a bunch of non-conformant kernel-doc
    headers
  fs: ecryptfs: miscdev: File headers are not good kernel-doc candidates
  fs: ecryptfs: crypto: Supply some missing param descriptions and
    demote abuses
  fs: ecryptfs: mmap: Help out one function header and demote other
    abuses
  fs: ecryptfs: inode: Help out nearly-there header and demote
    non-conformant ones
  fs: ecryptfs: keystore: Fix some kernel-doc issues and demote
    non-conformant headers

 fs/ecryptfs/crypto.c     | 20 ++++++++++----------
 fs/ecryptfs/debug.c      |  4 ++--
 fs/ecryptfs/dentry.c     |  2 +-
 fs/ecryptfs/file.c       |  4 ++--
 fs/ecryptfs/inode.c      | 11 +++++------
 fs/ecryptfs/keystore.c   | 13 +++++++------
 fs/ecryptfs/kthread.c    |  3 ++-
 fs/ecryptfs/main.c       | 20 +++++++++-----------
 fs/ecryptfs/messaging.c  |  8 +++++---
 fs/ecryptfs/miscdev.c    |  3 ++-
 fs/ecryptfs/mmap.c       | 11 ++++++-----
 fs/ecryptfs/read_write.c |  4 +++-
 fs/ecryptfs/super.c      |  8 ++++----
 fs/gfs2/aops.c           |  5 +----
 fs/gfs2/bmap.c           |  4 ++--
 fs/gfs2/dir.c            | 35 +++++++++++++----------------------
 fs/gfs2/file.c           |  3 +--
 fs/gfs2/glock.c          |  9 ++++-----
 fs/gfs2/glops.c          | 18 ++++++------------
 fs/gfs2/inode.c          | 22 ++++++++++++----------
 fs/gfs2/lock_dlm.c       |  3 +--
 fs/gfs2/log.c            | 11 ++++-------
 fs/gfs2/lops.c           | 13 +++++++------
 fs/gfs2/meta_io.c        |  1 +
 fs/gfs2/ops_fstype.c     |  7 ++-----
 fs/gfs2/quota.c          |  2 +-
 fs/gfs2/recovery.c       |  3 ++-
 fs/gfs2/rgrp.c           |  4 +++-
 fs/gfs2/super.c          | 13 ++++++-------
 fs/gfs2/util.c           | 19 ++++++++++---------
 fs/gfs2/xattr.c          | 25 +++++++------------------
 31 files changed, 141 insertions(+), 167 deletions(-)

Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Christian Brauner <christian.brauner@ubuntu.com>
Cc: cluster-devel@redhat.com
Cc: David Howells <dhowells@redhat.com>
Cc: ecryptfs@vger.kernel.org
Cc: Eric Biggers <ebiggers@google.com>
Cc: James Morris <jamorris@linux.microsoft.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: "Michael A. Halcrow" <mahalcro@us.ibm.com>
Cc: "Michael A. Halcrow" <mhalcrow@us.ibm.com>
Cc: "Michael C. Thompsion" <mcthomps@us.ibm.com>
Cc: "Michael C. Thompson" <mcthomps@us.ibm.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: "Trevor S. Highland" <trevor.highland@gmail.com>
Cc: Tycho Andersen <tycho@tycho.pizza>
Cc: Tyler Hicks <code@tyhicks.com>
Cc: Waiman Long <longman@redhat.com>
-- 
2.27.0

