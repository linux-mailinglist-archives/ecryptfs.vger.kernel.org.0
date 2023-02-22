Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E112869F0E3
	for <lists+ecryptfs@lfdr.de>; Wed, 22 Feb 2023 10:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbjBVJEk (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 22 Feb 2023 04:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjBVJEj (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 22 Feb 2023 04:04:39 -0500
X-Greylist: delayed 549 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Feb 2023 01:04:37 PST
Received: from mail.amblevebiz.com (mail.amblevebiz.com [80.211.239.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD674360A4
        for <ecryptfs@vger.kernel.org>; Wed, 22 Feb 2023 01:04:37 -0800 (PST)
Received: by mail.amblevebiz.com (Postfix, from userid 1002)
        id 3375A82D70; Wed, 22 Feb 2023 09:55:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=amblevebiz.com;
        s=mail; t=1677056127;
        bh=mG5KF9rXIT2hCcIXZaMY449X9Ndwb1czFhgZLlqDg7A=;
        h=Date:From:To:Subject:From;
        b=N3n4oGoevxP6krWwK/LH8Zu2VzIGfLEfjoRFbfFdTMhWBXvK1tE0C8vkGYTZphufH
         m4gVFOOl01K0l9HqtwvaiO2p9TCSXmHt5ZX2xM4Ee0cqSMrnNI+0ZLwq0PHN1k10sM
         1wrH3VJ2ub3wv5UpOEH1QApmqxYLBFIfzKA23MRsK/zfTYtyteMdMTXs9hI1dx8K38
         ghPZbBYeD5W23SPy2C8SNmLMHkP9LMLHnh5hTANlpgrmPSA/o5R98Dh2VKe2iMXL33
         /qgfX+9IOVjOoy9ts6joJ7xBc9ppv4upYT/jVDlTBQyyCD+5v7xpZeBxmH/kltSoNn
         NUO8xdpMq1xGQ==
Received: by mail.amblevebiz.com for <ecryptfs@vger.kernel.org>; Wed, 22 Feb 2023 08:55:25 GMT
Message-ID: <20230222084500-0.1.a.ccq.0.g52kq3b0h9@amblevebiz.com>
Date:   Wed, 22 Feb 2023 08:55:25 GMT
From:   =?UTF-8?Q? "Luk=C3=A1=C5=A1_Horv=C3=A1th" ?= 
        <lukas.horvath@amblevebiz.com>
To:     <ecryptfs@vger.kernel.org>
Subject: =?UTF-8?Q?Technick=C3=BD_audit_podlah?=
X-Mailer: mail.amblevebiz.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_FMBLA_NEWDOM,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_CSS_A,URIBL_DBL_SPAM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: amblevebiz.com]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [80.211.239.97 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: amblevebiz.com]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 FROM_FMBLA_NEWDOM From domain was registered in last 7 days
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Dobr=C3=A9 r=C3=A1no,

uva=C5=BEujete o bezesp=C3=A1rov=C3=A9 podlaze pro v=C3=BDrobn=C3=AD prov=
oz?

Jako sv=C4=9Btov=C3=BD l=C3=ADdr ve v=C3=BDrob=C4=9B a pokl=C3=A1dce podl=
ah =C5=99e=C5=A1=C3=ADme probl=C3=A9my vypl=C3=BDvaj=C3=ADc=C3=AD z vlivu=
 chemick=C3=BDch slou=C4=8Denin, ot=C4=9Bru, n=C3=A1raz=C5=AF, vlhkosti n=
ebo n=C3=A1hl=C3=BDch zm=C4=9Bn teplot - na=C5=A1e podlahov=C3=A9 syst=C3=
=A9my jsou p=C5=99izp=C5=AFsobeny nejt=C4=9B=C5=BE=C5=A1=C3=ADm podm=C3=AD=
nk=C3=A1m prost=C5=99ed=C3=AD.

Garantujeme v=C3=A1m =C5=99e=C5=A1en=C3=AD, kter=C3=A1 jsou =C5=A1etrn=C3=
=A1 k =C5=BEivotn=C3=ADmu prost=C5=99ed=C3=AD, odoln=C3=A1 a snadno se =C4=
=8Dist=C3=AD, hygienick=C3=A1, protiskluzov=C3=A1 a bezpe=C4=8Dn=C3=A1 pr=
o zam=C4=9Bstnance.

Poskytujeme kr=C3=A1tkou dobu instalace a nep=C5=99etr=C5=BEit=C3=BD prov=
oz i o v=C3=ADkendech a sv=C3=A1tc=C3=ADch, =C4=8D=C3=ADm=C5=BE eliminuje=
me riziko prostoj=C5=AF.

Mohu V=C3=A1m zdarma nab=C3=ADdnout technick=C3=BD audit podlah s komplex=
n=C3=ADm rozborem podkladu.

M=C5=AF=C5=BEeme pro v=C3=A1s mluvit o =C5=99e=C5=A1en=C3=ADch?


Luk=C3=A1=C5=A1 Horv=C3=A1th
