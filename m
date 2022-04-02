Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 930DE4F060C
	for <lists+ecryptfs@lfdr.de>; Sat,  2 Apr 2022 22:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbiDBUJn (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sat, 2 Apr 2022 16:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiDBUJn (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sat, 2 Apr 2022 16:09:43 -0400
X-Greylist: delayed 331 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 02 Apr 2022 13:07:50 PDT
Received: from mta-out-04.alice.it (mta-out-04.alice.it [217.169.118.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1C5DF1017D2
        for <ecryptfs@vger.kernel.org>; Sat,  2 Apr 2022 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alice.it; s=20211207; t=1648930070; 
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        h=Reply-To:From:To:Date:Message-ID:MIME-Version;
        b=mXaNGzuYLEvv8jHkMPLeNaazGme4+5RGSwQHnE2ZvNmd2Iz6jvm3oeGyr+hb70KLE+eOBRVQ3+lm9k+G1y+RcjyF0kWFB+CiwVcMGXoKJsPxTPr38tKuSvZbVgAiQ0AvhREKKvkxozcZKd+uCB7QUz6ocahtVV1DZ6GGE1O2ccXyzxi7ble5+E96e7ZDYKNDIt4PIMNRAWBv2s1yVGWkz3LSrE7fs5hkZ/sp8P0py5dFYfYTJ0bcJ5HJGLHSqKoV+HqV91pwedVJY9QsTDqDUPvXzlfEziDepLeuOjJBosVBDL4rGwInkD1GmYA2+vYXZZpFLd6nKC36HmErwUutmA==
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvvddrudeikedgudegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfvgffngfevqffokffvtefnkfetpdfqfgfvnecuuegrihhlohhuthemuceftddunecugfhmphhthicushhusghjvggtthculddutddmnefgmhhpthihucgsohguhiculdehtddmnecujfgurheprhfhvfffkfggsedttdeftddttddtnecuhfhrohhmpeghvgcuhhgrvhgvucgrnhcuohhffhgvrhcuthhouchinhhvvghsthcuihhnucihohhurhcutghouhhnthhrhicuuhhnuggvrhcurgcujhhoihhnthcuvhgvnhhtuhhrvgcuphgrrhhtnhgvrhhshhhiphcuphhlvggrshgvuchrvghplhihuchfohhruchmohhrvgcuuggvthgrihhlshcuoegsihhrohhlohesrghlihgtvgdrihhtqeenucggtffrrghtthgvrhhnpeetffeulefhheffieeltefgvedtffejhedtheefhfevueeitdeiffeuhfehudffudenucfkphepudelkedrkedrkeehrddvhedtnecuvehluhhsthgvrhfuihiivgepfeegudenucfrrghrrghmpehhvghloheprghlihgtvgdrihhtpdhinhgvthepudelkedrkedrkeehrddvhedtpdhmrghilhhfrhhomhepsghirhholhhosegrlhhitggvrdhithdpnhgspghrtghpthhtohepuddprhgtphhtthhopegvtghrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-RazorGate-Vade-Verdict: clean 60
X-RazorGate-Vade-Classification: clean
Received: from alice.it (198.8.85.250) by mta-out-04.alice.it (5.8.807.04) (authenticated as birolo@alice.it)
        id 623DC2DC00DF675E for ecryptfs@vger.kernel.org; Sat, 2 Apr 2022 22:02:17 +0200
Reply-To: dougfied20@inbox.lv
From:   We have an offer to invest in your country under a
         joint venture partnership please reply for more
         details <birolo@alice.it>
To:     ecryptfs@vger.kernel.org
Date:   02 Apr 2022 13:02:14 -0700
Message-ID: <20220402130214.7092C7BEEB955EF1@alice.it>
MIME-Version: 1.0
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,BODY_EMPTY,
        DKIM_INVALID,DKIM_SIGNED,EMPTY_MESSAGE,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,MISSING_SUBJECT,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [217.169.118.10 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5341]
        *  0.0 RCVD_IN_MSPIKE_L4 RBL: Bad reputation (-4)
        *      [217.169.118.10 listed in bl.mailspike.net]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [birolo[at]alice.it]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dougfied20[at]inbox.lv]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.3 EMPTY_MESSAGE Message appears to have no textual parts and no
        *      Subject: text
        *  1.8 MISSING_SUBJECT Missing Subject: header
        *  0.1 DKIM_INVALID DKIM or DK signature exists, but is not valid
        *  0.0 RCVD_IN_MSPIKE_BL Mailspike blacklisted
        *  0.0 BODY_EMPTY No body text in message
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

