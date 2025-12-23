Return-Path: <ecryptfs+bounces-750-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03350CDA623
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 20:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 363FF301D9CC
	for <lists+ecryptfs@lfdr.de>; Tue, 23 Dec 2025 19:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEEE349B15;
	Tue, 23 Dec 2025 19:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="gdEGGs2p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="u/vi6fXR"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA4934A3B0;
	Tue, 23 Dec 2025 19:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766518946; cv=none; b=bwikyHn199S40hTOjxOdTRGXLvVaPFiWyayZexh/7uqLtYaGZrNL20oZFpuId/mXqYDcJsRQRsPeCm3NBz9gAPmAleJ7JOJ0udgHXH7Q/fOMPUN2jg4SmpUO+KkQvlI0NYEAT/OiQbZgtqsDQyIRuvX16PNARYCi1htV62YGXZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766518946; c=relaxed/simple;
	bh=FrzSyEXPzfmN5ilbzKat2TImkHQszbGJ0YJy6wFC2J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXK05HFZGH/KRfWWaQxmQD0p7ROlevETTO4r6BeVewRyiiKOqYey7gDqsFJZXvlOX83zpoohjtIkxW4PWatV2NGBmTxjEe943q9vZWbofc+IO0Pqnw9AVBalBF+nsWeG2Rui1U6PvA5xScbi6gthQMRgasbbh0vLajTLpPhvdxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=gdEGGs2p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=u/vi6fXR; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 5B3991D00044;
	Tue, 23 Dec 2025 14:42:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 23 Dec 2025 14:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1766518943; x=
	1766605343; bh=0yHvsdQd0uo4PEmSPp2yhyCFgaBg6/juPKvlWwBGjvI=; b=g
	dEGGs2pNMEcKUzgP2le3dp3B7tdTNkBjsMXBf+AmOOkAoHWpl6aGQ8kSZ4htuBVd
	V69UmQ9GG/s5dEeoJlsb5NK1xWsIHQGdth68oF2J43+8we8GtCrjU/OsJSJCyiqr
	E4HrDJ36pCSJ4wVUawsHSjO51QIr7uUvaQpJLfmSPYUvQr2K5E9zBrFqE3SpT5cn
	TGe0d7e8tHystD94XG6Q6gGOdNiYfgZDSRpra6YaShsc8+6R/FsLAloopWo5ZUyS
	1wglaDmZzPYAXUH62v7ILrkkrQI/yNR/JqQqvRqy70NX5vsAZvO4kTr65VXbuQ8A
	1Mr/T4FKhkxrzukzdc7LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1766518943; x=1766605343; bh=0
	yHvsdQd0uo4PEmSPp2yhyCFgaBg6/juPKvlWwBGjvI=; b=u/vi6fXR3AdfMgn/F
	VAy8DxGdoXp71v9Mri3vvoc0liAzElk2XPeOxdXFUr8O9Pci51QoMNsDFVsKaqPG
	6fnPuL1+9benAncUzWOWc79VVPUd57PaVKQehkcrrUj8SjeFZAcSXLBFPiflAF47
	YIIJrTQA9GoVBNK20qLPkOAgU1hXgoZGOhOT8WxqdRSq7jI2gxDSUb+gfTFQ5/VZ
	rK3ul9kqLgf8o8GNsPkz81rs51qqlLVCdXJ+n5JiG+ldDbG3Fkc6SLs89sqlp0QX
	teMCFbkxOQb0BfalS8QUEUEIsNyGameXSbZL/rK8TpUO8VI0pypWCAPG7bRZQu2S
	ibb3w==
X-ME-Sender: <xms:n_BKacCXbTpGgnDi4yE4dsD3_MlGrtOEmIh0buD_Y9oDxQsCssq-Ww>
    <xme:n_BKafOKr0rd7RKkaGrqwKFRZOTxMtZOlz8WxowH9dbu0fv86pPkuPOyxhFZWG4pN
    fDl3oZ_YknXPzxRNxD7IAoziywDZuaQIrOyrFVAycRLxoie8PGNp8A>
X-ME-Received: <xmr:n_BKadxPTZ3sKh5STK7PsjWpNKceTGi--uAbOnWKn7mMeIpm3KNVtOaXE2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdeilecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    etfeeikeekieeuieehffeigeetffekhedtteegkeehgefgffevfeegheevtdejheenucev
    lhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesth
    ihhhhitghkshdrtghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepnhgvihhlsegsrhhofihnrdhnrghmvgdprhgtphhtthhopegsrhgruh
    hnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjlhgrhihtohhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegrmhhirhejfehilhesghhmrghilhdrtghomhdprhgtph
    htthhopegvtghrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohguvgesthihhhhitghkshdrtghomh
X-ME-Proxy: <xmx:n_BKaXUIyChRFioA84xik9iOJBYmek7PyR31SiLKXVseXNRt-jVevw>
    <xmx:n_BKaXMTe8r_528t1RF-KJA4JYg-buSR2ntkznGPvrhP0WZQRpULDw>
    <xmx:n_BKaRCVTQCraEhi9Djca9dVALGaX4tr0-rlYa5rQ2ojnZ6Of8zVfA>
    <xmx:n_BKaceVQbMGNPg2Lhh2yOZql-DNFXPVf8glupM-qgZKblj8zYtYgA>
    <xmx:n_BKabdyy_1sylcs1ySQsA2cT-xVP-DtTFncr7PAV2H8S52X_NDqPD5n>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 14:42:22 -0500 (EST)
From: Tyler Hicks <code@tyhicks.com>
To: NeilBrown <neil@brown.name>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ecryptfs: Release lower parent dentry after creating dir
Date: Tue, 23 Dec 2025 13:41:53 -0600
Message-ID: <20251223194153.2818445-3-code@tyhicks.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223194153.2818445-1-code@tyhicks.com>
References: <20251223194153.2818445-1-code@tyhicks.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a mkdir-induced usage count imbalance that tripped a umount_check()
BUG while unmounting the lower filesystem. Commit f046fbb4d81d
("ecryptfs: use new start_creating/start_removing APIs") added a new
dget() of the lower parent dir, in ecryptfs_mkdir(), but did not dput()
the dentry before returning from that function.

The BUG output as seen while running the eCryptfs test suite:

$ ./run_tests.sh -b 131072 -c safe,destructive -f ext4 -K -t lp-926292.sh
...
Running eCryptfs filesystem tests on ext4
lp-926292
------------[ cut here ]------------
BUG: Dentry ffff8e6692d11988{i=c,n=ECRYPTFS_FNEK_ENCRYPTED.FXZuRGZL7QAFtER.JeA46DtdKqkkQx9H2Vpmv234J5CU8YSsrUwZJK4AbXbrN5WkZ348wnqstovKKxA-}  still in use (1) [unmount of ext4 loop0]
WARNING: CPU: 7 PID: 950 at fs/dcache.c:1590 umount_check+0x5e/0x80
Modules linked in: md5 libmd5 ecryptfs encrypted_keys ext4 crc16 mbcache jbd2
CPU: 7 UID: 0 PID: 950 Comm: umount Not tainted 6.18.0-rc1-00013-gf046fbb4d81d #17 PREEMPT(full)
Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
RIP: 0010:umount_check+0x5e/0x80
Code: 88 38 06 00 00 48 8b 40 28 4c 8b 08 48 8b 46 68 48 85 c0 74 04 48 8b 50 38 51 48 c7 c7 60 32 9c b5 48 89 f1 e8 43 5e ca ff 90 <0f> 0b 90 90 58 31 c0 e9 46 9d 6c 00 41 83 f8 01 75 b8 eb a3 66 66
RSP: 0018:ffffa19940c4bdd0 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff8e6692fad4c0 RCX: 0000000000000000
RDX: 0000000000000004 RSI: ffffa19940c4bc70 RDI: 00000000ffffffff
RBP: ffffffffb4eb5930 R08: 00000000ffffdfff R09: 0000000000000001
R10: 00000000ffffdfff R11: ffffffffb5c8a9e0 R12: ffff8e6692fad4c0
R13: ffff8e6692fad4c0 R14: ffff8e6692d11a40 R15: ffff8e6692d11988
FS:  00007f6b4b491800(0000) GS:ffff8e670506e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6b4b5f8d40 CR3: 0000000114eb7001 CR4: 0000000000772ef0
PKRU: 55555554
Call Trace:
 <TASK>
 d_walk+0xfd/0x370
 shrink_dcache_for_umount+0x4d/0x140
 generic_shutdown_super+0x20/0x160
 kill_block_super+0x1a/0x40
 ext4_kill_sb+0x22/0x40 [ext4]
 deactivate_locked_super+0x33/0xa0
 cleanup_mnt+0xba/0x150
 task_work_run+0x5c/0xa0
 exit_to_user_mode_loop+0xac/0xb0
 do_syscall_64+0x2ab/0xfa0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6b4b6c2a2b
Code: c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 f3 0f 1e fa 31 f6 e9 05 00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 05 c3 0f 1f 40 00 48 8b 15 b9 83 0d 00 f7 d8
RSP: 002b:00007ffcd5b8b498 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 000055b84af0b9e0 RCX: 00007f6b4b6c2a2b
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000055b84af0bdf0
RBP: 00007ffcd5b8b570 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000103 R11: 0000000000000246 R12: 000055b84af0bae0
R13: 0000000000000000 R14: 000055b84af0bdf0 R15: 0000000000000000
 </TASK>
---[ end trace 0000000000000000 ]---
EXT4-fs (loop0): unmounting filesystem 00d9ea41-f61e-43d0-a449-6be03e7e8428.
EXT4-fs (loop0): sb orphan head is 12
sb_info orphan list:
  inode loop0:12 at ffff8e66950e1df0: mode 40700, nlink 0, next 0
Assertion failure in ext4_put_super() at fs/ext4/super.c:1345: 'list_empty(&sbi->s_orphan)'

Fixes: f046fbb4d81d ("ecryptfs: use new start_creating/start_removing APIs")
Signed-off-by: Tyler Hicks <code@tyhicks.com>
---
 fs/ecryptfs/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index e73d9de676a6..8ab014db3e03 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -533,6 +533,7 @@ static struct dentry *ecryptfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	fsstack_copy_inode_size(dir, lower_dir);
 	set_nlink(dir, lower_dir->i_nlink);
 out:
+	dput(lower_dir_dentry);
 	end_creating(lower_dentry);
 	if (d_really_is_negative(dentry))
 		d_drop(dentry);
-- 
2.43.0


