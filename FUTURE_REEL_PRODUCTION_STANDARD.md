# RTechLab — Future Reel Production Standard (SOP)
**Standard Operating Procedure for Vertical 9:16 Technical Explainers**  
**Applies To:** All future reels across YouTube Shorts & Instagram Reels  
**Target Specs:** 1080 × 1920 (9:16), 30.0 FPS, H.264/AAC, 45–75s duration

---

## 1. The 8-Step End-to-End Production Workflow

Every future reel must proceed through these 8 mandatory stages:

```
[1. Concept & Hook] --> [2. Bilingual Script] --> [3. Storyboard & Timing] --> [4. Remotion Comp]
                                                                                      |
[8. Manifest Sync]  <-- [7. Automated QA]   <-- [6. Audio & SFX Mix]   <-- [5. Visual Render]
```

---

### Step 1: Concept & Curiosity Hook Definition
- **Core Principle:** **RESULT FIRST, THEN EXPLAIN.**
- **The 0–3s Rule:** State the paradox, high-stakes everyday tension, or visual anomaly before diving into the explanation.
- **Audience Filter:** Target the curious software engineer, CCNA/DevOps student, or tech enthusiast.

### Step 2: Bilingual Scriptwriting & Voiceover Guidelines
- **Dual Edition Standard:** Every concept must be authored in parallel English and Hindi versions.
- **Approved Voice Profiles:**
  - **English:** `en-US-ChristopherNeural` (Rate: `+6%` to `+8%`, Pitch: `+0Hz`) — authoritative, energetic, conversational.
  - **Hindi:** `hi-IN-MadhurNeural` (Rate: `+6%` to `+8%`, Pitch: `+0Hz`) — natural Hindi cadence with clean technical loanwords (e.g. "packets", "router", "database", "handshake").
- **Strict Word Count Limits:**
  - 45-second reel: ~95–110 words.
  - 60-second reel: ~130–145 words.
  - 75-second reel: ~165–180 words.

### Step 3: Storyboard & Landmark Frame Allocation
- Break the script into **4 to 6 discrete pedagogical scenes**:
  1. *Scene 1 (0–5s):* Hook & Physical Metaphor.
  2. *Scene 2 (5–18s):* The Problem / Failure State (1-bit corruption, lag, context window limit).
  3. *Scene 3 (18–35s):* The Engineering Mechanism (MTU slicing, PFE grounding, 3-way handshake).
  4. *Scene 4 (35–55s):* Real-World Flow / Dynamic Simulation (packet race, laser wavelengths).
  5. *Scene 5 (55–65s):* Core Takeaway & Rule (Reliability vs Speed, Private vs Public).
  6. *Scene 6 (End - 3.5s):* RTechLab Brand Outro & Social CTA.

### Step 4: Motion Graphics Assembly in Remotion
- Construct or reuse modular React components:
  - `<HeaderHUD />`: Series title, category badge, and segmented progress bar.
  - `<TelemetryBar />`: Diagnostic telemetry at `Y: 155px`.
  - `<MainStage />`: High-contrast visual area (`Y: 240px` to `Y: 1470px`).
  - `<SubtitlesOverlay />`: Safe-zone anchored captions (`Y: 1650px`) with keyword pill badges.
  - `<BrandOutro />`: Animated channel seal and CTA.

### Step 5: Multi-Layer Sound Design Integration
- Align sound cues to visual landmarks:
  - `sfx_whoosh.wav` on scene transitions.
  - `sfx_tap.wav` / `sfx_click.wav` on button presses, switches, or mutex locks.
  - `sfx_packet.wav` on data packets traversing wires.
  - `sfx_warning.wav` on errors, drops, or partitions.
  - `music_ambient_tech.wav` at `-26 LUFS` background level.

### Step 6: Rendering Pipeline
- Render via Remotion CLI using GPU-accelerated ANGLE renderer:
  ```bash
  npx remotion render src/index.js <CompositionID> <OutputPath> --gl=angle
  ```
- Output to designated batch folder (e.g. `video-engine/out/november_13_30/batch_XX/`).

### Step 7: Automated QA Verification Gate
Before presenting any render to the user, run automated checks:
1. `ffprobe` verification: 1080×1920 resolution, 30 FPS, H.264 video, AAC stereo.
2. `blackdetect=d=0.8`: Ensure **0 black frame occurrences**.
3. `silencedetect=noise=-35dB:d=2`: Ensure **0 audio silence drops**.
4. Visual preview extraction: Render stills at 3s, 20s, and end frame into `qa_previews/`.
5. Typography audit: Verify Hindi Devanagari ligatures render cleanly.

### Step 8: Master Calendar & Manifest Synchronization
- Update both `NOVEMBER_13_30_BULK_MANIFEST.json` and `.csv`.
- Record exact output path, duration, file size, thumbnail preview, and QA status.
- Generate or update the dedicated batch QA report.

---

## 2. Production Checklist Template for Future Releases

```markdown
### Future Reel Production Checklist
- [ ] Topic defined with curiosity hook & "Result First" structure
- [ ] Bilingual script approved (English & Hindi)
- [ ] Voiceover synthesized via edge-tts (Christopher & Madhur)
- [ ] Subtitle timestamps parsed and keyword badges identified
- [ ] Remotion composition created with HeaderHUD & TelemetryBar
- [ ] Sound effects synchronized to animation landmarks
- [ ] Rendered at 1080x1920 @ 30 FPS with ANGLE GL
- [ ] Automated QA Passed (0 black frames, 0 silence gaps)
- [ ] Output saved in batch directory and manifests synchronized
- [ ] Final report prepared for user approval
```
