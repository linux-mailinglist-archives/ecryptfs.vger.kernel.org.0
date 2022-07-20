Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FFB57BAC8
	for <lists+ecryptfs@lfdr.de>; Wed, 20 Jul 2022 17:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiGTPse (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 20 Jul 2022 11:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiGTPsd (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 20 Jul 2022 11:48:33 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF46A65D46
        for <ecryptfs@vger.kernel.org>; Wed, 20 Jul 2022 08:48:32 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id b6so10594058wmq.5
        for <ecryptfs@vger.kernel.org>; Wed, 20 Jul 2022 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=48fj8+SEYseTJxEMnEnTvEGFV8gDAw0PWcc7VlH/EIs=;
        b=WChzXgpr8erszIXq1GWOX91Frk8XPp4oOhd4iD2SP94F2tUVTp0+pI2qSXrCHJxiO5
         7HSZPQbfz7xCUDMDEs8Set6SWa3shdbwCiLKPk2gCr4hqm+6GvHFPenFjRwhPJqatMus
         cDztuEPdfXhRSA8k3pYLVAqaAzMx9PDdmOoi9rszmG96qCrT5q/jDaO2LFzIMxMuf99z
         BRQeLtTW6/MVp+2zGZSwqpuhDnTpUvmLsG2NmckcNrBphS9GuZYXakNcDFcQSsonF4zR
         AylWX1FMUPlpNmL20wHv76l3G00rxYTkgIQJeE7ucO0inF/FylOSlURtYsYqSEplrzci
         y95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=48fj8+SEYseTJxEMnEnTvEGFV8gDAw0PWcc7VlH/EIs=;
        b=w4YUCCOrQ5lOEvVrnUw03PBuhAhYMsYR3/i4+mZhW6A9R6KyUd3dH5t15l2lMV0UYA
         LT73my565Hq3J+pLDR1BQqiRWkhsosy2WKcOPrSekk8q/86xiL8P6e60S7WhVUghHWSD
         FYMawypTr5MYaqyarZ87IhX6YPBhENhJIsN7kgH5LoeOIy+ZW9890DC5AgKoXxQlTcb1
         MAfGGHQZVfZjS1iV6ZC0UbYWHuUPcOZ8LJlxffI8C5SRwtOsWB6zdbNnzLwApcNXxUD5
         giU1+3U72uhQJSSQxx2p+DrFT30O7d90xWLEo0zG6gnYuh9J1d2HeP8qj8DGljkMjsqw
         +FQQ==
X-Gm-Message-State: AJIora+U2XbkAmyq5mmPmpTDpfkkryVmT6V5zj0fwCcVTJN4F9t2+J+/
        QP/3BB09F5YkItzRx0dV3MeACcP+xwwkekFOtog=
X-Google-Smtp-Source: AGRyM1sI5NQe8iTAjZ3IovW9vI0bVtaQMVZgYwBBFw5brtGj1VqZ1v+YMzbr8iZZpkJHIV9Jl5X+DC+OvdROhL/qHqk=
X-Received: by 2002:a05:600c:3ca4:b0:3a0:1825:2e29 with SMTP id
 bg36-20020a05600c3ca400b003a018252e29mr4386066wmb.11.1658332111332; Wed, 20
 Jul 2022 08:48:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a7b:c404:0:0:0:0:0 with HTTP; Wed, 20 Jul 2022 08:48:30
 -0700 (PDT)
From:   D B <kosdav71@gmail.com>
Date:   Wed, 20 Jul 2022 15:48:30 +0000
Message-ID: <CAN6u_H_zqGQLiE0Kqap6J=++pX1jznDuQFhYC-30ZfiuYxx=Xg@mail.gmail.com>
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Good Afternoon,
Please am still waiting for your reply on the mail i sent you yesterday
Mr David
