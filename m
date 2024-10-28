Return-Path: <ecryptfs+bounces-210-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6219B343D
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 16:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E8F8282407
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 15:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDBF1DE2C4;
	Mon, 28 Oct 2024 15:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mFiuI9ut"
X-Original-To: ecryptfs@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6C41DE3B6;
	Mon, 28 Oct 2024 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730127744; cv=none; b=VAhn6JDaDnk85ePV6xu5YM1P2OSbdKUeC1FIO/ijjZX1cEsuycQDKkQaXLIeE5ri60sgljQa59b5dyRXd4W/pIIUqrZ/aHmtE9ckQhCxAtKkLItDWcuBIEo3DvHUVVUPtc3hwayVX1ksoKiLEl6677f4cFExwE+ioQCVdv9k7Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730127744; c=relaxed/simple;
	bh=wEs6Tj4HvRfDrMlYyr9U4bt+nkXDlWQSDJvQVUKZxQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YA8+AwXZ0Fmk4KtjUEJz+0+SkiVXBiO6s4+3qZ9UZbz++/J42KYh7ACwqzGUnJZe5gteWVxsWL1y2fJBbggtDjcPb4vSYG9l5aajzZk23alNR6K1hMaiIkZVfk55fuLnv6jtYdW5Y3RALGhajhz+XEMZ+KTRIxu8zgS1vSfswJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mFiuI9ut; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1wtvGlorm/kJsXU7/DxTg9GQwv6sj5mLpwi3M8203/E=; b=mFiuI9utjEnuc+loPqV/IeTuz0
	iDekyZ0CpV3ZMAOlUhTy//YrBfcFmp05MzsTB32nSepQUkJ3a95LTVyetgm4wQKBhbO9zFk5oOOYc
	7b81LKISaVbQ+9Et+zjPWtMryNLuf/I2i/ajbuvGwH0WiOF91Uo8f0KJKN/0MN/jqUr3KuTdmvDCH
	saa4Qs3VoCTVV5vS2dfpMQnVKA61+KgiVF8Q9UxUaQ3j+H5ygI2LiWhcI0Ahmfs5Isd4wv9H0sl9h
	/EBOpaU7DZyH2J+rWs2rRObDC2m+WaFhkBeLvbjcwUHn1yQtbjSsRRK2BKvwvvsLwK0NhQJGUHboq
	htt6bF+Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RG0-00000008dgs-35lT;
	Mon, 28 Oct 2024 15:02:12 +0000
Date: Mon, 28 Oct 2024 15:02:12 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Tyler Hicks <code@tyhicks.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Arnd Bergmann <arnd@arndb.de>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: ecryptfs is unmaintained and untested
Message-ID: <Zx-ndBo7wpYSHWPK@casper.infradead.org>
References: <20241028141955.639633-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028141955.639633-1-arnd@kernel.org>

On Mon, Oct 28, 2024 at 02:18:45PM +0000, Arnd Bergmann wrote:
> The ecryptfs file system uses functions from fs/buffer.c that
> are only available when CONFIG_BUFFER_HEAD is enabled:
> 
> ld.lld-20: error: undefined symbol: block_dirty_folio
> >>>               vmlinux.o:(ecryptfs_aops)
> ld.lld-20: error: undefined symbol: block_invalidate_folio
> >>>               vmlinux.o:(ecryptfs_aops)
> 
> When CONFIG_BLOCK is turned off completely, this is not needed,
> so add a conditional 'select BUFFER_HEAD'.

The comment says it doesn't work without CONFIG_BLOCK:

        /*
         * XXX: This is pretty broken for multiple reasons: ecryptfs does not
         * actually use buffer_heads, and ecryptfs will crash without
         * CONFIG_BLOCK.  But it matches the behavior before the default for
         * address_space_operations without the ->dirty_folio method was
         * cleaned up, so this is the best we can do without maintainer
         * feedback.

This comment has been there since June 2021, so I think we can just
delete ecryptfs now?

If we can't delete it for some reason, I think we can use
filemap_dirty_folio() and remove the setting of invalidate_folio()
as block_invalidate_folio() is a no-op if there are no folio_buffers.
ie this in lieu of your patch:

+++ b/fs/ecryptfs/mmap.c
@@ -514,17 +514,9 @@ static sector_t ecryptfs_bmap(struct address_space *mapping, sector_t block)
 
 const struct address_space_operations ecryptfs_aops = {
        /*
-        * XXX: This is pretty broken for multiple reasons: ecryptfs does not
-        * actually use buffer_heads, and ecryptfs will crash without
-        * CONFIG_BLOCK.  But it matches the behavior before the default for
-        * address_space_operations without the ->dirty_folio method was
-        * cleaned up, so this is the best we can do without maintainer
-        * feedback.
+        * XXX: This entire filesystem is unmaintained and untested.
         */
-#ifdef CONFIG_BLOCK
-       .dirty_folio    = block_dirty_folio,
-       .invalidate_folio = block_invalidate_folio,
-#endif
+       .dirty_folio = filemap_dirty_folio,
        .writepages = ecryptfs_writepages,
        .read_folio = ecryptfs_read_folio,
        .write_begin = ecryptfs_write_begin,


