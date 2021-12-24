Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E4F47F121
	for <lists+ecryptfs@lfdr.de>; Fri, 24 Dec 2021 22:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344391AbhLXVAA (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 24 Dec 2021 16:00:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344365AbhLXVAA (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 24 Dec 2021 16:00:00 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2518C061401
        for <ecryptfs@vger.kernel.org>; Fri, 24 Dec 2021 12:59:59 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id d198-20020a1c1dcf000000b0034569cdd2a2so5317848wmd.5
        for <ecryptfs@vger.kernel.org>; Fri, 24 Dec 2021 12:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=UtoF0r4yG8U/T8UOLxn8dacSd49m7zi2Qvhr7fGOaoo=;
        b=OKLw4HI7o5dzdcFDIN5DZrKWRfA7FHkKZdCWv4fWq7H9xuwVP+u9tc96L2CXsmSyvt
         Qlt2x0svtxPny5KTgXoGs6ctYbMdHbLj3l111dIjH4BOcgSeUOd+51K0DCC+vc2M+ywM
         p80lzPXh51/silfnaHUwsHOSbdmHwbcFL+rq7MtT3s0RW5etJ6Np5T/OYWH5IOm8ohv4
         dl0Xk5kWVPpbkA60yivguqkM4sbO2uJvpFbQG/+UvounIbaniDAdc69ZPR0bi3K1Tk6C
         LEP9SA6sPwwIDYVQVk9WPbJSDzhv+/XT6MaAgOFs4Te1bnCdiw9WWgbQAtiLOSeafTDF
         BlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=UtoF0r4yG8U/T8UOLxn8dacSd49m7zi2Qvhr7fGOaoo=;
        b=h0yXrsMhht8IUw0MQYNPiRltLY8JGClKjYn6K7IYHI1f9n84nM/Lzr5fxJC55+speJ
         vmVp/LMNoSSMPRPgD6bF08XlORlF+L+tzaNeDNSqTnDDHTj3EJxpCvOIgASEy+I305tp
         MG9nJ370O9Mj328XCLdTxmsKuhqWlA2LWqul2KDvKdPm1YcXNaGxwUhsClZ74AWMSeXX
         zlMeRG+klrzgX/tiS5zR/DL5iQoekCH4GVfeVSmjYDs/K0sMiWUeyik/HLuh2NXLdeZq
         Z3Gzt8jVlxu8/X0gVQbkd5V5LNwz8BL5fVNnm5IoNzRTL064vqyRN7J/N/d0IQOZaQy2
         xmDA==
X-Gm-Message-State: AOAM532agD/Di5LfRQRDhe7D+LUwg2mRjHUJdV3cXh9w47tpGSkD3ajI
        op/9nv7CAe93Xeuil+JemS8=
X-Google-Smtp-Source: ABdhPJw9o/3ya40KE0qzwe+ajHFpxzsPuLU/BuRyWUczDEJA2KG/RpdwP1HsE5aFz0G71XFksw5erg==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr5739402wmb.77.1640379598154;
        Fri, 24 Dec 2021 12:59:58 -0800 (PST)
Received: from [192.168.9.102] ([197.211.59.108])
        by smtp.gmail.com with ESMTPSA id p18sm16984360wmq.0.2021.12.24.12.59.53
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Dec 2021 12:59:57 -0800 (PST)
Message-ID: <61c634cd.1c69fb81.365b5.530a@mx.google.com>
From:   Margaret Leung KO May-yee <muntarilawal2023@gmail.com>
X-Google-Original-From: Margaret Leung KO May-yee
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?Gesch=C3=A4ftsvorschlag?=
To:     Recipients <Margaret@vger.kernel.org>
Date:   Fri, 24 Dec 2021 21:59:48 +0100
Reply-To: la67737777@gmail.com
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Bin Frau Margaret Leung Ich habe einen Gesch=E4ftsvorschlag f=FCr Sie, erre=
ichen Sie mich unter: la67737777@gmail.com

Margaret Leung
Managing Director of Chong Hing Bank
