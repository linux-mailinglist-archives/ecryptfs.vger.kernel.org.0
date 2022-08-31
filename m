Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0CC5A8041
	for <lists+ecryptfs@lfdr.de>; Wed, 31 Aug 2022 16:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiHaOdX (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 31 Aug 2022 10:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbiHaOdV (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 31 Aug 2022 10:33:21 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A717AB05F
        for <ecryptfs@vger.kernel.org>; Wed, 31 Aug 2022 07:33:20 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id y3so28808705ejc.1
        for <ecryptfs@vger.kernel.org>; Wed, 31 Aug 2022 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc;
        bh=8HbAfeIeP5jFQuZoSs/v1MOOiOGxqF78hZnJ1rKJOOk=;
        b=Lzu+DgaIGMnqFm+vH7+p+qy9gBobSlmUTxcg2e/zwYKJpe82a7GUVRLm0D6K41y5SE
         E74bbM3P2sxyfjmXlud5akFHWEzBUhHcsPJJ4JIgnwjmP6RBFeVxK3gwofNzas+ZoTOt
         VZSLrEVDj+CAMfhOzSfQQov+KEREQ6/iT6x5uHdJ3HBSnCbhDQi/XVjBPPtdtkUVNj5j
         Buf05Y8DiYBL09uyVFAq4nUstSvjlv2P47ApnNgitzoRuUcgY4rX6ItHeiQ22NfVEciQ
         BsEFFSBP+qAU0ppfkiOxM3XkLlTxjGe0JmMEEP7/XAaQ6Q9tJHkYKDawLXA3WBKZIoba
         pwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc;
        bh=8HbAfeIeP5jFQuZoSs/v1MOOiOGxqF78hZnJ1rKJOOk=;
        b=GRXOZ485o96woL4jXKDnQK/kRJuqqAbpAA9tRXaqNU6QjQt3PlLAo7A59L45DmIsN/
         a2wCnoxk9hAnLIIKxn0gVKVS1L8J1TWrd5qxKcyAGsMzU/QmFQdbOa5zbUWdvqvhHZzv
         5hKZI3mr6NATnvud9XPL1w2e1IHvqybe9lkhxoh1O6n0uXoZqZ5aOPS3xQi/Oi3bmNHW
         CmbycAK1zTucX5sJWi35R7aZD5wyQOLGkI5aHk2zYuH5/gHnxDWtTYpOOG9OlWn9Oefm
         /LOWt5Rm3G5njXj3qu0eBSGD7ezEA33IiVriNsFiFv8Gk13vid/dzg8rxYBt5XUqdDio
         ZpqA==
X-Gm-Message-State: ACgBeo3sJhG2x26PcGrrDgYPmVdcQIsgpTzlOS2wfIZ5H7ghtJ+gRqhL
        IAIs4XpKHI16TYeSAA+pHAcUr7e3r46QquQ8InA=
X-Google-Smtp-Source: AA6agR7uxzxnN0sHa9+gfaRb4Pzbx7C5rWj79egFelq82ErSLTi6+4RNDq8y3SGcsjypkLLOPGIwbkHb7THzJo/Hr3Q=
X-Received: by 2002:a17:907:87b0:b0:731:36ab:3223 with SMTP id
 qv48-20020a17090787b000b0073136ab3223mr20513338ejc.715.1661956398841; Wed, 31
 Aug 2022 07:33:18 -0700 (PDT)
MIME-Version: 1.0
Sender: abou09552@gmail.com
Received: by 2002:a05:6f02:a4:b0:22:d212:23ad with HTTP; Wed, 31 Aug 2022
 07:33:18 -0700 (PDT)
From:   Annabelle Edward <coletteedmond1@gmail.com>
Date:   Wed, 31 Aug 2022 14:33:18 +0000
X-Google-Sender-Auth: PyuGsfoTkJdUTSPspqBioMJjhJ4
Message-ID: <CAHJWARC-rJzawsc+UK64ZwTbYb7oCCnSqsnkuOcXOdpju4JG0A@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.6 required=5.0 tests=ADVANCE_FEE_5_NEW,BAYES_99,
        BAYES_999,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:641 listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 0.9998]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 0.9998]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [abou09552[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [abou09552[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.3 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  1.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

My name is Colette Edmond, I would like to inquire about your services
as my partner/investor abroad and help me move and manage my funds by
investing in profitable ventures such as buying company shares or real
estate; I have a reasonable sum inherited from my father, Mr. Edmond
Johnson, which I would like to invest in your country. I enclose my
personal photos, proof of payment of the fund, my international
passport, my late father death certificate and a four page will from
my late father. I am sending you all this so that you can have
confidence that you are dealing with a real person. Please reply to me
once you have read this message and the documents so that I know how
to proceed.
Sincerely,
Note: Below is the main reason I am contacting you.
(1) Provide a new empty bank account to which this money will be
transferred. if you do not want us to use your personal account.
(2) Serve as custodian of this fund as the bank insisted that their
agreement with my father was for me to provide a foreign partner
before releasing the fund.
(3) To arrange my trip to your country to continue my education and
obtain a residence permit in your country.
Cordially,
Colette Edmond.
