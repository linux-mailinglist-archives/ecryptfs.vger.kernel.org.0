Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1C44E2DE2
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Mar 2022 17:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351096AbiCUQ3e (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 21 Mar 2022 12:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351099AbiCUQ3d (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 21 Mar 2022 12:29:33 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3C0F7E
        for <ecryptfs@vger.kernel.org>; Mon, 21 Mar 2022 09:28:07 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id q8so10095500wrc.0
        for <ecryptfs@vger.kernel.org>; Mon, 21 Mar 2022 09:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=N66aCbNjFJzA21lYg4XBusa/RLw2WelP7G3RgOdqQCtVNd4m7eYBaVQ0qsmR2QVZWj
         MbaSBOBRTyQ++7BOgBejTDGRlOLWI7VGjNLBMqXt56Esk4BKjOP48WRSR+S5TveB7q8m
         OCC3P9zlUBo5qgPqqp2th79LHi2+tDHusnU2qIHjso5CXpjOq7lnaf5m4tCPYrVC0cFh
         r/7TtnPMl5lRcfzgpSarVCZ8gbT14ZQmXU1uiYPTGYqKQoo8S7tT0GqcH2aydDPKfFyM
         FF71wtXJq6kkKEezALxmQBgawpVqxnE8Ru+Z5VF6J4wkcoPU94IHvZOabJqE/QLpIeTP
         /JoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=5HxnIyd+ZGUv4m+0vCsSWev5hGla6O/epoE7uJ/eVjZIuU2XL32HYm7xSLso2lobnm
         R+gQGOGc1N70gBV4n+Dmu3QGjepxCiHR3X0HawbsNDf0J/DC/bsLCZIGcw9t0O+OaHAE
         LWVFvkeuBUBY28aFbi0rjMTmaOjsmKTPyKux9MGi1eukreA+PGPWKPPBUcGjTzVlhCD6
         JNNS6KugxuGoW2W9a1i94bfaA/DZwTpG2QFjfGhjClIAG2y0EOjxCrgq5WCuaVl/rlJZ
         uT0BTLpSfvOTqyoOewKgpU55f6zZ1ZMtkHRw7vjmqrfDcQ7FEvYe298PKN4Z1bo6/vuh
         Qozg==
X-Gm-Message-State: AOAM532oQ1bjodQ3LEQvRU3Qsj3m48/G08r6V5B1x8gpxiapLMhNyCBD
        JZvwUZqJVihnDOMxtgr8oug=
X-Google-Smtp-Source: ABdhPJw/G2UZRhcuSxas5MUwbGWCCH5xnkR+lrii07458y1lpy985Ac+gDYnZKZ5INLv8rdwAe5wCw==
X-Received: by 2002:adf:f4c7:0:b0:203:fb33:332f with SMTP id h7-20020adff4c7000000b00203fb33332fmr11413796wrp.280.1647880086543;
        Mon, 21 Mar 2022 09:28:06 -0700 (PDT)
Received: from [192.168.43.30] ([197.211.61.62])
        by smtp.gmail.com with ESMTPSA id o27-20020a05600c511b00b0038c8fba0bb3sm7765916wms.15.2022.03.21.09.28.01
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Mar 2022 09:28:06 -0700 (PDT)
Message-ID: <6238a796.1c69fb81.41225.ca82@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: meine Spende
To:     rimamnyangishaku@gmail.com
From:   rimamnyangishaku@gmail.com
Date:   Mon, 21 Mar 2022 09:27:55 -0700
Reply-To: mariaelisabethschaeffler70@gmail.com
X-Spam-Status: No, score=3.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

 Hallo,

 =


Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Gesch=E4ftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, den Rest von 25% in diesem J=
ahr 2021 an Einzelpersonen zu verschenken. Ich habe beschlossen, Ihnen 1.50=
0.000,00 Euro zu spenden. Wenn Sie an meiner Spende interessiert sind, kont=
aktieren Sie mich f=FCr weitere Informationen.


Sie k=F6nnen auch mehr =FCber mich =FCber den unten stehenden Link lesen

https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe

Gesch=E4ftsf=FChrer Wipro Limited

Maria Elisabeth Schaeffler

E-Mail: mariaelisabethschaeffler70@gmail.com
