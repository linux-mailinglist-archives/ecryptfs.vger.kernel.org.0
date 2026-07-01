Return-Path: <ecryptfs+bounces-1233-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rlzPBOSkRGqMyQoAu9opvQ
	(envelope-from <ecryptfs+bounces-1233-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Wed, 01 Jul 2026 07:25:56 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 420516E9D72
	for <lists+ecryptfs@lfdr.de>; Wed, 01 Jul 2026 07:25:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b="H/2m7Hky";
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1233-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1233-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49670300D9C5
	for <lists+ecryptfs@lfdr.de>; Wed,  1 Jul 2026 05:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E754363081;
	Wed,  1 Jul 2026 05:25:51 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D5B28504D;
	Wed,  1 Jul 2026 05:25:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782883551; cv=none; b=AkF/2ZGv2sQC3JN1O3jGqIN2GM5bzW+01MGMf3NU18QTfS4AwcEGLXCZ7fDYjzWGQoBPhDtGbCHFlHhMV9cDMBVmaLAMQy7IcKaw2rvrUpO0Bh3xf9boUrvBPx6sgxTaXnflZvd+Txep3gdTnY5WYNe1obPgwmZGZiBZPcwWBGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782883551; c=relaxed/simple;
	bh=wJalhrn5znMBMdWYZ/vd5EZlaxJB+E9u0dsYozjAAP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WdCRwjohU+vD2v4yKzTM2M2FLnBcP+epa36DSmxe4ALcnTOrh3/87lJTlnj7oXw3k/a0iO2arS5FhQaupqb3gMwoorX9wIjsjffrl38VAPymxALitudyMKcCy6YAif2Z923Pjp7x9+DD36j6z/a8pKeZIID3UTfXT2F0d3BIGeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=H/2m7Hky; arc=none smtp.client-ip=54.204.34.129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782883512;
	bh=wJalhrn5znMBMdWYZ/vd5EZlaxJB+E9u0dsYozjAAP8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=H/2m7Hkyfb/fOAIHEqHdxB/1BpyWx7lWJGq914EKROO2v9NabQX9z7acT8NF3R58C
	 uPeKfA0GpOZu/Il0PEwJD4+Xwr/qBty9gMd2rXV+/ZqIL85mKGdKMMZYBeEtoUDP52
	 gpuSfMilYybkd/Psna3i+EXhV60KLwVKpmfcu8jI=
X-QQ-mid: zesmtpgz3t1782883507t7a81058c
X-QQ-Originating-IP: fv/V2T1aCMUzPkJOe1QG7niQ9gJiVhHQh2ss99VZE5Y=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 01 Jul 2026 13:25:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7152035258912443281
EX-QQ-RecipientCnt: 6
From: Yichong Chen <chenyichong@uniontech.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: Yichong Chen <chenyichong@uniontech.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: release message context on send failure
Date: Wed,  1 Jul 2026 13:25:06 +0800
Message-Id: <20260701052506.256345-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <akSNYl2MglViekHR@yaupon>
References: <akSNYl2MglViekHR@yaupon>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OIFXy0IlfxVyGOU61Wz/r4NHbFL5FsLy+qYb9ea4ZyxpD6TWUkrQWByh
	enruJC8NrfDjzlKifj31t08UkB/GKfabH4235tAdkWwkqieg8f1sR5JEfciEjNK25nQZUAI
	70luIxDXcug48Tz74i6n2eG9MD6ka9HtErlGi8PPeRsRdHJ612aJqApKxYnJmL/mM1igkPu
	18/1WIwdZih3Oy/QAU3IfaNnbmCJsXstKD4SpTgREAwMyPjRK1TgkEao0mjcNlmWZJC0SXY
	4IfzDdyph9+aLYQaSAfOhzbgJJNeNru82udoPQsqeaREHId2n8+vEApshIoGEdfF9YhQzIn
	cSDVeiLAAigcBLGBTSQKODzMQDUOCxjR6IgzdmPUZZMrqkzv9UK/jjPRl4Yj5pJmM4skS0b
	fxyxNI2hsTcBhlj9ZGWYmLbQBFQhXA3u2EkXCOGDhUdIIf2OorSjmq2hUPFQtG3ecC0f5RF
	t+F/DwHf56va6d69Hbw/CgQk1DnGvSdYbYes4F3Oij+vC+nXEy6ngpRmi2GHJ6fdB8aNA+T
	AxMq0Ard7/dSuLo91j5PSRRy+Dyc253Isu3zg/3x3PbtJDHLXYfojsSR6afDr4m0jHW0pRW
	rCLLgrHtvqLxLy/73m/mnUprQAAQ7kcGfhGEBjaQi64GfZSZonMUv72zydVLthxfqr87f5j
	l57KGSLA2P5JgMNpZlX9FE3HTXQLMQhS50Pmkf2aXHrH1PfDdWrS0WkMiI7lKJG7YpP2Crt
	YqJ3hLCwH2xSJVvVnJB7q8ha0GZnkk+VSLsMDAtz25p6gNea4INv9Ogpgc0eyvS5I2F+/Wg
	cHbIewhXnMjGbJc/ExPXrBXwJtJUDYv3J84AIm+gfLUBL0j7tWjsmyx06Sv/vOrE1si8inu
	51mFZjLuQ7RElEs/3vClLFF+AHeWMz6jHoc6k+0LKYtGyMe9FCdyLk0mQWAHL2ScdrIv/uC
	o/SgGVNmfi/7Lag/W04dNJ4F+C79V2mcrpS09nVnfJ6k5PAMmHdeHhT5HrTvxxZ53uW8PIs
	q5On6ZNqrvZbmzROczZgyct8PSzrtCz3clCYRYaumniR+N5YAIVkG9FG2efAo=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1233-lists,ecryptfs=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:code@tyhicks.com,m:chenyichong@uniontech.com,m:thorsten.blum@linux.dev,m:kees@kernel.org,m:ecryptfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[chenyichong@uniontech.com,ecryptfs@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenyichong@uniontech.com,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[ecryptfs];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,uniontech.com:dkim,uniontech.com:mid,uniontech.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 420516E9D72

Hi Tyler,

Yes, I agree. I rechecked the history and f66e883eb618 is where the
miscdev send path was introduced into ecryptfs_send_message_locked().
I'll send a v2 with the corrected Fixes tag.

Thanks for catching this.

Yichong

