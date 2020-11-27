Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97182C6915
	for <lists+ecryptfs@lfdr.de>; Fri, 27 Nov 2020 17:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730366AbgK0QFX (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 27 Nov 2020 11:05:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52533 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730324AbgK0QFX (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 27 Nov 2020 11:05:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606493122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=Lx5QA+1c/hyrsXjP+K1B8IolDHDv6r6q6dP4B5qcGoc=;
        b=POaVOR24hsnKcBHh9kwojPvpmE1eqTqt5lmW9b//QU4Rcb0u5mS5eMw6Dvwg/bO36rKV9C
        XWehChOo6S5kgh65GhURUrzq8kB8MwiK8hA6ZqhrcRL2cTeiiWB9bjjmjqoYM6YYjafi2L
        JDnLb1/VNcCAdTd2QFdxepDcC/wlQZY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-oyUx3IXeNJmQyD8T0Py03g-1; Fri, 27 Nov 2020 11:05:20 -0500
X-MC-Unique: oyUx3IXeNJmQyD8T0Py03g-1
Received: by mail-qk1-f200.google.com with SMTP id p129so3948434qkc.20
        for <ecryptfs@vger.kernel.org>; Fri, 27 Nov 2020 08:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Lx5QA+1c/hyrsXjP+K1B8IolDHDv6r6q6dP4B5qcGoc=;
        b=i2avgEzWHFGL8v7JyFff/vKf7eBFDExO5Kc3LC14Hp2ytpqvLipt1xFkbm+a+aynjV
         Zh2TJyzOCa/IXgLVypcH7yGZAej4zneThHuPlxNgAXkb67X16GfOvm6st1PXywVkVWVH
         T4LdpzQEKqnFOGEzxkx3JqNyXCjKZgnVMOjLKfmCDmRDZb3nRrOVxpdUWPfbC4tnIJYZ
         qxa9TMjz+eZAKRzrO2HHP6DlUTvfy0DZJBoKi/nzNIp8gqR6WNkbaFR7RW1+ha3ADZS6
         7NMy7hEmydmkd1lVQHeJcnD6/Lz2OvO2vBkWLCyDYzZpDQet8oSPLgD0eaugQmsRPjQ8
         sWQw==
X-Gm-Message-State: AOAM532N0QxzURGtapBV4ake5MaGadY2d4pqo0N6gvcb6BnF31HIyN9L
        sbLlDEaBJ1wKQG89RvkXNWfwPopgfofOPCQu19o4OqET7HKCB6+LEZcZMEdVbivXupMfECKa6PC
        /PcnxspPvwdzOs+X64Hc=
X-Received: by 2002:ac8:7651:: with SMTP id i17mr9095756qtr.248.1606493119664;
        Fri, 27 Nov 2020 08:05:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrS1i55kyNvlHzcDjmRasvRmA+DWO57YRKCEb4T+Hdkk6tGNT/JOTtakf7XgXiuVwklbeUHQ==
X-Received: by 2002:ac8:7651:: with SMTP id i17mr9095725qtr.248.1606493119425;
        Fri, 27 Nov 2020 08:05:19 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id c27sm6359681qkk.57.2020.11.27.08.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:05:18 -0800 (PST)
From:   trix@redhat.com
To:     code@tyhicks.com, hannes@cmpxchg.org, mhocko@suse.com,
        longman@redhat.com, herbert@gondor.apana.org.au,
        ebiggers@google.com
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] eCryptfs: add a semicolon
Date:   Fri, 27 Nov 2020 08:05:13 -0800
Message-Id: <20201127160513.2619747-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Function like macros should have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/ecryptfs/keystore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index f6a17d259db7..2abd219cfeec 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -1172,7 +1172,7 @@ decrypt_pki_encrypted_session_key(struct ecryptfs_auth_tok *auth_tok,
 	rc = ecryptfs_cipher_code_to_string(crypt_stat->cipher, cipher_code);
 	if (rc) {
 		ecryptfs_printk(KERN_ERR, "Cipher code [%d] is invalid\n",
-				cipher_code)
+				cipher_code);
 		goto out;
 	}
 	crypt_stat->flags |= ECRYPTFS_KEY_VALID;
-- 
2.18.4

