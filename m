Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BFE326916
	for <lists+ecryptfs@lfdr.de>; Fri, 26 Feb 2021 22:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhBZVBy (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 26 Feb 2021 16:01:54 -0500
Received: from mail-bl2gcc02on2131.outbound.protection.outlook.com ([40.107.89.131]:23904
        "EHLO GCC02-BL0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230434AbhBZVBk (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Fri, 26 Feb 2021 16:01:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRgoRGWWAda4nuZ939KKjbogtbzXiMQM1tIPiRPN5nuFEsQ9Gd6JDvwMehp5erjnXqtfVRePn3yLBcbMqSWEsgPRAGSts5Pv8eKHqJ0sPG8lXpnbsFC299Z7zcETaj7Ew1jD3hJ9U39Cmue+ec02p4bIG2F4YSIfHzwebFu/vqFccKPLdkYg1wEqIzWO6rntE0kfe6nD1nDgxWUT57bEy1uO1q3bPk0bCMpwuxSzqh0g5o0NxTrhojDzXO9P/UTNXwqUxzgwwZ3ZUKtD4BmbFENXqOsNLOv3IVFinVe2PJb9ZMVOT6XI9Zh19DTThrx15G3T6WkJpy0BIuH9lWuyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mquy+E8E5+aNzmEJNGxO9kE1CgZy5cXnnr5YVr9in68=;
 b=jkfnd4dRybLjdlPwN/zya0lVPku47MukBd6k6YGySl9gJFAmHjINDXkz7PAp8nKxzcUJspslTKvxHf4/gRGhpyPHgKphzkYTP/uCe85KOFLqcxIVauTBImW2VwLwG6OdRsk0pahbyKwnCccRuiBs8GkDlHr9OrGkfazZ9pup383hI4NVChKMpwaOC6vfz6V25rxsepfd4CV5HKpQk08AyQRdZnHY6AzblZP0uZA+125RyeN7TGFXjXDb64plBu+jD6kc+mShv+d+SlUa1JcgMD9LJrXiUV1vffkAmjHZwFEJ0S0719dQKFXsPM4t/AMzofNForTE4Hl3BQYhoX+QlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starlab.io; dmarc=pass action=none header.from=starlab.io;
 dkim=pass header.d=starlab.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mquy+E8E5+aNzmEJNGxO9kE1CgZy5cXnnr5YVr9in68=;
 b=GRhTNfn0coOLkSZKzCWm8vYPagUsbzcvzpmFnU1XAQNivWbPiV/0FRpVYXutqXvXLLMQ8Hb4wrSssei/o7vGDLPqZo7CVXfzHoMtwZbaNL9g2CN1MX0EtNkPhadcHUTG+mv0zXWb+yma/wIJBtrHqZKZ0Aj6qhoXizNORLstBlY=
Authentication-Results: starlab.io; dkim=none (message not signed)
 header.d=none;starlab.io; dmarc=none action=none header.from=starlab.io;
Received: from DM8PR09MB6997.namprd09.prod.outlook.com (2603:10b6:5:2e0::10)
 by DM8PR09MB6054.namprd09.prod.outlook.com (2603:10b6:5:2e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 26 Feb
 2021 21:00:43 +0000
Received: from DM8PR09MB6997.namprd09.prod.outlook.com
 ([fe80::6502:414c:a91c:8c38]) by DM8PR09MB6997.namprd09.prod.outlook.com
 ([fe80::6502:414c:a91c:8c38%4]) with mapi id 15.20.3890.023; Fri, 26 Feb 2021
 21:00:43 +0000
From:   Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
To:     Tyler Hicks <code@tyhicks.com>
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
Subject: [PATCH] ecryptfs: fix kernel panic with null dev_name
Date:   Fri, 26 Feb 2021 15:00:23 -0600
Message-Id: <20210226210023.77597-1-jeffrey.mitchell@starlab.io>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [47.218.202.86]
X-ClientProxiedBy: SA0PR11CA0035.namprd11.prod.outlook.com
 (2603:10b6:806:d0::10) To DM8PR09MB6997.namprd09.prod.outlook.com
 (2603:10b6:5:2e0::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jeffrey-work-20 (47.218.202.86) by SA0PR11CA0035.namprd11.prod.outlook.com (2603:10b6:806:d0::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Fri, 26 Feb 2021 21:00:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f9fdcdb-f239-4491-bb68-08d8da9994f4
X-MS-TrafficTypeDiagnostic: DM8PR09MB6054:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR09MB605414A2BAE4414005FCC4EDF89D9@DM8PR09MB6054.namprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rf0UiOI6OZP52v/lW8LYD7c00RV2VU3hQsir5Ugbv0OflcO+JnkTC1P4ATFNIMxYCYzii1/NS2GmmC3fuPCCX2rt15+cXoL624c4PjfBRvskPkOfAhUFEkWtJ+Lfq585N+tSVuWasVMlHkcksBY76qUCfgDUwxtpu2HX0tosFEiog+TOvcE3vIcEpxfskAgjAwR+smdz9UEpRW5sIXXeppYJpBQONJl8oIvPpPrnayJdF9uOY43eimO3B9L1TGJYucuOIXkXxD3lLVoNjl8plY1xQE5KQp+7cdf5uTX+xJwaiV1FA8PEv/Cmfyfsxs5Uj5WW2NzgPQX971Cpea0De0VA6zCwUWh54JbnJnc6FPjNxBUjNsloUrSa+/DQHUjbwgrKO9bYTplv9xHptL7QC1sps6/Z3szi/nkv6oiJ05Nq5bag0TsSOf+CBh1Tc4KCIw1TbTe+N5K0ahf3WMcLMKgkbDX53iAP0rDWUsFqV4z9P/CSfUK34X3I6kl2UtVndRvxQPt2TjBoW0JisGTiQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR09MB6997.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(376002)(346002)(396003)(366004)(136003)(1076003)(36756003)(478600001)(66946007)(66476007)(66556008)(44832011)(8936002)(8676002)(186003)(86362001)(26005)(5660300002)(16526019)(316002)(4744005)(6486002)(6916009)(6496006)(4326008)(2906002)(6666004)(52116002)(2616005)(956004)(107886003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DNx5dyWVP699S03vUyHQL72MtbJ8+8EiIteTV3G+KzLpSNnkqqHO3nsoeHd3?=
 =?us-ascii?Q?V+nd3TjGPgKK3R+Pv66lD9B2cDarZekfJpdbJdeTstDCfjuBrLxxjHuhj3Ck?=
 =?us-ascii?Q?BV8NsGIMgEoNF7phEBW3FHN+rmsyp1ab1G4qnw507UvXMgftT/6lg63h0kE5?=
 =?us-ascii?Q?FQU6E2Yn7xTdW5/WjKwcjcv+gZ7dWEqp7Xc4FtlHYadjqDVYIaXQ1SLmndAO?=
 =?us-ascii?Q?TJoBD6Iqr0c+W6tzNWoAuTZo7IUlVx8CZwA+k4AubWMtpxyXGMPwEi1XLm3r?=
 =?us-ascii?Q?18Q0jfx5yY7FNzLz/gzfXfe98EmQpWr6FSJhO8k//P8qtLi/OODnFLfZVfif?=
 =?us-ascii?Q?XlzZBjsw5xK0/v+B39xpFhEw0DRijFy8hsYIaCctoWI5Fv+MM6705pA0jDFC?=
 =?us-ascii?Q?hgLKt4pNLbi1N2RBYhUe4l4wukcCMkwofG+owGvFo31e+zMYi7d5HV+o4zqf?=
 =?us-ascii?Q?xHMOvOTOYLNA4A6DYBGup+yjx3rX/5NdnVB0+GDStBZMW49fO7PHvSx34rOb?=
 =?us-ascii?Q?xtNeaH45uZoZTxkTy5wKh0vukDhaoDonDq+noveIV0dEa1HDuwmSyssMUW5v?=
 =?us-ascii?Q?8BMNmskmu16lrmYGxrwlVHyaQcn8Mj+G6ohFKG0XSyFdgUzRZemaIZtWLuV1?=
 =?us-ascii?Q?3qOkxidJcujWSaMA1AwBB+KShc9dV6NR+SIzEU/ZWYZvgjmc7dfhyDXT7o3k?=
 =?us-ascii?Q?+bHHLKBZaaRawa/PD1lm7Tk601PnbceBESGKF0X+p7+x7BoGwya+MGUrkNBW?=
 =?us-ascii?Q?s6f+dmSvOatNkVBsDDy194VT8h1pg9DabcA5pox+1zR6pYaM2JSbFp1suApd?=
 =?us-ascii?Q?7bCjbcc4kFdlOyWbU6QJAgLf6fsFMUhPtLlRMERC11atNLH8HNNHrgtgNqx3?=
 =?us-ascii?Q?W9LWjyg0yJmxLhVbs2UL3Z+sMRh5xi4523YCgk1HgDFIx3LpFHgGS/vRs58q?=
 =?us-ascii?Q?KK7qn5Oz8ss7VhLoOxWqkf/ntUxHkhNq94g84/9qefycv+aK1QPx0U7A5zdn?=
 =?us-ascii?Q?qzrKypvw1evCZJFpdQCOymriJEfrCTUBqGzXHcGyfUktxqD+dr19PYd1xKyN?=
 =?us-ascii?Q?yRJK62AuBL8tBEFJUCVy+iYGHliGyVKOEKoFsHyc8OiWowE8Nrmw6QjKOL78?=
 =?us-ascii?Q?BUkCMbS2Qp26GDV81YbXsbanhaqnJaKPe4ntB9lBhPQsQOap8haMc+UwyrMp?=
 =?us-ascii?Q?mCby5hWpfLUQ7njGnc19HhVooF6EpBzZSq2zbjbtghXypj2qWl+KQKnilhaF?=
 =?us-ascii?Q?vm3RPJC3rLRoNNNhF5Hme2eam9yVSr4I+goyAwEfz7lD9g4Pfh3gZdbmfWnA?=
 =?us-ascii?Q?EWsiGrTnOnBytV3oOxPnpBaG?=
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9fdcdb-f239-4491-bb68-08d8da9994f4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR09MB6997.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 21:00:43.8008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xThXhMaHZbzeR6yrWwB0cYeAFl1vCEnlQJ4bv0QlwEkFqEsWN7uZgCvqsmODS1r6IsCc1H+IzDk/eypC3V2GOmLqUUSv9ySm4RQ4i5FpsDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR09MB6054
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

When mounting eCryptfs, a null "dev_name" argument to ecryptfs_mount()
causes a kernel panic if the parsed options are valid. The easiest way to
reproduce this is to call mount() from userspace with an existing
eCryptfs mount's options and a "source" argument of 0.

Error out if "dev_name" is null in ecryptfs_mount()

Signed-off-by: Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
---
 fs/ecryptfs/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index e63259fdef28..b2f6a1937d23 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -492,6 +492,12 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
 		goto out;
 	}
 
+	if (!dev_name) {
+		rc = -EINVAL;
+		err = "Device name cannot be null";
+		goto out;
+	}
+
 	rc = ecryptfs_parse_options(sbi, raw_data, &check_ruid);
 	if (rc) {
 		err = "Error parsing options";
-- 
2.25.1

