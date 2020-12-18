Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F9B2DE999
	for <lists+ecryptfs@lfdr.de>; Fri, 18 Dec 2020 20:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgLRTLN (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 18 Dec 2020 14:11:13 -0500
Received: from mail-dm3gcc02on2116.outbound.protection.outlook.com ([40.107.91.116]:12203
        "EHLO GCC02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727387AbgLRTLN (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Fri, 18 Dec 2020 14:11:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZb01vJT6xJa2qjnJFdIXd1psshkbFwkHl2YmfjgXPBpSIKdAIb/kx5iU7K53TEttOSWZEzFJst8Qbcd3829oIdjnsUSz3ksoDfjtzj907U8NOwiopOuERO2UO/rZyNzaTCPxgOyURATDW8LrkUel1pukPpwd16VCocRmBnhX7/HFm2dQeyxat+yrAGJZ/swlPzEEKpeM/Yy3V8Wpx7h9V1TIwA+HtQkfDb5pKEKWYbrlx1C61TtzO8IRm1pgDTbFpz5NPNDkz4fBga0q7rRkis+G/RlATPMQVpLWH6kKV+iN2DxGZRkhDSUAoK8LUkcz9edJgIzPY+vahpzah0l3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ7ETLd9ZhdNzi3WMOQKqVsfjcA8uoQgR997kFTMUg8=;
 b=hNHYPYJ9tdkT1YOLu9ptYZrHZr+odep7NnSd35p7yTt7tw7zvQ5eaxppx8/wI8O/ii6029+1cPfoL7cWibBx/1cn2JiNgn1G83TbRMAZJ2eLhcDrOcG5Q6fWq+BIXHwyCPrm4mM4gJsfQG2+xvrqKAQZUiU0ZVhMRxrs766jY828i+Ws5cG41/TEl/PA6me7aomuhfGG/C3v/pIfG0gW7hYhMluIzNuP1JfniM1zUUhJsEgvaAFd368APTVRI4Jst1pedEoGkEtGa6X7csNSw7hs88Efa1BLE+PuwfD6aRzKhWSoaqjlXvg26VyGMxipOGBKOy3p+twR4i7X9cfJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starlab.io; dmarc=pass action=none header.from=starlab.io;
 dkim=pass header.d=starlab.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ7ETLd9ZhdNzi3WMOQKqVsfjcA8uoQgR997kFTMUg8=;
 b=HPVUpgczHwBugnUO87euii6DRqL9GAbh+yMVgs6nzky0h852OYMU1Tb2g/zlAmmJ6Jzu6lytsmymX1kd9T2KHspZbSVMAfeuyCN9T2wczgywpVFcyxpSOJbUe4Kh6DtsRiFzRvztkwq6scp/c6AaFLfBo2qHFZdXglmTTa/0qE4=
Authentication-Results: starlab.io; dkim=none (message not signed)
 header.d=none;starlab.io; dmarc=none action=none header.from=starlab.io;
Received: from SA9PR09MB5246.namprd09.prod.outlook.com (2603:10b6:806:4b::9)
 by SA1PR09MB7646.namprd09.prod.outlook.com (2603:10b6:806:172::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 18 Dec
 2020 19:10:18 +0000
Received: from SA9PR09MB5246.namprd09.prod.outlook.com
 ([fe80::4c8c:c146:bb64:9baf]) by SA9PR09MB5246.namprd09.prod.outlook.com
 ([fe80::4c8c:c146:bb64:9baf%4]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 19:10:18 +0000
Date:   Fri, 18 Dec 2020 13:10:16 -0600
From:   Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
To:     Tyler Hicks <code@tyhicks.com>
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Robertson <daniel.robertson@starlab.io>,
        Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
Subject: Re: [PATCH] ecryptfs: Fix inodes not being evicted until unmount
Message-ID: <20201218191016.GA141831@jeffrey-work-20.04>
References: <20201218190730.141761-1-jeffrey.mitchell@starlab.io>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218190730.141761-1-jeffrey.mitchell@starlab.io>
X-Originating-IP: [47.218.202.86]
X-ClientProxiedBy: SN4PR0401CA0032.namprd04.prod.outlook.com
 (2603:10b6:803:2a::18) To SA9PR09MB5246.namprd09.prod.outlook.com
 (2603:10b6:806:4b::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jeffrey-work-20 (47.218.202.86) by SN4PR0401CA0032.namprd04.prod.outlook.com (2603:10b6:803:2a::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 18 Dec 2020 19:10:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d77fdc9-6bcb-45dc-6263-08d8a3888f4c
X-MS-TrafficTypeDiagnostic: SA1PR09MB7646:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA1PR09MB7646AC9DEB802B7CD33AD6B3F8C30@SA1PR09MB7646.namprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ZJOMFaHrVKg1/0tHZlcFu6XUu0mQHSxajZCd0eOrldLcVzCpRLrpYU4wsDUIiBD1gu/weqzRovd/oVduYcAZvQp5TN1lgV/nVpXjDwFx1RfMkZ7Ja8xGDgVWsgN/hlFgnmaG1qrRnEp2NMw4mT3phNKET0MPtkgfVekz43U5VPq8jssLwzmeiHHweMQTmhsgmZTRNKYmHEV08Mz9W9X1o0zCgaTbHKhJh/3UIEWjgalTfUrJF2paTfRQhlqZI7AqtceUcJspkI1l9IVocLSryHvnoLBDYIt9ShcexiDz0K7Rw5vcrQY8AM5h69lH99PSGcW9TacsS9C82a2TE0RWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA9PR09MB5246.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39830400003)(376002)(366004)(136003)(396003)(14286002)(33656002)(956004)(86362001)(66556008)(54906003)(6486002)(316002)(44832011)(478600001)(107886003)(2906002)(83380400001)(26005)(186003)(8676002)(6496006)(8936002)(9686003)(52116002)(66946007)(4326008)(5660300002)(16526019)(66476007)(6916009)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XRueBOl3WtvJI7n1Cn7dfr1cwtToEh/MCIRanLKB2fUD02+Mwb/s6U84Dbri?=
 =?us-ascii?Q?ujxaPXv8X+D3riOytM6uBJDq+WgueFoTyvwaRjuvyPagDdMuE148HSgpVNF9?=
 =?us-ascii?Q?yKb2EKUduOXTztVOksUSzSk9I6QSu000KwsAzOhBFxtyiLaHR4zC7zD360bi?=
 =?us-ascii?Q?helmtqef3oX4jD/SInM/wJ6NTjZzCybJMegCxBcDFYYVRo5IdcmgKJgF7FH5?=
 =?us-ascii?Q?NfDViDGsM6kDZs49+uKinQgOoHu87jEfbWbWek0XxvNr/FG1zO5MV1XIkqpY?=
 =?us-ascii?Q?dZZZRTD3O05v9XIKWgvNp7/hmgbgNhPLXN7ixvQQNpdlFgtNlj+AYTN0V5Sm?=
 =?us-ascii?Q?6uyuvr8RtE42tM3D1forNWmlCyTMO05wZtJYSgDaMKfJkRSQCn2h0TPPJ5CY?=
 =?us-ascii?Q?ecx+vLOpiFuzfJf3p0lj97MNvrK872POxxgtkX0FBhTiuFB0GIsJz51vpN/a?=
 =?us-ascii?Q?l6QmF5cuKMufigj99PD7gYvl06hho+dwKxQyQ62mFyI5YWyU7vbGFSLkEScp?=
 =?us-ascii?Q?X0UBCxS15mgUmuhM07lvdkMxAAek43G7P0+jaNmPodB7vxJq4vdLp+Dss48H?=
 =?us-ascii?Q?Itn+8QFrbPaSVNwBZemVvLl3kbJdsWisCCry+TTdsJdynFud4Qs0EGzMC0w4?=
 =?us-ascii?Q?vxCjDnR4cWa8famqa0iJa54NuLRMsNUfStaYiooFATHq7hTc6K0s1xOfmyfl?=
 =?us-ascii?Q?7KKG1U5BZXeD8srje1MpcIC2lmmksZJAeZw09STqz+DkW9puO2kFPwbnV6tL?=
 =?us-ascii?Q?cktyZNFfT8OZ0AlN1S99rqn9yEB1d+3nhQCn49FOfdnR8GqcC4cntqb9t9uD?=
 =?us-ascii?Q?KhOBwJXBteia1+0UM74CsGoO/5tyShnfhu6mN41tS1haNZsQ1AdMj0TIhYaX?=
 =?us-ascii?Q?vVaamOTUtbsHcf8yBpVE+0U7l6Rd34MPJGDSteOKAJ3sXGg16emnYgxX0EYg?=
 =?us-ascii?Q?LKL+goOUeH3gDYxBHnOx0JZtf/GEXMpGUTrYueVDOqJ8zWaBN0atd5B1st57?=
 =?us-ascii?Q?ya+R?=
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-AuthSource: SA9PR09MB5246.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 19:10:18.6528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d77fdc9-6bcb-45dc-6263-08d8a3888f4c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdIYjCbNAQ+/uk4x6UfRXnr7DtDOOlJVvy4eQZ0yT3ugavQmRYc6hOvztD7YqPn1Fb/9vh3MrwAfRl5cjM7lNWyLOTKvMGfJzr8apm2aYpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR09MB7646
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Steps to reproduce issue:
Mount nfs
Inside the nfs mount, create back and front directories for ecryptfs
Use ecryptfs to mount one directory onto the other
Create a few files inside the ecryptfs mount
Set ftrace to monitor ecryptfs_do_unlink() and ecryptfs_evict_inode()
Delete files
Unmount ecryptfs

ftrace output before patch:
# tracer: function_graph
#
# CPU  DURATION                  FUNCTION CALLS
# |     |   |                     |   |   |   |
 1)               |  /* Tracing enabled */
 1)               |  /* Writing to files */
 1)               |  /* Unlinking first file */
 0) * 27804.34 us |  ecryptfs_do_unlink();
 1)               |  /* rm'ing second file */
 ------------------------------------------
 0)  unlink-1384   =>    rm-1385
 ------------------------------------------

 0) * 32828.63 us |  ecryptfs_do_unlink();
 1)               |  /* Unmounting eCryptFS */
 ------------------------------------------
 1)  trace-a-1365  =>  umount-1387
 ------------------------------------------

 1)   2.408 us    |  ecryptfs_evict_inode();
 1)   8.914 us    |  ecryptfs_evict_inode();
 1)   3.344 us    |  ecryptfs_evict_inode();

ftrace output after patch:
# tracer: function_graph
#
# CPU  DURATION                  FUNCTION CALLS
# |     |   |                     |   |   |   |
 0)               |  /* Tracing enabled */
 0)               |  /* Writing to files */
 0)               |  /* Unlinking first file */
 1) * 24728.81 us |  ecryptfs_do_unlink();
 1) + 20.923 us   |  ecryptfs_evict_inode();
 0)               |  /* rm'ing second file */
 ------------------------------------------
 1)  unlink-1333   =>    rm-1334
 ------------------------------------------

 1) * 41093.71 us |  ecryptfs_do_unlink();
 1) + 11.384 us   |  ecryptfs_evict_inode();
 0)               |  /* Unmounting eCryptFS */
 ------------------------------------------
 0)  trace-a-1314  =>  umount-1336
 ------------------------------------------

 0)   2.986 us    |  ecryptfs_evict_inode();

On Fri, Dec 18, 2020 at 01:07:30PM -0600, Jeffrey Mitchell wrote:
> On asynchronous base filesystems like NFS, eCryptFS leaves inodes for
> deleted files in the cache until unmounting. Change call in
> ecryptfs_do_unlink() from set_nlink() to drop_nlink() in order to reliably
> evict inodes from the cache even on top of NFS.
> 
> Signed-off-by: Dan Robertson <daniel.robertson@starlab.io>
> Signed-off-by: Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
> ---
>  fs/ecryptfs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index e23752d..f7594b6 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -147,7 +147,7 @@ static int ecryptfs_do_unlink(struct inode *dir, struct dentry *dentry,
>  		goto out_unlock;
>  	}
>  	fsstack_copy_attr_times(dir, lower_dir_inode);
> -	set_nlink(inode, ecryptfs_inode_to_lower(inode)->i_nlink);
> +	drop_nlink(inode);
>  	inode->i_ctime = dir->i_ctime;
>  out_unlock:
>  	dput(lower_dentry);
> -- 
> 2.7.4
> 
