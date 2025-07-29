Return-Path: <ecryptfs+bounces-368-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC3B150FE
	for <lists+ecryptfs@lfdr.de>; Tue, 29 Jul 2025 18:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD42A3B0AF2
	for <lists+ecryptfs@lfdr.de>; Tue, 29 Jul 2025 16:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8332920ED;
	Tue, 29 Jul 2025 16:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aahNwJTh"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD32186295
	for <ecryptfs@vger.kernel.org>; Tue, 29 Jul 2025 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753805522; cv=none; b=KEEREUxR479K9zEVbP4S1F4PEKp5ivVVuD75c3Zd9OJSQuZRobDZWzYzp0IgelKyh9qv0OlrFHebEtb3K8tkiGImmbNjuf89rXnpPE05ZI5JSOU8aZgZbI+qE+a/DG1awNyB4tmbrzaYWKKwcy3kr5T8aDbvHNR+iDUWLyYvvYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753805522; c=relaxed/simple;
	bh=p0MLDjHn3YU/x9yTCdYXHfCYEgKmGU+OoSEpuS/HimI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=F1+ChGkzG67+uiStFmm1DU15T5ZiCZbLuDEvp5HvkUwtqohmOHuvy7HsPPtGNj357D8otq5RDO8jbWWkxJpTxZMqQwib7OMXaNEJl77Sf1LKmIaINcoNEOpqP8609JZuq+QYi7MapLTs36bHEe4BJhRiu7wnvFbuPvBpPi+S2VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aahNwJTh; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae3b336e936so1182123666b.3
        for <ecryptfs@vger.kernel.org>; Tue, 29 Jul 2025 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753805518; x=1754410318; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JZHPeRyHoBXNdeagHo5Eac6iQVlutJz9Fmfhj6JBepI=;
        b=aahNwJThteBsstVVg1UwskRGFgRJ+fdHQKvUsYcR0hIJBpsugRHIuUwX5SOCS8gSMi
         Y0sNU2aldnLvmyg/GIgZ+kNLa/JmwlK1zdobgF3lT5B77som7E65nzdAgnOUPX08Q3t4
         ic9jEL6wsHzvs6yplOMwG0yOu66jPjXOjG3YK7xi00TkHyf+IJwFMizTyCRodGk+tWX0
         shfZx2I6iIVlnmU+g7RH8ZIF9SlIsXVI3SAD+UXyXlyEx+5kQzbLKpz9y9NkrN9fmnmx
         hVTj4Yk46XEKbluaTRVpoY7YZNaA3kna3Biu5l/O/esBN0V1qIxGhueTiboIBVObCJ3m
         4fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753805518; x=1754410318;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZHPeRyHoBXNdeagHo5Eac6iQVlutJz9Fmfhj6JBepI=;
        b=B1zQMiq4PrTsDJOxVoo6BAeYj7PduZVm4YZC8Hanbdw4yNK1wgNaUhs6ruXaqUI5n7
         WeH1UMfZ3lfRj8PEGTEOJ6p2WlzbrkWLIMX8IVRbmwNSwyBLsqV9GoBpqTUDtXilFeCo
         /SGqb9x7NqxWHi2pBL/RSDs8u9RPzr5Kdo1O/Vzxc8Qsxsn4sJjz39tXIFv5zHAweoYc
         jBwKoh/TE7kVFuQkGNWjsLjTdXWK9JIg1q5SyCHEaRZ3jlg8cW/EiPPjHpW1YlVvGQSZ
         Vvl68/v3ZkdBWIWLSWSRBZ8VCRIKO+rqlGKsuuIc4l+ddRtuURpcP6p7fPIVZOmuh1g/
         kWrw==
X-Gm-Message-State: AOJu0YzzpLXqULhKV4mAfneqXWoHfDoxv8S2TXD45U7DCWN0f95WPe2z
	uHRBrsNmuSmVST448aitXUKVNa7GWxcumRLMMJttJm95Uwslg5DiH5ToRT4zsfjLjwdfIucW+DF
	ojrhNEJ8lmRwNrOd5SM/CzBd8Ik/Q/a18lFY=
X-Gm-Gg: ASbGncvSMvjlYQ2U2cDjuYU7UM1HDlIVliYU7hLEO4BnHDa+QrGSmgGsnKi1s9gdhVh
	wmwOTBXseoydRPGsHmN17ovOW/aSD8pcR+bUNAHomMIxKYjUAn1Nkik5g+6DvBgbgC6ptztQNho
	bey0bw7ATNd315y9t588wp/zKkFhCEWHKkVwuvLWIImi4QlmqgLNMgPPfyWaq5b749pwwK3JN3y
	5s=
X-Google-Smtp-Source: AGHT+IEC1NJypQpZ4L6MuJ+J/E7Rpk3wFVLJK2ebwrzl+3Kl/mPxWpCJdIs3jzu0J0RWrVJWdXXSaZWo+tfmeZrnLxc=
X-Received: by 2002:a17:907:97c7:b0:ae0:c441:d54b with SMTP id
 a640c23a62f3a-af8fd6a2b16mr8367566b.9.1753805518434; Tue, 29 Jul 2025
 09:11:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lukas Krupa <lukas0krupa@gmail.com>
Date: Tue, 29 Jul 2025 18:11:47 +0200
X-Gm-Features: Ac12FXzzZDg9vXW6r_mLho-27Umyi5sGoQ-zDjYCwmT_pdATxJFBMFoQqylbLXw
Message-ID: <CABVWzVTVTwLrsAMKUEU+mEqBOn5S-AEuYv0tWoDQKN6tAOd=Jw@mail.gmail.com>
Subject: No idea why - but home is mounted decrypted, but files/directories
 remain encrypted
To: "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

If anybody can help me, I tried a lot and getting kind of in circles.

After changing password, I somehow lost a lot (wallet), but what hurts
is my encrypted home directory.

It wasn=E2=80=99t mounting, but Googling and trying things I got the follow=
ing:
     - Managed to recover it (into /tmp), decrypted content and
filename - all good
     - Mounting into /mnt/test, got decrypted filenames, but can=E2=80=99t =
get
into anything attributes has lots of =E2=80=9C?=E2=80=9D (e.g. d?????????? =
  ? ?     ?
      ?            ?  Downloads/)
     - Somehow, I managed to get it mounted as my home, but filename
remain encrypted
(ECRYPTFS_FNEK_ENCRYPTED.FXY12C18aOyb1kR7pQyWVDYkii52g8f.VRjbv5ieRYxPy-L4A3=
kpjkGFMUtfNmrT6hwhhbY1jtXaSgs-/)

Can anybody help me with steps how-to recover this without loosing data?

Thank you

