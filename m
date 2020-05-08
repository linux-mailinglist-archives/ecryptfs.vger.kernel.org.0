Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104271CB1D9
	for <lists+ecryptfs@lfdr.de>; Fri,  8 May 2020 16:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgEHObi (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 8 May 2020 10:31:38 -0400
Received: from mail-dm3gcc02on2127.outbound.protection.outlook.com ([40.107.91.127]:15904
        "EHLO GCC02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726942AbgEHObh (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Fri, 8 May 2020 10:31:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nu8+E6C7R8BPU1JI9FiArnFt5XIHa09AdygWkGTOs2hzM60ingTv7LPT/Rs4bqI2VTF1aZJtobSgdoqy1hz0PBcU6CzH51Q+3dP+M2goJa8Pc8UXpxi/Gm2qaA1ShvrISVIFGTC1zyeUwSBQef7PU4dwSuWTgMjfW61V51hg6hDtpps12DdXSaDXnatQWntQKux1YTc4XGDg+iwwSWlbJ7LS8zv+Yzoxj39ja15u3VTF3xzLFAaUZLCLhm7e002ccc+VKDKluO7B/Xg4SenlYIRqFPHpKMlScazHpe2uroUw6NSRVtzzmCpupahwOhZGl2V6pflmCzioWFW2/92jVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyEI+5m7p2McLoG4GQXOBhi/I+hC1X+zqP5O098yzZk=;
 b=m2QHoug+AnIMUFBnuwjItWMPyv/pAAnOuY2GbRyd6VZSEbr1gEyO8H1zKtpRgSOd4C+A+pdpcS5aZqNboij5uppvcSff2aqaE08F7fafW6b/K31ld6tu14HiD4n4VXhUVCeTpWVPf93DK1khlU5y07NRB+JP7FqxE+OSFcZCp0bLl5hZhut6pgv285LSQvaNBDrCtCK10IpOxveUfWC3hEd+S/zKa6ueEFsRc22Iqghxr8D6cOUaAAAJr6GNkY+7faSOegZbkyoa+50e7EPv+0gwVzQ+TqsA1dqOvAtaVfIkGcuqyKfW23DLY3g0w7n2vlfaSzQ7e4e2Xgmofl/VDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starlab.io; dmarc=pass action=none header.from=starlab.io;
 dkim=pass header.d=starlab.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyEI+5m7p2McLoG4GQXOBhi/I+hC1X+zqP5O098yzZk=;
 b=pCSZKpS9W80o/OlUZLw45dx35CS6Sbc4HJ/P+o5jDJxie8kkWgTm6WPAVYbtYRuI7o0Grpl3Qw+AxjH42dYrMvEWJzbQGAh8mzKOIdVgWVCTe4wCwGnKpOyf3/x5HalauiwygFM1pX7qOPHcfiDXPqKaqojOdKl9ETiUfcJ+bnU=
Authentication-Results: starlab.io; dkim=none (message not signed)
 header.d=none;starlab.io; dmarc=none action=none header.from=starlab.io;
Received: from SA9PR09MB5246.namprd09.prod.outlook.com (2603:10b6:806:4b::9)
 by SA9PR09MB5598.namprd09.prod.outlook.com (2603:10b6:806:40::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.33; Fri, 8 May
 2020 14:31:34 +0000
Received: from SA9PR09MB5246.namprd09.prod.outlook.com
 ([fe80::a930:8440:6c90:8d88]) by SA9PR09MB5246.namprd09.prod.outlook.com
 ([fe80::a930:8440:6c90:8d88%7]) with mapi id 15.20.2979.025; Fri, 8 May 2020
 14:31:34 +0000
Date:   Fri, 8 May 2020 09:31:33 -0500
From:   Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
To:     Tyler Hicks <code@tyhicks.com>
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        daniel.robertson@starlab.io
Subject: [PATCH] ecryptfs: Fix inodes not being evicted until unmount
Message-ID: <20200508143131.GA7116@jeffrey-work>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: SA9PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:806:a7::13) To SA9PR09MB5246.namprd09.prod.outlook.com
 (2603:10b6:806:4b::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jeffrey-work (99.61.31.14) by SA9PR10CA0008.namprd10.prod.outlook.com (2603:10b6:806:a7::13) with Microsoft SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.2979.29 via Frontend Transport; Fri, 8 May 2020 14:31:33 +0000
X-Originating-IP: [99.61.31.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5afe32a-3443-4b47-4559-08d7f35c8208
X-MS-TrafficTypeDiagnostic: SA9PR09MB5598:|SA9PR09MB5598:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA9PR09MB5598B259E5276B27D7B1A031F8A20@SA9PR09MB5598.namprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cjMIOPCrbmJM8Xxw4VjJyE58uDaBMR+X72zS/ryvU3s9uDe+2h6yHRRoFqZj+qDm/YwIBXOLZZ+om6oO7uCNC4PFGh0BYVl34B6AKd/X0VUg7l6liLzTk2O+gfMfaUp2rdHqD8SLt3/lC9VIIx+9uGGIZiy462xKHUKB8yagEh2jVJXKoXVG/WnZZAKTO4gGLalIL7YaAaAQbqdtqAFNhOTr1x8/bbwL1ieQKCR2F+d0CTH6uOeePvfE0oBI1lO3jkpQtu9ecNrYwkqlCtDPXATKpDnmLeWBImNOYjgNIqboQwMVZWQBXa2Ed3KHQDucwD2EPy1xpRJ/Pb9qkUNqCpVqGGMPbLuEU7z2QUdc6ltfithKaqs+Y0Xfvxjy8xBArATnsQkKqyp0DB1qfpK0d2QKdzrzgDHd9T7/T1vLnL1JumDQszYhpxu4ILhrqDhi4X4IQw1HgNmuVQaHVhQAdOY1WtHIZjneaTlNPyOHax5wldzPxb8Eat8/l2FkcJsWylS+SsT2Lhie2jzDkBCSXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA9PR09MB5246.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39830400003)(396003)(136003)(346002)(376002)(366004)(33430700001)(316002)(2906002)(186003)(956004)(66946007)(107886003)(16526019)(44832011)(1076003)(8936002)(86362001)(478600001)(8676002)(26005)(66476007)(55016002)(9686003)(33656002)(4326008)(4744005)(83280400001)(83300400001)(83310400001)(83290400001)(33440700001)(6916009)(83320400001)(6496006)(33716001)(52116002)(66556008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: rP4PU4NW96gnCbpwIL8mjoLThpAr/3fboQG6ToKfkvMrECAuuuiJcm1cOWDpKIbX5DWn3hH+/E6pYZrTEaUE2FK6AgfUmkQKTCB92rMnFY7JKt9He4GXquj9HKwwdSB2iu0f3SS9dfpB966oVqt0Ee9vUOe69fdODj8TqNjBnQ4kk6WnDuodB4vYHogkmxxLuDnAhMOK2A5FmZ/vXDdP1GjehYnscmnBqAHRgtJl6fq6h91wIUdS19AFdlTnE6bCH81t+tRWhuXqmzXtuKVoN9KBh6pq745l1VACZ95RVKJBsqa5nHbdep53Rr5fdWIww4TDcGKv1uucfy+TDfsPE5EdfzPlEZNreMv2rJ32IUpLi/2zB8WRwTNhRJgFMBvRnFGLOKUHYcXLUos4WXNWtBXGbBh5wjZR6ACtQutDF3xdq5OkClmWcNaVJeghoIolNTdT34ZDI2drpJdhNyGdi9xNJ4YRZfpTmt66GYRLbzc=
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c5afe32a-3443-4b47-4559-08d7f35c8208
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 14:31:34.2665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umcZylwzYklORDnsY7wNUFIeyCVOePQrUbwE2sZgz6S2XkfmQpeIWKexTIrrhCSgudEz95hbVWrrkYeK8yFYsBNovEwupIv6lI44sU/QuyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA9PR09MB5598
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On asynchronous base filesystems like NFS, eCryptFS leaves inodes for
deleted files in the cache until unmounting. Change call in
ecryptfs_do_unlink() from set_nlink() to drop_nlink() in order to reliably
evict inodes from the cache even on top of NFS.

Signed-off-by: Dan Robertson <daniel.robertson@starlab.io>
Signed-off-by: Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
---
 fs/ecryptfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index e23752d..f7594b6 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -147,7 +147,7 @@ static int ecryptfs_do_unlink(struct inode *dir, struct dentry *dentry,
 		goto out_unlock;
 	}
 	fsstack_copy_attr_times(dir, lower_dir_inode);
-	set_nlink(inode, ecryptfs_inode_to_lower(inode)->i_nlink);
+	drop_nlink(inode);
 	inode->i_ctime = dir->i_ctime;
 out_unlock:
 	dput(lower_dentry);
-- 
2.7.4

