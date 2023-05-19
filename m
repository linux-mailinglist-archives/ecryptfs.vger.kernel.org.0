Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A918709290
	for <lists+ecryptfs@lfdr.de>; Fri, 19 May 2023 11:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbjESJEN (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 19 May 2023 05:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbjESJEJ (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 19 May 2023 05:04:09 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B318199A
        for <ecryptfs@vger.kernel.org>; Fri, 19 May 2023 02:03:36 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-392116b8f31so1117653b6e.2
        for <ecryptfs@vger.kernel.org>; Fri, 19 May 2023 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684487015; x=1687079015;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=CsVwniBqm2R6mGc8fdie3BOhI7ljQsWztFa0zcrYK1Rj3aBrUnieBXF84NEVX9z6IW
         FE8heEo4v0Ci9SBhWZDpUab6bdj/8phn1BAdkRUt2Rlcfj5/t65L4OUs01ocFbStx6Ce
         Xny0UUcVaveu7a/2jE52uXtaOQWxbyLrCUaQZG6AZrMSN9P+AF2pXrNx51/tKZmiHhNN
         P3P/vCCweU+jGYT2AfjvwQE5gLiTSigurt9HscuKNmfig2a3srmgNuztAcD5SW7FyQYP
         /+airziQi9gzDgYQvm3n0QrommrP8M/17vYBk+LEr2too6hdWSXGDEdINaGF5+wcNIAq
         z7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684487015; x=1687079015;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=VWFbTA06+OwSObmGPMXICTOT+PZjLw137ofK3j0GCyQQAI1QrC0yHgn/3hCfTh5ad9
         MgvIxDeIYAHEgVNR1eqYnszFuRpZgf7c5nnKUyFeLXyoGyY7gUpGWZNNmruC7rVUSvXs
         T5rJUpgZHackqpBJg5GnAdcUroLvK0eCgPEDfCibdc27wN+ggzcPjYgO9s2UOvVZ6hKi
         t3UcQd0iSVBa06hVnGF77vIpahEhIiXSyV3ufWcG23p0BI+xyb2M0T/nBhksZ+Q8NDia
         3FFT5wELqkF1Pguks3C4IugSAlsMTJU+SYedq1Z95yTzlhC7YM90FMhfKcYyUlos4SNw
         tl/g==
X-Gm-Message-State: AC+VfDzrlYlSpmaZrPf2bmSi4xkXYFhOSaWvipn9N+Lh8zsQPmE4J0dL
        fao32kIQkk7eCDWn09tzaH0dtkoCXo8VJdJlXUA=
X-Google-Smtp-Source: ACHHUZ665/buXE0fSL/wi0bgTsV7DhQe+hMMlpmwcUM8eDAt1riWy3pOk5v3/95rS8jnU2IWAPe0WJHsVebNGkzoSaA=
X-Received: by 2002:a05:6808:94:b0:395:dcd5:52d9 with SMTP id
 s20-20020a056808009400b00395dcd552d9mr642916oic.33.1684487015639; Fri, 19 May
 2023 02:03:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:63a6:b0:eb:2716:3f1d with HTTP; Fri, 19 May 2023
 02:03:35 -0700 (PDT)
Reply-To: ninacoulibaly03@myself.com
From:   Nina Coulibaly <regionalmanager.nina@gmail.com>
Date:   Fri, 19 May 2023 02:03:35 -0700
Message-ID: <CAHTAA8p8ddbLtFycOnbC6u6h4bUCCLDbm3x0t-nUbmmNvMwdyQ@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibaly
