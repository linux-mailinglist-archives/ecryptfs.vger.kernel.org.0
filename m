Return-Path: <ecryptfs+bounces-1225-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 14VrHgbqPWoJ8QgAu9opvQ
	(envelope-from <ecryptfs+bounces-1225-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Fri, 26 Jun 2026 04:55:02 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CF36C9DFA
	for <lists+ecryptfs@lfdr.de>; Fri, 26 Jun 2026 04:55:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tyhicks.com header.s=fm3 header.b=fv8rXrln;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="S ySzQYh";
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1225-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1225-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BC80301ABB9
	for <lists+ecryptfs@lfdr.de>; Fri, 26 Jun 2026 02:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C1B3955CD;
	Fri, 26 Jun 2026 02:54:58 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87E23BB4A;
	Fri, 26 Jun 2026 02:54:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782442498; cv=none; b=iEcOfZ1CoM0YgCZX89Aog9CCGgVOfaZnaaP2PtqMk+Ln7Z1ySdUkLMvig14yWJ8F2QeGPoaUoubv1+/mVVXTbMRq+/evNplUiqP7vIYjcD7ThnkoyaV63IAHgk5vzWJvH4nhQw/W+cd1XwxSk/T+aUeEVUWUXO7TCmOEuXoxgpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782442498; c=relaxed/simple;
	bh=+5LYcV+uxiQHLIKhqpgZ3FFZptqbmmii1hZbm0m4dI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sJ/48VcL0/3Xt7Af36gH0Ev1C8Rv8G6GW3PDGunNZ3dzAhF766giF3Cf3uZ5z1EvbAxFK0FXG4n1942ZDICY1Z+fjf9ycgxykV3WTgIlq6lWpD/qRW8gBZwc1QEekq4557ljeXFpxQ9+LExyaxDA6ku1gGRd+hrxTmra1ZRQzrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=fv8rXrln; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SySzQYhS; arc=none smtp.client-ip=202.12.124.152
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 289B57A0077;
	Thu, 25 Jun 2026 22:54:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 25 Jun 2026 22:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1782442496; x=1782528896; bh=a4100AqBkfM4NkqufhBZMK2qnqbKKyHp
	NEbh6AYutfw=; b=fv8rXrlnXr0s9VS8fRwXPn8YYado6bZCpF6fryE878lYnA2A
	jM9M5drXFq5uTgdepGknMFFGwSCFWJgfQS6xFGAHmia0BHO08GEUNlLDVfMmZ5KS
	QjpcG/mpDFHdUI/elYCJltUrCFm1bTkTDdaRnKBRQ57gfbZg0esmk5o2nMCN/sOs
	S8AQAScTz0P5Ok3FN4+Tk1geMp/VtVeznxPtnIw53ERGxObojhgYFBb5jt6by1T6
	bTBoUjeV7LbRefxyt6G7uU2anIQLeWrsKSW1FEV7zkLfvDFRghiCa9UsxhClxYCp
	KKRucd7RV1fA//oUc7WD5GHmvPVDcg9nEv0fVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782442496; x=
	1782528896; bh=a4100AqBkfM4NkqufhBZMK2qnqbKKyHpNEbh6AYutfw=; b=S
	ySzQYhS4rYsVpWls5QGDP/OLMFRwT8aHK/SXM2vt8LYliBkKoezba74LIGkhebJi
	NnUXUiygK9hQUwOzAVqk1s0N534Ed9Whq6Hz9ZE9wIlqUvoVGqsS2eB6JQt2tWWA
	U4GbTpQ3T2rulbOOASgFC/Hru+e2xzPK7G+5s8nHDGxtx3ONsfXTjULR8A16vEq2
	tRoJsUV/eh+xkqQu5XI78OCDxlncS1HzxkAR37ZpYNlQQ6hVMljkRrb8G/lS/p7y
	bm4n4d9KJVQ0s4x6hOQ/6dNgxkNLMmJojVC0K4FK17JscIrAenQFd7tX779Lr01b
	7Qw3PDScH8YRdbverrTVw==
X-ME-Sender: <xms:_-k9ahwcRXjL_X7LvAJAz1dOmU_oAvOc34YOiCPim0HggJQnojlM_A>
    <xme:_-k9avEtnleFPDS2_pKwrEOXBIPgWhOQm_Vs3sp1gJ4TG2QCItAmcev_zJEqbMNfY
    isKduM0jF5bvC6NJbcxuV3SFTqyuR2iLDrFaCjc8_xPDCUOVv_Fedk>
X-ME-Received: <xmr:_-k9alxLDXE-xvcytmSDdEFT70s_fx3u8jWtX7ZDRFvC5ocWrRWvDBs>
X-ME-Proxy-Cause: dmFkZTGdOY7NylxR3JpThjUTuofDKxaPmjRL/Pa3zrCF1fS9jDei07e7tCcQ61gYVSAaCe
    YHtUX1uLQHtw6OmyI8kGFQDEQP1AoesmhK5RQDhnFZxibYK6Cdn/jj48nndm2/8IQhVf6S
    6Ys7VX/dc584lFX6cL6SvajjP7LLWqq1sZblQwSOKh7x4upySRuSrDTjTLs1h5I/m5CAjA
    bpCW0iKhyY1zE4Xu9p00hdRqZBGDYZaef7jQM+CSmDtDXcTTi4k/kxikL8T1HvzzNZQ5hj
    tfNsodWiqYJ0EjEymF8vOsuiqjQdlE4H+0edueDxUTphvovQRTNi1BeBdT3NB3PCSwW7GI
    ToOobTduIMlhD5KNsh6hFy2pVDwK4dN9E03W0iDiD2C0YmkGE4bXhyLQBh9+2A3yM/7opr
    Px115qeQeBUVLlWGVPHlHWcUkv1zUqwKzBfkZNb+Aw/nPhk3iGsvnjDzDHgfPwB4FXp6Z3
    RPkcEbQR20cFMpUNJYhTFXwBa/w+jBreFDJ3oSj5oeg2K+FMNJ3DjtXN5hgQGf+ZZfGkX1
    TMl8Vmn3Kay3qlrwoGwTl+BHU6Qod3JUBsk2Nu+py7sBVAG0iHCQ8suiQ61CawYoo0xQxC
    1ia2+EOEtPS0Gxk+tui79RQQqT0WaGaXgBB2yY8EjgS5Wc/kksKlSSxuLStA
X-ME-Proxy: <xmx:_-k9agsMxKNpBnAuiQw7pm7voNbYAt7gxT-DK99AvLx1EDi66PIZcw>
    <xmx:_-k9ai0WWgmDbzfriypTVJj-zVVflifgbc9xuHwiax9cTAK7pWVCAw>
    <xmx:_-k9ar_F8H2_ExA3KmfwEsOHcqY0yADI1m1McHaY4c9lXTtxbF5aIA>
    <xmx:_-k9ajNfVIKwfY2rZ1SikkE1oCBzg4X6fRp-v5lWv79ffr88k_k5mg>
    <xmx:AOo9attF1yJjnNb1lKdZDvkplqugEMB2bGj7KdG9T1RReMNkkF4OuILK>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Jun 2026 22:54:55 -0400 (EDT)
Date: Thu, 25 Jun 2026 21:54:42 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
	ecryptfs@vger.kernel.org
Subject: [GIT PULL] eCryptfs updates for 7.2-rc1
Message-ID: <aj3p8nYWZPTbkUWW@yaupon>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1225-lists,ecryptfs=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:brauner@kernel.org,m:linux-kernel@vger.kernel.org,m:ecryptfs@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,ecryptfs@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,messagingengine.com:dkim,tyhicks.com:dkim,tyhicks.com:from_mime,yaupon:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8CF36C9DFA

Hi Linus,

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git tags/ecryptfs-7.2-rc1-updates

for you to fetch changes up to 95ce5ffd54cf66098f91892f98606c3bd33846fe:

  ecryptfs: use kasprintf in ecryptfs_crypto_api_algify_cipher_name (2026-06-04 14:15:08 -0500)

----------------------------------------------------------------
The set of eCryptfs changes for the 7.2-rc1 merge window consists of:
- Code cleanup to replace kmalloc()/snprintf() with kasprintf()
- Code cleanup to simplify code flow by removing an unnecessary variable

There should be no functional changes. The patches have all spent time
in linux-next and they pass all tests in the ecryptfs-utils tree.

----------------------------------------------------------------
Alexey Velichayshiy (1):
      ecryptfs: remove redundant variable found_auth_tok

Thorsten Blum (1):
      ecryptfs: use kasprintf in ecryptfs_crypto_api_algify_cipher_name

 fs/ecryptfs/crypto.c   | 24 +++++++-----------------
 fs/ecryptfs/keystore.c | 16 +++++-----------
 2 files changed, 12 insertions(+), 28 deletions(-)

