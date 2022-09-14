Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4B55B8FA2
	for <lists+ecryptfs@lfdr.de>; Wed, 14 Sep 2022 22:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiINUVQ (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 14 Sep 2022 16:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiINUVP (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 14 Sep 2022 16:21:15 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01hn2201.outbound.protection.outlook.com [52.100.164.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6940982747
        for <ecryptfs@vger.kernel.org>; Wed, 14 Sep 2022 13:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqODICaeSyO9VUFSIBqP4AxqNuowZQo1dP3sGB3zeCb3wE6B8EHkbVtYSCY7rVct/BGYVRvZ7JGccQ9U0sYG20H27bPbuK3qiOuxiU5lF6JMVJYnZhfalypgJsw+39bRYsPxUD6eroWCJ3LJgKaaA5h6lopTiVdE84e2THwVz74AyyiodRunvhwAgoyVnQ9c0C4R/q+3vVkh/zk8q7DiFVDhKwTUdmQO9bSyBGYeFT4PhzzUGEO0d9F9Bfb/LYwFGS+fe3jLLJAUuTRqta8sobTGGxphoBNLhx4msDUdrzWoIXw2/HvluPfMkHI0kIYX2kZKmTxmRZZviNg1y5XTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bs10Md+15nMnyayKLyd22Uv+/ZH79IcFcpzuzGLq1Fg=;
 b=PNuk6blUe/zSbcKqim5Iteuya7hezO1dD+o8pWW1P2s9elnC39gOtzcILTaa59HE10WnhJKq5fXOzifdZnrJ/n/9WV+541fLWd0m2qH6fZ5MbxrWrXm585DdbmpCXba39LUIvu+ozy9c3EzsRiiYJaJZFu6TBse3xQFrCy+sxU/IE0UbzGe7dgW01Bg/cUNx4NfQcmjS3VqcMb6Ec2Z8yb7RZGXpcSIT/eTS42PH7lg8plQbeD6Mh4mFJZSv4FE4eKJ1Qml6XijYmDlvyKdsAshTrQKcZNeAVcgoKDGVBL8Qe9sLL+05gbuBjdva+Ql1RmbcwUyqo82PDNbOrgzqvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 37.19.199.139) smtp.rcpttodomain=ovdm.co.za smtp.mailfrom=t4.cims.jp;
 dmarc=bestguesspass action=none header.from=t4.cims.jp; dkim=none (message
 not signed); arc=none (0)
Received: from PS1PR03CA0013.apcprd03.prod.outlook.com (2603:1096:803:3d::25)
 by SEZPR04MB6805.apcprd04.prod.outlook.com (2603:1096:101:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 20:21:09 +0000
Received: from PSAAPC01FT048.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:3d:cafe::60) by PS1PR03CA0013.outlook.office365.com
 (2603:1096:803:3d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.6 via Frontend
 Transport; Wed, 14 Sep 2022 20:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 37.19.199.139)
 smtp.mailfrom=t4.cims.jp; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=t4.cims.jp;
Received-SPF: Pass (protection.outlook.com: domain of t4.cims.jp designates
 37.19.199.139 as permitted sender) receiver=protection.outlook.com;
 client-ip=37.19.199.139; helo=User; pr=M
Received: from mail.prasarana.com.my (58.26.8.158) by
 PSAAPC01FT048.mail.protection.outlook.com (10.13.38.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 20:21:08 +0000
Received: from MRL-EXH-02.prasarana.com.my (10.128.66.101) by
 MRL-EXH-01.prasarana.com.my (10.128.66.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 15 Sep 2022 04:20:48 +0800
Received: from User (37.19.199.139) by MRL-EXH-02.prasarana.com.my
 (10.128.66.101) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Sep 2022 04:20:16 +0800
Reply-To: <rhashimi202222@kakao.com>
From:   Consultant Swift Capital Loans Ltd <info@t4.cims.jp>
Subject: I hope you are doing well, and business is great!
Date:   Thu, 15 Sep 2022 04:20:57 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <5ff0be87-bf8a-44a3-b9e3-9e5ed3e05071@MRL-EXH-02.prasarana.com.my>
To:     Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[37.19.199.139];domain=User
X-MS-Exchange-ExternalOriginalInternetSender: ip=[37.19.199.139];domain=User
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT048:EE_|SEZPR04MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc3c4aa-7227-4f31-ab46-08da968ea8b3
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?windows-1251?Q?7qDorjyIAXORzlP8SyjXlfQ1sHKHbkWfhYWKuI5opUxo1PZITr6TKxnu?=
 =?windows-1251?Q?bAyxSvtUJTId7iRzS15DSe+HiPrdmqtcrBGnPLJVItKYQt6XYTEksl2v?=
 =?windows-1251?Q?P+QdksP9MlzxTMKdWODSoURJ2HBtuO3errudReSJoEoFJHc7EIFjiwcw?=
 =?windows-1251?Q?apqYweL8S4Lh0vnU2w5MOZzkjzLj8mDX4GLtpEvr+0m9XMWwpGbTb+vX?=
 =?windows-1251?Q?yeCOW9ZP1cdSF1CFFwQXCCqgM4TYgXUUXFRnJQr3NevxoAkaLKQRKhk2?=
 =?windows-1251?Q?l72gZ+zGayQ2mbZRXBHOBlR/U0LQvjbb61wG6e6/wz4JIAb5H/JKyt5C?=
 =?windows-1251?Q?0B6lxZfAhc+BQgnxGQ3jgWIFaTkSloKT4FA1RhePwBi0XR3gFnkVpbjE?=
 =?windows-1251?Q?PHVRT8XGeWBrqRQdM1iUfSIiKJh9HH9RsVLlAXflAhp1e/5kjXu9qJCL?=
 =?windows-1251?Q?J4fWm9mP/Uk+Q95zfPi9oOOjAaP/U4dlLBZUQcZ7UxcVCmfLP9qG4bBj?=
 =?windows-1251?Q?aJrY5bl5jeKe6zgvfr8frp/swf8WRCvpmkwbU4KHaLc58+8y2XqxLm8i?=
 =?windows-1251?Q?RGr2pLpqzh1s1GlzHlX+KI1axwRHudaEUc9QEvgAzDHaVP3weiYfRU3P?=
 =?windows-1251?Q?yCQlLQMCU4/VWUtDLlrca10AbLyWEw2JbSZEtUGxv1RtgOk1LjPjhJpF?=
 =?windows-1251?Q?vRDQYHT8f2kgD1t5IRUBJFiyCIxrRbgs35wwEocfpWedQcNzs2qliz8q?=
 =?windows-1251?Q?v3CuWuOkJ61PxRBuSE5w7Kwd6l0bK2F9luS5nHocpsD/8wb/3WFIqKYW?=
 =?windows-1251?Q?dmmFsXVlHfIGB0v5CFwCV5wwqxES6mRy7/xGELNKwEt3h3zHy+/pRy49?=
 =?windows-1251?Q?4/BcC/CPomILag+ms1rGlszknpWHUeLEUiH/70YlTpQu0udbiXfgvoyy?=
 =?windows-1251?Q?58Pc+amtvVcMPj8zmfi8gs+lvpNr2MXRvb6x2oJpSjSOa2HKa+PNpAU5?=
 =?windows-1251?Q?toyXXl3b5ZxZ+q4CGR8/zdwyYmZ/kNmxmdW1YLrP+d0SJUvelePYo4N5?=
 =?windows-1251?Q?ESrYdpxP1d1JZt5PRr07FG3hEtqbaTdc8UEIpCeW0e5TKkJp+vJD56dq?=
 =?windows-1251?Q?H+CG9REJdb2LZMCfGJ6XOf2tQ7/cQAD9jx/vTBf/sQZEyGJdOjVcpmH8?=
 =?windows-1251?Q?TtDf/kWbEkOiWGCL/LsQjoljio4ieNFrfA6usV6+BB8/VrS9Ay4xLYHR?=
 =?windows-1251?Q?nz8uaRT6u/ilW/vDVykSTWtf4ANt7EDrLjz4QZW1AnIPvfkqGjsSGp+h?=
 =?windows-1251?Q?P0pRxetdIvvX0a5w35G/tYLuGW8k/tPcGcRubdf5Fo3tfPa4?=
X-Forefront-Antispam-Report: CIP:58.26.8.158;CTRY:US;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:User;PTR:unn-37-19-199-139.datapacket.com;CAT:OSPM;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(46966006)(40470700004)(41300700001)(82740400003)(498600001)(109986005)(6666004)(70586007)(70206006)(8676002)(36906005)(81166007)(316002)(40460700003)(32850700003)(156005)(35950700001)(9686003)(26005)(47076005)(86362001)(336012)(956004)(31696002)(7406005)(82310400005)(31686004)(40480700001)(2906002)(4744005)(7366002)(7416002)(5660300002)(8936002)(2700400008);DIR:OUT;SFP:1501;
X-OriginatorOrg: myprasarana.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 20:21:08.4497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc3c4aa-7227-4f31-ab46-08da968ea8b3
X-MS-Exchange-CrossTenant-Id: 3cbb2ff2-27fb-4993-aecf-bf16995e64c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3cbb2ff2-27fb-4993-aecf-bf16995e64c0;Ip=[58.26.8.158];Helo=[mail.prasarana.com.my]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT048.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6805
X-Spam-Status: Yes, score=6.2 required=5.0 tests=AXB_XMAILER_MIMEOLE_OL_024C2,
        AXB_X_FF_SEZ_S,BAYES_50,FORGED_MUA_OUTLOOK,FSL_CTYPE_WIN1251,
        FSL_NEW_HELO_USER,HEADER_FROM_DIFFERENT_DOMAINS,NSL_RCVD_FROM_USER,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [52.100.164.201 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5116]
        *  0.0 NSL_RCVD_FROM_USER Received from User
        *  3.2 AXB_X_FF_SEZ_S Forefront sez this is spam
        *  0.0 FSL_CTYPE_WIN1251 Content-Type only seen in 419 spam
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        *  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
        *      mail domains are different
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 AXB_XMAILER_MIMEOLE_OL_024C2 Yet another X header trait
        *  0.0 FSL_NEW_HELO_USER Spam's using Helo and User
        *  1.9 FORGED_MUA_OUTLOOK Forged mail pretending to be from MS Outlook
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hello,

I hope you are doing well, and business is great!
However, if you need working capital to further grow and expand your business, we may be a perfect fit for you. I am Ms. Kaori Ichikawa Swift Capital Loans Ltd Consultant, Our loans are NOT based on your personal credit, and NO collateral is required.

We are a Direct Lender who can approve your loan today, and fund as Early as Tomorrow.

Once your reply I will send you the official website to complete your application

Waiting for your reply.

Regards
Ms. Kaori Ichikawa
Consultant Swift Capital Loans Ltd
