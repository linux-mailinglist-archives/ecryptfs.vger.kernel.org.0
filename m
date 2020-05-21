Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9731DD346
	for <lists+ecryptfs@lfdr.de>; Thu, 21 May 2020 18:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgEUQrN (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Thu, 21 May 2020 12:47:13 -0400
Received: from sonic317-26.consmr.mail.bf2.yahoo.com ([74.6.129.81]:46541 "EHLO
        sonic317-26.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726938AbgEUQrN (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Thu, 21 May 2020 12:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1590079632; bh=6mffK3RH01pMSJbI3gzRyn/TJ4jPuu2pqeTpPbg3ras=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Sfb6kJ8Cj834HesYyE5+5knkFLGDMRDFJw8J6qOkTr+uvz9CRPFgsQ25TC/p2IW4+rZg0Mb09esoqgJsk0gJoip3vHPaCR3tyc8Yyy8YX3hcXdJKW9lnpElOBAF8TJhOzCFA/OgkULh1FWC8SMKZ3pmv6VsHs4qBTduXCVTsHShauBMk291dm3wzGFDbctvTFUfWd7w8Iuf955CGeuQNW9cRrVTFNgaT+Vwf2bL0NfzJeyR+sUANN2FFPyBVPMQ1zr7du1rldCJsSKIuRKqLnhEkt/w69dE8vZyEV+bFBDPQDRg3bLgPEmq24n7y45CJDhsCtVaKo3Qf0aHJViSTeQ==
X-YMail-OSG: 9he466cVM1m4KVaCRwGiVCILyi3Z5PYMZMIudGhuQHR1vxbRstMVT2YvJetwHyN
 j4lFncKA6MQYFYnC9oLq2eoKZfOUWxLRU9foCmspHA2EgtVX6lDmtTjcCX0P0AwQjSzsBM9dOgs7
 pd3kVthw8QMLiDGlfXvnJJ3OJTszKDXM93RhCwkYmJc1D039pQOOZnPpwtQpwhVj9uapvb0ETm_D
 laZKq369Ji88FwlCqfrDFetC2dlyVUa1qRjFQbXJufOLLAvq3opAUfBctKfEd1mB229o8IkFlS.4
 m2Pnl7HoQ81ia3XzFl.HQat8vFnXs2VhYCTnmyHWBeSI_m_iqrOF4l9QK8D0iNcxAfEo.tARJ8KA
 XRzzj2dF4xLBjK4C8hJPBKLs8yToebDkEvpCslVa0zA3enOW0GvVOJ0_B8O_7jcxSyTmhIPNZjxZ
 spvOnxAFRicYESJTJke5EnHQZo6rqMuTNHDw13jKv9VyDj_En9L5a7kmFc11R8OvGFdIrWm7X8F.
 qU1.OrnFuG.tLNoLpcJ7foBZ8.QvOXdH9f6XJyT1nWwon791fHvz8WC4RU1BQk4W2kheW3_GQ6AI
 M5L7ttg1q3mvjd.bDuH_.xp50EaHcKjEISM3Z0gFd0YAFWhTe3k5lE3QS9m0w4EKR4E0ocmJbAjE
 KRwCX8y8sDo0j1NJstQA3_88tNqvr1SHTzqpmkXLG4R0MfLiCec.3srNz4OqGUBM5aUi2hQia686
 3wxi4cC6vhURbkXKe2DoFlLViPyz1.Xd5yWxymKcC4aXRVGtx2m.nVQwVkvjHTJTKvpDJWd1RPm9
 VBf8.j1NSxONBS18CUjLnXDk43FDUyKLPqy5yY5r4z5.HXgBcsQyxmVS34BzLUrsCRI0rBStxAmY
 B.vMRdCVd9yBOW_LQ24kZrnfOqzb2ImXWu15_vFzTpWMh.YJ4tpjodBCfXvm6LDdsrF327uxI08Q
 WsOQyNwvm3ELhmIi_NXa3UCBEZim2gGJaQ9xeFNmZ74d1d3iGdauiX8RefNbM4QzMgwlIBFXuHdV
 MPs_EX0JjBBzF8vJWIHx.v9y4Hf.JCKl09iGznIcYMzgKaXzzEZgvQDD4ns9gR0mjqauQxAwhI87
 .DsB1cr1Q.cg_616GiaDAprCgChq7NH9Fy3qEadMkIdaZ5TDeEGzX7Hl_M5HIL3pZ2dgzK4CkJzv
 hO6zZUet8D8BwdycJ6vlz_Hq5Ez_H6MxBMlwHrbDF.noUGV.FoLbq2f4jBwDbHFLh.7lNNHqQHF9
 D_QgAOmhsI6jF9NHVh4AKsA2HHec4rc__.Lk9Gbv5owLtRa1UvYSgs9UgOprbY6N9LeTojsRlbA-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.bf2.yahoo.com with HTTP; Thu, 21 May 2020 16:47:12 +0000
Date:   Thu, 21 May 2020 16:47:07 +0000 (UTC)
From:   Rose Gordon <rosegordonor@gmail.com>
Reply-To: rosegordonor@gmail.com
Message-ID: <1521326582.1935816.1590079627951@mail.yahoo.com>
Subject:  Hi there
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1521326582.1935816.1590079627951.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15960 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0
To:     unlisted-recipients:; (no To-header on input)
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hi Best of the day to you I'm Rose by name 32years old single lady, Can we be friends? i was born and raised in london in United Kingdom Take care Rose.
