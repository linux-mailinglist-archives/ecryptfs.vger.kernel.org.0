Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67BC3707B52
	for <lists+ecryptfs@lfdr.de>; Thu, 18 May 2023 09:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjERHrm (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Thu, 18 May 2023 03:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjERHrl (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Thu, 18 May 2023 03:47:41 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2DC2690
        for <ecryptfs@vger.kernel.org>; Thu, 18 May 2023 00:47:40 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ae4e49727eso18223705ad.1
        for <ecryptfs@vger.kernel.org>; Thu, 18 May 2023 00:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684396060; x=1686988060;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=UqGDnyKo9B2cq7FHenr2dpEBkx1/Dsm3kL0U5TrYfCwrmqWM9ViG0n6AmJD56XRnq/
         EB78DfFcUvycHrUl5rKoSWOgI9SMD2A5cn+iayu2qKMS6omh9EJlM7HCcQKbFToXgi66
         XpLH6p6J55cLGMQI+RxRleXbIIzzYgznjWq8kXT7rjHwFXtRrLgd0Pkqbi09a3AIrwe5
         1q52NJUO0I+cHaMNeZzLe+EgfZ+pU/UmL3S4w8iuUG1z7vqYfoUxCY/IwKVMlP49mz/J
         5QA0gwR5XC2KVYWDKSeFtP19v5KXqw927dWEj9n1RBTRVgL7zTYS1100SFJz5XQeDbfe
         SwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684396060; x=1686988060;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=H7R3jJYshYh3f/GtlRFR0YWzCGUnPklgsRx+GNdIbKjjjk/Noy198qIi+Xc2mGrALT
         XGWMup25na+Mkd1/rWAqbyzjX7BEIaFgHCKI2AW0iTal9UMz4QcDvPflh45smJSp0Sl4
         buyc0mW0lNaToOscp+Fd7QX/+SDkjt1CWgkT8cfTT3bejxp82dc964okSMIV/DHskeK0
         uciXONLzPF3fr8f7VD/l2Uysrd1n5Pdmix5yfpnhfSLwHxdqFQ8LQ10UTowLvH3eoVM7
         S7d+8R+nmyDRhZ/JEvsFJhlDtwF83ZFf1zPzZs5eUtXrcWv7SANc7htGvii//YRQBUNW
         dZpA==
X-Gm-Message-State: AC+VfDwORnw3uEnsoPgpr2JXQdiGgEYZY3Rk9bdZjmSI0UOsSyc4+mRA
        09PBVzAXwdRr0lJhL4P+y5X91GJVcsax2zyG+7Q=
X-Google-Smtp-Source: ACHHUZ5gbzQMmDNs3izBPEFPbpRH82t27i903ht5yJNdR8jwyOFfywvfI5XkuREnhoX6LNcTktTbb0tiTqnqrTFtx2c=
X-Received: by 2002:a17:902:d2c6:b0:1ad:cef8:f913 with SMTP id
 n6-20020a170902d2c600b001adcef8f913mr1853373plc.44.1684396059972; Thu, 18 May
 2023 00:47:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:6395:b0:63:dee7:2e09 with HTTP; Thu, 18 May 2023
 00:47:39 -0700 (PDT)
Reply-To: contact.ninacoulibaly@inbox.eu
From:   nina coulibaly <ninacoulibaly215@gmail.com>
Date:   Thu, 18 May 2023 00:47:39 -0700
Message-ID: <CAOXQc5E9oGpx6o5dVNnV238-YzUq+qQ=NNMK4bgSE2AqX5dQww@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
