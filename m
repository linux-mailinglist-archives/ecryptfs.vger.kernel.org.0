Return-Path: <ecryptfs+bounces-786-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAjNEv9hlml5egIAu9opvQ
	(envelope-from <ecryptfs+bounces-786-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 19 Feb 2026 02:06:07 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349C15B4F4
	for <lists+ecryptfs@lfdr.de>; Thu, 19 Feb 2026 02:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2316A301BF43
	for <lists+ecryptfs@lfdr.de>; Thu, 19 Feb 2026 01:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F591230BDB;
	Thu, 19 Feb 2026 01:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="E6xwCVIq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wHNG+pU6"
X-Original-To: ecryptfs@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08AE20C038;
	Thu, 19 Feb 2026 01:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771463164; cv=none; b=cEKmQrAiJ1TM7ENHH7viwp4ztwW2MXRWrvjk6Olko5oCX7MGx48PSBw8JR2U6G86tchi6/ETBaYGi0VRYoGuuobR6I9rpCMxxsmAxylQpuSTphJmwTDV77wvl1ByJZ8zdEv3yUlszIvk7yYlxxJYilJIOGc1Jvl5088/2A/OkaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771463164; c=relaxed/simple;
	bh=+9L+dMMp2S4/+jVpjrolMa0amynbFvFj2ktT+5slFRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jlJz4brSpgO8gC1bHMFd15aDZIBWOPyvcEMPSL1mEV1mhxX6B3y4LdtX439hD90OpDs4lejc3JvoIY4W2XPLnBk8X5MH2nlPmL228znUFi/ZlDeTwpyE8Ld59NVNJ/liRhNLSN45Unk4Xn5H3Cjq4DJGs0o07vX8UkYAWR6m02Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=E6xwCVIq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wHNG+pU6; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id D228EEC0665;
	Wed, 18 Feb 2026 20:06:01 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 18 Feb 2026 20:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1771463161; x=1771549561; bh=nkTunBCGg1a/9q67NpMVdmXiK9HEDXmw
	Nla+cesuo1s=; b=E6xwCVIqgkszNVTUmc+9N8JWwhmii6MIxh9TnccA92InpqA/
	oqBFeiaC3n07QqlWkQdR/upQQ5DZ5pmfzwqC3bnlM+nbbrE9qNrmnOcd/6C6+DVS
	ZKiU1SSkzLqtnCNPGgrEIYsfvYEOxQce0aPss39NlJiU6f+LTPOroHEo5hBKTjJ9
	SH0kqhb/ISDUAtzRzbMIjeejXmQHr37FkT/5RxowlFmdo3JyJzmlOcx4SZS7Hckm
	4kB3zgLewrMf/CNgENQ3f7bGtXNDX22IFWZhMwLH+dWra4etJQMNTT8O2E1H5hfT
	NhpEcMXnUwwcpObPJLePoWWmFmpnKB6PljCntQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771463161; x=
	1771549561; bh=nkTunBCGg1a/9q67NpMVdmXiK9HEDXmwNla+cesuo1s=; b=w
	HNG+pU6cOpJrfUU6a+It1CphHMPVBvh7Ga+UIQGCEc/sG/VO2xgLYMHzzzlD6869
	gFH84/lUAuLR9+JoFFdxrjK4x9YvsSDvl+ZPDrTyoSYO35jCq0YymERvrs38QqyH
	KachmsJ+jUh11901yPXWDo/k3nRpAQN+SV2dNEubNlKeCS6xYRkO02AeJ+EC3cK8
	Q4N841umrajqiudn+wXORVbhTsrWLpyWU2iut6KCO69EWerMGmRMRBqnnmHryQdN
	Ejn09vAPE8jXFfadHnw5KMq/Ka4HYZIkYwcQ5F8jAoo++xL587vk+F51zU9dBSWN
	gzO0JkqQ7NMzBx87rPcJQ==
X-ME-Sender: <xms:-WGWacGYCzMnGI34lL1cGS6gFWvSabHbTLyWxA0X1xb70NPTyixo6w>
    <xme:-WGWaTJ-OTDFe0h-NPG5U6UQQTT48fX70LR9XICmgRExjvH0f07yfMdakE8l_v7zr
    l2LvrXqUlGKw-zPoJRfFhDlslEPLMfdwU67s0OXv1idyvYxM6vYUQ>
X-ME-Received: <xmr:-WGWaQndNI9QfgNXQxQ28L3xCf23ooGOE-h3Zn9NvkWRl-LB_d-Pi5I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdegudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkgggtugesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcujfhi
    tghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnhepff
    dvkeffffffkeethefgtdfhveetteduffdtiefggffhieettdeggeejheeghfeunecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghrtghp
    thhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughsse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegsrhgruhhnvghr
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegvtghrhihpthhfshesvhhgvghrrdhk
    vghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-WGWabSA-liZ5Ybv0ZNIYWDG1MYXFzkALxRjTyEcuGqH2e2lyKDzjg>
    <xmx:-WGWaSKYJTilLBItrJZnKbpFbkCFJVaGlCM5MEuLWUhQLZPL3m_NKg>
    <xmx:-WGWaRA5NYXhAPgv2WZ-YQGXeaxhS3YyoT1Qzs59kRdtIyFInxiTRg>
    <xmx:-WGWabA-wKbWb7j3_SarCU1FkNwqRKrKf2Sx7abiv1mzH6AjnMM2LA>
    <xmx:-WGWaWD6G5a5fgiJpWzykDlQ3x08d2N73-lNMa6odC8AqodI3xYVHWOd>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Feb 2026 20:06:01 -0500 (EST)
Date: Wed, 18 Feb 2026 19:05:10 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
	ecryptfs@vger.kernel.org
Subject: [GIT PULL] eCryptfs fixes for 7.0-rc1
Message-ID: <aZZhxvVTFRpbVNv2@yaupon>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-786-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tyhicks.com:email,tyhicks.com:dkim]
X-Rspamd-Queue-Id: 7349C15B4F4
X-Rspamd-Action: no action

Hi Linus,

This is the first pull request that I've sent to you in some time.
Christian has been picking up sporadic eCryptfs bug fixes, support for
new VFS hooks/functionality, etc., (thanks again!) but I have
time/interest to get more involved and received Christian's blessing.
This pull request consists of some really minor typo fixes that fell
through the cracks and some more recent code cleanups.

I've dusted off my notes on creating pull requests and think I got
everything correct but let me know if anything looks off.

The following changes since commit 9448598b22c50c8a5bb77a9103e2d49f134c9578:

  Linux 6.19-rc2 (2025-12-21 15:52:04 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-7.0-rc1-fixes

for you to fetch changes up to 99853d9daef240a45e161d0e33487cda4810b999:

  ecryptfs: Replace memcpy + NUL termination in ecryptfs_copy_filename (2026-01-12 20:21:27 -0600)

----------------------------------------------------------------
eCryptfs fixes for 7.0-rc1

The set of eCryptfs patches for the 7.0-rc1 merge window consists of
cleanups that are not intended to have any functional changes:
- Comment typo fixes
- Removal of an unused function declaration
- Use strscpy() instead of the deprecated strcpy()
- Use string copying helpers instead of memcpy() and manually
  terminating strings

The patches have all spent time in linux-next and they do not regress
the tests in the ecryptfs-utils tree.

Signed-off-by: Tyler Hicks <code@tyhicks.com>

----------------------------------------------------------------
Baolin Liu (1):
      ecryptfs: simplify list initialization in ecryptfs_parse_packet_set()

Slark Xiao (1):
      ecryptfs: keystore: Fix typo 'the the' in comment

Thorsten Blum (7):
      ecryptfs: Fix packet format comment in parse_tag_67_packet()
      ecryptfs: Replace strcpy with strscpy in ecryptfs_set_default_crypt_stat_vals
      ecryptfs: Replace strcpy with strscpy in ecryptfs_cipher_code_to_string
      ecryptfs: Replace strcpy with strscpy in ecryptfs_validate_options
      ecryptfs: Replace memcpy + NUL termination in ecryptfs_new_file_context
      ecryptfs: Drop redundant NUL terminations after calling ecryptfs_to_hex
      ecryptfs: Replace memcpy + NUL termination in ecryptfs_copy_filename

Zhang Zekun (1):
      ecryptfs: Remove unused declartion ecryptfs_fill_zeros()

Zipeng Zhang (1):
      ecryptfs: comment typo fix

 fs/ecryptfs/crypto.c          | 38 +++++++++++++-------------------------
 fs/ecryptfs/debug.c           |  1 -
 fs/ecryptfs/ecryptfs_kernel.h |  3 +--
 fs/ecryptfs/keystore.c        | 19 ++++++++++---------
 fs/ecryptfs/main.c            |  9 +++++----
 5 files changed, 29 insertions(+), 41 deletions(-)

