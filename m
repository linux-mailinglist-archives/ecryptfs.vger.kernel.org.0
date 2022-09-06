Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087CA5AE415
	for <lists+ecryptfs@lfdr.de>; Tue,  6 Sep 2022 11:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbiIFJZq (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 6 Sep 2022 05:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239099AbiIFJZD (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 6 Sep 2022 05:25:03 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F7725C41
        for <ecryptfs@vger.kernel.org>; Tue,  6 Sep 2022 02:24:56 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id p7so16432988lfu.3
        for <ecryptfs@vger.kernel.org>; Tue, 06 Sep 2022 02:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=ttKscAtY+0CFKMCnSLoOXxV6vDfUyLM1robRio3zM4A=;
        b=XJNm5iQPmyVpHCxt9f9B8GM+TyXxV01LWlbtD+0puNnqjpXmXy+W2dUd+jApPCnBuj
         hYvhzWADQtIyjUa3s1DuwRJY/v1Ax+gs+MJ+KL5BvkC4k3mBy6dVyWrc/O6vwZOTCy9Q
         +WIstckCt388jSf+TX+aJkCTzlVjvaNUoHJTIl27NpLyZKKgXCl7VpB9zb2Rx9irrfWY
         PKUTlLeDYiHJmxM9Vmrz1TFjtLutIGrBIkASHScamSpe9UosmJ3rMrxVg4t5/J6JYirc
         Hv3J6aD2NERqJxE5lDUytUGOjtdIHnTgzUdVRVvmqv/DhSNjWExiTmVGmj9uYVLr02gk
         Uisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ttKscAtY+0CFKMCnSLoOXxV6vDfUyLM1robRio3zM4A=;
        b=KIaDyHtNhwCjhmYhzni+rkbFyMPRNQ2VVii9wcYU0gHJQJA4rYDSj23wGwJE7v7OUK
         sysXuDbX6htk+Co2aTAOXsoENAv9SncC7O5X/PVnxfLbXbslm62eO78LgkOJGhzy5vxN
         CE5YH0q5pM61hvYUk3Qg0Db0PoYXwmojIxjDn45XyVxH/dSerci9JEIgDeZQBPXwznFi
         HMk2UQC626eRXRDpRfAzdeowjYwGFR58LqItIgYbGseCZJ+sab4Uv/K76mNb9qNaBEln
         WPbsqnTRyUh6AIx5FiuxW3QGeJmhdyFq5cFLw0fikJ62Oj+dN5eEURpNz7l/ZIUm09yS
         OICg==
X-Gm-Message-State: ACgBeo2FqlE7/cql6FMCxJQR4wia8DIk8wicaQNN4uo6fzDxTt9eqeDR
        IkLPGe5a6OrIvOnPtZKGHRmwqAZJ/JtpKbpoD5w=
X-Google-Smtp-Source: AA6agR6Y3U0iSZy2YFmgVXQx716w9sFmZ1ocdOIYtIwpjvQtdbYgqKO+M0Fh/GEDWFUUqlpBcImYEte7eub6db3pXSQ=
X-Received: by 2002:a05:6512:12c8:b0:494:a211:db7b with SMTP id
 p8-20020a05651212c800b00494a211db7bmr6751054lfg.182.1662456294399; Tue, 06
 Sep 2022 02:24:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:19a1:0:0:0:0 with HTTP; Tue, 6 Sep 2022 02:24:53
 -0700 (PDT)
Reply-To: olsonfinancial.de@gmail.com
From:   OLSON FINANCIAL GROUP <amadip120@gmail.com>
Date:   Tue, 6 Sep 2022 02:24:53 -0700
Message-ID: <CAHb0K2HptN99kAjX3OkUXCzwu-Y4RVbLeM6hcstdVPOc2S7zVA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

--=20
h Guten Morgen,
Ben=C3=B6tigen Sie dringend einen Kredit, um ein Haus oder ein Unternehmen
zu kaufen? oder ben=C3=B6tigen Sie ein Gesch=C3=A4fts- oder Privatdarlehen,=
 um
zu investieren? ein neues Gesch=C3=A4ft er=C3=B6ffnen, Rechnungen bezahlen?=
 Und
zahlen Sie uns Installationen zur=C3=BCck? Wir sind ein zertifiziertes
Finanzunternehmen. Wir bieten Privatpersonen und Unternehmen Kredite
an. Wir bieten zuverl=C3=A4ssige Kredite zu einem sehr niedrigen Zinssatz
von 2 %. F=C3=BCr weitere Informationen
mailen Sie uns an: olsonfinancial.de@gmail.com......
