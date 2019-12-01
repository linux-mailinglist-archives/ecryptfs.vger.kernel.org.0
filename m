Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 952BA10E2E6
	for <lists+ecryptfs@lfdr.de>; Sun,  1 Dec 2019 19:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfLASRS (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 1 Dec 2019 13:17:18 -0500
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:15919 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbfLASRS (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Sun, 1 Dec 2019 13:17:18 -0500
X-Greylist: delayed 6428 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 13:17:17 EST
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1575217583; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Message-Id:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAI-Spam-Flag:X-NAI-Spam-Threshold:X-NAI-Spam-Score:
         X-NAI-Spam-Rules:X-NAI-Spam-Version; bh=M
        8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs4
        8=; b=HpWj3EcGEwN247IA/ptuIbwT8BWtrW6LW4P1A3WZSSl8
        AuDOfPnWnqBjx1h/XaT/w2Ts5TMNZTvnOPezbo0EZ1lfD/e8dK
        2MJpdaUw2QUd44XoMu3+ZTzW95ID3/MvWnSoR7sUWtWbVPq7Xw
        RlbqTCBmVOL79LWvrwKeueKNphU=
Received: from cdmx.gob.mx (correo.cdmx.gob.mx [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 217f_5f37_110e9351_c499_4185_9ede_5a2b64699bc1;
        Sun, 01 Dec 2019 10:26:22 -0600
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 4C43A1E2685;
        Sun,  1 Dec 2019 10:18:10 -0600 (CST)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id LG4rgJZ_FkKB; Sun,  1 Dec 2019 10:18:10 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 1787C1E26E1;
        Sun,  1 Dec 2019 10:12:58 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx 1787C1E26E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1575216778;
        bh=M8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs48=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Message-Id;
        b=qN/D3mfGTjOM9lzMAFLNPYvLVC/bjJcGi8zwQndcswOLUjF34xM8UoA/t1wqlbxmd
         oL2vDlEKlgoyt8LGD0HRrpolJpepCRDSW8sB+b6SHxPTEILVJ17pdhXrHxzU1B8fqm
         g21p1Dg5ddqIpAw7Oml/lThm0aqMZ1mIp06/8MI0=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id la31lDYroY22; Sun,  1 Dec 2019 10:12:58 -0600 (CST)
Received: from [192.168.0.104] (unknown [188.125.168.160])
        by cdmx.gob.mx (Postfix) with ESMTPSA id 8464D1E2B67;
        Sun,  1 Dec 2019 10:03:53 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Congratulations
To:     Recipients <aac-styfe@cdmx.gob.mx>
From:   "Bishop Johnr" <aac-styfe@cdmx.gob.mx>
Date:   Sun, 01 Dec 2019 17:03:43 +0100
Message-Id: <20191201160353.8464D1E2B67@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=Ibr3YSia c=1 sm=1 tr=0 p=6K-Ig8iNAUou4E5wYCEA:9 p]
X-AnalysisOut: [=zRI05YRXt28A:10 a=T6zFoIZ12MK39YzkfxrL7A==:117 a=9152RP8M]
X-AnalysisOut: [6GQqDhC/mI/QXQ==:17 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=]
X-AnalysisOut: [pGLkceISAAAA:8 a=wPNLvfGTeEIA:10 a=M8O0W8wq6qAA:10 a=Ygvjr]
X-AnalysisOut: [iKHvHXA2FhpO6d-:22]
X-SAAS-TrackingID: da9e3ed5.0.48577645.00-2358.81663835.s12p02m013.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6686> : inlines <7165> : streams
 <1840193> : uri <2949749>
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Money was donated to you by Mr and Mrs Allen and Violet Large, just contact=
 them with this email for more information =


EMail: allenandvioletlargeaward@gmail.com
