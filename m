Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 667ABEEB20
	for <lists+ecryptfs@lfdr.de>; Mon,  4 Nov 2019 22:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729687AbfKDVaH (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 4 Nov 2019 16:30:07 -0500
Received: from mail-ed1-f44.google.com ([209.85.208.44]:44607 "EHLO
        mail-ed1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729481AbfKDVaH (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 4 Nov 2019 16:30:07 -0500
Received: by mail-ed1-f44.google.com with SMTP id a67so2250702edf.11
        for <ecryptfs@vger.kernel.org>; Mon, 04 Nov 2019 13:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=WtL+9z9jJiuvEXo+dzksgM1arTI6GcXzVK35hbgeARg=;
        b=ekfK93YbuAgPSGGsmG87yg4tzW31rRj/Ov/1iutQsDq9zaC16It/xK9zGt/oFsLFp/
         bFBlGq9XFHv657sUgYaDd4NAR5DsfbMet0wMeLk5McOU9jbvJMIjs+G+Z3KZWTJ0+d/e
         KCetHaFasZJbizZuEmCx35M+0g6v6dAhZMW9es/UhjsCVXSOcObAQrcAv52y86Cp+Hpo
         z/R2yqgSWXrxF+aTzgj4r/+h6vfqv/Eoy0xwTOQm5CgN9cwJvfNKOoI/uK/516qZb/Ka
         c4EgIbZlSSSuLW3ISY1p0PHBN+GCw2yHwFGpEu434WQ2HaJUYetB/XiwtaAd3kMlCBC4
         s9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=WtL+9z9jJiuvEXo+dzksgM1arTI6GcXzVK35hbgeARg=;
        b=LAgK9+DRbRgEiAVwmcrn3YsWOmmd/l12pIiXLPYsPxnmTc2EufBeLq5Jyv78Uwnmaj
         ePdARj6m2SSmINkc1gY8mTKdT9x4+hSfBt4pB7HPb/ndEEI8laK0cXihzEP4mozAkfWd
         Dhkt8Mvh0Xi4ijWbdFaGS57jYHT20Vk9Dvfev5KqvL2YQhO7IVuP22kEBt7h96FfGpfM
         qqzNpW3+hVg/3pUb45vVuowUb47vjK+AVGbGdH1wR8GzuGDsbWxVu1XKXJ8g2R3e5VEv
         F5VXHPSC2Iz8AmRU2sg42TQ8k6GvYENEQU7+8haY+rqW9te3FwLGmI5uMevrGUBklU6w
         28wg==
X-Gm-Message-State: APjAAAVT4Phz7aEzGRWbGFC12FH0c7Cr500QF2T23Png5+ZAUe7W9DhM
        YtuP672GDf/qMKcP6l6dhSMByb92vg/1Xf0XS6V1Q2wmcxM=
X-Google-Smtp-Source: APXvYqyi0VuWNX+HGKjQiVzns+XA2dw15PXO3lwTP91VjjniWMgVzF9Xj1udtlLo6nqKFa7DlwpoFUplvahfFwKIlIM=
X-Received: by 2002:a17:906:4e83:: with SMTP id v3mr5529316eju.246.1572903005594;
 Mon, 04 Nov 2019 13:30:05 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?Q?Vin=C3=ADcius_=C3=81vila_Eichenberg?= 
        <vinieich@gmail.com>
Date:   Mon, 4 Nov 2019 18:29:54 -0300
Message-ID: <CA+QKkaw4dLxa4HTPK=Y735wa5WnoUTo3HgJroFik1EBOLq36aQ@mail.gmail.com>
Subject: Decrypt/decode file names without mounting
To:     ecryptfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hello, I've posted a question on Crypto Stack Exchange and someone
suggested that I asked here. This is my first time using a mailing list so
I don't know if this is the right way to do it.

I have about two years of ecryptfs backups and I need to find for a
specific deleted file that probably was on one of these backups. I made a
list of all the filenames but don't know how to decrypt/decode them in any
way. Found already the key using keyctl but don't know what is the next
step but read something about parse tag 70 (?). As there is a lot of
backups it would be very time consuming to extract, mount all of them and
search for a file.

I don't have a lot of programming skills beside the very basics but I'm
willing to learn if it's necessary but thought that must have any command
like " openssl *** " that can help me.

English is not my primary language so if it needs more explaining I'll be
glad to reformulate.

Question on Crypto Stack Exchange (but I believe this email is a lot better
on the explaining side):
https://crypto.stackexchange.com/questions/75500/how-to-decode-decrypt-ecryptfs-filename

Thanks in advance!
Vinicius
