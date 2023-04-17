Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A006E53DA
	for <lists+ecryptfs@lfdr.de>; Mon, 17 Apr 2023 23:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjDQV3h (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 17 Apr 2023 17:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjDQV3g (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 17 Apr 2023 17:29:36 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35724482
        for <ecryptfs@vger.kernel.org>; Mon, 17 Apr 2023 14:29:33 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5066ce4f725so3327896a12.1
        for <ecryptfs@vger.kernel.org>; Mon, 17 Apr 2023 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681766972; x=1684358972;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MykftQ9vqsw04OqgCh7rrq9rV2ToZv4V/lyH2OaLw/w=;
        b=Kb/+/E73gt8CePuqnizpIyXZVq4gNe56lO5JYS4AJpNaBN1EmRdDaJFKPA674/SHZj
         4M+IJXrf8ZNUdglnDMDh87rANRAU8IiroMtzDkQEutVveLc38THyHeo0UCKpmdz/BdMW
         1+KAKwucYAfnIYtptVwXy/63CnzCywaEMQYrprIhDbXsqfoIfrvsxMFz2kE7c/wdFTIC
         SCOTi39eFMe14qAHwAWdfCPDLt0SwJVOH+7jUMaYrIeeWzOQrQojZIyOkgn69h3MNly6
         Floj6kJTIKPAVwJ5MPJ04wBOLv2uPbVtnWnWlH63lcN4Ms/mOzLACgfJblojTJV3jGym
         Y/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681766972; x=1684358972;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MykftQ9vqsw04OqgCh7rrq9rV2ToZv4V/lyH2OaLw/w=;
        b=BulAEv1hkr445WEanSph7bNJ4t1oOgGubyTNLeqprpy/hXzGNCnBskZ7h26xHrlXMc
         e2RwpbxoW4XhYWUQ7TLReMOvz2RZppu4x3zyOUH7fWshlpg+eBgrMuCfJxOd5vajA3ai
         0yE3G8efHpUVXaaffM2rpAEDguFzMX2fEgUDKqIpqDKpTmejdtKvs5Q3/XpZ2gTrwJH/
         FmoQo7P8P7M0IwNGPEuv7w9MqgbvonHzaA+0Khjl4JBTnrsrwlMgAy7wP2p9deGm7Imc
         WWerxKnWJW9svR4EGyjNSNjDQsf6M1iuy0qXxlzf+f8k8ivLJCBcFIg9ACSvCKxWwcp1
         6xhA==
X-Gm-Message-State: AAQBX9eLYW4lVHCLkql4Cto/eLjWlcrqqdr1+TOVYY9cy2+Q50dBwnUX
        78cRkXblOI1107Y6lyNZ2WdkdhOUhxr1u8aI4EY=
X-Google-Smtp-Source: AKy350Y2CiCIb7pGhufWeTybdvpSo9/1MXkdU/S/pUrpZ8Ja2eTGts1MruVwk77iU1L5T3HwDO29TuYDTPOdRb0fa7c=
X-Received: by 2002:a50:aa9e:0:b0:504:81d3:48f with SMTP id
 q30-20020a50aa9e000000b0050481d3048fmr191109edc.2.1681766972241; Mon, 17 Apr
 2023 14:29:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a98:d8c6:0:b0:1c6:55b2:a3d7 with HTTP; Mon, 17 Apr 2023
 14:29:31 -0700 (PDT)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <regionalmanager.nina02@gmail.com>
Date:   Mon, 17 Apr 2023 14:29:31 -0700
Message-ID: <CAE4etd68cZmtawXeJWUq6NhZ0ZKzLOU=uo-z8WJJAxk4eJkRsw@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs.Nina coulibaly
