Return-Path: <ecryptfs+bounces-1215-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAZOMT5v12k5OAgAu9opvQ
	(envelope-from <ecryptfs+bounces-1215-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Thu, 09 Apr 2026 11:19:58 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E113C85F0
	for <lists+ecryptfs@lfdr.de>; Thu, 09 Apr 2026 11:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 467B53015530
	for <lists+ecryptfs@lfdr.de>; Thu,  9 Apr 2026 09:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC713AC0F2;
	Thu,  9 Apr 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=manufacture.adhesive-solutions.ltd header.i=@manufacture.adhesive-solutions.ltd header.b="MW0w+aIr"
X-Original-To: ecryptfs@vger.kernel.org
Received: from ptr-hk-43-163-128-75.qcloudmail.com (ptr-hk-43-163-128-75.qcloudmail.com [43.163.128.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2743A961F
	for <ecryptfs@vger.kernel.org>; Thu,  9 Apr 2026 09:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725495; cv=none; b=bVwprdtk1n7hmmrffEWNsaSpGRi8Tw3GgUAhkaXgise1Kqzp+1fotjbQIwIknVGORVf8Wid1MUR4bfao2sVXFN1++7zOwAl86A2fYwPbjgyRpPHWE6a3qwyEuceyl38T6sql90mPpx9mC5TO/KaOOigJMgSTLWEiIS2dnh5mHcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725495; c=relaxed/simple;
	bh=7fUQ5OKRVuQ49NfKvTD3Z4AqK+fNFD4UY81gKfaDyoE=;
	h=Mime-Version:Date:Message-Id:To:From:Subject:Content-Type; b=iADJ6MAY3HRS/LV331cWLT3rolUn5uy6TSfR7hQ1WUoK/Y/+Nqm7TVJX8riHtYEXp/NM4PZU29QC49PlLPvM9UDDIN8YR2TiXhExUNyrWyHTNSt4tAn5/R6fxXxWUMVHxnhaGExMLjM2tJDizPI9Zm8z7Nc7y4qcrIfLz3qayGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=manufacture.adhesive-solutions.ltd; spf=pass smtp.mailfrom=manufacture.adhesive-solutions.ltd; dkim=pass (1024-bit key) header.d=manufacture.adhesive-solutions.ltd header.i=@manufacture.adhesive-solutions.ltd header.b=MW0w+aIr; arc=none smtp.client-ip=43.163.128.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=manufacture.adhesive-solutions.ltd
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manufacture.adhesive-solutions.ltd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=qcloud; d=manufacture.adhesive-solutions.ltd; t=1775725471;
  h=from:to:subject:content-type:content-transfer-encoding;
 bh=z2ZEjaplk0CTf5LzAze/2d/L85YqfPlux/5HBtZnJoQ=;
 b=MW0w+aIrgF1XoTPWhXnX7NrdE+qM83S8Y5gj8EoRYworXw08Hbgnc3aZe8HOBI7qvF/8RH
 ROcDLrW0HA0L7nDLldCGg0AFr0515nTbbnN+KDGVA2nPlVNUqkhkAoisuA+03HwksOzz5c
 KyYrF3QV9mXHRZZWUUh6XxMhPOXjEY8=
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 09 Apr 2026 17:04:31 +0800
Message-Id: <20260409170426598.LeoMax@manufacture.adhesive-solutions.ltd>
To: Ecryptfs <ecryptfs@vger.kernel.org>
Reply-To: sale07@epoxyresinfactory.com
From: Mia Chen <LeoMax@manufacture.adhesive-solutions.ltd>
Subject: Heavy-Duty PU Mortar Flooring: 58MPa Strength for Food/Pharma Facilities
Content-Type: multipart/mixed;
 boundary=87c0ba79db00b21e19d8b628d231376f2fd979cca22d80623268a2ed2f36
X-Spamd-Result: default: False [7.34 / 15.00];
	R_SUSPICIOUS_URL(5.00)[www.epoxyresinfactory.com,zdschemical.com];
	PHISHING(2.00)[epoxyresinfactory.com->com,zdschemical.com];
	CTYPE_MIXED_BOGUS(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[manufacture.adhesive-solutions.ltd,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[manufacture.adhesive-solutions.ltd:s=qcloud];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1215-lists,ecryptfs=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[manufacture.adhesive-solutions.ltd:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.124];
	FROM_NEQ_ENVFROM(0.00)[LeoMax@manufacture.adhesive-solutions.ltd,ecryptfs@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[ecryptfs];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[sale07@epoxyresinfactory.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,epoxyresinfactory.com:replyto,epoxyresinfactory.com:url,manufacture.adhesive-solutions.ltd:dkim,manufacture.adhesive-solutions.ltd:mid]
X-Rspamd-Queue-Id: 94E113C85F0
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

--87c0ba79db00b21e19d8b628d231376f2fd979cca22d80623268a2ed2f36
Content-Type: multipart/alternative;
 boundary=c80ec79a5148ca0e76fb4d774a6c34d0d9ad8ed47935ebb9f000e0e62fa3

--c80ec79a5148ca0e76fb4d774a6c34d0d9ad8ed47935ebb9f000e0e62fa3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

=0D
HiEcryptfs=0D
I hope this email finds you well.=0D
=0D
I'mMiaChen from ZDS, a specialist in high-performance flooring solutions fo=
r demanding sectors like food &amp; beverage, pharmaceutical, and chemical =
industries.=0D
In these environments, flooring must withstand heavy loads, chemical exposu=
re, thermal shock, and meet high hygiene standards. OurZDS Heavy-Duty Slip-=
Resistant Polyurethane Mortar Flooringis specifically engineered to meet th=
ese challenges.=0D
Key benefits include:=0D
=0D
=E2=9C=85Exceptional chemical resistance: Withstands acids, alkalis, and cl=
eaning agents.=0D
=E2=9C=85Superior impact strength: Endures high-impact from forklifts and h=
eavy equipment.=0D
=E2=9C=85Excellent slip resistance: Ensures safety in wet or greasy conditi=
ons.=0D
=E2=9C=85Rapid return to service: Open to foot traffic in just 24 hours, mi=
nimizing downtime.=0D
We have a proven track record of providing reliable flooring solutions for =
many similar companies. I would be happy to share our experience and discus=
s how ZDS can help optimize your operations and enhance safety.=0D
Would you be available for a brief 15-minute call sometime next week, perha=
ps on [Specific Date, e.g., Wednesday morning], so I can elaborate further =
and address any questions you might have?=0D
=0D
=0D
=0D
Best regards,=0D
=0D
=0D
Mia Chen=0D
=0D
Sales Engineer=0D
=0D
=0D
Shenzhen Zhengdasheng Chemical Co.Ltd.Whatapp/WeChat: +86 17301929923=0D
Tel: 86-755-84875752Fax: 86-755-84875750Web:www.epoxyresinfactory.com,zdsch=
emical.comAdd:4th floor , Longyuntong Building, No. 164-5 Pengda Road, Long=
gang District, Shenzhen,China.=

--c80ec79a5148ca0e76fb4d774a6c34d0d9ad8ed47935ebb9f000e0e62fa3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<!DOCTYPE html><html><head><meta http-equiv=3D"Content-Type" content=3D"tex=
t/html; charset=3DUTF-8"/>
                                      <title>Heavy-Duty PU Mortar Flooring:=
 58MPa Strength for Food/Pharma Facilities</title></head><body><font size=
=3D"4">
<div class=3D"Y3BBE" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sans-ser=
if; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIG=
HT: 400; COLOR: rgb(10,10,10); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; L=
ETTER-SPACING: normal; LINE-HEIGHT: 24px; BACKGROUND-COLOR: rgb(255,255,255=
); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: nor=
mal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-d=
ecoration-color: initial; overflow-wrap: break-word; margin-block: 12px 16p=
x; text-decoration-thickness: initial" data-sfc-cp=3D"" jsaction=3D"rcuQ6b:=
&amp;zwewec_1k|npT2md" jscontroller=3D"zcfIf" jsuid=3D"zwewec_1k" data-hvei=
d=3D"CBIQAA" data-processed=3D"true" data-complete=3D"true">HiEcryptfs<br/>=
=C2=A0</div>
<div class=3D"Y3BBE" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sans-ser=
if; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIG=
HT: 400; COLOR: rgb(10,10,10); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; L=
ETTER-SPACING: normal; LINE-HEIGHT: 24px; BACKGROUND-COLOR: rgb(255,255,255=
); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: nor=
mal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-d=
ecoration-color: initial; overflow-wrap: break-word; margin-block: 12px 16p=
x; text-decoration-thickness: initial" data-sfc-cp=3D"" jsaction=3D"rcuQ6b:=
&amp;zwewec_1l|npT2md" jscontroller=3D"zcfIf" jsuid=3D"zwewec_1l" data-hvei=
d=3D"CBMQAA" data-processed=3D"true" data-complete=3D"true">I hope this ema=
il finds you well.</div>
<div class=3D"Y3BBE" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sans-ser=
if; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIG=
HT: 400; COLOR: rgb(10,10,10); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; L=
ETTER-SPACING: normal; LINE-HEIGHT: 24px; BACKGROUND-COLOR: rgb(255,255,255=
); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: nor=
mal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-d=
ecoration-color: initial; overflow-wrap: break-word; margin-block: 12px 16p=
x; text-decoration-thickness: initial" data-sfc-cp=3D"" jsaction=3D"rcuQ6b:=
&amp;zwewec_1m|npT2md" jscontroller=3D"zcfIf" jsuid=3D"zwewec_1m" data-hvei=
d=3D"CBQQAA" data-processed=3D"true" data-complete=3D"true"><br/>=C2=A0</di=
v>
<div class=3D"Y3BBE" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sans-ser=
if; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIG=
HT: 400; COLOR: rgb(10,10,10); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; L=
ETTER-SPACING: normal; LINE-HEIGHT: 24px; BACKGROUND-COLOR: rgb(255,255,255=
); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: nor=
mal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-d=
ecoration-color: initial; overflow-wrap: break-word; margin-block: 12px 16p=
x; text-decoration-thickness: initial" data-sfc-cp=3D"" jsaction=3D"rcuQ6b:=
&amp;zwewec_1m|npT2md" jscontroller=3D"zcfIf" jsuid=3D"zwewec_1m" data-hvei=
d=3D"CBQQAA" data-processed=3D"true" data-complete=3D"true">I'm=C2=A0MiaChe=
n =C2=A0from ZDS, a specialist in high-performance flooring solutions for d=
emanding sectors like food &amp; beverage, pharmaceutical, and chemical ind=
ustries.</div>
<div class=3D"Y3BBE" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sans-ser=
if; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIG=
HT: 400; COLOR: rgb(10,10,10); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; L=
ETTER-SPACING: normal; LINE-HEIGHT: 24px; BACKGROUND-COLOR: rgb(255,255,255=
); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: nor=
mal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-d=
ecoration-color: initial; overflow-wrap: break-word; margin-block: 12px 16p=
x; text-decoration-thickness: initial" data-sfc-cp=3D"" jsaction=3D"rcuQ6b:=
&amp;zwewec_1n|npT2md" jscontroller=3D"zcfIf" jsuid=3D"zwewec_1n" data-hvei=
d=3D"CBUQAA" data-processed=3D"true" data-complete=3D"true">In these enviro=
nments, flooring must withstand heavy loads, chemical exposure, thermal sho=
ck, and meet high hygiene standards. Our<span>=C2=A0</span><strong class=3D=
"Yjhzub" style=3D"FONT-WEIGHT: 700" jscontroller=3D"zYmgkd" jsuid=3D"zwewec=
_1o" data-processed=3D"true" data-complete=3D"true">ZDS Heavy-Duty Slip-Res=
istant Polyurethane Mortar Flooring</strong><span>=C2=A0</span>is specifica=
lly engineered to meet these challenges.</div>
<div class=3D"Y3BBE" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sans-ser=
if; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIG=
HT: 400; COLOR: rgb(10,10,10); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; L=
ETTER-SPACING: normal; LINE-HEIGHT: 24px; BACKGROUND-COLOR: rgb(255,255,255=
); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: nor=
mal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-d=
ecoration-color: initial; overflow-wrap: break-word; margin-block: 12px 16p=
x; text-decoration-thickness: initial" data-sfc-cp=3D"" jsaction=3D"rcuQ6b:=
&amp;zwewec_1p|npT2md" jscontroller=3D"zcfIf" jsuid=3D"zwewec_1p" data-hvei=
d=3D"CBYQAA" data-processed=3D"true" data-complete=3D"true">Key benefits in=
clude:</div>
<ul class=3D"KsbFXc U6u95" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sa=
ns-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FON=
T-WEIGHT: 400; COLOR: rgb(10,10,10); PADDING-BOTTOM: 0px; FONT-STYLE: norma=
l; PADDING-TOP: 0px; PADDING-LEFT: 0px; ORPHANS: 2; WIDOWS: 2; MARGIN: 0px;=
 LETTER-SPACING: normal; LINE-HEIGHT: 24px; PADDING-RIGHT: 0px; BACKGROUND-=
COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal; =
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
style: initial; text-decoration-color: initial; margin-block: 12px 16px; te=
xt-decoration-thickness: initial; padding-inline-start: 16px" jscontroller=
=3D"mPWODf" jsuid=3D"zwewec_1q" data-processed=3D"true" data-complete=3D"tr=
ue">
<li style=3D"LIST-STYLE-TYPE: disc; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; =
PADDING-LEFT: 0px; MARGIN: 0px 0px 12px; PADDING-RIGHT: 0px; padding-inline=
-start: 4px" jscontroller=3D"vsuOFb" jsuid=3D"zwewec_1r" data-hveid=3D"CBcQ=
AA" data-complete=3D"true" data-sae=3D""><span class=3D"T286Pc" style=3D"ov=
erflow-wrap: break-word" data-sfc-cp=3D"" jscontroller=3D"fly6D" jsuid=3D"z=
wewec_1s" data-complete=3D"true">=E2=9C=85<strong>Exceptional chemical resi=
stance</strong>: Withstands acids, alkalis, and cleaning agents.</span></li=
>
<li style=3D"LIST-STYLE-TYPE: disc; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; =
PADDING-LEFT: 0px; MARGIN: 0px 0px 12px; PADDING-RIGHT: 0px; padding-inline=
-start: 4px" jscontroller=3D"vsuOFb" jsuid=3D"zwewec_1u" data-hveid=3D"CBcQ=
AQ" data-complete=3D"true" data-sae=3D""><span class=3D"T286Pc" style=3D"ov=
erflow-wrap: break-word" data-sfc-cp=3D"" jscontroller=3D"fly6D" jsuid=3D"z=
wewec_1v" data-complete=3D"true">=E2=9C=85<strong>Superior impact strength<=
/strong>: Endures high-impact from forklifts and heavy equipment.</span></l=
i>
<li style=3D"LIST-STYLE-TYPE: disc; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; =
PADDING-LEFT: 0px; MARGIN: 0px 0px 12px; PADDING-RIGHT: 0px; padding-inline=
-start: 4px" jscontroller=3D"vsuOFb" jsuid=3D"zwewec_1x" data-hveid=3D"CBcQ=
Ag" data-complete=3D"true" data-sae=3D""><span class=3D"T286Pc" style=3D"ov=
erflow-wrap: break-word" data-sfc-cp=3D"" jscontroller=3D"fly6D" jsuid=3D"z=
wewec_1y" data-complete=3D"true">=E2=9C=85<strong>Excellent slip resistance=
</strong>: Ensures safety in wet or greasy conditions.</span></li>
<li style=3D"LIST-STYLE-TYPE: disc; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; =
PADDING-LEFT: 0px; MARGIN: 0px 0px 12px; PADDING-RIGHT: 0px; padding-inline=
-start: 4px" jscontroller=3D"vsuOFb" jsuid=3D"zwewec_20" data-hveid=3D"CBcQ=
Aw" data-complete=3D"true" data-sae=3D""><span class=3D"T286Pc" style=3D"ov=
erflow-wrap: break-word" data-sfc-cp=3D"" jscontroller=3D"fly6D" jsuid=3D"z=
wewec_21" data-complete=3D"true">=E2=9C=85<strong>Rapid return to service</=
strong>: Open to foot traffic in just 24 hours, minimizing downtime.</span>=
</li></ul>
<div class=3D"Y3BBE" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sans-ser=
if; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIG=
HT: 400; COLOR: rgb(10,10,10); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; L=
ETTER-SPACING: normal; LINE-HEIGHT: 24px; BACKGROUND-COLOR: rgb(255,255,255=
); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: nor=
mal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-d=
ecoration-color: initial; overflow-wrap: break-word; margin-block: 12px 16p=
x; text-decoration-thickness: initial" data-sfc-cp=3D"" jsaction=3D"rcuQ6b:=
&amp;zwewec_23|npT2md" jscontroller=3D"zcfIf" jsuid=3D"zwewec_23" data-hvei=
d=3D"CBgQAA" data-processed=3D"true" data-complete=3D"true">We have a prove=
n track record of providing reliable flooring solutions for many similar co=
mpanies. I would be happy to share our experience and discuss how ZDS can h=
elp optimize your operations and enhance safety.</div>
<div class=3D"Y3BBE" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sans-ser=
if; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIG=
HT: 400; COLOR: rgb(10,10,10); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; L=
ETTER-SPACING: normal; LINE-HEIGHT: 24px; BACKGROUND-COLOR: rgb(255,255,255=
); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: nor=
mal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-d=
ecoration-color: initial; overflow-wrap: break-word; margin-block: 12px 16p=
x; text-decoration-thickness: initial" data-sfc-cp=3D"" jsaction=3D"rcuQ6b:=
&amp;zwewec_24|npT2md" jscontroller=3D"zcfIf" jsuid=3D"zwewec_24" data-hvei=
d=3D"CBkQAA" data-processed=3D"true" data-complete=3D"true">Would you be av=
ailable for a brief 15-minute call sometime next week, perhaps on [Specific=
 Date, e.g., Wednesday morning], so I can elaborate further and address any=
 questions you might have?<br/></div>
<div class=3D"Y3BBE" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sans-ser=
if; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIG=
HT: 400; COLOR: rgb(10,10,10); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; L=
ETTER-SPACING: normal; LINE-HEIGHT: 24px; BACKGROUND-COLOR: rgb(255,255,255=
); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: nor=
mal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-d=
ecoration-color: initial; overflow-wrap: break-word; margin-block: 12px 16p=
x; text-decoration-thickness: initial" data-sfc-cp=3D"" jsaction=3D"rcuQ6b:=
&amp;zwewec_24|npT2md" jscontroller=3D"zcfIf" jsuid=3D"zwewec_24" data-hvei=
d=3D"CBkQAA" data-processed=3D"true" data-complete=3D"true"><br/>=C2=A0</di=
v>
<div class=3D"Y3BBE" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sans-ser=
if; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIG=
HT: 400; COLOR: rgb(10,10,10); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; L=
ETTER-SPACING: normal; LINE-HEIGHT: 24px; BACKGROUND-COLOR: rgb(255,255,255=
); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: nor=
mal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-d=
ecoration-color: initial; overflow-wrap: break-word; margin-block: 12px 16p=
x; text-decoration-thickness: initial" data-sfc-cp=3D"" jsaction=3D"rcuQ6b:=
&amp;zwewec_24|npT2md" jscontroller=3D"zcfIf" jsuid=3D"zwewec_24" data-hvei=
d=3D"CBkQAA" data-processed=3D"true" data-complete=3D"true"><br/>=C2=A0</di=
v>
<div class=3D"Y3BBE" style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, sans-ser=
if; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIG=
HT: 400; COLOR: rgb(10,10,10); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; L=
ETTER-SPACING: normal; LINE-HEIGHT: 24px; BACKGROUND-COLOR: rgb(255,255,255=
); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: nor=
mal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-d=
ecoration-color: initial; overflow-wrap: break-word; margin-block: 12px 16p=
x; text-decoration-thickness: initial" data-sfc-cp=3D"" jsaction=3D"rcuQ6b:=
&amp;zwewec_24|npT2md" jscontroller=3D"zcfIf" jsuid=3D"zwewec_24" data-hvei=
d=3D"CBkQAA" data-processed=3D"true" data-complete=3D"true">
<div style=3D"BACKGROUND: none transparent scroll repeat 0% 0%; WHITE-SPACE=
: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT: 4=
00 16px/24px ui-sans-serif, system-ui, sans-serif, &#34;Apple Color Emoji&#=
34;, &#34;Segoe UI Emoji&#34;, &#34;Segoe UI Symbol&#34;, &#34;Noto Color E=
moji&#34;; PADDING-LEFT: 0px; MARGIN: 0px; DISPLAY: block; PADDING-RIGHT: 0=
px; flex: 0 1 auto; flex-direction: row; justify-content: normal; align-ite=
ms: normal">Best regards,</div>
<div style=3D"BACKGROUND: none transparent scroll repeat 0% 0%; WHITE-SPACE=
: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT: 4=
00 16px/24px ui-sans-serif, system-ui, sans-serif, &#34;Apple Color Emoji&#=
34;, &#34;Segoe UI Emoji&#34;, &#34;Segoe UI Symbol&#34;, &#34;Noto Color E=
moji&#34;; PADDING-LEFT: 0px; MARGIN: 0px; DISPLAY: block; PADDING-RIGHT: 0=
px; flex: 0 1 auto; flex-direction: row; justify-content: normal; align-ite=
ms: normal"></div>
<div style=3D"BACKGROUND: none transparent scroll repeat 0% 0%; WHITE-SPACE=
: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT: 4=
00 16px/24px ui-sans-serif, system-ui, sans-serif, &#34;Apple Color Emoji&#=
34;, &#34;Segoe UI Emoji&#34;, &#34;Segoe UI Symbol&#34;, &#34;Noto Color E=
moji&#34;; PADDING-LEFT: 0px; MARGIN: 0px; DISPLAY: block; PADDING-RIGHT: 0=
px; flex: 0 1 auto; flex-direction: row; justify-content: normal; align-ite=
ms: normal"><br/>=C2=A0</div>
<div style=3D"BACKGROUND: none transparent scroll repeat 0% 0%; WHITE-SPACE=
: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT: 4=
00 16px/24px ui-sans-serif, system-ui, sans-serif, &#34;Apple Color Emoji&#=
34;, &#34;Segoe UI Emoji&#34;, &#34;Segoe UI Symbol&#34;, &#34;Noto Color E=
moji&#34;; PADDING-LEFT: 0px; MARGIN: 0px; DISPLAY: block; PADDING-RIGHT: 0=
px; flex: 0 1 auto; flex-direction: row; justify-content: normal; align-ite=
ms: normal">Mia Chen</div>
<div style=3D"BACKGROUND: none transparent scroll repeat 0% 0%; WHITE-SPACE=
: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT: 4=
00 16px/24px ui-sans-serif, system-ui, sans-serif, &#34;Apple Color Emoji&#=
34;, &#34;Segoe UI Emoji&#34;, &#34;Segoe UI Symbol&#34;, &#34;Noto Color E=
moji&#34;; PADDING-LEFT: 0px; MARGIN: 0px; DISPLAY: block; PADDING-RIGHT: 0=
px; flex: 0 1 auto; flex-direction: row; justify-content: normal; align-ite=
ms: normal"></div>
<div style=3D"BACKGROUND: none transparent scroll repeat 0% 0%; WHITE-SPACE=
: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT: 4=
00 16px/24px ui-sans-serif, system-ui, sans-serif, &#34;Apple Color Emoji&#=
34;, &#34;Segoe UI Emoji&#34;, &#34;Segoe UI Symbol&#34;, &#34;Noto Color E=
moji&#34;; PADDING-LEFT: 0px; MARGIN: 0px; DISPLAY: block; PADDING-RIGHT: 0=
px; flex: 0 1 auto; flex-direction: row; justify-content: normal; align-ite=
ms: normal">Sales Engineer</div>
<div style=3D"BACKGROUND: none transparent scroll repeat 0% 0%; WHITE-SPACE=
: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT: 4=
00 16px/24px ui-sans-serif, system-ui, sans-serif, &#34;Apple Color Emoji&#=
34;, &#34;Segoe UI Emoji&#34;, &#34;Segoe UI Symbol&#34;, &#34;Noto Color E=
moji&#34;; PADDING-LEFT: 0px; MARGIN: 0px; DISPLAY: block; PADDING-RIGHT: 0=
px; flex: 0 1 auto; flex-direction: row; justify-content: normal; align-ite=
ms: normal"></div>
<div style=3D"BACKGROUND: none transparent scroll repeat 0% 0%; WHITE-SPACE=
: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT: 4=
00 16px/24px ui-sans-serif, system-ui, sans-serif, &#34;Apple Color Emoji&#=
34;, &#34;Segoe UI Emoji&#34;, &#34;Segoe UI Symbol&#34;, &#34;Noto Color E=
moji&#34;; PADDING-LEFT: 0px; MARGIN: 0px; DISPLAY: block; PADDING-RIGHT: 0=
px; flex: 0 1 auto; flex-direction: row; justify-content: normal; align-ite=
ms: normal"><br/>=C2=A0</div>
<div style=3D"BACKGROUND: none transparent scroll repeat 0% 0%; WHITE-SPACE=
: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT: 4=
00 16px/24px ui-sans-serif, system-ui, sans-serif, &#34;Apple Color Emoji&#=
34;, &#34;Segoe UI Emoji&#34;, &#34;Segoe UI Symbol&#34;, &#34;Noto Color E=
moji&#34;; PADDING-LEFT: 0px; MARGIN: 0px; DISPLAY: block; PADDING-RIGHT: 0=
px; flex: 0 1 auto; flex-direction: row; justify-content: normal; align-ite=
ms: normal">Shenzhen Zhengdasheng Chemical Co.Ltd.<br/>Whatapp/WeChat: +86 =
17301929923<br/></div>
<div style=3D"BACKGROUND: none transparent scroll repeat 0% 0%; WHITE-SPACE=
: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT: 4=
00 16px/24px ui-sans-serif, system-ui, sans-serif, &#34;Apple Color Emoji&#=
34;, &#34;Segoe UI Emoji&#34;, &#34;Segoe UI Symbol&#34;, &#34;Noto Color E=
moji&#34;; PADDING-LEFT: 0px; MARGIN: 0px; DISPLAY: block; PADDING-RIGHT: 0=
px; flex: 0 1 auto; flex-direction: row; justify-content: normal; align-ite=
ms: normal">Tel: 86-755-84875752<br/>Fax: 86-755-84875750<br/>Web:=C2=A0<a =
href=3D"http://www.epoxyresinfactory.com,zdschemical.com">www.epoxyresinfac=
tory.com,zdschemical.com</a><br/>Add:4th floor , Longyuntong Building, No. =
164-5 Pengda Road, Longgang District, Shenzhen,China.</div></div></font><im=
g src=3D"https://1251899231-gz.callback.cloudses.com/api/webhook?upn=3D7f5f=
c2d81bf99757e3e56e8e756f73cbf8005f7ce416b82068d85383ea4588e9968132028deff30=
fec462fc79b8fc8372878a125d688a7aaf03b3e2f15372a8206d1c016467cf397d6e59165a4=
fc4a4939d29a1f957bf042f123d83cf4dbe771d3dd864baa16b260743773e24b48d3e60f568=
85b7e62f64befd41723df5d31e650b78483359002fbb265ecb3f234760bf23b41cb2b0e0065=
d62739be61a88c4c8084ccfc0c969309e4e16f7de46fa162abd2e3327e65152af221c9a39b5=
87a9d14ec26db93caed90d8b3f01d319fcc07fad4478797e5bb8f59c4e0b9bc6c9cb74b97c1=
fb3301843951c51b5d24236de8575ddd598501b68dec8c24b3694f3b83ec536c8b3e3e0b090=
898748e2eed5f970268c650973ee2fb2a61129eb7c773b5133d51277df375eca708b4aa4968=
a6aa" alt=3D"" height=3D"1" width=3D"1" border=3D"0" style=3D"height:1px !i=
mportant;width:1px !important;border-width:0 !important;margin-top:0 !impor=
tant;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !im=
portant;padding-top:0 !important;padding-bottom:0 !important;padding-right:=
0 !important;padding-left:0 !important;"/></body></html>=

--c80ec79a5148ca0e76fb4d774a6c34d0d9ad8ed47935ebb9f000e0e62fa3--

--87c0ba79db00b21e19d8b628d231376f2fd979cca22d80623268a2ed2f36--

