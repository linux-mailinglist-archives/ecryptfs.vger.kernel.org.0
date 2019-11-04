Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B259DEEB4C
	for <lists+ecryptfs@lfdr.de>; Mon,  4 Nov 2019 22:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbfKDVjC (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 4 Nov 2019 16:39:02 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:54460 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbfKDVjC (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 4 Nov 2019 16:39:02 -0500
Received: from 1.general.tyhicks.us.vpn ([10.172.64.52] helo=elm)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <tyhicks@canonical.com>)
        id 1iRk3w-00054d-BC; Mon, 04 Nov 2019 21:39:00 +0000
Date:   Mon, 4 Nov 2019 15:38:57 -0600
From:   Tyler Hicks <tyhicks@canonical.com>
To:     =?iso-8859-1?Q?Vin=EDcius_=C1vila?= Eichenberg 
        <vinieich@gmail.com>
Cc:     ecryptfs@vger.kernel.org
Subject: Re: Decrypt/decode file names without mounting
Message-ID: <20191104213857.GC12965@elm>
References: <CA+QKkaw4dLxa4HTPK=Y735wa5WnoUTo3HgJroFik1EBOLq36aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+QKkaw4dLxa4HTPK=Y735wa5WnoUTo3HgJroFik1EBOLq36aQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2019-11-04 18:29:54, Vinícius Ávila Eichenberg wrote:
> Hello, I've posted a question on Crypto Stack Exchange and someone
> suggested that I asked here. This is my first time using a mailing list so
> I don't know if this is the right way to do it.

Hello - Your email arrived just fine.

> 
> I have about two years of ecryptfs backups and I need to find for a
> specific deleted file that probably was on one of these backups. I made a
> list of all the filenames but don't know how to decrypt/decode them in any
> way. Found already the key using keyctl but don't know what is the next
> step but read something about parse tag 70 (?). As there is a lot of
> backups it would be very time consuming to extract, mount all of them and
> search for a file.

There is no existing utility, that I'm aware of, to decrypt/decode
eCryptfs file names.

The original eCryptfs design followed RFC 4880 (OpenPGP) for formatting
the crypto metadata that eCryptfs stores for each encrypted file. You'll
see some of the kernel code referencing various "tag N" packet formats
and most of those came from RFC 4880. The "tag 70" format used for
filename encryption is one-off, if I remember correctly, and doesn't
follow any pre-existing standards.

> I don't have a lot of programming skills beside the very basics but I'm
> willing to learn if it's necessary but thought that must have any command
> like " openssl *** " that can help me.

Unfortunately, no command will be of any help. A utility will have to be
written or you'll have to script up the commands needed to mount and
search your backups.

Tyler

> English is not my primary language so if it needs more explaining I'll be
> glad to reformulate.
> 
> Question on Crypto Stack Exchange (but I believe this email is a lot better
> on the explaining side):
> https://crypto.stackexchange.com/questions/75500/how-to-decode-decrypt-ecryptfs-filename
> 
> Thanks in advance!
> Vinicius
