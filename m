Return-Path: <ecryptfs+bounces-81-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1D58C848F
	for <lists+ecryptfs@lfdr.de>; Fri, 17 May 2024 12:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79E451C22CAC
	for <lists+ecryptfs@lfdr.de>; Fri, 17 May 2024 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B29D2E40F;
	Fri, 17 May 2024 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b="T8PWCptS"
X-Original-To: ecryptfs@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2117.outbound.protection.outlook.com [40.107.215.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A642E41C
	for <ecryptfs@vger.kernel.org>; Fri, 17 May 2024 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715940603; cv=fail; b=dMQe5ODPW9CKCkP8Zybn0YofpYv3BkY9gboWJ/tGx4qk3V/terSiz9I2ahiEffh7vBfMp65D37CyOGAtOwWs2nU7A6E9fnwlMGNVighbnFsDqU4sb819IpmN0Pz/jPer3fy89O22STKBhYmQpAvCWYg22G920uO/4FaARx374Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715940603; c=relaxed/simple;
	bh=XNU3b+Y3+eoZaxSsAiS29Ze4EBAl5gAk2YGMMhAd2bU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FpCsQDK0YDL9RKPgDe87fMbGD6JtvcwL2mmYJp9Ts9yc4rTL6M1Q9Lx6PSsDYWnhBuPzprA0pjJqrEszjGVvOHIkA0ODQdZ5mV+w9so8CaL7pMSoFo0BiyV5LBL6zyIKEbok1pUxgjtAcSYCEg/woqpLDZ6b61Ie+rGmVBxs510=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com; spf=pass smtp.mailfrom=qnap.com; dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b=T8PWCptS; arc=fail smtp.client-ip=40.107.215.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXr7BXmzHcj1dvrNhNcbIgGhhyFgVDrtKMv7jgu9NNlpc6rm6jEulNwsfJZWjmymPO4+Gowx3jzhV5ZdJSmubDlRKkjYWZGquZBV/AHe2X3CVaX1rpOJiGImyp/x60590Se9V5ibNPa871IwRg1cb/B83I0TEA5bKUwkX/yZddq/WuKrDSk2qIQiTqp8C9N+u3plZgAvZz0qwoMd2iL/UUHz3lqHinBA2tnJY/129A1x9iAnLSKHHOA+cezfD6D2Ogvo6QJsOu+DQsW9RsEs2kb2x2c96avDdoYPRHURt7TRstC+b0VqY27ADTU0yawYsM2c57mg28w09Er1cf8g8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNU3b+Y3+eoZaxSsAiS29Ze4EBAl5gAk2YGMMhAd2bU=;
 b=fOrTEHaL+39F7XqbvP7rq5Ucz9esI+Id237XoEofBPxVJreH6dJjXrejxRVaYgrBVRA60pZ9T+FDRM917Eb6lY99qf/SHkxorrfJ48kMGLhQJjh2WwcwM7bWLWlRZYCKHAwH14JMdT9rZMt9khy36E741J5y/RImmudEE4Ah0g3d6QoidaNljxZ6z90wnITuXHS8ufC/KTLn8Zx8CH0h9zni0OHOgg5VnA8K8cIjSzTKq+kY+MQn6GjNJFmsGV810YJJ+4RUmfnbtno74zHhnajsjn+WuhJP8PpO2z0UHUMqCzw6qFi3PWI4y6MDS2jP3BJBjk2vBnonBfe1Z/X6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qnap.com; dmarc=pass action=none header.from=qnap.com;
 dkim=pass header.d=qnap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNU3b+Y3+eoZaxSsAiS29Ze4EBAl5gAk2YGMMhAd2bU=;
 b=T8PWCptS5PDuEcWI6V+VlW8Xt1Vh83xEhIfnx/x0g7U99gjzC6EA3FVambSKl4Ebccfd7g7wazmS30F0NT+Te6doDni9vcfZkXVxZbFnhvLOVHXDRS3S4hVHtZbTxPUMPE+iRWcXWGelVSNcVtiM/mAdixBujIcFDP8FOMWjs1REh6OU36tFCIIBef/t5HJtElO0hwP/ynFIxVBxATaQYgrxrQnQQR5A1lvZWhEJIE0EXgey93GdcNbYVm6vM1obs2xfqgVFi0Jiz2eewE+0/XlkMlObGaUvAZ78ploCcrslXwcDMCLUDFuoC7F3Tog9OW8SIO/tbNhL/qRcX7gXTw==
Received: from SEZPR04MB6972.apcprd04.prod.outlook.com (2603:1096:101:ef::7)
 by TYZPR04MB6923.apcprd04.prod.outlook.com (2603:1096:400:342::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 10:09:56 +0000
Received: from SEZPR04MB6972.apcprd04.prod.outlook.com
 ([fe80::8cc1:55c0:addb:f440]) by SEZPR04MB6972.apcprd04.prod.outlook.com
 ([fe80::8cc1:55c0:addb:f440%5]) with mapi id 15.20.7544.056; Fri, 17 May 2024
 10:09:56 +0000
From: =?big5?B?RnJhbmsgSHNpYW8gv72qa6vF?= <frankhsiao@qnap.com>
To: "code@tyhicks.com" <code@tyhicks.com>
CC: "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>
Subject: [PATCH] ecryptfs: set s_time_gran to get correct time granularity
Thread-Topic: [PATCH] ecryptfs: set s_time_gran to get correct time
 granularity
Thread-Index: AQHaqDw9zkcUWTu1f0KEsFmpztdIsA==
Date: Fri, 17 May 2024 10:09:55 +0000
Message-ID:
 <SEZPR04MB6972A94B302FC6AC528823FAB7EE2@SEZPR04MB6972.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qnap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR04MB6972:EE_|TYZPR04MB6923:EE_
x-ms-office365-filtering-correlation-id: eed1bdbb-c36c-4d20-31d8-08dc7659807f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?big5?B?TTY5S1Z3eS9PTDNYczdUNHNnVDJTYzBOMWhTeHozVlZxMkFweWJjQ20vYUJaYmpP?=
 =?big5?B?ODFPdzBDK085SzE5ZUNOaUpSbjd5ZllGY3RaUmg3Y3UzV2VOT3A0MzJUTFhYRDJp?=
 =?big5?B?d2FZRU9ZYWVHVmlSMzh6V0tyTzBlSUxwb2JUWHVVUGZuaUU4SjBEOStPV2VZNkgv?=
 =?big5?B?YlROalcyYUpydEtvdVFSYWlCOUJScjFPTkhHZEsvV1BXVHcvUTdFRXR4c2RQcHB6?=
 =?big5?B?WFRWZ0YxaVdpelUrK2lYNER2NG12U2dNYnB4anFlZVBSeDE4NDJDMDNqUEVpcUl0?=
 =?big5?B?QWIwSnFhbzQyTVBZSHlDZFBSVzdhYlZ4QjZiR2NseXMzQWxRMVBvL2ZxY2RGVXhM?=
 =?big5?B?UUdwalJvTmpXTFpWSXpmeXJvaVZsTmQ5MVNLOEUzU3FSUXZKRndHVW14ZjZkWFdj?=
 =?big5?B?RUlLdG5jRHdOcjdmSDhwYXA0VHgvVHE0UW5Yem5EeTBPNEo4LzRYSW5Fc2Q5eUpF?=
 =?big5?B?LzJuTmxCbkJ4dHp3N2VMS2JuSG9jS21zWHBkdFZsOXA2NDVJVklwVUpEeTVmZStm?=
 =?big5?B?cmViUWpWOHhyWnU3TnJXTzRoVWhJUjRhMlQxNWNSeWtnZ3FqUmhIMEZCS3MzaTVO?=
 =?big5?B?MVdlb1IxNUI0bUVmNlgweVNld3ViQUNXbmdLaWx3blVvWXpKbkt6eXQwN2l3SDU2?=
 =?big5?B?MURWTGJQbmlqRC95UzN1Z3YvdXVrUlhPc0hhckRLNWRlcUNxRFVRTFRwMUdFRDFz?=
 =?big5?B?OHJWVUhUS2w0NE43b213Ulc1SEVVVXNKRCtrenI3Z0hNdHcyejhSSkd6NmwvVEdJ?=
 =?big5?B?Tm5OYVNUeFQ4TVEybWFoL3FQZ3JSWWdYSFc5cGl4NjAzN3BUMWNMeVpiWHRhT3V6?=
 =?big5?B?L2ZVQk5BMEYwNk5IR1c3STJsc3NwZUVRMTQwWTA0UUZqcDhsYU5FbXJiRTJiWXRu?=
 =?big5?B?NnE0QjZrTnJEalArY0krSzliaFdMK0JzVkhkNlJqMjUvQmhTcHdiOXdaMmtoVlU3?=
 =?big5?B?Rk1iVzYyN0o0aVY2VnpIVVFnSk5nVFFsY3JxaE5VNXZwdkZPeFc2Yk1FSUhKMExD?=
 =?big5?B?ckNxajRpUnU2K0lsZFMzTXJhU1dQbm0wbEJaOEp2Rnl5d1p1SlFzSlRWTmxoNURW?=
 =?big5?B?UGo0ZmFNQ1A4SzkvZjFnanBJcFVzSFp2dVEvUVZKM1Q3d1pFNGs2Z0dxSXFMeHlT?=
 =?big5?B?SzJGQzlyVGNUU2lqeUdDUE9yeWNyaXpkZ250eWk1TnRVaFBuNys5MFpqdW0zSjNW?=
 =?big5?B?Z2oraVlzd3hFRGJOajNaanZBc3BoR2ozQWhCcDdEWHl5cjY4TWJsa0xLN2pkUUhJ?=
 =?big5?B?VFBWcTdIbDFZbnZMTzdwQldKZ2xGenlHZVR2OW1ES1hvMDhHdnV3NzhRZTg4MGQv?=
 =?big5?B?TGtOeTk0QzFSMGxzUi9NK3FxUmlUTHFxUmhzdlpxRkF6cUllQVdMaWl2bjBDR1Uy?=
 =?big5?B?QjFFV28wcThsUGhMNTBDcjNFanpXYWYyRldRL29GTExNaENKamFnRWNVeWFrc20z?=
 =?big5?B?WG5EWWpPYjRzcE11K2hzYnR5MzVLS1Yzeit3QlpWbjFBTkJDY1ZVb3lPRmFEcmhG?=
 =?big5?B?S1lySlpRY0gyVDNselZPOUNDUWJwdDFoaUpIZ2NQKzFUYTc3UjFaeSt2Nnc5dEps?=
 =?big5?B?dU1qSU1Cak14SDNGenN6UXdzT052R1ByUUROR29zVkN3cUUyUENvVTFEZ2t5U1JF?=
 =?big5?B?U3dMVENBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR04MB6972.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?Yjc2N2RoQVdadHpFZDNWa1JnSmE1bldtQ0pmYVlEYTZ4T1pmMkVsb1VlTEtQM2Vi?=
 =?big5?B?YXVFYno4eEhaQUhXOUs3Y2V2YXNaNWJwQVM3VGJ2bDVHM1pIM3ZMdDF6OHZFWkNv?=
 =?big5?B?ams4N1k4RmlJY09IU3J0RUU1MklGTzNLYkhhSUtReVAzRTZDY212YU95cUd4Wmo5?=
 =?big5?B?Tktld2N5SnZMbzNWdjJCSW1nRmhENHl1RU5VSUtpV253d3BQM1paaDBlV0lzY3NJ?=
 =?big5?B?TTRQcXMwemIxQVM4VWE1ZzRCT24yckFPZUkrSTJmU1VwYktxNEpaeml4ckxXNmI4?=
 =?big5?B?Zk9MNHV3aW56dnpjTndNTzRjK21ET1h1R3dKbTNJUFROU0l5SFdIRDdMaWNudXNC?=
 =?big5?B?dUZycHBoSmZrYzZwYjA2NExNUU5zbFN6K1hCOWZ6ZkJURXpsTjh4TXRyNUNqMjFy?=
 =?big5?B?VlExYTlNRWNVZmNscFFCeFVWUDF3YzhhY29TemhpYTNDQTVURHBQSzFXSXUyQktx?=
 =?big5?B?RzhDckVUVkpyUnNkTjRoRG1UYXY1UmN5SmFXWDFSTURYTHNNaTg0Yko5TEJ6MGFC?=
 =?big5?B?YWFDK0M0SDQ3V2FnRGNSdWdZais3bFBOZ1p1T01HeEIvd3RMb2hxeEF4SmdITk42?=
 =?big5?B?Yy9HMStRUHN4NnlGU1BUcVdmcVN2aUVDcEpYSUdIY1F1OSt5TE9ISzlYMmQrVHNE?=
 =?big5?B?K0ZlaFdQVTF5eVJ6QmhJd21NSkRkV0JJVXlUL1NJeEUyWWVkSUM0ZjFPOHZ0RnR3?=
 =?big5?B?Qy9uOXBISzczcDhuVEVHeFBJY1gyQnl1SHY3dFVLYlllTWs4QlQ1ekplUUhSdFRO?=
 =?big5?B?dGtPdkNDZVRBSVd6TEs3c3owK3B2b2gvcnBSRUxHNDhFYlFKN3hBQnRzK1JGQ1p6?=
 =?big5?B?bnJJSXFTV1F4c2tMcmJNY3VDRFhLZW4xM2tmTDRrZ3h5SFBzdko1YU4xLzR0UUE1?=
 =?big5?B?SnFYVlRXTTl6YXRYczFxaHZWRUMwaUcvVDdXSW1hVTFGYTBYZXFKbnRwRmt0akpu?=
 =?big5?B?bFFQRVRyKzcvcTRhN0locmxKNzB4VDlHcFRVcU9xMWZVNnNPOGFuL0NEeHpZenQ2?=
 =?big5?B?YUtGbkkxL29DOTliRXIvUEFCZm1pVUNYd0VxWndNeWg3bEd5S2pOUUJLb2d2WERY?=
 =?big5?B?OStuV0xDRlZnNlM1eC9vOVI0L2h2bFhWK045UG0vQWwybjQ4S05Vd2RPdHhBcXlm?=
 =?big5?B?a2IrQWpTdTJPb2hmSGFHeGRlTXFJeDNSVHNwd09nVkhCbzlVN1JIdHdqdEhwZGIv?=
 =?big5?B?MlFtRlhsUlM1SUVlcGlHT000L0VHa0hCUElTOTdGVGk5dlcrWFhDMk11Q2txaCtL?=
 =?big5?B?MzY0bHpnVUFWb2lPVm9YK29uMm1xM1htVVNyTkxrMkZ4Q1dqNU9LUnJnWVlZUEcy?=
 =?big5?B?WFMvM3dCNWhkVU1EWlVvTUV6NWdaNUk4SURFT2NEY0dWc1RLcDF5NWkvWmxyNkJz?=
 =?big5?B?WC9LUkd4QzBqWFpxaXhiaHNENGU1ZW5KZ1o1UExxMnJSYjNDWFJ3V0JBMUF4NktH?=
 =?big5?B?cXhQekFkZ2hHN3FJWXZ3TWt6MlRZVk5PY1UvZS96THRwbjN2NUd1ZnhJNmFjQXI5?=
 =?big5?B?RjkyTHIrQXViRm02N0VrbUtYMXU1R1FKR0RKU1VtMDdTVUI0V1lYcWwxa013TUg1?=
 =?big5?B?Qzg3YVRMWGVoVHJVQkxiSGhOS3ZkNEtNSGxiN2RVajhmMEdVR3RkN2JvWkNRNE5p?=
 =?big5?B?WmNZTTJ6S25QRnVWbnZDc2NMQlU1RVhvZklnZGhBa1M2akFCK25iWmltQUdMN3BQ?=
 =?big5?B?dERreDhZMG1HeTZuVlZMcmhlVHVCVFdiMWR4UkJIcEx1TGsrdldTUyt0MytJbEl3?=
 =?big5?B?K0ZoQmEzeXZMWXJTelVyQ3owejZnM29mbjE5aFE5K01LbFJINUM0TTFZMFB5c1Zq?=
 =?big5?B?QWFSLzVnUk5oTWhrSTRRaXdWZGpjU2Y2Tit3TkdERUdNcVd0QVpVWXFidUFQRU1h?=
 =?big5?B?UzNBN1dXMkRDRUtTRk03QUJmRHpzeS9XSEY4NUR4c2p5aTRzenAzSVNRKzdMSXZD?=
 =?big5?Q?KfiSYk3E61sl3Nelr0fMw2JQwUPDRtgrDYI3LP+xuyw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eed1bdbb-c36c-4d20-31d8-08dc7659807f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 10:09:55.9287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MreaZ/JhikDELC3wpC1znvHdEJ2vOUBpk+39vuiy0uk3WEW+jEUqrEnYAlMohTKJNqEYRizazuFq8mXC48WYyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6923

cmVsYXRlZCB0bzogaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvZWNyeXB0ZnMvK2J1Zy8xODkw
NDg2CgpUaGlzIGJ1ZyBoYXBwZW5zIGluIHRoZSB0d28gZm9sbG93aW5nIHNpdHVhdGlvbnM6CmNw
IC1wOiBjb3B5IGEgZmlsZSBhbmQgcHJlc2VydmUgaXRzIGF0aW1lIGFuZCBtdGltZQp0b3VjaCAt
cjogdG91Y2ggYSBmaWxlIGFuZCB1c2UgYSByZWYgZmlsZSdzIHRpbWUgaW5zdGVhZCBvZiBjdXJy
ZW50IHRpbWUKCkluIGZzL2F0dHIuYyBub3RpZnlfY2hhbmdlKCksIGF0aW1lIGFuZCBtdGltZSBp
cyB0cnVuY2F0ZWQgYnkgdGltZXN0YW1wX3RydW5jYXRlKCksCmVjcnlwdGZzIGdldHMgd3Jvbmcg
c190aW1lX2dyYW4gKDEwXjkgaW5zdGVhZCBvZiBvcmlnaW5hbCBmcyB0aW1lIGdyYW51bGFyaXR5
KSBhbmQKdHJ1bmNhdGVzIGEvbXRpbWUgdG8gd2hvbGUgc2Vjb25kLiBTZXR0aW5nIHNfdGltZV9n
cmFuIHdoZW4gbW91bnRpbmcgZWNyeXB0ZnMKIHNvbHZlcyB0aGUgaXNzdWUuIAoKU2lnbmVkLW9m
Zi1ieTogRnJhbmsgSHNpYW8gv72qa6vFIDxmcmFua2hzaWFvQHFuYXAuY29tPgoKZGlmZiAtLWdp
dCBhL2ZzL2VjcnlwdGZzL21haW4uYyBiL2ZzL2VjcnlwdGZzL21haW4uYwppbmRleCBiMmY2YTE5
MzdkMjM5Li4xOWRiZTlkMTE4N2UxIDEwMDY0NAotLS0gYS9mcy9lY3J5cHRmcy9tYWluLmMKKysr
IGIvZnMvZWNyeXB0ZnMvbWFpbi5jCkBAIC01NjcsNiArNTY3LDcgQEAgc3RhdGljIHN0cnVjdCBk
ZW50cnkgKmVjcnlwdGZzX21vdW50KHN0cnVjdCBmaWxlX3N5c3RlbV90eXBlCiAqZnNfdHlwZSwg
aW50IGZsYWdzCiAJcy0+c19ibG9ja3NpemUgPSBwYXRoLmRlbnRyeS0+ZF9zYi0+c19ibG9ja3Np
emU7CiAJcy0+c19tYWdpYyA9IEVDUllQVEZTX1NVUEVSX01BR0lDOwogCXMtPnNfc3RhY2tfZGVw
dGggPSBwYXRoLmRlbnRyeS0+ZF9zYi0+c19zdGFja19kZXB0aCArIDE7CisJcy0+c190aW1lX2dy
YW4gPSBwYXRoLmRlbnRyeS0+ZF9zYi0+c190aW1lX2dyYW47CiAKIAlyYyA9IC1FSU5WQUw7CiAJ
aWYgKHMtPnNfc3RhY2tfZGVwdGggPiBGSUxFU1lTVEVNX01BWF9TVEFDS19ERVBUSCkgewo=

