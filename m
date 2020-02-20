Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB80166680
	for <lists+ecryptfs@lfdr.de>; Thu, 20 Feb 2020 19:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgBTSo5 (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Thu, 20 Feb 2020 13:44:57 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40611 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgBTSo5 (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Thu, 20 Feb 2020 13:44:57 -0500
Received: by mail-pl1-f194.google.com with SMTP id y1so1892247plp.7
        for <ecryptfs@vger.kernel.org>; Thu, 20 Feb 2020 10:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3fOPOVH9PlCglpL8AVR/qrug3aHbkpIJtqKTuQGPYIY=;
        b=CRuw21ttMHXvD7q4vafMppKh8H0DNR5GLhEq04dphbr8YsAcki+VFl5ySwIkC8tuen
         Bjlnw5bgNYD+H5ww4wJ3qItfWjrouPVAWmQxbyExDvL/eH2mWAyEpNQ1xz924B+PveRo
         mz9DZbye7loI5GfuiU4jeDyeiu60ZjmtIVrk6kZgYSBD8azRTJq7GNtQeGvbhI4hrxkb
         MQABZ6eIMsE4uZux54yP3VFGy95oUrYNdUQNPq/pHbKg/NGTZK29hWXyBEaZOLiYywiD
         GsRyu5BS/J0RECUt7SNbHGatk+/Qq3u7QQUGStLETUNQm97YopTj7nk5ApDYYpCTA1/h
         qftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3fOPOVH9PlCglpL8AVR/qrug3aHbkpIJtqKTuQGPYIY=;
        b=AlbvfOgfnnsdcm2kwdZMaGwOmod8WFICPR87SSD0csLC2RDk3x1Z/lNmqd4jv14gv1
         z6A79HabPUki1L+DYpuUMD7MZwMN2ngXEXELfEHn2AnbMfrGD3czC8MOVPmlv4QCDUmI
         rNtkkxr4+f98Hp71dHf8zujC4jzgEWYsKZkC+7J6iVhNnrnzY4phl9zMJjh403zvEDPP
         qfizEJOT6FRJj4X3cAPWeL6RnBr1w+XDm048RfHnhlP5UXMuAGflN5ZDbQZ1O8MZY4IJ
         rjm2iz2DGJFPHXcjdC8XtLO8smcAxxQwaQ4NNj9uM4YRzA+bDyR0nBFIOYbMAg7RsF5X
         rb8Q==
X-Gm-Message-State: APjAAAXv4kxxUNVbT1C+JrKOtkIcjCxQlmRAvoesMZ4wOMznOnpqGmCg
        dnL4eii720CzQ/iA85GwO+UpqjZs
X-Google-Smtp-Source: APXvYqy9Lt4Om4TQNPtpvoq1RXykngB/EYw9FkWaIqF+d7AlBxLkoWUnoWjWrnKECzYFL5+5GSvj5g==
X-Received: by 2002:a17:90a:fd85:: with SMTP id cx5mr5175945pjb.80.1582224296499;
        Thu, 20 Feb 2020 10:44:56 -0800 (PST)
Received: from brian-desktop ([50.236.240.214])
        by smtp.gmail.com with ESMTPSA id x21sm310598pfq.76.2020.02.20.10.44.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Feb 2020 10:44:55 -0800 (PST)
Date:   Thu, 20 Feb 2020 10:44:53 -0800
From:   Brian Kubisiak <brian.kubisiak@gmail.com>
To:     Tyler Hicks <code@tyhicks.com>
Cc:     ecryptfs@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: add mount option for specifying cipher driver.
Message-ID: <20200220184453.GA15849@brian-desktop>
References: <20200210153907.GA348@brian-desktop>
 <20200216010731.GA260140@elm>
 <20200219014218.GA17588@neutron>
 <20200219163050.GA354535@elm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219163050.GA354535@elm>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

> Have you looked into the possibility of increasing the priority of the
> implementation that you prefer on your SoC?

Yes, this should definitely be done, but I don't think it solves
the underlying issue. There are tradeoffs involved between the
security engine and the CPU implementation, and determining which
is "best" is dependent on what it is being used for. So I could
set the priority based on what I want for eCryptfs, but this also
affects every other consumer of the crypto API.

> I don't think allowing users to specify a cipher driver is a good idea.
> eCryptfs has always assumed that the crypto subsystem knows best about
> the ideal implementation of "cbc(aes)" and I believe that this is how
> the crypto subsystem expects eCryptfs to make use of their API.

I don't think this is true though. The crypto subsystem aims to
provide a sane default (ie whichever is the higher priority), but
allows overriding this choice if it would pick incorrectly. Since
it is making the choice with incomplete information (the crypto
subsystem can't know what you are using it for, so it doesn't
know which implementation is best), it makes sense that it could
be overridden from userspace. For example, the AF_ALG interface
to the crypto subsystem passes 'salg_name' directly from
userspace to allow this if needed.

I'd like to have this same flexibility in eCryptfs so I can
change which crypto implementation is used without affecting
other parts of the system.

> In addition to the design objection above, I'm worried about users
> shooting themselves in the foot with this mount option. For example,
> "ecryptfs_cipher_driver=ecb_aes_aesni" and
> "ecryptfs_cipher_driver=xts_aes_aesni" are accepted. eCryptfs is only
> implemented to operated in a (modified) CBC mode and letting users force
> their way into using anything else is dangerous/insecure.

I should probably also be checking that the requested driver
provides the correct algorithm, but haven't looked too closely
into that.

Brian
