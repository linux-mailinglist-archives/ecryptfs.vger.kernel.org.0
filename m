Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6796311FB73
	for <lists+ecryptfs@lfdr.de>; Sun, 15 Dec 2019 22:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbfLOVUf (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 15 Dec 2019 16:20:35 -0500
Received: from mout.web.de ([217.72.192.78]:60405 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726146AbfLOVUf (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Sun, 15 Dec 2019 16:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1576444830;
        bh=PoRAbmWi84Q8y/jIJM9+FC+iokT8ysBmn4baxVcyUq0=;
        h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
        b=XqM9JUEIhtemRApo9rS5rumsZtxjN+mVXJT0gS2MWJMIFmLAXG1hV/jcLE6IuB3kU
         kUGZbOz4BGbAR8IXSlneh1pRqd/AV+ADdMIc9GWhkcWNANlio34gbOtctimoj2NOLs
         mzo6/CWNLJjYmXqJ93I6Ga0hM6enuvyvR5N7sUCo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.243.76.50]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MhDkj-1iKxix1Lvt-00MKHl; Sun, 15
 Dec 2019 22:20:30 +0100
Cc:     linux-kernel@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
        Tyler Hicks <tyhicks@canonical.com>
References: <20191215172404.28204-1-pakki001@umn.edu>
Subject: Re: [PATCH] ecryptfs: replace BUG_ON with error handling code
To:     Aditya Pakki <pakki001@umn.edu>, ecryptfs@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <098249a9-cf0b-720d-766b-1acdeb78fe22@web.de>
Date:   Sun, 15 Dec 2019 22:20:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191215172404.28204-1-pakki001@umn.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TGfvfr/fZ/skywFFmbcvsQVYSRXf0ELoVdjH3H4GAphtVPhkZcg
 82lz6X6zCnfC4mzh3gyQ/EeI54jDxJk0Wx2y8W8I/KyjPvUIc8JBbzNq2W/4D1fWwKc+ved
 p0pewtWVlTY5P4Zpupx/kPVAhjvMRyVzWJkDWE6ZWnGj8IYBS3L1hCNJLk8yODeHvDlXZ4K
 qbXQRnSFsGGFGv9BgkPGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:303a3KvU9OA=:znwDz/RFWjYJnAeQgAS7lS
 yddFrCYJ+GuOYdi/3khg39oMo79/Ugqjzt2ZlCF8RK4iyy3TXvd9Uey5Zf5nlCiArpVMruemC
 BA6StTxC3qFbymPS6dfWSr+FWmrp8IyVk/W1K9REqQPLIPimRKdLmk3oAtV9utwTXmqCP6GhB
 WXfDjB6pOgUR2ilz07UDdkIxTXidAuPZlge6LFFH+GniYtzfCLS0Cuuvj8OlDKBtUs4zWoMcC
 OHPZJ85kYDWkHg8RDhza7swrAkmvUbj6UYYZgGAr9FPv8+szSdwuT81uBSu8E74zd1eGqYc7A
 ff2g8ZWC+W1SRKJmTUPlIFsUohvv/w+KT0+EhJa7sS0AW7Kj1V/O6u5XfBLkfIC1+CA1mdffE
 LlkQd/17kkuD9FRNI7HomV8MdBpi8F9moUiRVuZTtgjeUE2Nz8tiAb8Y9RE5B88+idhnF6Gtn
 Ek2j7L0FYXt5rrR43gpQwblGjcT6Rb1W+fWgKgca+IkYCq36279x1EFOxgbRKChOYQglvfW+Q
 mXuLPu3BKPTMnRIqlSMXwVEH+2o93STGIRgvAbhRFv42jBf0OjyjKyJgzQ4UhgSzxMLlz9JW9
 3cwfQoVyHPgEOXIww+N7XKc3Vv+5a51LZ8lOlbewj+x+3LCYpbs5Ze19k2zi9ua1Kqse2aQPO
 jWbdyp4Cci0LN/+KuMx2VeeGLBHxiQ3QJuI2CZ6Ivvd5wMsMWmIUtKVYx+nbNp5v6chtz4HC+
 0e4932O+hE37Okgieom0DAYakmj6ZEUXY3iwH+2x/wXoF20kdoQs+0u3HX0Bz0NamS5ueknMY
 eVtrYDU/lyWugzvK1CRbsI8Yi1aB3N4h3VD4JuPRiUkJ30gPb/OSYt56ufIJl7i8XJMew5s6Y
 T3RWK5XqQ1CXn43Qcl0Nkk+QNqGtQMyGojGKvZxHo0FjidEb3eVSqxHrgWk4oAghNNHKkKnn6
 +UD5+iR+3Hgg27SbzBhvJiKHAG0yCoe2eubr1p9YSzqpdJ4KfyA4NwOY1Gbn35XnwBSBf2Rqj
 hD5dX+GpTIH9fBalsVGV2gneLZHtPwEI/LmcEdfDuCdnxhX0y/js1x2JU7y/Li5B46Kh0AsWf
 PthdmHYYqpZLu7J515nxoAHHyu+NXO2ZIZ1OauKwOGNVaR1DSJbrRATJZVSbQ24fDa7Bs0Jjk
 EM/AlY658Yr0FA0lsfx5L9MWj/kOU/5DC1rLlOx9M9dMD2nqBkCA3hO+f+RFUN8YDHuEeUAf4
 J3RPGMr7b+LzXFQXuDWOzQH4aEV6qHDqJ5SabCcLluMSAb5C4uQXKiQXTYQs=
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

> In crypt_scatterlist, if the crypt_stat argument is not set up
> correctly, we avoid crashing, by returning the error upstream.

Can an other change description be more helpful here?


> This patch performs the fix.

Please replace this sentence by the tag =E2=80=9CFixes=E2=80=9D.

Regards,
Markus
