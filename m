Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17B306DA978
	for <lists+ecryptfs@lfdr.de>; Fri,  7 Apr 2023 09:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjDGHp4 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 7 Apr 2023 03:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjDGHp4 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 7 Apr 2023 03:45:56 -0400
Received: from mail.gramblingfirm.com (mail.gramblingfirm.com [89.40.118.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D480A273
        for <ecryptfs@vger.kernel.org>; Fri,  7 Apr 2023 00:45:54 -0700 (PDT)
Received: by mail.gramblingfirm.com (Postfix, from userid 1001)
        id 17E0F82ACE; Fri,  7 Apr 2023 08:45:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gramblingfirm.com;
        s=mail; t=1680853552;
        bh=gqzZsu7MXwZPzlbvSQiKceUrEEFPNw9Lezccrk6Bymo=;
        h=Date:From:To:Subject:From;
        b=q4cwRquAqYy4Qf5/ps3DaY1Og8tDDVnjXm63qsmIXeE/bNMO7hdSD5q3K5VqRSi71
         6MLp8p395LT/uPtgmH81XfQtqtVgWKPvTdyehim+1xgJCWDYOBcUqGeEswzvjA5f5N
         RUIhQYsbszShMG4MZw3Ii+kVpp8ibz9nX+LxiCdfCTy9yu4MkaOsurDq/KBAQPTrbL
         VkNAZbuEg+wTAU1RLUMwLRSlVcJw0mx0MGTGR64doI6kRWEiZrNXHV07EYn04KxAhC
         Sw4IwccG+CcIZThyX5ny0Y1GYX/MAvQFAEVu1iQRy5tRtraBwOz6yJpoUwBf0lH9Mb
         97DqizTjy9pvA==
Received: by mail.gramblingfirm.com for <ecryptfs@vger.kernel.org>; Fri,  7 Apr 2023 07:45:33 GMT
Message-ID: <20230407074500-0.1.2t.50i3.0.i78o20kr1m@gramblingfirm.com>
Date:   Fri,  7 Apr 2023 07:45:33 GMT
From:   "Daniel Musil" <daniel.musil@gramblingfirm.com>
To:     <ecryptfs@vger.kernel.org>
Subject: Robotisation of production
X-Mailer: mail.gramblingfirm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,RCVD_IN_SORBS_DUL,
        SPF_HELO_NONE,SPF_PASS,URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: gramblingfirm.com]
        *  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [89.40.118.123 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: gramblingfirm.com]
        *  0.0 RCVD_IN_SORBS_DUL RBL: SORBS: sent directly from dynamic IP
        *      address
        *      [89.40.118.123 listed in dnsbl.sorbs.net]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hello,

I am trying to reach the person who manages your machinery and/or is resp=
onsible for the improvement and automation of production.=20

We deal with processes related to broadly defined robotisation and automa=
tion of production. We support you in the design and implementation of au=
tomation and control systems, the construction of control cabinets, their=
 servicing and diagnostics of already existing devices.=20

Thanks to a large team of specialists in various fields, we are able to i=
mplement industrial robots, construct electrical installation facilities,=
 provide solutions for monitoring of media consumption, and integrate mac=
hines and devices into complete assemblies.

What sets us apart is our versatility, many years of experience and a qua=
lified team who have developed their knowledge over the years by carrying=
 out projects for various industries and processes.

I think it is worth discussing what this looks like in your company and w=
hat we could offer. What do you think of my proposal?

Best regards
Daniel Musil
