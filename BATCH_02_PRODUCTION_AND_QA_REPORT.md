# RTechLab — Batch 2 Production & QA Verification Report
**Date:** November 13, 2026  
**Pipeline Batch:** Batch 02 (November 20–23 Releases — Complete)  
**Output Directory:** `video-engine/out/november_13_30/batch_02/`  
**Manifests Synchronized:**  
- [NOVEMBER_13_30_BULK_MANIFEST.json](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/publishing/calendar/NOVEMBER_13_30_BULK_MANIFEST.json)
- [NOVEMBER_13_30_BULK_MANIFEST.csv](file:///c:/Users/Rahul/Videos/My%20projects/RtechLab/publishing/calendar/NOVEMBER_13_30_BULK_MANIFEST.csv)

---

## 1. Batch 2 Master Production & QA Summary

All 8 vertical explainer videos in Batch 2 have been produced, rendered, and verified in strict compliance with RTechLab motion graphics standards: **1080 × 1920 (9:16 vertical)**, **30 FPS**, **H.264 video**, **AAC stereo audio**, synchronized kinetic subtitles, dynamic sound effects, and clean visual transitions.

| Video File | Episode / Concept | Language | Target Release | Duration | Size | Resolution / FPS | Codecs | QA Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `QL02_TCP_vs_UDP_EN.mp4` | QL02: TCP vs UDP | English | Nov 20, 6:00 PM | **57.00s** (1,710 f) | 3.82 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `QL02_TCP_vs_UDP_HI.mp4` | QL02: TCP vs UDP | Hindi | Nov 20, 6:30 PM | **58.01s** (1,740 f) | 3.72 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `EP02_Cable_Landing_Station_EN.mp4` | EP02: Cable Landing Station | English | Nov 21, 6:00 PM | **46.51s** (1,395 f) | 7.03 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `EP02_Cable_Landing_Station_HI.mp4` | EP02: Cable Landing Station | Hindi | Nov 21, 6:30 PM | **56.00s** (1,680 f) | 7.61 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `EP04_Packet_Loss_EN.mp4` | EP04: What Happens on Packet Drop | English | Nov 22, 6:00 PM | **38.02s** (1,140 f) | 4.28 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `EP04_Packet_Loss_HI.mp4` | EP04: What Happens on Packet Drop | Hindi | Nov 22, 6:30 PM | **45.01s** (1,350 f) | 4.86 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `QL03_Private_vs_Public_IP_EN.mp4` | QL03: Private vs Public IP | English | Nov 23, 6:00 PM | **55.02s** (1,650 f) | 3.63 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |
| `QL03_Private_vs_Public_IP_HI.mp4` | QL03: Private vs Public IP | Hindi | Nov 23, 6:30 PM | **60.01s** (1,800 f) | 3.84 MB | 1080×1920 @ 30 | h264 / aac | **PASS** |

---

## 2. Automated Quality Assurance Findings

1. **Automated Black Frame Detection (`blackdetect=d=0.8:pix_th=0.10`):**
   - Result: **0 occurrences** across all 8 rendered MP4 files. Seamless transitions without frozen or corrupted frames.
2. **Automated Audio Silence Detection (`silencedetect=noise=-35dB:d=2`):**
   - Result: **0 occurrences** across all 8 rendered MP4 files. Continuous, pristine narration with ambient background audio pads.
3. **Typography & Script Rendering:**
   - English: SF Pro / Inter typography with high-contrast cyan/emerald highlights.
   - Hindi: Noto Sans Devanagari typography with rendered ligatures, matras, and conjuncts.
4. **Visual Previews Extracted:**
   - Visual inspection previews (intro, mid, end) for every video have been extracted and archived in `video-engine/out/november_13_30/batch_02/qa_previews/`.

---

## 3. Technical Accuracy & Pedagogical Review

Each concept follows RTechLab's core philosophy: **RESULT FIRST, THEN EXPLAIN**.

1. **QL02 — TCP vs UDP (Nov 20):**
   - *Result First:* Why competitive games lag while YouTube buffers smoothly.
   - *Technical Explanation:* 
     - **TCP:** Stateful 3-way handshake (SYN, SYN-ACK, ACK), sequence numbers, and automatic retransmission of lost packets (guaranteed in-order delivery).
     - **UDP:** Connectionless datagrams without handshakes or retransmissions. Stale packets are dropped instantly in favor of sub-millisecond real-time velocity.
2. **EP02 — Inside a Cable Landing Station (Nov 21):**
   - *Result First:* How a 13,000 km ocean cable reaches land without plugging into a wall outlet.
   - *Technical Explanation:* 4-stage infrastructure breakdown:
     - Stage 1: Reinforced Beach Manhole (coastal conduit).
     - Stage 2: Power Feed Equipment (PFE) safely grounding 10,000V DC repeater power.
     - Stage 3: DWDM Optical Line Terminals splitting laser into 100+ wavelengths ($>100\text{ Tbps}$).
     - Stage 4: Terrestrial fiber backbone mesh routing terabits into metropolitan datacenters.
3. **EP04 — Packet Loss & MTU Slicing (Nov 22):**
   - *Result First:* If a 10GB 4K movie were sent as a single file, a 1-bit drop would force a 100% restart from zero!
   - *Technical Explanation:* 
     - Slicing into 1,500-byte MTU blocks (1,460 bytes user payload MSS + 20B IPv4 + 20B TCP header).
     - TCP sequence numbering and dynamic mesh routing.
     - Client TCP reassembly buffer holding and reordering packets in memory, ensuring stutter-free playback.
4. **QL03 — Private vs Public IP & RFC 1918 (Nov 23):**
   - *Result First:* Why almost every home router uses `192.168.1.1`.
   - *Technical Explanation:*
     - 8 billion people vs the 4.3 billion IPv4 mathematical ceiling.
     - RFC 1918 Private Ranges: `10.0.0.0/8`, `172.16.0.0/12`, and `192.168.0.0/16`.
     - Router NAT (Network Address Translation) multiplexing internal private IPs onto one globally unique public ISP IP.

---

## 4. Manifest Synchronization

The master bulk manifests have been updated:
- Entries for Nov 20, 21, 22, and 23 are marked **`READY (BATCH 2 RENDERED)`**.
- Asset paths point to `video-engine/out/november_13_30/batch_02/`.
- Verified durations, file sizes, and thumbnail preview paths have been linked.

All previous Batch 1 assets remain preserved and intact. Zero assets have been uploaded, scheduled, or published.
