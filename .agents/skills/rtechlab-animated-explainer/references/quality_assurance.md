# Quality Assurance & Verification Standards

Every generated video must pass this 10-point audit before being marked ready for export:

| Check Item | Acceptance Criteria | Method of Verification |
| :--- | :--- | :--- |
| **1. File Existence & Container** | Valid `.mp4` container with playable moov atom | `ffprobe -v error -show_format` |
| **2. Resolution & Aspect Ratio** | Exactly `1080` $\times$ `1920` (9:16 vertical) | `ffprobe -select_streams v:0 -show_entries stream=width,height` |
| **3. Frame Rate** | Exactly `30.00` FPS (zero variable frame rate drops) | `ffprobe -select_streams v:0 -show_entries stream=r_frame_rate` |
| **4. Duration** | Between `58.0s` and `61.0s` (approx 1800 frames) | `ffprobe -show_entries format=duration` |
| **5. Video Codec** | `H.264 / AVC` (High Profile, Level 4.1 or 4.2) | Stream inspection |
| **6. Audio Track** | Stereo AAC, 44.1kHz or 48kHz, audible, normalized | Audio stream count $= 1$, no silent drops |
| **7. Subtitle Alignment** | Subtitle timestamps strictly within video bounds | Inspection of `.srt` start/end markers |
| **8. Visual Clipping** | Important text and graphics inside safe zone | Frame inspection at 1s, 10s, 25s, 40s, 55s |
| **9. Brand Identity** | RTechLab logo, official color palette, no placeholders | Frame inspection of final act (55s–60s) |
| **10. Technical Accuracy** | RFC-compliant protocols, genuine IP addresses, real ports | Pedagogical review of diagrams and text |
