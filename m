Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4A452C67F
	for <lists+ecryptfs@lfdr.de>; Thu, 19 May 2022 00:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbiERWp1 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 18 May 2022 18:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiERWpY (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 18 May 2022 18:45:24 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC14117789E
        for <ecryptfs@vger.kernel.org>; Wed, 18 May 2022 15:45:23 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2fed823dd32so39548297b3.12
        for <ecryptfs@vger.kernel.org>; Wed, 18 May 2022 15:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=liVPuF3m3Fk2ACJOg1lSIY8l+HI3a9+PHT7ISK4ED1+jGvzJ04IHzgCiWzwuaEQCv5
         keIDgY637Dv44/gMO+tt1pWiScyOLsGZetdYm8Ugygmy0sWxwMasnL8oGlmf6gH+IvfA
         +d8n2xu7Jf3xND27WLR5+Zl0sIZC5rF9h3O2vPcTO59FEV+4dQQhUVNxUnM5px57kjXu
         nmftGWTgQbaOiPwkq2HK2sDMxKMGorMEczdg8yKpkTRl0CZ2Wvnri7OdxDWxpCOEUkk/
         iy+Fu0Frb2ciFWW0aATaW60nj1kbCGtcC/u4kvyX7pYNOY3/HWbO/NaftqB5jVq5HV1s
         fHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=KC1dyw6ZslObdv+8smnXgYhWKk5dUCdWdTnyyO2Gmc0uBLG1bsjTDaU8VOIJRXBIgY
         EdWJQ36kUfbE9yNxFzxfYTBCR+qdD5vjrNOzJUtrS4tutFHwceaExJPZuVbYWgP7b2XD
         JJcUJHPd+oZzqbyP9LkoVMxEcr0aAJWivo3tS74fFjG22de5wuqGZ/uFEKXXLoGnVMqS
         6684fvQ+uZChlUxofjj5qNSm6jJZQQ0Kkk5UG3jg3p7nx0VYAAxdENOtIYcUS51OJTE8
         /IqYNpBlJQ8zs1VMcUE4jeGCGZcEctqsG/Aw15zwh9a+5Dn0M5oUSRNJTQXWEflxwIRn
         oAOA==
X-Gm-Message-State: AOAM531UJRradbyH3GOAjbfSb/plsLmM7ZARFDSycU3cgqThmqc7Z91/
        rW+VYa5kG+3f0DI/IbdKdtMK7wIHibDA/7pFJLI=
X-Google-Smtp-Source: ABdhPJzHbeDFIjjJOoqfqNYJeESIlrJDpZ8/tpbRBJbK7zxydZBB8wB8nvH0nmAoIGgjxH43LL6RXtc+wLrRW/m0O2w=
X-Received: by 2002:a0d:d906:0:b0:2ff:3e6f:4d7 with SMTP id
 b6-20020a0dd906000000b002ff3e6f04d7mr1743243ywe.174.1652913923079; Wed, 18
 May 2022 15:45:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:7143:0:0:0:0 with HTTP; Wed, 18 May 2022 15:45:22
 -0700 (PDT)
Reply-To: tonywenn@asia.com
From:   Tony Wen <weboutloock4@gmail.com>
Date:   Thu, 19 May 2022 06:45:22 +0800
Message-ID: <CAE2_YrCFqfox-36yywt2NDK0N6ZyPm7rZBPF1tRC4KtjOA+6SA@mail.gmail.com>
Subject: engage
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:112a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4986]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [weboutloock4[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [weboutloock4[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Can I engage your services?
