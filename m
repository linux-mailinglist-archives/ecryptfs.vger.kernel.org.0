Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59AA86EFC38
	for <lists+ecryptfs@lfdr.de>; Wed, 26 Apr 2023 23:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236017AbjDZVLV (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 26 Apr 2023 17:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233622AbjDZVLU (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 26 Apr 2023 17:11:20 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F277283
        for <ecryptfs@vger.kernel.org>; Wed, 26 Apr 2023 14:11:19 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94a34a0b9e2so1132317366b.1
        for <ecryptfs@vger.kernel.org>; Wed, 26 Apr 2023 14:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682543478; x=1685135478;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=JCjI1W1olCwSFMM4DovLC8VTMUOpLXvvi7vSLQ363B9Ydj0MKNLDa9QC0T/xjQ9G8K
         JyS+VwuerQNATukhxGKaBT3iZYp15mLpm96KIl57x0kfzbGSRpo+6DYIEikB+11zhxlI
         TCfSFUuRDaDjCDnM9yQ00FHDMheE2QTG6VpMhVJXptFuTB0E8+je0rO3sMSJ8HOMwwRw
         7uWgtAvuHwk11ytBM3lEdtMTXlsFDKE3X0kZ4q2m3MG4cSmYX2LT5eTRWkDZbzjr1ian
         7kPmNUqNMjQ5oMgxWBvcDr70vi7wzK0V9gfIvdldR9hF6LeJkps1Qka+oJv2GRTL5qKp
         26ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682543478; x=1685135478;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=F7rTxf+HLc5fQxaOO7Zu8wckfzSkv19JQ4vJVFj06UPpkFo3Uysx49QOA4S7gG4ZyA
         aMoSu7GdDajH092X+GELXU8qRcK7oioLn0Zd9RD81/4hMi3x9Gt/vIH7BBd4AmUqXrG2
         LIn+/r3P2y/a1+lDRcEg95Ma9r6v8j5+LSV0Vx2BgRARcD6U8dzBOVTQ/F6zqmS2Gpax
         6iSAzO86+RzRyPso+bM91u07J6/sVOVUAvmODBAXc8Onatq73Xp0ZCDdgmSGMxtP8J3O
         LPYlSTvYwSWqQwYrgYDWnUCwoIMvrKdyVZTqZtJgPZSHB3YAIWlNUuudtgXYyI+64MdB
         VpjA==
X-Gm-Message-State: AAQBX9c571Dqobd5W2cT5TgiJqwq8vHZLqfwWEWGgcU+F9RFd1Omfqw9
        7xFXcrPa7TAq5R1gELFa631gQXa5xgQG49ga9pU=
X-Google-Smtp-Source: AKy350bRXVOHaTEPgpOd+yDp9DWMMAv9KvDo+Qnre9+sX+c7qx0DUa5MmDpEcOx0rT33JLSJyEUC4X379E9EbqPiXA4=
X-Received: by 2002:a17:906:eb91:b0:953:457c:7976 with SMTP id
 mh17-20020a170906eb9100b00953457c7976mr17643491ejb.23.1682543478365; Wed, 26
 Apr 2023 14:11:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7412:4783:b0:c6:d649:3a3a with HTTP; Wed, 26 Apr 2023
 14:11:17 -0700 (PDT)
Reply-To: klassoumark@gmail.com
From:   Mark Klassou <jamesjanneth27@gmail.com>
Date:   Wed, 26 Apr 2023 21:11:17 +0000
Message-ID: <CADCRY1eTpCOnBhmSnV+4RGd+bZzMWDxsCD4qmynkHQFCwHR7Dw@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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

Good Morning,

I was only wondering if you got my previous email? I have been trying
to reach you by email. Kindly get back to me swiftly, it is very
important.

Yours faithfully
Mark Klassou.
