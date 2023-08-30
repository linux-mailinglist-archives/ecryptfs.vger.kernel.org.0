Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFA8378DCBF
	for <lists+ecryptfs@lfdr.de>; Wed, 30 Aug 2023 20:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbjH3Sqg (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 30 Aug 2023 14:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242564AbjH3JCf (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 30 Aug 2023 05:02:35 -0400
X-Greylist: delayed 428 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 30 Aug 2023 02:02:31 PDT
Received: from mail.venturelinkage.com (mail.venturelinkage.com [80.211.143.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB89CC9
        for <ecryptfs@vger.kernel.org>; Wed, 30 Aug 2023 02:02:31 -0700 (PDT)
Received: by mail.venturelinkage.com (Postfix, from userid 1002)
        id 088AF82502; Wed, 30 Aug 2023 10:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturelinkage.com;
        s=mail; t=1693385721;
        bh=7iowqdzve/IIiUUjcEwx8j3uMrVqqiE7R9zbOCKRV9Q=;
        h=Date:From:To:Subject:From;
        b=cfeiLT4m2aEOrtacN+6hLOEVkC2YbXARm//gJEzR52lzjczuR3FXW4NlBzDpWshPJ
         NiNciXweyfH/oKI7gXwwIPBbOaCPIeADrjvyd95Ob/QoSph3mb71IyZXkftJ8+MYiy
         PSq2oozPFkfa5/sUmhI2Cgs2G6WP8Bfh2ZkseAY+7e1Qv30rl7GxMNzSmaxov0dvTX
         00psQbsybTpCbJAPs9jDqjlrphmibCYe7gFZTDg2tBPuu+jBzmxH9rt1IUaHuh4KxB
         bNm0aNWxarI+vMeYvZ/q1UH8EQsBT7QR/J6y5ciW9Qf3fUbcuxjOZ+6vVpxg1HOV4s
         +FDhtxHPnUC2Q==
Received: by mail.venturelinkage.com for <ecryptfs@vger.kernel.org>; Wed, 30 Aug 2023 08:54:55 GMT
Message-ID: <20230830102951-0.1.6.2gf.0.fpdfbfj5dq@venturelinkage.com>
Date:   Wed, 30 Aug 2023 08:54:55 GMT
From:   "Lukas Varga" <lukas.varga@venturelinkage.com>
To:     <ecryptfs@vger.kernel.org>
Subject: =?UTF-8?Q?Popt=C3=A1vka?=
X-Mailer: mail.venturelinkage.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_CSS_A,URIBL_DBL_SPAM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: venturelinkage.com]
        *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [80.211.143.151 listed in list.dnswl.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [80.211.143.151 listed in zen.spamhaus.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4944]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: venturelinkage.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Dobr=C3=A9 r=C3=A1no,

Dovolil jsem si V=C3=A1s kontaktovat, proto=C5=BEe m=C3=A1m z=C3=A1jem ov=
=C4=9B=C5=99it mo=C5=BEnost nav=C3=A1z=C3=A1n=C3=AD spolupr=C3=A1ce.

Podporujeme firmy p=C5=99i z=C3=ADsk=C3=A1v=C3=A1n=C3=AD nov=C3=BDch obch=
odn=C3=ADch z=C3=A1kazn=C3=ADk=C5=AF.

M=C5=AF=C5=BEeme si promluvit a poskytnout podrobnosti?

V p=C5=99=C3=ADpad=C4=9B z=C3=A1jmu V=C3=A1s bude kontaktovat n=C3=A1=C5=A1=
 anglicky mluv=C3=ADc=C3=AD z=C3=A1stupce.


Pozdravy
Lukas Varga
