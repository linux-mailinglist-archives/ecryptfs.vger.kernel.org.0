Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A5568BB9F
	for <lists+ecryptfs@lfdr.de>; Mon,  6 Feb 2023 12:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjBFLdw (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 6 Feb 2023 06:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjBFLde (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 6 Feb 2023 06:33:34 -0500
Received: from formenos.hmeau.com (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409C41E1D8;
        Mon,  6 Feb 2023 03:33:24 -0800 (PST)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1pOydu-007zio-0W; Mon, 06 Feb 2023 18:22:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 06 Feb 2023 18:22:34 +0800
From:   "Herbert Xu" <herbert@gondor.apana.org.au>
Date:   Mon, 06 Feb 2023 18:22:34 +0800
Subject: [PATCH 11/17] dm: Remove completion function scaffolding
References: <Y+DUkqe1sagWaErA@gondor.apana.org.au>
To:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        Tyler Hicks <code@tyhicks.com>, ecryptfs@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Jon Maloy <jmaloy@redhat.com>,
        Ying Xue <ying.xue@windriver.com>,
        Boris Pismenny <borisp@nvidia.com>,
        John Fastabend <john.fastabend@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org
Message-Id: <E1pOydu-007zio-0W@formenos.hmeau.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,PDS_RDNS_DYNAMIC_FP,
        RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

This patch removes the temporary scaffolding now that the comletion
function signature has been converted.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 drivers/md/dm-crypt.c     |    6 +++---
 drivers/md/dm-integrity.c |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 7609fe39ab8c..3aeeb8f2802f 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1458,7 +1458,7 @@ static int crypt_convert_block_skcipher(struct crypt_config *cc,
 	return r;
 }
 
-static void kcryptd_async_done(crypto_completion_data_t *async_req, int error);
+static void kcryptd_async_done(void *async_req, int error);
 
 static int crypt_alloc_req_skcipher(struct crypt_config *cc,
 				     struct convert_context *ctx)
@@ -2146,9 +2146,9 @@ static void kcryptd_crypt_read_convert(struct dm_crypt_io *io)
 	crypt_dec_pending(io);
 }
 
-static void kcryptd_async_done(crypto_completion_data_t *data, int error)
+static void kcryptd_async_done(void *data, int error)
 {
-	struct dm_crypt_request *dmreq = crypto_get_completion_data(data);
+	struct dm_crypt_request *dmreq = data;
 	struct convert_context *ctx = dmreq->ctx;
 	struct dm_crypt_io *io = container_of(ctx, struct dm_crypt_io, ctx);
 	struct crypt_config *cc = io->cc;
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index eefe25ed841e..c58156deb2b1 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -955,9 +955,9 @@ static void xor_journal(struct dm_integrity_c *ic, bool encrypt, unsigned sectio
 	async_tx_issue_pending_all();
 }
 
-static void complete_journal_encrypt(crypto_completion_data_t *data, int err)
+static void complete_journal_encrypt(void *data, int err)
 {
-	struct journal_completion *comp = crypto_get_completion_data(data);
+	struct journal_completion *comp = data;
 	if (unlikely(err)) {
 		if (likely(err == -EINPROGRESS)) {
 			complete(&comp->ic->crypto_backoff);
