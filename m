Return-Path: <ecryptfs+bounces-231-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6560FA05375
	for <lists+ecryptfs@lfdr.de>; Wed,  8 Jan 2025 07:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6EBE3A5123
	for <lists+ecryptfs@lfdr.de>; Wed,  8 Jan 2025 06:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A6C1A840E;
	Wed,  8 Jan 2025 06:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b="eh0Gxf9L"
X-Original-To: ecryptfs@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023127.outbound.protection.outlook.com [40.107.44.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160D01A83F1
	for <ecryptfs@vger.kernel.org>; Wed,  8 Jan 2025 06:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319396; cv=fail; b=aDY5qqV28JQM7nIxeFX4etNRF2J29IFj2iQK5aHWiDt8rz9ciDnfmPDLG41Yv5ZrdhiUeeE8/Xpl3KPx0BCNk8kc1hWooatbXuJ9Juj/9aDnWZIyvTiawJEw9z8fa+x10exluJtslz1O/1/AJhYLWd90QkNfjEcRQzDBp4zYFCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319396; c=relaxed/simple;
	bh=MeFOTYU/9Vl/g/rTxpG6RcmoE4hK9Vs2QJafCpZknAc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gxe9Vdvq/pFpZRpl0xpChadiqhe4JhjE43Zt6kx+QKA+t1Bo+f2DdXQEybiaxRzofdZCRgpX3pBGllsSqEhrTOFBqDg3ZytneQNnHpTVIt6vjl9pC3f36KHbUAy6s+P7enVm/oPZDpvUit0oqth9LZEoJOeQuoJQsdT928FAP9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com; spf=pass smtp.mailfrom=qnap.com; dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b=eh0Gxf9L; arc=fail smtp.client-ip=40.107.44.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbBbxguntk530u6lXHTSDGU+xP/JfvirzG81IKDzes/8mulMO7FefSthJ/6tIRonEkclnqlrafkYupdUmWxlx4faqUR+beI5qIcOdiyKFGXg/vFtaHG51CesRsXXZlq9HVcSYospAX/mr+vtLxXqk1RU/rQBjZMe5Ez5F+JmO8glORpiv6QyaZT/+/RZYotGtouYt88hDAGE3F7gTggP6PMdCaAbzaOUmYQpD7mgEK5FUH+Yo1OTvZVFBsR3nctO3YtImO5uk3tdDI5UPntcL7OpMgz5Ex2urZuySd1ysiyi7gs3AKGOb0cQ0tDFUUvGrr6AzeQFy9THeJuw6cTzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeFOTYU/9Vl/g/rTxpG6RcmoE4hK9Vs2QJafCpZknAc=;
 b=d3EslO9FfA/E1AMbrlqmZuDZu9xQrJmFjaliQqhnEwS1xppmEMlaSO7tSGl7MHTkK31nVY3E56lx7xQfDmZGnHgUG+d0jElCUT7BmQq0HIBpxsUyaidP71q/fgxVXj9yOyQFCcMTyCjtTu/CQcBN4YjCbWj7CCQ6pIg8Miqz4cT+ogo5Vu/l7kEirWaQtVIKJefs+9l4HY+0+aHJh9pghckWJgFsDZndQkf+PqyZorvSElliEXA1dkMp3zp4HSKq1KtxMNhcJ6Bsnv3dtQ+37/ThkixM6ddl2we5U3ioDKA2hQOdIHJWr0/2bn46iBYt6/2jMfoU39QtDAqTBKlTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qnap.com; dmarc=pass action=none header.from=qnap.com;
 dkim=pass header.d=qnap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeFOTYU/9Vl/g/rTxpG6RcmoE4hK9Vs2QJafCpZknAc=;
 b=eh0Gxf9LULNDXLtTI2MFZwxZrk0gpGMuc2zcJ4hlIAZiqbC2OsT4nxAY9qWR+ImujkI4dsm1T//gTOexwkMDmn1H1xgM/LiQTsD3S8jzdnpylcJu+/oo0G/ejVV5hZeRUXSxxY7wb20djJwutyn+r0+zANYhCr3+ADwbtmBybBbo3oHZ9fwRWK7y8vSsrw+EGmvSGBR46RqAE6vPEGxuIdrhMMhHlVpo1wYehRmIHFDCMJgvSOLN+QV0EII1szUNDAuh6IfZOclIWLU8KcwM+AtGhPWeJB0xhNWP95asz8hE+Kpw9L2aHYWwOBjfwqRKl4qaLlZAjdvZgZ6H04rD2Q==
Received: from SEZPR04MB6972.apcprd04.prod.outlook.com (2603:1096:101:ef::7)
 by TY0PR04MB6495.apcprd04.prod.outlook.com (2603:1096:400:272::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 06:56:30 +0000
Received: from SEZPR04MB6972.apcprd04.prod.outlook.com
 ([fe80::8cc1:55c0:addb:f440]) by SEZPR04MB6972.apcprd04.prod.outlook.com
 ([fe80::8cc1:55c0:addb:f440%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 06:56:30 +0000
From: =?big5?B?RnJhbmsgSHNpYW8gv72qa6vF?= <frankhsiao@qnap.com>
To: "code@tyhicks.com" <code@tyhicks.com>
CC: "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>
Subject:
 =?big5?B?pl7C0DogW1BBVENIXSBlY3J5cHRmczogc2V0IHNfdGltZV9ncmFuIHRvIGdldCBj?=
 =?big5?Q?orrect_time_granularity?=
Thread-Topic: [PATCH] ecryptfs: set s_time_gran to get correct time
 granularity
Thread-Index: AQHaqDw9zkcUWTu1f0KEsFmpztdIsLMN5Cqo
Date: Wed, 8 Jan 2025 06:56:30 +0000
Message-ID:
 <SEZPR04MB6972B3BA41A181642C387C79B7122@SEZPR04MB6972.apcprd04.prod.outlook.com>
References:
 <SEZPR04MB6972A94B302FC6AC528823FAB7EE2@SEZPR04MB6972.apcprd04.prod.outlook.com>
In-Reply-To:
 <SEZPR04MB6972A94B302FC6AC528823FAB7EE2@SEZPR04MB6972.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qnap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR04MB6972:EE_|TY0PR04MB6495:EE_
x-ms-office365-filtering-correlation-id: 80d52b21-ff1a-4c40-e921-08dd2fb194a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?big5?B?MjFaOTJYUnBFU1FFbUtpdXdnVDRsK3M1cHNuRGMvNkdDbVZ0T0lwOTQ0WmJ3QXhx?=
 =?big5?B?TCtYU3dBVlloMHFJb0UrNU5zNDRrLzdYeDZMSThwMHhxS0kwNHRUcXZpZWhLTE1L?=
 =?big5?B?WWRLOVMrVXZ6QUJuOGhKKzV4RjJBMTJHcnhvODhuUGtTNnRCcUtGSjZWUDAxQkt2?=
 =?big5?B?WGZ3Ykh6VUd0Q294ZFBTejB1QlcvZXRtUTlHcmFyYjhYSmlnKzdKMVVrTWdvclJN?=
 =?big5?B?VjZDdVNnUEZnQTJNcnNVLzgzbkV0eExUZTByclBYRExybjRzNCtCeEhIWXBxR1lV?=
 =?big5?B?WjZhM2ZvbVlSTmhWMUpBeHh5RHkydWVzNlZiTkw0ZXdYSC91ekI0T1VVSU5DZG5K?=
 =?big5?B?YWRmVmJmVjVTS1dYS2lJOGNEdGtpbDd1aGJDRVcyMy9neHdlYlhjVklmMGlnTlFM?=
 =?big5?B?Y0pOTFlYbjVxRWpmNE8vUjc1aFRlUkFDOGdlbjRFRzZkVXozZzYxNks2Nk91d0VY?=
 =?big5?B?K0Y3VUpmcWpKL1JCaFVtUzR0c3RxdVJWZ1dPZGFHZTZIUTg1Z2JJZmg4OU1zUUFp?=
 =?big5?B?cWIrM096czRrcEdKeisydjROZUlXVWltZGJkZnR1alh3YTBUOWFyNGtxN2YvYnV4?=
 =?big5?B?T3ZjU3JvSU52M01sQk8zdDVreW5IUTgxSW96UXZ2em9DdXZ4b0hyN2hndXUveGRB?=
 =?big5?B?REViSmh3RzdBZG92V3ZqWkl2SHQrODNBeDhUZW1UR1BZZExxMHhFUzg3eUV1Wml5?=
 =?big5?B?UkdaRUpmTWYybHZGT3dlOTRwcGhtMVVmMXg4ZUpnVXY0ZW9EbkM1RHFMbVljM09o?=
 =?big5?B?ejM1VlF1ck81Q0ZxVXJSaW50VGpoU05xcUdyOWhULy96SHJYc1BaS3A3NkZtOGN0?=
 =?big5?B?WGpKZE5OTzJsODNjc0psZ3BiVWpLUnc5MXI0cGxvN25BOTNiRFlNcUFsZncyK0JK?=
 =?big5?B?WS92TC9EZEtsWkx0WU4zbUdSZ2h6R0JpYXlHNlJiV1ZKVldBZmRQaGdVZ2graWpz?=
 =?big5?B?Rnl1cm5ET1lHWlNOWDZTSVJjdjUzMlJ0dDJFVi9NOUFLS1crSnd0cUJhMVJwMU9R?=
 =?big5?B?eVVoWnlNbGNobC8vSFdXQ0xGdzdIUFNkZ3dYbFZWL1hXTzI1TDZZSXJQNU1DL3BG?=
 =?big5?B?SXNUTUFqUEdoU3ZreEpzN052WmtYYWErdEpTZXNmbk9BbElPc2c4MVdkKzBRYmpF?=
 =?big5?B?U08zeTlqWGF1R0Mva1B2MldCcHQva0Z4VloxNVFVT3Fscno3QUNZM3JtTkFmbHp1?=
 =?big5?B?M2QxTXpoZXNVWGVsWGZwWStYazRPZW11TUNPc3k0YjNyeXh2OTYxTnBBRjRiSzZn?=
 =?big5?B?NXZ6MUJKdGVwbmZVVyszV3NQaEY0TUM3dkd6cC91ZEd6QnZwZS9zeGRua3JqUjVw?=
 =?big5?B?RitMclBBU3U2WHB1ZU5FZUc2dmVHK2JuejlXN2NGK2thT3o5bmlJTHhielhId055?=
 =?big5?B?enRPcitaaFllLzAyKzFoeDc3OEl2TnBHNTFhK2MxcEhDSzZOcFVmajZ1dDRNS2ts?=
 =?big5?B?NHhoMXJMcGNxZmRvWHRlZHR3N0pqbEY3dFhWUnoyR3dHaDFtNzR3NEFZa0Y4azNx?=
 =?big5?B?YjVCNGZqNzhmemJvUU9EVzZpR3VRU1dvUWYwNHlrNm1HZlZ3cm9ESzlJdXM3MUVG?=
 =?big5?B?b3d6N2tHLzJQRlR0NlFYcXF5T0RvYXBqblNESnhRWUNpNnppWnBzYVZzd3hSam8w?=
 =?big5?B?VHd0YnRraW84VWhPMFFTY3VMeGVncWs1VjNSM1pTeWtoQTBBQm5GVDczaHJENDZS?=
 =?big5?B?aDhBcjV3bFZyazg3M0VuUSsxdEhYT3dnMCtzZmc1RmM5TFZuTCtmQXlxWW5hOTdX?=
 =?big5?Q?Do6cpwbL29SZ2I9Q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR04MB6972.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?WW42UG5aU251dEtyWVJUR04zOFR2ZmJGcXpreDJIOG1xcG94NXFjZjZ0bDJYT0VT?=
 =?big5?B?eXQ5aG04bVhXa3RRc1dCZC8xV2RPck1EZWc3bHlwZHdtYmxhM0t1VmNVbzlDcG9j?=
 =?big5?B?MWx4Ukh2N0YrUmF2N01WQ2VQZnVGcTFOVjFLNC8veDhhSm9OYk9ud2JPRnY0eElu?=
 =?big5?B?R1VMWDBHcEMzdkw0ZGtiNTdOU0tVZzJ1d2YzM0dWVk5QREdzQkV6L2Q3RTArSTNN?=
 =?big5?B?N3RZWmIzQjFwM0lBN3d3b2FVWUJuNmdyRW9XZUNFa2RNV0pRN3NzdGtBYlEvMVAr?=
 =?big5?B?Um8xblpKczVEaXlzTzRCTWdIVSswK1hJaTdVSmRYTForc2NZMGxkOHpMRW04eW9O?=
 =?big5?B?SkFGamplUTU3Z1gwSkhyVzRTRUJWY3BtSEg1N05GQzViNFJyS0dpVExYS1RyRVZH?=
 =?big5?B?S3dXWXdkTTBPVCtMdlJMeXo5WG45dlhoYTFGekVDc0V2d0xzK3Z1Y1NjaXdtQXpZ?=
 =?big5?B?K1IvTEMzTnlISk5vZkxZZHQ1djlNREJWL1U4SkRNK3ZoZWdPaElreU1YR2V1cFoy?=
 =?big5?B?ZVhHMDM2dlY0bUFyOUtDSEUwb1RISHY5czBGY3dSVUl5QVA4VEE2OVhYd2I2Q3lu?=
 =?big5?B?d1RrMGtpQ0hrV09vT0pXSmgwUk50cVZ1VVBXYUE2RittS202c2ZhOUJOa0lucEJk?=
 =?big5?B?QngwdXBKK3Z6ZzFMYzZOT2JqbS9ZVmp2UzBFVHE0ZjZyN0JmajFiOEY2akFaTk9E?=
 =?big5?B?ZWNNeG5KSWg5V2tiRkZMUG1JS2VRZC83VkJtb01WY0xSckFnbndWUkVndWMzeG82?=
 =?big5?B?d2ZEVWRHakNOaU4zbHVxekp6TFJMUzQ2eWxwNXhreXhwbjd0MEhrU2RmV0hUbkRJ?=
 =?big5?B?NkNwSFhBVC9tOXdmcExnREpmSnYrYUgzNDJ2S2xLYUFJK0JvaWF4YmZhQnlLZzdq?=
 =?big5?B?Z1ZBSHNuU1hqd2xFZUJrRE1mWngvd0M3VzN0VVRPdDhMU1IwSVNpNk9ndVBBZUZ4?=
 =?big5?B?cFN3a2svNzM3TTBJMHQ1TTFWTDUrUEZRMElybkx0em51eW0xVmlXdy9INHJXRU5r?=
 =?big5?B?TlZjdXQxU0orelFaa3F4Q256S3d0VWlURFN5MFUxM2pSZDREeVRPSzJIVkFWYmo0?=
 =?big5?B?T3ZhdUN0WTVSckorOXlxVmhuWEFaeEcvRUdxM0haQ0w1UlRiWkUyR2tFMWxFeVFY?=
 =?big5?B?L0dxelVIdUlrRW5rR2t3eGtXbnpTWjY5MS8xL2wwRFBMMUpzOG41M0RMRkJaVkVT?=
 =?big5?B?MmQ3Y0hINWxYdmQzYlhrS3RqdVJZMm9qS0NrZGo2c05NVjgvQ0UzS1gwSXVDbTJ1?=
 =?big5?B?bTJVWUFiQjRSUGhtUEh2a2VsMlRTempxNnVPSlQrQzIrdnROV2Z0SHhGSUI0ZlB6?=
 =?big5?B?MENHV1NPWmdsUE12YmpNK2tkYlBBaGN4SkNWNS9iVTFhZDBKS1Ercm9Ed1RqTkJX?=
 =?big5?B?QktOTXJlVk84MStLTGkxRDRVa2RBRFpHSXNFZzVRbUhyMzFPTUxiUk84aDdtSUNE?=
 =?big5?B?ZDB0cGQzV2F4eEd0WGRubitRUnJVM0xzdlZtNTlFUmM2b093bERTQU52OEJoOERs?=
 =?big5?B?aVhVY0pWYlZjcWhCL2hzRVhaVlZZS2FleDRpZmRCeThkVjlCQ0pEVzB1UllpdnhH?=
 =?big5?B?b2pHYkxEbWJWYWp4T1JOZ0sxVzgvQkF4VklodVhEMHZXTHI0U3Y3WHV3VnVWM1dh?=
 =?big5?B?RVpFRXJpalJNSmpMdXhBdG5XTVYzcVdPbDdnN2pYdFNvWGkvRGowTjBmUE44WnJ1?=
 =?big5?B?QzJCaHVFTk1LSDNZVXJhU2pNL1E2MGx0SjVGV3g2Q01iZWd5ZU4xV2NnWWZ5emxr?=
 =?big5?B?TE9uT3N6NnFLSEd2c2Z1SWdTaGVLQ051eWx3WGlYUGdmWTY3SG5XSGxBQWg5SmUw?=
 =?big5?B?U1lzWlpQQVl2Zm96V1psUDhhMWRSMS9mdWkzUExTdGFIcldtSmorbGxFcW1iOEZY?=
 =?big5?B?R1V5OEtKMGVlK3NkM21uZFp2emF4T3RkRURPUEZ6eEZkd0t4VGswR1ZDTjNmSEZW?=
 =?big5?Q?ahHR0Lctc+BkC2wIU5NLTH++YtCjVhOuli2r7DnfCgQ=3D?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR04MB6972.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d52b21-ff1a-4c40-e921-08dd2fb194a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 06:56:30.5463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yae00trviNwMf5BA92LlmT9zmHD06D21Acr1qdAGBnDgZMQU5qMAiuo+JH8wkPUgRGggKJOQrZN/Dtg9miw/hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6495

RnJpZW5kbHkgcGluZywgdGhhbmtzLg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQqxSKXzqsw6IEZyYW5rIEhzaWFvIL+9qmurxSA8ZnJhbmtoc2lhb0BxbmFwLmNv
bT4NCrFIpfOk6bTBOiAyMDI0pn41pOsxN6TpIKRVpMggMDY6MDkNCqaspfOqzDogY29kZUB0eWhp
Y2tzLmNvbQ0KsMaluzogZWNyeXB0ZnNAdmdlci5rZXJuZWwub3JnDQqlRKauOiBbUEFUQ0hdIGVj
cnlwdGZzOiBzZXQgc190aW1lX2dyYW4gdG8gZ2V0IGNvcnJlY3QgdGltZSBncmFudWxhcml0eQ0K
DQpyZWxhdGVkIHRvOiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9lY3J5cHRmcy8rYnVnLzE4
OTA0ODYNCg0KVGhpcyBidWcgaGFwcGVucyBpbiB0aGUgdHdvIGZvbGxvd2luZyBzaXR1YXRpb25z
Og0KY3AgLXA6IGNvcHkgYSBmaWxlIGFuZCBwcmVzZXJ2ZSBpdHMgYXRpbWUgYW5kIG10aW1lDQp0
b3VjaCAtcjogdG91Y2ggYSBmaWxlIGFuZCB1c2UgYSByZWYgZmlsZSdzIHRpbWUgaW5zdGVhZCBv
ZiBjdXJyZW50IHRpbWUNCg0KSW4gZnMvYXR0ci5jIG5vdGlmeV9jaGFuZ2UoKSwgYXRpbWUgYW5k
IG10aW1lIGlzIHRydW5jYXRlZCBieSB0aW1lc3RhbXBfdHJ1bmNhdGUoKSwNCmVjcnlwdGZzIGdl
dHMgd3Jvbmcgc190aW1lX2dyYW4gKDEwXjkgaW5zdGVhZCBvZiBvcmlnaW5hbCBmcyB0aW1lIGdy
YW51bGFyaXR5KSBhbmQNCnRydW5jYXRlcyBhL210aW1lIHRvIHdob2xlIHNlY29uZC4gU2V0dGlu
ZyBzX3RpbWVfZ3JhbiB3aGVuIG1vdW50aW5nIGVjcnlwdGZzDQogc29sdmVzIHRoZSBpc3N1ZS4N
Cg0KU2lnbmVkLW9mZi1ieTogRnJhbmsgSHNpYW8gv72qa6vFIDxmcmFua2hzaWFvQHFuYXAuY29t
Pg0KDQpkaWZmIC0tZ2l0IGEvZnMvZWNyeXB0ZnMvbWFpbi5jIGIvZnMvZWNyeXB0ZnMvbWFpbi5j
DQppbmRleCBiMmY2YTE5MzdkMjM5Li4xOWRiZTlkMTE4N2UxIDEwMDY0NA0KLS0tIGEvZnMvZWNy
eXB0ZnMvbWFpbi5jDQorKysgYi9mcy9lY3J5cHRmcy9tYWluLmMNCkBAIC01NjcsNiArNTY3LDcg
QEAgc3RhdGljIHN0cnVjdCBkZW50cnkgKmVjcnlwdGZzX21vdW50KHN0cnVjdCBmaWxlX3N5c3Rl
bV90eXBlDQogKmZzX3R5cGUsIGludCBmbGFncw0KICAgICAgICBzLT5zX2Jsb2Nrc2l6ZSA9IHBh
dGguZGVudHJ5LT5kX3NiLT5zX2Jsb2Nrc2l6ZTsNCiAgICAgICAgcy0+c19tYWdpYyA9IEVDUllQ
VEZTX1NVUEVSX01BR0lDOw0KICAgICAgICBzLT5zX3N0YWNrX2RlcHRoID0gcGF0aC5kZW50cnkt
PmRfc2ItPnNfc3RhY2tfZGVwdGggKyAxOw0KKyAgICAgICBzLT5zX3RpbWVfZ3JhbiA9IHBhdGgu
ZGVudHJ5LT5kX3NiLT5zX3RpbWVfZ3JhbjsNCg0KICAgICAgICByYyA9IC1FSU5WQUw7DQogICAg
ICAgIGlmIChzLT5zX3N0YWNrX2RlcHRoID4gRklMRVNZU1RFTV9NQVhfU1RBQ0tfREVQVEgpIHsN
Cg==

