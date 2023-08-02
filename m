Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FACE76C76E
	for <lists+ecryptfs@lfdr.de>; Wed,  2 Aug 2023 09:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbjHBHvQ (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 2 Aug 2023 03:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbjHBHur (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 2 Aug 2023 03:50:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7B65590
        for <ecryptfs@vger.kernel.org>; Wed,  2 Aug 2023 00:48:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 23C6561857
        for <ecryptfs@vger.kernel.org>; Wed,  2 Aug 2023 07:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306FAC433C9;
        Wed,  2 Aug 2023 07:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690962496;
        bh=Q9OJytY9AO4nDarKNN8XUtcIRmwvmy2+Oa/Vd5qmuns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TIZND29GuDM4qiV2m5mQ7jRaDct4udyz+fGcrLaphHRyaGjVJw07TGgoMbsguYBr3
         WogupXvO3hfYEAvWwLfmWevN0dL3YSqzhQcuU7r8nG+5/K7R7Rjjpz74hfguqbswcd
         e8UgpLMJwMIiU5Jr8gZX679pHtSthDzeJhk/kex1fCeWq+WfV/u0Vvcb7+2e2Qbw9+
         M5lQ06RSUt5+CqvPMYWQxNTOpQBh6abqVXF4O7Ns14PKrz/V9hfgepMngz1MO0EbCD
         pBINDWLZx+RSGfFYMw6g47lO07KhSsYYx6eRcHSkbLL8XbVvoaAY9obvapdS8FKlyU
         Zkml6EDh43z8w==
Date:   Wed, 2 Aug 2023 09:48:12 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     code@tyhicks.com, fmdefrancesco@gmail.com, dchinner@redhat.com,
        ecryptfs@vger.kernel.org
Subject: Re: [PATCH -next] fs/ecryptfs: remove kernel-doc warnings
Message-ID: <20230802-marmorieren-prolog-bb616bb6264d@brauner>
References: <20230731112533.214216-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230731112533.214216-1-wangzhu9@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On Mon, Jul 31, 2023 at 07:25:33PM +0800, Zhu Wang wrote:
> Remove kernel-doc warnings:
> 
> fs/ecryptfs/mmap.c:270: warning: Excess function parameter 'flags'
> description in 'ecryptfs_write_begin'
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---

I grabbed this. No automated message bc ecryptfs isn't on lore.
