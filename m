Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44FE30C3A2
	for <lists+ecryptfs@lfdr.de>; Tue,  2 Feb 2021 16:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235433AbhBBPY7 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 2 Feb 2021 10:24:59 -0500
Received: from mail-bl2gcc02on2123.outbound.protection.outlook.com ([40.107.89.123]:37632
        "EHLO GCC02-BL0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235283AbhBBPXx (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Tue, 2 Feb 2021 10:23:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFtdZDPyxTBulhTFC7m/Mwxlin3v6RGrNviRLnSho0h7u9XjU+k/yN8BkJpxwakBdfNCe8pQBJQ6a3oqF1F5QgY2e/85ZT6wxrwl4oH1YOUhw8voxpXxLeBZAz2zsNIsQpW+VV+ouCwHAYEPmJykDnG1uhvcG4Rv2rRhy8JZUCyW+QltyyJZ2UaywkwuXbiUkQMoqSXtWKZjqDNft48HltxEqO7BFr5wFSU/7Sh/irvCkCGm+qe4i5wic/a6Na8ifECB9E+O1/v5U6qyUGy13hSPywxlftExgGbyq7kCzwy/0M9FauUuwbl07M6i2JpJFiTJjX0EBpT1305o23oE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNIAgXiz35qPrOCm4jrHFYTLzsz0njzVwryVgxgvqbk=;
 b=XLyDDUWaPkQ6p0VEcwDMUAAVi1deElHl0oFsvQ+6/dUbbQzfTJXEp0l23ipcHwel3v0oc5oYZ4yzcgTyW/KHFX8drzgVw8LH8gQAffs0ZsVn8kMm/qbpQQRrlLoQY6cyMxYPx9ae7sb66rusUTp0dYjPf4SlXU3++IJ8rM5QuZgSUqNyK3bvaUVHks5HPfWLoh45U9xyuqDMDeDEW+ZnsVVFyHDDrcEaU6+3kR3906OGTGITtDq3Ut55PGsMwWy8B1NYLKDxWmxI0lNooNo1oLciMpLlXXgVuGNMYW1Xcgp20uom+zUk6lvjEam7ljlt1hx429WD+Zl/2rbdNBBE8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starlab.io; dmarc=pass action=none header.from=starlab.io;
 dkim=pass header.d=starlab.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNIAgXiz35qPrOCm4jrHFYTLzsz0njzVwryVgxgvqbk=;
 b=MAU8m7kmjBF3Zt5ncm+1Oh/IPfSdYhIXZeQvZYXme8dB4Jc9dsjSnwR31Ub7ZjZIfRvrg1+si+mzDc8AXE4JYbGWnrsEWrWwML6OiMD0MOKKbpd8Bzr+ISstlzQ1/gX6IVkn2hoPZTY1QI6ls/tA8w8YtyKZohhPSgzO3ZOXlyg=
Authentication-Results: starlab.io; dkim=none (message not signed)
 header.d=none;starlab.io; dmarc=none action=none header.from=starlab.io;
Received: from SJ0PR09MB7008.namprd09.prod.outlook.com (2603:10b6:a03:263::16)
 by BY3PR09MB8257.namprd09.prod.outlook.com (2603:10b6:a03:349::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 2 Feb
 2021 15:22:58 +0000
Received: from SJ0PR09MB7008.namprd09.prod.outlook.com
 ([fe80::c541:560d:f3fc:2331]) by SJ0PR09MB7008.namprd09.prod.outlook.com
 ([fe80::c541:560d:f3fc:2331%7]) with mapi id 15.20.3805.024; Tue, 2 Feb 2021
 15:22:58 +0000
Date:   Tue, 2 Feb 2021 09:22:55 -0600
From:   Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
To:     Tyler Hicks <code@tyhicks.com>
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Robertson <daniel.robertson@starlab.io>
Subject: Re: [PATCH] ecryptfs: Fix inodes not being evicted until unmount
Message-ID: <20210202152255.GA3383@jeffrey-work-20.04>
References: <20201218190730.141761-1-jeffrey.mitchell@starlab.io>
 <20210130170640.GA58096@elm>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210130170640.GA58096@elm>
X-Originating-IP: [47.218.202.86]
X-ClientProxiedBy: SN6PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:805:f2::41) To SJ0PR09MB7008.namprd09.prod.outlook.com
 (2603:10b6:a03:263::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jeffrey-work-20 (47.218.202.86) by SN6PR04CA0100.namprd04.prod.outlook.com (2603:10b6:805:f2::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Tue, 2 Feb 2021 15:22:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6722f37-ecba-466c-1ee4-08d8c78e6bf8
X-MS-TrafficTypeDiagnostic: BY3PR09MB8257:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY3PR09MB8257BAC05240869CCDE63797F8B59@BY3PR09MB8257.namprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xfu52gR+/kHh+woYvAvTEo4U8G+c87loAExi0HJzO4lM2TOwxWvBtCTFlZGG9NEoSRKnL7TmqKzaNh8p0XD03e7a+ewuJ71ty76lY39SNjIzrhLAgyZthC1hzgQWHAjVvrmG5HSMwjTIx4IHmM9tgTvePcZfkkW4KaQr+Z/YwTi6+S+EcmyVuQYxcBjUgBf3I9juYRffmsiqktmdZnIHRHwXeQFAlbg5DHs5Et7SdWy6BY2hxhUF/pWjvweiKW+YeLo4QAwWwF0pnuDtkE0nHyVzvCnuw75YTf5Bz/th0m8ON+h0gyd+Fh3LdMMHDGJw+e/TH2pTZIp36r0fudhN4FLfhM1uJJyDEa3qSyCdQIUhuzmDh81n2avIyZk1of4eOR9bdho/AvLu/pkFHJ7y/Btruig0IW9wKeVlAILv2Nq1VvS44FrmoPuf5vvY0Qk8yzNk+KxPIeI4Cf1ddgP4lhfnvqnssq7AVKFEC6ZYAXkgH/dCrAZlC0XOBbSaLWcOWomNiHPwmMjGDo9x27AieQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR09MB7008.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(376002)(136003)(366004)(396003)(346002)(44832011)(6916009)(316002)(14286002)(4744005)(86362001)(26005)(186003)(8936002)(16526019)(1076003)(5660300002)(2906002)(478600001)(956004)(9686003)(8676002)(6666004)(66946007)(66476007)(66556008)(6496006)(6486002)(4326008)(52116002)(107886003)(33656002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TP5ABj8WUeSAG17dZPr2Hr7hQUhH4kpAdBR3b9H6Hm3gw4Coc9OzWVZ2Xkrd?=
 =?us-ascii?Q?Wee4Ozdcgj7P2N1cA83BGJB1IdwXESXknos0xMbwYqQPTpE++magjbfUbOG2?=
 =?us-ascii?Q?hU4oheWPUtetGDjoboLAVk/zH+3oxkXsk7Rx0XYo2PU0N2XSrF2CvVklwODU?=
 =?us-ascii?Q?8ZoRHhFdOQTArwt3k/w7TngddEsjCOjtXmNvmJ8l/vFG1ur4uwK1EXzbubWn?=
 =?us-ascii?Q?KnO8wKdJ3D1OAuiTeup3gOdNqnDvigYEIiqmTSWDLBEfWIMaXF5AOknq+2mA?=
 =?us-ascii?Q?NG/l9dq/MNOQEsFBEzlLaX00kXG1Y/3g4hL+OKht2GU/2uSVrhkxMAt8oyp0?=
 =?us-ascii?Q?IEyVrMNeeXjPmQ+5AKuU0H/4pAhg2kq/VqmfBy8aW6djj2Pqe+Arhvx8QVxu?=
 =?us-ascii?Q?iyWysFXfLk3pDEcuXkykbtfolTrbmmAA+5nmOJbBuK1tB6Sk02rBmmpHzTzA?=
 =?us-ascii?Q?1Xw42BUO0XARukvAAgrb0faqwGDzoXXt9PM7nv3tuOREkhwawgNE3f6UDh7i?=
 =?us-ascii?Q?+bNBEtuw/14dHMMAqwRKsjgNpysUy5cKLS+Dbj/O9LSfVdR+FVPGxmjOrmdz?=
 =?us-ascii?Q?gx0RLyOExH0AeFvoxBmsnjcaSM3f+K7zxlZ2FcX53KFk2uv16krgwgkyZMbr?=
 =?us-ascii?Q?bOWZPCnXzc/s7bDY8KFset+Klr0bKi3OsKeqIXW3RJuND6Tukb+HxxZ2pYdY?=
 =?us-ascii?Q?IcV+Pfdl7GkRDO3TJK6g0v7hemLS/Ua2Zvv3FiB1q6MGfhdzLX5wrvO3G7iZ?=
 =?us-ascii?Q?c7ms/Iiwem/gvfEM0jnGNEE2x/vYQIqHcphnW7IMCKANSTOw57wig9redJzJ?=
 =?us-ascii?Q?jsfMsSVtceOeYy8KbpsEVuuj4WwSQtNNk3Zf7PqkEyV9gB01gwFiMl3GH6WR?=
 =?us-ascii?Q?xlToXmJsO+meHHXbG6ggjfxZ7zhoZj2pQ3sdXeWd9aeoYiccyOIHfo+ylJ3+?=
 =?us-ascii?Q?mFPGQFkABjuUq+1VFfUrtMEeQzXMzZ3Vhx5rt0MOzB+Fb1S5ptFv6yAa2w0i?=
 =?us-ascii?Q?do7RbWaeXTRtdFkq6e/SDdTJ00QgiGKCGR4eWe73Du2Kf5pvQN3z7TyaKvQ+?=
 =?us-ascii?Q?CsX5cgqW?=
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-Network-Message-Id: e6722f37-ecba-466c-1ee4-08d8c78e6bf8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR09MB7008.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 15:22:58.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnpGELh8TBqI47mtPZpLU+VOsl47XbHLuJPyBZ6Feh/QPmN5oC/TacA9fNtd7i7Kzn8HF+n7umgC9SHIy33mwoK+lkrp1JPW9XrSzhYOoEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR09MB8257
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On Sat, Jan 30, 2021 at 11:06:40AM -0600, Tyler Hicks wrote:
> Hey Jeffrey and Dan - thanks for the patch! Unfortunately, I think this
> would allow the eCryptfs inode's nlink count to get out of sync with the
> lower inode's nlink count in the case of direct manipulation to the
> lower filesystem.

Hmm. What if I instead synchronize it before calling vfs_unlink(), then
call drop_nlink() if vfs_unlink() succeeds?

> Is the condition that you're trying to fix a result of going through the
> this code path?
> 
>  ecryptfs_unlink() -> ecryptfs_do_unlink() -> vfs_unlink() -> nfs_unlink() -> nfs_sillyrename() -> nfs_async_unlink()

Yes, that is the code path that causes it.

V/R,
Jeffrey Mitchell
