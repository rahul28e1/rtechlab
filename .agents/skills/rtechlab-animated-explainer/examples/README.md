# RTechLab Animated Explainer — Prototype Example: "How DNS Works"

This directory documents the reference demonstration project implementing the full end-to-end video pipeline.

## Topic: How DNS Works
- **Languages**: English (`dns_en`) and Hindi (`dns_hi`)
- **Duration**: 60 seconds (1800 frames @ 30 FPS)
- **Format**: Vertical 9:16 ($1080 \times 1920$), MP4 H.264
- **Style**: Technical Motion Graphics with interactive network node architecture

## Pipeline Execution Steps:
1. `py -3.12 .agents/skills/rtechlab-animated-explainer/scripts/generate_narration.py <script_file> en video-engine/public/audio/dns_en.mp3 video-engine/public/subtitles/dns_en.srt`
2. `py -3.12 .agents/skills/rtechlab-animated-explainer/scripts/generate_narration.py <script_file> hi video-engine/public/audio/dns_hi.mp3 video-engine/public/subtitles/dns_hi.srt`
3. `cd video-engine && npx remotion render DnsExplainerEN out/rtechlab_dns_en.mp4`
4. `cd video-engine && npx remotion render DnsExplainerHI out/rtechlab_dns_hi.mp4`
5. `py -3.12 .agents/skills/rtechlab-animated-explainer/scripts/verify_video_quality.py out/rtechlab_dns_en.mp4 out/frames_en/`
