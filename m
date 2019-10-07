Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E479CDD93
	for <lists+ecryptfs@lfdr.de>; Mon,  7 Oct 2019 10:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfJGIpq (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 7 Oct 2019 04:45:46 -0400
Received: from ns1.tgtizmir.com ([217.116.196.59]:42624 "EHLO ns1.tgtizmir.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbfJGIpq (ORCPT <rfc822;ecryptfs@vger.kernel.org>);
        Mon, 7 Oct 2019 04:45:46 -0400
X-Greylist: delayed 17630 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Oct 2019 04:45:44 EDT
Received: from 127.0.0.1 (localhost [127.0.0.1])
        by ns1.tgtizmir.com (Postfix) with SMTP id 57FCA54CFD0;
        Mon,  7 Oct 2019 04:30:39 +0300 (+03)
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received: from [153.77.229.109] by 127.0.0.1 SMTP id wI8bP545DDjjs4 for <ecfgbybxr@gmail.com>; Mon, 07 Oct 2019 07:31:39 +0600
Message-ID: <b-0-$26i7l$h@jv4.axb7fmt>
From:   "Mr Barrister Hans Erich" <dave@dbsoundfactory.com>
Reply-To: "Mr Barrister Hans Erich" <dave@dbsoundfactory.com>
To:     ecfgbybxr@gmail.com
Subject: RE:PERSONAL LETTER FROM MRS RASHIA AMIRA
Date:   Mon, 07 Oct 19 07:31:39 GMT
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2910.0)
MIME-Version: 1.0
Content-Type: multipart/alternative;
        boundary="BB118ED_BAB2D5FF1EA50F"
X-Priority: 3
X-MSMail-Priority: Normal
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org


--BB118ED_BAB2D5FF1EA50F
Content-Type: text/plain;
Content-Transfer-Encoding: quoted-printable

Greetings

My name is Barrister Hans Erich.

I have a client who is interested to invest in your country, she is a well=
 known politician in her country and deserve a lucrative investment partne=
rship with you outside her country without any delay   Please can you mana=
ge such investment please Kindly reply for further details.

Your full names --------


Your urgent response will be appreciated

Thank you and God bless you.

Barrister Hans Erich

Yours sincerely,
Barrister Hans Erich
CONTACT: hanserich9helmut@gmail.com

--BB118ED_BAB2D5FF1EA50F--

