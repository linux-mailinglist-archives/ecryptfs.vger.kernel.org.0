Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C237C5D596
	for <lists+ecryptfs@lfdr.de>; Tue,  2 Jul 2019 19:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfGBRr3 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 2 Jul 2019 13:47:29 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40323 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbfGBRr3 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 2 Jul 2019 13:47:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so8614694pfp.7;
        Tue, 02 Jul 2019 10:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Jzz759w5WsLp9Pj0z8kof2AyohkrQmdR6AqTftOfq00=;
        b=YQ31jsiSplK9q6mCpGc6wFd64eZZ+z83KgJaX9GpWwnud5QdIq6cqI1rRa9vrKG6ek
         Ry8kcx6GtktkY8TvZwvd95PuQsq/wVS2PdeLUfAe8CfNhxDrCp94snQALcJ+Oc2e7ITx
         OyhfK9Feg7T62HYLWKmmNkx5u8l3eLaN/ASexTTGYx9DtTciFfZVL0QO7BlE4LTc535c
         AF3ytE6ZByz61/fsKdcNvLyZwjdYBlYMZW+aFQTmaiQ4GeP9x1QNK7DUQTQ9wtll0HUN
         vIBaenuQbOAwM63CpfH3UPe+p9T+DUEwq5qdqbmpaXHnA+Y0gdvybzxcMwF4fwA5htVt
         G6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Jzz759w5WsLp9Pj0z8kof2AyohkrQmdR6AqTftOfq00=;
        b=j0o/zy6WelaI5ru+mfwZ9kZKtGwGnzBzSix0XbYQwcj/4Q/1tYND/HP/yKfsOMrFtR
         K5BuhWN5maFY2zD3O3wyDk5GjV9Z9oHgvvKirRv6e1Qa2dh/hYrNAxeQrtDtfA0GnLH2
         3ucqS0vutY2cefQP9tC/WeBVsATYoKSU9jFFp9IUIgdArZGv/ef8OXuILTFV2ynN58QK
         /61at+WFegDOkOkyUZLZn82VkNlPlHMe8HrtmpLTJigQUIeIY/5/uPE1W960HC9AXD5v
         xIWuFCchU3Few8Hac4whE5EQtWvQSGT8tmDoDAAK+K+PMBRHjftW/hskgYcz7ER7V+JC
         AqiQ==
X-Gm-Message-State: APjAAAWdFJKky+JvsuL/3bcq8+gPFIc2mQz6/OUmx3p8+fMgxpu4V15v
        2ELF07dsNNfJZiekpTC2WQz19bYR
X-Google-Smtp-Source: APXvYqwz0zwLa3IlOQ4JSqtuLImuRigLw7gEoDSMcqXXago9XIpqzQlQon7bsspoB1no9QsA9x+60g==
X-Received: by 2002:a17:90a:d997:: with SMTP id d23mr6638752pjv.84.1562089648449;
        Tue, 02 Jul 2019 10:47:28 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.187])
        by smtp.gmail.com with ESMTPSA id i3sm15303855pfo.138.2019.07.02.10.47.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 10:47:27 -0700 (PDT)
Date:   Tue, 2 Jul 2019 23:17:24 +0530
From:   Hariprasad Kelam <hariprasad.kelam@gmail.com>
To:     Tyler Hicks <tyhicks@canonical.com>, ecryptfs@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] fs: ecryptfs: crypto: Change return type of
 ecryptfs_process_flags
Message-ID: <20190702174723.GA4600@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Change return type of ecryptfs_process_flags from int to void. As it
never fails.

fixes below issue reported by coccicheck

s/ecryptfs/crypto.c:870:5-7: Unneeded variable: "rc". Return "0" on line
883

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 fs/ecryptfs/crypto.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 509a767..55a633e 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -864,10 +864,9 @@ static struct ecryptfs_flag_map_elem ecryptfs_flag_map[] = {
  *
  * Returns zero on success; non-zero if the flag set is invalid
  */
-static int ecryptfs_process_flags(struct ecryptfs_crypt_stat *crypt_stat,
+static void ecryptfs_process_flags(struct ecryptfs_crypt_stat *crypt_stat,
 				  char *page_virt, int *bytes_read)
 {
-	int rc = 0;
 	int i;
 	u32 flags;
 
@@ -880,7 +879,6 @@ static int ecryptfs_process_flags(struct ecryptfs_crypt_stat *crypt_stat,
 	/* Version is in top 8 bits of the 32-bit flag vector */
 	crypt_stat->file_version = ((flags >> 24) & 0xFF);
 	(*bytes_read) = 4;
-	return rc;
 }
 
 /**
@@ -1306,12 +1304,9 @@ static int ecryptfs_read_headers_virt(char *page_virt,
 	if (!(crypt_stat->flags & ECRYPTFS_I_SIZE_INITIALIZED))
 		ecryptfs_i_size_init(page_virt, d_inode(ecryptfs_dentry));
 	offset += MAGIC_ECRYPTFS_MARKER_SIZE_BYTES;
-	rc = ecryptfs_process_flags(crypt_stat, (page_virt + offset),
+	ecryptfs_process_flags(crypt_stat, (page_virt + offset),
 				    &bytes_read);
-	if (rc) {
-		ecryptfs_printk(KERN_WARNING, "Error processing flags\n");
-		goto out;
-	}
+
 	if (crypt_stat->file_version > ECRYPTFS_SUPPORTED_FILE_VERSION) {
 		ecryptfs_printk(KERN_WARNING, "File version is [%d]; only "
 				"file version [%d] is supported by this "
-- 
2.7.4

