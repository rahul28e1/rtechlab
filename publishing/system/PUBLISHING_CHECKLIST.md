# RTechLab Universal Video Publishing Pre-Flight Checklist
## Operational Verification Steps Before Public Launch

**Applies to:** All Full-Length Episodes (Episodes 01–10)  
**Standard:** Broadcast & Technical Engineering Grade  

---

## Phase 1: Video Engine & Media Asset Freeze

- [ ] **Render Verification:** Master MP4 render completed with 0 errors and zero dropped frames.
- [ ] **Audio Headroom & Peak Limit:**
  - True Peak $\le -1.5\text{ dBFS}$ (Episode 01 EN V2: $-3.65\text{ dBFS}$; HI V2: $-4.46\text{ dBFS}$).
  - Loudness between $-14\text{ LUFS}$ and $-24\text{ LUFS}$.
  - Zero digital clipping (0 clipped samples).
- [ ] **Bilingual Alignment:** Duration delta between English and Hindi masters is $\le 0.05\text{ s}$ (Episode 01: exact $0.000\text{ s}$ delta).
- [ ] **Cryptographic Hash Verification:** SHA-256 hash generated and documented in master manifest.
- [ ] **Visual Safe Bounds Inspection:**
  - 16:9 Landscape: No station labels, DNS titles, or logos clipped outside 10% action safe zone.
  - Subtitles rendered cleanly within subtitle safe band.
  - Official RTechLab logo unaltered in aspect ratio and color.

---

## Phase 2: Metadata & SEO Preparation

- [ ] **High-CTR Titles:** 3 tested titles prepared, strictly under 60-70 characters.
- [ ] **Opening Hook Lines:** First 2 lines before "Show More" hook viewer curiosity and state tangible value.
- [ ] **Timestamps / Chapters:** Exact 10-act timestamps verified against the rendered video timeline.
- [ ] **Interactive Tools Links:** Active links to RTechLab website tools (`/tools/dns-lookup`, `/tools/ip-address-info`, `/tools/subnet-calculator`).
- [ ] **Educational Partner Credits:** Formal collaboration credit for IANT Computer Education Palanpur included in description and pinned comment.
- [ ] **Categorized Tags:** 15–20 tags covering broad, secondary, and long-tail search intent.
- [ ] **Category & Playlists:** Set to `Education` and assigned to appropriate topical playlists.

---

## Phase 3: Thumbnail Quality Assurance

- [ ] **Resolution & Format:** Exactly 1280 × 720 PNG / JPG, under 2 MB.
- [ ] **Mobile Legibility Test:** Main text legible when scaled down to 10% thumbnail size (mobile YouTube app search result).
- [ ] **High Contrast:** High luminance separation between foreground typography and background scene.
- [ ] **Timestamp Safe Zone:** Bottom right corner ($200\text{px} \times 80\text{px}$) free of critical text or logos (where YouTube overlays the video duration badge `06:21`).

---

## Phase 4: Staging & Multi-Language Audio Upload

- [ ] **Initial Visibility:** Saved strictly as **`UNLISTED`** or **`DRAFT`**.
- [ ] **Multi-Language Audio (if applicable):**
  - Primary video container uploaded.
  - Secondary audio track attached in YouTube Studio Subtitles menu.
  - Both English and Hindi subtitles (.vtt) uploaded and synchronized.
  - Localized title and description entered for secondary languages.
- [ ] **Incognito Audio QA:** Playback tested in incognito browser; audio track toggle verified.

---

## Phase 5: Social Media & Cross-Platform Staging

- [ ] **Vertical Reels / Shorts:** 9:16 portrait cuts exported with 1:1 square center crop ($Y=420$ to $Y=1500$) safe for Instagram profile grid.
- [ ] **Instagram Collab Tag:** "Invite collaborator" sent to official partner handle (`@iant_palanpur`).
- [ ] **Website Integration:** Topic page updated in `src/data/videoCurriculum.js` and episode page verified in browser.

---

## Phase 6: Final Launch Sign-Off

- [ ] **Operator Confirmation:** Rahul Sir inspects staged preview and confirms ready for release.
- [ ] **Promotion to Public:** Visibility toggled to **`PUBLIC`**.
- [ ] **Pinned Comment Published:** Pinned comment posted within 60 seconds of public launch.
- [ ] **Website Live Sync:** YouTube video ID updated in web curriculum.
