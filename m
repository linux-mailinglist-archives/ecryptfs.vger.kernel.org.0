Return-Path: <ecryptfs+bounces-148-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49703993158
	for <lists+ecryptfs@lfdr.de>; Mon,  7 Oct 2024 17:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E70141F241F4
	for <lists+ecryptfs@lfdr.de>; Mon,  7 Oct 2024 15:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE0A1D90D3;
	Mon,  7 Oct 2024 15:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="daUdvaiX"
X-Original-To: ecryptfs@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732D71D90D0
	for <ecryptfs@vger.kernel.org>; Mon,  7 Oct 2024 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315296; cv=none; b=ATJlkML6Z1WwQccuTLNKbtunzgh9wCwbyfBVD4Dg+jzmCU7jYutAexBkoaCjHMFkJGx+RM9samzl5nt2ZAoQI31DIr/ZEqyvexSAzhsCAbggEDMUhAmjaaS1I8veNc/X/oBIKckAOOVU5G6/RsghvkekX2KhUXKpbv8MiGeCZd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315296; c=relaxed/simple;
	bh=JAZb5LDaeSPJQ5Z4ovl7E+wTF9G2gG43SvWO66pB2XY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kNoZ1FoGJz6iJX55AI22o/TZMtybXTKTUsvGNtvxkGoBpkGCmAZfcd4bDRzL2kTd671vdiZQa/zVmkmtW8y35wBYTj8ESKQ8dl/+++lBdjgiyKOND8cR+X25qQNOetH9ZVjLCABzY/XgXPWVjOmApgg8Xn1hjd46JChQt0suRwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=daUdvaiX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728315294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JAZb5LDaeSPJQ5Z4ovl7E+wTF9G2gG43SvWO66pB2XY=;
	b=daUdvaiXJ3jLePFoz1e9UpCrE8GUumtCLPK9TH2goEWEbuzVxcfrYZoz98pOnW4Swq/0il
	UiULT2uVEgsR4buR2R8sAZU+MKoXJqwmljqwIkwubrD8MuzI98x/Zs1RG30GkGYpPDzSW5
	4MQVlMRFcf+KI4jQAeb+TjgA3DZnbsE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-IUK986-wM9mhK1Ocua1s_w-1; Mon, 07 Oct 2024 11:34:53 -0400
X-MC-Unique: IUK986-wM9mhK1Ocua1s_w-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a0ce7e621aso40289605ab.1
        for <ecryptfs@vger.kernel.org>; Mon, 07 Oct 2024 08:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315292; x=1728920092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAZb5LDaeSPJQ5Z4ovl7E+wTF9G2gG43SvWO66pB2XY=;
        b=rbFVxFaGUoUzNB1I/gAmdDindfm0zzVdrUl3dt8mwhwDb3w8axPVj/5IEQvak0hxpt
         yiJaCwTZ4WNFCFmx7R7e7HBR/GI7T//tJ4hasKUA1QbA5Hgd9cq18i0MbhbCnNQV3AyI
         RDY9DxQimyO/4bGdzG7BNPyokGvPnlKE9kvfXWyoarwcc6LPIlhC3WL1N1o9S1hyPZzH
         bQo3hvmrjEz1fviDcVKg6laAtGvUL1Mw2h/s33a596sbMeiPruckTm1AOh2HxlQu7Scu
         woAxnWCp+H9TaSsFp03m5ahCvLwAjYotQ+8v6CIZFOkfvbMSe6dQLtNUR0u4lzXWlSHt
         0Uag==
X-Gm-Message-State: AOJu0YzbnAkf6qfe7h14uVPzBqxpGTZPbrIL+/SJqh9h4UMSaBNUcCy4
	pqFmpOMKAFAM6x8c+fgmbxVSffbMatCHqKu68WfY75vl1j5pUG8o84Miy+WlLi2xYSwOLZ0Df1J
	HQDCUPL3tHPjLJBnaEJwWReYbu11cN7S0PzcRdlgeri5QqFd9pVqbp+X0LvByXQ+z1gT1bJOaSK
	wuAR5MyMTFXdYO2idCETKiRi4NTUS1jrLGN82jYvUGpA==
X-Received: by 2002:a05:6e02:1e01:b0:3a0:9aef:4d0 with SMTP id e9e14a558f8ab-3a37597a31emr104484275ab.5.1728315292356;
        Mon, 07 Oct 2024 08:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWx8Vs5HwoswhyjSOL0QaLzD+jvK9yuUuKIrSEo6SNhJ6FwpD6H60zdB+o/ofXdecONkhhWw==
X-Received: by 2002:a05:6e02:1e01:b0:3a0:9aef:4d0 with SMTP id e9e14a558f8ab-3a37597a31emr104483955ab.5.1728315291972;
        Mon, 07 Oct 2024 08:34:51 -0700 (PDT)
Received: from fedora-rawhide.sandeen.net (67-4-202-127.mpls.qwest.net. [67.4.202.127])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a37a874f7csm13879135ab.83.2024.10.07.08.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:34:51 -0700 (PDT)
From: Eric Sandeen <sandeen@redhat.com>
To: ecryptfs@vger.kernel.org
Cc: code@tyhicks.com,
	brauner@kernel.org,
	sandeen@redhat.com
Subject: [PATCH 0/2] ecryptfs: convert to the new mount API
Date: Mon,  7 Oct 2024 10:27:41 -0500
Message-ID: <20241007153448.6357-1-sandeen@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is lightly tested with the kernel tests present in ecryptfs-utils,
but it could certainly use a bit more testing and review, particularly
with invalid mount option sets.

This one is a little unique compared to other filesystems in that I
allocate both an fs context and the *sbi in .init_fs_context; the *sbi
is long-lived, and the context is only present during the initial mount.

Allocating sbi with the filesystem context means we can set options
into it directly, rather than needing to do it after parsing. And it's
particularly simple to do it this way given that there is no remount.

I could squash these two patches into one if you prefer, but
I thought maybe breaking out the first change made review a little
easier.

Thanks,
-Eric


