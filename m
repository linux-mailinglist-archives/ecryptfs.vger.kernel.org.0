Return-Path: <ecryptfs+bounces-1221-lists+ecryptfs=lfdr.de@vger.kernel.org>
Delivered-To: lists+ecryptfs@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM/HJriS8GlvVAEAu9opvQ
	(envelope-from <ecryptfs+bounces-1221-lists+ecryptfs=lfdr.de@vger.kernel.org>)
	for <lists+ecryptfs@lfdr.de>; Tue, 28 Apr 2026 12:58:00 +0200
X-Original-To: lists+ecryptfs@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 921154831DB
	for <lists+ecryptfs@lfdr.de>; Tue, 28 Apr 2026 12:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 259B03092643
	for <lists+ecryptfs@lfdr.de>; Tue, 28 Apr 2026 10:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84C23FCB17;
	Tue, 28 Apr 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dw8BrzbB"
X-Original-To: ecryptfs@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8513FCB13;
	Tue, 28 Apr 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372929; cv=none; b=nDLCsDKw/Ix+pPA9/e0Dzzi7aPzHFkZd7AQN0MoufmGLeL3oylB2rLUuGKguYEzbtl92kbjKx+tJO9y3cI49o7V2W57fyB/7ixtOKNnlj5T9MVAtpv7fVtf5rdQl8moDlxVm+UfVNxGTqLSywpBJPMwlpKs1e2xSxQv9src2120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372929; c=relaxed/simple;
	bh=m7hbplM/0Zg40fqwDSGu12h0MMvtrRfSGZuNkF5d9mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmewPIt+sJZZThaK+ScZmUa7BuVH4PJeVGdO9Rn63+E3PGqD2chKtkquN09USnuPKj0tyKnFS3x0tFprx7k38oGcmP8NqxrCqGFllFgWBIPCeAEMkHPhVyncY+dlQdkfNqYVkQimUKWpN2+P9F1lStTbhsk5Mv8K1wghKuUJn/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dw8BrzbB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7237EC2BCB7;
	Tue, 28 Apr 2026 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372929;
	bh=m7hbplM/0Zg40fqwDSGu12h0MMvtrRfSGZuNkF5d9mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dw8BrzbBhByXMwuTfBlYpcdI+luthnuBgt4GyOHhoGs4YUUdovOHaf4/1c7Fy2q4J
	 71iiRD8a8xoNV3Kah12uolS2nQslypfAcu57lQ3btcJFxGXPSGWqneaiP9xeHlMPO1
	 JdvzkjrSfLZMeX1XP0KmhZzp0cTG7c95tmm6/O6uBiWF/ijlClMexvxjAMes++/oCw
	 8gfHvR/olKhiR31wXpD2tamnaCxGd/5FNZCcsSp4iZJo2cDnjg7sv27TU0YJ62TPn+
	 FdfDPM6qs8iwCNAPaJjjTih8JlDLjSd3QwM+4Huv2NSN5PPuvn1llIw1EoEDFNq0qu
	 A83CeBh1ueOrQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Frank=20Hsiao=20=E8=95=AD=E6=B3=95=E5=AE=A3?= <frankhsiao@qnap.com>,
	Tyler Hicks <code@tyhicks.com>,
	Sasha Levin <sashal@kernel.org>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] ecryptfs: Set s_time_gran to get correct time granularity
Date: Tue, 28 Apr 2026 06:40:36 -0400
Message-ID: <20260428104133.2858589-25-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428104133.2858589-1-sashal@kernel.org>
References: <20260428104133.2858589-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ecryptfs@vger.kernel.org
List-Id: <ecryptfs.vger.kernel.org>
List-Subscribe: <mailto:ecryptfs+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:ecryptfs+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0.2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 921154831DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1221-lists,ecryptfs=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,ecryptfs@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[ecryptfs];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ble.sh:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,launchpad.net:url,tyhicks.com:email,qnap.com:email]

From: Frank Hsiao 蕭法宣 <frankhsiao@qnap.com>

[ Upstream commit 7d9ebf33d85317f3f258c627de51701e2bf7642d ]

Set the eCryptfs superblock time granularity, using the lower
filesystem's s_time_gran value, to prevent unnecessary inode timestamp
truncation to the granularity of a full second.

The use of utimensat(2) to set a timestamp with nanosecond precision
would trigger this bug. That occurred when using the following utilities
to update timestamps of a file:
  * cp -p: copy a file and preserve its atime and mtime
  * touch -r: touch a file and use a reference file's timestamps

Closes: https://bugs.launchpad.net/ecryptfs/+bug/1890486
Signed-off-by: Frank Hsiao 蕭法宣 <frankhsiao@qnap.com>
[tyhicks: Partially rewrite the commit message]
Signed-off-by: Tyler Hicks <code@tyhicks.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis: ecryptfs s_time_gran Fix

### PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject line parsing**
- Subsystem: `ecryptfs:` (fs/ecryptfs)
- Verb: "Set" (describes a missing initialization -> classic hidden bug
  fix)
- Record: **ecryptfs** - **Set** - initialize superblock time
  granularity from the lower filesystem to avoid second-granularity
  timestamp truncation.

**Step 1.2: Tags**
- Signed-off-by: Frank Hsiao (author, QNAP)
- [tyhicks: Partially rewrite the commit message]
- Signed-off-by: Tyler Hicks (ecryptfs maintainer)
- `Closes:` https://bugs.launchpad.net/ecryptfs/+bug/1890486 (6-year-old
  user bug report with 3 affected users)
- No Fixes: tag, no Cc: stable (expected for candidates)
- Record: Closes launchpad bug #1890486; accepted by the subsystem
  maintainer.

**Step 1.3: Commit body**
- Bug: eCryptfs superblock `s_time_gran` is never set, so it keeps the
  VFS default of 1 second (`NSEC_PER_SEC` = 10^9 ns). When
  `utimensat(2)` (via `cp -p`, `touch -r`, etc.) sets nanosecond
  timestamps, VFS `timestamp_truncate()` rounds them to the second
  before passing the change down to the lower fs.
- Symptom: sub-second timestamps lost when updated through eCryptfs.
- Fix: propagate `s_time_gran` from the lower superblock, mirroring the
  value the underlying fs actually supports.

**Step 1.4: Hidden bug fix?**
- Yes — "Set X" describes a missing initialization. Functionally this IS
  a bug fix (data-integrity for timestamps).

### PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- Files: `fs/ecryptfs/main.c` (+1/-0).
- Function: `ecryptfs_get_tree()` (the new fs_context-based mount
  helper; pre-6.13 equivalent is `ecryptfs_mount()`).
- Scope: single-line surgical fix.

**Step 2.2: Code flow**
- Before: superblock allocated by VFS (default `s_time_gran =
  1000000000`, see `fs/super.c:376`). eCryptfs copies several fields
  (`s_maxbytes`, `s_blocksize`, `s_magic`, `s_stack_depth`) from the
  lower sb but NOT `s_time_gran`.
- After: `s_time_gran` is copied along with the siblings.
- Path: mount-time initialization only.

**Step 2.3: Bug mechanism**
- Category: Logic/correctness (missing initialization) leading to data
  loss of sub-second timestamp precision.
- Root cause: `fs/attr.c` `setattr_prepare()` calls
  `timestamp_truncate()` using `inode->i_sb->s_time_gran`. With eCryptfs
  using the default (1 s), `timestamp_truncate()` zeroes the nanosecond
  portion (see `fs/inode.c:2805-2806`) before the change is forwarded
  via `notify_change()` to the lower filesystem. The fix makes
  eCryptfs's granularity match the lower fs — exactly what overlayfs
  does (`fs/overlayfs/super.c:1461: sb->s_time_gran =
  upper_sb->s_time_gran;`) and similarly FUSE's submount
  (`fs/fuse/inode.c:1736`).

**Step 2.4: Fix quality**
- Obviously correct: copies a value guaranteed to be valid (`0 <
  s_time_gran <= NSEC_PER_SEC`) from the already-mounted lower sb.
- Minimal/surgical, mount-path only, no runtime hot paths touched.
- Regression risk: effectively zero — timestamps gain precision they
  should always have had. The matching pattern is already proven in
  overlayfs.

### PHASE 3: GIT HISTORY

**Step 3.1: Blame**
- The surrounding lines (`s_maxbytes`, `s_blocksize`, `s_magic`,
  `s_stack_depth`) have been there since eCryptfs's initial merge.
  `s_time_gran` was simply never added. The VFS default of 1 second
  became problematic when v5.4 introduced timestamp clamping via
  `s_time_gran`/`s_time_min`/`s_time_max`; the launchpad report is dated
  2020-08-05 against 5.4 for exactly that reason.

**Step 3.2: Fixes: tag**
- None present. Root cause is a pre-existing missing init, not a
  regression from a specific commit.

**Step 3.3: File history**
- `92f3da0d9276f` (Nov 2024) converted eCryptfs to the new mount API,
  renaming `ecryptfs_mount` -> `ecryptfs_get_tree`. The commit under
  review is the first to touch the new `ecryptfs_get_tree` body; nothing
  else in the recent series is a prerequisite for this fix.
- Earlier ecryptfs changes in fs-next (`bf4afc53b77ae`, `69050f8d6d075`,
  `0529a804095b2`, etc.) are unrelated.

**Step 3.4: Author**
- Frank Hsiao (QNAP, first-time fix contributor here); shepherded by
  Tyler Hicks, the eCryptfs maintainer — he personally rewrote the
  message and applied it to his `next` branch. Authoritative for the
  subsystem.

**Step 3.5: Dependencies**
- Standalone. Nothing in the diff depends on other pending patches. For
  pre-6.13 stable trees the only adjustment needed is targeting
  `ecryptfs_mount()` instead of `ecryptfs_get_tree()`; the surrounding
  context (below `s_stack_depth = ... + 1;`) is verbatim identical in
  5.4/5.10/5.15/6.1/6.6/6.12.

### PHASE 4: MAILING LIST RESEARCH

**Step 4.1: Original submission**
- `b4 dig` could not match the patch-id (the committed version differs
  from the submission due to the mount-API rebase and message rewrite),
  but it did locate the thread via author+subject: lore message-id `SEZP
  R04MB6972A94B302FC6AC528823FAB7EE2@SEZPR04MB6972.apcprd04.prod.outlook
  .com`.
- Thread timeline (from downloaded mbox):
  - 2024-05-17 — Frank Hsiao: original patch.
  - 2024-12-06 — Bert Wesarg: "I came to the same conclusion," no
    objections.
  - 2026-02-23 — Bert: requests that the patch be applied "for a next
    cycle."
  - 2026-03-26 — Tyler Hicks: applies it to `tyhicks/ecryptfs.git#next`,
    rewrites the message, keeps Frank's authorship.
- No NAKs, no objections, only encouragement. Only one version of the
  fix; applied as-is semantically.

**Step 4.2: Recipients**
- The patch was sent to the ecryptfs list and the maintainer; it was
  reviewed/acked in substance by a second developer (Bert Wesarg) and
  applied by the maintainer.

**Step 4.3: Bug report**
- Launchpad #1890486 (2020-08-05 by Stephan Wacker). Explicitly "affects
  3 people"; additional breakage reports cite: `rclone` sync, Rust
  `cargo` rebuild detection (rust-lang/cargo#7775), and ble.sh
  (akinomyoga/ble.sh#347). Users see silent breakage of mtime-based
  incremental tools.

**Step 4.4: Related patches**
- None — single-patch submission, standalone.

**Step 4.5: Stable-list discussion**
- No separate stable nomination found. Not raised to stable@
  historically because the patch languished for two years.

### PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1/5.2/5.3: Functions**
- Only `ecryptfs_get_tree()` is changed. It runs once per mount(2) call
  for eCryptfs. Not in any hot path.

**Step 5.4: Reachability**
- Triggered on every `mount -t ecryptfs …`. Any subsequent
  `utimensat(2)`/`cp -p`/`touch -r`/`rsync -a`/`rclone` on the mounted
  tree then benefits. Reachable from unprivileged userspace
  (CAP_SYS_ADMIN needed for the mount, but the benefit is for
  unprivileged users of the mounted filesystem).

**Step 5.5: Similar patterns**
- `fs/overlayfs/super.c:1461: sb->s_time_gran = upper_sb->s_time_gran;`
  — identical pattern in the other major Linux stacked filesystem.
- `fs/fuse/inode.c:1736: sb->s_time_gran = parent_sb->s_time_gran;` —
  submount case.
- These precedents strengthen the "obviously correct" claim.

### PHASE 6: CROSS-REFERENCING STABLE TREES

**Step 6.1: Bug presence in stable**
- Verified in 5.4, 5.10, 5.15, 6.1, 6.6, and 6.12: none of those
  branches sets `s_time_gran`; the surrounding lines match verbatim. Bug
  present in every active LTS.

**Step 6.2: Backport difficulty**
- 6.13+ stable trees (once they exist) and fs-next: clean apply.
- Older stable trees (≤6.12): one-line change needs to be placed in
  `ecryptfs_mount()` rather than `ecryptfs_get_tree()`. The insertion
  anchor (`s->s_stack_depth = path.dentry->d_sb->s_stack_depth + 1;`) is
  identical, so this is a trivial mechanical rebase, not a re-
  engineering.

**Step 6.3: Prior related fixes**
- None. No partial fix already shipped.

### PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1: Subsystem**
- `fs/ecryptfs` — stacked encrypted filesystem. Still actively used on
  older Ubuntu LTS systems (ecryptfs-home) and by QNAP NAS firmware.
  Criticality: IMPORTANT for affected users (no universal impact;
  filesystem-specific).

**Step 7.2: Activity**
- Low but nonzero; maintainer is re-engaging. Many of the historical
  fixes are themselves tiny one-liners, consistent with stable-friendly
  maintenance.

### PHASE 8: IMPACT AND RISK

**Step 8.1: Affected users**
- Anyone using eCryptfs (Ubuntu encrypted-home users, NAS appliances,
  legacy deployments).

**Step 8.2: Trigger**
- Any tool that sets a non-current timestamp: `cp -p`, `cp -a`, `touch
  -r`, `rsync -a`, `rclone`, `cargo`. Extremely common workflows.

**Step 8.3: Failure mode**
- Silent timestamp loss of nanosecond fraction -> broken mtime-based
  sync/build tools. Severity: MEDIUM (data-integrity issue, not a
  crash/security/corruption beyond timestamps). Not CRITICAL, but
  clearly user-visible and persistent.

**Step 8.4: Risk/benefit**
- Benefit: fixes a known, long-reported bug impacting many real tools.
- Risk: 1 line, mirrors existing behavior of overlayfs/FUSE, copies a
  VFS-guaranteed valid value. As close to zero as patches get.
- Ratio: high benefit / very low risk — classic stable material.

### PHASE 9: FINAL SYNTHESIS

**Evidence FOR**: real bug with multiple reporters across 6 years;
affects common userspace tools; fix is a 1-line mount-time init; pattern
already proven in overlayfs/FUSE; maintainer-applied; no review
objections; bug present in all active stable trees; clean or trivially-
rebased apply.

**Evidence AGAINST**: not a crash/security/data-corruption issue; no
explicit Cc: stable; commit is currently only in fs-next, not yet in
Linus's tree (pipeline normally requires mainline before stable).

**Stable rules checklist**:
1. Obviously correct & tested: YES (trivial; reporters confirm fix
   works).
2. Real bug affecting users: YES (documented since 2020).
3. Important: MEDIUM (data integrity for timestamps, user-facing tool
   breakage).
4. Small & contained: YES (1 line).
5. No new features/APIs: YES.
6. Applies to stable: YES (clean on 6.13+; trivial target-function
   rename for ≤6.12).

**Exception category**: none required — straightforward bug fix.

**Decision**: The fix is exactly the kind of small, obviously-correct,
long-pending user-visible fix that belongs in stable once it reaches
mainline. Any concern about mainline status is procedural, not
technical; the technical merits are strong.

---

### Verification
- [Phase 1] Parsed tags via `git show
  7d9ebf33d85317f3f258c627de51701e2bf7642d` — confirmed two SoBs and the
  `Closes:` launchpad link; no Fixes:/Cc: stable.
- [Phase 2] Diff confirms single added line `s->s_time_gran =
  path.dentry->d_sb->s_time_gran;` in `ecryptfs_get_tree()`.
- [Phase 2] VFS default verified: `fs/super.c:376: s->s_time_gran =
  1000000000;`.
- [Phase 2] Truncation mechanism verified: `fs/inode.c:2793-2811
  timestamp_truncate()`; `fs/attr.c:465-478` applies it to
  ATTR_ATIME/CTIME/MTIME_SET; so utimensat-with-nsec -> ecryptfs inode
  -> truncated to 1 s before `notify_change()` to lower fs.
- [Phase 3] `git show 92f3da0d9276f` — mount API conversion dated
  2024-11-15; pre-6.13 stable trees still use `ecryptfs_mount`.
- [Phase 3] `git show <stable-branch>:fs/ecryptfs/main.c` confirmed no
  `s_time_gran` set in 5.4.y, 5.10.y, 5.15.y, 6.1.y, 6.6.y, 6.12.y, and
  that anchor lines are identical.
- [Phase 4] `b4 am` downloaded the original patch
  (`/tmp/20240517_frankhsiao_…mbx`); mbox thread fetched from lore and
  read: confirmed no NAKs, confirmed Tyler Hicks applied it, confirmed
  Bert Wesarg independently agreed.
- [Phase 4] WebFetch of launchpad 1890486 — confirmed 3-person impact,
  2020 origin, and real-world breakage of `touch -r`, `cp -a`, `rsync
  -a`, `rclone`, `cargo`.
- [Phase 5] Grep of `s_time_gran =` across `fs/` — confirmed overlayfs
  (`fs/overlayfs/super.c:1461`) and FUSE (`fs/fuse/inode.c:1736`) do the
  same thing for stacking.
- [Phase 6] `git merge-base --is-ancestor` — confirmed commit is in `fs-
  next` and `crypto-next` only; NOT in `master` or `stable/linux-7.0.y`
  yet.
- [Phase 7] Maintainer identity confirmed via `git show` committer
  metadata (Tyler Hicks, eCryptfs maintainer).
- [Phase 8] Failure-mode assessment grounded in the verified VFS
  truncation path; severity is MEDIUM (silent data loss of timestamp
  precision), not CRITICAL.
- UNVERIFIED: the exact first kernel version where the bug became user-
  visible (the launchpad bug attributes it to 5.4 VFS timestamp
  clamping, which is consistent with the code reading but I did not
  bisect mainline to confirm). This does not affect the decision.
- UNVERIFIED: whether lore's scraping protection hid any later reviewer
  replies not present in the `t.mbox.gz` I downloaded. The downloaded
  mbox contained 5 messages and a complete-looking exchange ending with
  the maintainer applying the patch.

The commit fixes a long-standing, reproducible, user-visible data-
integrity bug with a one-line change that mirrors established VFS
stacking patterns; risk is negligible, benefit is real, backport is
trivial.

**YES**

 fs/ecryptfs/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index f4ab387eb4ed2..5f37cddb956fb 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -531,6 +531,7 @@ static int ecryptfs_get_tree(struct fs_context *fc)
 	s->s_blocksize = path.dentry->d_sb->s_blocksize;
 	s->s_magic = ECRYPTFS_SUPER_MAGIC;
 	s->s_stack_depth = path.dentry->d_sb->s_stack_depth + 1;
+	s->s_time_gran = path.dentry->d_sb->s_time_gran;
 
 	rc = -EINVAL;
 	if (s->s_stack_depth > FILESYSTEM_MAX_STACK_DEPTH) {
-- 
2.53.0


