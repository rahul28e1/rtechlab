# Visual Styles Reference: Style A & Style B

## 1. Style A: Cinematic Animated Storytelling
*Best for: Conceptual breakthroughs, historical network milestones, big-picture cloud architecture.*

- **Perspective**: 2.5D isometric or 3D perspective with realistic depth cues.
- **Atmosphere**: Cyberpunk/datacenter volumetric lighting, subtle glowing grid lines in 3D floor planes, soft camera depth-of-field blur (`blur(2px)` background blur).
- **Camera Work**: Continuous floating motion using Remotion's `interpolate(frame, [0, 300], [1, 1.15])` zoom sweeps and pan motions.
- **Lighting**: Dynamic neon rim lights around server racks, fiber-optic glowing strands, and pulsing status LEDs.

## 2. Style B: Technical Motion Graphics
*Best for: DNS, TCP handshakes, Subnetting, IP routing, Packet analysis, Firewalls.*

- **Perspective**: Crisp top-down or orthogonal technical schematic view.
- **Visual Vocabulary**:
  - **Data Packets**: Glowing circular energy pulses with particle tails moving along vectorized Bezier cables.
  - **Servers & Nodes**: High-tech HUD cards with IP address tags, role badges (`Root Server`, `TLD .COM`, `Authoritative NS`), and status indicators (`CACHE MISS`, `LOOKUP`, `200 OK`).
  - **Terminal Overlay**: Monospace command-line windows displaying authentic command syntaxes (`dig rtechlab.com +trace`, `ping`, `nslookup`).
  - **Data Inspection Modals**: Callout cards highlighting DNS record types (`A`, `AAAA`, `CNAME`, `MX`, `TXT`) with realistic TTL counters.
- **Color Coding**:
  - Request / Query: Cyan `#00f2fe`
  - Recursive Search: Violet `#a855f7`
  - Verified Answer: Emerald `#10b981`
  - Cached Hit: Amber `#f59e0b`
  - Rejection / Drop: Crimson `#ef4444`
