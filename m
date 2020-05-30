Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27431E90FF
	for <lists+ecryptfs@lfdr.de>; Sat, 30 May 2020 13:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgE3LzU (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sat, 30 May 2020 07:55:20 -0400
Received: from mail1.systemli.org ([198.167.223.214]:41794 "EHLO
        mail1.systemli.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728433AbgE3LzU (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sat, 30 May 2020 07:55:20 -0400
X-Greylist: delayed 586 seconds by postgrey-1.27 at vger.kernel.org; Sat, 30 May 2020 07:55:20 EDT
From:   javud <javud@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
        s=default; t=1590839130;
        bh=xkz0LKKkJOowRPZrcKYILDcixgJN2Z3LKCydBALumXY=;
        h=From:Subject:To:Date:From;
        b=Q2NQeF5ALLr2rRP2p4TfnzvO669W7SvCY7BWpFuE1s1vCDS72bzH8Fg2Xe/sMd65b
         7VnIh2U+ChF4KyL+3WUw26ST6a5zCJ1wIRcK/0ar5nHr5Un1TokJANmCqgJexYOxtF
         hoG60dKniVi6RE72qwnQ3UwcGtfhLzoe2yY7IxGzxJ7nPfvnYii1PVLNuNDtG05O4D
         kT8rH4H/uTyokGuKUTRERlQoVvYufT22uB4iRyfDPqe81U/uYQ/UNgE4+GfXewkNjZ
         RGVip+hvZ/IZC/MFvrMhvvKd2fCVJ8YhZq1YdJO8XCD7XWjU5rVJPcDF+2+u8nOqQI
         uBz0imZtwu7gQ==
Subject: Is it secure to store ecryptfs_sig?
To:     ecryptfs@vger.kernel.org
Message-ID: <37dfb473-cd29-4eca-9ada-333c388143f6@systemli.org>
Date:   Sat, 30 May 2020 13:45:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hey,

I started using ecryptfs to provide a version controlled file structure for a group of developers. 
To access our secured data, every user have to mount the ecrypfs. User who do this the first time, will get the warning, that the ecryptfs_sig was never stored before inside '~/.ecryptfs/sig-cache.txt'. 

WARNING: Based on the contents of [/root/.ecryptfs/sig-cache.txt],
it looks like you have never mounted with this key
before. This could mean that you have typed your
passphrase wrong.
(ecryptfs-utils 2009-03-24)

To be sure, that this message will only appear, if a wrong passphrase was entered, I thought about to provide the correct ecryptfs_sig during the mount routine, but before I will do this, I would like to know more about the ecryptfs_sig.

What is the purpose of ecryptfs_sig?
Is ecryptfs_sig just a hash of the passphrase to be sure not to take a new one? 
Therefore is it secure to public provide the ecryptfs_sig?

Until now, I could not find the source code part of ecryptfs_sig inside the kernel or userspace repository. I just found the following explanation inside the README of the userspace code, but this did not helped me further 
(What is FEKEK: FileEncryptionKeyEncryptionKey? ^^):

ecryptfs_sig=<hex signature>
        The signature for the FEKEK to use to encrypt the FEK for newly
        created files.  A key with description <sig> should be in the
        user's session keyring.  The mount helper, with its key modules,
        should make sure that the key gets placed there.

Thanks for any help : )

Best regards,
javud
