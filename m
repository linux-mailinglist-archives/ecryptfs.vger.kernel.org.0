Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12E9242FF5
	for <lists+ecryptfs@lfdr.de>; Wed, 12 Aug 2020 22:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgHLUSM (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Wed, 12 Aug 2020 16:18:12 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:58436 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbgHLUSL (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Wed, 12 Aug 2020 16:18:11 -0400
Received: from [84.62.166.10] (helo=[192.168.2.50])
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <onkobu@onkobutanaake.de>)
        id 1k5xCL-0006o2-2o
        for ecryptfs@vger.kernel.org; Wed, 12 Aug 2020 22:18:09 +0200
To:     ecryptfs@vger.kernel.org
From:   Onkobu Tanaake <onkobu@onkobutanaake.de>
Subject: Re: Python 3 compatibility
Autocrypt: addr=onkobu@onkobutanaake.de; keydata=
 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
 amLqCn7VATxL5NjK
Message-ID: <e6818e67-9d2e-5bdb-fd14-393d23f43d75@onkobutanaake.de>
Date:   Wed, 12 Aug 2020 22:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jmVGYu0LjpUMpnlxSDwyK60dnCFaQpKEe"
X-Con-Id: 85297
X-Con-U: 0-onkobu
X-Originating-IP: 84.62.166.10
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jmVGYu0LjpUMpnlxSDwyK60dnCFaQpKEe
Content-Type: multipart/mixed; boundary="qFZyL78ekXDat09Xf41y6ZnmTZ9B3bj2l"

--qFZyL78ekXDat09Xf41y6ZnmTZ9B3bj2l
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hi,

Maybe this is not the correct place to ask, let me know then.

At least Debian dropped python bindings entirely. Gentoo is undecided
yet but seems as if they're going the same way. Arch still supports
Python 2(.7). Maybe they're just waiting for things getting solved.

Are there any plans to have a successor of ecryptfs-utils 111 with a
final solution?

Regards, onkobu

--=20
------
Web: http://onkobutanaake.de - mit RSS-Feed
Verschl=C3=BCsselte/ signierte Elektropost (PGP/GPG) an diese Adresse bev=
orzugt,
=C3=B6ffentlicher Schl=C3=BCssel http://onkobutanaake.de/onkobutanaake.as=
c
-
Encrypted/ signed electro-mail (PGP/GPG) to this address preferred,
public key http://onkobutanaake.de/onkobutanaake.asc

Fingerprint 6261 2530 89DA 93E3 2D9F  A0C2 B660 481D 9F77 A942


--qFZyL78ekXDat09Xf41y6ZnmTZ9B3bj2l--

--jmVGYu0LjpUMpnlxSDwyK60dnCFaQpKEe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEETex7HgdMXnYgnmJRJAu0YVECulcFAl80To4ACgkQJAu0YVEC
ulfWYAgAmj0BLGKTqyBuDI9Ql0mVkJqkDpg977kY6eV1LDnTtKXX7S/7Z+SmDLv3
No7jprmKkKRtk527fpXAyUc0aLkg9693cuu084mvg59JYohIvQyKnGMJNSET8jBM
ysRP6QXuCL188Rw+8oNT/VeqrGzJB2yfeWlNXmsbuA2qaezQOb8KIj4LHi3qVjJx
hc73CZOfbkk1/HEKS9vZImpzqlL7fdMynvxO8s8kuIaiREarGsX+o4+dV+xBLrkM
gZ4us2eQYNM32MTK/46rr1Pwy4pK8mxiusVzSNCHx9rGBKv4x750ZKgZnnbUvsH6
ipIXbffaMs9D+TD22YZD3zlcZ4CMeA==
=MHcW
-----END PGP SIGNATURE-----

--jmVGYu0LjpUMpnlxSDwyK60dnCFaQpKEe--
