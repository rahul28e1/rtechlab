# RTechLab Storyboard Template (V3 Master Standard)

**Topic**: [Topic Name, e.g. How DNS Works]  
**Topic Cluster**: [Networking / Linux / Security / Cloud / CCNA]  
**Visual Style**: [Style A: Cinematic 3D / Style B: Technical Motion Graphics]  
**Format**: 9:16 Vertical (1080 x 1920) @ 30 FPS  
**Target Duration**: 60s – 75s (Calibrated to natural bilingual cadence)  

---

### Act 1: The Hook (0s – 5s)
- **Visual Choreography**: High-contrast curiosity-driven question. Stylized browser search bar input. Glowing Enter-key shockwave particle animation.
- **Audio/SFX**: Sub-bass rumble + high-tech electronic swoosh.
- **On-Screen Copy**: "What happens between typing a domain and the webpage loading?"
- **Safety Margin**: Header above 240px, safe margins respected.

### Act 2: Names vs. Numbers (5s – 18s)
- **Visual Choreography**: Dual card comparison: Human Mnemonic Domain Name vs Numerical Routable IP (with 32-bit binary notation).
- **Audio/SFX**: Keyboard clicks + digital chime.
- **On-Screen Copy**: "The Core Dilemma: Names vs IP Numbers".
- **Technical Badge**: `RFC 1034 / 1035 Domain Concept`.

### Act 3: DNS Resolution — Stage 1 (18s – 41s)
- **Visual Choreography**:
  - Reusable labels: `[ COLD-CACHE EXAMPLE ]` & `[ ILLUSTRATIVE WALKTHROUGH ]`.
  - 5-Node Vertical Stack:
    1. Local Browser & OS Cache (Cache Miss)
    2. Recursive Resolver (Queries iteratively)
    3. Root Nameserver (`.` hint)
    4. Top-Level Domain Nameserver (`.com`)
    5. Authoritative Nameserver (Official `A` record)
  - Climax indicator: `✓ DNS RESOLUTION COMPLETE` with resolved IP address.
- **Audio/SFX**: Packet transmission pulse + confirmation chime on resolution complete.

### Act 4: Browser Connection — Stage 2 (41s – 53s)
- **Visual Choreography**:
  - Header: `STAGE 2: BROWSER CONNECTION (SEPARATE FROM DNS)`.
  - Two distinct cards:
    - Card A: `Layer 4 Transport Session (TCP 3-Way Handshake or QUIC)`.
    - Card B: `TLS 1.3 Cryptographic Handshake (Key Exchange & Encryption)`.
  - Disclaimer footer: `*DNS only maps names to addresses. Data transfer and TLS encryption happen in downstream network layers.*`
- **Audio/SFX**: Secure lock chime + data transmission stream.

### Act 5: Summary Takeaway (53s – 59s)
- **Visual Choreography**: 3 Clean Architectural Rules:
  1. Directory, Not Transport
  2. Hierarchical Delegations
  3. Cached Lookups Skip Roots
- **Audio/SFX**: Upbeat educational synth chord.

### Act 6: Brand Outro & Verified Handles (59s – End)
- **Visual Choreography**: 3D Glowing RTechLab emblem shield. Verified social handle: `Follow @RTechLab` / `youtube.com/@RTechLab`.
- **Audio/SFX**: RTechLab branded audio sting.
- **Brand Safety**: Zero unverified URLs.
