Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8815E1CB1DD
	for <lists+ecryptfs@lfdr.de>; Fri,  8 May 2020 16:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgEHOdC (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 8 May 2020 10:33:02 -0400
Received: from mail-dm3gcc02on2092.outbound.protection.outlook.com ([40.107.91.92]:4255
        "EHLO GCC02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726942AbgEHOdC (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Fri, 8 May 2020 10:33:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRcPTVLkX220sv7/Ls8YZkuZ1aoXhZlEIvu2tlAC/NewM7xG1IpXKviMiPShl3z7Z2HK8b6AZ/+tZyd7KGeMmSogvdBISxxynyE6z3lozBmSWhzYM8V44mRKnkKVSJfyIxYWxfmmTVnbrVJpHjtEG+kLJgNteyoKF8ITBz9/ibKviD/ucovBdgRu+hN1nSuftQOBq32Sbzo68VscwXI4licwe1sAzk3ayXkn4o2+7V3aNrAPy23FMqjV1iNbBjR5JMtuJn2ZqQbnVm+pPYI+n8PnY+looyn4oIQby7Iddv8K253h7LPclE3Yx1hT90kmM+Sh1ECfRwi9DxvR64Y55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUBJF8gu1ywdxIwhBBofHoL5eSxbq2YQejsiLpqawEY=;
 b=VCfoHDtHjhLM2lJbdu4b0idxEw2f8m7F9qxpgyFCkjjJFLhM11hdb6ZIr3juDDWjoCRlP1z7ulfFZBZ8znOa9s2yiCuKgMSKrHGFfV2VLaJAUo5u0wQ/gCLdLyRA1Gl5PQpAri0ifyj7ukbx9GPCzEy4L2+R7ZKaspKv8KwqDykC+VWL0YI5iZxUiko64eK8lGCkamtj8/KdS1yYEb+OHomMNQ3hdC8q842dTrE5BKOabwrWxZeNvnHbp2VYvT7DbcdfyDZif0CQmJLxhaaRuLe9UUf7gnpGYljubw+TYc8ofmcYsamKb9CKrIAqxeJYwINBnMjc6oe3tNQvI9ozgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starlab.io; dmarc=pass action=none header.from=starlab.io;
 dkim=pass header.d=starlab.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUBJF8gu1ywdxIwhBBofHoL5eSxbq2YQejsiLpqawEY=;
 b=bLgtf05r41p1Tad6LvQfq1P3qxTzeV5lZph7U4DD3CQ0+uc96n6ch7yVgYg2Pd9EfqZ3YvdUa55FFhigOLZH9jPPxALm+R1fCh90RwzBeKsotoeROOBPQmBheHNteiM6bEKLVXVXaIhx7lPBItmz5pA2E5GXU0mwJzwhClynrKA=
Authentication-Results: starlab.io; dkim=none (message not signed)
 header.d=none;starlab.io; dmarc=none action=none header.from=starlab.io;
Received: from SA9PR09MB5246.namprd09.prod.outlook.com (2603:10b6:806:4b::9)
 by SA9PR09MB5598.namprd09.prod.outlook.com (2603:10b6:806:40::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.33; Fri, 8 May
 2020 14:32:59 +0000
Received: from SA9PR09MB5246.namprd09.prod.outlook.com
 ([fe80::a930:8440:6c90:8d88]) by SA9PR09MB5246.namprd09.prod.outlook.com
 ([fe80::a930:8440:6c90:8d88%7]) with mapi id 15.20.2979.025; Fri, 8 May 2020
 14:32:59 +0000
Date:   Fri, 8 May 2020 09:32:58 -0500
From:   Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
To:     Tyler Hicks <code@tyhicks.com>
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        daniel.robertson@starlab.io
Subject: Re: [PATCH] ecryptfs: Fix inodes not being evicted until unmount
Message-ID: <20200508143257.GA7181@jeffrey-work>
References: <20200508143131.GA7116@jeffrey-work>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508143131.GA7116@jeffrey-work>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: DM5PR20CA0001.namprd20.prod.outlook.com
 (2603:10b6:3:93::11) To SA9PR09MB5246.namprd09.prod.outlook.com
 (2603:10b6:806:4b::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jeffrey-work (99.61.31.14) by DM5PR20CA0001.namprd20.prod.outlook.com (2603:10b6:3:93::11) with Microsoft SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.2979.26 via Frontend Transport; Fri, 8 May 2020 14:32:59 +0000
X-Originating-IP: [99.61.31.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a43ad84-02a9-4c3a-45b4-08d7f35cb4ea
X-MS-TrafficTypeDiagnostic: SA9PR09MB5598:|SA9PR09MB5598:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA9PR09MB559848365B13EA5A24516FECF8A20@SA9PR09MB5598.namprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YiWjy+0Paha2J3o7AaaHDPppzquKpP9phvtHQg8t0UYQ8e8ZJWSwJRnWV76QAt2OGMbY3EI7PNNk6D4qFI7epRx6S0FGVPuLp2vWld0CnoAF2kGw0Mau6ZAnwkqrKcY2Cc5oZm21A2yHzeyNQu2JMip0EFI+cIfN0LD1i4brHoq0p6i6DWAHURQU8daPQW4I2xKDphKKRxrMZRGwPwx6EhEhqUuCfysnR6NQsrX0vGaqYMzF2Z92pcXF8lrQO4GQy8u08UhGfQFoop/xSeq8Trv5Sc8TSLLXkLRaB5ZaHi+C3fDiVfz/pss9Qv/1ajBaWvkXeABdcL5wIrQx74bFYqq4aTWjTypaRn83GYUpftblh1sXs/F+UMi1Mddjccx25ro/9PfgfvQFtolj8m0KuPaPjN9oU+seBLIWcIUbPAm4VwworES/68kp6uw6ctA9nLCeU7VgQBGl3YUdMQZEe2CCLmYZkFf82Dj+thzXjGZGKDRft5yXdbMmr98OsYGGw6UWS53gukc82MnHlezh7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA9PR09MB5246.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39830400003)(396003)(136003)(346002)(376002)(366004)(33430700001)(316002)(2906002)(186003)(956004)(66946007)(107886003)(16526019)(44832011)(1076003)(8936002)(86362001)(478600001)(8676002)(26005)(66476007)(55016002)(9686003)(33656002)(4326008)(83280400001)(83300400001)(83310400001)(83290400001)(33440700001)(6916009)(83320400001)(6496006)(33716001)(52116002)(66556008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: KBfKUEONkOBLhVfnk/lnTrXTAj7g2+XqEUsZH78cvPi8V1W4s+5hWDIn2Dt6O1lgnHaXuIvJdlDZjnu7ollqnNUiLKFckN++wamxb29hyNTpFy95504cw3j9qw5TfUOo0nJPm76Mrl6lrbq6tOAN4my7g3Ka+8TeimzXrofti/q3XHdAxbS2OCDv2aZyU91LcepRM/xCIRHnfzJZQIkLUWniEb1qC1png/9A+KbviSxeuRfl/2Gz4B0A32ON5ICRxSWu0tgViQPFjMzVlruyPsLvhoqV8E7vRokg7deLbiu47cdfRw46Dczreiv2UpNJs71t8Po7PFpw6+6z6P/W5Qs7hv9Pr50yuKWRVFyNZDTinN1t7ZEjgpv2LBXq6Mat+ipmftaYpF33OvSjVPOggEpmP7a7q9i0Mmnv2bzT50liGMxzD2KyOLfX66UPgE87qTxcRvw6C54OQVB5Pxe1p2CbXVPffKlJtcm46spRnwc=
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a43ad84-02a9-4c3a-45b4-08d7f35cb4ea
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 14:32:59.5650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4V1H88HyUympda0A/Rv+Skt0gNlDR68j/lSFy/06N+OAfleQT6Ge5ElC/ILf4on8H18R0YJRVvflyYP+wDQ9LBcEStiKAeBHPkm6qOG40e8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA9PR09MB5598
Sender: ecryptfs-owner@vger.kernel.org
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

On Fri, May 08, 2020 at 09:31:33AM -0500, Jeffrey Mitchell wrote:
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
