Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C953E6FDEF9
	for <lists+ecryptfs@lfdr.de>; Wed, 10 May 2023 15:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237139AbjEJNpQ (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 10 May 2023 09:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237180AbjEJNpP (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 10 May 2023 09:45:15 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8446ED2C2
        for <ecryptfs@vger.kernel.org>; Wed, 10 May 2023 06:44:30 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-77d049b9040so36063920241.1
        for <ecryptfs@vger.kernel.org>; Wed, 10 May 2023 06:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683726269; x=1686318269;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4kWzn6pxkecn7JMiXg/VymW/f2W9szhFxBJtG2FdMw=;
        b=fC+8mmDvWMrFSJgK+rFFZxuBgiLhkqpirjDM1wZfSE764cTzdghg60i2DisEmDnlmi
         hCC4YKLBUjALVXuG9ZQHNvJNP/3w0eDaUoK1BbaSBc5Jk1fUczx+getJJvCb2NII5waX
         Rg6CxPLdeYimox76afvU7GwqaphJKoXSIMrG8IZ/zPHicNZGpsXLAhklsQ8PNONN0X5x
         yvxSV8SwJQ+VgeOfCh1HUDR9ydKxatbI5Od5HMytRxUScSoqSsymORxCo4TNmM5NDlG4
         iVglvn9xn1rVWkadUXQKHiqAJn/afchQ68LpjxzHA1bdalHfhlYbpZCJ45Og2MTy/4Ch
         7Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683726269; x=1686318269;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4kWzn6pxkecn7JMiXg/VymW/f2W9szhFxBJtG2FdMw=;
        b=AyFJAzVs3ELk0Nc+PQDieP87sK5tD4n93YNI/9Hff1ErGdrG8cZJAoflFYat6ZEnhG
         4X+WlYbi8jrsgZ7vxAGZDzWcpBbyZpznjPK3LEAUt9x198xytRcFcxBVzBmNx+8ppiUI
         laAQ52c7hTZNEBkj3aRVEfs2QgvZfwpPmF5CMpO7MwdGDoogQW4J+tibv0cWnoLucSG6
         kOT0hTqmwMDZFQhd2/CB6Yczonui50ASrjF44A+4n+Iw7k6+DFuhsMeCS49JCh0JL75k
         FdMq/Pc2psZTejstvelMpCNV9WMEnXHOQcarSeL2H040BSRaRLdnfwQZNt+sU97s4hQc
         TpcQ==
X-Gm-Message-State: AC+VfDx1bgh9Uw9O9/LDCX/ZBzwQZCwOjQU1c1FG4z6HakyaCCh4Emce
        pGuoWaNsMQyuPpcG8l7/1u7rR5M5X4XX+/2QVOI=
X-Google-Smtp-Source: ACHHUZ7W50mULmdwhmCFQ8lCywS5ZVWBkIkx0egy52UndB8aaHpV+fMoJ/wP9uUi9BBICgobSG9OlRqLPc55RcOuCg0=
X-Received: by 2002:a05:6102:913:b0:434:847e:e57b with SMTP id
 x19-20020a056102091300b00434847ee57bmr4115209vsh.10.1683726269200; Wed, 10
 May 2023 06:44:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:738b:0:b0:747:f1a8:4f69 with HTTP; Wed, 10 May 2023
 06:44:28 -0700 (PDT)
Reply-To: contact.ninacoulibaly@inbox.eu
From:   nina coulibaly <ninacoulibaly81.info@gmail.com>
Date:   Wed, 10 May 2023 06:44:28 -0700
Message-ID: <CAJws7AAyauBkO3_SndYPRCBxZYL6sA082oMMDkk8K6foPyTeyQ@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Dear ,

Please grant me the permission to share important discussion with you.
I am looking forward to hearing from you at your earliest convenience.

Best Regards.

Mrs. Nina Coulibaly
