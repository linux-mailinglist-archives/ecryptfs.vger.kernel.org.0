Return-Path: <ecryptfs+bounces-409-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F20B4845E
	for <lists+ecryptfs@lfdr.de>; Mon,  8 Sep 2025 08:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E3D318946CC
	for <lists+ecryptfs@lfdr.de>; Mon,  8 Sep 2025 06:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FECB2BCF45;
	Mon,  8 Sep 2025 06:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n3D5bksS"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9FA29D28B
	for <ecryptfs@vger.kernel.org>; Mon,  8 Sep 2025 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757313922; cv=none; b=dPuQ1XYs/+mcf3+QCtY8YMuohdFhvYtfomojvEiVY5jMjTJQhfITPSX02tPtxCSwpf3zehJ55TJJaEUeHaByLrnR+E1LScqrR6juuyPZnPCkpAvMnvtrUz+uvoDDDUTQyookuxLiEhQm8poDS6wiyQKeV7hqJWgVrgZVLcdHa9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757313922; c=relaxed/simple;
	bh=Zu4Bt+6r8dUPKPJh4jSJ/p3cfef69N5L+xF1uHo1ThY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DqczZn9Nl4wXF9z3nwLyMxIurLjKlS23Maaufhw7xR0IFxrnFM3h+Zq4T8u1e9EmR6h08Eu+sKGmztug/zV58PNYUZKF1fkWN0DTu5GHN1E3HJvpMfQKz2IrW2eAp024AaQTiyzpGsjz5GPb9+TWiNAH/XagqMlJ6KRq2aOuZ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n3D5bksS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3dae49b117bso3437223f8f.1
        for <ecryptfs@vger.kernel.org>; Sun, 07 Sep 2025 23:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757313915; x=1757918715; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y43/jDltjQeEiNJhrDFe+JWCDpnle6nTMlZr+nJ6AVE=;
        b=n3D5bksSiVir2KE86c57YoFguu7vjRfx9IJmgSXYKbjFQnLK97TN3Ds8heJH/gPzQV
         or7EAmH/1nC015G84Xz8HFwdaRM6mxMKp1SOnkdNb2zxYsxdu4ywAqcZFQT29jmebxHU
         Zc6Si/BF1Cc7DwwHRWzDrzXvVqttaGIlPvRYYm/nXq2FP188PovWTcyc2piHJsoxcLWX
         3fajCRt+vyB2MkH8Oj3lCmssQPS5ekoqSXqGcLKA+r0udblN0OHqrMVJ/k/WUrtqA2K8
         7nuITYTbxwkzu9asiYVLnyOUtQe/Xa18WsaF4Cg3cW82CQKYIFrrasxTVpkN6LL9fCI6
         Uzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757313915; x=1757918715;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y43/jDltjQeEiNJhrDFe+JWCDpnle6nTMlZr+nJ6AVE=;
        b=WOTzZhjOjHNnCLHVHKp4I6u4KfqUgDJtqguqm5w+cikZs3ZxWCMELnBjbwjOCUCr/A
         wrVxsdmesKJYWe85KHiT3c9Qk05zLC8lj41oCeBxg6IkW4PMiY7am0QM9GUkWjSBMaT4
         M+9Iy2XG5nfUtxPXApxArg4rypdVRQrcw6XxQGuD2bAph8RrISp2OCwAbk9koh0izam8
         8YOjxW0v+YRUt59B5psG7B+j4oqqwdKR+N2l9QoJWah8gC4iapzQPMEwNAT9bAfTczjR
         kKpycpYKtGibaIdctyDTMFMJUwiTZBNLujGVPTEjYQlzVv56+OPa9Ninw2Gt9U6tIs8n
         nFgw==
X-Gm-Message-State: AOJu0YwLyGjYgJ5dQA1Jbh2dK/xPZTd0gfBPiM8aiWEvbZHu91ejwB0B
	lbcQHXsGXq7X1HK4fKsT/Cshfr7nQOfRYs+Ilv180hVxTQQHNlX5E76K0sfCcoOmqT8=
X-Gm-Gg: ASbGncvVPvE+QnleZOaiWSYuYqlGKhUZqNn/JsUjX9xc4Ujst1Gf913phEcGCnIE0jy
	gn/He4Onbdgc/UoeVlPpfK1CpuB03gjHwmRVSEGtC36KucNxevGzXCfdtSEbOg5UT936utx25pe
	vg5NIZe6qQC81vlpponPReK8miIyzef1zme8t1dcs0PmDBSGz5ElGNRjWVo4/mUW22TEf7tKKeY
	F8V1ej/9MJu6Cz3BeZHLYODUzjsA6crnaUsdjtGotQNJ07sMpLK0WSVRGpW/nbFXdjtE5taaa1Z
	3ndIsj2r3jO3YxNmUFOHDxEakYUim6lkkid4k4OIlqdsdl0IYxslXZt02fWlamX0eMjDKXV+5w7
	+5qic5n7OtMaL/7kYO51fRPXFxftD+7CALzmH/g==
X-Google-Smtp-Source: AGHT+IEo8RGmzWAcDxBO3eCjPVWPl5//4YBK8CR+DC6H7dyrOeNCSJD+NtegUKK6Ly67BJLuishUPQ==
X-Received: by 2002:a5d:5d83:0:b0:3df:c5e3:55f4 with SMTP id ffacd0b85a97d-3e641e3ad5bmr4088873f8f.6.1757313915536;
        Sun, 07 Sep 2025 23:45:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d701622b92sm28946789f8f.58.2025.09.07.23.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 23:45:15 -0700 (PDT)
Date: Mon, 8 Sep 2025 09:45:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: ecryptfs@vger.kernel.org
Subject: [bug report] ecryptfs: get rid of pointless mount references in
 ecryptfs dentries
Message-ID: <aL57d7vS51ATFmR0@stanley.mountain>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Al Viro,

Commit 386e98ec6285 ("ecryptfs: get rid of pointless mount references
in ecryptfs dentries") from Jul 24, 2025 (linux-next), leads to the
following Smatch static checker warning:

	fs/ecryptfs/main.c:545 ecryptfs_get_tree()
	warn: pointer dereferenced without being set 'sbi'

fs/ecryptfs/main.c
    433 static int ecryptfs_get_tree(struct fs_context *fc)
    434 {
    435         struct super_block *s;
    436         struct ecryptfs_fs_context *ctx = fc->fs_private;
    437         struct ecryptfs_sb_info *sbi = fc->s_fs_info;
    438         struct ecryptfs_mount_crypt_stat *mount_crypt_stat;
    439         const char *err = "Getting sb failed";
    440         struct inode *inode;
    441         struct path path;
    442         int rc;
    443 
    444         if (!fc->source) {
    445                 rc = -EINVAL;
    446                 err = "Device name cannot be null";
    447                 goto out;
    448         }
    449 
    450         mount_crypt_stat = &sbi->mount_crypt_stat;
    451         rc = ecryptfs_validate_options(fc);
    452         if (rc) {
    453                 err = "Error validating options";
    454                 goto out;
    455         }
    456 
    457         s = sget_fc(fc, NULL, set_anon_super_fc);
    458         if (IS_ERR(s)) {
    459                 rc = PTR_ERR(s);
    460                 goto out;
    461         }
    462 
    463         rc = super_setup_bdi(s);
    464         if (rc)
    465                 goto out1;
    466 
    467         ecryptfs_set_superblock_private(s, sbi);
    468 
    469         /* ->kill_sb() will take care of sbi after that point */
    470         sbi = NULL;
                ^^^^^^^^^^^
sbi is set to NULL

    471         s->s_op = &ecryptfs_sops;
    472         s->s_xattr = ecryptfs_xattr_handlers;
    473         set_default_d_op(s, &ecryptfs_dops);
    474 
    475         err = "Reading sb failed";
    476         rc = kern_path(fc->source, LOOKUP_FOLLOW | LOOKUP_DIRECTORY, &path);
    477         if (rc) {
    478                 ecryptfs_printk(KERN_WARNING, "kern_path() failed\n");
    479                 goto out1;
    480         }
    481         if (path.dentry->d_sb->s_type == &ecryptfs_fs_type) {
    482                 rc = -EINVAL;
    483                 printk(KERN_ERR "Mount on filesystem of type "
    484                         "eCryptfs explicitly disallowed due to "
    485                         "known incompatibilities\n");
    486                 goto out_free;
    487         }
    488 
    489         if (is_idmapped_mnt(path.mnt)) {
    490                 rc = -EINVAL;
    491                 printk(KERN_ERR "Mounting on idmapped mounts currently disallowed\n");
    492                 goto out_free;
    493         }
    494 
    495         if (ctx->check_ruid &&
    496             !uid_eq(d_inode(path.dentry)->i_uid, current_uid())) {
    497                 rc = -EPERM;
    498                 printk(KERN_ERR "Mount of device (uid: %d) not owned by "
    499                        "requested user (uid: %d)\n",
    500                         i_uid_read(d_inode(path.dentry)),
    501                         from_kuid(&init_user_ns, current_uid()));
    502                 goto out_free;
    503         }
    504 
    505         ecryptfs_set_superblock_lower(s, path.dentry->d_sb);
    506 
    507         /**
    508          * Set the POSIX ACL flag based on whether they're enabled in the lower
    509          * mount.
    510          */
    511         s->s_flags = fc->sb_flags & ~SB_POSIXACL;
    512         s->s_flags |= path.dentry->d_sb->s_flags & SB_POSIXACL;
    513 
    514         /**
    515          * Force a read-only eCryptfs mount when:
    516          *   1) The lower mount is ro
    517          *   2) The ecryptfs_encrypted_view mount option is specified
    518          */
    519         if (sb_rdonly(path.dentry->d_sb) || mount_crypt_stat->flags & ECRYPTFS_ENCRYPTED_VIEW_ENABLED)
    520                 s->s_flags |= SB_RDONLY;
    521 
    522         s->s_maxbytes = path.dentry->d_sb->s_maxbytes;
    523         s->s_blocksize = path.dentry->d_sb->s_blocksize;
    524         s->s_magic = ECRYPTFS_SUPER_MAGIC;
    525         s->s_stack_depth = path.dentry->d_sb->s_stack_depth + 1;
    526 
    527         rc = -EINVAL;
    528         if (s->s_stack_depth > FILESYSTEM_MAX_STACK_DEPTH) {
    529                 pr_err("eCryptfs: maximum fs stacking depth exceeded\n");
    530                 goto out_free;
    531         }
    532 
    533         inode = ecryptfs_get_inode(d_inode(path.dentry), s);
    534         rc = PTR_ERR(inode);
    535         if (IS_ERR(inode))
    536                 goto out_free;
    537 
    538         s->s_root = d_make_root(inode);
    539         if (!s->s_root) {
    540                 rc = -ENOMEM;
    541                 goto out_free;
    542         }
    543 
    544         ecryptfs_set_dentry_lower(s->s_root, path.dentry);
--> 545         sbi->lower_mnt = path.mnt;
                ^^^^^^^^^^^^^^
The patch adds a NULL pointer dereference.

    546 
    547         s->s_flags |= SB_ACTIVE;
    548         fc->root = dget(s->s_root);
    549         return 0;
    550 
    551 out_free:
    552         path_put(&path);
    553 out1:
    554         deactivate_locked_super(s);
    555 out:
    556         if (sbi)
    557                 ecryptfs_destroy_mount_crypt_stat(&sbi->mount_crypt_stat);
    558 
    559         printk(KERN_ERR "%s; rc = [%d]\n", err, rc);
    560         return rc;
    561 }

regards,
dan carpenter

