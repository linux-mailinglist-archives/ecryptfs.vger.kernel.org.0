Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 075E9554E2E
	for <lists+ecryptfs@lfdr.de>; Wed, 22 Jun 2022 17:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243581AbiFVPB5 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 22 Jun 2022 11:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357989AbiFVPBq (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 22 Jun 2022 11:01:46 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A006DE098
        for <ecryptfs@vger.kernel.org>; Wed, 22 Jun 2022 08:01:45 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id y13-20020a17090a154d00b001eaaa3b9b8dso17073334pja.2
        for <ecryptfs@vger.kernel.org>; Wed, 22 Jun 2022 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=hBR5pA6WE+4sFZcK40aN7qgFPhVV6qSPw4TMX4JtB2qVNEr9k+Xy0WcRUMVproOI27
         5HUgQFkVBSAladxU8tKQfFv+K5B7bEyq2J87jtrchUKIy1+w6fhxlLOnj0tnZ5+FK7WV
         L2tdHBLZfKNVIFrM3YdYw05AZebedlBhPCnTJb6OS3OUTyko8JygZku4v+UCcsiilht6
         u/xG1SOfQy7thWjTKRTV395GCL9YrSoZ3qQrFNzr+4s8+pHFW71re3fTBa1+lY2T0zre
         UwmIRugJelgyju7yA/1hBoFAp3ZH7DEpzxY26PlJhC+dw5K3KgoA4+P+DC7f1WMcEmlA
         cfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=y7GiOYnONXr/U9wNJW9ybjlC6ksENXnXLIvCPykh2RGl37TvwfQuTRXXSZtnk1yCS/
         Ixz8gEm0a4leqP9SxCVmQJiJplLtA6eaWNO30uiGB8Q+bgi6NILLNv1coTEohebG5/TS
         ooUC30Xnpqe2gSRD/V5RKBlDPvUe2fe+tY0KRM7MDK6TmRR/yHM585MGbNr5iwonOvF5
         klPyZdKWW3fEwQUcmdLAtMedkoWHV/MNsxICLwuro5rZb6bUzU5fS2+sxd+gW/Giik1n
         fDERLgx9/KDLvfjfmJ/sbCp74SHszwdeZ0KQEvKdzsstUSJadLMsA83KkFPsWS9bbiC4
         krkQ==
X-Gm-Message-State: AJIora+rDKxGRRMcECrql3AW86LvS9qdtGV5wSsPNkNkHoQKS7Iq8uXj
        GdkRhXhvJ1vQpvGNuDDJkB1xS3zd26AL0Dx8a0o=
X-Google-Smtp-Source: AGRyM1tN6sWVSqB34lwb/KLHSj/iYXyBXECtxJfh+RecOo3E9kUEK6BtwRe3iGnIP7G/NAZzCFIsXn1bnmNSCHVW9E0=
X-Received: by 2002:a17:90a:dc82:b0:1ea:c77d:c9a4 with SMTP id
 j2-20020a17090adc8200b001eac77dc9a4mr48798087pjv.197.1655910105254; Wed, 22
 Jun 2022 08:01:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:2308:b0:16a:1b3f:f74b with HTTP; Wed, 22 Jun 2022
 08:01:44 -0700 (PDT)
Reply-To: sales0212@asonmedsystemsinc.com
From:   Prasad Ronni <lerwickfinance7@gmail.com>
Date:   Wed, 22 Jun 2022 16:01:44 +0100
Message-ID: <CAFkto5uHVz99YsSa9rQPLR7rm8fGy5aNM8TDiWhvmHMOLi9fBw@mail.gmail.com>
Subject: Service Needed.
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

-- 
Hi,

Are you currently open to work as our executive company representative
on contractual basis working remotely? If yes, we will be happy to
share more details. Looking forward to your response.

Regards,
