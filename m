Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF4950071C
	for <lists+ecryptfs@lfdr.de>; Thu, 14 Apr 2022 09:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbiDNHmH (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Thu, 14 Apr 2022 03:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240450AbiDNHmG (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Thu, 14 Apr 2022 03:42:06 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15526186ED
        for <ecryptfs@vger.kernel.org>; Thu, 14 Apr 2022 00:39:42 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i20so5676004wrb.13
        for <ecryptfs@vger.kernel.org>; Thu, 14 Apr 2022 00:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=GT+iXYMh4bxfWO+kEt/jTolooUeTKJNlWu4cGTNcHSEpzqZU0t5Ew+laofroTuy6gf
         DDY94w8owEpyW/tOEOIWiMLOq9B9EUPkuYmfp1VSLtIPSLkueFtCxvYEp7mXJ4LyE2af
         hdCpYyMD4E8rIppBG4TUbt1/m2qThaiE8+Dfx9YHTfzSOLpxcr4HkJMuN6DC6mIKlWns
         wvxLtczP6+h4P3Rsupsr4hmxsKD928/cjtIMGc0NGgWDsLW8+QOZxRxCHDqthcGtM0lJ
         MnFwlKAL7MJ1Ktrt1hnyeYjk0GPvuNDJAQxcIq61gVJhVvr3JjRXRbTDaY3ZYQbfPFQu
         Gziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=8GXsuloYrDurdfIrRE0eFcu8iJ03NoH33qZWC55ykY/wUNOHBwwqG8tk54E70+Peuz
         GVGPtk0O+ZOV/VR0n0FbfPBgBvP4zJEzhtLEyVwQkZx5IaCmEZKKoobiGjuDEglEmGdc
         bK6YJ6wiXlkfjFs06m0buSdcougJfeqIHaAkXrzVGGx+GlV1RfZv3enj/8s0uHgqwEOu
         piA2YHQMdzetdSG5xmR9+XXDcEw6LSItTH+hSHdwg802t/gVRYu//tTbG8B59TxPndmd
         sukAfDHYfSFhgxP/69qNqRcRA+GdH6vZ/zzbz46t962N7SuLB7i50hXa3shHdX9XfPf7
         XEMQ==
X-Gm-Message-State: AOAM532Tcx8fejiShDOFGwgkSApDuDlA8OJuLF6fIxCVdzxRd8314xX6
        5MbC3jRW536XgL3rII3veUQQLCEXDm9ZfKPyjg==
X-Google-Smtp-Source: ABdhPJwzMposIyPSPT7sRiusDMTfounAifvoBFMUZ4ADlz6rPh3b27xFK6Pmrf4JygKnigPMy52IBce3vLl1hwEnTFE=
X-Received: by 2002:a5d:5690:0:b0:203:f727:362 with SMTP id
 f16-20020a5d5690000000b00203f7270362mr1068278wrv.717.1649921980311; Thu, 14
 Apr 2022 00:39:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:64cb:0:0:0:0:0 with HTTP; Thu, 14 Apr 2022 00:39:39
 -0700 (PDT)
Reply-To: danielseyba@yahoo.com
From:   Seyba Daniel <ouedraogoissa.bf@gmail.com>
Date:   Thu, 14 Apr 2022 09:39:39 +0200
Message-ID: <CAPdK0pZZKOByPKtJvMvUbm1DMOrm83Er26cKxWNMkao6cvM+9w@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:442 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ouedraogoissa.bf[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hello,

I am so sorry contacting you in this means especially when we have never
met before. I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it.

My interest is in buying real estate, private schools or companies with
potentials for rapid growth in long terms.

So please confirm interest by responding back.

My dearest regards

Seyba Daniel
