Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4163A161C7A
	for <lists+ecryptfs@lfdr.de>; Mon, 17 Feb 2020 21:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbgBQUyH (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 17 Feb 2020 15:54:07 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43635 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727300AbgBQUyG (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 17 Feb 2020 15:54:06 -0500
Received: by mail-qk1-f196.google.com with SMTP id p7so17499132qkh.10
        for <ecryptfs@vger.kernel.org>; Mon, 17 Feb 2020 12:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=fZySxfAnANnt+nsj5/OVRGywRHdZ5tW9LOHavZZDjwo=;
        b=c62OHk5BUlt072x6HnPdx+3Ya+PHAQsN/DiZq2P0o2DD9Jw1mv/hqeLtB66Sf8vRdf
         2VlKisVCL2fw8NoqsYti+odq6ZIIggslxnDiBDe9FsjRENpWGFk6opGUKyKVhdWpa8pz
         0oYBHK//B1F8VVi69tooXo5L7HLU4jpgK9TOt6QZEAzgsrSoABPxhoSEgca1jQrivDt5
         GK+13UzTfmL7OY1ubRO8bHhTxtoeJmOdBvJNPHfqZsYk9H5ZaHBAF9bEHEI2mtGf+F8Y
         a9OFx+ugPLD8fRXewLyTfd3rKus56LuAwiLIbZ0AUboEE/cripAfKJ6e/tC4x9s05diI
         p4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=fZySxfAnANnt+nsj5/OVRGywRHdZ5tW9LOHavZZDjwo=;
        b=Opsg4jCoY6Sw/ujm83nC6k4oFfhTf3P6/PBDxEZ2EOVUG8W8dgAEXY8SJUxZne0K+3
         lt9IkClql+tzdVpzSlm5zYMV8KgcBHo479+yXvSTWgJcOw+47GJN30d07B9TT/PF0MR6
         V8Xn/GpkpDHsqNVnEnaNcldVviMk9uToEsx5hhOJDHKzKtrPjZnxda0vW7qEjwJscNIO
         w/ZTwhKiZ22UnA+ezfcO3qZLljbzcyXs911dXE4JdqSLbOghkatKzJX4tIVmAbB8hexz
         S4aMcS363EqVFfoJd8if0wvVQ8ymA+9ZWptjxo0IP6x1bXlL8zQhcy9/ppwR5WsMVc5b
         E/+A==
X-Gm-Message-State: APjAAAWrNQIfUG7/b66NhrubL//hnRinF/WstTYYZgLjVEDiQeUBLCug
        xB34/gYQdqAZWH1O9PD6RCU+T7P5hlbArw==
X-Google-Smtp-Source: APXvYqzo4BZD6sctn/CUnMu2enQgFPYYUY0WU1tDjzIDMVLPiD1tQTPeT96pUKdZ1uz+ZaKUKwBQSA==
X-Received: by 2002:a37:494f:: with SMTP id w76mr16265607qka.309.1581972844290;
        Mon, 17 Feb 2020 12:54:04 -0800 (PST)
Received: from elm ([184.169.45.4])
        by smtp.gmail.com with ESMTPSA id m27sm810734qta.21.2020.02.17.12.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 12:54:03 -0800 (PST)
Date:   Mon, 17 Feb 2020 14:53:43 -0600
From:   Tyler Hicks <code@tyhicks.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, ecryptfs@vger.kernel.org
Subject: [GIT PULL] eCryptfs fixes for 5.6-rc3
Message-ID: <20200217205343.GA280196@elm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hi Linus,

The following changes since commit 5f97cbe22b7616ead7ae267c29cad73bc1444811:

  Merge tag 'clk-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux (2019-08-19 16:28:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-5.6-rc3-fixes

for you to fetch changes up to 2c2a7552dd6465e8fde6bc9cccf8d66ed1c1eb72:

  ecryptfs: replace BUG_ON with error handling code (2020-02-14 20:07:46 +0000)

----------------------------------------------------------------
eCryptfs fixes for 5.6-rc3
- Downgrade the eCryptfs maintenance status to "Odd Fixes"
- Change my email address
- Fix a couple memory leaks in error paths
- Stability improvement to avoid a needless BUG_ON()

----------------------------------------------------------------
Aditya Pakki (1):
      ecryptfs: replace BUG_ON with error handling code

Tyler Hicks (2):
      MAINTAINERS: eCryptfs: Update maintainer address and downgrade status
      eCryptfs: Replace deactivated email address

Wenwen Wang (2):
      ecryptfs: fix a memory leak bug in parse_tag_1_packet()
      ecryptfs: fix a memory leak bug in ecryptfs_init_messaging()

 MAINTAINERS                   | 4 ++--
 fs/ecryptfs/crypto.c          | 6 ++++--
 fs/ecryptfs/ecryptfs_kernel.h | 2 +-
 fs/ecryptfs/keystore.c        | 2 +-
 fs/ecryptfs/main.c            | 2 +-
 fs/ecryptfs/messaging.c       | 3 ++-
 6 files changed, 11 insertions(+), 8 deletions(-)
