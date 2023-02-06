Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BFA68C4CA
	for <lists+ecryptfs@lfdr.de>; Mon,  6 Feb 2023 18:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjBFRa0 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 6 Feb 2023 12:30:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbjBFRaJ (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 6 Feb 2023 12:30:09 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376A72E0EA
        for <ecryptfs@vger.kernel.org>; Mon,  6 Feb 2023 09:29:09 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id h24so13725010qtr.0
        for <ecryptfs@vger.kernel.org>; Mon, 06 Feb 2023 09:29:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FrP9fMYR82jRAmAW0QmGxlvWeMEFDYdTqEQD3Ix7oU=;
        b=wf3br0WvuUAZIhU2kLTwJ3kmkeeYgrjc9P4HX64G1Fh7ljslRb+Sbu7Q1AqYO9J4AG
         f7Kz0zcHKlQ3gNNIVbL+kM3ywDXWirDFSRpCTtHjBZ4b3shBvclvqmiPQ3vUXMyIUydQ
         OfHjbrAMBS8g3yb6PI288V2aJemZLWatMdVAkPsfEX77ACksSweIxfr6D3fxQhmbCFT+
         OfaNUvjVgddtXcqUIJxqdXJghfsdyCAEQRnrU2d6T0BtWzOk247GeEpvl8vNkUJKTBma
         ODoZAqGgDkWeClJJd4f8vBBhgX76wffb5XhuzAk+eAPwDxwQlyCXkKh7IUfquDqGoHoe
         c9cA==
X-Gm-Message-State: AO0yUKWSRMaNlWQEV2BwvHhP6Blc9++3Itx8+vxxEJGE7CuAMFoeg9YY
        cbg9J8fETYycsgrYsfxYFpPW
X-Google-Smtp-Source: AK7set88PegyfxPSUhpDYL1wKeHEutu8R092IP6zZRvoiYjEuTLO6pmSpIUQElcD/sBIBkgW1V2HAg==
X-Received: by 2002:ac8:5f95:0:b0:3ba:266f:103b with SMTP id j21-20020ac85f95000000b003ba266f103bmr38942qta.47.1675704548352;
        Mon, 06 Feb 2023 09:29:08 -0800 (PST)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net. [68.160.166.30])
        by smtp.gmail.com with ESMTPSA id b5-20020a37b205000000b00719165e9e72sm7647589qkf.91.2023.02.06.09.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 09:29:07 -0800 (PST)
Date:   Mon, 6 Feb 2023 12:29:06 -0500
From:   Mike Snitzer <snitzer@kernel.org>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Alasdair Kergon <agk@redhat.com>, dm-devel@redhat.com,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        Tyler Hicks <code@tyhicks.com>, ecryptfs@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Jon Maloy <jmaloy@redhat.com>,
        Ying Xue <ying.xue@windriver.com>,
        Boris Pismenny <borisp@nvidia.com>,
        John Fastabend <john.fastabend@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org
Subject: Re: [PATCH 1/17] dm: Add scaffolding to change completion function
 signature
Message-ID: <Y+E44kb3bJViytuh@redhat.com>
References: <Y+DUkqe1sagWaErA@gondor.apana.org.au>
 <E1pOydY-007zgU-U2@formenos.hmeau.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1pOydY-007zgU-U2@formenos.hmeau.com>
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On Mon, Feb 06 2023 at  5:22P -0500,
Herbert Xu <herbert@gondor.apana.org.au> wrote:

> This patch adds temporary scaffolding so that the Crypto API
> completion function can take a void * instead of crypto_async_request.
> Once affected users have been converted this can be removed.
> 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Acked-by: Mike Snitzer <snitzer@kernel.org>
