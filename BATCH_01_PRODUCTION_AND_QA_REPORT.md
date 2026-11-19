# RTechLab — Batch 1 Production & QA Verification Report
**Date:** November 13, 2026  
**Pipeline Batch:** Batch 01 (November 16–19 Releases — Complete)  
**Output Directory:** `video-engine/out/november_13_30/batch_01/`  
**Manifests Synchronized:**  
- [NOVEMBER_13_30_BULK_MANIFEST.json](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/publishing/calendar/NOVEMBER_13_30_BULK_MANIFEST.json)
- [NOVEMBER_13_30_BULK_MANIFEST.csv](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/publishing/calendar/NOVEMBER_13_30_BULK_MANIFEST.csv)

---

## 1. Batch 1 Complete Render Status & Technical QA Table

All 8 active release videos in Batch 1 are rendered at **1080 × 1920 (9:16 vertical)**, **30 FPS**, **H.264 video**, **AAC stereo audio**, with synchronized kinetic subtitles, dynamic sound effects, and clean visual transitions.

| Video File | Episode / Topic | Language | Target Release | Duration | Size | Resolution / FPS | Codecs | QA Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `EP01_13000km_in_175ms_EN.mp4` | EP01: 13,000 km in 175ms | English | Nov 16, 6:00 PM | **60.42s** | 4.04 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `EP01_13000km_in_175ms_HI.mp4` | EP01: 13,000 km in 175ms | Hindi | Nov 16, 6:30 PM | **67.31s** | 4.57 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `EP02_Cable_Ship_Repair_EN.mp4` | EP02: Cable Ship Repair at 5,000m | English | Nov 17, 6:00 PM | **56.70s** | 3.62 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `EP02_Cable_Ship_Repair_HI.mp4` | EP02: Cable Ship Repair at 5,000m | Hindi | Nov 17, 6:30 PM | **68.91s** | 4.14 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `DHCP_DORA_EN.mp4` | DHCP: The DORA Handshake | English | Nov 18, 6:00 PM | **74.52s** | 6.74 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `DHCP_DORA_HI.mp4` | DHCP: The DORA Handshake | Hindi | Nov 18, 6:30 PM | **76.67s** | 6.69 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `EP03_Cold_vs_Warm_Cache_EN.mp4` | EP03: Cold Cache vs Warm Cache | English | Nov 19, 6:00 PM | **63.94s** | 3.79 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `EP03_Cold_vs_Warm_Cache_HI.mp4` | EP03: Cold Cache vs Warm Cache | Hindi | Nov 19, 6:30 PM | **66.18s** | 3.82 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `EP01_Subsea_vs_Satellite_EN.mp4` | EP01: Subsea vs Satellites | English | *Excluded (Duplicate)* | **49.00s** | 6.89 MB | 1080×1920 @ 30 | h264 / aac | **PRESERVED** |
| `EP01_Subsea_vs_Satellite_HI.mp4` | EP01: Subsea vs Satellites | Hindi | *Excluded (Duplicate)* | **57.00s** | 7.33 MB | 1080×1920 @ 30 | h264 / aac | **PRESERVED** |

---

## 2. Deep Quality Verification Findings

1. **Automated Black Frame Detection (`blackdetect=d=0.8:pix_th=0.10`):**
   - Result: **0 occurrences** across all 8 rendered files. No dead black frames, stalled frames, or visual dropouts.
2. **Automated Audio Silence Detection (`silencedetect=noise=-35dB:d=2`):**
   - Result: **0 occurrences** across all 8 rendered files. Narration is crisp, continuous, and properly leveled with background audio.
3. **DHCP Technical Breakdown Verification:**
   - **Full DORA Cycle Preserved:** Discover (`255.255.255.255` broadcast) $\to$ Offer (DHCP Server lease proposition) $\to$ Request (client selection) $\to$ Acknowledge (final lease binding).
   - **UDP Port Numbers Explicitly Kept:** Client Port 68 $\to$ Server Port 67 correctly depicted in visual HUD packet inspection.
   - **Zero Acceleration:** Narration pacing is standard human cadence with no unnatural audio compression or truncation.
4. **Visual Previews Extracted:**
   - Previews archived in `video-engine/out/november_13_30/batch_01/qa_previews/` for visual review.

---

## 3. Approved Calendar & Manifest Sync Status

All 8 active release slots for Batch 1 are marked **`READY (BATCH 1 RENDERED)`** with exact file paths, durations, and sizes:
- **Nov 16 Shorts:** `EP01: 13,000 km in 175 Milliseconds` (EN: 60.4s / HI: 67.3s). Status: `READY (BATCH 1 RENDERED)`.
- **Nov 17 Shorts:** `EP02: Cable Ship Repair at 5,000m` (EN: 56.7s / HI: 68.9s). Status: `READY (BATCH 1 RENDERED)`.
- **Nov 17 Long-form:** `EP01 Long-form` frozen and marked `ALREADY UPLOADED / SCHEDULED (FROZEN - DO NOT RE-UPLOAD)` (`lFED1KvbnRk` EN, `WoItOExOdtM` HI).
- **Nov 18 Shorts:** `DHCP: The DORA Handshake` (EN: 74.5s / HI: 76.7s). Status: `READY (BATCH 1 RENDERED)`.
- **Nov 19 Shorts:** `EP03: Cold Cache vs Warm Cache` (EN: 63.9s / HI: 66.2s). Status: `READY (BATCH 1 RENDERED)`.
- **Nov 20 Long-form:** Removed from queue (`REMOVED FROM QUEUE (Shorts-Only Day - No 16:9 Master)`). Friday Nov 20 is strictly Shorts-only (`QL02: TCP vs UDP`).

All rendered assets are local and staged. No files have been uploaded, scheduled, or published.
