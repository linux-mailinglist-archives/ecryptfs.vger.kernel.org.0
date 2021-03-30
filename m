Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08BF734EE4F
	for <lists+ecryptfs@lfdr.de>; Tue, 30 Mar 2021 18:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbhC3Qq0 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 30 Mar 2021 12:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhC3Qpc (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 30 Mar 2021 12:45:32 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C353CC061762
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:31 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id j9so15173037wrx.12
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u6PSupgPYpCRATIfwczWv5f0CW9JuZogeelRY58qLPc=;
        b=oJmJ+lDgy7lRSZ8xtiH0DkyWGdCIngB1z4KRI6iDp5oGJhYExX524nTwgfNLtIh7hD
         Oa/HYY51tliF2AdtxbKj80T/u/hMBiboTiSkGFmd7o/vKZeADAt5NITFvzr9sIZU3ugf
         TAz/L+EOn1Kwlqq5X971zuXOZujCFxYgh9c7fdfZD3YYGj/z3saVKRConmBMOQtcu0fI
         hLfU4XPHdbWUrGzmYph8GYIeBMqNOpJ+mPxZ0lOjUEvM04fcLEABudlD0VADm2dTmG/1
         aKMUKm7QSg+x1VeHlO5+uqjidnCs6UYCTo3e0OgTyTvfNPItiCAv78sjBZ2WpHelD9lH
         QcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u6PSupgPYpCRATIfwczWv5f0CW9JuZogeelRY58qLPc=;
        b=awhhzevvzFUMs9vItEKuZNkCoy1dzw+yAINTp6yHBTwp+9V4Y9CNUnaOXyON2R1915
         2m3kIcklKlBDxpuvOjeBg716RTAb9HtK3k8aqoBm+Toe4U98DGQV0K/ksTy0cMGROju4
         5doCc9QKqXpua8z9OtzZ4/dNsXBWFk7IM3n63U5Ne/KZPAMA3ijtTTmWOlfTz2NGk/gV
         qJI7bFKyrWW8OYiGjj4EzO2pEoiZZvUYyzenDVHwyNnNYKEOR1iT/CZkeVXiaGdhYz0r
         1JhUQUqyGB4a4DVJ4v6MFGTfWeEJBEul6NwWDynmoSg2WL97oXMCSBesFHk6hB1dPaBC
         9NpQ==
X-Gm-Message-State: AOAM531pzEzd1ZoXJjJuhW2vkGkNcHo9J0RheEFC7GGbDWiAmEoIF6Ef
        5YVf5EYxCJy7ywgtF9HBNCUp7Q==
X-Google-Smtp-Source: ABdhPJwFH2ZB1aHymPfYT/7I1Bh8JKWFwVL3nNuGMfstjMnqyCHJgpWEJfJLI27fPntAOmXMq+Y9gQ==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr35124461wru.214.1617122730452;
        Tue, 30 Mar 2021 09:45:30 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
        by smtp.gmail.com with ESMTPSA id a15sm25660805wrr.53.2021.03.30.09.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 09:45:29 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
        James Morris <jamorris@linux.microsoft.com>,
        Tycho Andersen <tycho@tycho.pizza>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        "Michael A. Halcrow" <mahalcro@us.ibm.com>,
        ecryptfs@vger.kernel.org
Subject: [PATCH 29/31] fs: ecryptfs: mmap: Help out one function header and demote other abuses
Date:   Tue, 30 Mar 2021 17:44:56 +0100
Message-Id: <20210330164458.1625478-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210330164458.1625478-1-lee.jones@linaro.org>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 fs/ecryptfs/mmap.c:26: warning: Incorrect use of kernel-doc format:  * ecryptfs_get_locked_page
 fs/ecryptfs/mmap.c:34: warning: Function parameter or member 'inode' not described in 'ecryptfs_get_locked_page'
 fs/ecryptfs/mmap.c:34: warning: Function parameter or member 'index' not described in 'ecryptfs_get_locked_page'
 fs/ecryptfs/mmap.c:34: warning: expecting prototype for eCryptfs(). Prototype was for ecryptfs_get_locked_page() instead
 fs/ecryptfs/mmap.c:52: warning: Function parameter or member 'wbc' not described in 'ecryptfs_writepage'
 fs/ecryptfs/mmap.c:98: warning: Incorrect use of kernel-doc format:  * ecryptfs_copy_up_encrypted_with_header
 fs/ecryptfs/mmap.c:110: warning: Function parameter or member 'page' not described in 'ecryptfs_copy_up_encrypted_with_header'
 fs/ecryptfs/mmap.c:110: warning: Function parameter or member 'crypt_stat' not described in 'ecryptfs_copy_up_encrypted_with_header'
 fs/ecryptfs/mmap.c:110: warning: expecting prototype for Header Extent(). Prototype was for ecryptfs_copy_up_encrypted_with_header() instead
 fs/ecryptfs/mmap.c:233: warning: wrong kernel-doc identifier on line:
 fs/ecryptfs/mmap.c:379: warning: Function parameter or member 'ecryptfs_inode' not described in 'ecryptfs_write_inode_size_to_header'

Cc: Tyler Hicks <code@tyhicks.com>
Cc: James Morris <jamorris@linux.microsoft.com>
Cc: Tycho Andersen <tycho@tycho.pizza>
Cc: Christian Brauner <christian.brauner@ubuntu.com>
Cc: "Michael A. Halcrow" <mahalcro@us.ibm.com>
Cc: ecryptfs@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/ecryptfs/mmap.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
index 2f333a40ff4d9..392e721b50a3d 100644
--- a/fs/ecryptfs/mmap.c
+++ b/fs/ecryptfs/mmap.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  * This is where eCryptfs coordinates the symmetric encryption and
  * decryption of the file data as it passes between the lower
@@ -22,7 +22,7 @@
 #include <asm/unaligned.h>
 #include "ecryptfs_kernel.h"
 
-/**
+/*
  * ecryptfs_get_locked_page
  *
  * Get one page from cache or lower f/s, return error otherwise.
@@ -41,6 +41,7 @@ struct page *ecryptfs_get_locked_page(struct inode *inode, loff_t index)
 /**
  * ecryptfs_writepage
  * @page: Page that is locked before this call is made
+ * @wbc: Write-back control structure
  *
  * Returns zero on success; non-zero otherwise
  *
@@ -78,7 +79,7 @@ static void strip_xattr_flag(char *page_virt,
 	}
 }
 
-/**
+/*
  *   Header Extent:
  *     Octets 0-7:        Unencrypted file size (big-endian)
  *     Octets 8-15:       eCryptfs special marker
@@ -229,7 +230,7 @@ static int ecryptfs_readpage(struct file *file, struct page *page)
 	return rc;
 }
 
-/**
+/*
  * Called with lower inode mutex held.
  */
 static int fill_zeros_to_end_of_page(struct page *page, unsigned int to)
@@ -368,7 +369,7 @@ static int ecryptfs_write_begin(struct file *file,
 	return rc;
 }
 
-/**
+/*
  * ecryptfs_write_inode_size_to_header
  *
  * Writes the lower file size to the first 8 bytes of the header.
-- 
2.27.0

