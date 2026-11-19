# RTechLab — Motion Graphics & Animation System
**Engine:** Remotion (React + CSS-in-JS + Three.js + WebGL)  
**Standard Frame Rate:** 30.0 FPS  
**Animation Philosophy:** Result First, Staggered Energy, Continuous Mechanical Pacing

---

## 1. Core Motion Design Principles

Static slideshows cause immediate viewer bounce on short-form feeds. To capture and sustain attention throughout the 45–75 second duration, RTechLab implements five foundational motion principles learned from the top references:

1. **The Instant Hook Burst (Frames 0–30 / 0–1.0s):**
   - The opening frame MUST start in motion. Never begin with a stationary title card.
   - Use an aggressive scale push (`scale: 1.15 -> 1.0` with damping spring) or dynamic visual action (JCB digging down, seat spotlight flashing, laser beam shooting across screen).
2. **Staggered Orchestration (Never Reveal Simultaneously):**
   - When introducing multiple cards, diagrams, or nodes, stagger them by **4 to 6 frames** (`0.15s to 0.20s`).
   - Card 1 appears at frame 0 $\to$ Card 2 at frame 5 $\to$ Card 3 at frame 10.
   - This creates a rhythmic "cascade" that commands the eye to follow the information hierarchy.
3. **Continuous Subtle Micro-Motion:**
   - Every active scene must contain breathing micro-motion so the video never looks like a frozen JPEG.
   - Examples:
     - Laser packets pulsing through fiber conduits (`interpolate(frame % 30, [0, 30], [0, 100])`).
     - Ambient background grid slowly drifting (`translateY: (frame * 0.5) % 40px`).
     - Focused node pulsating with subtle scale oscillation (`1 + Math.sin(frame * 0.08) * 0.015`).
4. **Snappy Spring Curves (No Linear Easings):**
   - UI elements, cards, and badges must enter with realistic physical weight using Remotion's `spring()` utility.
   - Standard Spring Config:
     ```javascript
     spring({
       frame,
       fps: 30,
       config: {
         damping: 14,     // Prevents excessive oscillation
         mass: 0.8,       // Lightweight, swift response
         stiffness: 120,  // Fast initial acceleration
       }
     })
     ```
5. **Intentional Camera Movement (Dynamic Punch-ins):**
   - When shifting from an overarching concept to a technical detail, apply a 1.25x camera scale push into the target node, then re-center smoothly.

---

## 2. Transition System & Visual Cuts

| Transition Type | Duration | When to Use | Remotion / CSS Implementation |
| :--- | :--- | :--- | :--- |
| **Snap Cut with Sound** | 1 frame | Switching between major pedagogical acts | Instant component unmount / mount with `sfx_whoosh.wav` |
| **Scale Punch-in** | 8 frames | Highlighting problem $\to$ solution | `scale: interpolate(f, [0, 8], [1.0, 1.12])` |
| **Card Slide & Lock** | 12 frames | Introducing new architectural stages | `translateY: interpolate(f, [0, 12], [80, 0])` + `opacity: [0, 1]` |
| **Wavelength Beam** | 15 frames | Data transmission across routers/cables | Animated SVG `strokeDashoffset` laser pulse |
| **Glitch Error Burst** | 6 frames | Corrupted packet, JCB cut, or system error | Rapid 2-frame chromatic aberration offset `(±4px)` + red tint |
| **Brand Outro Dissolve** | 18 frames | Clean conclusion and CTA | Sequence fade to `BrandOutro` at `tEnd - 90 frames` |

---

## 3. Sound Design & Audio Architecture

A visual animation without tightly synchronized sound effects loses 60% of its perceived production value. RTechLab reels require a **3-Layer Audio Mix**:

```
+-------------------------------------------------------------------------+
| Layer 1: Master Voiceover (Narration - Normalized to -14 LUFS)          |
+-------------------------------------------------------------------------+
| Layer 2: Synchronized SFX (Whooshes, Clicks, Beeps, Thuds - -18 LUFS)   |
+-------------------------------------------------------------------------+
| Layer 3: Tech Ambient Bed (Low-frequency rhythm - -26 LUFS)            |
+-------------------------------------------------------------------------+
```

### Essential Sound Effect Mapping:
- **`sfx_whoosh.wav`:** Triggered on scene cuts, camera shifts, and card transitions.
- **`sfx_tap.wav` / `sfx_click.wav`:** Triggered when a toggle switches, a latch (`kundi`) closes, or a button is pressed.
- **`sfx_packet.wav`:** High-frequency electronic chirp played as packets or laser pulses travel along a line.
- **`sfx_warning.wav`:** Low-frequency electronic buzz when a network partition, packet drop, or error occurs.
- **`sfx_connected.wav`:** Harmonic chime when a TCP handshake completes or a warm cache hits 0ms.

---

## 4. Reusable Motion Components in Video Engine

All future reels will assemble from modular, high-performance Remotion components:

1. **`<HeaderHUD />`:** Renders top branding pill, animated dashed progress indicator, and episode badge.
2. **`<TelemetryBar />`:** Diagnostic console at `Y: 155px` displaying real-time system state and parameters.
3. **`<AnimatedPipeline />`:** Step-by-step sequential node runner with glowing laser links (used in DORA, Landing Station, and RAG).
4. **`<ComparisonArena />`:** Split-screen or dual-card layout comparing protocols or algorithms (e.g. TCP vs UDP, Cold vs Warm Cache).
5. **`<TerminalSnippet />`:** Dark code inspector with syntax-highlighted code blocks, line highlights, and cursor typing animations.
6. **`<SubtitlesOverlay />`:** Bottom-anchored kinetic caption engine with automated safe-zone margins and keyword badge styling.
7. **`<BrandOutro />`:** Official RTechLab closing seal, YouTube/Instagram CTA, and partnership credits.
