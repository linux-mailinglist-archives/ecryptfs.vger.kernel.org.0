Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49DF2138C14
	for <lists+ecryptfs@lfdr.de>; Mon, 13 Jan 2020 07:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgAMGxf (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Mon, 13 Jan 2020 01:53:35 -0500
Received: from mail01.vodafone.es ([217.130.24.71]:64176 "EHLO
        mail01.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgAMGxf (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Mon, 13 Jan 2020 01:53:35 -0500
IronPort-SDR: SrpmCJn3bpodvRlrNCR/QgEwHepiTt+KkVIcPbqKSqqEboctnkH2WS1rBEzdzbWqXIoDw6LWCN
 pLrsXXhVNKCw==
IronPort-PHdr: =?us-ascii?q?9a23=3AkeClDxPNMOwT+2Rnr1sl6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0IvT8rarrMEGX3/hxlliBBdydt6sfzbCI4uu5ATVIyK3CmUhKSIZLWR?=
 =?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
 =?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfL1/IA+ooQjQssQajpZuJrosxh?=
 =?us-ascii?q?DUvnZGZuNayH9yK1mOhRj8/MCw/JBi8yRUpf0s8tNLXLv5caolU7FWFSwqPG?=
 =?us-ascii?q?8p6sLlsxnDVhaP6WAHUmoKiBpIAhPK4w/8U5zsryb1rOt92C2dPc3rUbA5XC?=
 =?us-ascii?q?mp4ql3RBP0jioMKjg1/GbKhMNslq1bpRKgqwVhzo7TeoGVLP1+frnHctMGW2?=
 =?us-ascii?q?VNR9heVypYDo6gc4sPE/AOMvpYr4bjolsBsx2+BRW1COzxzD9En3j43ao80+?=
 =?us-ascii?q?s/EQDKxRIvH9QTu3jQotj5KLseXeWzwaLVzzvMculW1C/z5obIaBAvv/KCU6?=
 =?us-ascii?q?9/fsXNxkciDB/Fg1eMpoD5Iz+ZyvoBvm6G5ORgT+KvjGsnphlrrDex2scjlJ?=
 =?us-ascii?q?PJjZ8VxVDD8yV5z5s+KNqgSEFlfd6rDoFQti+dN4twTcMvWGFouD0hxbIao5?=
 =?us-ascii?q?K0YC8KyJE9yx7faPyKao6F6Q/gWuaJOTp0mm9pdbClixqv/0Ws1vfwWte73V?=
 =?us-ascii?q?pQoCdIkt/BvW0X2RPJ8MiIUP5981+k2TaIyg/c9PlJIVsxlarHM54hxaMwlo?=
 =?us-ascii?q?YLvUTDACD2nEL2gbeTdko+++io7/7nbavippOAOIJ4kB/+MqMzlcOlD+Q4NQ?=
 =?us-ascii?q?4OUHaB9euiz73v5Uz5QLNUgf0qiqTVro3WKMYBqqKkDQJZzpwv5wiwAju83t?=
 =?us-ascii?q?kVnWELLFdfdxKGi4jpNUvOIPf9Dfqnm1SjjitryO7cPrzvBZXNKHfDnazhfb?=
 =?us-ascii?q?Zm8EFT1BA/wsxY55JREL0BIPHzVlfrtNPEFh85LxC0w+H/BdpjyoweQ2KOAr?=
 =?us-ascii?q?eFMKPcql+F/fwvI+aSa48Pojr9KOYq5+TojXAnnV8RZ66p3YEYaCPwIvMzLk?=
 =?us-ascii?q?6DcGLwjMwpD2gHpEw9QfbshVnEViRcNEy/R6Yt2jZuMI+6AJ2LeYerj/TVxC?=
 =?us-ascii?q?qnE4dJYWZJClOMCn3jX4qBUvYILimVJ5kyvCYDUO2ZRpMsz1mRswn1g+5/I/?=
 =?us-ascii?q?bZ4DIfs53L1MN/7KvYkhR09T8iXJfV6H2EU2whxzBAfDQxxq0q+hQlxw=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ETKgBzExxemCMYgtkUBjMYGgEBAQE?=
 =?us-ascii?q?BAQEBAQMBAQEBEQEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4E?=
 =?us-ascii?q?Agx4VhggTDIFbDQEBAQEBNQIBAYRATgEXgRAkOgQNAgMNAQEFAQEBAQEFBAE?=
 =?us-ascii?q?BAhABAQEBAQYNCwYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4M?=
 =?us-ascii?q?EgksBATOFIJc/AY0EDQ0ChR2CRQQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggG?=
 =?us-ascii?q?CfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYg?=
 =?us-ascii?q?DhE6BfaM3V4EMDXpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IPAS-Result: =?us-ascii?q?A2ETKgBzExxemCMYgtkUBjMYGgEBAQEBAQEBAQMBAQEBE?=
 =?us-ascii?q?QEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4EAgx4VhggTDIFbD?=
 =?us-ascii?q?QEBAQEBNQIBAYRATgEXgRAkOgQNAgMNAQEFAQEBAQEFBAEBAhABAQEBAQYNC?=
 =?us-ascii?q?wYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4MEgksBATOFIJc/A?=
 =?us-ascii?q?Y0EDQ0ChR2CRQQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggGCfwESAWyCSIJZB?=
 =?us-ascii?q?I1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYgDhE6BfaM3V4EMD?=
 =?us-ascii?q?XpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,428,1571695200"; 
   d="scan'208";a="304627204"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 13 Jan 2020 07:53:33 +0100
Received: (qmail 10698 invoked from network); 12 Jan 2020 05:08:49 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <ecryptfs@vger.kernel.org>; 12 Jan 2020 05:08:49 -0000
Date:   Sun, 12 Jan 2020 06:08:44 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     ecryptfs@vger.kernel.org
Message-ID: <23782898.487134.1578805729190.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

