Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F52612B39C
	for <lists+ecryptfs@lfdr.de>; Fri, 27 Dec 2019 10:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfL0Jpl (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 27 Dec 2019 04:45:41 -0500
Received: from mout.gmx.net ([212.227.15.18]:55815 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726169AbfL0Jpl (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Fri, 27 Dec 2019 04:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1577439940;
        bh=26j6jqNYKvmyX0k2Zsuoc5MPF1Ta/i1RHMUWdBU+urg=;
        h=X-UI-Sender-Class:Subject:From:To:Date;
        b=dGxuvNueVxB58bbDc/Mqif6fcYiZKSXmoCQ/qlZDx4gmPKExr/wUL0h14YW3+1uBT
         oaWT8XZxxua2S6yywegTHAa2y53TkfoIsRMhT3n5QrIbOv6xXoDLNgFvZ/VAhzfnab
         dgToxTJRYNaSijTWICxgsIWYiJ5nMftsQ/zpvVdw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ws-100 ([79.222.35.221]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MY6Cl-1jGMTh1Dx7-00YP4k for
 <ecryptfs@vger.kernel.org>; Fri, 27 Dec 2019 10:45:40 +0100
Message-ID: <33b3202d2360f7e54e1b1e147eeab949f788fa74.camel@gmx.de>
Subject: Debian package
From:   =?ISO-8859-1?Q?Ren=E9?= Schmidt <remasch@gmx.de>
To:     ecryptfs@vger.kernel.org
Date:   Fri, 27 Dec 2019 10:45:39 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:NT0GvwUvQqwJkVTMcbR63JODDxTvIz/oQIHhsMBPpT6WHY15N9C
 +08LElI77rRwe+qPsqF1Xr35/6ptYbmwqqgmh9gej8hdxuIX/kfYwzuczzE72AcRZME3576
 DRkl+Y77P8nD1FuD8hu9d15wrAIFodF5flhwU7MmHxCY98V7iwR6ZiltOELt9a+caFA94ik
 zzMA5UUHH28NZM2gD1C/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nd0d/+geE7Q=:c0cZ/6sdPNayLYexL7X8Tb
 mZYlydiSEErgJS+lDuEfeOWvkynG+H/BU1OslwC6UX7Ly9iXx9nwouvYgWLkvVEjWuQfYPLWm
 VYM8qmzumyJVeONHhNLXExh4oJvn8YMri1zUO+yiFkDk003MyNucoHVSyOdgfopLzqzu/kBcs
 NzOfVOc0AOJbxKvIM9iBdXtsP+9wYVA2IhM+yYPprYB/dtJi5iQ+k57/nuunTkDqU6EQFAi8d
 E2CyyDtV/99i2PXtXq0xfL32SrzDsfWg9yDqD2DBFp1da3qy4nkAHgBI3M56AwMou3RrmDCTT
 YZVmwcPCrjk1i1xXjRu1c+b9Xw5zXtn/g4xSKEj7qIDCCpLKZKpRtiKa9To4yqZm9xU44am27
 kismViTzQheOwuYXI+2NjCQ2zHR9Cvnh4PRiOCysZPTZBTi7EnaQKcal0DXP8pwSvsrXzr7Ua
 LysgSWumoxFL5u8R5lCoUny3x6BLz5zT7FTNTqW+JFy97n0QLSu7+WI2bnQc58Sk2QG6uaQpC
 mcb7BwTm14vseQXei1QKPxMfleggxyK8+EFWfntl7OnZn42RrN8dUqOjfIGDk0Foinv1gPPLp
 a+TxBnLs8u2e0ucyvAwC6C1yE8YXcP2ls/1bBsyIk3rRoCrBg88cQBQA18vxSe5/WpAxUWGTs
 XO/DOtNcw36ds07DKtGAMb2nm2b+SHDO/A19qRM86hGXkLJcE015FA1g88Id8UIH/vViTH61E
 JQwxURB7vjM5j3JxEAEdJllES3A6etkrlPuPaWT/ea2BxOGnUaxSZ0FTT4FlOHcvmwiy4vTMU
 YFu86Kux3cifa9/Qu+7csto0GWPqfGKJP55viYwOwms87WwtyYZBlj7DEtLhnt1XhBePz/DWn
 m9zWDByeJTb7mZT9zSoXXPWdMKhokIBL22W71Doze9Z9MQZJ89rbNdMELDlFemwsUMfpGzM74
 v5D89ZBgS/UOiGiyAJnX2/+5zSLfoHCcDPTp7IXX6uAYMQlUjrDbStua2x9CU7fYPAD+t948P
 0yPHLJuGWD8HvmI3hJfS6XqG0xTwiYc2s+RH23lFceySGa72ckRH653pJCFPUsfaHyjT8Ta1Y
 mAgXCb9kB7fVkaW7VR7QS9/3BXQCxvxhotMa1Qf7q2MQFo954l0dKG+1kCwcPWbN3z9ACCqP5
 x4EK2CL0CBQ/aiVP7Ssudz5cuYpXRsCuJtwQ+CXL0//zmQcmeTvM4VDS0GuEhEjA6KhNQnIcJ
 5Wh8A9Zj8Dfu+Mj6iO3wYrDk5EnvEXkr21QNGVQ==
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hello,

when will the ecryptfs-utils return to Debian?

Thanks in advance (also for all the work).

Best regards

