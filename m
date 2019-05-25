Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97D752A6E3
	for <lists+ecryptfs@lfdr.de>; Sat, 25 May 2019 22:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbfEYULB (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sat, 25 May 2019 16:11:01 -0400
Received: from mail.dadosch.de ([37.120.174.84]:49710 "EHLO mail.dadosch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727183AbfEYULB (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Sat, 25 May 2019 16:11:01 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Sat, 25 May 2019 16:11:00 EDT
To:     ecryptfs@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dadosch.de; s=key4;
        t=1558814659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=u/rDMEJRuG2FFUC294g/KZC3ZAK8bOpS6eG1ye+l4Qs=;
        b=loOPSh8OPkVRTa2rOUCtOAV270kWNquDJqJLSVmtTIsgRByFhEbyyo0KIquQtRxYbc6HOn
        ygLrmKieJDUl6g/yLe7fqcRO5/5L+namzrXh8EDRnGYWGBKLHxxmezg4YDEmOJXNeHBp08
        KzHJjGWF0hRvfjLKCi3liPdSgSGClYHuWAH8+FCvkDT+qlp6Zt4WAxCLk0NTo6lrxuBybg
        GMZFKLHK049+M8cjnYTWU9lvpRNhF1cHKDFDMb+mqBDPBKsWa8PniOiV6tANCe2zcfijNV
        IJU/MaTt4cX953226DZHQf3YgxhL9k34jixJXae/dbCvGgdtufiFK7nc9LM7ZQ==
From:   daniel-mailinglists@dadosch.de
Subject: ecryptfs doesn't load with kernel > 5.0.8
Message-ID: <be92ac43-79fa-a24c-7943-a96cc6ff7ccd@dadosch.de>
Date:   Sat, 25 May 2019 22:04:18 +0200
Content-Type: text/plain; charset=utf-8
Content-Language: de-CH
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=dadosch.de;
        s=key4; t=1558814659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=u/rDMEJRuG2FFUC294g/KZC3ZAK8bOpS6eG1ye+l4Qs=;
        b=BE4Q+zAQHV1sVvTMXvni5eiEnlZfGRAjvFSY9lt7Xo233mYfLNCA9fAgqsOWagTcNMbgyB
        lbvXLG6VjzgdDo5Y06D7R/sIxTjaBsNrQBB0872Lby4oruWK/Y2ARNpOBdX61ILT6WSJa3
        TR3Cini6UPLf40jAhbq0RCXSdA84yW6S4UPc1xYvX1Tyk2JWBADUhwEhCXk92akV6E1taD
        v7AEOUIt7hLkfvmzkqi9cBkcVhJO86AWQ5S1uIyCXhy5cvTbi4dLfWZyNiML7Iho+TK+GC
        Hs4zmBWiIztXIpx5WtBYZWIULoFU5SnvB9sBTWQDpHo7kZtUPdBxYI2r6oXDxQ==
ARC-Seal: i=1; s=key4; d=dadosch.de; t=1558814659; a=rsa-sha256; cv=none;
        b=KxP/byY0wex5JLVThPS5V8eBRPy4iPuqueEa4zaw87R5SF51nGMInckrMYQTxvzSo0tdsR
        VN5zWPadWxeJEfty4xcSioRnU9/mdDB3SgaQeMwCPLOtbZ7HEsRi5Kb+uo6JsclYSn7Ehe
        AFtGOQ4Ayom/vL3F3bOaiNiYtz4n9Yd6FND2Xv+u8n8mGCEZX56IG5+d+sgyzl+jtCuv1o
        t7yemLhsIuoKOAsCrWK/KdJCG5j2soJ6kArqU1DZlBsSuzhzl3ZUkSnXQrb5Ox666/o4cI
        lz/EfU2zr5emRyopxuLryxTGZClWNqa8tKSWgKcTbW3tMYMueXoQNVknXAvAIw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=ich@daniel-schweikert.de smtp.mailfrom=daniel-mailinglists@dadosch.de
Authentication-Results: ORIGINATING;
        auth=pass smtp.auth=ich@daniel-schweikert.de smtp.mailfrom=daniel-mailinglists@dadosch.de
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hello,

after an update from kernel 5.0.8 to 5.1.2, the ecryptfs module doesn't
load successfully anymore for me.


It boils down to this error message, as far as I understand the topic:

  kernel: ecryptfs: Unknown symbol key_type_encrypted (err -2)

With the help of the Arch linux forum users (see thread here
https://bbs.archlinux.org/viewtopic.php?pid=1846577), we found out that
ecryptfs works fine with newer kernel versions for people without a TPM
and for those with TPM with TxT enabled in the BIOS; but for me the TxT
option is disabled in the BIOS so this isn't a solution. (As ecryptfs
works fine with kernel 5.0.8)

Now I'm unsure wether this is a bug or what's going on, so I'm happy
about any ideas.


Thank you in advance,

Daniel "juphu2Va"
