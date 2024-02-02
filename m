Return-Path: <ecryptfs+bounces-15-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE943847CE1
	for <lists+ecryptfs@lfdr.de>; Sat,  3 Feb 2024 00:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8916E2890F2
	for <lists+ecryptfs@lfdr.de>; Fri,  2 Feb 2024 23:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4771EEE7;
	Fri,  2 Feb 2024 23:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ffBX5BC5"
X-Original-To: ecryptfs@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2066.outbound.protection.outlook.com [40.92.41.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4B267A15
	for <ecryptfs@vger.kernel.org>; Fri,  2 Feb 2024 23:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706915092; cv=fail; b=XfN6wtPC7nYwxpkDFN7N01zdJLuQZ9JFor9PAZ1U3uDyii0ALX0LopOXe6acRS1aqoU/vZIGz0s0hBrm6RWANaAHLleLOeTomsXvDNYCuuKCREG0jaHMhwzK1077PzRrkcTJQgg20jku5JnTv6lRwVRDjpKPw9fBQ50uVIdODWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706915092; c=relaxed/simple;
	bh=cS22sGeK3JRQffnl0M3eHzVYqpacdKXCSXEtD44R9AQ=;
	h=From:To:Subject:Content-Type:Date:Message-ID:MIME-Version; b=Hr5jpzMULBinipvDYS9pJ10j8IuWhQYgJjjbvJJcBXyQUsHTBQPdoK2SSEDUEcDdRqEu/QUIXC/hPqVi0M55AzajdKJcp3EXHA+OAhGSXyawb/IF3jjsVzG3Q2RrzeSvddxi5OBnzeAtmGY41sWgp+rI3xZntr3aU1e8mrD8joU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ffBX5BC5; arc=fail smtp.client-ip=40.92.41.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrIpWS6TFvzh6LUzGvILYDbQ3jbparR+qmPKsv14q7DO1ywxuZ2a8jZ5yybDSn6HGXJnc9ODG2KgQSf8qb78rlttFYscT9eDqExnxXXo+fw2LKmwVlBvmLIqLQiKErENFTq3S7tdbYK9tRoSEATFvNbQ7rVKd2HdcfhekSV7OfSmC+Zo4HWc6ued8w+Z+p0+HcrVbnd5CUxkW+BhCOgbBIxy2/H9CaRuWbIvLBO+CBC/uzgUUNNPbDIOHQkfH0gLdBdHTgpVZZZfpQXxk3+85Wt8MUjxxg0ffwVHUYVbsKOfWm5S0VGsBBn/NokDHK4sUzM0AGGH/Tfn46q712pYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS22sGeK3JRQffnl0M3eHzVYqpacdKXCSXEtD44R9AQ=;
 b=JujCLAFJcPRKxka7LZbVY7ragVAuawVMm0eLmiqL57dBXvKby0xqmjg8Z6mlDsWfjOIRaPEnT9GH5/6IWinttqpmUvmizeB0sacXCYl9eILjZJ8tpLeilprrSceua/LY25l33OoGWaefbMoN0CvM3mTae2B2vqQcQxfqnY1ayknIWBDb5Y+Vac+M+rq3yPb1liz1gDKEHYuiZNyjVy1ZTh3BQbBlLeN5QCeOEwaWBZbVsLiwXoaCmpQkOGutaxB4YFiBJfpWict+iariwyONAwgh/RcvzuqHblwu4QeIt3BdZUocR847k5ZBmYzsJUch6H0MAtFQsUQdIO2kljFRsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS22sGeK3JRQffnl0M3eHzVYqpacdKXCSXEtD44R9AQ=;
 b=ffBX5BC5Yx3OFif86lN9vP1CWz+LJqGFjf0EfCb0ZPVnAYccBs34QlJgxc9IjHnI340c282y3CZ6vVuUpTyvccQC79Lcklujl8b1uFWfJhoF1COJ2lP0/Qy52z+YJBeZsH3w+GW3RVzR8+pATMLwt/Kvo667FXSPhrWe/CzsWY5cuWINrP3ue71SbXSm/eggjA62+cQyb8q8EzcVFkmOCFqnRwAYgHUx/wI6Of4vH6swP5wx8zVpnfBXktLQDNIVi1QPuWSSbP3dJQlAmnkjmxNew0s2w6bogwPWAiz/L8DZq6eGC5yw75FCC64eNrvGSaUUzJKJyKgtIjVA+6lM0Q==
Received: from MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 by DS0PR12MB6654.namprd12.prod.outlook.com (2603:10b6:8:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Fri, 2 Feb
 2024 23:04:47 +0000
Received: from MW3PR12MB4427.namprd12.prod.outlook.com
 ([fe80::7dc2:3ac8:bcba:e966]) by MW3PR12MB4427.namprd12.prod.outlook.com
 ([fe80::7dc2:3ac8:bcba:e966%5]) with mapi id 15.20.7270.012; Fri, 2 Feb 2024
 23:04:47 +0000
From: gmosquera72@outlook.com
To: ecryptfs@vger.kernel.org
Subject: CERH - Centre CERH - Projet de recherche en =?utf-8?q?sant=C3=A9?= et
 =?utf-8?q?spiritualit=C3=A9?= - Collaboration et Partage
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Feb 2024 23:04:46 +0000
X-TMN: [KTl/bfdQamK7J/AI0vmKZOZ0DlqdaRUj]
X-ClientProxiedBy: QB1P288CA0006.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::19) To MW3PR12MB4427.namprd12.prod.outlook.com
 (2603:10b6:303:52::10)
Message-ID:
 <MW3PR12MB44274CFDF6DD36962747AF6BBD422@MW3PR12MB4427.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4427:EE_|DS0PR12MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: e528dd83-e68f-4c61-6862-08dc244359c8
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBtocXRf+l5mi7HGhnH+OPGNLlPHRUrUbBM0uCnnYJrcqqrCNAAFKS8zBqFDfDM80CnuKwO1WSOw9B5qmwF+QomMj7BIDSebeNswlJvj1fVirGOKaPJmkWzv5glPset+1lpNYgtdC1bSrcCSWTu9YXmGjUG+T+AvOia7u8571nYu4OUVendUD+jJVRMIPfhULEeTbsixzGQihJkJPjFu37tSpN2wBWqqBbsW84CptLz9iivK7yU8Ep8PHQAjvG9XW2ktStx0fwX50xi8N1HRIWetd7hn4k8jAGMdr28T+AxW5Van4yp4BgDX+VeDNkYmyuCJY/saf7eXXg/RhQAqt1lSJfFqKPAm0tIOq60uTgylF27Lym7DxcM8IKJLd4ZreEx1RADKmof8I9z9kZtemko+32OBhjr2T81ewQTJJ8GxgHyo3ZFoqExq0S9ErW4wlD047cOBuxR8n8ZXLYx5x5Qk/sLToD9tkjwGOLONwArs6+pCHOzKhqxSYu2/kFpedcQ2tQG0X6lUQrdxRTmdcM2uI4UDNsHuEPjeQnGUjf1gEMhCl1Rpm8QxEVhGBddzYvh1F7Wk5Y+JxhgR/xUTtlEJg3xR2koeS6MhFxN3oAn7tXp4KiD5SJz6GAo70QPczF/7bF3ElhgOSjyY+HVsvD5SH5N1GwWK6uDxU7E8GkZE/CZX6uGAZDFgWmukf/brcXtN6BfUOrwl1t4FgC1wHwv68QG8X8gcwe19sKWHENMY0w3Xi3cfIHW6Ss0YisdjZNWafIxa1Ewos1t3OGN7UOXP
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	APd5U2cFY1ASq8f8Xsv/NedGswmDg/BK0RVQAxGIMsKZFWvVkqDTXCJdCS+jttl78KOagbwq80/W4vosCw0NZJIEi1wgS4ygvzGs1WgXy02LGznL1QJWdQXfJwkeo51dii67dn5Aq25BZ8QGzL7+IPZ6GBdoxjlBwV83iVFROySfB+DbVsiITnxtjOUDwT5OymDMZhZm544W1veaswc7KFlqGsxoW52WEyWszOQaCtNw+bsoi5S17pHkF8Kv1iAxv0uv5uWDN+w0MZE00YhmO/5Y84a8yXmRcZCIJbnAfP5BCnXOe6le1j7mgHCBUT/IN/zS5cHxYTA8dLMvyF5Dy0ZcGT5LYpn0Usas4n9H+Gr/S/b6TFLnQtGBj3LkSpbRijvnTtcnW8pYUMBo+9vfzzOJfkraBS1RUhvCbI2186uB4MgvZJEjDxPpf0K8sdiHfb9hqfGv4ojiwmGCbJ8z8TdPSXlw0fvDR++SPGUjfNxEJuX6ERqbmRpXeYDkwyiVqH8G0vdijnLMphKgVtB1/mXtSUXbrJvbXXKA1OeeUHTNvXsDJ+OV5xoQhS+MjGcOANMOJP54fUF2//Z6io1mlwylzuRztxSawNwKPKnAKScou1OrM1AQSc2ZKirDXqvs
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXdGNVVHM2p1aGJzNkxYTDcyemJIVEtMN2NDbEtYbk43TnkxRWxlQnYvR1Jj?=
 =?utf-8?B?SUlvSjhQeHhrLzN3T0NTa0IyOEkzc2crWElxOUxSZ2hYYnpZSGR5Q1hSK1BV?=
 =?utf-8?B?MTEzSXZtMVlsem5SQ2RGZnVJN0FnYldpT2JndzRKY1NVMElxdEdodjUvNjFR?=
 =?utf-8?B?TlFMMWNVSCtrMEVXMjNUWFFjSFZmeVpIbXpoaFFJbVVBNWx4WVlielhXeDR4?=
 =?utf-8?B?MFAvMVFqWk9wbnhZMjNrSktVRzMwOU1rQS9XWVhSaXVWRmQwaEYvRnNsRHhz?=
 =?utf-8?B?bVpWUGF3VzVMMHgwQittL29DU2hZZW1ucUVDdnIwbWJjVHdzdnFwRVJZMVYz?=
 =?utf-8?B?UHh1dmlVSE1wR1ArRnFkZUhJelpTUzFTRnAyWDhBOGVkUzk3cUZKMUd3NHA3?=
 =?utf-8?B?OUJDYnNTbytmOElVWDhEUnJZby8wUUoyc2MrSmxjdjI4cjRmdnRCWEZUUzdN?=
 =?utf-8?B?bVBFWXBKWnQ4ZG5HWnBoVHdvaDh3bER1WnZmK0hEUVdSTW9Eb2ZWcGI3N3Br?=
 =?utf-8?B?SHh6b0NlZnE5ejFvdWdaWDRaOTZmU1BickZLRUYwUDdidy80OW10RHNhUURo?=
 =?utf-8?B?cXJqc0pBRlNreWRiWGtNeXZsWElFWHVsRzJ0VzAvRDV4bVZXQWx3OTlnZGY5?=
 =?utf-8?B?L3pyRjhJK0FaU3ROdjhLZXY0ZEVURGpHaFI2RjQrWDlzd1lBRHBQVHNhTlAx?=
 =?utf-8?B?SWNWTy9wWURZSEZVcjJoTGVyT2cxeHEwc0hQU0p3WWRRd1VGb3ZUa2p5MjdH?=
 =?utf-8?B?NS9SUkl1NlovQTNFd0VmZ1NSMEdvOTNTSWlCeVloWjVRaTZpRWdiU2dWYlVH?=
 =?utf-8?B?ZWx2aUJYWHAwOW12WGhZYnJZNWJEYlM1cEhIZ3djaU8zQTdzazhEU3FYYytL?=
 =?utf-8?B?c1dYSGM5L25scHJldGFPRHJuMnA1WWUvZlZYU0ZMS2FpSlY4eXB6ZERCL3hp?=
 =?utf-8?B?UGhjRGlwYzhNZWhxSTUyOVJiRkpDWEdXZHR6UmJwVVFXaGppazE0ZmhoNGl5?=
 =?utf-8?B?dkd5VlkwbGFMSjVqUUxRcjhIQmplYXNnSk0zSVUyYjFQbTBNaDE3VnJsQWFL?=
 =?utf-8?B?RDdLMktFUUdqZzhXaWlOd1pud0FhY3pEUDdHN3d3MWhyTC9XMy9YR24wSlYx?=
 =?utf-8?B?Y000OXgvQ3NwYk5JSjE3bEF3eHZyblNGMFVwRTJTTTFSTVZUeWpRRjU4OWth?=
 =?utf-8?B?dzJnQzVWTDluREIwS3JWWU0xekdrampBMEMzZlMvRUV0ZE9vOWFFTVpwY2Yz?=
 =?utf-8?B?VFpsV1ovM0I1amNBdk01Y2pMRHdITCtBTkNqUkJDNTY5ckRWTlNpWUc5bkFq?=
 =?utf-8?B?eFZhVjE0T1UwbGw3dEp4Wjd0YnNnN3VEK0Y1dkUzc0ZPMGlqakxFT09CZmNP?=
 =?utf-8?B?NjhsY0lTaVZFUkhTNlV1TXFsRTA2OVArUzl0K042Y2JKb21jTmVQT0ZTOVQr?=
 =?utf-8?B?cS9DTG5iQ1E1cDF2aHFTeFpidTdZOEZyWSszRDNIc0RlVkh6eDdiR3FJdzBT?=
 =?utf-8?B?MkR3Yk83R2pEUzI3UmtPSC9Md3NFVW1DYnBYeVFyWlQvMzBGTGxOZWhTUmhF?=
 =?utf-8?B?M3pOZ3RuSWNGQ0tEbkpCcHZBcmdhNUp2bDNlVHpOZWZCOUJESjBMRjAra3FP?=
 =?utf-8?Q?7XokBoqhrokZZ7YoRUTg10H6Qi+MFGhVsUgL8PdfuC8Y=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e528dd83-e68f-4c61-6862-08dc244359c8
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 23:04:46.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6654

Objet : Projet de recherche en sant=C3=A9 et spiritualit=C3=A9 - Collaborat=
ion et Partage

Je m=C3=A8ne actuellement un projet de recherche ax=C3=A9 sur le lien entre=
 sant=C3=A9 et spiritualit=C3=A9. Mon site, non commercial, est d=C3=A9di=
=C3=A9 =C3=A0 la recherche et =C3=A0 l'enseignement holistique. Je recherch=
e des contacts et des personnes int=C3=A9ress=C3=A9es par ce projet, avec l=
'objectif de cr=C3=A9er un espace de discussion sur les approches alternati=
ves en sant=C3=A9.

CERH - Centre d'exploration et de recherche holistique
https://cerh-recherche.weebly.com/

Nous d=C3=A9veloppons des formations en ligne gratuites et proposons cet =
=C3=A9t=C3=A9 des activit=C3=A9s gratuites (TAI-CHI, Yoga, m=C3=A9ditation)=
. Un groupe de discussion et une lettre d'information sont =C3=A9galement d=
isponibles.

Si vous =C3=AAtes int=C3=A9ress=C3=A9(e) par cette initiative ou souhaitez =
en savoir plus, n'h=C3=A9sitez pas =C3=A0 me contacter. Votre contribution =
serait pr=C3=A9cieuse.

Cordialement,

Guillermo Mosquera
TECHNO KUNG-FU SHAMAN
438-519-1162
technokungfushaman@gmail.com
Sociologue, Informaticien et Musicien

________________________________________


Subject: Health and Spirituality Research Project - Collaboration and Shari=
ng

I am currently leading a research project focused on the connection between=
 health and spirituality. My non-commercial website is dedicated to holisti=
c research and education. I am seeking contacts and individuals interested =
in this project, aiming to create a space for discussions on alternative he=
alth approaches.

CERH - Center for Exploration and Holistic Research
https://cerh-recherche.weebly.com/

We are developing free online courses and offering free activities this sum=
mer (TAI-CHI, Yoga, meditation). A discussion group and a newsletter are al=
so available.

If you are interested in this initiative or would like to learn more, pleas=
e feel free to contact me. Your contribution would be valuable.

Best regards,

Guillermo Mosquera
TECHNO KUNG-FU SHAMAN
438-519-1162
technokungfushaman@gmail.com
Sociologue, Informaticien et Musicien

