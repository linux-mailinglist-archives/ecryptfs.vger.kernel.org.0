Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6640195696
	for <lists+ecryptfs@lfdr.de>; Tue, 20 Aug 2019 07:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbfHTFQs (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 20 Aug 2019 01:16:48 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:42876 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729060AbfHTFQs (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 20 Aug 2019 01:16:48 -0400
Received: by mail-yb1-f195.google.com with SMTP id h8so1549007ybq.9;
        Mon, 19 Aug 2019 22:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=K9tXVaDYowv5bpbaTMDm753oQMxXGl7hp7rsvZH90aw=;
        b=QNV7X5kxBbVBSwNUIZMBudwI3tHCpcn/YN/6/9UIfJPfDsNYdZaIlKrjxIvItlrqhJ
         890rIgJ17zGjrl5qb+YJG2ELiSEM/EdLXTHF9ACfOsVWYRygMFtkVYHmKE2EWMmMqHga
         zkzE2JEPhxmkzFgM3+EaJ06MW/ESyLQjkpFphgimYjQuG+yDQDDHQUfjMJWcNwIXKEGs
         YREChWQA0DTrPCtE+Tp0haNjd5Kmq/Cfcr9lMAckB0WSBlT6gH2fvC+Q5VHglRmLsW//
         3BdHq1zGojFK/PpcLAmnyDPoGL6nq0yJufILk5h6zqWzYzU1PEWvX0pBzZ+tkfGilIib
         pEIg==
X-Gm-Message-State: APjAAAX1dYINJRd9vNqVUGVjI45naBfw45scEvkS3K3vaeQ3fXiD/jSb
        EK68+2Gf85zHmY96UQpflU9Pwuzl8ufNBQ==
X-Google-Smtp-Source: APXvYqzW+TJzFOw3WeSvrUHj1cIs7wqxRWtXr+Knm4ygkEApgDqGmQGcCaqHXwiu72MBnOeGoNRJsw==
X-Received: by 2002:a5b:98c:: with SMTP id c12mr18786567ybq.238.1566278207495;
        Mon, 19 Aug 2019 22:16:47 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com. [24.158.240.219])
        by smtp.gmail.com with ESMTPSA id 207sm3654969ywo.90.2019.08.19.22.16.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 19 Aug 2019 22:16:46 -0700 (PDT)
From:   Wenwen Wang <wenwen@cs.uga.edu>
To:     Wenwen Wang <wenwen@cs.uga.edu>
Cc:     Tyler Hicks <tyhicks@canonical.com>,
        ecryptfs@vger.kernel.org (open list:ECRYPT FILE SYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ecryptfs: fix a memory leak bug
Date:   Tue, 20 Aug 2019 00:16:40 -0500
Message-Id: <1566278200-9368-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

In parse_tag_1_packet(), if tag 1 packet contains a key larger than
ECRYPTFS_MAX_ENCRYPTED_KEY_BYTES, no cleanup is executed, leading to a
memory leak on the allocated 'auth_tok_list_item'. To fix this issue, go to
the label 'out_free' to perform the cleanup work.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 fs/ecryptfs/keystore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 216fbe6..4dc0963 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -1304,7 +1304,7 @@ parse_tag_1_packet(struct ecryptfs_crypt_stat *crypt_stat,
 		printk(KERN_WARNING "Tag 1 packet contains key larger "
 		       "than ECRYPTFS_MAX_ENCRYPTED_KEY_BYTES\n");
 		rc = -EINVAL;
-		goto out;
+		goto out_free;
 	}
 	memcpy((*new_auth_tok)->session_key.encrypted_key,
 	       &data[(*packet_size)], (body_size - (ECRYPTFS_SIG_SIZE + 2)));
-- 
2.7.4

