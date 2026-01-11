Return-Path: <ecryptfs+bounces-767-lists+ecryptfs=lfdr.de@vger.kernel.org>
X-Original-To: lists+ecryptfs@lfdr.de
Delivered-To: lists+ecryptfs@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C86D0E041
	for <lists+ecryptfs@lfdr.de>; Sun, 11 Jan 2026 02:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5240E301B808
	for <lists+ecryptfs@lfdr.de>; Sun, 11 Jan 2026 01:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE8A347C7;
	Sun, 11 Jan 2026 01:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="avQTQoJt"
X-Original-To: ecryptfs@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DD6A930;
	Sun, 11 Jan 2026 01:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768093636; cv=none; b=rhcChiVwHLN9uijSXHyDwnIjwbD/zxKbJqgLkPfETSQI19UE6J98dsgJOUerlfbadg6saBctqhWgcwKRj4BapUGa8OcHyz2nBISY997LoVK+ipScSt5yVORNGnaLgh2VVIfckD66Z7/oyrooJb7Elqz27vOzDtMvXOwD4O1EhyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768093636; c=relaxed/simple;
	bh=YFnNl7UfyhknhcOK29Ur/A6p2Ch2Ne0vLoossLr/Qnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvMrrtmzrnw0uLbLBxCgjLygqy/PKTLwcmQUFBdIXc7MolhnQCIC7A9HNfsgLTB1rt0N6D/tYI2lgg1fDyTA/DAxCj1In8qawj0Fz0yGeIxFQJKwYEEtG1+CX5PgX27mo5UCau4FbAQnC2HNETpPP7jxNSnBTWC2GfSqiV6QjPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=avQTQoJt; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OZcHWFiy7jX7hjT6MP8pgeVqGnJHDfEUrJLK7XLAgXs=; b=avQTQoJtD/QcZegYMMm+ZZjQKm
	eClXiKOY2jBzFm4ilAsOIgX2U8Uhxt7uPlWVVuCPEBmmQUAePfPcpyrnVB6NYWi3O1+cAtF0a/Rhs
	MizaMN1/C47QihOUWX2MSCNEry1lJ/XonygM4xBSbqAcVN14LK6w2KWFoQNJITqzeUxP8VDMNzYAR
	mBbWJXAH/2sxC9Proy3vHj5wGskKnqhD9Oj0NVKi91s89mL3Z6hsYPDR/rIFJgvbyejvchkq4xcFQ
	GORdO6Q/LZnxFjaGRYLlRZI8HLA2yl0aPOC/Wm0NO7OtdebQThDnb/tdyFEKRs5JHMhyVtmCLhX/t
	mYzzVQMQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vejwP-00000000x53-3mUw;
	Sun, 11 Jan 2026 01:08:25 +0000
Date: Sun, 11 Jan 2026 01:08:25 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Tyler Hicks <code@tyhicks.com>, Ard Biesheuvel <ardb@kernel.org>,
	Zipeng Zhang <zhangzipeng0@foxmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Michael Halcrow <mhalcrow@us.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ecryptfs: Add missing gotos in ecryptfs_read_metadata
Message-ID: <20260111010825.GG3634291@ZenIV>
References: <20260111003655.491722-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111003655.491722-1-thorsten.blum@linux.dev>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Jan 11, 2026 at 01:36:52AM +0100, Thorsten Blum wrote:
> Add two missing goto statements to exit ecryptfs_read_metadata() when an
> error occurs.
> 
> The first goto is required; otherwise ECRYPTFS_METADATA_IN_XATTR may be
> set when xattr metadata is enabled even though parsing the metadata
> failed. The second goto is not strictly necessary, but it makes the
> error path explicit instead of relying on falling through to 'out'.

Ugh...  IMO the whole thing from the point we'd successfully allocated
the page to the point where we start to clear it ought to be in a separate
helper.  Something like this, perhaps?

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 260f8a4938b0..53fec5a3acaf 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1272,6 +1272,43 @@ int ecryptfs_read_and_validate_xattr_region(struct dentry *dentry,
 	return rc;
 }
 
+static int do_read_metadata(struct dentry *dentry, char *page,
+			    struct ecryptfs_crypt_stat *crypt_stat)
+{
+	struct inode *inode = d_inode(dentry);
+
+	/* try to get it from file header */
+	if (ecryptfs_read_lower(page, 0, crypt_stat->extent_size, inode) >= 0 &&
+	    ecryptfs_read_headers_virt(page, crypt_stat, dentry,
+				       ECRYPTFS_VALIDATE_HEADER_SIZE) == 0)
+		return 0;
+
+	/* metadata is not in the file header, so try xattrs */
+	memset(page, 0, PAGE_SIZE);
+	if (ecryptfs_read_xattr_region(page, inode) < 0 ||
+	    ecryptfs_read_headers_virt(page, crypt_stat, dentry,
+				       ECRYPTFS_DONT_VALIDATE_HEADER_SIZE) != 0) {
+		printk(KERN_DEBUG "Valid eCryptfs headers not found in "
+		       "file xattr region either, inode %lu\n", inode->i_ino);
+		return -EINVAL;
+	}
+
+	/* OK, it's in xattrs; are we allowed to use that? */
+	if (crypt_stat->mount_crypt_stat->flags
+	    & ECRYPTFS_XATTR_METADATA_ENABLED) {
+		crypt_stat->flags |= ECRYPTFS_METADATA_IN_XATTR;
+		return 0;
+	}
+
+	printk(KERN_WARNING "Attempt to access file with "
+	       "crypto metadata only in the extended attribute "
+	       "region, but eCryptfs was mounted without "
+	       "xattr support enabled. eCryptfs will not treat "
+	       "this like an encrypted file, inode %lu\n",
+		inode->i_ino);
+	return -EINVAL;
+}
+
 /*
  * ecryptfs_read_metadata
  *
@@ -1299,54 +1336,14 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
 						      mount_crypt_stat);
 	/* Read the first page from the underlying file */
 	page_virt = kmem_cache_alloc(ecryptfs_header_cache, GFP_USER);
-	if (!page_virt) {
-		rc = -ENOMEM;
-		goto out;
-	}
-	rc = ecryptfs_read_lower(page_virt, 0, crypt_stat->extent_size,
-				 ecryptfs_inode);
-	if (rc >= 0)
-		rc = ecryptfs_read_headers_virt(page_virt, crypt_stat,
-						ecryptfs_dentry,
-						ECRYPTFS_VALIDATE_HEADER_SIZE);
-	if (rc) {
-		/* metadata is not in the file header, so try xattrs */
-		memset(page_virt, 0, PAGE_SIZE);
-		rc = ecryptfs_read_xattr_region(page_virt, ecryptfs_inode);
-		if (rc) {
-			printk(KERN_DEBUG "Valid eCryptfs headers not found in "
-			       "file header region or xattr region, inode %lu\n",
-				ecryptfs_inode->i_ino);
-			rc = -EINVAL;
-			goto out;
-		}
-		rc = ecryptfs_read_headers_virt(page_virt, crypt_stat,
-						ecryptfs_dentry,
-						ECRYPTFS_DONT_VALIDATE_HEADER_SIZE);
-		if (rc) {
-			printk(KERN_DEBUG "Valid eCryptfs headers not found in "
-			       "file xattr region either, inode %lu\n",
-				ecryptfs_inode->i_ino);
-			rc = -EINVAL;
-		}
-		if (crypt_stat->mount_crypt_stat->flags
-		    & ECRYPTFS_XATTR_METADATA_ENABLED) {
-			crypt_stat->flags |= ECRYPTFS_METADATA_IN_XATTR;
-		} else {
-			printk(KERN_WARNING "Attempt to access file with "
-			       "crypto metadata only in the extended attribute "
-			       "region, but eCryptfs was mounted without "
-			       "xattr support enabled. eCryptfs will not treat "
-			       "this like an encrypted file, inode %lu\n",
-				ecryptfs_inode->i_ino);
-			rc = -EINVAL;
-		}
-	}
-out:
-	if (page_virt) {
-		memset(page_virt, 0, PAGE_SIZE);
-		kmem_cache_free(ecryptfs_header_cache, page_virt);
-	}
+	if (!page_virt)
+		return -ENOMEM;
+
+	rc = do_read_metadata(ecryptfs_dentry, page_virt, crypt_stat);
+
+	memset(page_virt, 0, PAGE_SIZE);
+	kmem_cache_free(ecryptfs_header_cache, page_virt);
+
 	return rc;
 }
 

