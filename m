Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAC0DD46C
	for <lists+ecryptfs@lfdr.de>; Sat, 19 Oct 2019 00:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbfJRWYL (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 18 Oct 2019 18:24:11 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:37295 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405538AbfJRWYG (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 18 Oct 2019 18:24:06 -0400
Received: by mail-lf1-f49.google.com with SMTP id g21so4698306lfh.4
        for <ecryptfs@vger.kernel.org>; Fri, 18 Oct 2019 15:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=DFbsx5V+x08inAoAFBpLdaZ7BpNzhotI+5PEBhQiFGs=;
        b=Iu5ipAA/p7+NgjgltCbc2E2L7YnkNgeHzrZmBYbXdmFCpPK+9HUyXJahv4p67SP+eI
         iojBg1YMvQiPHQrYvvvp/ICdnl+GI0QW7xmO0NRw4dNJ6TOrw8PgZNkj1WIQzQnF1ilp
         7KDmrEG0rqGW35drhuxfnRm1yYRA1D24hoRR9tf1EdgBffeUBS+SNGOu+c0hSdeyQgM2
         ZF2ttxDBR2rXOJAFYLLo/2MxSOtvLhFJ8ijC8HYte3VwEyzIgiX7cXPF/51wxCaL7OMF
         v77XGY9+8vunyGbW/Nd/DGvl48IUEDLrExT2cGoV/uLc4kNgrqIXmty4kn/BLD8x91fD
         PqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=DFbsx5V+x08inAoAFBpLdaZ7BpNzhotI+5PEBhQiFGs=;
        b=XAdOhO6JgHodUb6JRF/FWWsbugianqZq2uQOKZAXM+6hMJfRruxEbXRPO2/RkHuYYC
         cK1bMdVYqm1Lt1ImZo5Fa5ieQnrvc2LVnVdUmFYeEOSiIhb0gNppY+tHYutohTAAt5Yn
         GLFpA5TlZhmVqrhNCDhLQgdWvHe2cCgSSFx1u2TXmv4rFUo+yKPcB3izBsj2qlYxzCxG
         biOLBjOjwcmGllSTnuGRUcUHWOb1ijgg088fr36Fz6n2TeZpprCM8bqJ6PWKEe1Ozmx1
         CUxdYM/cJKHm/zVa2wQfNzBxG+DpEWGuBHFGfGW+u8F+irEDphzoQJQS0JeKa1sncY0F
         fg+w==
X-Gm-Message-State: APjAAAVdWJtcttBG8teArLyTe0DyxgnGCcHHQ1PEGNVGdAIhnQz5pfjq
        uYOX5EMmx6i2EhSBf8+GVxnWvp0NcNTJkOGtXnMFzbV+O9M=
X-Google-Smtp-Source: APXvYqzlFjFRPREfEUxoa/W8rhzlFl1enMMpsyGnrlIkC9DGXCvMKF3VmqvccX0vQeZY1r432jL+8n0dmUrU5CGQRQM=
X-Received: by 2002:ac2:5df5:: with SMTP id z21mr7501469lfq.169.1571437444748;
 Fri, 18 Oct 2019 15:24:04 -0700 (PDT)
MIME-Version: 1.0
From:   Igor Kononenko <singleton.dev.ik@gmail.com>
Date:   Sat, 19 Oct 2019 01:23:53 +0300
Message-ID: <CA+igC_H7Rxw-iF_Rp_E0eK+KKt4-m1PdtMFu2aDP62QyLKDNMQ@mail.gmail.com>
Subject: 
To:     ecryptfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

 auth a88f125b subscribe ecryptfs singleton.dev.ik@gmail.com
