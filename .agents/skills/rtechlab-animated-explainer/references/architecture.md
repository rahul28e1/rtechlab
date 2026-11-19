# Architecture Reference: RTechLab Video Engine

## 1. Engine Stack Components

1. **Remotion Core (`remotion`, `@remotion/cli`)**:
   - Manages programmatic frame rendering through headless Chrome.
   - Converts React component trees into sequentially timed frames at 30 FPS.
   - Handles audio mixing, transitions (`interpolate`, `spring`), and compositions.

2. **React 19 + Canvas / SVG / Lucide**:
   - Vector graphics rendering without raster artifacting at $1080 \times 1920$.
   - Interactive components representing servers, cables, glowing packet particles, and network hubs.

3. **Audio Synthesis & Synchronizer (`edge-tts` + Python)**:
   - Zero-cost, high-fidelity neural audio generation.
   - Extracts word-level boundary events to generate synchronized `.vtt` and `.srt` subtitle files.
   - Audio is embedded directly into Remotion compositions via `<Audio src={...} />`.

4. **FFmpeg**:
   - Used by Remotion CLI under the hood for H.264 video compression and AAC audio muxing.
   - Standalone verification and normalization script inspects output MP4s.

## 2. Directory Layout
```
video-engine/
├── package.json
├── remotion.config.js
├── src/
│   ├── Root.jsx
│   ├── compositions/
│   │   └── DnsExplainer/
│   │       ├── index.jsx
│   │       ├── scenes/
│   │       │   ├── Scene1Hook.jsx
│   │       │   ├── Scene2Problem.jsx
│   │       │   ├── Scene3Resolver.jsx
│   │       │   ├── Scene4Authoritative.jsx
│   │       │   ├── Scene5Connection.jsx
│   │       │   └── Scene6SummaryCTA.jsx
│   │       └── components/
│   │           ├── NodeServer.jsx
│   │           ├── PacketParticle.jsx
│   │           ├── BrowserHero.jsx
│   │           ├── TerminalHUD.jsx
│   │           └── SubtitlePill.jsx
│   └── styles/
│       └── theme.js
├── public/
│   ├── audio/
│   │   ├── dns_en.mp3
│   │   ├── dns_hi.mp3
│   │   └── sfx/
│   └── subtitles/
│       ├── dns_en.srt
│       └── dns_hi.srt
└── out/
    ├── rtechlab_dns_en.mp4
    ├── rtechlab_dns_hi.mp4
    ├── dns_thumbnail.png
    └── verification_report.json
```
