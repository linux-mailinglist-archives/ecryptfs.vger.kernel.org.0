Return-Path: <ecryptfs+bounces-1160-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3z2TCHK5tmmVGgEAu9opvQ
	(envelope-from <ecryptfs+bounces-1160-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Sun, 15 Mar 2026 14:51:46 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FA9290CC7
	for <lists+ecryptfs@lfdr.de>; Sun, 15 Mar 2026 14:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 943F230054FB
	for <lists+ecryptfs@lfdr.de>; Sun, 15 Mar 2026 13:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856C035FF6E;
	Sun, 15 Mar 2026 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niOi+68t"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46FF33A9CB
	for <ecryptfs@vger.kernel.org>; Sun, 15 Mar 2026 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773582703; cv=pass; b=rADLYzoysUf5DJSquo09OWv+uzjl72n+6sR8dLflzivKjufdF/28vQcm8M9gPPe1mCqwrLExWLU/WHzAD2xYn9CmgFuZ//X/Kr4Kj/KI8/MYQyctL21oA/+7bAlMFWF59PpbOOaXabIYwEMJ7WCU/+Z2v76L6fgAjfljQQAqEok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773582703; c=relaxed/simple;
	bh=Vs01mlsWygXmaXPS3h5z1k3Hf3KZR9yElATURfIfNww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDaaqF19suhNrprom3Q5zmFWI/n8dTWxjqIzX2rv/fwx0b7+xAAsWBhmdYYTBOrmsbCW1X5EprkHag33QSz7hlHMh3zdLBzuJMeEc5ePyIGAgjyN2MXMbwalByvJNiQHhM8kZewo5keqM0tPxLx2O0LHogCEouPa6XoOMXkZ+KI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niOi+68t; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b97bca3797dso6689566b.0
        for <ecryptfs@vger.kernel.org>; Sun, 15 Mar 2026 06:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773582700; cv=none;
        d=google.com; s=arc-20240605;
        b=J7zn0Pz9k2HHm0sXrcSrZ4kn78FeK3YRoE/gIsrcsXsMZLqHgQqkeuRc2txq9DYkQG
         +BFvlnoBbZjqinF2+FhMjohGPSF1NLVEL2SIqck83JsJFrNnXXby1f4jeiOwyzqWlIqP
         Y54hmOgoOILG8723ehfrsqMN57ZvcgG/cqnEAzPnBPoI1H3pw2hDSL2T29Dss0VeULj9
         fRTKhcQq/MzWUlgj0KuNYt+CMKMz++1VswsVI9PdIj8m9MC9mGcloOk+5bu/7uiaHzoS
         qgcRKLswgVJKvoro5fhAZZdFo0l0Ho5vynb2v9iZmTveINyRzW8S8i18YZPGrsjTBVA8
         GEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LD1Y/Z+QIVaxjTqqF6DEde0TPCIZAs/xYcpmNl5+JUA=;
        fh=ZjBe3cYmjM2Qq5niLyCtw7Jo8cMAG9m0lAqe7gxgVj8=;
        b=O/58raHQZjPpcbZeJH7v8NOkR1+lFmygThWrXbd+NTgACZl1YQ37X4ZUkAFQvx3hZn
         a/4wkhWT0r+N8Cc1y35YpfjKPMijQRY4kwBX/QxxW6teULvOXD3Y4UEaOlCyp0jMM/Dl
         +Piknc5eHLJZgObOMHuOp912lT8KbQbKu/vbNEEXfGXThxiwgKMrZWTGSXmPOmAE1rJ2
         fSgf4dCFQnjJeloEHnAsjWdHIBba/cvroPy4/4ixyC4TlK8jzverI3bA/QJEY1DO2CvV
         s6NqidPugQhclW0g6JKiQcjM3FXVwGLPhb7yz0BezEd34T76o+pUcTwSEKbWJSYXkaqP
         LHTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773582700; x=1774187500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LD1Y/Z+QIVaxjTqqF6DEde0TPCIZAs/xYcpmNl5+JUA=;
        b=niOi+68t+4ftQYvaTzVsRIkap5gRXpAugLlwQHpWZCH0WvCYllQe1U7gpK6TQ746LN
         sNb6+5qFVJvATOEcP8S1YSgpJuP99izxvfE9uv+ymv5s8v7mpmYBgjxzgmmrMIO20ol5
         XRphCrEl9BexTpEgwv+wQSN4mImqSAHd9JsJo3w0NsYQAB6tOh/4qcvYp8Jff3IdmD2I
         4tSEzLy6dzy72soZcqjVHMHgUtghx14Tou/mIE3WQ2HWt4arTCyksDfNfZAyf2iOSfXz
         lwavfOdGwvHNzVdTXiKTbMW4WZkF9yE9MfkZ1gT2J9g25fenbgVIVPyGiFfk/1mzFyNE
         UBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773582700; x=1774187500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LD1Y/Z+QIVaxjTqqF6DEde0TPCIZAs/xYcpmNl5+JUA=;
        b=lnXnpxiqIiv2zF7Fq53to64FO8AmF3t8wuA3blJcrXBfvlW7Bo+/AUJ8SDZ6W4bAx1
         cKYayavTVBCFtd7W9i22nngqAhD/9ALgEdpt3zXFAuQ7aAKM4A+xKXqxuqj2SftbW9Oy
         YKg4wvgdudrdv4m6kAnCig+SWQKbsIhT30S31F0GUe5fI+VX67kXDG171/viDmkSMYhT
         c7FnX38OS/sTQ7Zg3C7Nwo+0UXE238tBi3i7bcKgtbkYEdxrMCswREdgouAsg7FwKrO2
         czKK0GPijVQdom5007x4ctRSin89nENA4zStqISm0HUtmayRuk0q6hXiizDAPAwcQEay
         qZcw==
X-Forwarded-Encrypted: i=1; AJvYcCVw84VKede6W0pRosahz/I/cbPiQ2fbP6kfEuoGVDxUHc2eBKaPIwlNO8fu7jc82WAf/XOzLHCMxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkJgjQrKOvnv5SywVFSuqmoD7tMW7BQX17K2J0mJEUnvlQQm32
	3vaYxAfUPHf9O4UlLBbYMEIwcI9vX/gCryRvjFqN0PFF4NmRMbkKSCkAXx7dSQRchjzBkhtmlDA
	vAdXl9XasGNz5U31j0+KxHyzFRNS7vBw=
X-Gm-Gg: ATEYQzyjT1BbgvHKBbHa17A8UFFqFDLQHrHBbYRtSyByMOc5YcmUMoPoevNan10YjnX
	IJTQnk3f+Vv+bvav9B6GkSaR7ylRZ9TGefHqLUtQ93JYpH4/dOB0mmafM04dFEL3dHoGje2WJ3T
	JABg6k6BP3zXu1T29rpcM2YIuJiuHMrgvqc+UgFR6YZ14ySNEQRbddLhpj2Bsm3CsddDozVTge3
	hlcS2qJMvcEbuidTGUs7HCRDY47dWc7zBGP8uZaX8Od2uw6eP51UJE+iWZiPLA10wfSLSdkWahw
	iAXTt5y+oDLhdaiWgvSkqQwtXCQzlBa89RGA9Y61aw==
X-Received: by 2002:a17:907:8dcd:b0:b93:c5a9:a5e6 with SMTP id
 a640c23a62f3a-b976507af92mr500109966b.2.1773582699724; Sun, 15 Mar 2026
 06:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312214330.3885211-1-neilb@ownmail.net> <20260312214330.3885211-17-neilb@ownmail.net>
In-Reply-To: <20260312214330.3885211-17-neilb@ownmail.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Mar 2026 14:51:27 +0100
X-Gm-Features: AaiRm50yYPhN2uA9nBAPVNuAVUOhGIEBVS5rPtx5ZlpdDP1j4SB9NhEOC_7KNWo
Message-ID: <CAOQ4uxjmcNxsCmDSVgkTns=3BAuQcT3pVvsQzza+u3iqXqrz5g@mail.gmail.com>
Subject: Re: [PATCH 16/53] ovl: drop dir lock for lookups in impure readdir
To: NeilBrown <neil@brown.name>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Carlos Maiolino <cem@kernel.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Jan Harkes <jaharkes@cs.cmu.edu>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Steve French <sfrench@samba.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Yuezhang Mo <yuezhang.mo@sony.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Breno Leitao <leitao@debian.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, 
	Alex Markuze <amarkuze@redhat.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Tyler Hicks <code@tyhicks.com>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeremy Kerr <jk@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, coda@cs.cmu.edu, linux-mm@kvack.org, 
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, ceph-devel@vger.kernel.org, 
	ecryptfs@vger.kernel.org, gfs2@lists.linux.dev, linux-um@lists.infradead.org, 
	linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1160-lists,ecryptfs=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,zeniv.linux.org.uk,kernel.org,suse.cz,szeredi.hu,cs.cmu.edu,google.com,linux.alibaba.com,redhat.com,auristor.com,samba.org,samsung.com,sony.com,debian.org,mit.edu,dilger.ca,goodmis.org,gmail.com,dubeyko.com,tyhicks.com,nod.at,cambridgegreys.com,sipsolutions.net,ozlabs.org,vger.kernel.org,kvack.org,lists.infradead.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amir73il@gmail.com,ecryptfs@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[ecryptfs];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:email,ownmail.net:email]
X-Rspamd-Queue-Id: A2FA9290CC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 10:49=E2=80=AFPM NeilBrown <neilb@ownmail.net> wrot=
e:
>
> From: NeilBrown <neil@brown.name>
>
> When performing an "impure" readdir, ovl needs to perform a lookup on som=
e
> of the names that it found.
> With proposed locking changes it will not be possible to perform this
> lookup (in particular, not safe to wait for d_alloc_parallel()) while
> holding a lock on the directory.
>
> ovl doesn't really need the lock at this point.

Not exactly. see below.

> It has already iterated
> the directory and has cached a list of the contents.  It now needs to
> gather extra information about some contents.  It can do this without
> the lock.
>
> After gathering that info it needs to retake the lock for API
> correctness.  After doing this it must check IS_DEADDIR() again to
> ensure readdir always returns -ENOENT on a removed directory.
>
> Note that while ->iterate_shared is called with a shared lock, ovl uses
> WRAP_DIR_ITER() so an exclusive lock is held and so we drop and retake
> that exclusive lock.
>
> As the directory is no longer locked in ovl_cache_update() we need
> dget_parent() to get a reference to the parent.
>
> Signed-off-by: NeilBrown <neil@brown.name>
> ---
>  fs/overlayfs/readdir.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
> index 1dcc75b3a90f..d5123b37921c 100644
> --- a/fs/overlayfs/readdir.c
> +++ b/fs/overlayfs/readdir.c
> @@ -568,13 +568,12 @@ static int ovl_cache_update(const struct path *path=
, struct ovl_cache_entry *p,
>                         goto get;
>                 }
>                 if (p->len =3D=3D 2) {
> -                       /* we shall not be moved */
> -                       this =3D dget(dir->d_parent);
> +                       this =3D dget_parent(dir);
>                         goto get;
>                 }
>         }
>         /* This checks also for xwhiteouts */
> -       this =3D lookup_one(mnt_idmap(path->mnt), &QSTR_LEN(p->name, p->l=
en), dir);
> +       this =3D lookup_one_unlocked(mnt_idmap(path->mnt), &QSTR_LEN(p->n=
ame, p->len), dir);

ovl_cache_update() is also called from ovl_iterate_merged() where inode
is locked.

>         if (IS_ERR_OR_NULL(this) || !this->d_inode) {
>                 /* Mark a stale entry */
>                 p->is_whiteout =3D true;
> @@ -666,11 +665,12 @@ static int ovl_dir_read_impure(const struct path *p=
ath,  struct list_head *list,
>         if (err)
>                 return err;
>
> +       inode_unlock(path->dentry->d_inode);
>         list_for_each_entry_safe(p, n, list, l_node) {
>                 if (!name_is_dot_dotdot(p->name, p->len)) {
>                         err =3D ovl_cache_update(path, p, true);
>                         if (err)
> -                               return err;
> +                               break;
>                 }
>                 if (p->ino =3D=3D p->real_ino) {
>                         list_del(&p->l_node);
> @@ -680,14 +680,19 @@ static int ovl_dir_read_impure(const struct path *p=
ath,  struct list_head *list,
>                         struct rb_node *parent =3D NULL;
>
>                         if (WARN_ON(ovl_cache_entry_find_link(p->name, p-=
>len,
> -                                                             &newp, &par=
ent)))
> -                               return -EIO;
> +                                                             &newp, &par=
ent))) {
> +                               err =3D -EIO;
> +                               break;
> +                       }
>
>                         rb_link_node(&p->node, parent, newp);
>                         rb_insert_color(&p->node, root);
>                 }
>         }
> -       return 0;
> +       inode_lock(path->dentry->d_inode);
> +       if (IS_DEADDIR(path->dentry->d_inode))
> +               err =3D -ENOENT;
> +       return err;
>  }
>
>  static struct ovl_dir_cache *ovl_cache_get_impure(const struct path *pat=
h)
> --

You missed the fact that overlayfs uses the dir inode lock
to protect the readdir inode cache, so your patch introduces
a risk for storing a stale readdir cache when dir modify operations
invalidate the readdir cache version while lock is dropped
and also introduces memory leak when cache is stomped
without freeing cache created by a competing thread.
I think something like the untested patch below should fix this.

I did not look into ovl_iterate_merged() to see if it has a simple
fix and I am not 100% sure that this fix for impure dir is enough.

Thanks,
Amir.

diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
index d5123b37921c8..9e90064b252ce 100644
--- a/fs/overlayfs/readdir.c
+++ b/fs/overlayfs/readdir.c
@@ -702,15 +702,13 @@ static struct ovl_dir_cache
*ovl_cache_get_impure(const struct path *path)
        struct inode *inode =3D d_inode(dentry);
        struct ovl_fs *ofs =3D OVL_FS(dentry->d_sb);
        struct ovl_dir_cache *cache;
+       /* Snapshot version before ovl_dir_read_impure() drops i_rwsem */
+       u64 version =3D ovl_inode_version_get(inode);

        cache =3D ovl_dir_cache(inode);
-       if (cache && ovl_inode_version_get(inode) =3D=3D cache->version)
+       if (cache && version =3D=3D cache->version)
                return cache;

-       /* Impure cache is not refcounted, free it here */
-       ovl_dir_cache_free(inode);
-       ovl_set_dir_cache(inode, NULL);
-
        cache =3D kzalloc_obj(struct ovl_dir_cache);
        if (!cache)
                return ERR_PTR(-ENOMEM);
@@ -721,6 +719,14 @@ static struct ovl_dir_cache
*ovl_cache_get_impure(const struct path *path)
                kfree(cache);
                return ERR_PTR(res);
        }
+
+       /*
+        * Impure cache is not refcounted, free it here.
+        * Also frees cache stored by concurrent readdir during i_rwsem dro=
p.
+        */
+       ovl_dir_cache_free(inode);
+       ovl_set_dir_cache(inode, NULL);
+
        if (list_empty(&cache->entries)) {
                /*
                 * A good opportunity to get rid of an unneeded "impure" fl=
ag.
@@ -736,7 +742,7 @@ static struct ovl_dir_cache
*ovl_cache_get_impure(const struct path *path)
                return NULL;
        }

-       cache->version =3D ovl_inode_version_get(inode);
+       cache->version =3D version;
        ovl_set_dir_cache(inode, cache);

        return cache;

