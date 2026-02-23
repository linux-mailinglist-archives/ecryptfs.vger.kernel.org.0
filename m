Return-Path: <ecryptfs+bounces-788-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Cd9JFupnGklJwQAu9opvQ
	(envelope-from <ecryptfs+bounces-788-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Mon, 23 Feb 2026 20:24:11 +0100
X-Original-To: lists+ecryptfs@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2541C17C51C
	for <lists+ecryptfs@lfdr.de>; Mon, 23 Feb 2026 20:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 929613120521
	for <lists+ecryptfs@lfdr.de>; Mon, 23 Feb 2026 19:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF9237754C;
	Mon, 23 Feb 2026 19:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XCrythka"
X-Original-To: ecryptfs@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21BB36999F
	for <ecryptfs@vger.kernel.org>; Mon, 23 Feb 2026 19:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873907; cv=pass; b=uXjLVuU5NzAjcddJXJclHmLN2YyLT9aZZguKDGdqZvphQR200UYp4RKDdFOpefDm5sn3J00wdka9WIEwM2/QI5K+6oPyYe/W71LLyPoio8E9uMsImwbwJkIiZ3Mbc4zmDLbgxqMNLbF4sv+0zFlmti21m+vEQtSrvCKNE4FuoEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873907; c=relaxed/simple;
	bh=tblpNGcD0gElg3Vo50oduKTl/nWjc6eu9UolzsTGmz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3kCCjD06gK11+MB45H1PxTfHMLuv0gWTz4l7UESKEkTZbiYFc7YMcwjIz2qYtoQemrjxJtyMktM91tmL+dbFWJ3mtvoSN4xsvvNEpXzaWVnZtnJTY1hA9e8NauNXSZlFFN7g/qzhDo7fHLxJGvaoBMbsSfZdDGHemk0Nq4ARZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=XCrythka; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a7a23f5915so27737825ad.2
        for <ecryptfs@vger.kernel.org>; Mon, 23 Feb 2026 11:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771873905; cv=none;
        d=google.com; s=arc-20240605;
        b=LMCSYv/f6gdwhrngVggIWlClgR48XV4uyGTySwLQjgrBVhKXdhAoV6/6ZhD4Nb1i4h
         t4xKrmfvp6rmsV31hdeZD0dIVpw+03iheLmbfAa3xkMLVpIes9LzRGUzn5KnHuOXa+Fg
         7Mh74A9/rPy6HYLTNXBd302zww/fJbSjcCUCk1bWuf6ro6J2h7YTWzi8S9mCMX3pgBJt
         2duwMtO78RuqXkp65EjtYh49MTEZzlC/wzEeAWnCY0lhNwAJ7bvBPFEsFU8cFptJ5KzK
         12WksEpD/SQoCJx7w2UHUKCDUYIoTpiyXbAnC1BKItA9Jbn2yLLIk6fVU6hUUqHeCOeV
         XgLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1TrMjpgx8h4Xq++8tS9duLQ4KzpG0NSMpXsg2flarwA=;
        fh=Kajur1UjSRw1m7GS2usDlOVc0HTnDy8lRcxWaXv3gu8=;
        b=Drvp2/1EU8h02nTRiT8p805+D5KNH4wXz57MiwUZ5GdZRpFMiizXFsY48dEl97GAut
         7uPGe/6r7YszOBZ1bM3IJ4inQptRPBuM/t6zRj+TMzBJVe4QVTT2H82Uvu8/SO6m6kU1
         tjwcLM9W0x7gVm2sIqINaGnUhkhclE0o+nAcfr3hcbe1HJlJedFJ85e8MSYliYv2Ga0D
         FquxlBBO2mB6nU3Hx1m0JI+JWkuZc/rk/8XDqiLj4m/p3y5PcX8z+kaHC5oVvgk6Xi/9
         cNygxEglIinZHDA7XDWfTLyvhVpKax1gy34e/jyFQJd4s5iA1RI6S2AgG1Krvhh5V8Mm
         wm3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1771873905; x=1772478705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TrMjpgx8h4Xq++8tS9duLQ4KzpG0NSMpXsg2flarwA=;
        b=XCrythka5L+wx9L+3wH58TB9I81HKDpG/aWAKmDXJftYzFxl/WSXZE6YDGaRSvOVrn
         ooLSWERfYP/P7z6Gjd1JS5skOlKF/dGQ5C6oW16/iHNDDwf8JpfcBiqanxRVafHYAB8+
         A69tuJ/9xl1LoJu94fQYOvd6A5MYGD8QzdXlVSvW/U/dDryajahd+C8TTcf+h1QFg8TY
         gvHrEeIFlWVZxolppXwUM7yFCZ02XH/z8HMOpQum/KZkMkqJLqs8HFDxJmKwgvhD4yH0
         1fWS2wKcPSODm90Q6uBwzNWq3qyvJOGgwtgX82CNFgEU0uhzCu3mIk90t66iE1Pm/JsH
         Q3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873905; x=1772478705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1TrMjpgx8h4Xq++8tS9duLQ4KzpG0NSMpXsg2flarwA=;
        b=a9QpG/ICyh/3o5IuG8iSQ9q6UsUpHF5TNkz1Z4GTDVym6td5ZQFzjLu+2XBT25ikHX
         wY8swWEmvacMH2p8XljvAaTneEqyMmygISues0x7Szfnk6gI4ISiN0nkvMvxIGZKOZkV
         mCkf/cXZpM8aVlRfwapSuOzk8Ub79YENqVM6wVIkbzFN96sU/UG8uQaOY9wY2bc1f8Zb
         DRZlky23g03hWm3fRii10PeZjcRZIAEgAFlNzr6qGFYWm6llsIrHsHqaXTDuXc9739H9
         7CiBg/ESZ9CrMY7YM97taYQNL2Gco2jaUjfOFVWyxG6elYW8S6yjTZSOT/cIRf2WUg5g
         Yf/A==
X-Gm-Message-State: AOJu0YymaG1NsxED0MDVApGKDCAfPL6gnx3EOJIMukzDspmRQ2o62OpV
	PeeZX32Rf56p0zYJA4zMF7tbfbZxBDBY2tv9qQZgyN2B5uIyvjVqb3gswasPFddZl/Xnd9SKzpm
	H4LmTgyn2uNWSDpYY6wFF2To37hw7OfcAxQ==
X-Gm-Gg: ATEYQzxQNLDOTxGpl9xHNboHGvkwEDFGo0ZH5lViug+tUL3hABZv3giIRHva3eV6iXY
	YD0vwAAax3BvoXyLGPd0k5pr8AeOTQFFZmZu68gfqgui9IuOK8roxrkqN5BG22xrc9ut0ggBh7W
	pSrxZP6+NVyl7HQ5o/O/ADJjsEYujm9y0Z0GEcoHG481XXlvpCht4ZLvYN+4icSb0HZUdHeqbie
	IzO8EMLow8ktwAJHKf+6+dAP8uBBXq7bIn8u8CJp9FzB9Saph2ekSV2DvklKhNQSjXFvAIgWw47
	h0sojMlr/sP5rlhCB6ctp8rQMJREfmS4gPLmM/89EC6FCVqANxzmfx2r
X-Received: by 2002:a17:902:d491:b0:2a7:5171:9223 with SMTP id
 d9443c01a7336-2ad7457e95cmr78107555ad.56.1771873905119; Mon, 23 Feb 2026
 11:11:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SEZPR04MB6972A94B302FC6AC528823FAB7EE2@SEZPR04MB6972.apcprd04.prod.outlook.com>
 <d5ed2e29-27eb-4960-a8d1-e15119df1306@googlemail.com>
In-Reply-To: <d5ed2e29-27eb-4960-a8d1-e15119df1306@googlemail.com>
From: Bert Wesarg <bert.wesarg@googlemail.com>
Date: Mon, 23 Feb 2026 20:11:31 +0100
X-Gm-Features: AaiRm53Y_CQ4ye1Axns7cAXyeHLvEQcz3t3iz-1yaTRMu20k46_1vQimxcYe2us
Message-ID: <CAKPyHN1HbRq_hpMX29TjbZjH2fV5ppkUcXB+akz_erT_ULPQMw@mail.gmail.com>
Subject: Re: [PATCH] ecryptfs: set s_time_gran to get correct time granularity
To: =?UTF-8?B?RnJhbmsgSHNpYW8g6JWt5rOV5a6j?= <frankhsiao@qnap.com>, 
	"code@tyhicks.com" <code@tyhicks.com>
Cc: "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[googlemail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-788-lists,ecryptfs=lfdr.de];
	FREEMAIL_FROM(0.00)[googlemail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bertwesarg@gmail.com,ecryptfs@vger.kernel.org];
	DKIM_TRACE(0.00)[googlemail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[ecryptfs];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,launchpad.net:url,qnap.com:email,googlemail.com:dkim]
X-Rspamd-Queue-Id: 2541C17C51C
X-Rspamd-Action: no action

Dear all,

On Fri, Dec 6, 2024 at 1:29=E2=80=AFPM Bert Wesarg <bert.wesarg@googlemail.=
com> wrote:
>
> Hi,
>
> On 17.05.24 12:09, Frank Hsiao =E8=95=AD=E6=B3=95=E5=AE=A3 wrote:
> > related to: https://bugs.launchpad.net/ecryptfs/+bug/1890486
> >
> > This bug happens in the two following situations:
> > cp -p: copy a file and preserve its atime and mtime
> > touch -r: touch a file and use a ref file's time instead of current tim=
e
>
> was there some discussion for this solution. I came to the same conclusio=
n but cannot test it right now.

now that there is renewed activity in eCryptfs (thanks, btw). Can we
please consider this patch for a next cycle?

Thanks.

Best
Bert

>
> Thanks
> Bert
>
> >
> > In fs/attr.c notify_change(), atime and mtime is truncated by timestamp=
_truncate(),
> > ecryptfs gets wrong s_time_gran (10^9 instead of original fs time granu=
larity) and
> > truncates a/mtime to whole second. Setting s_time_gran when mounting ec=
ryptfs
> >   solves the issue.
> >
> > Signed-off-by: Frank Hsiao =E8=95=AD=E6=B3=95=E5=AE=A3 <frankhsiao@qnap=
.com>
> >
> > diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
> > index b2f6a1937d239..19dbe9d1187e1 100644
> > --- a/fs/ecryptfs/main.c
> > +++ b/fs/ecryptfs/main.c
> > @@ -567,6 +567,7 @@ static struct dentry *ecryptfs_mount(struct file_sy=
stem_type
> >   *fs_type, int flags
> >       s->s_blocksize =3D path.dentry->d_sb->s_blocksize;
> >       s->s_magic =3D ECRYPTFS_SUPER_MAGIC;
> >       s->s_stack_depth =3D path.dentry->d_sb->s_stack_depth + 1;
> > +     s->s_time_gran =3D path.dentry->d_sb->s_time_gran;
> >
> >       rc =3D -EINVAL;
> >       if (s->s_stack_depth > FILESYSTEM_MAX_STACK_DEPTH) {

