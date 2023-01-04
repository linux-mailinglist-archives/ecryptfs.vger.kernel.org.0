Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A808D65D2AD
	for <lists+ecryptfs@lfdr.de>; Wed,  4 Jan 2023 13:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239083AbjADMaO (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 4 Jan 2023 07:30:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239095AbjADMaI (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 4 Jan 2023 07:30:08 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF90373B1
        for <ecryptfs@vger.kernel.org>; Wed,  4 Jan 2023 04:30:03 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id n1so35246472ljg.3
        for <ecryptfs@vger.kernel.org>; Wed, 04 Jan 2023 04:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=QQG4ceuSe+sa+clP7pRWQ5MT08vn/SYK0nbTnb6O5vkFWCaFo3Lar1WOvuZ2AZOhSy
         FNXN9GdDCMgW9sYoWnLskg8TJAsUJogtSRXeZkcLYm7cA7kKPSkTcuZK3bUpMD7jXKUi
         pRCmem75Wp0iOM0uMOfHKD6MPcmCa9yFNyf7d4wwrD8l3E66cxe8rT9C/yE+mvEQSPqy
         nOshf8W/mOjKMwyL1ML9oAS3BzlzDhw5P6f/7lfj+Wxce+GAkZr+q2H0xfwHqXSKtPWq
         vC/+NbSq/e7KJBO+GYoG546doFlZjOaIV8V9qo9cWgaMovMXI6IhrtnbNwzDc6IFqPF3
         3Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=hs01b96LO1J5od7T9AbkL+CTp7MMQLKJ0lYSBrKlCeOUTBLPDeOhQWqMJfIP5OiZxD
         pu/7uoHTCku+/YZ8H3iJdMYC6qL0ViLPi9C2y+nSiX2IlqAFN4KAz4f51ORjppmaFCD+
         yIK3Z5khSwS/LEfDtnCka4fPU3Co1j2fccD06Oc8ftsVVey/B9RjCKheZ029l1AEAnfE
         XrGzFG568g2SJ6lFrN2F3sH3MViv8xrqKgP66pyDYInDBTjzN982qM5oka/wKXYxf5Rq
         LMbCb8jbQ5wnP24WWG/zevqM2gQG5NwH0GvKrM8w3d6YRV5CEEx9w6E+O3ZhIkNJza9s
         Dvmg==
X-Gm-Message-State: AFqh2kp9JSwYnawsFCjRlmEUkEvOjD4SBP2Da/h5cVn9epOK9EMNX4nH
        lvwiiDaIm2U7yRR1r05TNWpQ98i0lUyID82plkY=
X-Google-Smtp-Source: AMrXdXvagzQFWcbeFEi+jJ4Loa7gd7QmJOHqfaA83FWnPLcPIyeQXJMm39XiO1Al86pndyMR9k2rSuBsfOnxW16UO2o=
X-Received: by 2002:a05:651c:505:b0:27a:26ce:5abd with SMTP id
 o5-20020a05651c050500b0027a26ce5abdmr4097884ljp.319.1672835401769; Wed, 04
 Jan 2023 04:30:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6500:ca6:b0:17c:9bd6:6682 with HTTP; Wed, 4 Jan 2023
 04:30:00 -0800 (PST)
Reply-To: gregdenzell9@gmail.com
From:   Greg Denzell <denzellgreg3@gmail.com>
Date:   Wed, 4 Jan 2023 12:30:00 +0000
Message-ID: <CAO7RNEHdNmJE39-_M+Pej3WFJ19VFStODN=6RqLR9jqzsbJbQQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Seasons Greetings!

This will remind you again that I have not yet received your reply to
my last message to you.
