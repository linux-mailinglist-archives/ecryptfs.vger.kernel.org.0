Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5343B53ADDE
	for <lists+ecryptfs@lfdr.de>; Wed,  1 Jun 2022 22:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbiFAUng (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 1 Jun 2022 16:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiFAUmy (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 1 Jun 2022 16:42:54 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E229060070
        for <ecryptfs@vger.kernel.org>; Wed,  1 Jun 2022 13:25:22 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id l84so4095286oif.10
        for <ecryptfs@vger.kernel.org>; Wed, 01 Jun 2022 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=RGd9c1aErSn0Z6Ze8KLoF3EWbTH/9kTlwI+HC+SAx7dzvBrwHHsKOlh0JbRb09xcBP
         iM2OCHeO/Jrl9Xle2mDSw6T0q2WeDDZSG5qe5a4Dg+cUelC504vEzjOQufYXWP9aJXgI
         V/LFJCahzAFFpJlr1tiv2Vp4M01X+B3LdrfN7rOxB8bGQcOq43FjV1KDwVfyhOisNkOG
         FD6f0xHzXypVyOoc2S2G61yyKZweooFWr6HTnKbFSpcoQrcxWgeekfUkx9WrMRo9A/lx
         1hTIaXz5Rg+fQ0IRlejP5CxzHN8QjtW4TV9t29PD5AzmW/wzytk4/unH4gfxTM3MusEo
         OocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=rahw63+TqoGdp3tLX/hGONnuXFeR4nNE/uOznEHaGrSIrJDzuhad0B5d6JIyYI+LYO
         ML+azId/V/0hy3rKPc/z556gOMls0Yy3iY+boivFTF5V7Umvb4fFXUsfmaLw9dqaeV/C
         lsEC4Iv6RmfEqbm5GYJCYBk6ypy6ujpTSbePZAgHb4iBxTHwkhAoTFmcMRx5pUPIiYrO
         9M0E/WQjel2HGXU1wC/NLGyBKdqa+Lh7wm4f6dLldO0ovhiqyNqgblkeVuI/KEdEDYlO
         nhz4p715eQluaNK7gjVx8u1IGOZpDWWdM6fSXstiPOKPItyIiIoZhk45pJ4822rjKb0x
         eLmA==
X-Gm-Message-State: AOAM5319wd6TZp1/2pMNAwqK8EryEK3bSdn5HUY+KKzxK2RcP0aHimpg
        Oa+F+zt8nYxKlOzVLdsd+w0H8l3/sZbl5N4wCgN1jL80Mlc=
X-Google-Smtp-Source: ABdhPJw3lgUh0oxmgmjzAwlNNZ94ksw/9I0mOwLnUtgereG7iWZKY4s1I5RZI0o0mPKS7RYxDWrvjq+R1cXj2tliMpE=
X-Received: by 2002:a05:6870:4619:b0:f1:e78d:fd54 with SMTP id
 z25-20020a056870461900b000f1e78dfd54mr18171419oao.195.1654111014269; Wed, 01
 Jun 2022 12:16:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:3601:b0:a3:2139:251d with HTTP; Wed, 1 Jun 2022
 12:16:53 -0700 (PDT)
Reply-To: johnwinery@online.ee
In-Reply-To: <CAFqHCSRskayxkisB-+u26DtbT6KFL5dAQ+X5s5W-kcBz_DGgTw@mail.gmail.com>
References: <CAFqHCSRskayxkisB-+u26DtbT6KFL5dAQ+X5s5W-kcBz_DGgTw@mail.gmail.com>
From:   johnwinery <alicejohnson8974@gmail.com>
Date:   Wed, 1 Jun 2022 12:16:53 -0700
Message-ID: <CAFqHCSSwNksOc4c+jJ+6tiF2b2hWGn9JARB6iPpgQJTeHU_7AA@mail.gmail.com>
Subject: Re: good day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Greeting ,I had written an earlier mail to you but without response
