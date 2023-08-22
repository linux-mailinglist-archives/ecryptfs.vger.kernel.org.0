Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 591E5784CC8
	for <lists+ecryptfs@lfdr.de>; Wed, 23 Aug 2023 00:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbjHVWRk (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 22 Aug 2023 18:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbjHVWRj (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 22 Aug 2023 18:17:39 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 15:17:37 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE89ACCB
        for <ecryptfs@vger.kernel.org>; Tue, 22 Aug 2023 15:17:37 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-d9-64e51b92722c
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 38.64.10987.29B15E46; Wed, 23 Aug 2023 01:33:23 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=RQ0aS5HfAO8Hb4lgkFV1sCGdKVAvo/J7b17aL4X6g8qqJj91ismDRv7BCijHgkv+T
          UAsCt6k2R8cdn/sbTK2ZOfGDQkChNGlhmvJKKCrmXhLeY8jaccxglcId1utJW53RZ
          UQKPq6QoX8Kwbd4skukR2ONLqGCxZ8ySZ2MK917KY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=ZNtfuXaUT3t0hACgqq4UPaKo8yfPwjvYpnafPS7wkmGqrPSgcPzh5dMiWzg0velOm
          mTuOHj1iutslGzhTPfmfpPIyFKWRwjQowFtb7GBecjnfp0k4uEEvDU5648dz+tMzx
          F+7L/2YDT12EgI6WRpjMPET/bwpQJQY47oQqaSwk8=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 01:31:33 +0500
Message-ID: <38.64.10987.29B15E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     ecryptfs@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 13:31:47 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW3ey9NMUg9ezmCze3l3O7sDo8XmT
        XABjFJdNSmpOZllqkb5dAlfGknUXWAp2M1e09S9iaWB8zNTFyMkhIWAiMenBItYuRi4OIYE9
        TBITz61nAnFYBFYzS2xd38YG4TxklmieO4URpEVIoJlRYtH0SBCbV8BaYtHnhWCjmAX0JG5M
        ncIGEReUODnzCQtEXFti2cLXzF2MHEC2msTXrhKQsLCAmMSnacvYQWwRARmJywcPMoPYbAL6
        Eiu+NoOtYhFQlTh1oJUZYq2UxMYr69kmMPLPQrJtFpJts5Bsm4WwbQEjyypGieLK3ERgqCWb
        6CXn5xYnlhTr5aWW6BVkb2IEhuHpGk25HYxLLyUeYhTgYFTi4f257kmKEGtiGVDXIUYJDmYl
        EV7p7w9ThHhTEiurUovy44tKc1KLDzFKc7AoifPaCj1LFhJITyxJzU5NLUgtgskycXBKNTBe
        WStbvcawZMa/P007opcKnYg6cPDC530xdl8VDH336VQm7bpYe3vf29iaUxNlrL/kxTLNO/Si
        JvLOlky/fcw1v/WXdJy/Kymew3JbvfTwVpsAacXtPEdn72BV05051dP1Fd8tvW+6J5gK7R/5
        9Z6dObHy2cdu+RM/18tJ3F3/peq3ATuTcdJdJZbijERDLeai4kQAlOfyjj8CAAA=
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

