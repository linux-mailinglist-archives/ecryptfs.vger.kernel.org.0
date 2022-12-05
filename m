Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1EC6642CB5
	for <lists+ecryptfs@lfdr.de>; Mon,  5 Dec 2022 17:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbiLEQWr (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 5 Dec 2022 11:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbiLEQWp (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 5 Dec 2022 11:22:45 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0ED2AE65
        for <ecryptfs@vger.kernel.org>; Mon,  5 Dec 2022 08:22:44 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id g15-20020a4a894f000000b0047f8e899623so1776505ooi.5
        for <ecryptfs@vger.kernel.org>; Mon, 05 Dec 2022 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=UPUniniGwhSuFrZdswCk4E7csAkSzn07+K+O//IoAF9NeET1XRj55yaPg8oe+bDnz4
         Y/0XD9nIyiGD0QYI7sSbdU/NOuHutTC9uEfLJ3bzSFQeXEXs4W9s/KBshe8GQjuEp33I
         RxE+2Gp8hXpOJ7ge+9wJlbOWG5fC+Lk6gcCeDmaowbY02YLyO+umDroJAXZeeairmVL2
         3iqJu0qYLuloU/kvU8aNSXdW8zVYiTPdQYI8X4m2umU2f2OdquD2pUi0Vx1Y1gz5LMMs
         wgv1yR9swVqhdPGq8Cr3+6zlqHE+uJZUFvtFhHBhPaLEZF0nV5p3N54YY5icJUKbNx20
         rzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=WMvIVC8cXGSHLmgW49EjcqQzrWvoN/2jZ2WwfGmKGJqITuYdO5lPitXPRjCRi60fQq
         JgxwmC7qHWh+jhLkrzKYfNOI0g1Q6lyFjukIDqyHUcjULrOsZNB5dBMIy6HWapEGqgN3
         eghBxkUoaY5X/GneNdOMJqsLZFml030Kf38ZZim5N+MBjh+z3xCR84ebAv63lXpg2f5D
         xA9MjPn8cwNGwgXurdf1wWZtQc9Nl34hK49nIav8ZC1tYaf9U8MiOJQNOd8KZ1VgKChe
         m6t+RT5IqqH4w2j6R8ZyhMPEMRCTH9m2Kg0K4DwdIiI4jFIbe0bhc6kED6qJ0bcyPvoG
         h6Tg==
X-Gm-Message-State: ANoB5pkiBIXEHeThsrWUui6Mf2daAuqIJt1yWJ91T+nrMCYSIzU2TrQ1
        vTpyfgzVqoS5nZiRLO9RjQQJIUEggAPFRCgsogY=
X-Google-Smtp-Source: AA0mqf6oA2dyyKW2Kbb1++dIdX6ccwc3KDnluaWjmKLp/x5JAi7D8+wlMqKPAlvTQkL49yPcp1ZbHzn/LA1Q8AjAg7k=
X-Received: by 2002:a4a:d501:0:b0:49e:d94d:1fe0 with SMTP id
 m1-20020a4ad501000000b0049ed94d1fe0mr26493539oos.37.1670257364122; Mon, 05
 Dec 2022 08:22:44 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6870:5ccc:b0:143:84e0:abae with HTTP; Mon, 5 Dec 2022
 08:22:43 -0800 (PST)
Reply-To: phmanu212@hotmail.com
From:   Philip Manul <phmanu005@gmail.com>
Date:   Mon, 5 Dec 2022 08:22:43 -0800
Message-ID: <CAFKg=da86QCi=PHVoFTqjFUC0sP0wuoU5fJOPtQDYuuqsy=W7Q@mail.gmail.com>
Subject: REP:
To:     in <in@proposal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.
