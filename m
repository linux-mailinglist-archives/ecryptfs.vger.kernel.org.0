Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D339874C12E
	for <lists+ecryptfs@lfdr.de>; Sun,  9 Jul 2023 07:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232852AbjGIFzz (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 9 Jul 2023 01:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232831AbjGIFzz (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sun, 9 Jul 2023 01:55:55 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 556DBE4A
        for <ecryptfs@vger.kernel.org>; Sat,  8 Jul 2023 22:55:52 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99342a599e9so437754866b.3
        for <ecryptfs@vger.kernel.org>; Sat, 08 Jul 2023 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688882151; x=1691474151;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=YX0D9z2w5CrNevautKcCobsmlvdQBfeuqwmgXMt+wGc4j9olFxRbb82Us3YOLzDDst
         fMSVIG8KIa+Dy4BtQTOkFG48i5/G3Ww4yoKHnEaLxlprP3u4GCYXKMDJ1OH+vFxjfmrs
         5LrG+gYKeub3dagZkAvXzVwfSJMUpbAmFqOm9WbXvJ3SSVq4SqMNn9QQzS+vb9YEOjBE
         3cAQU3C5YDcz2zUCHBLIwdNyoqlC3m9/8NOL5KE26/iEOmKkbr8CAfVKhnX6L8RnydzT
         g//By2Oj4bkNHhbiu/IrQ/fygEJpoVnnrGkA0+7jyDLh4XQDjmY7MU8ljfack2uC2Icf
         cuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688882151; x=1691474151;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=MrQa3zCzhZ/s0DrnrvivxZKM5PUqW/XZJGU+k82wzfxEutE9GT1nNgq3+Lqqt7lqbi
         1iXoxJ7gfeOOyWmSAoy5Jq/jGXoagRlo9ojgIYKUYB5SKMLuHwpzFDygkx7W3JqYBvwY
         T6EmidxDAp3x8jo4yb7xGrQ0snPyogb1DsRSfQCQexm30TchglUeAqYzk/eRzIVrPHfn
         p82lcdwnHlyxE2YyncNQxOy6sHQaYiYrQE2gFfnTr/crgta6PESLfDT01hxkL4Z53uXM
         EVX2AwM8IqtOqF+sN49mIgMPu+3HftDvBclrawN2S16dmfwWE28uklbBtKdDa3ZPr1eH
         wTrQ==
X-Gm-Message-State: ABy/qLbAfXcOi5lAqKt8XtyqTjCBJ4bFUf2ZHRqeFwL16HXQRcPiu1WQ
        SoNF8ktj8uajMc/5k6PQSH0CxA3/35Z0DZfaDSU=
X-Google-Smtp-Source: APBJJlFSoep1zVTA/TFzmZT9mxPecEov3X8PylalCh05fxiabCOosvmKwPBJqobY8DlvcutpJ57+bSDBvEcEkoe1m3w=
X-Received: by 2002:a17:906:1114:b0:978:a186:464f with SMTP id
 h20-20020a170906111400b00978a186464fmr8142415eja.39.1688882150753; Sat, 08
 Jul 2023 22:55:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:5d07:b0:98e:25ca:4487 with HTTP; Sat, 8 Jul 2023
 22:55:50 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <cnina.info@gmail.com>
Date:   Sun, 9 Jul 2023 05:55:50 +0000
Message-ID: <CAObaCYvo1ccYE4P6=63WkBaqP03-QJ7Uhs+t6d+0pzaji-OQ3g@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
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
