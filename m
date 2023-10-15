Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E67127C9C7F
	for <lists+ecryptfs@lfdr.de>; Mon, 16 Oct 2023 00:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjJOWsy (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Sun, 15 Oct 2023 18:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjJOWsx (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sun, 15 Oct 2023 18:48:53 -0400
X-Greylist: delayed 397 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 15 Oct 2023 15:48:48 PDT
Received: from gigared.com.ar (saga.gigared.com.ar [190.57.228.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D10C5
        for <ecryptfs@vger.kernel.org>; Sun, 15 Oct 2023 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=gigared.com.ar; s=dkim; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Subject:Message-ID:Reply-To:From:Date:Sender:To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+AKy/BBrYAlSJQT3+oOpU9EK6U1mY8v1ufpp66llMzU=; b=vi0Ly5YIhh5eWvN6tVOb1ZmosB
        0enbraNH35R7I3WtAjhwU2gryp+Vln1eUuvjWl39VUhMP8Lzw9MNWktIqOqj+GxZkA/dhDtpegcrQ
        Fvuaw9bYX6/q9zVU0OeJas5x7NHWr2y60umFJJB9OZR3rxkJsKhghN+yA2gb1Oh5T8QY=;
Authentication-Results: localhost;
        iprev=pass (smtp.gigared.com.ar) smtp.remote-ip=190.7.31.233;
        spf=pass smtp.mailfrom=gigared.com.ar;
        dmarc=pass header.from=gigared.com.ar
Received: from maskedhost [127.0.0.1] by example.com stage1 with esmtps 
        (Exim MailCleaner) 
        id 1qs9mt-00077f-2k  
        from <eojeda@gigared.com.ar>;
        Sun, 15 Oct 2023 19:40:43 -0300
Received: from mail.gigared.com.ar (localhost [127.0.0.1])
        by mail.gigared.com.ar (Postfix) with ESMTPS id 0190F5379F3D2;
        Sun, 15 Oct 2023 19:35:00 -0300 (-03)
Received: from mail.gigared.com.ar (localhost [127.0.0.1])
        by mail.gigared.com.ar (Postfix) with ESMTPS id 1B2CB5E7C1FA5;
        Sun, 15 Oct 2023 19:34:59 -0300 (-03)
Received: from mail.gigared.com.ar (mail.gigared.com.ar [192.168.252.233])
        by mail.gigared.com.ar (Postfix) with ESMTP id 19FDD593DC76E;
        Sun, 15 Oct 2023 19:34:52 -0300 (-03)
X-MailCleaner-SPF: pass
Date:   Sun, 15 Oct 2023 19:34:52 -0300 (ART)
From:   Infos <eojeda@gigared.com.ar>
Reply-To: Infos <quartbvba@gmail.com>
Message-ID: <552805821.12210774.1697409292063.JavaMail.zimbra@gigared.com.ar>
Subject: Infos Oktober 2023
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [156.0.251.40]
X-Mailer: Zimbra 8.8.15_GA_4562 (zclient/8.8.15_GA_4562)
Thread-Index: jsV4qWp53bIWrzhhF3rYcrS4aLi3Ww==
Thread-Topic: Infos Oktober 2023
X-MailCleaner-TrustedIPs: Ok
X-MailCleaner-TLS-Client-Certificate: none
X-Spam-Status: Yes, score=6.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        HK_RANDOM_REPLYTO,MISSING_HEADERS,RCVD_IN_DNSWL_BLOCKED,
        REPLYTO_WITHOUT_TO_CC,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [190.57.228.68 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  1.0 HK_RANDOM_REPLYTO Reply-To username looks random
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  1.0 MISSING_HEADERS Missing To: header
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.6 REPLYTO_WITHOUT_TO_CC No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Hallo Herr/Frau,


Wir haben nicht die Absicht, Ihre Zeit zu verschwenden.


Wir vergeben Kredite an Privatpersonen und Unternehmen. Der Zinssatz betr=
=C3=A4gt 2 % j=C3=A4hrlich. Wir haben die Kapazit=C3=A4t, Projekte in diese=
n Bereichen zu finanzieren; Immobilienentwicklung, Bauwesen, Bergbau, =C3=
=96l und Gas, Fluggesellschaft und verschiedene Handelsaktivit=C3=A4ten. Be=
i Interesse geben Sie bitte Folgendes an:


1- Vollst=C3=A4ndiger Name:
2- Erforderlicher Kreditbetrag:
3- Amortisationsdauer (1 =E2=80=93 30 Jahre):
4- Telefonnummer:
5- WhatsApp-Nummer:


Sobald ich die oben genannten Informationen erhalten habe, sende ich Ihnen =
die Kreditbedingungen zu.


Ihr R=C3=BCckerstattungsplan beginnt nach 6 Monaten (6-monatige Kulanzfrist=
).


Die Finanzierung dauert etwa 7 Bankarbeitstage ab dem Tag, an dem Sie Ihren=
 Kreditantrag einreichen.


Antworten Sie uns f=C3=BCr weitere Informationen.


Mit freundlichen Gr=C3=BC=C3=9Fen

Uwe Wanner
