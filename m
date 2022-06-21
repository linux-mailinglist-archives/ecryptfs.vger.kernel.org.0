Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D79F552E75
	for <lists+ecryptfs@lfdr.de>; Tue, 21 Jun 2022 11:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348890AbiFUJfV (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 21 Jun 2022 05:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349022AbiFUJfT (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 21 Jun 2022 05:35:19 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB2C25E93
        for <ecryptfs@vger.kernel.org>; Tue, 21 Jun 2022 02:35:17 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id l66so22035868ybl.10
        for <ecryptfs@vger.kernel.org>; Tue, 21 Jun 2022 02:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
        b=KabZBwKxxxseoW6WTHhbd8sZYV9tWmJ/LgGa7/+/jbBhrnBbr+IYwVV5AbvkRlTj1a
         IrrZmiKlHGXCsZkPcMT0tlDZRoSIdcRDW4s1yr3zVwzS8cVkeYQT2V2sq22VNZixM3s2
         ZGlZRiNWA7m8BImKQDltoZ6y0WMN0+onGEFZrQ7opwbnQvly7bVzpl61IYHfgiNy1EUo
         rHCouPM/FjOyJ8p0thyA9NZsRI7L2NmNur/60QxQZtTXG92yWJXjfZgvpGaxchf6Rq1t
         4Nv7cIGcYW5yyY/D2agwYbeb4o/lCVPq4jFDUv2/xVmc/rj3M8siFdEGeBnYb8nzWy0M
         n7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
        b=eWiA2zE11v4jZgERHBjQhIvtJ/ddGE3pDGZZUmwK8rM2wZ/PQfVnTwxWc6jEDlnINY
         gZzP7IFwcpNj7a7n9DTDGCxKzgcaK8IqjvX7QbWwdxyn2rm2Ear9PiB6UT3dodtgGYmQ
         IpKuvhv+ZnFG/WQM1scMjcVVzdle0YoNR7R2FNPkdBNC3J3wvC3BVOW59xEynJCgJeXL
         qf+5BKGwFZeGx9OPFcWILThpkrMkbUB84uZDb6zKQjvUQoDbTp4B7VsgBvtf8tzSvzAG
         PHcChobkyR/+3Td/h9NwyFixw8uEL/V94Wpy8+VJWoc5jY+eE3dEyO/xh1zyA6n5Ip1e
         g+FA==
X-Gm-Message-State: AJIora9eE/h1eciB25kEuYUQ/4or87PfhZTg8/7JBkG8LrzwBfOYJGNu
        AUJUYZI3G4g6EbNV/wGkE+rBKUxdPjw23ujgxXs=
X-Google-Smtp-Source: AGRyM1vwscWkh7PjMkcqAaJCE3pm6vGNjjWh4oztgIUedbbyR+3Z1r/EgLtTomk0oZSRtHWGgYwKDOs/U27GLAk8LUM=
X-Received: by 2002:a05:6902:1c6:b0:663:e9d8:3a73 with SMTP id
 u6-20020a05690201c600b00663e9d83a73mr30134992ybh.567.1655804116979; Tue, 21
 Jun 2022 02:35:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:e10a:b0:2d9:e631:94d0 with HTTP; Tue, 21 Jun 2022
 02:35:16 -0700 (PDT)
Reply-To: dimitryedik@gmail.com
From:   Dimitry Edik <lsbthdwrds@gmail.com>
Date:   Tue, 21 Jun 2022 02:35:16 -0700
Message-ID: <CAGrL05bgySuGHj9N3Ft_aPoQ21POvjn87Cyw=k5o3kDVv_r8Xg@mail.gmail.com>
Subject: Dear Partner,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b36 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lsbthdwrds[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hello Dear,

My Name is Dimitry Edik from Russia A special assistance to my Russia
boss who deals in oil import and export He was killed by the Ukraine
soldiers at the border side. He supplied
oil to the Philippines company and he was paid over 90 per cent of the
transaction and the remaining $18.6 Million dollars have been paid into a
Taiwan bank in the Philippines..i want a partner that will assist me
with the claims. Is a (DEAL ) 40% for you and 60% for me
I have all information for the claims.
Kindly read and reply to me back is 100 per cent risk-free

Yours Sincerely
Dimitry Edik
