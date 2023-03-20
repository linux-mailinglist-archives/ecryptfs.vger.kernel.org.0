Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D2A6C1145
	for <lists+ecryptfs@lfdr.de>; Mon, 20 Mar 2023 12:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbjCTLyl (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 20 Mar 2023 07:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbjCTLyj (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 20 Mar 2023 07:54:39 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719BD23331
        for <ecryptfs@vger.kernel.org>; Mon, 20 Mar 2023 04:54:35 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id q189so6410726pga.9
        for <ecryptfs@vger.kernel.org>; Mon, 20 Mar 2023 04:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679313275;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=O0uHvVC/xk8SH9njnfIynLUgeAJKNpWas81tooRkttbXINvkeCs4Sf7u9Qeu3d66pP
         uTeYtqSts0xJfX0NbdCwFe0IXzaq+E0c6dZNXOf3iXLBdnXD+gVIABj6H2RdSDuusmdQ
         bO7jt/H01U5taHKgtTY5t8ix24TTymhLISUiP+3s8h4E8d9RwFhe1hfekChVoRIb3L3V
         tMCaUv1PZ8h04Is8nJBBD6piAvBD2DFNSB/yoUBrmslRGYbvqmTIcQ5uhjqCax8sESS2
         tt1s8wNMzR/o+QJZP3fmMC56Vnf9UcYeaDf6fu8AfljVCdTJr06DYgFN8UJKm7das2TU
         HPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679313275;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=3EEzpJJoP1fGHJcxw7hqXDjol8DT+spWtBJSZEkOeWPRXapssmX/s75s1TLzuS9cRp
         wn2801fv7028iwgTknZv9xbaWKVH8kwqP69bGmp+lPu+I8rvNYa8dhRoTg2sNzFe1dtk
         Jl0JEuiQbw83U9Sw62+sDWUbCPnxoayZEPfevF44AOAaEH6AXl3f6xwzBhtqxM+k3ecb
         v5ML5KLAlPQQ6TSzTwgOW1Pn24iTSqh31l1ciZcGbSbDAmjFPqiJ5H9JyFdthg2dmsjS
         bvJBJ9/eo3EYB0XZbxqhPEOxaD1WNnYRahc0itn9qECEJbrd4tjTqJr8Lv/hOF8OvXV6
         8FRA==
X-Gm-Message-State: AO0yUKW9GprZGocCwpjkbpK27EGAuenzgk6jlcEMYdtFDCA+bfjVay3i
        Xckk4L7z8r8S9LTJ4dErKke6vWRYFPDZHEBtQl0=
X-Google-Smtp-Source: AK7set/BulPoTBlCm8XSgzmUaVHiMeJ3DcfO6KAlGGUu7yHIiVdOAtVXUMUJ5v11IdsdUwpeY5cjM+MRX3cMk32NVBw=
X-Received: by 2002:a65:44cd:0:b0:50f:8d8d:60f0 with SMTP id
 g13-20020a6544cd000000b0050f8d8d60f0mr366279pgs.10.1679313274883; Mon, 20 Mar
 2023 04:54:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:672c:b0:5d:7366:1b23 with HTTP; Mon, 20 Mar 2023
 04:54:34 -0700 (PDT)
Reply-To: contact.ninacoulibaly@inbox.eu
From:   nina coulibaly <ninacoulibaly215@gmail.com>
Date:   Mon, 20 Mar 2023 04:54:34 -0700
Message-ID: <CAOXQc5Gt-0md_5L-JkV-hZLGsDDuLUrS8b9HothxPe_hrG0=uA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
