Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC5F4C06ED
	for <lists+ecryptfs@lfdr.de>; Wed, 23 Feb 2022 02:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233018AbiBWBgA (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 22 Feb 2022 20:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbiBWBf7 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 22 Feb 2022 20:35:59 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A2C4A923
        for <ecryptfs@vger.kernel.org>; Tue, 22 Feb 2022 17:35:21 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2d625082ae2so194811897b3.1
        for <ecryptfs@vger.kernel.org>; Tue, 22 Feb 2022 17:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=S3JtR5HtN5TgHtZRkOpXh8ju3yrdK90cRx1M8SbEib4=;
        b=EyrCoBqre0aPtM4p1li/YaW94xCO1FNthvZqfKlcb8B/Ubpg9+uWh5tqfOse2VTqSo
         jqWDxHigwm8+DjlGfc4d4UZtexyai8pF2DLe5jdXCHC/SAyUWGjHwZDjC55RJONVtPQG
         CXlO7fKTjHZ6s+WpgEqVHmZo9ga/lNPmeUriXntboGLg5eJHL/ppfccgUUQIx4bbtMDz
         JEejU4yg4YoqC5k+cqiINGWnR0sylUdoJJPycBxzzwSN6zgwTs+Mqt+xVSKbkiX4nDq5
         8mFrgDBFUTarzr4AwIWgg6SZjLrNLuR9t8RqzzHHi8DOvXHtTCl2DQOvkPdJbME57i34
         AlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=S3JtR5HtN5TgHtZRkOpXh8ju3yrdK90cRx1M8SbEib4=;
        b=csEMj77G5JIvGC5KI3hftmUZb0rvvYk/AWk3ksAcxWW/FWQZ8m17u2yFHncW7f3aO5
         8ScTD+jj72Qv2dgfIgktikwrWVNY1MKNYu+AwvMJ/K4FMWfZRU2425WBecl3p8oq31yy
         R5JzqAGXpq6tDzLtZv94I+f2gA9SHTY2xwikYXw75JrpaZMGvHId/lMbUXTAiX+++7u3
         3tCrWnWCa1Gf+rFqoZlyklykcwipkts18CZWKbrxV881z0EZsBxtjr+PKiS4mgfTXxQZ
         mi2VpawsB/AQBwNkGHaM9miNT+0pF8rjc/R+EPmYkeP6WfcZKl+AbrPNoc0qE5QL/I5H
         lhrw==
X-Gm-Message-State: AOAM531FQVEFXlqyQuhv7UApQqshkRC3CNGgNzPuVb1Fk8U4GbSzFNJ2
        bQXnjb6BV57lUrP4Q2Xh8QcPH1532RdpD5KBCzQ=
X-Google-Smtp-Source: ABdhPJzQZ/km+lEejW4hqEAjJL8EHQAEb/je/hYlT8fITpKrI2FQ4iOAVnQEF6h++C0aOBt7n1wCU+ueyN6PNaPxteY=
X-Received: by 2002:a81:6357:0:b0:2d7:2af4:6e12 with SMTP id
 x84-20020a816357000000b002d72af46e12mr13651190ywb.317.1645580120879; Tue, 22
 Feb 2022 17:35:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7108:7048:0:0:0:0 with HTTP; Tue, 22 Feb 2022 17:35:20
 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <arafaeloxford@gmail.com>
Date:   Tue, 22 Feb 2022 17:35:20 -0800
Message-ID: <CAM=40B+7kJ9Q9EsPr8k_No1XBfE+np6aToovi5f0hdZKtFBPZQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

-- 
Please with honesty did you receive my message i send to you?
