Return-Path: <ecryptfs+bounces-14-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 731EB83D5D7
	for <lists+ecryptfs@lfdr.de>; Fri, 26 Jan 2024 10:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D36928247D
	for <lists+ecryptfs@lfdr.de>; Fri, 26 Jan 2024 09:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3249567C4E;
	Fri, 26 Jan 2024 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=severnouse.com header.i=@severnouse.com header.b="h6VhvKJF"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail.severnouse.com (mail.severnouse.com [141.95.160.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF443111AD
	for <ecryptfs@vger.kernel.org>; Fri, 26 Jan 2024 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.160.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706257883; cv=none; b=I3fD3kj+/vXylUQcr3vKxn+l0hqg1QS2i3wpA7KeVpcvIbTfM0RwgZ5x3vQQMSBuJTlMdJ/0Ph3T5x6H5CFdtPD65Lu6JskWJYzr9D4Rd2P3nadQ+gSc4ipSQO3xe7RPllPJGvKavUm2PcRKZSV+D5NxP0xVoR+PdXITlSF65ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706257883; c=relaxed/simple;
	bh=waaYxUsyRtmB2zEBuWcqRuRHSoYd8sJFCtgHO/3AHKE=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=OgviYuLzMPWtxZEQwaiBunjsUna302uRtcAwXrhfIkgbUQohNgGcRY/09n7/YSQUROjo5UCfw6hN0bQBSJu3/lStMgeNy+9bFIxuofXyeeVwGyD027yy4kxHimQeECSXujceBO/B8pCF439kdujc7kqy/4M4PJL2jzyu7zPutCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=severnouse.com; spf=pass smtp.mailfrom=severnouse.com; dkim=pass (2048-bit key) header.d=severnouse.com header.i=@severnouse.com header.b=h6VhvKJF; arc=none smtp.client-ip=141.95.160.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=severnouse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=severnouse.com
Received: by mail.severnouse.com (Postfix, from userid 1002)
	id F05CBA2FC6; Fri, 26 Jan 2024 08:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=severnouse.com;
	s=mail; t=1706257869;
	bh=waaYxUsyRtmB2zEBuWcqRuRHSoYd8sJFCtgHO/3AHKE=;
	h=Date:From:To:Subject:From;
	b=h6VhvKJF0iEbFKuH1uxZb+hmi3Im48ge0Pa9nvsMdSVFB2UsZp+M/CXFPklbqrOwu
	 bxzt+rxWr3IHZ+fapxuGXo/xvS6qlJhnt2tc5JVyZ037fSfS96cfB/bAm3c6WIQkxr
	 L5W4zZ1KUD+Jxs/qONDM0hV/w5FY8Hs8kJazzyHSAi98MRyV0dhf1K7SlXBa5xe0od
	 F1wk4JO9yoP8+olfS08Mt+8E0BWiXotUO9s9pxqGazGR31IPz6UBBAgtpTEkctFWun
	 Lp/VCh1BvuEXTXcnyXW6Uf7R5fznxWNmlYZMC1UcfOK7xrCCMdYJ2wcKOpixx2OVlF
	 idshgeXdSI0sw==
Received: by mail.severnouse.com for <ecryptfs@vger.kernel.org>; Fri, 26 Jan 2024 08:31:04 GMT
Message-ID: <20240126074500-0.1.bo.p4cw.0.4vf3646n7x@severnouse.com>
Date: Fri, 26 Jan 2024 08:31:04 GMT
From: "Ray Galt" <ray.galt@severnouse.com>
To: <ecryptfs@vger.kernel.org>
Subject: Meeting with the Development Team
X-Mailer: mail.severnouse.com
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to reach out to the decision-maker in the IT environment wit=
hin your company.

We are a well-established digital agency in the European market. Our solu=
tions eliminate the need to build and maintain in-house IT and programmin=
g departments, hire interface designers, or employ user experience specia=
lists.

We take responsibility for IT functions while simultaneously reducing the=
 costs of maintenance. We provide support that ensures access to high-qua=
lity specialists and continuous maintenance of efficient hardware and sof=
tware infrastructure.

Companies that thrive are those that leverage market opportunities faster=
 than their competitors. Guided by this principle, we support gaining a c=
ompetitive advantage by providing comprehensive IT support.

May I present what we can do for you?


Best regards
Ray Galt

