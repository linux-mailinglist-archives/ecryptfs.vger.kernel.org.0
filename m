Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7599B41F0B7
	for <lists+ecryptfs@lfdr.de>; Fri,  1 Oct 2021 17:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbhJAPNp (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 1 Oct 2021 11:13:45 -0400
Received: from smtp-out001.kontent.com ([81.88.40.215]:52432 "EHLO
        smtp-out001.kontent.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbhJAPNp (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 1 Oct 2021 11:13:45 -0400
Received: from rakete.bodenbinder.de (p4ffdb9d4.dip0.t-ipconnect.de [79.253.185.212])
        (Authenticated sender: bodenbinder_de@smtp-out001.kontent.com)
        by smtp-out001.kontent.com (Postfix) with ESMTPA id 3EE504002B19
        for <ecryptfs@vger.kernel.org>; Fri,  1 Oct 2021 17:11:58 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by rakete.bodenbinder.de (Postfix) with ESMTP id 14F5B2B0C858
        for <ecryptfs@vger.kernel.org>; Fri,  1 Oct 2021 17:11:58 +0200 (CEST)
Message-ID: <014f761a4baf0a18dbeb16c439b2297296976cf7.camel@bodenbinder.de>
Subject: Re: bad file permissions: write but no read access
From:   Matthias Bodenbinder <matthias@bodenbinder.de>
Reply-To: matthias@bodenbinder.de
To:     ecryptfs@vger.kernel.org
Date:   Fri, 01 Oct 2021 17:11:58 +0200
In-Reply-To: <e0af3fe10229d90357dd351b4348ec6af59f2e3f.camel@bodenbinder.de>
References: <e0af3fe10229d90357dd351b4348ec6af59f2e3f.camel@bodenbinder.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

I notice messages like this in the journal for each such file Itry to read:

kernel: Valid eCryptfs headers not found in file header region or xattr region, inode 105438

How can this be fixed? 

Matthias


Am Freitag, dem 01.10.2021 um 13:04 +0200 schrieb Matthias Bodenbinder:
> Hi,
> 
> I hundreds of files in my ecryptfs home which I can write (e.g. rename them) but I can not read them resp. open them. A chmod as
> user or even as root is not working. 
> 
> Example:
> 
> 34# file wencke-18te.xcf
> wencke-18te.xcf: writable, regular file, no read permission
> 
> 35# ll wencke-18te.xcf
> .rw-r--r-- matthias matthias 41 MB Thu Aug  3 16:00:46 2017 wencke-18te.xcf
> 
> 36# getfacl wencke-18te.xcf 
> # file: wencke-18te.xcf
> # owner: matthias
> # group: matthias
> user::rw-
> group::r--
> other::r--
> 
> 37# chmod 644 wencke-18te.xcf
> chmod: changing permissions of 'wencke-18te.xcf': Input/output error
> 
> The underlying ecryptfs directory /home/.ecryptfs/matthias/ with .Private and .ecryptfs subdirectories is readable without
> error.
> I can rsync it to my backup server. But when I mount it from the backup server with ecryptfs-recover-private I have the same
> issue.
> 
> What can I do to fix that and make the files readable again?
> 
> Matthias
> 


