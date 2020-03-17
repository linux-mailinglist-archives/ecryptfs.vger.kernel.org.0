Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA7C21882E8
	for <lists+ecryptfs@lfdr.de>; Tue, 17 Mar 2020 13:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgCQMH2 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 17 Mar 2020 08:07:28 -0400
Received: from sonic307-2.consmr.mail.ne1.yahoo.com ([66.163.190.121]:45171
        "EHLO sonic307-2.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726545AbgCQMH2 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 17 Mar 2020 08:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1584446847; bh=kcevCRoll2+Bsa3FDERpIV72LVcB1A4YV1b5N2AWYBk=; h=Date:From:Reply-To:Subject:References:From:Subject; b=TYJAYCz3bNTfsdt/MA1H3rmcfnRFhI9T8+SP/UJcAvmbR/C7oblQ2IrhUqKGKxYoXmzQvGYkCB/iOupWpGhpalUAoxX6u1M0qFLFSpmLJ+sYMD74nqCC79nbq3isVShXQv7Z1ZhXsY8aXbCzCCoyB1jie8WwbgDgA4ls4ZKWEdU+nSeP3iVKDtEhb0XdIl8cb8kRfWqJgXQ+LoNg+weDoVfnuLVmHvVuSOLCgKrLvAldM479wsa6QdaLJdRheUf5hI4NWO8hIsYVJkp/OnhIjpzmuxNqsqjrPJW22F9xi8wl33SvU5bWDhNUx+OwOkkatC0V7ghAwk7pMwgztiCI9w==
X-YMail-OSG: kiwY3a0VM1lXG2yd0FMEXcFEq4d1_NqzrDF8PKCrEvjngq_DbKpy1GCppZ9sJgS
 swORTXPim.EGzeGl3jMh_7PJc4L5FQVIodQeQl8WbcgLGL2Ji3mYYeyOF9Qb32eAh1N6q7PYPMp_
 MHLHci0hlpx8TzJi_V5AkpKk.vkNsoCCObxCeN_.VrqTFf4nwQxBCNMmbVD.esgLPNv9UEjuSP.w
 c7Pt2nyPF6PJSEFjuWE.ZHmrFiknTHs1b69SWkQuOFeZS876SncSu314oOiqwvqk_0EktP.Ozxz9
 DMAW_xo16P0VFW.Hti2fLaRX437yOGcX8rXWv5_Scu7T7R_5A2ucke5EUk5hwDqh3egfpMX9Kpuy
 8vciLBYPgaKQYiVlZyJq5Rn2xK0NjiN72PZkihcK4ia1AB44tYaUj8AvtxoECsozC482KXB_jrvl
 .sf.VPbnQ7qX.SsH6nU0kSzOBRymH6XdhiVl6FQ7PrapAHhwmnXKxnLKCnDVzf2IAruBblCYmPaU
 HnXAEgq76AePz8fm.1M8BoLzMdbpKVK9.mNyst0y7_qer615kKs4bHx4fLMOPvJVHTLJ83w6wlN.
 LNXp4X0D5y1OqP8NbnVuwGyDScMz2K4YobdSQ7PlOHB.Vysfp4iQSdN.ZIFbPy3Rldooz.HDHPKz
 sQhRKXM4Yii2zqTtRAppWIn_LzyCIblGjnm3PpFMHOTnSFWYLAOi5fG1BfsrYYdRhWNLxTqqzWHb
 q_fvTYvFm5oWMYggdElL9SaeqpWcrjsSoHnTdodoa6VM8UxQ_l1bX2EWOOolRdJRweXtqbP0vBUo
 WhYUmwOwXkJG.MBcFyMBiNG85cOyrRyAWO0cMKWj.01zBM1meJBQ3ds6amZoWmo.0ZyrS1xeoxbY
 rLaAasO3NDB25Sfl75t4xr8I.TUz8P4TDcf1QJCrsJG0Oc7QswtP.cUuKXnIrbmcTFC5Ci1eP_gn
 AJfl1yLgMGeMmg1WX1HQUPD3L1rhcBZ4P1jBHtHHYJA._8BVNJonIy2CspYYbTKkP.CUfqQI7Y4r
 gtBx9wAwpNVa4WjGqYPDD2qpHzfvrg3PC1J4clsinl2Qd_sRHpc_WnpsW.K39FU6j3pD3JathgtZ
 4ySMlixwy5hw7I0.4d39zNoihOQTg9QVkPvZhkbwKGMcl453fFGNZFHRmV_H3NEYTSkMQgsIQx2D
 p.tMlfVmvJRqmy1xjIqIoYgav_0dnsuhiqGMDBkKVqrzQm09yqbYGWCaCdpBO8sLZeNy6Pc6MkyS
 VGgfDKHxv0U3l00pQKAtd56IWIWRTfTaVEiMNEvCNl35pgtDb5zedZhBa7TjiL3ZwZb55_vF5bor
 gT0GQrqGgw0kQ0jiV5JxkNBdMsvfcQrQGiQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Mar 2020 12:07:27 +0000
Date:   Tue, 17 Mar 2020 12:05:26 +0000 (UTC)
From:   Stephen Li <stenn8@gabg.net>
Reply-To: stephli947701@gmail.com
Message-ID: <877193668.1824808.1584446726464@mail.yahoo.com>
Subject: REF
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <877193668.1824808.1584446726464.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15342 YMailNodin Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org



Greetings,
I was searching through a local business directory when I found your
profile. I am Soliciting On-Behalf of my private client who is
interested in having a serious business investment in your country. If
you have a valid business, investment or project he can invest
back to me for more details. Your swift response is highly needed.
Sincerely
Stephen Li
Please response back to me with is my private email below for more details
stephli947701@gmail.com
