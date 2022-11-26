Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328F963953E
	for <lists+ecryptfs@lfdr.de>; Sat, 26 Nov 2022 11:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiKZKOn (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sat, 26 Nov 2022 05:14:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKZKOn (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sat, 26 Nov 2022 05:14:43 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1EA27930
        for <ecryptfs@vger.kernel.org>; Sat, 26 Nov 2022 02:14:42 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id o24so3116004vkl.9
        for <ecryptfs@vger.kernel.org>; Sat, 26 Nov 2022 02:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkLKKfAR5wqmVPeCqMY1O7lAxo0pbmpK+QeQEKfcsQQ=;
        b=T1kDcK6+lEar43A1Lf+r9nkQkVhsTMOen1eeGSUBEww9hsgNMrDB+pKCnRfOivVpG/
         z+U5WS3um/NCaImZj5p0ojpN/K4FN75ijKLCodLYVkXJVuAD7Q0uCEaT2so5REKQ7848
         MUbAj35im57KAUhLWTOdYzGPHgUblqUMo/O0aNEG0DdOAm0Zr8/lpdFT4m1LMuffOGzB
         AnKO3cK3yYRCZhUsJVoKxSaFj7ZeBKEaVabSxVsXkrZuex9Zb03nFi8oi6Jlp9Hosl/j
         nX2mMHot69OeiT+h5svEux1YZbcQhgU04mstqpJBj0/mrwKywctNOdw5IfxGLhb0QE67
         IPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkLKKfAR5wqmVPeCqMY1O7lAxo0pbmpK+QeQEKfcsQQ=;
        b=jTnJmDFmlm+DWTCD3E6nLeIELFjgOh6GfQyHHkKfH0pLgtUKROUeXtP0Zrkx/bBWw5
         D8zhvpHjhj+pjn6E9OK+mTFNPUzCoOxZD3wenBdVobXk2lugz0eam2hZv+J2b8sd7N8H
         4SFigospZZCX9FZ7t5vf0B9loKVFzrwPgJRl14cAOJ9DzjyFHsBGYVLCjrrbr8jMbNQZ
         fqGEySTkrqxjvy6tU2fDewXWzaJmFbExB6h3rYZSLstOo238ZtRFFLcYF3zvr25VuTdC
         sL/gR9cMFEFD4QxpMbuNxnvhMQs+PBpbtv61i7QW0XeKXnDl7In//5l4nKm4IqmigOhp
         w1XA==
X-Gm-Message-State: ANoB5plMZipLwOncBKHfQsW7pYMQZN9xB0mvRvOCyNiSGVBn3oISGRm9
        7QWwZ6T9fzH7Umdn9oCXQaYWu2IDdT2vXHyRzhk=
X-Google-Smtp-Source: AA0mqf4s7ltdrDMvr19pr9/IFe6uV5sWkCWAAUoy/loeNiXi6GHjrjuqJtN4WMjS3Dtog5SRyiqHSvPlRs2SQmScbow=
X-Received: by 2002:a1f:c105:0:b0:3b8:6042:74e6 with SMTP id
 r5-20020a1fc105000000b003b8604274e6mr15782574vkf.4.1669457681306; Sat, 26 Nov
 2022 02:14:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:ccf1:0:b0:32b:6ae5:1eba with HTTP; Sat, 26 Nov 2022
 02:14:40 -0800 (PST)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <ninacoulibaly13.info@gmail.com>
Date:   Sat, 26 Nov 2022 10:14:40 +0000
Message-ID: <CACTFrC2yKhZigAC-EOc=e-YifmzUepyjEe_GxLiJTYBW9Wt94g@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.6 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a33 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ninacoulibaly13.info[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [ninacoulibaly03[at]myself.com]
        *  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

-- 
Dear sir,

Please grant me permission to share a very crucial discussion with
you. I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibaly
