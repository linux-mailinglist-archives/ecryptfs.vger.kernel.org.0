Return-Path: <ecryptfs+bounces-208-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB51F9B339D
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 15:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3BC51C22545
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 14:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1000C1DB362;
	Mon, 28 Oct 2024 14:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dARHoq2J"
X-Original-To: ecryptfs@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752711DD53E
	for <ecryptfs@vger.kernel.org>; Mon, 28 Oct 2024 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126052; cv=none; b=d+IdhfaYfSe04VwYRokxXdZd+ihu820fYqvdoiBo+kRAB/R2csTSanJLRuqoFg+WAhbaW5F5h1ov3bVjOkBmRIlz3YPjEUOqi3rPUQAYqkrywh3q4N2WXQ5KtRgnHdGpbEdC56W7gDTLeWXia5AgpduVtw/OdN9B7zum+vXcJ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126052; c=relaxed/simple;
	bh=htcoLeqQcagmkwWp6j+rlpUl0APXoK2q/71QPIbBxLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeLif1E65Mja3kpHfFyo+Ezx3wp9Vqa0YJkRJnrfhz8+sEpnoRNpiyxOEVj1MQT+ftyILHj0PVC7RxjfepBBKT/wFH+wR1JaUb12JaG7CDOYRBl5qcMxmh+Sy36q55hTMXusqfVN4KmlINeQ66tGDLtlrpuNCZZzaN6vfyr/aIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dARHoq2J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730126048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ctcj9AUDdheri4lEhGc65m/PtIme9WA8reRtkVVNZa0=;
	b=dARHoq2JvmwQ43usJHJFZFXP3Fc1ukN13g2Q9JB46FZ5fpiepkeRh66YUmnI3eCDMveED1
	xxnCe7ypSKxo/yD9RiPg+0UI/55BhSdYKOb9tZlJNREZpQLifefXhzrt3++83JVvcFKD0b
	NT7S834hJKsOrf4dTlVj2BlNLQK1on0=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-PhhZDfhWOE6WxTbWziPSGA-1; Mon, 28 Oct 2024 10:34:07 -0400
X-MC-Unique: PhhZDfhWOE6WxTbWziPSGA-1
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-83ac354a75fso463020839f.0
        for <ecryptfs@vger.kernel.org>; Mon, 28 Oct 2024 07:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730126046; x=1730730846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ctcj9AUDdheri4lEhGc65m/PtIme9WA8reRtkVVNZa0=;
        b=XDm09tWuql1qX9tn5lLyQfgO1+SvPSdeSqkgsFKVzsuFLFKgthtgMKDM1bQFGfi54u
         MT1TvkjraG7scr4NMmyZAF6PN3OzIg3dgorCwHulU5oYz9/50UK7IQ5WsJqbHIG+5b/C
         hzAVy5f1XgJCdp0hlXgvC2hLzBTZBWCgVsrdXtQ7hD31ndnlEIJ8Tf1pnH6V6DKGIU0b
         MfQvw7bjeBUu+sHuHYmy69Usfvo99TGtulN0WFdFe9lmQ8ubSJU3X1Jx41OSWQabfDpR
         dwiUCW89L0vHQGaLNjOjZhh/c9lUHFxbL7DVKpj5G2dbLUpZAZhzuOtm5P+o6MZrK/zp
         m8Nw==
X-Gm-Message-State: AOJu0YyNKGjDmG3lX9lJe8f0/rQLhx1c749cyWq9LxrwFWwr4qPOr0TS
	nQgdpk1/bmZoTAt3GcuYJ64jlUy0vfl5wfYPIiURTg7+Q7weZdzEAVCdJ9yB2HvnDZDdydYNXAV
	jqLJTqyTwHQCyvAh8zSXspnFWuU2f6t9jch3cFzCc5c20tY6W5EbKxNPHpnzDSOV5Jykr90wMhg
	a3yvo07pXHDaW523Zssc1Aw0XqeZgJ+uYOXh/Dv7sBvg==
X-Received: by 2002:a05:6602:6b0a:b0:83a:63f4:ad73 with SMTP id ca18e2360f4ac-83b1c43753amr736669339f.4.1730126046413;
        Mon, 28 Oct 2024 07:34:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW8FLUtuGrXCLyhNIXyFmUrbl8hpGUr+Q8PSb5kLOMp480lKo4eZic+t3PH/LWrbQ+JBUXTw==
X-Received: by 2002:a05:6602:6b0a:b0:83a:63f4:ad73 with SMTP id ca18e2360f4ac-83b1c43753amr736666839f.4.1730126045981;
        Mon, 28 Oct 2024 07:34:05 -0700 (PDT)
Received: from fedora-rawhide.sandeen.net ([65.128.110.20])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc7261427asm1740927173.44.2024.10.28.07.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:34:05 -0700 (PDT)
From: Eric Sandeen <sandeen@redhat.com>
To: ecryptfs@vger.kernel.org
Cc: code@tyhicks.com,
	brauner@kernel.org,
	Eric Sandeen <sandeen@redhat.com>
Subject: [PATCH V2 1/2] ecryptfs: Factor out mount option validation
Date: Mon, 28 Oct 2024 09:32:38 -0500
Message-ID: <20241028143359.605061-2-sandeen@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241028143359.605061-1-sandeen@redhat.com>
References: <20241028143359.605061-1-sandeen@redhat.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under the new mount API, mount options are parsed one at a time.
Any validation that examines multiple options must be done after parsing
is complete, so factor out a ecryptfs_validate_options() which can be
called separately.

To facilitate this, temporarily move the local variables that tracked
whether various options have been set in the parsing function, into the
ecryptfs_mount_crypt_stat structure so that they can be examined later.

These will be moved to a more ephemeral struct in the mount api conversion
patch to follow.

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
Acked-by: Tyler Hicks <code@tyhicks.com>
---
 fs/ecryptfs/ecryptfs_kernel.h |  7 +++++
 fs/ecryptfs/main.c            | 55 ++++++++++++++++++++---------------
 2 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index c586c5db18b5..d359ec085a70 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -343,6 +343,13 @@ struct ecryptfs_mount_crypt_stat {
 	unsigned char global_default_fn_cipher_name[
 		ECRYPTFS_MAX_CIPHER_NAME_SIZE + 1];
 	char global_default_fnek_sig[ECRYPTFS_SIG_SIZE_HEX + 1];
+	/* Mount option status trackers */
+	bool check_ruid;
+	bool sig_set;
+	bool cipher_name_set;
+	bool cipher_key_bytes_set;
+	bool fn_cipher_name_set;
+	bool fn_cipher_key_bytes_set;
 };
 
 /* superblock private data. */
diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 577c56302314..d03f1c6ccc1c 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -239,18 +239,12 @@ static void ecryptfs_init_mount_crypt_stat(
  *
  * Returns zero on success; non-zero on error
  */
-static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
-				  uid_t *check_ruid)
+static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options)
 {
 	char *p;
 	int rc = 0;
-	int sig_set = 0;
-	int cipher_name_set = 0;
-	int fn_cipher_name_set = 0;
 	int cipher_key_bytes;
-	int cipher_key_bytes_set = 0;
 	int fn_cipher_key_bytes;
-	int fn_cipher_key_bytes_set = 0;
 	struct ecryptfs_mount_crypt_stat *mount_crypt_stat =
 		&sbi->mount_crypt_stat;
 	substring_t args[MAX_OPT_ARGS];
@@ -261,9 +255,6 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
 	char *fnek_src;
 	char *cipher_key_bytes_src;
 	char *fn_cipher_key_bytes_src;
-	u8 cipher_code;
-
-	*check_ruid = 0;
 
 	if (!options) {
 		rc = -EINVAL;
@@ -285,14 +276,14 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
 				       "global sig; rc = [%d]\n", rc);
 				goto out;
 			}
-			sig_set = 1;
+			mount_crypt_stat->sig_set = 1;
 			break;
 		case ecryptfs_opt_cipher:
 		case ecryptfs_opt_ecryptfs_cipher:
 			cipher_name_src = args[0].from;
 			strscpy(mount_crypt_stat->global_default_cipher_name,
 				cipher_name_src);
-			cipher_name_set = 1;
+			mount_crypt_stat->cipher_name_set = 1;
 			break;
 		case ecryptfs_opt_ecryptfs_key_bytes:
 			cipher_key_bytes_src = args[0].from;
@@ -301,7 +292,7 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
 						   &cipher_key_bytes_src, 0);
 			mount_crypt_stat->global_default_cipher_key_size =
 				cipher_key_bytes;
-			cipher_key_bytes_set = 1;
+			mount_crypt_stat->cipher_key_bytes_set = 1;
 			break;
 		case ecryptfs_opt_passthrough:
 			mount_crypt_stat->flags |=
@@ -340,7 +331,7 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
 			fn_cipher_name_src = args[0].from;
 			strscpy(mount_crypt_stat->global_default_fn_cipher_name,
 				fn_cipher_name_src);
-			fn_cipher_name_set = 1;
+			mount_crypt_stat->fn_cipher_name_set = 1;
 			break;
 		case ecryptfs_opt_fn_cipher_key_bytes:
 			fn_cipher_key_bytes_src = args[0].from;
@@ -349,7 +340,7 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
 						   &fn_cipher_key_bytes_src, 0);
 			mount_crypt_stat->global_default_fn_cipher_key_bytes =
 				fn_cipher_key_bytes;
-			fn_cipher_key_bytes_set = 1;
+			mount_crypt_stat->fn_cipher_key_bytes_set = 1;
 			break;
 		case ecryptfs_opt_unlink_sigs:
 			mount_crypt_stat->flags |= ECRYPTFS_UNLINK_SIGS;
@@ -359,7 +350,7 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
 				ECRYPTFS_GLOBAL_MOUNT_AUTH_TOK_ONLY;
 			break;
 		case ecryptfs_opt_check_dev_ruid:
-			*check_ruid = 1;
+			mount_crypt_stat->check_ruid = 1;
 			break;
 		case ecryptfs_opt_err:
 		default:
@@ -368,14 +359,25 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
 			       __func__, p);
 		}
 	}
-	if (!sig_set) {
+
+out:
+	return rc;
+}
+
+static int ecryptfs_validate_options(
+		struct ecryptfs_mount_crypt_stat *mount_crypt_stat)
+{
+	int rc = 0;
+	u8 cipher_code;
+
+	if (!mount_crypt_stat->sig_set) {
 		rc = -EINVAL;
 		ecryptfs_printk(KERN_ERR, "You must supply at least one valid "
 				"auth tok signature as a mount "
 				"parameter; see the eCryptfs README\n");
 		goto out;
 	}
-	if (!cipher_name_set) {
+	if (!mount_crypt_stat->cipher_name_set) {
 		int cipher_name_len = strlen(ECRYPTFS_DEFAULT_CIPHER);
 
 		BUG_ON(cipher_name_len > ECRYPTFS_MAX_CIPHER_NAME_SIZE);
@@ -383,13 +385,13 @@ static int ecryptfs_parse_options(struct ecryptfs_sb_info *sbi, char *options,
 		       ECRYPTFS_DEFAULT_CIPHER);
 	}
 	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
-	    && !fn_cipher_name_set)
+	    && !mount_crypt_stat->fn_cipher_name_set)
 		strcpy(mount_crypt_stat->global_default_fn_cipher_name,
 		       mount_crypt_stat->global_default_cipher_name);
-	if (!cipher_key_bytes_set)
+	if (!mount_crypt_stat->cipher_key_bytes_set)
 		mount_crypt_stat->global_default_cipher_key_size = 0;
 	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES)
-	    && !fn_cipher_key_bytes_set)
+	    && !mount_crypt_stat->fn_cipher_key_bytes_set)
 		mount_crypt_stat->global_default_fn_cipher_key_bytes =
 			mount_crypt_stat->global_default_cipher_key_size;
 
@@ -469,7 +471,6 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
 	const char *err = "Getting sb failed";
 	struct inode *inode;
 	struct path path;
-	uid_t check_ruid;
 	int rc;
 
 	sbi = kmem_cache_zalloc(ecryptfs_sb_info_cache, GFP_KERNEL);
@@ -484,12 +485,17 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
 		goto out;
 	}
 
-	rc = ecryptfs_parse_options(sbi, raw_data, &check_ruid);
+	rc = ecryptfs_parse_options(sbi, raw_data);
 	if (rc) {
 		err = "Error parsing options";
 		goto out;
 	}
 	mount_crypt_stat = &sbi->mount_crypt_stat;
+	rc = ecryptfs_validate_options(mount_crypt_stat);
+	if (rc) {
+		err = "Error validationg options";
+		goto out;
+	}
 
 	s = sget(fs_type, NULL, set_anon_super, flags, NULL);
 	if (IS_ERR(s)) {
@@ -529,7 +535,8 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
 		goto out_free;
 	}
 
-	if (check_ruid && !uid_eq(d_inode(path.dentry)->i_uid, current_uid())) {
+	if (mount_crypt_stat->check_ruid &&
+	    !uid_eq(d_inode(path.dentry)->i_uid, current_uid())) {
 		rc = -EPERM;
 		printk(KERN_ERR "Mount of device (uid: %d) not owned by "
 		       "requested user (uid: %d)\n",
-- 
2.46.0


