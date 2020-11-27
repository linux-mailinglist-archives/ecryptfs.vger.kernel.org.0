Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E8C2C6B68
	for <lists+ecryptfs@lfdr.de>; Fri, 27 Nov 2020 19:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732711AbgK0SL1 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 27 Nov 2020 13:11:27 -0500
Received: from smtprelay0139.hostedemail.com ([216.40.44.139]:49898 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732323AbgK0SL1 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 27 Nov 2020 13:11:27 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 152EB1801E323;
        Fri, 27 Nov 2020 18:11:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3350:3622:3865:3866:3867:3871:3872:3874:4321:5007:9389:10004:10400:10848:11026:11232:11658:11914:12043:12048:12297:12438:12740:12895:13069:13161:13229:13311:13357:13439:13894:14181:14659:14721:21080:21451:21627:30012:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:4,LUA_SUMMARY:none
X-HE-Tag: town85_4e036de2738a
X-Filterd-Recvd-Size: 1466
Received: from XPS-9350.home (unknown [47.151.128.180])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Fri, 27 Nov 2020 18:11:24 +0000 (UTC)
Message-ID: <3168a3aa5c4ac564340cba2a151359e8cd3dee5f.camel@perches.com>
Subject: Re: [PATCH] eCryptfs: add a semicolon
From:   Joe Perches <joe@perches.com>
To:     trix@redhat.com, code@tyhicks.com, hannes@cmpxchg.org,
        mhocko@suse.com, longman@redhat.com, herbert@gondor.apana.org.au,
        ebiggers@google.com
Cc:     ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 27 Nov 2020 10:11:23 -0800
In-Reply-To: <20201127160513.2619747-1-trix@redhat.com>
References: <20201127160513.2619747-1-trix@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On Fri, 2020-11-27 at 08:05 -0800, trix@redhat.com wrote:
> Function like macros should have a semicolon.
[]
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
[]
> @@ -1172,7 +1172,7 @@ decrypt_pki_encrypted_session_key(struct ecryptfs_auth_tok *auth_tok,
>  	rc = ecryptfs_cipher_code_to_string(crypt_stat->cipher, cipher_code);
>  	if (rc) {
>  		ecryptfs_printk(KERN_ERR, "Cipher code [%d] is invalid\n",
> -				cipher_code)
> +				cipher_code);

As this is the only use that does not have a semicolon,
it'd be good to add the removal of the semicolon from
the #define at the same time.


