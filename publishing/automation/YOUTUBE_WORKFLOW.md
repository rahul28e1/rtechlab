# YouTube Publishing & Automation Workflow
## Production Guide & Operator Protocol for RTechLab Episode 01

**Author:** RTechLab Video Publishing & Systems Operations  
**Scope:** YouTube Studio Deployment Protocol  
**Target Video:** Episode 01 — "How the Internet Works: From Tap to Playback"  
**Approved Assets:**
- Master Video: `video-engine/out/episodes/how_the_internet_works_ep01_en_v2.mp4` (SHA-256: `0c3b1d0956...`)
- Hindi Audio Track: `video-engine/public/audio/narration_hindi_ep01_master.mp3`
- Approved Thumbnails: `video-engine/out/thumbnails/rtechlab_ep01_thumbnail_en_concept_a.png`
- Subtitles: `video-engine/public/subtitles/subtitles_ep01_en.vtt` & `subtitles_ep01_hi.vtt`

---

## 1. Zero-Trust Security & Session Protocol

> [!CAUTION]
> **STRICT SAFETY RULE:**
> 1. AI agents and scripts must **NEVER** ask for, store, or log Google passwords, session cookies, or Two-Factor Authentication (2FA) OTPs.
> 2. Rahul Sir must personally log into the official Google account powering `@RTechLabOfficial` in the designated browser session.
> 3. All video uploads MUST initially be saved as **`UNLISTED`** or **`DRAFT`**. Under no circumstances should an automated agent switch a video to `Public` without explicit confirmation from Rahul Sir.

---

## 2. Pre-Upload Asset Verification

Before opening YouTube Studio, confirm all required files are present and verified:

```powershell
# Run from repository root:
Test-Path "video-engine/out/episodes/how_the_internet_works_ep01_en_v2.mp4"
Test-Path "video-engine/out/thumbnails/rtechlab_ep01_thumbnail_en_concept_a.png"
Test-Path "video-engine/public/audio/narration_hindi_ep01_master.mp3"
Test-Path "video-engine/public/subtitles/subtitles_ep01_en.vtt"
Test-Path "video-engine/public/subtitles/subtitles_ep01_hi.vtt"
```

---

## 3. Step-by-Step YouTube Studio Upload Protocol

### Step 3.1: Session Initialization
1. Open the browser and navigate to: `https://studio.youtube.com`.
2. Confirm the active channel avatar in the upper right is **RTechLab** (`@RTechLabOfficial`).
3. Click the **CREATE** button (top right) $\to$ **Upload videos**.

### Step 3.2: File Upload & Basic Info
1. Drag and drop `video-engine/out/episodes/how_the_internet_works_ep01_en_v2.mp4`.
2. **Title:** Copy and paste Title Option 1 from `publishing/metadata/EPISODE_01_YOUTUBE_METADATA_EN.md`:
   ```text
   How Does the Internet Actually Work? (In 175 Milliseconds)
   ```
3. **Description:** Copy and paste the complete description block from `publishing/metadata/EPISODE_01_YOUTUBE_METADATA_EN.md` (includes opening hook, timestamps, takeaways, tools links, and IANT Palanpur collaboration credits).
4. **Thumbnail:** Click **Upload thumbnail** $\to$ select `video-engine/out/thumbnails/rtechlab_ep01_thumbnail_en_concept_a.png`.
5. **Playlist:** Select or create:
   - `Computer Networks from Scratch (Complete Visual Guide)`
   - `Internet Infrastructure Deep Dives`
6. **Audience:** Select **"No, it's not made for kids"** (COPPA compliance).
7. **Age Restriction:** Select **"No, don't restrict my video to viewers over 18"**.

### Step 3.3: Advanced Details & Tags
1. Click **SHOW MORE**.
2. **Paid Promotion:** Check *No* (educational collaboration).
3. **Automatic Chapters:** Uncheck (custom chapters already provided in description).
4. **Tags:** Copy and paste the tag string from `publishing/metadata/EPISODE_01_YOUTUBE_METADATA_EN.md`:
   ```text
   how the internet works, computer networking, internet architecture, how internet works, computer networks, submarine fiber optic cables, dns lookup explained, bgp routing protocol, tcp ip handshake, undersea internet cables, data center alley ashburn, optical fiber speed of light, autonomous systems, how does data travel across the ocean, why internet is underwater not satellite, mumbai to us internet latency, networking tutorial for beginners, ccna networking basics, rtechlab, iant palanpur
   ```
5. **Language & Caption Certification:**
   - Video language: `English`
   - Caption certification: `None`
6. **Recording Date and Location:**
   - Location: `Palanpur, Gujarat, India` (or leave blank)
7. **License:** `Standard YouTube License`
8. **Category:** Select **`Education`**.
   - Type: *Conceptual overview / Engineering tutorial*
   - Academic system: *India / Global*

### Step 3.4: Multi-Language Audio & Subtitles Setup
1. In the upload flow, advance to **Video elements**.
2. **Subtitles:** Click **Add** $\to$ **Upload file** $\to$ **With timing** $\to$ select `video-engine/public/subtitles/subtitles_ep01_en.vtt`.
3. Save the upload as **`UNLISTED`** to complete basic processing.
4. Once in YouTube Studio dashboard, navigate to the left menu: **Subtitles**.
5. Select the uploaded video.
6. Click **ADD LANGUAGE** $\to$ select **Hindi (India)**.
7. Under the Hindi row:
   - **Title & Description:** Click **ADD** $\to$ copy Hindi Title and Description from `publishing/metadata/EPISODE_01_YOUTUBE_METADATA_HI.md`.
   - **Subtitles:** Click **ADD** $\to$ upload `video-engine/public/subtitles/subtitles_ep01_hi.vtt`.
   - **Audio:** Click **ADD AUDIO** $\to$ select `video-engine/public/audio/narration_hindi_ep01_master.mp3`.
8. Click **PUBLISH** on the language changes.

---

## 4. IANT Computer Education Palanpur Collaboration Setup

### 4.1 Description & Pinned Attribution
Confirm that the description includes the formal credit:
```text
🤝 PROUD EDUCATIONAL COLLABORATION:
Developed in collaboration with IANT Computer Education, Palanpur (Institute of Advanced Network Technology) — empowering students with hands-on, job-ready IT and networking skills.
🌐 IANT Palanpur: https://www.iantindia.com
```

### 4.2 Shared Community Playlist
1. In YouTube Studio, open **Playlists**.
2. Create or open `IANT & RTechLab — Networking Masterclass Series`.
3. Click playlist settings (three dots) $\to$ **Collaborate** $\to$ toggle **Collaborators can add videos to this playlist**.
4. Generate the invite link and share with the IANT Palanpur team so they can add the episode to their official playlists.

---

## 5. Post-Upload QA & Verification Checklist

Before switching visibility from `Unlisted` to `Public`:

- [ ] **HD/4K Processing Status:** Confirm YouTube has finished processing 1080p60 HD.
- [ ] **Multi-Language Audio Selector:** Play the unlisted link in an incognito window. Click the ⚙️ gear icon $\to$ verify **Audio track** shows both `English (original)` and `Hindi`.
- [ ] **Audio Balance Verification:** Switch between English and Hindi tracks while playing; verify both have clear presence and dialogue clarity.
- [ ] **Timestamp Accuracy:** Click each timestamp in the description (0:00, 0:40, 1:20, etc.) to verify chapter markers jump to the exact act boundary.
- [ ] **Interactive Tool Links:** Click all tool links in description (`/tools/dns-lookup`, `/tools/ip-address-info`) to confirm they open properly.
- [ ] **Pinned Comment:** Post the pinned comment from Section 5 and pin it to the top.

---

## 6. Public Release Sign-Off

When Rahul Sir gives explicit authorization:
1. In YouTube Studio, change visibility from **`Unlisted`** $\to$ **`Public`**.
2. Click **SAVE**.
3. Record the generated live YouTube Video ID (e.g. `dQw4w9WgXcQ`) and update `src/data/videoCurriculum.js`:
   ```javascript
   canonicalYouTubeId: "LIVE_ID_HERE"
   ```
