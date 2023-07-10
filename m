Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC4D74D5F2
	for <lists+ecryptfs@lfdr.de>; Mon, 10 Jul 2023 14:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbjGJMnS (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 10 Jul 2023 08:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbjGJMnR (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 10 Jul 2023 08:43:17 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF6D9B
        for <ecryptfs@vger.kernel.org>; Mon, 10 Jul 2023 05:43:15 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-313f1085ac2so4212900f8f.1
        for <ecryptfs@vger.kernel.org>; Mon, 10 Jul 2023 05:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688992994; x=1691584994;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jvhbKHPRKfMEJS6inHuIrpCpyOh87s7quIhd+QJ98f4=;
        b=sVs2yd0B9SUvrBw7fYB7QfFghTuJ58u3xR6WKsplo3iy1DKBRkh9fLNw60yKf+8KBG
         LHNDmFTXBT2X2QXU7tgttYhhKy1MvAfHTwNwj85YtSwideQSmstkae8yH+XoY7+TSySE
         8UCSUKVX6Xr02N8kvC76+xbIBWTb01GWpRY6D++K1QAPLLgJf1bG1j4tp8NF1EObeWBx
         y6cy072vWEJN/YJf1mlENQSpVYqNrYtfAU64LQ0iyTtP6uf59NpYZqTmlJ+Iy2IVUsHN
         Q7wo6pzgvD8vohPI/jPPDDJ+yLvdjg/23/z7ZSfFWtUd/7x7pVxn20dqRXjRz6usTE6H
         PXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688992994; x=1691584994;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvhbKHPRKfMEJS6inHuIrpCpyOh87s7quIhd+QJ98f4=;
        b=Y5pFkSsxc7BbDqdoCxOm2eZFq1bG8/dOfwo2uyP6SLVj27UaLkyCkvg4a2q2a21As2
         tXvuFHhGXaQiRSMAgjeeDz0pWXdVDdKvPEj6SIJ2Vkb+bW/B+LO+KsZl1LOwWapeDIfG
         XSyrcqwMvyQfIjh133z85BJZFlhX/gApW7Fw4RN//rOGix/pcn5CcvK/NxksuQT+i1ml
         sR/xebDHAd5hCwB9uBU0+BCgGDayzzdTKY7BfmCXNn0/PSs9iYGT+o6uPB/dLHOopUVE
         rrVf5NmIE+ueFQv9m+0U11xenrNRsFByDS9Lyjc3eg419DnhcDwLX30UEoW4OyBn3VZT
         VOEw==
X-Gm-Message-State: ABy/qLYpoZczh1s8iH15DrQWBg4x6G8QVG4Ue3dSFNvNIRRhjrgxvah7
        53OzxuVtntqKBd3u01E+HUK2UH8kRjWlNOZwVGo=
X-Google-Smtp-Source: APBJJlGFh8FJ3GRGyde9J5hz+QL3Xd/KphRYb9YdzJtnyjOhVQWOUVk2nTlGI3g44y69hCpGX/rTSt/2Nt4cVDxD0Is=
X-Received: by 2002:a5d:6341:0:b0:314:2a9:1071 with SMTP id
 b1-20020a5d6341000000b0031402a91071mr9993384wrw.19.1688992994329; Mon, 10 Jul
 2023 05:43:14 -0700 (PDT)
MIME-Version: 1.0
Reply-To: salkavar2@gmail.com
Sender: mrmaxwelljohn@gmail.com
Received: by 2002:a5d:6b86:0:b0:313:f021:f60a with HTTP; Mon, 10 Jul 2023
 05:43:13 -0700 (PDT)
From:   "Mr. Sal Kavar" <salkavar2@gmail.com>
Date:   Mon, 10 Jul 2023 05:43:13 -0700
X-Google-Sender-Auth: kOFWX-3T986zRYwwyvV7yxzJ8PM
Message-ID: <CACqMf7AU34ojoJ3cMQ7Xeun688s2r4XMcKmiVmHw7nWsh5ZTOQ@mail.gmail.com>
Subject: Yours Faithful,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MILLION_HUNDRED,MONEY_FRAUD_5,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:441 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5033]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [salkavar2[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrmaxwelljohn[at]gmail.com]
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.6 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  1.7 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

I assume you and your family are in good health.

Overdue and unclaimed sum of $15.5m, (Fifteen Million Five Hundred
Thousand Dollars Only) when the account holder suddenly passed on, he
left no beneficiary who would be entitled to the receipt of this fund.
For this reason, I have found it expedient to transfer this fund to a
trustworthy individual with capacity to act as foreign business
partner.

You will take 45% 10% will be shared to Charity in both countries and
45% will be for me.

Yours Faithful,
Mr.Sal Kavar.
