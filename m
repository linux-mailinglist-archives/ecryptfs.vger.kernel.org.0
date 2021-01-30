Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8690E30976C
	for <lists+ecryptfs@lfdr.de>; Sat, 30 Jan 2021 18:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhA3R6E (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sat, 30 Jan 2021 12:58:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbhA3R6D (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sat, 30 Jan 2021 12:58:03 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D527C061574
        for <ecryptfs@vger.kernel.org>; Sat, 30 Jan 2021 09:57:14 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id g69so13817294oib.12
        for <ecryptfs@vger.kernel.org>; Sat, 30 Jan 2021 09:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fi9b8nckj7fadbbwIBvSspDDslJwaNj4fD74sOu9ZAA=;
        b=w1El+5MymFdgHBc2MzkvbLT0ZdiJcE8FmuZoTzT8/HcbHzd/5bmT7hOcEzo7HLDUry
         9CimPDwEQal0ecwBtaFdp9tGqkMZlh8P8xIELUxQDZq8YrI+QJBbpuuhSGJbjUY3UwE6
         nFcc/vz1pchgE59tl/jlgx1v2DKVHSOWg5VKbwoz73wU+c5dxnQOiDu2xzB36E0aamG/
         ONX4yk3iMkTbNzTk3Rb/ceefrLnBhkDEuwRNs46ZoNzWnKnmuUC8Txf3lyQab50tDH8E
         nacjChzxSLa4X6xTuZGnoOAtPf37d6lud6rHzJYlrRCfJJuqmWtIApdqASDMuv5P/epw
         NHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fi9b8nckj7fadbbwIBvSspDDslJwaNj4fD74sOu9ZAA=;
        b=ZHz/H7iZeFUMZw9k60vVaTg1SXlzJQgted3rJbd6OYbaRH47Zcuytc1qBO3RDSt+fn
         BXBukea6T7TeCr9TeDvajLQAZLqk82GAPMirBEJdVp3ybnE0RC3Wo/zjdHtn9WNQBEul
         gr6znlfACeCwbRRxeDV18n9dyc6unBSYRwO/Gn4Py/hdfxNRHgcsQCk9TheJZ+YdkdhZ
         keFDBZ7CDZNMxYfUPFMWe/XbOFmdXrUFUFU+VHHEIOk33x9Ui9kmZiJ1O8hr+hoox9ah
         oVnzhw85rooVFBiEEG0OCaht9QPz9Z4XqjUM9n9VLrJU+m9v5hmgJ+EkI4UBNpeRd7cP
         nXVQ==
X-Gm-Message-State: AOAM530i8lVPgfRYiaHHhlXDf5Kjl3uzZpBVC0L3jn2Pma/0vcWH4Nqu
        m6i/kGV5yvdKrpWR4+K0rJALRw==
X-Google-Smtp-Source: ABdhPJz4dXFvNiMwBfQVvuV1r4yGCeptNQz+gVDG4xoq0tAnKDX0cs6lBMV71NX1EZPupsjas9OJ5A==
X-Received: by 2002:aca:eb0a:: with SMTP id j10mr6224338oih.4.1612029433451;
        Sat, 30 Jan 2021 09:57:13 -0800 (PST)
Received: from elm (162-237-133-238.lightspeed.rcsntx.sbcglobal.net. [162.237.133.238])
        by smtp.gmail.com with ESMTPSA id n28sm2854545otr.70.2021.01.30.09.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 09:57:13 -0800 (PST)
Date:   Sat, 30 Jan 2021 11:57:11 -0600
From:   Tyler Hicks <code@tyhicks.com>
To:     Joe Perches <joe@perches.com>
Cc:     trix@redhat.com, hannes@cmpxchg.org, mhocko@suse.com,
        longman@redhat.com, herbert@gondor.apana.org.au,
        ebiggers@google.com, ecryptfs@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] eCryptfs: add a semicolon
Message-ID: <20210130175711.GB58096@elm>
References: <20201127160513.2619747-1-trix@redhat.com>
 <3168a3aa5c4ac564340cba2a151359e8cd3dee5f.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3168a3aa5c4ac564340cba2a151359e8cd3dee5f.camel@perches.com>
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2020-11-27 10:11:23, Joe Perches wrote:
> On Fri, 2020-11-27 at 08:05 -0800, trix@redhat.com wrote:
> > Function like macros should have a semicolon.
> []
> > diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> []
> > @@ -1172,7 +1172,7 @@ decrypt_pki_encrypted_session_key(struct ecryptfs_auth_tok *auth_tok,
> >  	rc = ecryptfs_cipher_code_to_string(crypt_stat->cipher, cipher_code);
> >  	if (rc) {
> >  		ecryptfs_printk(KERN_ERR, "Cipher code [%d] is invalid\n",
> > -				cipher_code)
> > +				cipher_code);
> 
> As this is the only use that does not have a semicolon,
> it'd be good to add the removal of the semicolon from
> the #define at the same time.

I double checked that this is the only ecryptfs_printk() usage missing
the trailing semicolon and then made Joe's suggested change before
pushing the patch to the eCryptfs next branch:

 https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git/log/?h=next

Thanks for the cleanup!

Tyler
