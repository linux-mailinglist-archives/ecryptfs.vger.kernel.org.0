Return-Path: <ecryptfs+bounces-569-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7055C1DD7A
	for <lists+ecryptfs@lfdr.de>; Thu, 30 Oct 2025 01:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE3CA3A755B
	for <lists+ecryptfs@lfdr.de>; Thu, 30 Oct 2025 00:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AAC2E65D;
	Thu, 30 Oct 2025 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H71N2PdQ"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC8E9476
	for <ecryptfs@vger.kernel.org>; Thu, 30 Oct 2025 00:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761782544; cv=none; b=UFngg7Z6HzrnG6uyNdnfmztiOhdFxfYuSN3e5Fk0/nv1wSsd/K3IMXmOQcam6s7CP4zRdCl/aQRmk2RGO7WhVm+hI/Eyp6cRHma4654kTtn8NxH35p9azHmncwaN7ZJjNN7wCbeZZJD9vf/OtEPStI5x2U7YIdPby2CrTpNgLRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761782544; c=relaxed/simple;
	bh=dl3hhTa425hTootTdaDXhUQrKDZMwYmQwx3qP5IX8Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKt4nnZqGfOu4F91tGaKwHm/BhtACex1extCWUcZRUO+ar2O/y9azju7PmA576MM6gU5qfJgXvLngvhvafXiQmpvh2S5W8Zz6GBVru2ppl/3TvFWlyiPuAuCTIw9hyqtCBcpB4G7wyO5ihf7oxNDQ4acDm3kvAD7Hu/qDKDt1Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H71N2PdQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74F1C2BCAF
	for <ecryptfs@vger.kernel.org>; Thu, 30 Oct 2025 00:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761782543;
	bh=dl3hhTa425hTootTdaDXhUQrKDZMwYmQwx3qP5IX8Pc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H71N2PdQxzG6ziTeqp6xGEArkRJ3O5THDzWIrzSasxUkGLM+lUZS7+NPkBZXcwqg2
	 9C6ap5rIfVEC9DPaLBtJo0kZ5ofahpVQxx0L+S5FFDodcAmlLFovwUGLsqoIj+Sbfb
	 KpbTx4VAd5NnJ1O8rTiQn6TBkSlRu/j4sleywAFybv9rXoxTRHqn9c3QU8C/I1fVue
	 r6vmdMwEFagraLeCOq8Y5w6QYS8PC6/Od5A7Y1QFEd7AtMMaHPet6V3ATCZFYaPO9a
	 pZWWgj7WwkxWA5i5dsCthqdk6r+uTnlKEXlbTHNFJ4YrKlY0hfFMtO+mNYgRssD5aH
	 BGDInk7GCLkVA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d6c11f39aso75332666b.2
        for <ecryptfs@vger.kernel.org>; Wed, 29 Oct 2025 17:02:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFrjUpHCDdQPeNtZrncIa29PCyp5hoIGYK8CwizAkX+d1jDe8xf5vtfeGg9YmGwKwIb5dOrq+MuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfBez9tFQPQoEE+F3PImq8+SCwWz2PPteqWZIA8KLxIqZ98xxn
	MDMyFNbiip/Y5ti+VsOT9BhnoQyJhduaCF3QM7UkUbyoONS0z2EUlEnZTo2zNJ4QEowFkY/gXIU
	ZpqN598QAbizh1S/BvRAQbf1qkyvjpSc=
X-Google-Smtp-Source: AGHT+IFp6XmtNYQvDgzIxt6N/UJfVu4TmDjNTFEnDMi0BPOBbAiMhgT+FO6/cnvMt+r32HZOllHtr/4V9Y8hAvFbtRA=
X-Received: by 2002:a17:907:3cc4:b0:b45:eea7:e97c with SMTP id
 a640c23a62f3a-b703d5569b8mr475849266b.47.1761782541878; Wed, 29 Oct 2025
 17:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029234353.1321957-1-neilb@ownmail.net> <20251029234353.1321957-11-neilb@ownmail.net>
In-Reply-To: <20251029234353.1321957-11-neilb@ownmail.net>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 30 Oct 2025 09:02:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8QGx=GWNCw8n3Pfp-4VDOY6OTtnHvGjcvAAHESH-eLyA@mail.gmail.com>
X-Gm-Features: AWmQ_bl65wcvcAo59bCN4Dy6QbeOgouXiHvgTquU1892ABOO7FZA8E3Xbxk2z5k
Message-ID: <CAKYAXd8QGx=GWNCw8n3Pfp-4VDOY6OTtnHvGjcvAAHESH-eLyA@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] VFS/ovl/smb: introduce start_renaming_dentry()
To: NeilBrown <neil@brown.name>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Jeff Layton <jlayton@kernel.org>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	David Howells <dhowells@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Tyler Hicks <code@tyhicks.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Chuck Lever <chuck.lever@oracle.com>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
	Steve French <smfrench@gmail.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Carlos Maiolino <cem@kernel.org>, John Johansen <john.johansen@canonical.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Mateusz Guzik <mjguzik@gmail.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Stefan Berger <stefanb@linux.ibm.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org, netfs@lists.linux.dev, 
	ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 8:46=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> From: NeilBrown <neil@brown.name>
>
> Several callers perform a rename on a dentry they already have, and only
> require lookup for the target name.  This includes smb/server and a few
> different places in overlayfs.
>
> start_renaming_dentry() performs the required lookup and takes the
> required lock using lock_rename_child()
>
> It is used in three places in overlayfs and in ksmbd_vfs_rename().
>
> In the ksmbd case, the parent of the source is not important - the
> source must be renamed from wherever it is.  So start_renaming_dentry()
> allows rd->old_parent to be NULL and only checks it if it is non-NULL.
> On success rd->old_parent will be the parent of old_dentry with an extra
> reference taken.  Other start_renaming function also now take the extra
> reference and end_renaming() now drops this reference as well.
>
> ovl_lookup_temp(), ovl_parent_lock(), and ovl_parent_unlock() are
> all removed as they are no longer needed.
>
> OVL_TEMPNAME_SIZE and ovl_tempname() are now declared in overlayfs.h so
> that ovl_check_rename_whiteout() can access them.
>
> ovl_copy_up_workdir() now always cleans up on error.
>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: NeilBrown <neil@brown.name>
For ksmbd part,
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!

