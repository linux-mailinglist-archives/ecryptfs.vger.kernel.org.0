Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8387315F26B
	for <lists+ecryptfs@lfdr.de>; Fri, 14 Feb 2020 19:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392850AbgBNSJQ (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Fri, 14 Feb 2020 13:09:16 -0500
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:43576 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392849AbgBNSJQ (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Fri, 14 Feb 2020 13:09:16 -0500
X-Greylist: delayed 441 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Feb 2020 13:09:15 EST
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 48K1RQ3TSXz9vZTY
        for <ecryptfs@vger.kernel.org>; Fri, 14 Feb 2020 18:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XuPeRCqwPP7Y for <ecryptfs@vger.kernel.org>;
        Fri, 14 Feb 2020 12:01:54 -0600 (CST)
Received: from mail-yw1-f72.google.com (mail-yw1-f72.google.com [209.85.161.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 48K1RQ2K63z9vZTk
        for <ecryptfs@vger.kernel.org>; Fri, 14 Feb 2020 12:01:54 -0600 (CST)
Received: by mail-yw1-f72.google.com with SMTP id 206so7036547ywt.3
        for <ecryptfs@vger.kernel.org>; Fri, 14 Feb 2020 10:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=subject:to:cc:references:in-reply-to:from:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=pYWIECtn8aDrMNtySZ1V/LxrQeF+fHrO5BZKWhubLdY=;
        b=mFSUtiFbPGJ+jvlssT4lthfvbWO9cBGvSi2IVJn7EVVpY/hXgMKUg91Eg1BKdsS7aD
         fDTCovQCVqze8d1t2H/18gNHjtfE0702W5eqm7l82yIEPS6pSmM2yCSv+FDlz1jsESXE
         frjzz2RCfzVVcQUAiZTY7sK6/dy5w3RX8n1LZgXpv7TNtUAX7XdCQh8blfJwC9O2r/aY
         ym+AwMRHRNvO4QbVPIt5JB78mNFHi1JoC+kaUZa8DsOiGADlpB/tITALpxxgSj1wlQ2L
         +YIHXCYRW6TGHDfKEuJ2SItr777Wm7W4Huw80E3bZ76e4ipMl3GYI4yFnfgTsoV/LIVR
         UQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:in-reply-to:from
         :message-id:date:user-agent:mime-version:content-language
         :content-transfer-encoding;
        bh=pYWIECtn8aDrMNtySZ1V/LxrQeF+fHrO5BZKWhubLdY=;
        b=WOmtduPOQu5cxQvde0zvIW75c8Lv12WuL2Gad/3wVFqwR4C7IH9Jh0VQ2+38SiLr47
         dw6EeReRTOz3GWnFW2s07lSYu3ZrB38yuxGVPeYCYB/8521p7yWXp8cuPcn4SastQDni
         tSsR4GyDYQt95jSROPyhLK40ZOHAFE0RPIt/STW0snjL7VIzX9si+NoBj3mq9NuRKOr6
         R3AkzQZMHphGbe8lDcmjrJFpd3x/Ks1vU/1IH8EClgFYeV53qRkaS1tBIWm+Wl2chU4K
         9LPwC1iXJPpXBZcSK1ZF3nzWyfaMyEP8IvF2tK5YNLXS1gKMqXq31A2W/PvV+X8c1Ljf
         WobQ==
X-Gm-Message-State: APjAAAVzEabKEJSCpKAVQp51WTNN5ZOJwK5EXm6gGYRke+wgiR5tgdrT
        v0e6iWt5jWNd9jK/o3amTNxtPwqgpvDjnip4Fs7XqC+0kF1fFUdoUGZclblvNeBcQ6X0juY2PtA
        CTHMwz7wGm4j+Gh+M2mHwqwU=
X-Received: by 2002:a25:ce91:: with SMTP id x139mr3952141ybe.336.1581703313426;
        Fri, 14 Feb 2020 10:01:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqxEdLx4j1GqpTmR3PwKqjlopSJDXBlgmIO+PHQz5D00SVwcApq/sDcUE3ZOELHCEybG/NvClA==
X-Received: by 2002:a25:ce91:: with SMTP id x139mr3952073ybe.336.1581703312669;
        Fri, 14 Feb 2020 10:01:52 -0800 (PST)
Received: from [128.101.106.66] (cs-u-syssec1.cs.umn.edu. [128.101.106.66])
        by smtp.gmail.com with ESMTPSA id m15sm2899909ywh.78.2020.02.14.10.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 10:01:52 -0800 (PST)
Subject: Re: [PATCH] ecryptfs: replace BUG_ON with error handling code
To:     Tyler Hicks <tyhicks@canonical.com>
Cc:     kjlu@umn.edu, ecryptfs@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191215172404.28204-1-pakki001@umn.edu>
 <20200214173818.GB250165@elm>
In-Reply-To: <20200214173818.GB250165@elm>
From:   Aditya Pakki <pakki001@umn.edu>
Message-ID: <710ceeb1-6b88-4361-d199-414e0714c78f@umn.edu>
Date:   Fri, 14 Feb 2020 12:01:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

On 2/14/20 11:38 AM, Tyler Hicks wrote:
> On 2019-12-15 11:24:04, Aditya Pakki wrote:
>> In crypt_scatterlist, if the crypt_stat argument is not set up
>> correctly, we avoid crashing, by returning the error upstream.
>> This patch performs the fix.
>>
>> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> 
> Hi Aditya - I wanted to check in to see if you are able to submit a new
> revision taking into account the feedback from Markus.
> 
> Also, I'm curious if you've been able to hit this BUG_ON() or if you are
> just being proactive in cleaning up this function?
> 
> Let me know if I can help you prepare a v2 of this patch. Thanks!
> 
> Tyler
> 
>> ---
>>  fs/ecryptfs/crypto.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
>> index f91db24bbf3b..a064b408d841 100644
>> --- a/fs/ecryptfs/crypto.c
>> +++ b/fs/ecryptfs/crypto.c
>> @@ -311,8 +311,10 @@ static int crypt_scatterlist(struct ecryptfs_crypt_stat *crypt_stat,
>>  	struct extent_crypt_result ecr;
>>  	int rc = 0;
>>  
>> -	BUG_ON(!crypt_stat || !crypt_stat->tfm
>> -	       || !(crypt_stat->flags & ECRYPTFS_STRUCT_INITIALIZED));
>> +	if (!crypt_stat || !crypt_stat->tfm
>> +	       || !(crypt_stat->flags & ECRYPTFS_STRUCT_INITIALIZED))
>> +		return -EINVAL;
>> +
>>  	if (unlikely(ecryptfs_verbosity > 0)) {
>>  		ecryptfs_printk(KERN_DEBUG, "Key size [%zd]; key:\n",
>>  				crypt_stat->key_size);
>> -- 
>> 2.20.1
>>

The bug was detected by a static analysis tool and have not encountered it. I can send a v2 right away.
