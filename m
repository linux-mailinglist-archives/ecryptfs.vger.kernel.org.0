Return-Path: <ecryptfs+bounces-207-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C89E19B339C
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 15:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C71328348E
	for <lists+ecryptfs@lfdr.de>; Mon, 28 Oct 2024 14:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F46D1DB956;
	Mon, 28 Oct 2024 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SKJCVjK0"
X-Original-To: ecryptfs@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E39F1DB362
	for <ecryptfs@vger.kernel.org>; Mon, 28 Oct 2024 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126051; cv=none; b=XXUufCL5zp9GnLoNxnK2yzGkTsucxdvlh1GXY3QngNnKaezCIaQdnmhoSnTXfkKwYUIpjg2JGRknEM6bsvgZ+OZK6PrSi/89VAObh8xO0Oex8uui5JJn/ZoCgIJzUPqTV0nBU3kH4nvG4yBuwc8mPGHXLL0mBXJ735mUhgUP1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126051; c=relaxed/simple;
	bh=4qDYF5hFyRgX32v2nK+CpKZxqy8vOq9W8rqAS5Pb47A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDrK/5TgcsYGz0RKFM/rDQ2b2hlmLbdR/R12Wbv7o4Nyo0FYPMHzv99U+C4oNSMOOCqBIgFEb1N8C10M2y1dJLsYWJUzw/EqETE7B7oDY0gnBKt4d57ot51cJuryDoa/X1+DN9hEf+ocMmVZxoa3+YlFZWIefk82DhJM+2JCsos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SKJCVjK0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730126048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tikEvnJP7r6U6GJgSbIth0WEQNtUaYF9WJ/rLSwVdeA=;
	b=SKJCVjK0JtKK3YMNJ8mmBaHEHOAn+aMJXOq3LbEf6IJ7tF+g6mQmazjona2Pd3Zjz6Anxi
	Rc7S1RbKLdLJjJLpQQrREpR/8+OieOPxZEPhIRrSzNvTln/ECNboMuenRjpDq2QXM/Gde2
	DqvJzLVgjxbcFgB/FhwK8XjTnwAoPqo=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-CzPC34IZMi61IJk1kT6atQ-1; Mon, 28 Oct 2024 10:34:06 -0400
X-MC-Unique: CzPC34IZMi61IJk1kT6atQ-1
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a3c4554d29so38342905ab.1
        for <ecryptfs@vger.kernel.org>; Mon, 28 Oct 2024 07:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730126046; x=1730730846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tikEvnJP7r6U6GJgSbIth0WEQNtUaYF9WJ/rLSwVdeA=;
        b=E3Evapn3RHNPg2yTnUz+xcGeztEjLBGmDApsjR7lsbTz6qxtF2YlJQh1syyMV6Vg2P
         lFb5qmtVIj7s4wngDDCs/Gv7ZwhDVmX3gwMs1RRPMul17FwJapxChWtr7tVnmUwHWk18
         lDxemnGwpuqHfBnqppAdH2L0/hDGCVKr3jQrwjvqHQeaDPQUf48LRkTUM26uFIXAwiVM
         hug/JIkAsmPNvSZzXnpp0KhhS8ZodU9o9p+IUKfTqGECSeLQjBD8amsfQxCT+bovcDzo
         HrwKtsUeRSGeGbrBuhVcY50+T8B1D0/hOxy1eGt9aU1KInJDuKSNItFZsZMirUkLOLBD
         lBaA==
X-Gm-Message-State: AOJu0YyjLIyNjCNp+4lhytSIXJL/q30AFxGzToap2BY1olzweQsOeJGq
	KldN62ZTUftdbQ9ouVKhw1vVlz87cMNeElA/ICbrPUGa2fVPyCf63VYgvB9TIYQAufm+Q3HPKhV
	qyrSfJXJRiQ9pGFQekPinkpAPlhru0RGOc1w+zLCcvsTbpASYSfc1gT52Z86n2B9HjhOIRSicLt
	l17iaqvxJ06XNUNtkR2gKNooJqzTwUmZfJczg5YHm6AA==
X-Received: by 2002:a05:6e02:12e8:b0:3a4:d94f:5b53 with SMTP id e9e14a558f8ab-3a4ed2f5e49mr74846905ab.19.1730126045843;
        Mon, 28 Oct 2024 07:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIF0QJiGK895lAN4IMBPWMR6G4wY418o7sqnuROsFGKWmWqQ9svl/tj+Nsb3oTKpErlURDKw==
X-Received: by 2002:a05:6e02:12e8:b0:3a4:d94f:5b53 with SMTP id e9e14a558f8ab-3a4ed2f5e49mr74846635ab.19.1730126045358;
        Mon, 28 Oct 2024 07:34:05 -0700 (PDT)
Received: from fedora-rawhide.sandeen.net ([65.128.110.20])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc7261427asm1740927173.44.2024.10.28.07.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:34:05 -0700 (PDT)
From: Eric Sandeen <sandeen@redhat.com>
To: ecryptfs@vger.kernel.org
Cc: code@tyhicks.com,
	brauner@kernel.org
Subject: [PATCH V2 0/2] ecryptfs: convert to the new mount API
Date: Mon, 28 Oct 2024 09:32:37 -0500
Message-ID: <20241028143359.605061-1-sandeen@redhat.com>
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

V2: Fix whitespace issues and remove an accidental double semicolon
    in the 2nd patch.

Thanks,
-Eric


