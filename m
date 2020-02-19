Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C96216397B
	for <lists+ecryptfs@lfdr.de>; Wed, 19 Feb 2020 02:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgBSBmX (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 18 Feb 2020 20:42:23 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38090 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgBSBmX (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 18 Feb 2020 20:42:23 -0500
Received: by mail-pg1-f195.google.com with SMTP id d6so11872678pgn.5
        for <ecryptfs@vger.kernel.org>; Tue, 18 Feb 2020 17:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C/xiJ+koU1XQxcS5UPGkaT2Am0PkeiHay7MtQiKaozg=;
        b=CT3kCIYa5daBjLuoMobOwc6IB0h/YJ0NASfg+2rZsT3e1iY3iv5h/3m19HWlqSUHaN
         rjxrryUNbrGcfNsea+2SXvqpXTCwd5AALJ7l/FGTdNqRsoE1kxM4eBZhqBhlUCX2Xcs1
         we0uNJ7hHH6YmXRQofRHzTq6u4ArnocWYvJxsCLZpUrS5f/UABVyPrrBCHKzv8Pb3tBC
         H3YfI1LrhbC0peIJd3gEd1q5vog5cTDloIQS8G0F1DuDNzKIbouMYyckI3va/hfNHYdN
         NADdFYrjvS3sFhwpdsfq8FN+4RZKdpQntc+UmiuqX0iEHvk+UsQrVfR5LZaD/17KnmC8
         1mvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C/xiJ+koU1XQxcS5UPGkaT2Am0PkeiHay7MtQiKaozg=;
        b=GUFzDgQO6bnl8mcfz/Ai8Oz40VY025QZHxWvxlxwvLf9jFrb94rGUQkIG17m6sCuc5
         5O4eyh5X//DwzRFjbHjgCXiqRkjugm/ZATf+faIpT/JB1qODKxznaKlMXg2tcwLcJKWE
         adahspAbCC0OmAly38ZaPurJwiD91IJWEmw5+8aKfCdelt2gSJ0cdQFkj3xC+tVWBOYI
         HoQLOa99rOG3OZ5nLM4gi6R9EVNaLMjtgMOEAHhVzD17psGq1u7y5YTC9iMYKAEHUeuA
         kq3LssrhftzzGjtDGE4+MJWX1YgOmyLjfeqJKOboVgGjIWBfd3W3a/lpdFsNbLCmOkvW
         /yBA==
X-Gm-Message-State: APjAAAU2bWqYd5eA4kG4bZ4yWiLH/CDZhmOtuPdeM6/d892e021EOH6e
        PTo8fYVRSg1ZN4oTfGioQOWYqgIV
X-Google-Smtp-Source: APXvYqzZgSmxTxyuiwHL1Mq4hRhBYk8da+LRSdmS4VF+cOqhORbBa9S0mzeBdvRRHsPzfDItxEt8+A==
X-Received: by 2002:aa7:8558:: with SMTP id y24mr6774097pfn.230.1582076542371;
        Tue, 18 Feb 2020 17:42:22 -0800 (PST)
Received: from neutron (108-237-41-25.lightspeed.sntcca.sbcglobal.net. [108.237.41.25])
        by smtp.gmail.com with ESMTPSA id k29sm271998pfh.77.2020.02.18.17.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 17:42:21 -0800 (PST)
Date:   Tue, 18 Feb 2020 17:42:18 -0800
From:   Brian Kubisiak <brian.kubisiak@gmail.com>
To:     Tyler Hicks <code@tyhicks.com>
Cc:     ecryptfs@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: add mount option for specifying cipher driver.
Message-ID: <20200219014218.GA17588@neutron>
References: <20200210153907.GA348@brian-desktop>
 <20200216010731.GA260140@elm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200216010731.GA260140@elm>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hi Tyler,

> Can you elaborate some on the use case you have?

On many modern embedded SoCs, there are multiple implementations of the same
crypto algorithm---usually a CPU-based implementation using ISA extensions and a
"security engine" implementation that implements crypto primitives on dedicated
silicon. There are a few tradeoffs involved (performance, CPU overhead,
resistance to side-channels attacks, etc), so it is not always clear which
implementation is best.

An SoC that I've been working on has both the CPU implementation and the
security engine implementation of the cbc(aes) algorithm at the same priority,
so the one picked to perform the encryption for a given ecryptfs mount is
somewhat random. My intention with this patch is to be able to select which
implementation gets used for the mount using the ecryptfs_cipher_driver option
instead of having the kernel pick.

The fact that this would also effectively override the ecryptfs_cipher option is
an unintended side effect, since the crypto_alloc_skcipher() function will take
either the algorithm name or the driver name. Maybe there is a better way to do
this?

Thanks,
Brian
