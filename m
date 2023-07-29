Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0FB0767C22
	for <lists+ecryptfs@lfdr.de>; Sat, 29 Jul 2023 06:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbjG2EfJ (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sat, 29 Jul 2023 00:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjG2EfI (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sat, 29 Jul 2023 00:35:08 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 176AC44BB
        for <ecryptfs@vger.kernel.org>; Fri, 28 Jul 2023 21:35:08 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5844191983bso2905227b3.1
        for <ecryptfs@vger.kernel.org>; Fri, 28 Jul 2023 21:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690605307; x=1691210107;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RE5l1VpxCufAhFhvUtJmOdSBkyXi7tvoVHorDEIVEKk=;
        b=KO/MQg6iR4E5ZnWVu8tsRmoiljqqIuUSsn9P33MDBt7zSRUMpYi5mI0HBunmnWV1ed
         Q3rXMaQk/offmcTm+baiAjjBxYyu64WvUyUbrJ8YEgHeF4elNUtgyZWVPn9TBIatPK6q
         FiMM86IRQn/SOsb4GHtKMFZNTB9RjFwby2q+6p9cL7d7vj63OOb4biQb9Ep0r2R2Pia9
         QbEMhSdQju4PzQwVSuJyD4M0udaeJBWBaUQbYtUaTfLGZgAYk2R68VMATjXEnHbpdtT2
         8OMcBvBczgO8hDKYNew3MIYBqi5vb97J/wFnW9/FFgGLjJSNtrRlWt6olxBbLSzlHQX0
         xfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690605307; x=1691210107;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RE5l1VpxCufAhFhvUtJmOdSBkyXi7tvoVHorDEIVEKk=;
        b=bWDTvSTWSJzX75AfGV7IlPncd5bApQIInGZBH6dwqliV6SOnEJE9z44aJQHNOoGUZo
         6LrU4aN6RXsPqoqW0jQEuP0VPrIssXLAZXYVXVd7L2T7pTqG8oJAd2Mb7eYe/WZYXKME
         ItaAhmzLvLpKryAyKmZAsvItYmFFnKAPS8dpGKldZ0CpuDrtABUbSC9XCol7XQPDVqEx
         awMXlRQRKlTSgS/n4Q4n7D81Jrlx8vJyhaHxrTS+98oZVuFLsRDcG9kR7FXdh4Xu5lgt
         qPpc6v371wbeW02HtUoLU8S2XpCj6fZRYQtNcewTOAROHEYl03tFX6ax36DxXxvSlTTh
         bwpA==
X-Gm-Message-State: ABy/qLZqcYtzT0vN0qhTjeqF09pHGTXTBInwbHy6gv58FPQxdKMOqhTX
        HhXq6gzZxRt0FKrLl1gGB3nSeitPtEZhmpo3Luw=
X-Google-Smtp-Source: APBJJlG0gbxwHYHxTyy3DsklzPz2rX1rguxCumdGcazC0+iQyWRO/rXbyYpdUlTDVxnLDLdfslonq2GLBwoqDk5GOq8=
X-Received: by 2002:a0d:cbca:0:b0:583:b4e8:da62 with SMTP id
 n193-20020a0dcbca000000b00583b4e8da62mr444916ywd.4.1690605307197; Fri, 28 Jul
 2023 21:35:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:6326:b0:31a:14a8:aa9e with HTTP; Fri, 28 Jul 2023
 21:35:06 -0700 (PDT)
Reply-To: bintu37999@gmail.com
From:   Bintu Felicia <yerobarry10@gmail.com>
Date:   Sat, 29 Jul 2023 05:35:06 +0100
Message-ID: <CAD1=OdW9j+9JTTNF8jPZuAt8=7=8uWk03AAVBgn5fxZ0ns4n2Q@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

How are you today? I hope you are fine. My name is Miss
Bintu Felicia . l am single looking for honest and nice
person whom i can partner with . I don't care about
your color, ethnicity, Status or Sex. Upon your reply to
this mail I will tell you more about myself and send you
more of my picture .I am sending you this beautiful mail,
with a wish for much happiness.

Warm regards,

Felicia Bintu
