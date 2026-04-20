Return-Path: <ecryptfs+bounces-1217-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Mt5F8jF5WkGoAEAu9opvQ
	(envelope-from <ecryptfs+bounces-1217-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 20 Apr 2026 08:20:56 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C97BC42725C
	for <lists+ecryptfs@lfdr.de>; Mon, 20 Apr 2026 08:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 129FC3000B28
	for <lists+ecryptfs@lfdr.de>; Mon, 20 Apr 2026 06:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4AC2C027A;
	Mon, 20 Apr 2026 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="TUostUzk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rEiiuo6x"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA143815E2;
	Mon, 20 Apr 2026 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776666051; cv=none; b=MiAcF/YKGW4IK43HrSkrRdBFh6wbDrMn0f6bNw0GXlNamrcLv/dYjCrU5JiO9aVWTRw+5XSqBMxff4RecAVTGpuIm6k0ai+UtTakJbhCGjHCq6M6+X0h8eMi4K4IS3ncE2R5da0cG4c9wzFm6wJIwAdKWMjzbr0unMvrRB3vdQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776666051; c=relaxed/simple;
	bh=q7O3nlu3rcGAX7c5jHgWM4Ze4bZ1IaNAo5fYfi/5s4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qttkTDkEZljiMRWMRZ69IX2AnPvQ/m0mbFfl7JU22Howh9HjAJTvcFX2xUtgGpBcx+uGFhewDHV4CMqmRgE450dEEpmQ4l9/qgVUdwUjMaVnO46zPM3VWmnRtRuNMccr996suSNbwUeYzcEfAnMAWDYq4+wxAlHsoMgZE9G/UrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=TUostUzk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rEiiuo6x; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id CDFD91D0018A;
	Mon, 20 Apr 2026 02:20:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 20 Apr 2026 02:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1776666048; x=1776752448; bh=Gd
	sKqPfaiYiY028VNZKIzibV3ksDn4TUub4xUVEh7qw=; b=TUostUzkN+e7g1cvys
	Vkb75CtU6iIxeGCjRLRwCz5tnDJj+/2P769d+UKzBiNgvGyh8tuWcAVZRjeNE2Va
	SSmYzQq8hMFMo2YRCDRdoJ3TYg3ctRcDqC0v8ISztKz0jluPeWaj+00zLuC4N95y
	jSgDpCJtXNVUFWRLrwQgjzvf9fdRCXt8anK/XrRkmsPknxgQIXux81yqGriOvK8g
	Qr9ZSfNkOsNoikA3t6ni8DJlkK9CCXs0juejw7m0wmSzOuFruM3d3AgTYhGkrFJX
	ZesjS9eWzFLFGX371sDUlcoFkbhJGg6jx9Dc3UaSOfAO/XG7c5xV9O+AlU2Ae594
	CqWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1776666048; x=1776752448; bh=GdsKqPfaiYiY028VNZKIzibV3ksD
	n4TUub4xUVEh7qw=; b=rEiiuo6xDOSiiYrA0ujh0vRV88XVWPwNCya78DOLRfMw
	c5ZWYzzKbHDtB+6KoPPbUo3H1FYkwBa59gV9U3NIZP9TyQ0Ecnc8s1EcJwetll5G
	V82UgzRFD1x/8hJ8VxvXBNozQkHq/ahxoBxjCWOy5R9FptpFXmLlyrUoVcL/e9xX
	mkCAe6xB0LM1YHfoxPn4rMYNUGmiPvAyxQ9IFY7GVFZbAL7mDo+VtYBqfCmkRvMj
	cgxrGB46kEwPVw0OG6aQcYuFhiwiILCdj7I7/CqWiWA7Br5HvFsJ8iXRizaHenEj
	ydka7rbRzotllrYuMsqj5RqbUg2EEQvcaLM06BqlGQ==
X-ME-Sender: <xms:wMXlaT0mV6OysXaJXoRP9Fb-jnqcr6DyZqlS1iTIU_iT7Jyou1Qcow>
    <xme:wMXlaSyEYY0KKMggoUb74EwPFMuoZVIWWLkLg7b2EcqOx4AjZhspTi0KQbQxCKc9Z
    xD31q1vce2LKu-nU4zdgyp0xwi6ywR5kAz3IBzhTB-ila0gLPtI_ZU>
X-ME-Received: <xmr:wMXlaSGjiRdYWOkBQcKfnulYgN-Hy5EuMbl3tQFh1XZHHIVAP214jxs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehjeejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfggtggugfesthekredttddtjeenucfhrhhomhepvfihlhgvrhcujfhi
    tghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnhepge
    ffteffveefjeefieeujeeuhfejffekieehtdeutdevhfdtudffteffgfffiedunecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghrtghp
    thhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughsse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegsrhgruhhnvghr
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegvtghrhihpthhfshesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehhtghhsehlshhtrdguvgdprhgtphhtthhope
    hthhhorhhsthgvnhdrsghluhhmsehlihhnuhigrdguvghvpdhrtghpthhtohepfhhrrghn
    khhhshhirghosehqnhgrphdrtghomh
X-ME-Proxy: <xmx:wMXladZ64wCrVwAyP5KjvjwItBqwZ-VykJFod0Zl-pbCo1rRPm0b6A>
    <xmx:wMXlacDsWQZQdMSaETyuK9NsmWr0HRshba56-o2DoOlVOF8lQW2fTw>
    <xmx:wMXladlIZ87hENTr62zGS-91_F5M87dXfr403KrgIDCsmHDFbxm-oA>
    <xmx:wMXlaVy4BZf9DTYStbUdUICXaMfRYQc0-Kx_3OaqlUBFfEKwVa5hJA>
    <xmx:wMXlafWZZdcXMEDLQFG4en-k2RS7K8prgt4n3zmRpZ2CyUvJLwYdmuYC>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Apr 2026 02:20:46 -0400 (EDT)
Date: Mon, 20 Apr 2026 01:20:27 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
	ecryptfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Frank Hsiao =?utf-8?B?6JWt5rOV5a6j?= <frankhsiao@qnap.com>
Subject: [GIT PULL] eCryptfs changes for 7.1-rc1
Message-ID: <aeXFbJRyKkVM9onr@yaupon>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-1217-lists,ecryptfs=lfdr.de];
	DMARC_NA(0.00)[tyhicks.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C97BC42725C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

The following changes since commit c369299895a591d96745d6492d4888259b004a9e:

  Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-7.1-rc1

for you to fetch changes up to e836ec1819b0cc50e0b45a53b0bdce6c596f0207:

  ecryptfs: keep the lower iattr contained in truncate_upper (2026-04-08 18:54:03 -0500)

----------------------------------------------------------------
eCryptfs changes for 7.1-rc1

The set of eCryptfs changes for the 7.1-rc1 merge window consists of:
- A fix to avoid unnecessary eCryptfs inode timestamp truncation by
  re-using the lower filesystem's time granularity
- Various small code cleanups
- Reorganization of the setattr hook's handling of inode resizing to
  improve style and readability, remove an unnecessary memory allocation
  when shrinking, and to support an upcoming rework of the VFS
  interfaces involved in truncation

The patches have all spent time in linux-next and they do not regress
the tests in the ecryptfs-utils tree. The inode timestamp fix returns
the "setattr-flush-dirty" test to passing state.

Signed-off-by: Tyler Hicks <code@tyhicks.com>

----------------------------------------------------------------
Christoph Hellwig (7):
      ecryptfs: cleanup ecryptfs_setattr
      ecryptfs: streamline truncate_upper
      ecryptfs: use ZERO_PAGE instead of allocating zeroed memory in truncate_upper
      ecryptfs: combine the two ATTR_SIZE blocks in ecryptfs_setattr
      ecryptfs: merge ecryptfs_inode_newsize_ok into truncate_upper
      ecryptfs: factor out a ecryptfs_iattr_to_lower helper
      ecryptfs: keep the lower iattr contained in truncate_upper

Frank Hsiao 蕭法宣 (1):
      ecryptfs: Set s_time_gran to get correct time granularity

Thorsten Blum (7):
      ecryptfs: Replace memcpy + manual NUL termination with strscpy
      ecryptfs: Use struct_size to improve process_response + send_miscdev
      ecryptfs: Fix tag number in encrypt_filename() error message
      ecryptfs: Remove redundant if checks in encrypt_and_encode_filename
      ecryptfs: Log function name only once in decode_and_decrypt_filename
      ecryptfs: Fix typo in ecryptfs_derive_iv function comment
      ecryptfs: Drop TODO comment in ecryptfs_derive_iv

 fs/ecryptfs/crypto.c    |  36 +++----
 fs/ecryptfs/debug.c     |   5 +-
 fs/ecryptfs/inode.c     | 257 ++++++++++++++++++++++--------------------------
 fs/ecryptfs/keystore.c  |   6 +-
 fs/ecryptfs/main.c      |   1 +
 fs/ecryptfs/messaging.c |   3 +-
 fs/ecryptfs/miscdev.c   |   7 +-
 7 files changed, 142 insertions(+), 173 deletions(-)

