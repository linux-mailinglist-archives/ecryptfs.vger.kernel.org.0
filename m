Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D5F62F75B
	for <lists+ecryptfs@lfdr.de>; Fri, 18 Nov 2022 15:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbiKRObS (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 18 Nov 2022 09:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242384AbiKRObN (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 18 Nov 2022 09:31:13 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5528B104
        for <ecryptfs@vger.kernel.org>; Fri, 18 Nov 2022 06:31:12 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id e15so3198290qts.1
        for <ecryptfs@vger.kernel.org>; Fri, 18 Nov 2022 06:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bIY3TPZTVnWea00k4Qcne3TRu4UILnkul61ceLO7Q90=;
        b=E11YR/VmwB/Y9+WKhxWuASU/R+YDPMLJwUV9+BxnCRohi+rlSCMj/IqSpGp+1KVTxV
         LfO5QpYgg5mC3LdYu1eOy8R/z8/V//l+shhebn55qb954gIPKkRqSgkdF/WODkUYyn0r
         yUzvGXpOfF55pFAfEhmTgu4tBAvlCoCg2BWdf+vTj8dN1LPaXugesLcZnZNrrLWrzaIa
         YUxLm1MoJSAIQF8t/KMZAkOaq4YX85WoOd2pFSfV7RaYvhYSHawG4SomawGepOcNvB3K
         U3XmbFKeLGqt6ofzy0sZxUsbKYrK5N0LYKsgHdHsbUHmK0mLuzLsIctnaYb4SMI5NZ6S
         VI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIY3TPZTVnWea00k4Qcne3TRu4UILnkul61ceLO7Q90=;
        b=MkwZF6RFyCofk3JmBvdT915IyyLyeNStZO/VCk/ukceqkAbNHK+r5PIzvdNnfMNBDM
         nNv3eaRNd+X1nHC+e5DU41mOH2eqnOFKWUbxCIULMgZ2VtUWHp2ktj2OUYc4vu+AiXAH
         k4WOF1IMs3Gk51KdEn3hmJ+rt0i22rMrr4iTamLEGm9XShNW7VN2OZQpKNYAvNuz6Awo
         GrpmhZxg3028SERvIFerIf+ZjQQ2Wy9DtUlYBS2zfy/P5FlkoZASlBQvYuVT1o0kR4RG
         oiO/TLX6BxnyZflhMci3yf8A6miyoLnd1GaYkJtyusLF1Zel5iNU90+jMPE7cS68Ar5c
         1nGw==
X-Gm-Message-State: ANoB5pmoJbN0lpBpmUSIYSUjvHbmtou0P2FgSDA07fj4bp1HG3rbxch2
        S/Zl3Ne0jqAvVR+Twjsi9iXAAInLldJ9p+ndaG8=
X-Google-Smtp-Source: AA0mqf4gJIaamfatykKWC4y3ZH2AXi7WtzkVX5p99buD9hOyxspLg/+hMCJA3il7ky104K7hMfx6Bl/IiUq/THnomD8=
X-Received: by 2002:a05:622a:40cd:b0:39c:c860:5cd4 with SMTP id
 ch13-20020a05622a40cd00b0039cc8605cd4mr6902113qtb.314.1668781871690; Fri, 18
 Nov 2022 06:31:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6200:4d3:b0:49f:fe1:ed86 with HTTP; Fri, 18 Nov 2022
 06:31:10 -0800 (PST)
Reply-To: tn0056454@gmail.com
From:   BELARBI MALIK <don917370@gmail.com>
Date:   Fri, 18 Nov 2022 14:31:10 +0000
Message-ID: <CADTY6ngqfnMyRzwEwcUzAKMguvGRo_F9XxobjNjtNiP-o7abfQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:844 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [don917370[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [don917370[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [tn0056454[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

--=20
Sch=C3=B6nen Tag

Mein Name ist Belarbi Malik. Ich bin von Beruf Rechtsanwalt. Nachdem
das Ecowas-Gericht die Kisten/Erbverm=C3=B6gen unserer verstorbenen
Mandanten freigegeben hat, m=C3=BCssen Sie diese Kisten erhalten. Ihr
Cousin, mein verstorbener Klient, hat hier in meinem Land an der
Goldk=C3=BCste nicht abgeholte Kisten zur=C3=BCckgelassen. Ich erwarte Ihre
Antwort bez=C3=BCglich des Verfahrens und Kopien der Dokumente werden Ihnen
zugesandt.

Belarbi Malik
+22897822988
