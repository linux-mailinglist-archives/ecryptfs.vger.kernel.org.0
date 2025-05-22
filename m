Return-Path: <ecryptfs+bounces-272-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA988AC16A5
	for <lists+ecryptfs@lfdr.de>; Fri, 23 May 2025 00:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49DBD1BC82F2
	for <lists+ecryptfs@lfdr.de>; Thu, 22 May 2025 22:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639C02741DD;
	Thu, 22 May 2025 22:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="PE8bp2bC"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AB6270567
	for <ecryptfs@vger.kernel.org>; Thu, 22 May 2025 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952770; cv=none; b=srd0oBKei5pQWesHgb8cNsl7a4olNb26NWVWa8xz+10VBiuP+brXQ7UQcfJjT/210r/oTweb1G68PaAYUJx6EY0qbgiRmK8CN5GqYzvR20X/GhZEz8mFvO113jjrGua3jHz23S/5gXjZmYryKSlqO9qSDXxDk5ahysZ0WwsJwlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952770; c=relaxed/simple;
	bh=yXfmq+fsOH2ydhYAaJ/O8G8cyrnfKS0KGUVUMAH0MGk=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=GGEObtp1GL29GsQJNUiuOvG9/L/eVy51e88tZGO3ZY6Ppr341ELKYmG8I+Mhdr/mj1DBA6oXHvkHGgHqZk84SxylOkqoVdfu7tmP5rk/ymVzFk75sNYHwDMu0eDzjCC43Fpb6WAtpaagv3vzYcpmDLpY07UUpg07L/pAO1a2zVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=PE8bp2bC; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fa8eca392dso9928676d6.0
        for <ecryptfs@vger.kernel.org>; Thu, 22 May 2025 15:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747952767; x=1748557567; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jmptf5RMBQqSn8lkxlWoyMCjmS+Mv7H8iKTTl/Kwouo=;
        b=PE8bp2bC2u+7hVMWFXDxIhgHhKxulbXWcGxnUpIhrgzangQno0wz8wTj2SBpQlx+RH
         HWbPzJONY/k5V5KhKxFzRg0mqcSuevNUob7nbBRkNe4zNv5ta0ZZRbKuMkupvRu1j4H/
         L5g61hkwn3G2TrJtCWpQppB/pCl9f/CPqdvv0wvc5m0YvonN/44WK2eHjcRrBNO9b+Bz
         rMI5Soc4po1JoBDybn3lJlA6EaENodtYQjDPfzlCn/d0jltsqZogc7KaymbExTqk6b2E
         5S0ojIzkilaxs5NcdiEorb9gq51ZYUhzmmerYI6Csq70Rwqskc1RTDHHPC4a/b2ToWTE
         +pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952767; x=1748557567;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jmptf5RMBQqSn8lkxlWoyMCjmS+Mv7H8iKTTl/Kwouo=;
        b=l1p/vP0EfPNDZGhZCoqKserOV1R/xCTIGGpyECw+WvVH7x6Ox+eHfZbTDv+hSW3m13
         F+r8PhuqH9N2LdcBAOR7BQJRCebq4/LKqec9zKL3hVSs6qHpL8r9M09L4oUO4irdTnU5
         KJ468e1FNk2ChxDKg5STbDklnRCebbkkRWmRZqkAqilHWUK8KJdnsmwX+qLqbUgpEnxs
         XctxvX5t29qoWcVHDxqA6nU6T2ovbCzLsyD2XG2sO3W8ntmu1Y2Yf4U9VgdUOtc9Nz88
         NU5WEfIwVioNwQNa37wMeo7TRVwGrxoFu91Rg4g54pD4wbpWj6qCaMBUPHNJFa2s3HOk
         up3w==
X-Forwarded-Encrypted: i=1; AJvYcCW9mkMzCC0Ww0ZZfTf9rTanyr46DanupulnPUybSwgkkYS7X90VBa3432FMshNVOsHHYwa1QAhlXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfBsQJdARcV0DKBP1A81ngarKrcZjNeeH0CLxB5u8Rh8wcs8pz
	4EHPZVfok7cdBWlCQI83S5WfIFLri4xo9tXIIYw453N1LMeTy6yB/CIHAzifADP8zQ==
X-Gm-Gg: ASbGncv1bTHY5cG+7UlH9HhabaUV8OCY00WTy8Sj2tVhoOGcNuD2SUMUJRaqYJMVoZ9
	AM98C5Lxtt8+UohW9yhy69jibfo7vZCaNM4cQ8RY0hfSojjDIHW/plhVIiOg+U4P6pnyJM4FPNV
	KkaTk7+58u0EQCyQlA50a5i37SVO4RYyMrxWIuBqwPEtQpRyC1Gx/uC1a3liE1XHL5WHus9BSPg
	R96SZXWyMQUe3DNaOJa3GE5y3sOu6Ab2e5Qy/zHEiKnHVia3c8Iw3Ikswz/9klvmVCblosLsDUe
	tr1VsqiJjU8XcQBiqi3or1saV9OWd8Z0peXmd7zOFW4+YZTE2H2W2KRnsp8O+a7Bm5xsv8hqPSF
	9Un+lTYWX57F2SxhvZ6uR
X-Google-Smtp-Source: AGHT+IE2zN7SH+0SaGrs2tzepSFkLMKNXBgIbbn8M9DQcRbDJBs1dDzlx85ZuSxbIPErdUE31K4qXg==
X-Received: by 2002:a05:6214:1947:b0:6f2:b094:430e with SMTP id 6a1803df08f44-6f8b0829131mr503375636d6.25.1747952766984;
        Thu, 22 May 2025 15:26:06 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f8b0987259sm105076766d6.120.2025.05.22.15.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:26:06 -0700 (PDT)
Date: Thu, 22 May 2025 18:26:05 -0400
Message-ID: <0bb73a49ccbc93e90ea87c0dbb4097ae@paul-moore.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250522_1740/pstg-lib:20250522_1730/pstg-pwork:20250522_1740
From: Paul Moore <paul@paul-moore.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Tyler Hicks <code@tyhicks.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Amir Goldstein <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 2/7] lsm: introduce new hooks for setting/getting inode  fsxattr
References: <20250513-xattrat-syscall-v5-2-22bb9c6c767f@kernel.org>
In-Reply-To: <20250513-xattrat-syscall-v5-2-22bb9c6c767f@kernel.org>

On May 13, 2025 Andrey Albershteyn <aalbersh@redhat.com> wrote:
> 
> Introduce new hooks for setting and getting filesystem extended
> attributes on inode (FS_IOC_FSGETXATTR).
> 
> Cc: selinux@vger.kernel.org
> Cc: Paul Moore <paul@paul-moore.com>
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/file_attr.c                | 19 ++++++++++++++++---
>  include/linux/lsm_hook_defs.h |  2 ++
>  include/linux/security.h      | 16 ++++++++++++++++
>  security/security.c           | 30 ++++++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+), 3 deletions(-)

The only thing that gives me a slight pause is that on a set operation
we are going to hit both the get and set LSM hooks, but since the code
does call into the getter on a set operation this is arguably the right
thing.

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

