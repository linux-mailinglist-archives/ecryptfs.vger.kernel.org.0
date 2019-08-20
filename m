Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03D6956B0
	for <lists+ecryptfs@lfdr.de>; Tue, 20 Aug 2019 07:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbfHTFd7 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 20 Aug 2019 01:33:59 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:37692 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729024AbfHTFd7 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 20 Aug 2019 01:33:59 -0400
Received: by mail-yw1-f66.google.com with SMTP id u141so1925456ywe.4;
        Mon, 19 Aug 2019 22:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Hzlnui8irzpAd7n5q1N+N9i6R/iOr1I9zEkcRTy9ekw=;
        b=H1lerrhJAMcepNDgsKddyJQWXa65/IsvRVNr5XxEWlZnz1KBaymCzQbhFqT74MxkfN
         GYh9AuZ4QkQGF2/D5xe93v6tcP5dPPgKjA8awjuWO8gOLFaz4KTbvKxOZwO4XjvoaeLy
         kx+MwElB9Fgc1aHpsKqDvG0Un38IUj1ZTr1GPQWyvOTTFtOqtFLjdvluCA8ZdbOq8VZl
         Xm79/DhWxU+Mucdn0BW/O/W3g18mZAs0hLVoFgHy7xFiVNag93fOADXqnYpF+goN7bmB
         QPHko54Ts90h/MXgbCHGbDaX59uX6S6neCeKdbi5zeU/xVEI0vrwZdhVWtbqoUkEiwNf
         oDuQ==
X-Gm-Message-State: APjAAAX+T50gimJKdLd9Lx+o+a11NcWR4UVUh5AZSCPbTFOfVGtam0o2
        owxLRK37uQqPUGmzIcHzfBw=
X-Google-Smtp-Source: APXvYqzpbM2s+/R4UuRNquK4G5/xZGs5ognsdrBaTDyqNWPivsiUQaSswxIk8dyHOgWVD6Ao9G9zCg==
X-Received: by 2002:a81:98f:: with SMTP id 137mr20023485ywj.293.1566279238774;
        Mon, 19 Aug 2019 22:33:58 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com. [24.158.240.219])
        by smtp.gmail.com with ESMTPSA id q125sm3577917ywh.18.2019.08.19.22.33.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 19 Aug 2019 22:33:58 -0700 (PDT)
From:   Wenwen Wang <wenwen@cs.uga.edu>
To:     Wenwen Wang <wenwen@cs.uga.edu>
Cc:     Tyler Hicks <tyhicks@canonical.com>,
        ecryptfs@vger.kernel.org (open list:ECRYPT FILE SYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ecryptfs: fix a memory leak bug
Date:   Tue, 20 Aug 2019 00:33:54 -0500
Message-Id: <1566279234-9634-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

In ecryptfs_init_messaging(), if the allocation for 'ecryptfs_msg_ctx_arr'
fails, the previously allocated 'ecryptfs_daemon_hash' is not deallocated,
leading to a memory leak bug. To fix this issue, free
'ecryptfs_daemon_hash' before returning the error.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 fs/ecryptfs/messaging.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ecryptfs/messaging.c b/fs/ecryptfs/messaging.c
index d668e60..c05ca39 100644
--- a/fs/ecryptfs/messaging.c
+++ b/fs/ecryptfs/messaging.c
@@ -379,6 +379,7 @@ int __init ecryptfs_init_messaging(void)
 					* ecryptfs_message_buf_len),
 				       GFP_KERNEL);
 	if (!ecryptfs_msg_ctx_arr) {
+		kfree(ecryptfs_daemon_hash);
 		rc = -ENOMEM;
 		goto out;
 	}
-- 
2.7.4

