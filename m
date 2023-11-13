Return-Path: <ecryptfs+bounces-5-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8727E9FA7
	for <lists+ecryptfs@lfdr.de>; Mon, 13 Nov 2023 16:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C45D1C2088C
	for <lists+ecryptfs@lfdr.de>; Mon, 13 Nov 2023 15:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0385A20B0B;
	Mon, 13 Nov 2023 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYimsgRg"
X-Original-To: ecryptfs@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C1D21355
	for <ecryptfs@vger.kernel.org>; Mon, 13 Nov 2023 15:12:08 +0000 (UTC)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659811727
	for <ecryptfs@vger.kernel.org>; Mon, 13 Nov 2023 07:12:06 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-677a0ac3797so15724096d6.1
        for <ecryptfs@vger.kernel.org>; Mon, 13 Nov 2023 07:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699888326; x=1700493126; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JllOUDR4n2TJ2/9Vhr0S4nCgmiReyj9UQsBr1/jx7uU=;
        b=OYimsgRgdCdGz7mKjbQi5VQjVAS72qX6UCtUdnnDjnO+V+ZTDt55mkNzmxBQ2Kh4Df
         e1IZz0LMOXZMdS+zk5Sv92fbQKJrjQzrRCu4TDsR37eByuVgUuOS9AME7767QtAN7oP0
         p9MhtotM71BdZCs2F5WIZymUvm0w9otkaE3OTjfEKaNutVybafeW0j2TLBPgxuykxRPu
         MrAbuOyNi+FYj5oTMaWnFuNS+B7g2wvEmT8IfhOeWPUzWoLxHWSqJZ2J6noj+mR4MdZF
         2V/h5b6juCb2A8/HA1cZFAvb6MeYuBRcIKj0Pt7Iy2umu943oiBt1tZmdvsG3bKc0VY5
         1EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888326; x=1700493126;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JllOUDR4n2TJ2/9Vhr0S4nCgmiReyj9UQsBr1/jx7uU=;
        b=UAc4IIiSsyd7J7PWTLHmj48Y8qwhFk2RyXvJbehHYWk/XIoy0OJ92Van9IFmZ+YaqE
         TXReS5V2eF42WnspNE0AruX2NAa4DFtHAKVTM1nbbXK5RCJtgODjL+bywHB/0zqAXQly
         JTYGlnquB3SOeIzizyRUlIZODGryOK2hoKElSWUi9EpJR6rGZD2Cju71BAV2kuxkaGcN
         DX6du+xkgYNS1ICEj0aW4yxT8FxhH1yIQBum8H1agFhkvRN6vXAISDag05CESilrsva7
         AMNV68AVNe6q+pbv7Ou2935ghw8GztmvKwD35nxkC/m4KKiGLe78jgwqYkmsIVuPBRJC
         nF+Q==
X-Gm-Message-State: AOJu0YwH3TZ+2FinqcHzGsR1sG2Z986dD3Gr1GTL9yLAi/+TIE0Fjbnj
	2BbgAGhN78Mu9+CPNXkN1vNlvrofwAI=
X-Google-Smtp-Source: AGHT+IH4J4qf6teFrMP8hrdsUlszOR77mKsq3b9KyckQ819ifmq+aOyJ3wxTZqVDxdTdx+tr7CGyOQ==
X-Received: by 2002:ad4:58a2:0:b0:671:3493:61db with SMTP id ea2-20020ad458a2000000b00671349361dbmr4844614qvb.51.1699888325893;
        Mon, 13 Nov 2023 07:12:05 -0800 (PST)
Received: from [198.135.52.44] ([198.135.52.44])
        by smtp.gmail.com with ESMTPSA id lg10-20020a056214548a00b0066d1b4ce863sm2139850qvb.31.2023.11.13.07.12.05
        for <ecryptfs@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2023 07:12:05 -0800 (PST)
From: Peter Wilson <monchocecilia6@gmail.com>
X-Google-Original-From: Peter Wilson <info@alrigga.com>
Message-ID: <d38c95d461a292a51f06f84451704945398cbfa4dcb4b4415f6799979ac2e210@mx.google.com>
Reply-To: rpdexpacc@gmail.com
To: ecryptfs@vger.kernel.org
Subject: :once again
Date: Mon, 13 Nov 2023 07:12:04 -0800
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Spam-Level: *

Hello ecryptfs,

Are you Thinking of starting a new project or expanding your business? We can fund it. Terms and Conditions Apply.

Regards,
Peter Wilson

