Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B894C594CB8
	for <lists+ecryptfs@lfdr.de>; Tue, 16 Aug 2022 03:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233130AbiHPArD (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 15 Aug 2022 20:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348791AbiHPAqZ (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 15 Aug 2022 20:46:25 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6887194E7A
        for <ecryptfs@vger.kernel.org>; Mon, 15 Aug 2022 13:44:40 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id y18so6441682qtv.5
        for <ecryptfs@vger.kernel.org>; Mon, 15 Aug 2022 13:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
        b=lePN+MN4vhVMjMqhdjhXbsKxTwxBkZuvWYKO2A+kQNQv19AVLA9horIbKNPrRgK1+D
         DZviHqNnMMZLEdipZ9AbM/gCUbtw6rRwvSyOF6IFCUZOOiLwyidNlQbns9gEqZYbtCX6
         j5lBIj+Rqtst5eghQVzykpC1SH0tYVTE+NvITrUKrLSZLpC6vwql14W5cpvJNugqFhWF
         ZKds8qok4LOrmDKmnjaYCEB/f4UvJ1Db9PhHRyeiwFpb9FwTdvBSb3uQjKl13OFbMj2t
         U7m7np/mkKcBFkHiUcUzyTPs2QS9P1n0P8c2fBsfMoCKh9xkV+rZo0hA7G/tUHF0gt7k
         4xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
        b=vxZQOCqu7MrlkFaz0E28AzWHcbczkRFu9wcaPo5tKZXoJWSTxKiaMZF/tnKv+9hYZ8
         w+5Ot5RVxhefy5fGljvkuE7gH6SHdDYkgRcNiGa5Hzsvp/k7crLQ1RaYMGI7EoSNTkY1
         ccIB+rUhkzXJjF+cjIepnlXSuRst3Vv0jlZwgMLL6MrLyVQCTn763vUiPjNJwygoapKQ
         LA/jYmsFQYCTsb7mv2yKMWuPk3lx7gpbp8hEzzfZ1/RcTGtjSjsB5vuXWc5IGyPL6v80
         EcEL83bUNMVX94VPSh8GZb3wlyXqLv8SBDYhDos6yFpLaXTPM1IzBDXwGdHsDi9B2aJd
         ELLA==
X-Gm-Message-State: ACgBeo0SAJAACPcf5E633dZN9jhVK96OHSvP+l54gtu90Z6Q8t1+NQso
        ZiETxla14vg8By94gyYS1J5ZUokIYvlUL3lJKg4=
X-Google-Smtp-Source: AA6agR5P3Yk3RO/3Azu56Qv5ayvx6f4Aw1qKTUS1riB5McA4QR7LNLFMLZB2WRmLcyJqvf8PFPJ6jHIe7ioz6MY1b0s=
X-Received: by 2002:ac8:5cd0:0:b0:342:eb4f:6e36 with SMTP id
 s16-20020ac85cd0000000b00342eb4f6e36mr15726829qta.638.1660596279707; Mon, 15
 Aug 2022 13:44:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:ef88:0:b0:46d:3a61:256e with HTTP; Mon, 15 Aug 2022
 13:44:38 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Prof. Chin Guang" <dmitrybogdanv07@gmail.com>
Date:   Mon, 15 Aug 2022 13:44:38 -0700
Message-ID: <CAPi14y+2HCL7F4qs5ahske5u55MtcHKyRri6MK3Vb9Zd_h1ySQ@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:833 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [wijh555[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [dmitrybogdanv07[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [dmitrybogdanv07[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

-- 
Hello,
We the Board Directors believe you are in good health, doing great and
with the hope that this mail will meet you in good condition, We are
privileged and delighted to reach you via email" And we are urgently
waiting to hear from you. and again your number is not connecting.

Sincerely,
Prof. Chin Guang
