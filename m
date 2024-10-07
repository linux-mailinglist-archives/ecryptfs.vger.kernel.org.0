Return-Path: <ecryptfs+bounces-149-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9BA993159
	for <lists+ecryptfs@lfdr.de>; Mon,  7 Oct 2024 17:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F892281F39
	for <lists+ecryptfs@lfdr.de>; Mon,  7 Oct 2024 15:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA461D2714;
	Mon,  7 Oct 2024 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YlNH5JGK"
X-Original-To: ecryptfs@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95371D9324
	for <ecryptfs@vger.kernel.org>; Mon,  7 Oct 2024 15:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315298; cv=none; b=mq2Tu8hFt0iczTmWZdQbPV9/GfDvU186J/47Qc+l1nUpXsloUSZhdbHxrmsfx914s+N56vcct2mVLVodOYxkz3HPjLdZwMLny3n+LZ8sbJxPQEMmPZ9as+t8NfBeThGiwzhMYsaCv/LY3a8tLqYQhiHTzu+1pgS3EBEezzmr97k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315298; c=relaxed/simple;
	bh=FPsWOpm+vOk4O55orzocZzH3OLpcn90/8ZEtfmtwn6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8yx7y19RBHpJaP5rxpPoGC8Yj3D6ibZOqnW3gegX2qcbl5NKfhTCoNP4hL/GvCB4i/e8wioUvSX4dnIRi/BOYR/VbpxcfDErrWoVS7ts+vaHieLfrAN067RYg1slE+yhxI9ejHqH3/giIx1DFfzD71IU2kIe1LEohyPyFh1QhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YlNH5JGK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728315295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IuXIA0d1bB4HHpKG1Z6kkKnGU41rP+KJfRJRCPOzrlA=;
	b=YlNH5JGKA9kUFe2ZTcUVSLNXWDljGp4/5mCkTOqAfMY1FKOnrT9tFYw4GWb6bGXpTNRiea
	VCwlJNIigAl07vFEtBj67XM08zXtcoM7D1EEZPOZgpzkBZ67RmQCihmQ+7ketUc4pAYQG9
	x3g7FoNh5nNbBnD+3B7tfuJU82KxTjM=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-O0p-fzc_MEyNU2m2xlgIxw-1; Mon, 07 Oct 2024 11:34:54 -0400
X-MC-Unique: O0p-fzc_MEyNU2m2xlgIxw-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a342e872a7so47937105ab.3
        for <ecryptfs@vger.kernel.org>; Mon, 07 Oct 2024 08:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315294; x=1728920094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuXIA0d1bB4HHpKG1Z6kkKnGU41rP+KJfRJRCPOzrlA=;
        b=V83vcwfxWpDGdc/G9kO8sPfuQB7v1buQAVsQbOwjWcN3l2BqTIDLcTrcNVF+dbSH+Y
         r+gMt5wYONfcF7fQWLXDVOtyOwxTNemeM3hxl2JDBDcaDLbClPKBsEaG0a7drGBB/Y9+
         aDxt79rV6T07f8fbhEFVvLb1SjvQekjeHFi3SBi1InMMNarQ9XpEFdvwBL1oUhyMXrji
         xBtOzPb6621VNuzsCxia6VN+bUQs1ZdG4abduE+zvzAgZOENuEMxn0uDdr0fc/prAEOD
         soOr75puKnRz5mqc3qbtKdaRuKxVDpmFsUaZTlls/ppgM/JhOocm7iY3w45J4eQEg5Rz
         5mpQ==
X-Gm-Message-State: AOJu0YxL3Ol1TTCQnXlZJvQgREK8zaKyrVR+C/mOjNO594wIVbV6Bk3s
	3WjwcLIVgk/rc493B+bJ4C2NgMRZ+D1ldAMEjUiPWEIMM2X6o9Ov2Evyfn5UKjcDrrNG/R865Pb
	OIycTcj4VDx0ho3Hu0OLjIyES+MhtbCqpGhSfUo4KBtUYePskU1Em9BehXiu70xT2a+SmJWEtII
	4py0stqXsuAL7yrF0R2figo98dFTw2+Xccf6Dq+hcrkg==
X-Received: by 2002:a05:6e02:174f:b0:3a0:9aef:4c2 with SMTP id e9e14a558f8ab-3a375bafe23mr113012165ab.19.1728315293893;
        Mon, 07 Oct 2024 08:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY7yERMn4d8AH+7REa0nG9UvD66HwxGijjEAArV+WdJjp8i2N+UkJKDAy4v8K1c1OZRjl5mg==
X-Received: by 2002:a05:6e02:174f:b0:3a0:9aef:4c2 with SMTP id e9e14a558f8ab-3a375bafe23mr113011825ab.19.1728315293333;
        Mon, 07 Oct 2024 08:34:53 -0700 (PDT)
Received: from fedora-rawhide.sandeen.net (67-4-202-127.mpls.qwest.net. [67.4.202.127])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a37a874f7csm13879135ab.83.2024.10.07.08.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:34:52 -0700 (PDT)
From: Eric Sandeen <sandeen@redhat.com>
To: ecryptfs@vger.kernel.org
Cc: code@tyhicks.com,
	brauner@kernel.org,
	sandeen@redhat.com
Subject: [PATCH 1/2] ecryptfs: Factor out mount option validation
Date: Mon,  7 Oct 2024 10:27:42 -0500
Message-ID: <20241007153448.6357-2-sandeen@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007153448.6357-1-sandeen@redhat.com>
References: <20241007153448.6357-1-sandeen@redhat.com>
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


