Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631C1326918
	for <lists+ecryptfs@lfdr.de>; Fri, 26 Feb 2021 22:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhBZVCt (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 26 Feb 2021 16:02:49 -0500
Received: from mail-bl2gcc02on2093.outbound.protection.outlook.com ([40.107.89.93]:63680
        "EHLO GCC02-BL0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230434AbhBZVCZ (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Fri, 26 Feb 2021 16:02:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=md02AEMxpx7OiuO68p+PUPSztEWneRT17ayiA+BaxZzveVeew4s18rSbd/2Eudavnwo+1DHV8L42aHumjBtFzq2rEizU5s/wuRGaaw8+P22WGofmImw16Ry+9fnvpFESf2zZKX3QjTfnyqpxF3Swv0XM1GA72W2oF3JD5yVnfvcSf4/rPfSVkhAYggfnAJaheTU3eeGCWVBH5sy+og74N1/PS/YP/YAyfvMzKz5HVfUIfL+CI+NKVMtG8sBiyfSLmfYPdC0zHuOpYZumcJMveHHLnG+jab84O8b9GSoCH2pa00XxjUQJ4jwSwVNx9irvcGFJBjvSd5ocJ9NESlMDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3crfCbxSWo/KknUsb2XVtPSki8QdckemfmXhQLPG35E=;
 b=PFPbm5IjRx68c3Cy5abxU8eSlEUq92eiYKD0MJ0uTBYhgop1yUsj+ee+q6LW8m0KD+JvPDqVMGl1BvC1p9an3934rCPwLlmytz5Ojt5ZRG19AHhbWK2mDVtY6vCOeTNbQXftxY9e7++6kv/FJpzT6ADc6ghocNyKCX2hrZUgZS8MenTlwRJ/nzDI6+2haMDMBa1mByvFBA5+ZcgCX7bENAIYMcMjDiIXd+YpnnVEQjGW2qLAccqQvJEF0zkNx+/GM6CA+jumAaHKmoTAZWJUf75zlkq0dNEMuFURZctqriOkiUflnRvxPYjQcnBgGJTUhoTH3o8cic3dIaQOSrv8gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starlab.io; dmarc=pass action=none header.from=starlab.io;
 dkim=pass header.d=starlab.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3crfCbxSWo/KknUsb2XVtPSki8QdckemfmXhQLPG35E=;
 b=R0X8HWAjwANKlXTwS7FcfKnSi0ylMwwqEZciTADI87Kh3k5FdGBNn0q1m2cJCpLqoVwYt+b77GasIsHYbMs0Uzchj95xXKJvL+wmnD2pEHzDgC6DKK0NY5c0+RV5DdGbkm+be0tpMEO1pcKVPsXQSffrLtiDepFRgFCNy9iM2tA=
Authentication-Results: starlab.io; dkim=none (message not signed)
 header.d=none;starlab.io; dmarc=none action=none header.from=starlab.io;
Received: from DM8PR09MB6997.namprd09.prod.outlook.com (2603:10b6:5:2e0::10)
 by DM8PR09MB6389.namprd09.prod.outlook.com (2603:10b6:5:2e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 26 Feb
 2021 21:01:30 +0000
Received: from DM8PR09MB6997.namprd09.prod.outlook.com
 ([fe80::6502:414c:a91c:8c38]) by DM8PR09MB6997.namprd09.prod.outlook.com
 ([fe80::6502:414c:a91c:8c38%4]) with mapi id 15.20.3890.023; Fri, 26 Feb 2021
 21:01:30 +0000
From:   Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
To:     Tyler Hicks <code@tyhicks.com>
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
Subject: [PATCH] ecryptfs: add rename flag support
Date:   Fri, 26 Feb 2021 15:01:25 -0600
Message-Id: <20210226210125.77692-1-jeffrey.mitchell@starlab.io>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [47.218.202.86]
X-ClientProxiedBy: SA0PR11CA0184.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::9) To DM8PR09MB6997.namprd09.prod.outlook.com
 (2603:10b6:5:2e0::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jeffrey-work-20 (47.218.202.86) by SA0PR11CA0184.namprd11.prod.outlook.com (2603:10b6:806:1bc::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Fri, 26 Feb 2021 21:01:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0819ca2-1bb5-4756-14b3-08d8da99b0c5
X-MS-TrafficTypeDiagnostic: DM8PR09MB6389:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR09MB6389B622995BA8492868E795F89D9@DM8PR09MB6389.namprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aGUBj3gK4e3AWCO5iQkvmxT8S+cLPwMv9H/Qv6W/Yj2Ho0mf+q93V27bdrLI2ztpduZ/dy6rCSQ2DA1CYAB5tKj7a/Ryso41BwNk7nS5UZPzqBlFvBfUzawmSGjFB6B9BnU0EDQJGv5lxF6Ref9oORexcjvsQLXieRMvIXAm5Xb7JkLh8ZtGTGZ3gxnkbU3TGDtzp/TLd42IZprVBgtd24JxB32wrJm7dmCxKv2OcCn4kerPZgJ0hpRmLWKc9O0/dzbeRP6I4LIHdNJVdXP+7mJRkKLR0HRk3E1v3SL/+a0dVJCVXNVhPFBQcShH8CMzIVZx3TDTM5kV2rF+5DdA+rRU/6v7dIaaPjJBmoI45+x7OS4QIHHbs7NlruILghqj3a7cz9MEno8UcDncHgNLb/fMIg6nlBbVgizI5A1AXdpW3ocUXk6e74RkbwrM24TekK9JYlG0ngemo2iag9QdXbLOCUYi34XNZ9Ne1rN3ZH9wRMLawbW44ZmFuRWaZQVmL6qicFrlMHPpVLbZfQ3aUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR09MB6997.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39830400003)(366004)(396003)(478600001)(26005)(6486002)(186003)(4326008)(107886003)(66946007)(66476007)(44832011)(86362001)(8676002)(16526019)(83380400001)(6916009)(6496006)(66556008)(8936002)(316002)(1076003)(2616005)(5660300002)(36756003)(2906002)(52116002)(956004)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KLQVVRpkNQlZxi6l/0qzVegrDSSw1wVlpD4ey9YcjVCxVYyA+yZDHHYDZa4e?=
 =?us-ascii?Q?tCIAnxciSYTB9p3Z+MOlIuc0s6Ef0lrfIR34m2FEQN4khUCmbSu1dpJ86q9X?=
 =?us-ascii?Q?k5BylmqKwvoA328fbjPiqjTHIj4SCkmlFUqhwYrIIBiAZzlM0IEDSxJu73Uo?=
 =?us-ascii?Q?Aw3v+iXe3zDl7HfTBCFiSD/02jYhLxsK8uvckVHUkdpQ+3vUXtqrVRCF8xFr?=
 =?us-ascii?Q?Fi0lQsmjSAjfOXkTq2EjeqwbnkwSpkXnV0pLaCDZ6CbjvbrwKHQ19UbVc4l/?=
 =?us-ascii?Q?M9mxacWAVPYCTFVAVE8rT9yOBmRepDznmK/SBuGoVIlStYQZkEEkKIIUHmb2?=
 =?us-ascii?Q?vxQm7m/H3o6c78kjM91gX+0t9hx2TVTvhzOYACginykuVNUDLxIUGhDdRiYH?=
 =?us-ascii?Q?CMPFnUcRl7IhHgJ4UU9uJFvacAVyW8wSoYlOn3u/jCRrwB4HodWrp0lWPWiO?=
 =?us-ascii?Q?JWYR1cPUj++JM4wN6yDQJtZf7irP/XV+PnL3DNS1FzXg8xs35eQpU6UvOckB?=
 =?us-ascii?Q?9x86Jzn/tif2a4AIPVZ1jTiEk1oQlErsFqHG/hBynRUZ3EAUyxNlfzX42x2L?=
 =?us-ascii?Q?XZ7BWqDRmdenaHlYK2/XsmRvqLLFC9qL6e2pR0ONN0ZjGYMLMaCczg4NLCSp?=
 =?us-ascii?Q?Y35+lkAc6cLy9Okl2jKUccw1+EN7CDZmkXsfCkpfNlQyZvTEhoP+XQIusePr?=
 =?us-ascii?Q?L+KEf9jr0YAF1YNabsPb75l29EcbJe+nBdYHhTkxYm8xClgZcRBeQP+02Q2L?=
 =?us-ascii?Q?t02i7hU0d8Y11Mp4d2lBjgrst2rkd4CzosTi+Bng98U22WI/IQLTrNfFnIrf?=
 =?us-ascii?Q?slpb/0cMK6j5fvpQqLib5IlxL+KEXnLuxccvPGsN6mGRRjE9G6WDSO0bx056?=
 =?us-ascii?Q?vPwz3UJpB1XN4pejbGU+7scyXSjE1NFszu1AQ08yfrtRLa9EuTMjlB8yXxAJ?=
 =?us-ascii?Q?1NXOEEvklpq8PpW49RgXqXdA6gL+5otymoPGQ6RcQScnjK1gkv47cThwkQLB?=
 =?us-ascii?Q?eXUbx+XgKagH//bHgsGnqx4rPjvPFWNFqFYF/ND9nO8o14rOSFpJehH3IxUh?=
 =?us-ascii?Q?1LV7W6JIn2RadW/I3j+xvuZKaXXVYgtPMowm91o3q24NUbwXOZvq85yeCgMO?=
 =?us-ascii?Q?fXfaI4Fi3YZku0DAjjtQkc/Zj/Jwpd0Sl8F6etc6waKfzlnBTJzUJxB47xdO?=
 =?us-ascii?Q?YQp7gBlDK3ykPfoHFUO7Lp5yPzqdTzwV5v2kxHN9dL3EOBUD2F8nv3E/wuHn?=
 =?us-ascii?Q?C5ESKqz7yMesIXma9TNGRmCT9UENQgwFKUcY6bcloiJaK48zJ9I81ISbG/xC?=
 =?us-ascii?Q?7TTdJF6mrNRuxVpio/XkFs+w?=
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d0819ca2-1bb5-4756-14b3-08d8da99b0c5
X-MS-Exchange-CrossTenant-AuthSource: DM8PR09MB6997.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 21:01:30.4508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USBmAccCyW3KOTgD7q8vnUicwCSw+fXCFdSs6KVmwgps6p7Zjw82XabAjHXU1OHT610Bz1FgUuLtMmlkKCFVrT+YPZgyljlRkN5KpquZf8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR09MB6389
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Currently, ecryptfs_rename() returns EINVAL if any flags are passed in.
However, if the lower filesystem has support for those flags, it doesn't
require any additional complexity to take advantage of it in eCryptfs.

Add flag support to ecryptfs_rename() by passing them through to the lower
filesystem

Signed-off-by: Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
---
 fs/ecryptfs/inode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 18e9285fbb4c..647afc2fd754 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -601,9 +601,6 @@ ecryptfs_rename(struct user_namespace *mnt_userns, struct inode *old_dir,
 	struct inode *target_inode;
 	struct renamedata rd = {};
 
-	if (flags)
-		return -EINVAL;
-
 	lower_old_dir_dentry = ecryptfs_dentry_to_lower(old_dentry->d_parent);
 	lower_new_dir_dentry = ecryptfs_dentry_to_lower(new_dentry->d_parent);
 
@@ -636,6 +633,7 @@ ecryptfs_rename(struct user_namespace *mnt_userns, struct inode *old_dir,
 	rd.new_mnt_userns	= &init_user_ns;
 	rd.new_dir		= d_inode(lower_new_dir_dentry);
 	rd.new_dentry		= lower_new_dentry;
+	rd.flags		= flags;
 	rc = vfs_rename(&rd);
 	if (rc)
 		goto out_lock;
-- 
2.25.1

