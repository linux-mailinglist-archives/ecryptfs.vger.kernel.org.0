Return-Path: <ecryptfs-owner@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE7995537C1
	for <lists+ecryptfs@lfdr.de>; Tue, 21 Jun 2022 18:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350254AbiFUQVZ (ORCPT <rfc822;lists+ecryptfs@lfdr.de>);
        Tue, 21 Jun 2022 12:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350635AbiFUQVX (ORCPT
        <rfc822;ecryptfs@vger.kernel.org>); Tue, 21 Jun 2022 12:21:23 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDA62CE2B
        for <ecryptfs@vger.kernel.org>; Tue, 21 Jun 2022 09:21:22 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id h23so28550857ejj.12
        for <ecryptfs@vger.kernel.org>; Tue, 21 Jun 2022 09:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=lXi9K7vD8N/FnacISvYAg2cM+ZYSpGG5L5CiYcv67vY=;
        b=VcsaqLtjq/E8yR8N9n4OmmpM5BSRGyJn/MQ/HuiTOwhhMLacA4978/bGIrgtINLoVv
         cW1e/Rm6ZycBSf31EbXudRoVJYnX0PnT+LrNBetQG/cSe0EMFGODwS79xqxM7lh2h16f
         lIegGimgvZYVns97492URcDiqb2uOCL7psXtE3KteGnXGuNExOB88hQ6BA3AXQnmZS8k
         aMMNRIwI5o3eJTittSeOHvJVpvozvJ3BMRvuHGv3i0GRuN8xQ/xgIStjg5r83L7pHgKd
         4P5KwuHhyYvjV/r+Ep+mpLnhqdf6W6C4uO/eLGWsQ4we0Ork6GTtzFQqQvUbrXPqjC2T
         FNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=lXi9K7vD8N/FnacISvYAg2cM+ZYSpGG5L5CiYcv67vY=;
        b=5TG4JJ0kwnIZrhm35lc7MSR1R6UqMGfFFwPqnSZYAYbJ3uMSTmiqzAfwmqaJ7zpf5v
         uUK8xIWzV6x+m4W2O7lcS0MKU11Yij3zkO+oBtXuOsfDcZhktl9HyndNgdkdLJ1W3axt
         bPUpHVov4+DVFegeXEceoZeiGzNeN8bCfQVC/pKApEqtHAxboSjfBFDqWuevS8I/B1jF
         riyu69UtsKKXL2g3c/5rcqQm3VSwqAFV0KPEA9hAbVu/UxJ9PvXu89zb1iqaU6kGLCub
         ikR2aRA2c60J5BzQLUY2GG8GdGlxiK0J0ZYBnpDuHxyZnpx3IejU25STD/Cl/tceoLxw
         /PlQ==
X-Gm-Message-State: AJIora/g1ZMcwqZo0nAAODRN41c9TisJpItHQdnQtgzsKrvzvlxud3L1
        y4E4oesDtmv4kCkIVgjkX/GQASUY/0LFQCpU+Pc=
X-Google-Smtp-Source: AGRyM1sNNo6EIkt3pc/whIS2SDXfg3i2A1mx9pvM7a9HQqI5hbOxJHNDYz+wf9pMlYFPEjwPbIcnkFVsxzEEzhSouCg=
X-Received: by 2002:a17:906:d512:b0:707:bdab:ffa2 with SMTP id
 cq18-20020a170906d51200b00707bdabffa2mr25867805ejc.766.1655828481073; Tue, 21
 Jun 2022 09:21:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:2c03:0:0:0:0:0 with HTTP; Tue, 21 Jun 2022 09:21:16
 -0700 (PDT)
Reply-To: petermensah201@gmail.com
From:   "Mr.Peter Mensah" <gerharddikta20@gmail.com>
Date:   Tue, 21 Jun 2022 09:21:16 -0700
Message-ID: <CA+sV=FuG4wSL2+BD86FDrYaLcw9qnoDZY7TUh8kGwi_bmRBEfw@mail.gmail.com>
Subject: Trust you are doing fine?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <ecryptfs.vger.kernel.org>
X-Mailing-List: ecryptfs@vger.kernel.org

-- 
Greetings!
Please I want to discuss a profitable financial deal with you.
Kindly reconfirm the receipt of this text message for more details.
Thanks
