Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6D9164C79
	for <lists+ecryptfs@lfdr.de>; Wed, 19 Feb 2020 18:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgBSRt4 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 19 Feb 2020 12:49:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:49812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbgBSRt4 (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Wed, 19 Feb 2020 12:49:56 -0500
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DB5F206DB;
        Wed, 19 Feb 2020 17:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582134595;
        bh=d9vCy6W6sbu1izQMVzwtEI0HcX0YQYsVYqv2fhWrmNg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nqrflJp1ezz85KfKeUzmtyvUZI0JF+EUijBceKnO3zSRPP8gQhVDm/mG+oAxQ3G87
         9kf3lUx2rgQQs0rQJXi/MD7MrfkGzGrJ0HxpbTYb7fY/f2iy6miRQJX9AGp56NQ4z5
         qGKahuaZibVWIwGE9ZpelVAqyAuWnIl/7KAk905g=
Date:   Wed, 19 Feb 2020 09:49:53 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Tyler Hicks <code@tyhicks.com>
Cc:     Brian Kubisiak <brian.kubisiak@gmail.com>, ecryptfs@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: add mount option for specifying cipher driver.
Message-ID: <20200219174953.GA2312@sol.localdomain>
References: <20200210153907.GA348@brian-desktop>
 <20200216010731.GA260140@elm>
 <20200219014218.GA17588@neutron>
 <20200219163050.GA354535@elm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219163050.GA354535@elm>
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On Wed, Feb 19, 2020 at 10:30:50AM -0600, Tyler Hicks wrote:
> On 2020-02-18 17:42:18, Brian Kubisiak wrote:
> > Hi Tyler,
> > 
> > > Can you elaborate some on the use case you have?
> > 
> > On many modern embedded SoCs, there are multiple implementations of the same
> > crypto algorithm---usually a CPU-based implementation using ISA extensions and a
> > "security engine" implementation that implements crypto primitives on dedicated
> > silicon. There are a few tradeoffs involved (performance, CPU overhead,
> > resistance to side-channels attacks, etc), so it is not always clear which
> > implementation is best.
> > 
> > An SoC that I've been working on has both the CPU implementation and the
> > security engine implementation of the cbc(aes) algorithm at the same priority,
> > so the one picked to perform the encryption for a given ecryptfs mount is
> > somewhat random.
> 
> Have you looked into the possibility of increasing the priority of the
> implementation that you prefer on your SoC?
> 
> If that's not feasible, have you considered blacklisting the module
> providing the implementation that you don't prefer?
> 
> > My intention with this patch is to be able to select which
> > implementation gets used for the mount using the
> > ecryptfs_cipher_driver option instead of having the kernel pick.
> 
> I don't think allowing users to specify a cipher driver is a good idea.
> eCryptfs has always assumed that the crypto subsystem knows best about
> the ideal implementation of "cbc(aes)" and I believe that this is how
> the crypto subsystem expects eCryptfs to make use of their API.
> 
> In addition to the design objection above, I'm worried about users
> shooting themselves in the foot with this mount option. For example,
> "ecryptfs_cipher_driver=ecb_aes_aesni" and
> "ecryptfs_cipher_driver=xts_aes_aesni" are accepted. eCryptfs is only
> implemented to operated in a (modified) CBC mode and letting users force
> their way into using anything else is dangerous/insecure.
> 
> Lets see if we can address your problem in the crypto subsystem (or with
> the module blacklist) rather than creating this amount of flexibility in
> eCryptfs.
> 
> Tyler

CRYPTO_MSG_UPDATEALG in the crypto_user configuration API can be used to change
the priority of a crypto algorithm at runtime.  It would need to be done before
mounting eCryptfs.

- Eric
