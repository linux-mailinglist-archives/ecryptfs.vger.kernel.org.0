Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1101A2DE993
	for <lists+ecryptfs@lfdr.de>; Fri, 18 Dec 2020 20:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgLRTJY (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 18 Dec 2020 14:09:24 -0500
Received: from mail-bl2gcc02on2109.outbound.protection.outlook.com ([40.107.89.109]:20448
        "EHLO GCC02-BL0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725875AbgLRTJX (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Fri, 18 Dec 2020 14:09:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoGmDto+NWIGiADu5mJXGQsLg9IdFywtVDuD+XoJxR/aBbuj9XRX5+JMtn0p04goz2CZ7f5KKFr6Xpcdev9lDGqSgwKhGbaIVzhvKsmotvmqvCYfu/+e7Ik9CXeg8OvLY5UtTZPRPb3VGb/aG2B/Evoj1N6WYH9Jc1i9aJtN3rqLtWRoZDRT8oEmP9GY8mC7SE8WMCZNSrYTnZeb8yd1MI1dBSWpLLWWa8sSrI9HJgOdEZe/xAfyD2PEK64IS9KTiI5Ym5xYPL9asyqfB+UZ5tapfilgWPdXHNXC5mgYebsv/rlPHOdiIsUA4OLqSQZ3xN72Jappb8L3GZevBtcE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyEI+5m7p2McLoG4GQXOBhi/I+hC1X+zqP5O098yzZk=;
 b=U1wibQiAs7UZWPea4pQ/qTn7hnt0MBQA0+9rSFGVb1v65zefvynEjmp5ba89YWmykJ0hHtczUehKjcXYt+wvYlqaAym7H8SgF4fpANzmAAHtpNolqGLE2MlUensGm9P9KDu+jqKnoTolZobm0pZ50XYN+tM826uRb1Khpo2lhUtKZjd5IWWixYzLw4CkdqhcDnTeWYR/LzBuncmNb82L69zofIzHz4z+7gs2g4YqrwCNh2l9x66aEQ/mwlChPtmkYCBUVejLLC9SVUWcZMn3W10d/qZkhxcLHC2MjOYMwPqhMoFHzaxdT8ULz3Gm5/njL4UeDZgpP3soUHU2fNdYsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starlab.io; dmarc=pass action=none header.from=starlab.io;
 dkim=pass header.d=starlab.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyEI+5m7p2McLoG4GQXOBhi/I+hC1X+zqP5O098yzZk=;
 b=pnusoIyKmIFDupd/PegiT/KRUJSCTcvHldS89kGL7+jaBpi0hdylZscEpaBm19XUh1MnsRAFONlPoR1j7gnmQlfsIzq2O0j76tDTb6qmXgxaQhL3N+ur1alqCafHiMWDhPYe2ETM/w/a4l/ROZZvNs5Rrw7+3OlZ5c9HevrLn90=
Authentication-Results: starlab.io; dkim=none (message not signed)
 header.d=none;starlab.io; dmarc=none action=none header.from=starlab.io;
Received: from SA9PR09MB5246.namprd09.prod.outlook.com (2603:10b6:806:4b::9)
 by SA0PR09MB7177.namprd09.prod.outlook.com (2603:10b6:806:7a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Fri, 18 Dec
 2020 19:08:29 +0000
Received: from SA9PR09MB5246.namprd09.prod.outlook.com
 ([fe80::4c8c:c146:bb64:9baf]) by SA9PR09MB5246.namprd09.prod.outlook.com
 ([fe80::4c8c:c146:bb64:9baf%4]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 19:08:29 +0000
From:   Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
To:     Tyler Hicks <code@tyhicks.com>
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Robertson <daniel.robertson@starlab.io>,
        Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
Subject: [PATCH] ecryptfs: Fix inodes not being evicted until unmount
Date:   Fri, 18 Dec 2020 13:07:30 -0600
Message-Id: <20201218190730.141761-1-jeffrey.mitchell@starlab.io>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [47.218.202.86]
X-ClientProxiedBy: SN4PR0401CA0021.namprd04.prod.outlook.com
 (2603:10b6:803:21::31) To SA9PR09MB5246.namprd09.prod.outlook.com
 (2603:10b6:806:4b::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jeffrey-work-20 (47.218.202.86) by SN4PR0401CA0021.namprd04.prod.outlook.com (2603:10b6:803:21::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 18 Dec 2020 19:08:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f0e13bb-36d2-4726-8ffb-08d8a3884e58
X-MS-TrafficTypeDiagnostic: SA0PR09MB7177:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR09MB7177B6D0A57FD41AF4259EE5F8C30@SA0PR09MB7177.namprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +B0HQje2FMSw1ACeiuB23pRVbfYRx1F9LX95bewVcT9rcZOtMlWRcvKSZ8LqSMz9OjrtWTt6xl5Q+FVhe0XLex/iRYzNHICapIEsJupS9Z16rJXF6NusQhI+bGm3z8zGoNDvrQg7SCCPy5KeVCJO1sIkDdD0KRQCaoOtXGrgcD5v6DD5UQm7ku7cwn5yM4g3tfHzvUM1sMilMNaQARFNTaESAyroGI5PnOLYOlhDPHBWY2aG/rRsBtFqpSL85199YLJvgSP1/6+jrtRs/AEy6s7K1KVPZHG6kfBYEha16/EvKRiqgeVCdf/r73/zmcQnHT5HnKKp8ASJSwVOm3wjo7rxN0DNAKOPwuwnMby2VMAonqj2iH6jNAG/6rpTqurc54GSHsjjFtxZyvjlxsWcow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA9PR09MB5246.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39830400003)(366004)(136003)(376002)(396003)(52116002)(316002)(66946007)(6666004)(8936002)(36756003)(66556008)(86362001)(6916009)(54906003)(6486002)(66476007)(8676002)(2906002)(4744005)(6496006)(5660300002)(478600001)(2616005)(956004)(16526019)(186003)(44832011)(26005)(4326008)(1076003)(107886003)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?++y3hESJwxbX/o6aONQVhtlTJxAuG+6m1M3XCZUy2+UfxhOw+NKG2vESYIWk?=
 =?us-ascii?Q?ll0XqfPR/M36fi+r6gpsPJRFFHDaOmEWsrUcn0VU84LCowNJcEPOPrRs2K9b?=
 =?us-ascii?Q?Wmfwul7xtmH2inogYzMmCiun/ouuQI2y/PUpkMntRUt4UAYVIeW5Yz/UcRJV?=
 =?us-ascii?Q?+hqj5m97TCkP0rKWtDB4KVZwZs/4rhoLIfEuDS/KwEiJAJhmrVCoQnNFZ9zD?=
 =?us-ascii?Q?SJv4+jRmjJhGWZGPtp0/MNAd//j2hM0OFbNnPKwP0XDCHNLuo4fGXWI94NwG?=
 =?us-ascii?Q?N3LI99SLBjy7btjqqEZajFXkNeaoqB5Ier6qNrXck8kRyolasQZ9CVHNfpy7?=
 =?us-ascii?Q?R5XE2xB1A+Q0DUfKXFFttRT3I1E2OMSoaGzntuJSr3KTPw94IZQyN9pggxMh?=
 =?us-ascii?Q?PeXk0UYgD/f/w7oHfFwZ0qxps8KeHI6+z7WgMLGt84qye7mtRscp5FxWjBCw?=
 =?us-ascii?Q?z5tTmFC08Tbep6RigcrNIl9QcY6awT4k6A0KIwjqCAs0rrBl4nkg9FCttyb6?=
 =?us-ascii?Q?Q3Di19LaRsRGdz69xHn9e8teu14+ybF2uRSySvf9xnmAr7IaFEFSp4J9gklY?=
 =?us-ascii?Q?9Aj3SXAtk3sR/CP2aWT8CeS8YpFwAQa1ehW6E8zFhyJuNeCrlIYJeTqrPAwR?=
 =?us-ascii?Q?cii5Pc21FtjjSuCNitWV9oEqv1y6XfXHjpbedpHiDn4BQIfo0Km/Xnv8lpsp?=
 =?us-ascii?Q?hSb+CKtyfyjyza1yPTlQs08uHPyKdO2K8+dB+AFwamVZNZcASktnI5jtr/Ka?=
 =?us-ascii?Q?kAXKNQYxm2tzof2LWm09q1ffA7eM8jGDhOo+QyTf/3CoLcfP9idodiWVTdSw?=
 =?us-ascii?Q?UsYOfdHFY3aJNazsX5wZwLr3XX0goczlHb3QXPjWO1bgXV47Sqz/R4cbPk+d?=
 =?us-ascii?Q?ph7GezL5CbDaBeHrYFzsDdrNgisWBfXYLfykHt4FlsfL6bOT5ZkBOaZ/u/yS?=
 =?us-ascii?Q?12uFxW/bhXv8eno08K3Y2v2rnPN3Go0+SnjYJ+91rZehNtKwC3PaXGNzHugi?=
 =?us-ascii?Q?WlFR?=
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-AuthSource: SA9PR09MB5246.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 19:08:29.7475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0e13bb-36d2-4726-8ffb-08d8a3884e58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqyj8Gg6K9wouHOD8nue3zsV4HCSjQl+1EdVxWk+WoieKYuGXjvGay8LIMgpZ5bp79PO83BGKSvNloMMSbdnCujVx5w1TXqh8TMtSitLvMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR09MB7177
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

