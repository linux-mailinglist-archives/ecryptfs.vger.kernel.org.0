Return-Path: <ecryptfs+bounces-1239-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9sEbFjzJVWqKtAAAu9opvQ
	(envelope-from <ecryptfs+bounces-1239-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 07:29:32 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6350751231
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 07:29:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=suksangroup.co.th header.s=default header.b=17se7SuP;
	spf=pass (mail.lfdr.de: domain of "ecryptfs+bounces-1239-lists+ecryptfs=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ecryptfs+bounces-1239-lists+ecryptfs=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=inbox.org (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B46F63033AAA
	for <lists+ecryptfs@lfdr.de>; Tue, 14 Jul 2026 05:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD28313545;
	Tue, 14 Jul 2026 05:18:43 +0000 (UTC)
X-Original-To: ecryptfs@vger.kernel.org
Received: from ns1.suksangroup.com (ns1.suksangroup.com [103.13.31.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA8D3128B8
	for <ecryptfs@vger.kernel.org>; Tue, 14 Jul 2026 05:18:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006323; cv=none; b=f0mk5j3Adkv9Rphd3EsGGWfXWt7TQjqux018hIWJl+V03ROe9dQkE9YH/2yImsrG6B7PJ5TROCMmmgCCDbmunoPAjHDV6ywk7Er6MWM9vNjHH4kSexWZP8wHwbz8XAHlrAkpt3YpQNvWndAr64MViMpoqutqJLXadiVCTw2zDZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006323; c=relaxed/simple;
	bh=4UDVjbNzAcN8I1HWyfOc3YwfmTXwH5ht0OgVkbfOBtY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EbjBqxuhdG7kB+YANLInXlTBiBFifgOd29p6o4IlfoQwwKF5vcZ2JEaKlet2vXAjDZCWspt9CwmyMFUc7jyRN6gY7H+6NRYsXnJXZE8uNbBa+jAU0/pgd4nZIAYa6Tbe5mPS1goXtYgTlyB1U204fyxMPAS0Rf9yi3DiYt/3/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org; spf=fail smtp.mailfrom=inbox.org; dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b=17se7SuP; arc=none smtp.client-ip=103.13.31.55
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4UDVjbNzAcN8I1HWyfOc3YwfmTXwH5ht0OgVkbfOBtY=; b=17se7SuPi0mS4bL0KBNHngjkbH
	Ph5CUdg3K6Fg4I2C3ool1XPv/5SMLkwpjILj/AmGDez+oHQ1Irfj5sU7DBN+LrrKFl73D+fqhxvNa
	FBqQ/ts5K9g3IXkhHTXz0ILtvd3DNKP4ZKVUgX71+S80agVpZaVfbczWrZ7Mo2ehph2PCga6bzWrO
	+QSfr4ASh7cqpn4G5LSnQr2X+EUY0a/niGksJESV2XV79TuRMoAcqqCICXoTGDh67e66pV9Y3gB6X
	1gkaIhx9TtHcWAEnyasyXA7UawDGZCS92zxs71mu5PhetlfkTOjwsQxcfvHfn6SrPR3YvAZvkl0zk
	Iv26D1wg==;
Received: from [207.189.26.187] (port=61605)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVXU-0000000Ft3Y-2mAb
	for ecryptfs@vger.kernel.org;
	Tue, 14 Jul 2026 12:18:39 +0700
Reply-To: hanns.schofield@lexcapitalgrowth.com
From: Harry Schofield ESQ <info@inbox.org>
To: ecryptfs@vger.kernel.org
Subject: Dear ecryptfs, project info
Date: 14 Jul 2026 00:18:36 -0500
Message-ID: <20260714001836.0E78CC0CC4DC6A7D@inbox.org>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.94 / 15.00];
	ABUSE_SURBL(5.00)[lexcapitalgrowth.com:replyto];
	R_DKIM_REJECT(1.00)[suksangroup.co.th:s=default];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[inbox.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ecryptfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1239-lists,ecryptfs=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	HAS_X_AS(0.00)[smtp@suksangroup.co.th];
	GREYLIST(0.00)[pass,body];
	HAS_X_SOURCE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_X_GMSV(0.00)[smtp@suksangroup.co.th];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER(0.00)[info@inbox.org,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@inbox.org,ecryptfs@vger.kernel.org];
	HAS_REPLYTO(0.00)[hanns.schofield@lexcapitalgrowth.com];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	DKIM_TRACE(0.00)[suksangroup.co.th:-];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,inbox.org:from_mime,inbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lexcapitalgrowth.com:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6350751231


Re:Good day ecryptfs,

Please let me know if this is best email to send you the project=20
info.

Kind regards,

Harry Schofield, ceMBA



