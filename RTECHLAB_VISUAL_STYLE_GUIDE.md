# RTechLab — Visual Style Guide
**Standard:** 9:16 Vertical Animated Explainers (YouTube Shorts & Instagram Reels)  
**Resolution:** 1080 × 1920 @ 30 FPS  
**Target Duration:** 45–75 Seconds  
**Languages:** English & Hindi (Bilingual Production)

---

## 1. Color Palette & Thematic Standards

RTechLab utilizes a **Dual-Chassis Visual Identity**:
1. **The Obsidian Dark Chassis (85% of productions):** Deep cinematic obsidian/slate background engineered for maximum contrast on mobile OLED displays.
2. **The Clean Light Glassmorphic Chassis (15% of productions):** Used specifically for Developer Tools, GitHub/Code workflows, and UI software architecture (inspired by Reference 3).

### A. Core Foundation Colors
| Token Name | Hex Code | Purpose |
| :--- | :--- | :--- |
| `bg-obsidian` | `#080C16` | Primary dark canvas background |
| `bg-card` | `rgba(30, 41, 59, 0.85)` | Elevated card surfaces and containers |
| `bg-card-subtle` | `rgba(15, 23, 42, 0.60)` | Secondary background layers and HUD bars |
| `border-subtle` | `rgba(148, 163, 184, 0.20)` | Default structural borders and card outlines |
| `border-glow` | `rgba(56, 189, 248, 0.50)` | Active focused node glow |
| `text-primary` | `#F8FAFC` | Main headings, primary values, active subtitles |
| `text-secondary` | `#94A3B8` | Descriptions, technical subtitles, metadata |
| `text-muted` | `#64748B` | Inactive labels, dashed indicators |

### B. Category Accent Colors (Systematic Domain Mapping)
| Domain | Accent Color | Hex Code | Category Tag Example |
| :--- | :--- | :--- | :--- |
| **Networking & Protocols** | Neon Cyan / Electric Blue | `#38BDF8` / `#0284C7` | `● NETWORKING • TCP/UDP` |
| **Cybersecurity & Encryption** | Laser Emerald / Mint | `#10B981` / `#34D399` | `● SECURITY • SSL/TLS` |
| **Cloud & Distributed Systems** | Sunset Amber / Gold | `#F59E0B` / `#FBBF24` | `● SYSTEM DESIGN • CAP` |
| **Linux & Command Line** | Terminal Green / Cyan | `#22C55E` / `#06B6D4` | `● LINUX • KERNEL & CLI` |
| **Hardware & Subsea Infra** | Industrial Steel / Coral | `#FB7185` / `#38BDF8` | `● HARDWARE • 10,000V PFE` |
| **Programming & Data Structures**| Purple / Lavender | `#8B5CF6` / `#A855F7` | `● CODE • NEXT.JS RUNTIME` |
| **Databases & Concurrency** | Coral Orange / Neon Red | `#F97316` / `#EF4444` | `● DATABASE • MUTEX LOCK` |

---

## 2. Typography Standards

All compositions load high-legibility web-safe vector fonts with complete Unicode coverage for Latin and Devanagari script.

### A. Font Families
- **English / Latin:** `Inter`, `SF Pro Display`, `-apple-system, sans-serif`
- **Hindi / Devanagari:** `Noto Sans Devanagari`, `Kohinoor Devanagari`, `sans-serif`
- **Code / Monospace Data:** `JetBrains Mono`, `Fira Code`, `ui-monospace, monospace`

### B. Type Scale (at 1080 × 1920 Canvas)
| Role | Size | Weight | Line Height | Letter Spacing | Example |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Series Brand Top Tag** | 16px | 700 (Bold) | 1.0 | +0.10em (Uppercase) | `RTECHLAB • SYSTEM DESIGN` |
| **Scene Category Pill** | 14px | 700 (Bold) | 1.0 | +0.06em (Uppercase) | `● BENGALURU • FIBER CUT` |
| **Primary Hero Heading** | 36px–42px | 800 (ExtraBold)| 1.25 | -0.02em | `Why 99% of Internet is Subsea` |
| **Card Heading** | 24px–28px | 800 (Bold) | 1.20 | 0.00em | `1. Beach Manhole (समुद्री तट)` |
| **Technical Telemetry Readout**| 15px–16px | 600 (SemiBold)| 1.20 | +0.04em (Monospace) | `PORT: 443 | SYN -> ACK | 15ms` |
| **Subtitles (Regular Text)** | 26px–28px | 700 (Bold) | 1.35 | -0.01em | `जब आप 4K वीडियो देखते हैं...` |
| **Subtitles (Keyword Badge)** | 26px–28px | 800 (ExtraBold)| 1.0 | +0.02em | `[ 1,500 Bytes ]` (Colored pill) |

---

## 3. Persistent Header HUD Architecture

Every RTechLab reel must maintain the 3-part top HUD within the top `70px–180px` zone:

```
+-----------------------------------------------------------------------+
|  [● RTECHLAB • CATEGORY]    [—— —— —— —— ——]    [EP02 // SHIFT-03]    |
+-----------------------------------------------------------------------+
|  [●] TELEMETRY STATUS: REAL-TIME ARCHITECTURAL PHASE READOUT         |
+-----------------------------------------------------------------------+
```

1. **Top Bar (Y: 70px):**
   - **Left:** Pill badge with live colored status indicator dot (`#38BDF8` or domain color) and Series/Category name.
   - **Center:** Dashed or segmented scene progress indicator (`5–8 segments`), advancing scene by scene.
   - **Right:** Episode code or time index (`EP04 // ARCH-01`).
2. **Telemetry Bar (Y: 155px):**
   - Dark semi-transparent pill (`rgba(2, 6, 23, 0.85)`).
   - Monospaced diagnostic readout updating with active technical state (e.g. `DNS: COLD CACHE MISS (0ms) -> ROOT HIERARCHY WALK`).

---

## 4. Subtitle & Safe Zone Specification

Instagram Reels and YouTube Shorts overlay destructive system UI controls on mobile screens:
- **Top Safe Margin:** `0px to 220px` (avoid top header overlap).
- **Bottom Safe Margin:** `0px to 320px` from bottom edge (Instagram caption, sound title, like/comment buttons).
- **Subtitle Placement:** Exactly anchored at **`Y: 1650px`** (or `bottom: 120px–220px`).
- **Subtitle Container:** 
  - Centered horizontally (`width: 980px`).
  - Dark glass background (`rgba(15, 23, 42, 0.95)`), rounded corners (`16px`), subtle glow border.
  - Generates clear readability against both light and dark background graphics.
- **Active Keyword Highlighting:**
  - Standard words: `#FFFFFF` (high opacity).
  - Target keyword: Wrapped in an accent pill badge with solid background (e.g., `#8B5CF6` purple badge or `#38BDF8` cyan badge) with white text.

---

## 5. Visual Asset & Illustration Taxonomy

Inspired by the reference suite, RTechLab videos use 4 distinct visual asset types:

1. **Cutaway Engineering Diagrams (Reference 1 Style):**
   - Cross-sections of physical systems (underground conduits, subsea cable layers, data center racks, server motherboards).
2. **Dense Scannable Cards (Reference 2 Style):**
   - Multi-row directories with vertical domain stripes, numeric IDs, and micro-illustrations (ports, protocols, status codes).
3. **Interactive UI & Node Trees (Reference 3 Style):**
   - macOS browser chrome, live URL bars, bezier-curve node graphs, and syntax-highlighted code editor boxes.
4. **Metaphor-to-Mechanism Transitions (References 4 & 5 Style):**
   - Physical real-world metaphor (flipping book $\to$ vector chunks; washroom latch $\to$ mutex lock; Tatkal seat $\to$ database transaction).
