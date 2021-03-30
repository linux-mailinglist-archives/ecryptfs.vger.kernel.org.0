Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8713B34EE46
	for <lists+ecryptfs@lfdr.de>; Tue, 30 Mar 2021 18:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbhC3QqR (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 30 Mar 2021 12:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbhC3Qpf (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 30 Mar 2021 12:45:35 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93256C061762
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:33 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id z2so16885956wrl.5
        for <ecryptfs@vger.kernel.org>; Tue, 30 Mar 2021 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uz14qCHZq/y+AEQD2BFCO5D/bv58/eQYEWwciVDmJV0=;
        b=f5gkaYxVEOCiEvwK6U8ED+UTYbM2Ba3BGGvrV3BckVAhqlrmRnVV7hoqEyNT+DLzAo
         4zXGREeAaaEF5X7Lj/cOHHgpl81hPCUqRYsY1+Kaiwb7nPAopPvo50GlJXi2ed+LXODW
         33b8Dkt1xocOuU220zpdLaSNYbtijq872BON/KVFNXwMvzJajXZN5T0WDlQNweZjSeUQ
         f9pJ+90htMsE1L1pAX8Cfn8cCyDMjvrFVvFIDWUewI1s/u+3tK1DYsBgkVHlcKimjIl7
         KMIpLhm/jYaczyPT9H9oelr9OkSpxc4oJkC8DgJYwooZhvqw/Cuz/szZFtVXr8tlz70s
         DKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uz14qCHZq/y+AEQD2BFCO5D/bv58/eQYEWwciVDmJV0=;
        b=tHpL6S0WWqtiNUqHh8670o0RWUm9ZaO2+SMebzRw2/R6YfNbnoYtmCtVus/acJIdQb
         6idItMITlCLeTKBVJAPI7iyQ+Xy9RbR+IJxN6BPjnRncOsMVOyQfDsC7ouQ3SagVsk7Z
         FJQACnqtRdSP9L8y5s91uKdjxComkYwDDst+a5pqdfE5Nxb9+H1rEKVkp7a/kORYQVSS
         MsmMfkfGWa4c6LswkIqHi4GuQjlBL38qzhU6JsCb0P1Gpz1MfTui/+B1A4wN2fATse0W
         zm73azGwIkvItvq/Klv5hFR9dZs104vXmdYsp5RJIVLzdM8KQTSZRw7j3yVguwy6cxbs
         5n1A==
X-Gm-Message-State: AOAM531naBe/ns2/UpEcyrWanUMEGLBjWiQg6A30tBcVfTsQ4bwDqFbT
        xHJUufDF2msfAW3/Y3vPa4EGhQ==
X-Google-Smtp-Source: ABdhPJyGrZfBIzzakXqKtJE1THh6cIxN+OYeF2/SGeyVZIiD616dKTd6ftSdxsaiQB5iQlAuDkfrsg==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr35042074wrv.194.1617122732308;
        Tue, 30 Mar 2021 09:45:32 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
        by smtp.gmail.com with ESMTPSA id a15sm25660805wrr.53.2021.03.30.09.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 09:45:31 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
        "Michael A. Halcrow" <mhalcrow@us.ibm.com>,
        "Michael C. Thompson" <mcthomps@us.ibm.com>,
        "Trevor S. Highland" <trevor.highland@gmail.com>,
        ecryptfs@vger.kernel.org
Subject: [PATCH 31/31] fs: ecryptfs: keystore: Fix some kernel-doc issues and demote non-conformant headers
Date:   Tue, 30 Mar 2021 17:44:58 +0100
Message-Id: <20210330164458.1625478-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210330164458.1625478-1-lee.jones@linaro.org>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 fs/ecryptfs/keystore.c:25: warning: Incorrect use of kernel-doc format:  * request_key returned an error instead of a valid key address;
 fs/ecryptfs/keystore.c:30: warning: Function parameter or member 'err_code' not described in 'process_request_key_err'
 fs/ecryptfs/keystore.c:30: warning: expecting prototype for eCryptfs(). Prototype was for process_request_key_err() instead
 fs/ecryptfs/keystore.c:558: warning: Function parameter or member 'auth_tok_key' not described in 'ecryptfs_find_auth_tok_for_sig'
 fs/ecryptfs/keystore.c:558: warning: Function parameter or member 'mount_crypt_stat' not described in 'ecryptfs_find_auth_tok_for_sig'
 fs/ecryptfs/keystore.c:558: warning: Excess function parameter 'crypt_stat' description in 'ecryptfs_find_auth_tok_for_sig'
 fs/ecryptfs/keystore.c:584: warning: cannot understand function prototype: 'struct ecryptfs_write_tag_70_packet_silly_stack '
 fs/ecryptfs/keystore.c:622: warning: Function parameter or member 'dest' not described in 'ecryptfs_write_tag_70_packet'
 fs/ecryptfs/keystore.c:622: warning: Function parameter or member 'remaining_bytes' not described in 'ecryptfs_write_tag_70_packet'
 fs/ecryptfs/keystore.c:622: warning: Function parameter or member 'packet_size' not described in 'ecryptfs_write_tag_70_packet'
 fs/ecryptfs/keystore.c:622: warning: Function parameter or member 'mount_crypt_stat' not described in 'ecryptfs_write_tag_70_packet'
 fs/ecryptfs/keystore.c:622: warning: Function parameter or member 'filename_size' not described in 'ecryptfs_write_tag_70_packet'
 fs/ecryptfs/keystore.c:622: warning: expecting prototype for write_tag_70_packet(). Prototype was for ecryptfs_write_tag_70_packet() instead
 fs/ecryptfs/keystore.c:895: warning: expecting prototype for parse_tag_70_packet(). Prototype was for ecryptfs_parse_tag_70_packet() instead

Cc: Tyler Hicks <code@tyhicks.com>
Cc: "Michael A. Halcrow" <mhalcrow@us.ibm.com>
Cc: "Michael C. Thompson" <mcthomps@us.ibm.com>
Cc: "Trevor S. Highland" <trevor.highland@gmail.com>
Cc: ecryptfs@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/ecryptfs/keystore.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 2abd219cfeec6..3fe41964c0d8d 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  * In-kernel key management code.  Includes functions to parse and
  * write authentication token-related packets with the underlying
@@ -21,7 +21,7 @@
 #include <linux/slab.h>
 #include "ecryptfs_kernel.h"
 
-/**
+/*
  * request_key returned an error instead of a valid key address;
  * determine the type of error, make appropriate log entries, and
  * return an error code.
@@ -536,8 +536,9 @@ ecryptfs_find_global_auth_tok_for_sig(
 
 /**
  * ecryptfs_find_auth_tok_for_sig
+ * @auth_tok_key: key containing the authentication token
  * @auth_tok: Set to the matching auth_tok; NULL if not found
- * @crypt_stat: inode crypt_stat crypto context
+ * @mount_crypt_stat: inode crypt_stat crypto context
  * @sig: Sig of auth_tok to find
  *
  * For now, this function simply looks at the registered auth_tok's
@@ -576,7 +577,7 @@ ecryptfs_find_auth_tok_for_sig(
 	return rc;
 }
 
-/**
+/*
  * write_tag_70_packet can gobble a lot of stack space. We stuff most
  * of the function's parameters in a kmalloc'd struct to help reduce
  * eCryptfs' overall stack usage.
@@ -604,7 +605,7 @@ struct ecryptfs_write_tag_70_packet_silly_stack {
 	struct shash_desc *hash_desc;
 };
 
-/**
+/*
  * write_tag_70_packet - Write encrypted filename (EFN) packet against FNEK
  * @filename: NULL-terminated filename string
  *
@@ -873,7 +874,7 @@ struct ecryptfs_parse_tag_70_packet_silly_stack {
 };
 
 /**
- * parse_tag_70_packet - Parse and process FNEK-encrypted passphrase packet
+ * ecryptfs_parse_tag_70_packet - Parse and process FNEK-encrypted passphrase packet
  * @filename: This function kmalloc's the memory for the filename
  * @filename_size: This function sets this to the amount of memory
  *                 kmalloc'd for the filename
-- 
2.27.0

