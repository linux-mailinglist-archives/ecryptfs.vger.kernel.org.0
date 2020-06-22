Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60348203BB2
	for <lists+ecryptfs@lfdr.de>; Mon, 22 Jun 2020 17:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgFVP67 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 22 Jun 2020 11:58:59 -0400
Received: from sonic307-9.consmr.mail.ne1.yahoo.com ([66.163.190.32]:44352
        "EHLO sonic307-9.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729316AbgFVP67 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 22 Jun 2020 11:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1592841538; bh=cK2qy9Lv5SAgMg9nAvfVmkJPj46H3ss3vOVyjpHm6Nk=; h=Date:From:Reply-To:Subject:References:From:Subject; b=kYfL7yIsUfdDik2InhdkWd9bFtkpBTAm0C1YpyStpDOzSpKKmiCqS0t3asVFGlBjA5Spy09k24PQ78Mt/1ZDJsTXojYzFd+6oXmfl74GW7ZPSS3x4Id+s9xjV6vi/TDtWMix4WBuvYcGQm5NGVFfrSkWjUssCihmxff7u9zTHhzyksHMKBYL5sPEpMIsvz69N01lJrEUP9EqrppRM6zBb5wD28+1+7+dMXDtwgm7HaizrdVZNUxuoq81fJzCU1MvdOjCZYdFrHVXxtScDmVP2Ux2K7WpNHpQTPoyWc9GgJ9n5G5oaewFQKpThrcKNd4GIaW4MgEhZiHCbDw9l6LZwQ==
X-YMail-OSG: Mo9DRT8VM1k3qtJeZSWkLo98qtlx_wKDYdICjoFix.2r4SCUX9qIg_W2nD5QAjm
 YPNB.Yf3_T1DXN1i3AYhZN7niCrtrX_E_lrJTH9GPq8zNBVddRiMnElZJnsI1P2zG790GMr_w17v
 Vcw3guMAFbOE_f_3B_xglH0aYE0OnLn_ooJYDZByIT0pQZZn5rFoSGgDx0g1mblLQyAtv.6q_zfQ
 88PXkXHqrwRMRSsjC7HPDkptmp1xN7T3HL_6ZcYCdA9Ul0DzaMrZDEBqFRZpfMg8z1Cht05oqSvj
 _HWfHXDl0Sd555lQkA._obnmR1PZOVRS3o.nO4Uxwlu.qfY9sjYejdDoZQzYlAOUJe7.twIicfdT
 9ETXmfak7kSWbFBG3T1DPose6eBZuU6W2DPesrAknNfyI.UXsPuiZ0.daWG65DXDKUsf.z2ZTx1E
 BJVlR7B7YthCorJyn_dcswchsc41w7iW9eQ3o0Tnmg8Q3GEzwOcnAaxprI3YAAFg9TkjwFDKswRv
 RrVWwVSlnmGojUMqvp62SaQuTOCTEU2M7Hx3g4UyhtHhcRbB1hgbV1epHzkuciD4NwT2AuEGvibI
 7t_o2SzB3M.v8n7kH3YmcaVB0JNknEVeWs_uFNz90epUzrBopGCmjPkMISU8HiTz1tbNN3qUeUQK
 YgyQBJ9bh3wmAfDbNG_9hYBqI.HxA7TLv7onLTVSclrW6CmuEf46gFR5E11DNmsDEfIEEGQB_E65
 srqcyZA2f1InhtV_GAKU6LdFHFfTyCtEgcM.tamgTWra41j4J939OOhGfonlNTeRG5k5VtZPz725
 DPob2th.aBAiJtGdq1LcRcqHcJbR80CIet0INyb7zBFJSaVkeXxmJzppQ_.P2pxrRL_15QIhp5HP
 F5lyqA.nvcfE8UjYqrq1EG9UAVrcz.uZIPRLawapi8lXhWoxdmyguRPu1rOfdeTjYaYkXxREoenI
 GE7sUDAW3zmZDiQRNlM.0huJwroG8wSmwEAfATVvFCNL_DvdcLPz48Ky6Lev7XeX4_34kNVNev4D
 3f19D8zquYOThPdcFIqoSYpb6mBxC7rJ9WCUYncPQ_STsk8mPK7BXov8ywGKf7DU1PKh7zZj0l8Z
 0XeR0KTB3noybiv67cb.PLgTX3CdXsI5xf_3FvADaTmlUjWfTgfhGuf7.tDlYdnHbbomHh8rwrRf
 j2.I8wGpfVFHeP5a3VgymOrWHl1bfA3H.LklyLwcCFYK3WZqyL3YNa8RGro7j0RBv399r6kz2pa1
 J9a4OnE3m95PjxOBnDSjuzH.FRZRxz2gqHDieBulTQAbI_lwYY2n2tFOAR.d0RZNbH3AoHsbjTA-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Mon, 22 Jun 2020 15:58:58 +0000
Date:   Mon, 22 Jun 2020 15:58:53 +0000 (UTC)
From:   Karim Zakari <kariim1960z@gmail.com>
Reply-To: kzakari04@gmail.com
Message-ID: <1897895338.1853978.1592841533139@mail.yahoo.com>
Subject: URGENT REPLY.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1897895338.1853978.1592841533139.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16138 YMailNodin Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org



Good-Day Friend,

 Hope you are doing great Today. I have a proposed business deal worthy (US$16.5 Million Dollars) that will benefit both parties. This is legitimate' legal and your personality will not be compromised.

Waiting for your response for more details, As you are willing to execute this business opportunity with me.

Sincerely Yours,
Mr. Karim Zakari.
