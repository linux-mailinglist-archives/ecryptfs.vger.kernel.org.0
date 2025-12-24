Return-Path: <ecryptfs+bounces-758-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A222ACDB839
	for <lists+ecryptfs@lfdr.de>; Wed, 24 Dec 2025 07:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28E7D30181A5
	for <lists+ecryptfs@lfdr.de>; Wed, 24 Dec 2025 06:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CC92F49F7;
	Wed, 24 Dec 2025 06:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cABr1VWN"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12CE2C0F8E
	for <ecryptfs@vger.kernel.org>; Wed, 24 Dec 2025 06:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557934; cv=none; b=Z5PR2YCoZTSI4jCVrV19WKfkY9SAqKCbL/UquP8iXRfXj8PWEBdz8bWfY3QYYHm+UkX4Inq8IErSEhXpQY/V4nXN9EnTC/TYJ/S4wOZnizIx6U8db8cIyWgExvcqOD2+Wzzy4YZIQeC+BLNvXzEFHjqW/2nDCnp9KHnjLujxj0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557934; c=relaxed/simple;
	bh=1uKvSx8GPclRpAHaq5nkAFgGmVYzZkjqW0QbtatV/JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVo6abaSMUy5h8m9XeIkfJzykQpO6QW6+63D8NM9Ixy+U5qhqyjNXHj7nxdttuA9zcJQpDvNfOMfuYVfBHjS99Q8mbZTJkpA1xMM2GyZezyVzDrVbMVwShWx4mw9uMQlfbiNkE8KTEOyZqkI0GKkVgbnP/x9oGiFSO7Hq32RI/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cABr1VWN; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8010b8f078so727939866b.0
        for <ecryptfs@vger.kernel.org>; Tue, 23 Dec 2025 22:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766557931; x=1767162731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uKvSx8GPclRpAHaq5nkAFgGmVYzZkjqW0QbtatV/JQ=;
        b=cABr1VWNJZlERfmPvcL5ZTRBOoc0nh4plU0wVu7poaxv0k+wp9tVCz9UEusA6Bw3Xk
         9eR9u6Zr25me9l13uXoa/ljIpcgTOdFJPzvUjqYFMdicmy4rxRFIu8GRmjiY9V4Jhn/+
         /knu79H1SbtwcTqO4GzeCcxhCVz6U0kI6f8ku0JhUONyG5WduOrXdBZ16Ms6xrV+I52e
         PMWPhkoMVPhgsbXPXhnCl4uUJ1ICg8/YHF6X7o8G8ENqD6TDnkhWQ7poaKiTlnwZKS9k
         to8DAUwHtzBEi2IwgrfuqKTMesGbsXvQeGo6bi+m9+2fWYPCRrJE9qOn2C6KWTgw2SwG
         Z0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557931; x=1767162731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1uKvSx8GPclRpAHaq5nkAFgGmVYzZkjqW0QbtatV/JQ=;
        b=a7i3/eKMkIW9vRdFYmfwkFvzFr3G/OOQs87mtON0n+0elw2TTvHXVGOu0iatZHV9E0
         9Q6aXidxC0QBJ4Y2a+tzN8urkua8M2jJPoNI1WGt7CwJG2kK8EEjJgi/9hCuC3DDt15X
         ys9r30mh/WOyRs5CooPj+s8LAl3a+DHXE/7AewcI812stDsPle6IBgyqSxrp3QUiindO
         i3j/y4IZ8NaucZv1Pha6qZc0+hMVkMutC8daZtO1VJwU+FcZImZtMyWJmjLMJIat+C22
         Hw7xjEXCUX2FpySGubxLBcjHzYZj61n4GSCEyknKjdMEPJ/ThTlcI/YitY0w91KgEHj7
         ylPA==
X-Forwarded-Encrypted: i=1; AJvYcCUdEv1779AyIMUuqUMbxGLCkfm+jnbpOQ/bBsKCdrdtivBNy+Hq8ERyA5hbUuQ8MjdgsKBhpHP9Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdkM1w6MSyVeXJWZ937uyGQhIPYZNomRnQ84YZIH8jlBj582lI
	WOXED6dsP/yGg3RmtKrkPAfL4yArijOA3Io7Tm6ITRXlX/Kpg3x4gl7tYLZHpOV3cUYKdzqOqr9
	cdANEeTi+UxRItHp9QY1rhoMjE/sMtxXjfZfW
X-Gm-Gg: AY/fxX524YU0yk50W6d+IT0vKO3p7Rzsh+/ZTS3VApNYdbFvhIPgTtiqeLoNkecHLlV
	dkQD0IMJb8cIBU0g3Uo84BFlXAeSmVCT4U0/QiOsaEvTuF9MCNrwABkg4jSnwvvZPGqevQJ292I
	cqNNHarOKqxfj+iPD9Rix0VvSIB68W0uyz7wyBlNrA4Qmk+YkkSRMiNYjBjUy/RbC1tLp4DftIE
	TtUXaqbg4yaDwqG90HGX2LrkEpVDlv3wxAs5lqHhgMpjFEQG+9yTIftZAB99pYUBb0T1LKiRPA0
	8zuTp3CYDYbK3JCYLybt4I06KBAJxQ==
X-Google-Smtp-Source: AGHT+IGmJVMeYigFDymdUe/6mHZ/HJiHYfzqfl9VBpWdyLYJMGAbhMPbzcvXggOcLw+GiuN1JxDw9RsWKjCIvLcK4fg=
X-Received: by 2002:a17:907:1c27:b0:b75:7b39:847a with SMTP id
 a640c23a62f3a-b80372228e5mr1842969866b.60.1766557930625; Tue, 23 Dec 2025
 22:32:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223194153.2818445-1-code@tyhicks.com>
In-Reply-To: <20251223194153.2818445-1-code@tyhicks.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 24 Dec 2025 07:31:59 +0100
X-Gm-Features: AQt7F2oRXnzj07uSDlnyIY1XRSS9cYyN-Y5WQrjvs27faDAkUwQ6idplvFpdkLw
Message-ID: <CAOQ4uxg5Qbkt2WzfXojzCNUYwj9BsW6vzKEL4265PQxBgNkdeA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix two regressions from start_creating()/start_removing()
 conversion
To: Tyler Hicks <code@tyhicks.com>, Christian Brauner <brauner@kernel.org>
Cc: NeilBrown <neil@brown.name>, Jeff Layton <jlayton@kernel.org>, ecryptfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 9:42=E2=80=AFPM Tyler Hicks <code@tyhicks.com> wrot=
e:
>
> When running the eCryptfs test suite on v6.19-rc2, I noticed BUG splats
> from every test and that the umount utility was segfaulting when tearing
> down after a test. Bisection led me to commit f046fbb4d81d ("ecryptfs:
> use new start_creating/start_removing APIs").
>
> This patch series addresses that regression and also a mknod problem
> spotted during code review.
>

Ouch!

Christian,

In retrospect, it's a shame that patches get merged with zero test coverage
and no ACK from the maintainer.

OTOH, relying on ACKs from all fs maintainers will seriously impair
the ability to make vfs wide changes like this one.

Feels like we need to find a better balance.

At least for ecryptfs, if we know that Tyler is at least testing rc1
regularly (?) that's a comfort.

Thanks,
Amir.

