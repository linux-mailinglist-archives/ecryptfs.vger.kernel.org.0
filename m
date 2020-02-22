Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D08A81691D4
	for <lists+ecryptfs@lfdr.de>; Sat, 22 Feb 2020 21:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgBVUxy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+ecryptfs@lfdr.de>); Sat, 22 Feb 2020 15:53:54 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.69]:36243 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726817AbgBVUxy (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Sat, 22 Feb 2020 15:53:54 -0500
Received: from [100.112.199.4] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 84/AD-06294-BD4915E5; Sat, 22 Feb 2020 20:53:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOJsWRWlGSWpSXmKPExsVi93Vmku7tKYF
  xBh2T2C3ezrrBbvHh5iQmiwOH57BYTD58nsmi/ZajxZ2Z/9ktWs8+Y7F4e3c5u8WL3ttMFl1X
  upksTn37wmbxbtMpJosVayYwWjRPWwQ0pOMUo8WNOw+ZLA6ta2C26HrwmNVi3veZLBbfb9Y4i
  Hh83iTn8fbtRXaPv++msHg8fPyYzePeiq8sHk8XP2b2+Dyngc3j77YpjB7zL+xn9nj0+iO7x+
  Mnn5kCuKNYM/OS8isSWDN6dl9gK2CoAFENjAxdjFwcQgJbGSV2HnjO3sXIycEsoCdxY+oUNhC
  bV0BQ4uTMJywQcW2JZQtfM3cxcgDZahJfu0pAwsICdhLv/s0DaxURUJX4umcmK4jNJiAj8fPo
  brA4C1B8w5ajYHEhAUWJt+s2soGM4RXwk/ixpRQm3Ny0AmyrBJC99FobC4RtJbFtSTs7hK0ps
  f7dcnaQVgkBBYnPM4whwvISHy/MYJzAKDgLyf2zkNw/C8n9sxDuX8DIsorRIqkoMz2jJDcxM0
  fX0MBA19DQSNfQ0kLX0MJEL7FKN0kvtVS3PLW4RNdQL7G8WK+4Mjc5J0UvL7VkEyMw/lMKju3
  YwXhk+Xu9Q4ySHExKory6EwPjhPiS8lMqMxKLM+KLSnNSiw8xmnBwCHQ+/7CaUeDC2YefGAWu
  fPjUxCTFkpefl6okwWs5GahHsCg1PbUiLTMHmLpg2iQ4eJREeNlARvIWFyTmFmemQ6ROMVpy3
  HsydxEzx8aj84Dk7O2LFzELgc2TEud9DTJPAKQhozQPbhwsvV5ilJUS5mVkYGAQ4ilILcrNLE
  GVf8UozsGoJMx7CGQKT2ZeCdzWV0AHMQEdpMwRAHJQSSJCSqqByeD9w9JVr6e8e3uz5Mmh5Ff
  u2yS3dXGvMC7y27TX5fC0AxrZa5c8+BLNlf1aNSbLf3lnIdtP+aNFbz22LzaK6nr9d8ZmhZhA
  1hcCL1f07nh+9vjPi1dO3XfLPJD3MpdZO63mrd/zY14dhXu07jxz2GJ04eECNvutz65mmujOl
  jebc8vXn/+a8drJih////4U9FH7vpZV8Yq9q7uWhF+0+X+0K6rtZFLGtENPrm0QkfDOfJ4r/U
  XPJGJPyFyRnypNiTvX+0w9XPZos5HouzOXlx2/PHfiNo0Dfx7pmxqazAgrXMy47KIhd+6rVk3
  DwltFojLRk1uWljinL/loM6eXh+vW4crz9w6XbX/wg8VE/ReXEktxRqKhFnNRcSIAH52/jCoE
  AAA=
X-Env-Sender: michael.larcher@rothof.de
X-Msg-Ref: server-12.tower-288.messagelabs.com!1582404820!1797956!17
X-Originating-IP: [62.245.153.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29176 invoked from network); 22 Feb 2020 20:53:47 -0000
Received: from host-62-245-153-98.customer.m-online.net (HELO Sport-Exchange.ROTHOF.local) (62.245.153.98)
  by server-12.tower-288.messagelabs.com with ECDHE-RSA-AES256-SHA encrypted SMTP; 22 Feb 2020 20:53:47 -0000
Received: from jmapnzin.host-stage-dns.com (188.165.89.95) by
 Sport-Exchange.ROTHOF.local (192.168.100.3) with Microsoft SMTP Server id
 14.3.123.3; Sat, 22 Feb 2020 21:53:36 +0100
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Description: Mail message body
Subject: Re: I have a business for you, if you are interested!
To:     Recipients <michael@ROTHOF.local>
From:   <michael@ROTHOF.local>
Date:   Sun, 23 Feb 2020 04:53:36 +0800
Reply-To: <lizawong@infohsbc.net>
Message-ID: <50a903d7-0454-42bb-96b4-9fd482e3d868@SPORT-EXCHANGE.ROTHOF.local>
X-Originating-IP: [188.165.89.95]
X-TM-AS-Product-Ver: SMEX-11.7.0.1065-8.500.1020-25246.005
X-TM-AS-Result: Yes-48.583700-5.000000-31
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
Sender: ecryptfs-owner@vger.kernel.org
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org


