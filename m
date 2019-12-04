Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0D88112C45
	for <lists+ecryptfs@lfdr.de>; Wed,  4 Dec 2019 14:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfLDNGe (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 4 Dec 2019 08:06:34 -0500
Received: from smtpoutz23.laposte.net ([194.117.213.98]:41340 "EHLO
        smtp.laposte.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727445AbfLDNGe (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Wed, 4 Dec 2019 08:06:34 -0500
Received: from smtp.laposte.net (localhost [127.0.0.1])
        by lpn-prd-vrout011 (Postfix) with ESMTP id D7D7E530C6C
        for <ecryptfs@vger.kernel.org>; Wed,  4 Dec 2019 14:06:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=mail0;
        t=1575464790; bh=QoIoJNvQPoGhf1mEusSBQCFVb/hmuGDTkK983LBNhUA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=IVjMPm635PtB2Yl7mYU30crQdS480bPi7jOE3zVI1J9Xa55WFhJQYQ87r5VIZ2qny
         QYI8Fwe5PpySZWTBSyzmtuS4BYB2cGQCQaUGt9zABQuvyEM5d4CLHDoZ+PiI3cXFV1
         fEbSqLB8Y1fGWVe6DonfAoI8eJ0laFwDU2H2sflNp405NQyyZ2Cy1UKXdi4e1vEJaW
         n4m3bcglSXgT74zsTVnI6l3IYI7li5HROizHwu9s9iNjQG75TbZwD7qAyxPJyMOP8Q
         UvlYgKDRtmZPguV2rA8+fYRbKXqawoyAgqTsISfYiYTdmYMQ2SreNRPiDShLS3xKXG
         +JYSYp4V+F35Q==
Received: from smtp.laposte.net (localhost [127.0.0.1])
        by lpn-prd-vrout011 (Postfix) with ESMTP id C9A9B530C6D
        for <ecryptfs@vger.kernel.org>; Wed,  4 Dec 2019 14:06:30 +0100 (CET)
Received: from lpn-prd-vrin003 (lpn-prd-vrin003.prosodie [10.128.63.4])
        by lpn-prd-vrout011 (Postfix) with ESMTP id C4820530C6C
        for <ecryptfs@vger.kernel.org>; Wed,  4 Dec 2019 14:06:30 +0100 (CET)
Received: from lpn-prd-vrin003 (localhost [127.0.0.1])
        by lpn-prd-vrin003 (Postfix) with ESMTP id B02B94A725D
        for <ecryptfs@vger.kernel.org>; Wed,  4 Dec 2019 14:06:30 +0100 (CET)
Received: from [192.168.1.18] (lfbn-mar-1-801-152.w92-150.abo.wanadoo.fr [92.150.127.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by lpn-prd-vrin003 (Postfix) with ESMTPSA id 4C5A04A7228;
        Wed,  4 Dec 2019 14:06:29 +0100 (CET)
Subject: Re: [PATCH] fs: introduce is_dot_dotdot helper for cleanup
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Tyler Hicks <tyhicks@canonical.com>,
        linux-fsdevel@vger.kernel.org, ecryptfs@vger.kernel.org,
        linux-fscrypt@vger.kernel.org,
        linux-f2fs-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
References: <1575281413-6753-1-git-send-email-yangtiezhu@loongson.cn>
 <20191202200302.GN20752@bombadil.infradead.org>
 <357ad021-a58c-ad46-42bd-d5012126276f@loongson.cn>
From:   Jean-Louis Biasini <jl.biasini@laposte.net>
X-Pep-Version: 2.0
Message-ID: <12554a8e-2899-f03f-ec3d-d4cf35c4dd71@laposte.net>
Date:   Wed, 4 Dec 2019 14:06:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <357ad021-a58c-ad46-42bd-d5012126276f@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-VR-FullState: 0
X-VR-Score: -100
X-VR-Cause-1: gggruggvucftvghtrhhoucdtuddrgedufedrudejledggeejucetufdoteggodetrfdotffvucfrrhho
X-VR-Cause-2: fhhilhgvmecunfetrffquffvgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhht
X-VR-Cause-3: shculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthhqredttdefjeenucfhrhhomhep
X-VR-Cause-4: lfgvrghnqdfnohhuihhsuceuihgrshhinhhiuceojhhlrdgsihgrshhinhhisehlrghpohhsthgvrdhn
X-VR-Cause-5: vghtqeenucfkphepledvrdduhedtrdduvdejrdduhedvnecurfgrrhgrmhepmhhouggvpehsmhhtphho
X-VR-Cause-6: uhhtpdhinhgvthepledvrdduhedtrdduvdejrdduhedvpdhhvghloheplgduledvrdduieekrddurddu
X-VR-Cause-7: kegnpdhmrghilhhfrhhomhepjhhlrdgsihgrshhinhhisehlrghpohhsthgvrdhnvghtpdhrtghpthht
X-VR-Cause-8: oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
X-VR-Cause-9: nhhugidqfhdvfhhsqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghp
X-VR-Cause-10: thhtoheplhhinhhugidqfhhstghrhihpthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
X-VR-Cause-11: pegvtghrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhf
X-VR-Cause-12: shguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthihhhhitghkshestggr
X-VR-Cause-13: nhhonhhitggrlhdrtghomhdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhr
X-VR-Cause-14: tghpthhtohephihutghhrghotdeshhhurgifvghirdgtohhmpdhrtghpthhtohepjhgrvghgvghukhes
X-VR-Cause-15: khgvrhhnvghlrdhorhhgpdhrtghpthhtohepthihthhsohesmhhithdrvgguuhdprhgtphhtthhopehv
X-VR-Cause-16: ihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepfihilhhlhiesihhnfhhr
X-VR-Cause-17: rgguvggrugdrohhrghdprhgtphhtthhopeihrghnghhtihgviihhuheslhhoohhnghhsohhnrdgtnhen
X-VR-Cause-18: ucevlhhushhtvghrufhiiigvpedt
X-VR-AvState: No
X-VR-State: 0
X-VR-State: 0
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Please UNSUBSCRIBE ME from this list of tell how to!!!

Le 03/12/2019 =C3=A0 03:07, Tiezhu Yang a =C3=A9crit=C2=A0:
> On 12/03/2019 04:03 AM, Matthew Wilcox wrote:
>> On Mon, Dec 02, 2019 at 06:10:13PM +0800, Tiezhu Yang wrote:
>>> There exists many similar and duplicate codes to check "." and "..",
>>> so introduce is_dot_dotdot helper to make the code more clean.
>> The idea is good.=C2=A0 The implementation is, I'm afraid, badly chose=
n.
>> Did you benchmark this change at all?=C2=A0 In general, you should pre=
fer the
>> core kernel implementation to that of some less-interesting filesystem=
s.
>> I measured the performance with the attached test program on my laptop=

>> (Core-i7 Kaby Lake):
>>
>> qstr . time_1 0.020531 time_2 0.005786
>> qstr .. time_1 0.017892 time_2 0.008798
>> qstr a time_1 0.017633 time_2 0.003634
>> qstr matthew time_1 0.011820 time_2 0.003605
>> qstr .a time_1 0.017909 time_2 0.008710
>> qstr , time_1 0.017631 time_2 0.003619
>>
>> The results are quite stable:
>>
>> qstr . time_1 0.021137 time_2 0.005780
>> qstr .. time_1 0.017964 time_2 0.008675
>> qstr a time_1 0.017899 time_2 0.003654
>> qstr matthew time_1 0.011821 time_2 0.003620
>> qstr .a time_1 0.017889 time_2 0.008662
>> qstr , time_1 0.017764 time_2 0.003613
>>
>> Feel free to suggest some different strings we could use for testing.
>> These seemed like interesting strings to test with.=C2=A0 It's always
>> possible
>> I've messed up something with this benchmark that causes it to not
>> accurately represent the performance of each algorithm, so please chec=
k
>> that too.
>
> [Sorry to resend this email because the mail list server
> was denied due to it is not plain text.]
>
> Hi Matthew,
>
> Thanks for your reply and suggestion. I measured the
> performance with the test program, the following
> implementation is better for various of test cases:
>
> bool is_dot_dotdot(const struct qstr *str)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(str->name[0] =3D=
=3D '.')) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (str->len < 2 || (str->len =3D=3D 2 && str->name[1]=
 =3D=3D
> '.'))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
 true;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> }
>
> I will send a v2 patch used with this implementation.
>
> Thanks,
>
> Tiezhu Yang
>
>>
>>> +bool is_dot_dotdot(const struct qstr *str)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 if (str->len =3D=3D 1 && str->name[0] =3D=3D '.')=

>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (str->len =3D=3D 2 && str->name[0] =3D=3D '.' =
&& str->name[1] =3D=3D '.')
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return false;
>>> +}
>>> +EXPORT_SYMBOL(is_dot_dotdot);
>>> diff --git a/fs/namei.c b/fs/namei.c
>>> index 2dda552..7730a3b 100644
>>> --- a/fs/namei.c
>>> +++ b/fs/namei.c
>>> @@ -2458,10 +2458,8 @@ static int lookup_one_len_common(const char
>>> *name, struct dentry *base,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!len)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EACCES=
;
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (unlikely(name[0] =3D=3D '.')) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (len < 2 || (len =3D=3D=
 2 && name[1] =3D=3D '.'))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn -EACCES;
>>> -=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 if (unlikely(is_dot_dotdot(this)))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EACCES;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (len--) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int c=
 =3D *(const unsigned char *)name++;
>

