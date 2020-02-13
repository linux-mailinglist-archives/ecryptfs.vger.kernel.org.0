Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94CFD15CD2F
	for <lists+ecryptfs@lfdr.de>; Thu, 13 Feb 2020 22:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgBMVX2 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Thu, 13 Feb 2020 16:23:28 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:57339 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728017AbgBMVX2 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Thu, 13 Feb 2020 16:23:28 -0500
Received: from 2.general.tyhicks.us.vpn ([10.172.64.53] helo=sec.work.tihix.com)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <tyhicks@canonical.com>)
        id 1j2LxG-0002qr-An; Thu, 13 Feb 2020 21:23:26 +0000
From:   Tyler Hicks <tyhicks@canonical.com>
To:     ecryptfs@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: eCryptfs: Update maintainer address and downgrade status
Date:   Thu, 13 Feb 2020 21:23:06 +0000
Message-Id: <20200213212306.19693-1-tyhicks@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Adjust my email address to a personal account. Downgrade the status of
eCryptfs maintenance to 'Odd Fixes' since it has not been part of my
work responsibilities recently and I've had little personal time to
devote to it.

eCryptfs hasn't seen active development in some time. New deployments of
file level encryption should use more modern solutions, such as fscrypt,
where possible.

Signed-off-by: Tyler Hicks <tyhicks@canonical.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38fe2f3f7b6f..e56936dc7c1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5932,12 +5932,12 @@ S:	Maintained
 F:	drivers/media/dvb-frontends/ec100*
 
 ECRYPT FILE SYSTEM
-M:	Tyler Hicks <tyhicks@canonical.com>
+M:	Tyler Hicks <code@tyhicks.com>
 L:	ecryptfs@vger.kernel.org
 W:	http://ecryptfs.org
 W:	https://launchpad.net/ecryptfs
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git
-S:	Supported
+S:	Odd Fixes
 F:	Documentation/filesystems/ecryptfs.txt
 F:	fs/ecryptfs/
 
-- 
2.17.1

