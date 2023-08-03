Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB8C76E0D5
	for <lists+ecryptfs@lfdr.de>; Thu,  3 Aug 2023 09:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbjHCHGn (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Thu, 3 Aug 2023 03:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjHCHGS (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Thu, 3 Aug 2023 03:06:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CDC1716;
        Thu,  3 Aug 2023 00:06:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9328061C1D;
        Thu,  3 Aug 2023 07:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8B8C433C7;
        Thu,  3 Aug 2023 07:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691046373;
        bh=q5HEh93m22+IZ7gJ0ht4CIPca9ZIugEYnaPvq20Gjuc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K7UhWAmHViQApxb4uEFZrC7NgM4L98YWGA8RqmJSuKws6QfloHZYz2gu1jyPObkgz
         rJxDzSRQnw1K4pXJOSbYSQwEHQGHEgpocuMnPLyGqXwysQNLhUfpr9nXqz/I7vEWHU
         Xyq0E7GBSXm+tlg7gDzjWZJiiMF3px3+dfpcHG121egWkUzTPQBnCY0uSqoCY/0Kr0
         ZBpFxVuNI9TULQg5bdi3e7SZRLX5rY79l7KLMQCUVHdnr6WpsAje202RHEqOcZVFgo
         7miM6YWTEiuxqRbsDMbuOSLOG9Nu93OzU+EfWoCfeFibJ4Z6IjLTxS3vlPbG54qPVW
         uZsk7io+itqAw==
Date:   Thu, 3 Aug 2023 09:05:55 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Jeff Layton <jlayton@kernel.org>
Cc:     "Darrick J. Wong" <djwong@kernel.org>,
        Eric Van Hensbergen <ericvh@kernel.org>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Christian Schoenebeck <linux_oss@crudebyte.com>,
        David Howells <dhowells@redhat.com>,
        Marc Dionne <marc.dionne@auristor.com>,
        Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
        David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
        Ilya Dryomov <idryomov@gmail.com>,
        Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
        Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>,
        Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,
        Jeffle Xu <jefflexu@linux.alibaba.com>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Bob Peterson <rpeterso@redhat.com>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejun Heo <tj@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Mark Fasheh <mark@fasheh.com>,
        Joel Becker <jlbec@evilplan.org>,
        Joseph Qi <joseph.qi@linux.alibaba.com>,
        Mike Marshall <hubcap@omnibond.com>,
        Martin Brandenburg <martin@omnibond.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Steve French <sfrench@samba.org>,
        Paulo Alcantara <pc@manguebit.com>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Shyam Prasad N <sprasad@microsoft.com>,
        Tom Talpey <tom@talpey.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Richard Weinberger <richard@nod.at>,
        Hans de Goede <hdegoede@redhat.com>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Chinner <david@fromorbit.com>,
        Anthony Iliopoulos <ailiop@suse.com>, v9fs@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
        linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
        codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
        linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
        linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
        ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev,
        devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
        samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
        linux-mm@kvack.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v6 5/7] xfs: switch to multigrain timestamps
Message-ID: <20230803-mulmig-rennen-adbe9b2a6608@brauner>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-5-a794c2b7abca@kernel.org>
 <20230802174853.GC11352@frogsfrogsfrogs>
 <16f46a9e6d88582d53d31a320589a7ba9d232e0c.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16f46a9e6d88582d53d31a320589a7ba9d232e0c.camel@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On Wed, Aug 02, 2023 at 02:21:49PM -0400, Jeff Layton wrote:
> On Wed, 2023-08-02 at 10:48 -0700, Darrick J. Wong wrote:
> > On Tue, Jul 25, 2023 at 10:58:18AM -0400, Jeff Layton wrote:
> > > Enable multigrain timestamps, which should ensure that there is an
> > > apparent change to the timestamp whenever it has been written after
> > > being actively observed via getattr.
> > > 
> > > Also, anytime the mtime changes, the ctime must also change, and those
> > > are now the only two options for xfs_trans_ichgtime. Have that function
> > > unconditionally bump the ctime, and ASSERT that XFS_ICHGTIME_CHG is
> > > always set.
> > > 
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  fs/xfs/libxfs/xfs_trans_inode.c | 6 +++---
> > >  fs/xfs/xfs_iops.c               | 4 ++--
> > >  fs/xfs/xfs_super.c              | 2 +-
> > >  3 files changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
> > > index 6b2296ff248a..ad22656376d3 100644
> > > --- a/fs/xfs/libxfs/xfs_trans_inode.c
> > > +++ b/fs/xfs/libxfs/xfs_trans_inode.c
> > > @@ -62,12 +62,12 @@ xfs_trans_ichgtime(
> > >  	ASSERT(tp);
> > >  	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
> > >  
> > > -	tv = current_time(inode);
> > > +	/* If the mtime changes, then ctime must also change */
> > > +	ASSERT(flags & XFS_ICHGTIME_CHG);
> > >  
> > > +	tv = inode_set_ctime_current(inode);
> > >  	if (flags & XFS_ICHGTIME_MOD)
> > >  		inode->i_mtime = tv;
> > > -	if (flags & XFS_ICHGTIME_CHG)
> > > -		inode_set_ctime_to_ts(inode, tv);
> > >  	if (flags & XFS_ICHGTIME_CREATE)
> > >  		ip->i_crtime = tv;
> > >  }
> > > diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> > > index 3a9363953ef2..3f89ef5a2820 100644
> > > --- a/fs/xfs/xfs_iops.c
> > > +++ b/fs/xfs/xfs_iops.c
> > > @@ -573,10 +573,10 @@ xfs_vn_getattr(
> > >  	stat->gid = vfsgid_into_kgid(vfsgid);
> > >  	stat->ino = ip->i_ino;
> > >  	stat->atime = inode->i_atime;
> > > -	stat->mtime = inode->i_mtime;
> > > -	stat->ctime = inode_get_ctime(inode);
> > >  	stat->blocks = XFS_FSB_TO_BB(mp, ip->i_nblocks + ip->i_delayed_blks);
> > >  
> > > +	fill_mg_cmtime(request_mask, inode, stat);
> > 
> > Huh.  I would've thought @stat would come first since that's what we're
> > acting upon, but ... eh. :)
> > 
> > If everyone else is ok with the fill_mg_cmtime signature,
> > Acked-by: Darrick J. Wong <djwong@kernel.org>
> > 
> > 
> 
> Good point. We can change the signature. I think xfs is the only caller
> outside of the generic vfs right now, and it'd be best to do it now.
> 
> Christian, would you prefer that I send an updated series, or patches on
> top of vfs.ctime that can be folded in?

Let's fold instead of inundate everyone with almost 100 patches.
When I'll apply I'll remind everyone where the series can be pulled
from anyway.
