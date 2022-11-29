Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C35F63C90C
	for <lists+ecryptfs@lfdr.de>; Tue, 29 Nov 2022 21:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237244AbiK2UOH (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 29 Nov 2022 15:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237253AbiK2UOF (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 29 Nov 2022 15:14:05 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE6F2AE0C
        for <ecryptfs@vger.kernel.org>; Tue, 29 Nov 2022 12:14:02 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id bn5so18575185ljb.2
        for <ecryptfs@vger.kernel.org>; Tue, 29 Nov 2022 12:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=B9LtmJOqzwQvD/C/SCy0LYPV+83gvaPXmq19dPcev16jEl/aA7oJJGkHvFScm1jGCZ
         xgE39y/Z4ETjODyTey73im/27O6sueNpnWddcj8E20hdMfSNw0R31vU4y4czmUDmLwwV
         SLb/vx0IBv2uEL5zA5cPonniJ0TAwi0PAphK83h1bUaXv9/KArodOIFKJe5mCpVLnczG
         8mXgSzV14VQuYcdxKFgyNCLrhnXvR5dsfOB+CJmnO7IWTIibLaONFp4fBXIdOmi5karM
         grruZFvyFBB7LPHWeZLM2lMF7hMYW/K8KGcp72vbQQpcqkrjxAO8XJEtNNtZK1nng/vc
         00ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=OLyZb7t6EqkJ6XVb5iWMkFojJcIsPfpUEUjNpsnEe1pGS/Xej5Tjqr+DPa0R6BUllE
         pFYBjVe20jebmZZodMe7mKwWsnLdjTbwxjUVIETYtZWejiCVTgmCUaQN5YqDvZrQbiFC
         U3qgQWPj7jYSpYF+UtpGG92cSfkAHwPUSzYKs1BciVCJ7YZAVbhOKBW1Lz6r0cWVmCfl
         6VsUPIa8n1LFBILlHZMfhCG2oDql5/Q+AuQ3E1m3/yPpK+s4X/CJmIF4FuTHBDARLSH8
         TCTuOT6ryqjGN4pHyWghkzMurcM5JPmCEuXayFAnvhjmfti2qabpO0cPaZDLjC9TLTBZ
         lvMg==
X-Gm-Message-State: ANoB5pkClO3tA1RVlLhF4rAn7wjUy8qT3DmmxC8Kf+L0q3pAs8f0p2Fq
        3u6s6ggg/GXS+VZLxiO03SP/2GupRX8sJm/QTVM=
X-Google-Smtp-Source: AA0mqf4kX9cgyD928ukN8tvEgXU57aO4CZDYeTZZ6h4pJ3SjLKQbanuqtFlGXszqkEhe3HPrMaqHIG+M/8lNT0ebGt0=
X-Received: by 2002:a05:651c:2ca:b0:277:1e9b:2b07 with SMTP id
 f10-20020a05651c02ca00b002771e9b2b07mr20232077ljo.242.1669752840350; Tue, 29
 Nov 2022 12:14:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6520:2542:b0:22c:9bbc:bff with HTTP; Tue, 29 Nov 2022
 12:13:59 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <joykekeli2@gmail.com>
Date:   Tue, 29 Nov 2022 20:13:59 +0000
Message-ID: <CAOikvbveHOBxyqBv7dCPZaaSA8u4GLkMwkNgZOkA27bK5GmZ1w@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
