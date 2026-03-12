Return-Path: <ecryptfs+bounces-1138-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADogALZRs2l8UwAAu9opvQ
	(envelope-from <ecryptfs+bounces-1138-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Fri, 13 Mar 2026 00:52:22 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F17E727B59B
	for <lists+ecryptfs@lfdr.de>; Fri, 13 Mar 2026 00:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 713DF301EBED
	for <lists+ecryptfs@lfdr.de>; Thu, 12 Mar 2026 23:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985723D9DAF;
	Thu, 12 Mar 2026 23:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cjWhhyzr"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE544014B3
	for <ecryptfs@vger.kernel.org>; Thu, 12 Mar 2026 23:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773359534; cv=none; b=FZ8AIx7fmNjUzwsT22PVNHVsQED2fCO+OZGfSn08yo+nJuabTG4rxfZdMOaQW4qGPIkPSqhY4vTnq15kUSjH94FjQwY7kKabQUx6cL/JMVSIRlFc8l52V8517xOxZy+XFCRBLRSaFof7wwUkV/RK0Q/qKax4QxubDfMe0jJucvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773359534; c=relaxed/simple;
	bh=wOUC16WI4/reo5GvoZO5ESmt8rfD7PE3++Xf9novjKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJ6CZKVyN7lhkcQYIH9zoCNnEUiDAibQZe5MuNm22z9+FGpRJ6SyPTaNGUtKEh75hv+5GZZ+FLeCdUbyzov2hkJ7JXWCYIiJk9b2buQ7xXq+B7XCVIW/cVQCRzVrWH01CqRtmC1jk2UcNxrgb0rDmAWapI6hBPI5LuIofWhwBT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cjWhhyzr; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b976e181895so2617366b.1
        for <ecryptfs@vger.kernel.org>; Thu, 12 Mar 2026 16:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1773359531; x=1773964331; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pkgvHL0resGmXTqRBi16uC1NxLEncxIx9i+VLjGIXAo=;
        b=cjWhhyzrfC3vsfTTKNaQQpksX/hrrdTeN3iqO8Qxb92T9wdcUFk5Rrc32cDo9qkwPa
         +4OWEaPqCAdyCx70+iycglKH8PRIRHes8IhZUwBYN/W/yV+M4r8xZE8N+J61iWFWGMa5
         0GalMJEzuq8kzQJInluNLFCRlvb3Y+58VfFv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773359531; x=1773964331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkgvHL0resGmXTqRBi16uC1NxLEncxIx9i+VLjGIXAo=;
        b=ZjQUb+/vvLlniT4Kor0ZzJ0/DIq8R9aUKOWmIRhxZiCnUjuYxrWrSTaHOfQDhTnexm
         ULrL25x6HID4iciyJSYZzacMQyjRne7bvgiKOpVxzQw4At3f5Y0adlun8do/k6knPJrF
         cPFhZOhimxX4Dvas5jelrKniSdTuKBmYsUnxeyzk4bg2cxCu/HwmFbiZe1Mk0FYiouVP
         ErmtI9ETrlfRtgZn2vpbllThINXM4QWo0q/x2ylymWM4KkuqKs4sA2mZMXawnXikLccF
         M8xik+IYzOx2lJ8JiKKNTXmNiLEOATIijXZSR8CDkasGHttG5OKbY3EyFe9ixj7QSqcN
         ks6w==
X-Forwarded-Encrypted: i=1; AJvYcCWaHdKczCmCFMAjwgwPUaMb8IF12HH5TdbtE6Wzrmt8xbwfGw1S23N2gpdXJf5YoGmIiMEk2oumhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWsI+L695SK2HCTbPqlHpbyLnDnO73i8w4BDh0j9OerAeYtpJX
	TMwUF2eZ6SLikaxExe+xL5xw9Aup14JZH1iSGp/csYQ1HW89y35AEoPKinvIpjCL/FeczECbxXN
	umfqwtjI=
X-Gm-Gg: ATEYQzw/e7VEcuiYnY+1M8yMnAH4mtEqbA9NHHhVQjuT7yXt6pc3QXtB3jWaVa0pHGR
	ge4fClmJqndeh19ZNJ1XEKvGIYFc+fwBdsKP10pILhJ0xzPBf2YjVKRoEqpUE8GrY88s5GcAPzn
	8x8rNC83A6tYJRbWWPpfw5NG6wQQ/8jEd8MaHzUt6OA81AVjys//wEOCoOGDLLhHsznFWSSSutb
	Iq0rzV/XOpB4IpKIf2P6nGPCglMEhB/ulnRusOqqR4/2PuMBM3USqmWhZ9oQGhPI9uEX4jIc0DQ
	kLBP+W3uqXmkp6/tC6Jpjdr3r9uk++HrK9e8Hssr1wGfe95C+EM5roz5kuDQDpvLiPbZKzTKIBu
	f/MBWcdKR9hj/S4ViKLrFctBVNDcE6kZo/1WzUTLpb5qfI05GaRH+ZDYrKaObQHLxHmZTi8wF/i
	FhWU9MHivwELr+EFq2GDAiM1cpj7K5xhltN2KrhfL99gKyJtJZkhBFIg1boBmjwPCTbtipsiy1
X-Received: by 2002:a17:907:86a1:b0:b94:a1d4:ceff with SMTP id a640c23a62f3a-b9765392525mr67886166b.35.1773359530888;
        Thu, 12 Mar 2026 16:52:10 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc220basm3370066b.28.2026.03.12.16.52.10
        for <ecryptfs@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 16:52:10 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b96f02b4329so272413066b.2
        for <ecryptfs@vger.kernel.org>; Thu, 12 Mar 2026 16:52:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeMmHN4gfpEcENEwkCKyKnkDAwsS3YRApKFMC4keRs/5VQb5lbPx6NNBp7OvOSeCWdMQbm3N/3PQ==@vger.kernel.org
X-Received: by 2002:a17:907:c5c9:b0:b96:d802:8b41 with SMTP id
 a640c23a62f3a-b9764fd8722mr66207066b.15.1773359215961; Thu, 12 Mar 2026
 16:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312214330.3885211-1-neilb@ownmail.net>
In-Reply-To: <20260312214330.3885211-1-neilb@ownmail.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Mar 2026 16:46:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh92deXvH5iXCo9mThXCBYt-jRcVu=z4kiH-f3+wZQOHA@mail.gmail.com>
X-Gm-Features: AaiRm503fTaccEgKNbxF9h_dDHM9fUsSr52XJuxzTwCI0G9L03uDq8g5di1zchk
Message-ID: <CAHk-=wh92deXvH5iXCo9mThXCBYt-jRcVu=z4kiH-f3+wZQOHA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/53] lift lookup out of exclive lock for dir ops
To: NeilBrown <neil@brown.name>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jeff Layton <jlayton@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Carlos Maiolino <cem@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Amir Goldstein <amir73il@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Steve French <sfrench@samba.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Breno Leitao <leitao@debian.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, 
	Alex Markuze <amarkuze@redhat.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Tyler Hicks <code@tyhicks.com>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeremy Kerr <jk@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, coda@cs.cmu.edu, linux-mm@kvack.org, 
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, ceph-devel@vger.kernel.org, 
	ecryptfs@vger.kernel.org, gfs2@lists.linux.dev, linux-um@lists.infradead.org, 
	linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,szeredi.hu,gmail.com,cs.cmu.edu,google.com,linux.alibaba.com,redhat.com,auristor.com,samba.org,samsung.com,sony.com,debian.org,mit.edu,dilger.ca,goodmis.org,dubeyko.com,tyhicks.com,nod.at,cambridgegreys.com,sipsolutions.net,ozlabs.org,vger.kernel.org,kvack.org,lists.infradead.org,lists.linux.dev];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1138-lists,ecryptfs=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,ecryptfs@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[ecryptfs];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F17E727B59B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 at 14:44, NeilBrown <neilb@ownmail.net> wrote:
>
> This patch set progresses my effort to improve concurrency of
> directory operations and specifically to allow concurrent updates
> in a given directory.

I only got about half the patches, but the ones I did get didn't raise
my hackles.

HOWEVER.

This is very much a "absolutely requires ACKs from Al" series. Al?

Also, because I only got about half the patches, and there's 53 of
them total, I'd really like to see a git branch for something like
this. It makes it easier to review for me, and I suspect it makes it
easier for some of the test robots too.

But again - this needs Al to look at it. Iirc he had some fundamental
concern with the last version - hopefully now fixed, but ...

                 Linus

