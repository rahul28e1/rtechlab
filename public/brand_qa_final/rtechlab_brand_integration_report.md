# RTechLab — Final Brand QA & Video Engine Verification Report (V2)

## Executive Summary

This report validates the newly rendered MP4 video files, visual frames, and website navigation assets following strict QA inspection. All files are exported to the dedicated folder `brand_qa_final` under new filenames to ensure complete isolation from previous caches.

**Project Status**: **PENDING VISUAL APPROVAL**.  
Bulk video production and public publishing remain strictly on hold.

---

## 1. Verified Video Deliverables (`brand_qa_final/`)

Both videos were re-rendered from source and probed using FFprobe:

| Property | English Refined V2 | Hindi Refined V2 | Verification Standard |
| :--- | :---: | :---: | :---: |
| **New Filename** | `rtechlab_brand_test_en_refined_v2.mp4` | `rtechlab_brand_test_hi_refined_v2.mp4` | Isolated V2 naming |
| **Folder Location** | `public/brand_qa_final/` | `public/brand_qa_final/` | Dedicated QA folder |
| **File Size** | **605,384 Bytes** | **603,377 Bytes** | Exact Byte Verification |
| **Duration** | **6.00s** (180 frames) | **6.00s** (180 frames) | Locked 6.00s Target |
| **Resolution** | **$1080 \times 1920$** (9:16 Vertical) | **$1080 \times 1920$** (9:16 Vertical) | YouTube Shorts & Reels |
| **Framerate** | **30.0 fps** | **30.0 fps** | 30.0 fps locked |
| **Video Codec** | **H.264** (High Profile, `yuv420p`) | **H.264** (High Profile, `yuv420p`) | Universal Web/Mobile |
| **SHA-256 Hash** | `516b8fbdd1b18d9d5e06c3db10ab5943aa6928b6676eb2904f13dcadf2b2295b` | `21fd66471157759f16ab01e74bec9e1379e200006fa18b1b0c783bff719ea3da` | Bit-for-bit Proof |

### Direct Video File Links
- English MP4: [rtechlab_brand_test_en_refined_v2.mp4](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/rtechlab_brand_test_en_refined_v2.mp4)
- Hindi MP4: [rtechlab_brand_test_hi_refined_v2.mp4](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/rtechlab_brand_test_hi_refined_v2.mp4)

---

## 2. Refinements Confirmed by Sub-Pixel Inspection

1. **Bright-Scene Watermark (at ~3.2s)**:
   - **Confirmed**: The watermark consists **strictly of the clean transparent R emblem**.
   - **No pill, no card, no background rectangle, and no wordmark text**.
   - High-contrast ambient drop shadow (`drop-shadow(0 2px 8px rgba(0,0,0,0.75))`) ensures sharp visibility on light backgrounds.
   - *Pixel sample*: Region $(X=180, Y=140)$ outside the emblem is pure background RGB `(247, 248, 252)` (bright background, zero dark container).

2. **Opening Intro Transition (at 0s–1s)**:
   - **Confirmed**: Immediate emblem visual presence from Frame 0 ($t=0.0\text{s}$) with spring entrance ($0.88 \to 1.0$) and ambient glow.
   - Title enters at Frame 3, tagline at Frame 8. Zero empty screen delay.

3. **Outro End Screen (at 4s–5.2s)**:
   - **Confirmed**: The old bright cyan-blue gradient CTA button has been **completely eliminated**.
   - In its place is a **premium educational video end card**:
     - Dark glass container (`rgba(15, 23, 42, 0.76)` with blur)
     - Uppercase badge: `PRACTICAL ENGINEERING LABS` / `प्रैक्टिकल इंजीनियरिंग लैब्स`
     - Headline: `Deep-Tech & Networking Visualizations` / `डीप-टेक और नेटवर्किंग विज़ुअलाइज़ेशन`
     - Neutral handle badge: `@RTechLab` (zero unverified URLs or claims)

4. **Master Logo Integrity**:
   - Master logo (emblem, cap, flask, orbits, wordmark, tagline `LEARN • PRACTICE • INNOVATE`) is 100% complete and unclipped.

---

## 3. Full-Resolution Extracted Frames Matrix

Full-resolution ($1080 \times 1920$) frames extracted from the exact new MP4 files:

| Timepoint | Visual Content | English Extracted Frame | Hindi Extracted Frame |
| :---: | :--- | :--- | :--- |
| **0.0s** | Intro Start (Immediate emblem presence) | [brand_test_en_frame_0s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_en_frame_0s.jpg) | [brand_test_hi_frame_0s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_hi_frame_0s.jpg) |
| **1.0s** | Intro Lockup (Emblem + Title + Tagline) | [brand_test_en_frame_1s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_en_frame_1s.jpg) | [brand_test_hi_frame_1s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_hi_frame_1s.jpg) |
| **2.0s** | Dark Scene (Transparent R Emblem + Glow) | [brand_test_en_frame_2s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_en_frame_2s.jpg) | [brand_test_hi_frame_2s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_hi_frame_2s.jpg) |
| **3.2s** | Bright Scene (**Transparent R Emblem Only, No Box/Wordmark**) | [brand_test_en_frame_3s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_en_frame_3s.jpg) | [brand_test_hi_frame_3s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_hi_frame_3s.jpg) |
| **4.0s** | Outro Start (Master Logo Spring Entrance) | [brand_test_en_frame_4s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_en_frame_4s.jpg) | [brand_test_hi_frame_4s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_hi_frame_4s.jpg) |
| **5.2s** | Outro Card (**Educational End Card, No Gradient SaaS Button**) | [brand_test_en_frame_5s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_en_frame_5s.jpg) | [brand_test_hi_frame_5s.jpg](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/public/brand_qa_final/frames/brand_test_hi_frame_5s.jpg) |

### 12-Frame Visual Comparison Sheet
- **File Link**: [brand_qa_final_comparison_sheet.png](file:///C:/Users/Rahul/.gemini/antigravity/brain/aa8b9a64-f281-4dd1-bf84-94b54dd00256/brand_qa_final/brand_qa_final_comparison_sheet.png)

![Final Brand QA Comparison Sheet](file:///C:/Users/Rahul/.gemini/antigravity/brain/aa8b9a64-f281-4dd1-bf84-94b54dd00256/brand_qa_final/brand_qa_final_comparison_sheet.png)

---

## 4. Website Header & Navigation Verification

Separate evidence confirms website functionality remains intact:

### Automated Audit Suite Results (`scripts/verify_website_header_and_navigation.js`):
- `[PASS]` Desktop brand logo links to `#hero`.
- `[PASS]` Mobile drawer renders `<Logo size="md" showTagline={true} />`.
- `[PASS]` Search trigger (Ctrl+K), Language switch (EN $\leftrightarrow$ HI), "Start Learning" CTA operational.
- `[PASS]` All 7 smooth-scroll navigation targets intact.
- `[PASS]` Live server (`http://localhost:5173`) responding with HTTP 200 and all official favicon links.
- `[PASS]` Live route `/about` responding with HTTP 200.
- **Audit Summary: 19 Passed, 0 Failed**.

### Live Browser Screenshots:
- **Desktop Homepage**: [current_desktop_homepage.png](file:///C:/Users/Rahul/.gemini/antigravity/brain/aa8b9a64-f281-4dd1-bf84-94b54dd00256/brand_qa_final/current_desktop_homepage.png)
- **Mobile Homepage (390px)**: [current_mobile_homepage.png](file:///C:/Users/Rahul/.gemini/antigravity/brain/aa8b9a64-f281-4dd1-bf84-94b54dd00256/brand_qa_final/current_mobile_homepage.png)
- **Desktop Tools Page**: [current_desktop_tools.png](file:///C:/Users/Rahul/.gemini/antigravity/brain/aa8b9a64-f281-4dd1-bf84-94b54dd00256/brand_qa_final/current_desktop_tools.png)

![Website Audit Baseline Sheet](file:///C:/Users/Rahul/.gemini/antigravity/brain/aa8b9a64-f281-4dd1-bf84-94b54dd00256/brand_qa_final/audit_visual_comparison_sheet.png)

---

## 5. Compliance & Guardrails

- **Master Logo**: Unmodified (`40b3cf672058...`).
- **Main Website Design**: Unmodified, all 218 test cases passing.
- **Bulk Production**: **STRICTLY ON HOLD**.
- **Public Publishing**: **BLOCKED**.
- **Status**: **PENDING VISUAL APPROVAL**.
