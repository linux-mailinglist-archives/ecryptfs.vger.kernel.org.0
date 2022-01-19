Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED7E49397E
	for <lists+ecryptfs@lfdr.de>; Wed, 19 Jan 2022 12:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354126AbiASLa0 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 19 Jan 2022 06:30:26 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:1754 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1354064AbiASLaZ (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 19 Jan 2022 06:30:25 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JA8CwJ002457
        for <ecryptfs@vger.kernel.org>; Wed, 19 Jan 2022 11:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=SBjLm6z7daoM+tIRMi9uNxYr8XkTeND/d1uhOL5+DZE=;
 b=F7IVKReXHDJWwBvtBK2PsvLNSzaMsuKJ0SOTW5jnSNtsrGoSnuoSbGpJFgEyAwZYDHHv
 WFhWCPvNq1D7PiUKSXXQEl2mphl+a3Qc4XF3i1RhBfbI0IEUwbKnN6SnLRs7j5ovZpYf
 TQ0k6jDGuo0T8806vgmCUnaLdmPf5cGe9PR7c1f3NSW3E4JCpPbzbRcnxMY5HUwb4Ffo
 YSs8Bipy3i5dv4Pn4idqJTxVH8VqAv6P1OQgZdzbUN9xDjmcn3ggPOqIgldBNldp+mqN
 uagYy0toEt6nscCs9KpS07l9yJ4Tm63zwtfvAnJaTs1Z1cLmeFCcOQ+bF4hLYs9h+FWf nw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dnc5f4sbg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <ecryptfs@vger.kernel.org>; Wed, 19 Jan 2022 11:30:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JBK5XW037269
        for <ecryptfs@vger.kernel.org>; Wed, 19 Jan 2022 11:30:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
        by userp3020.oracle.com with ESMTP id 3dkqqq6cej-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <ecryptfs@vger.kernel.org>; Wed, 19 Jan 2022 11:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IU7QjZk3nmKk3Os+PCNVi8uDKryvW+5/79CrkSq7jBzk9R5Vr3D28MNwXjcarvLgbk1/Lpl4kDcrPJN4u1fkSDsSvxMZv5mR/YSXalVNguIKVMfFAHbn7FpA4VSRAa70hRNMDCS4luWA9oFwzQMv2sv9J1ETs/xHUb/7VqVqQZlIrsvxHnxCeS6LMGCjEx0xWRugjjFEHZKzHc7Z7iN7FDZRetGyXYZ8zOnJk6Kpgo35M1Vc27wO9yQmI7XRg1sT5DpdfVCResWGTNIqA0Kr9ww/zh5BMnGTcQCapXYCEsKswSAR3rgz8H43jpKTc6e/wnWATrotNgQt9/Ax3Mz/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBjLm6z7daoM+tIRMi9uNxYr8XkTeND/d1uhOL5+DZE=;
 b=oJUZTqd+2XVU+yv5o/I0RjcqqwvhqsaeouTb5F8375Y14GGMOxGm5swIqN06yZcVbABDbuau3IqkUwtGTmU/V16QxUZa5pQExprgIiFRy0X7BiGR8zfEDFaumIOgDGr5ZRywEbIPUI+1uXhWxeNLRTmgkkrmfueY6jBdnEEdVhDWswl10mKmewFihTANzPtEoghx1cSkZuEO0f35qL6Jr/OosDjnvRfZz+JqyAeJmg08eb2xNHlF4RjZvYW6IfRNAhFfKDXOQn5Q+QzXYwD7cn6lALfUql9Zuqxxi1hbyUtU8nNHpD9Ih+ZMkzopm/Ev5ydyH9wndbBko2vtyVLBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBjLm6z7daoM+tIRMi9uNxYr8XkTeND/d1uhOL5+DZE=;
 b=D25z1tyLbftcYKzfXmSrmudIziQzedTAYkWjUOS37ERvkB+DJLfL4sGczwKHWAgtVtqoy/W0sC4JFNAXO/b4hqkUmA22+sDMZh81g4tEE3XAfaGwyxJeoBarcacGqDUT+Ap69324jLy+nqH9wE5biEMjd18pvezquJKthnIwaLc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4545.namprd10.prod.outlook.com
 (2603:10b6:303:9a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 19 Jan
 2022 11:30:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 11:30:21 +0000
Date:   Wed, 19 Jan 2022 14:30:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ecryptfs@vger.kernel.org
Subject: [bug report] eCryptfs: convert mmap functions to use persistent file
Message-ID: <20220119113011.GB8111@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0188.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e845b949-2733-419e-d175-08d9db3f13c5
X-MS-TrafficTypeDiagnostic: CO1PR10MB4545:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB454532D6A94921EF234164AA8E599@CO1PR10MB4545.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VOGarEPrVd0SXi+me6oEtiEgkdYBuR+8fXJ1QOwLBr2ZjzLeRyr72DUtDRsPZ/fp1RvUEll4GBDPhk0vb4q2jkALggpx7p7Lfxe99KBw/21JJaaDz9WxUHjLEuAa1jAAsR4KH2YLsaOgCInnWmNr48gtuVKSd/t6ZBI1FUaz48ri/zeZ9wiymWfX7VBG4fxSdeXabObbHyLplmRg+SEduM4vCsvTbAp+a6bug4t6RuzhBmLIDthlBVVDrCJ0+Caou2AI6hi8L12OqEVDBuXnaY9TzivOYAuj2JEVwDTcz0W0mI6qcSId2bblQRc113FrtnKw4k9aBz562cwicxwwZVFTrxVoCIpH1dp9BQrV5syp3qCFo4/AFmdrLWtIUtEcgvULeofQCekjeFK2Crc2gD1VJHl5oos1UplmIzwl0rE8H6t+LX+e94yzmnkVwkFv3QV7wrGW0FTy9bQ3NKyFOebDl5PrlFeWpMcOKStF/ntw3AaKrUaksEyQLYXgXwofHQ0sdkI9ichXFxv5cKNgZKaR74+yFw8VxWRAOYyzUZvQ3URSR7QhWvcMHcbNlL0lqDszbJY9jZmkWNls8K9XD3ayIel6lq2rAhLl9/vPN20x5mjBisxb91SHdIy1VNcOYh7XJMUOw9G+s2RV4oi8p0odjzmFVqcRL6Uy/MtrDsyB7IJXXdlJR4eC4a+W5NnzlDH7+/yyGHftN8Ez3s85bA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(66476007)(33716001)(33656002)(66556008)(6486002)(44832011)(86362001)(83380400001)(8936002)(26005)(8676002)(508600001)(2906002)(38100700002)(6916009)(316002)(186003)(52116002)(6506007)(6666004)(38350700002)(1076003)(5660300002)(6512007)(9686003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zSY6afm3UGQzJJWI+Cx13tlc7jeSCI/919tmURsdRthZ7h/igtsr0nBaLsBV?=
 =?us-ascii?Q?jItm3rvcRdbTFj5eSFulTzp/RHe78bqiIGZuiLi6vo2YheIalLAj4Ja5GI8Z?=
 =?us-ascii?Q?rDyVALlONStQ/1JhkdBuH5SxDiJuJ/MG8UvQcsyMpcIvlp6tMJsvYP+p0+3b?=
 =?us-ascii?Q?Hxr6pjoDjEDd4C/C2ts0a455syKLPkNbhBxrm+6Dw0/k5RPB/ZWQATZNj4eI?=
 =?us-ascii?Q?kkcaSF5Ja0ZvQYCC3O2fwnow5vv1cHSjXPDzbhBYS12qM4p9RBamgYQEz2ej?=
 =?us-ascii?Q?zTVgegz5bsNaPwa+fuHGrXNqVqe3Ny1ID7TvxrWFUW6/Xz5gove/PZPPH+8f?=
 =?us-ascii?Q?JUUT3+F0PATek647iHXIxH/HqbyXFWEgEhDp2GUJEc2bVukgkaXWvMBkFcN7?=
 =?us-ascii?Q?KXAeESHq/sWUv/gEa09VH7uFIZuKBRQ9QeWsDmelaAFL8NuW6hnun4S7B3td?=
 =?us-ascii?Q?Ne/0ULEt+azUIGf8ZD9iohGdSJz4mP7DHHBzttMZlzQnctrdKIvJof4nL1cY?=
 =?us-ascii?Q?YTDUzoRCXM43JZS/2m95gxlqr84A4kE8JmUO2DULzkH/MD2IW3xPtqfIwap8?=
 =?us-ascii?Q?LE9fS08BBzNaFLZaOZk0pvQ40r2FvJYmHIfKD8XmP35hEOBFit9AY2WpGViu?=
 =?us-ascii?Q?hMbrrjmHa6rXX4ivYnlO3RtthKYzW9Ew6t+5DY19hXYE/bQxHbWzSj05Txlx?=
 =?us-ascii?Q?Cy1gG8ncFxZKHtRhu9Yhz7yJjVCEnJmYnQsZ3eJy13k3/VWlOmTYHD8sd00P?=
 =?us-ascii?Q?BYOM4adUMiUYsWjKTpqMJfxSLizHj0BOG0fguhQ5JkE443bpbInSBYzs/2pZ?=
 =?us-ascii?Q?UUcWuWbYKjvFJcENu6js3WgyST4Hu5xcKV6Qgnly1WkyruHBCjgbKK4AEjCZ?=
 =?us-ascii?Q?IkQS893JCZI+NiC+boiNyDlpJhxkC0oBN3YOfXPTBBhGeKELKzALnR057Wkm?=
 =?us-ascii?Q?dIRJfqMc4bmByBSarqgdhdEHbVIldUUY7ZooVXdFGbpvkKqXRYUokU8R/3DZ?=
 =?us-ascii?Q?Pdc0HqJLFomJjJ3ExhpQ9Hu1rHnpPYVCjG0i4ztDb190baSgRWlqkzRAcm6Z?=
 =?us-ascii?Q?iORsJySWLCm8Re5F9H5iH83BfumDU7qx80qg7C2ANDhsJ3Xj0q3kvkNpV1h9?=
 =?us-ascii?Q?OucknwyKgWz0cEr8FlPx3Ly1cobajbOj23LF5ECyWKvprZxIO+tk63nSXQv9?=
 =?us-ascii?Q?5BB6BZqWJp3APcjaAwOYOW3A5Y22EqvXAOhoWLoTRZBrMadU7xBvFRQbdSv/?=
 =?us-ascii?Q?YIcPLgxMDLAhAwZ/w+vJEqkKjhjX2TzvMN2RJAxRfvixtU8m6bKHb6k8UjZE?=
 =?us-ascii?Q?B7btE9OEYSc3PMGshsNOEtALg5SXHTditN2NhMUtPSnGb0g9PARzUkXBv19Y?=
 =?us-ascii?Q?J9m1wx/CEEN3qa80XMJIwSOAkbnyV32gk4izYevukZRkHGpXuVMq7vvUbBWK?=
 =?us-ascii?Q?7qvYB/tf79z9nsE6G6JoslXSqYxYUN65bZPmnfQ3VXZBiILwNaTfXFALjHCO?=
 =?us-ascii?Q?TXD9UWJT2dJ4JKccJpJDCjUCgv/mVwwDwXSd86U+CkzePxTuEZfIdXDjG1X5?=
 =?us-ascii?Q?i9j2IxAKWkda29HJk1hsJEaj9gSH/r8y/F8SE5EIcBBJfTJHvqAxw9xptFoS?=
 =?us-ascii?Q?5oRaed2qNRhDTTN8h+s7dSSAdgUk4aNDJOTGXM+sxecp0X48LiU+xFYfW0in?=
 =?us-ascii?Q?XjyBtoOPqLWkserMkC7acPNCJCY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e845b949-2733-419e-d175-08d9db3f13c5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 11:30:21.1883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UalQW77gnFdys7UWIyXo57BwzFqzofR9GaEf+WcVnr/euIMyD6kEHW1SvyuKh/biKIW3pnwn+KtheoMFqgDFIUSVrqeo+DVlCicTYZ3JOms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4545
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10231 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=787 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190064
X-Proofpoint-GUID: 69bD1EriK80Sk4ZFTPWukfFIvB8FSGPw
X-Proofpoint-ORIG-GUID: 69bD1EriK80Sk4ZFTPWukfFIvB8FSGPw
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hello eCryptFS developers,

The patch bf12be1cc851: "eCryptfs: convert mmap functions to use
persistent file" from Oct 16, 2007, leads to the following Smatch
static checker warning:

	./include/linux/fs.h:777 inode_lock()
	warn: sleeping in atomic context

ecryptfs_copy_up_encrypted_with_header() <- disables preempt
-> ecryptfs_read_xattr_region()
   -> ecryptfs_getxattr_lower()
      -> inode_lock()

fs/ecryptfs/mmap.c
   108        static int
   109        ecryptfs_copy_up_encrypted_with_header(struct page *page,
   110                                               struct ecryptfs_crypt_stat *crypt_stat)
   111        {
   112                loff_t extent_num_in_page = 0;
   113                loff_t num_extents_per_page = (PAGE_SIZE
   114                                               / crypt_stat->extent_size);
   115                int rc = 0;
   116
   117                while (extent_num_in_page < num_extents_per_page) {
   118                        loff_t view_extent_num = ((((loff_t)page->index)
   119                                                   * num_extents_per_page)
   120                                                  + extent_num_in_page);
   121                        size_t num_header_extents_at_front =
   122                                (crypt_stat->metadata_size / crypt_stat->extent_size);
   123
   124                        if (view_extent_num < num_header_extents_at_front) {
   125                                /* This is a header extent */
   126                                char *page_virt;
   127
   128                                page_virt = kmap_atomic(page);

kmap_atomic() disables preemption

   129                                memset(page_virt, 0, PAGE_SIZE);
   130                                /* TODO: Support more than one header extent */
   131                                if (view_extent_num == 0) {
   132                                        size_t written;
   133
   134                                        rc = ecryptfs_read_xattr_region(
                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^
ecryptfs_read_xattr_region() cannot succeed without taking a mutex.

   135                                                page_virt, page->mapping->host);
   136                                        strip_xattr_flag(page_virt + 16, crypt_stat);
   137                                        ecryptfs_write_header_metadata(page_virt + 20,
   138                                                                       crypt_stat,
   139                                                                       &written);
   140                                }
   141                                kunmap_atomic(page_virt);
   142                                flush_dcache_page(page);
   143                                if (rc) {
   144                                        printk(KERN_ERR "%s: Error reading xattr "
   145                                               "region; rc = [%d]\n", __func__, rc);
   146                                        goto out;
   147                                }
   148                        } else {

regards,
dan carpenter
