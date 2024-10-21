Return-Path: <ecryptfs+bounces-191-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC99A6B95
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 16:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DF711F2130A
	for <lists+ecryptfs@lfdr.de>; Mon, 21 Oct 2024 14:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27181EBA1A;
	Mon, 21 Oct 2024 14:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LqeTgLz/"
X-Original-To: ecryptfs@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAAB1946B
	for <ecryptfs@vger.kernel.org>; Mon, 21 Oct 2024 14:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729519663; cv=none; b=MPkOYi8RbpBKb0DYRtz74D0if34sPZ5hQXxE8MyE+bgmsyzqrfngu+n2GaQqQS+ajMByznn9C6L0C9RaEIcJEmZX9j/xr5m04Fgwm4ybNX33KHctgVaH2uICI4WDgEiUxTxase8gB5nF57djS9uCy8e6vHmZrUjb784gJSRMBms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729519663; c=relaxed/simple;
	bh=9W2vlI8WZHGj1CzOr3r8IXVj47iXpeGJqwho6mYIXD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJiCpeQLIMkIuVBAJZ3uA7Yi5BQaUhopGiBa7j6LnDBKhyiN5KfsPofwtWy4AUNceh+voQDJqnC7KGT+oGlHg95bSAAluhwOnNPnBTW3rgbMOTRKatUMM6uEio977Q8o/Mqq9axb3OrEWBY9I5rxF/70IELfPrgZz6mrVsNEvSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LqeTgLz/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729519660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhl1R6OxjaloM4NTCV4CxFhYE5uwUsa+7z5eikkxWKA=;
	b=LqeTgLz/ljhtPMSValNKEK0pEg/wVNlShtdUi2Ht15fm5BftUWJjItHqOEhesvdxUJ1tJS
	0GggGRs5xjsGLb0E+Fn9C3gQy0GpMBCkD2YFjzjPgvK2ysJtrH5I+FePx0U0EHFIph3OZu
	gVTkoldOTo9TmkHH3Cur0PiKr1RrNi8=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-c0ALHWLcNtWgFw1N14ACJg-1; Mon, 21 Oct 2024 10:07:37 -0400
X-MC-Unique: c0ALHWLcNtWgFw1N14ACJg-1
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a3ae775193so45438055ab.1
        for <ecryptfs@vger.kernel.org>; Mon, 21 Oct 2024 07:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729519657; x=1730124457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhl1R6OxjaloM4NTCV4CxFhYE5uwUsa+7z5eikkxWKA=;
        b=rxuFe9txSOYThzqHp0vsfUkNwKBJAQuKWmVVNd+Levt8dPcb6aJs9JTA1Prot/JJAy
         WfuAQTr3yGcIyItQuAVvF/gbcG14CjYvFyGsxq2KEw3bs5ZfZ4fA4kYU/2CqF4qFRoXq
         BZs2mnlL+SFSLNAFPZ/WBfALmqTcB3yYv7NAj1tmSAlt2SGRvdFpdVJAISibbJtAHt3Z
         0RACDE5RGxrPhXjMqV/fvv++vIcAzmrEgBHv6VD7MtPvJjkzJ7gcvREITLC2ammxhL+7
         RQy6lNMlAYgwVBywRwP/2+PHDE31lcv/Xhapct0uBZtaFRpB6VjhICSwLEc9Uq/QozUd
         kzhg==
X-Gm-Message-State: AOJu0YxzKz73NeKKuJg3mL7YXKrQ1bODI7Dl6UPmfOVXQrQ00H55MtIr
	uuv+tf27yHxEVfH25gUF3su0AFzA021gdydlIzRaj/ADABVIawjWdADLoDzgmtBIDNMwOCMu0aR
	fNEhGe8k4ukm5yaXF6iKwo7jTi3s5nHwRXQbzW0mEXw/gZsd9AggcW68w
X-Received: by 2002:a05:6e02:1988:b0:3a0:8d60:8ba7 with SMTP id e9e14a558f8ab-3a3f4073bcdmr106669965ab.14.1729519656927;
        Mon, 21 Oct 2024 07:07:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFokUZmESiwQvt4QrMNGQ2ADCAd/zj+KLt4UQ0VKAMQiWPbDfM2bDl1TQ1Q2He2p8T6M8EFAA==
X-Received: by 2002:a05:6e02:1988:b0:3a0:8d60:8ba7 with SMTP id e9e14a558f8ab-3a3f4073bcdmr106669555ab.14.1729519656289;
        Mon, 21 Oct 2024 07:07:36 -0700 (PDT)
Received: from [10.0.0.71] (67-4-202-127.mpls.qwest.net. [67.4.202.127])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc2a5572casm987612173.66.2024.10.21.07.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 07:07:35 -0700 (PDT)
Message-ID: <c24a2f67-a87e-4dd5-bee7-1771c76b51d7@redhat.com>
Date: Mon, 21 Oct 2024 09:07:35 -0500
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ecryptfs: Convert ecryptfs to use the new mount API
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, brauner@kernel.org
References: <20241007153448.6357-1-sandeen@redhat.com>
 <20241007153448.6357-3-sandeen@redhat.com> <ZxXwCAydTXeLuVFm@redbud>
Content-Language: en-US
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <ZxXwCAydTXeLuVFm@redbud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/24 1:09 AM, Tyler Hicks wrote:
> On 2024-10-07 10:27:43, Eric Sandeen wrote:
>> Convert ecryptfs to the new mount API.
>>
>> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
>> ---
>>  fs/ecryptfs/ecryptfs_kernel.h |   7 -
>>  fs/ecryptfs/main.c            | 393 +++++++++++++++++-----------------
>>  2 files changed, 198 insertions(+), 202 deletions(-)
>>

...

>> diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
>> index d03f1c6ccc1c..a7829983304e 100644
>> --- a/fs/ecryptfs/main.c
>> +++ b/fs/ecryptfs/main.c

...

>> +enum { Opt_sig, Opt_ecryptfs_sig,
>> +       Opt_cipher, Opt_ecryptfs_cipher,
>> +       Opt_ecryptfs_key_bytes,
>> +       Opt_passthrough, Opt_xattr_metadata,
>> +       Opt_encrypted_view, Opt_fnek_sig,
>> +       Opt_fn_cipher, Opt_fn_cipher_key_bytes,
>> +       Opt_unlink_sigs, Opt_mount_auth_tok_only,
>> +       Opt_check_dev_ruid };
> 
> checkpatch complains about these lines starting with spaces rather than
> a tab. I think that's a valid nit. Can we switch to tabs?

Oh, sure. They have spaces upstream and I didn't catch that when I tweaked
the enum.
 
>> -		case ecryptfs_opt_err:
>> -		default:
>> -			printk(KERN_WARNING
>> -			       "%s: eCryptfs: unrecognized option [%s]\n",
>> -			       __func__, p);
> 
> I think we lost this error message, which can be helpful for users when
> debugging mount(2) failures.

Invalid options never make it to the parsing function under the new mount
API, see below. Honestly we should be able to even remove default: but it seems
like most prior conversions don't do that, maybe to keep static checkers happy,
not sure.

> See below in your new code where we handle the default case for what I
> think we should include.
> 
>> +
>> +	opt = fs_parse(fc, ecryptfs_fs_param_spec, param, &result);
>> +	if (opt < 0)
>> +		return opt;
>> +
>> +	switch (opt) {
>> +	case Opt_sig:
>> +	case Opt_ecryptfs_sig:
>> +		rc = ecryptfs_add_global_auth_tok(mount_crypt_stat,
>> +						  param->string, 0);
>> +		if (rc) {
>> +			printk(KERN_ERR "Error attempting to register "
>> +			       "global sig; rc = [%d]\n", rc);
> 
> Are we expected to be using errorf() and friends here rather than
> printk()?

That's kind of a debate. If you'd rather get rid of the kernel message and
send it out through the mount api message channel instead, I can make that
change. But if userspace doesn't capture the message from errorf, that change
would lose the message altogether.

I kind of feel like once userspace is really making use of the message channel,
we could go back and selectively change printks to the message channel where it
makes sense.

>> +			return rc;;
> 
> There's an extra semicolon here.

Ugh, sorry.

>>  		}
>> +		ctx->sig_set = 1;
>> +		break;
>> +	case Opt_cipher:
>> +	case Opt_ecryptfs_cipher:
>> +		strscpy(mount_crypt_stat->global_default_cipher_name,
>> +			param->string);
>> +		ctx->cipher_name_set = 1;
>> +		break;
>> +	case Opt_ecryptfs_key_bytes:
>> +		mount_crypt_stat->global_default_cipher_key_size =
>> +			result.uint_32;
>> +		ctx->cipher_key_bytes_set = 1;
>> +		break;
>> +	case Opt_passthrough:
>> +		mount_crypt_stat->flags |=
>> +			ECRYPTFS_PLAINTEXT_PASSTHROUGH_ENABLED;
>> +		break;
>> +	case Opt_xattr_metadata:
>> +		mount_crypt_stat->flags |= ECRYPTFS_XATTR_METADATA_ENABLED;
>> +		break;
>> +	case Opt_encrypted_view:
>> +		mount_crypt_stat->flags |= ECRYPTFS_XATTR_METADATA_ENABLED;
>> +		mount_crypt_stat->flags |= ECRYPTFS_ENCRYPTED_VIEW_ENABLED;
>> +		break;
>> +	case Opt_fnek_sig:
>> +		strscpy(mount_crypt_stat->global_default_fnek_sig,
>> +			param->string);
>> +		rc = ecryptfs_add_global_auth_tok(
>> +			mount_crypt_stat,
>> +			mount_crypt_stat->global_default_fnek_sig,
>> +			ECRYPTFS_AUTH_TOK_FNEK);
>> +		if (rc) {
>> +			printk(KERN_ERR "Error attempting to register "
>> +			       "global fnek sig [%s]; rc = [%d]\n",
>> +			       mount_crypt_stat->global_default_fnek_sig, rc);
> 
> Same errorf() question here.

Same answer. :) If you don't mind those messages disappearing from kernel logs
I can change it.

>> +			return rc;
>> +		}
>> +		mount_crypt_stat->flags |=
>> +			(ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES
>> +			 | ECRYPTFS_GLOBAL_ENCFN_USE_MOUNT_FNEK);
>> +		break;
>> +	case Opt_fn_cipher:
>> +		strscpy(mount_crypt_stat->global_default_fn_cipher_name,
>> +			param->string);
>> +		ctx->fn_cipher_name_set = 1;
>> +		break;
>> +	case Opt_fn_cipher_key_bytes:
>> +		mount_crypt_stat->global_default_fn_cipher_key_bytes =
>> +			result.uint_32;
>> +		ctx->fn_cipher_key_bytes_set = 1;
>> +		break;
>> +	case Opt_unlink_sigs:
>> +		mount_crypt_stat->flags |= ECRYPTFS_UNLINK_SIGS;
>> +		break;
>> +	case Opt_mount_auth_tok_only:
>> +		mount_crypt_stat->flags |= ECRYPTFS_GLOBAL_MOUNT_AUTH_TOK_ONLY;
>> +		break;
>> +	case Opt_check_dev_ruid:
>> +		ctx->check_ruid = 1;
>> +		break;
>> +	default:
> 
> To retain the unrecognized option warning, I think we need this:
> 
> 
>                 printk(KERN_WARNING "%s: eCryptfs: unrecognized option [%s]\n",
>                        __func__, param->key);

I think you'll see that if you make that change, you never hit the default:
case and it's still not printed.

vfs_parse_fs_param() does do "invalf(fc, "%s: Unknown parameter '%s'", ..."
which sends the message back out over the api message interface, and modern util-linux
mount will emit it on the console.

For example (just since I had jfs handy and it's mount is simple) if I add:

        default:
                printk("default yo\n");
                return -EINVAL;

and try it:

# mount -o loop,blahblah jfsfile mnt
mount: /root/jfs-test/mnt: fsconfig system call failed: jfs: Unknown parameter 'blahblah'.
       dmesg(1) may have more information after failed mount system call.
# dmesg | tail -n 2
[61556.764697] JFS: nTxBlock = 8192, nTxLock = 65536
[61561.280700] loop1: detected capacity change from 0 to 204800
#

Thanks for the review, and sorry for the missed nitpicks.
-Eric


> Tyler


