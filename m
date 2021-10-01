Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D225741EBED
	for <lists+ecryptfs@lfdr.de>; Fri,  1 Oct 2021 13:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353865AbhJALbt (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 1 Oct 2021 07:31:49 -0400
Received: from smtp-out005.kontent.com ([81.88.40.219]:45948 "EHLO
        smtp-out005.kontent.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353780AbhJALbs (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 1 Oct 2021 07:31:48 -0400
X-Greylist: delayed 1504 seconds by postgrey-1.27 at vger.kernel.org; Fri, 01 Oct 2021 07:31:48 EDT
Received: from rakete.bodenbinder.de (p4ffdb9d4.dip0.t-ipconnect.de [79.253.185.212])
        (Authenticated sender: bodenbinder_de@smtp-out005.kontent.com)
        by smtp-out005.kontent.com (Postfix) with ESMTPA id F1131300CC19
        for <ecryptfs@vger.kernel.org>; Fri,  1 Oct 2021 13:04:58 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by rakete.bodenbinder.de (Postfix) with ESMTP id C5A592B0C858
        for <ecryptfs@vger.kernel.org>; Fri,  1 Oct 2021 13:04:58 +0200 (CEST)
Message-ID: <e0af3fe10229d90357dd351b4348ec6af59f2e3f.camel@bodenbinder.de>
Subject: bad file permissions: write but no read access
From:   Matthias Bodenbinder <matthias@bodenbinder.de>
Reply-To: matthias@bodenbinder.de
To:     ecryptfs@vger.kernel.org
Date:   Fri, 01 Oct 2021 13:04:58 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hi,

I hundreds of files in my ecryptfs home which I can write (e.g. rename them) but I can not read them resp. open them. A chmod as
user or even as root is not working. 

Example:

34# file wencke-18te.xcf
wencke-18te.xcf: writable, regular file, no read permission

35# ll wencke-18te.xcf
.rw-r--r-- matthias matthias 41 MB Thu Aug  3 16:00:46 2017 wencke-18te.xcf

36# getfacl wencke-18te.xcf 
# file: wencke-18te.xcf
# owner: matthias
# group: matthias
user::rw-
group::r--
other::r--

37# chmod 644 wencke-18te.xcf
chmod: changing permissions of 'wencke-18te.xcf': Input/output error

The underlying ecryptfs directory /home/.ecryptfs/matthias/ with .Private and .ecryptfs subdirectories is readable without error.
I can rsync it to my backup server. But when I mount it from the backup server with ecryptfs-recover-private I have the same
issue.

What can I do to fix that and make the files readable again?

Matthias

