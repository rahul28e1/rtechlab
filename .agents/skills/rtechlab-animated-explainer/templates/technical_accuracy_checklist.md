# RTechLab — Mandatory Technical Accuracy Checklist (V3 Gate)

**Video Title**: [Topic Title]  
**Topic Cluster**: [Networking / Cybersecurity / Linux / Cloud / CCNA]  
**Lead Engineer / Auditor**: [Auditor Name]  
**Status**: [PENDING / APPROVED / REJECTED]  

---

## 1. Protocol Layer & Architectural Separation

| Item | Acceptance Criterion | Verification Method | Pass/Fail |
| :--- | :--- | :--- | :---: |
| **1.1 Layer Separation** | DNS (L7/UDP 53) strictly separated from Transport (L4 TCP/QUIC) & Security (TLS 1.3). | Code/Storyboard inspection of post-resolution transition. | [ ] |
| **1.2 Resolution Endpoint** | Explicit `DNS RESOLUTION COMPLETE` banner rendered upon receipt of `A`/`AAAA` record. | Frame audit of Scene 3/4 transition. | [ ] |
| **1.3 Scope Disclaimer** | Explicitly stated that DNS maps names to addresses and does not transport web payload. | Audio & subtitle check of takeaway section. | [ ] |

---

## 2. Cold-Cache vs. Cached Walkthrough Nuances

| Item | Acceptance Criterion | Verification Method | Pass/Fail |
| :--- | :--- | :--- | :---: |
| **2.1 Exemplary Labeling** | Full Root/TLD traversal explicitly labeled as `[ COLD-CACHE EXAMPLE ]` / `[ ILLUSTRATIVE ]`. | Visual HUD check on resolution hierarchy cards. | [ ] |
| **2.2 No Universal Hit Claims**| Zero unsubstantiated percentage claims (e.g. avoided claiming "99% of queries"). | Narration script search. | [ ] |
| **2.3 Caching Mechanics** | Explains that recursive resolvers cache NS and TLD records to bypass roots on repeated lookups. | Script and visual text review. | [ ] |

---

## 3. Latency & Performance Claims Integrity

| Item | Acceptance Criterion | Verification Method | Pass/Fail |
| :--- | :--- | :--- | :---: |
| **3.1 No Guaranteed Latencies** | Zero absolute guarantees (e.g. removed "under 50ms", "<1ms guaranteed"). | Regex check on scripts: `/\b(under \d+ms\|guaranteed)\b/i`. | [ ] |
| **3.2 Qualified Benchmarks** | Any latency metric is explicitly tagged as an illustrative benchmark under specified conditions. | Visual footer notice check. | [ ] |

---

## 4. Commands, Syntaxes & Diagrammatic Fidelity

| Item | Acceptance Criterion | Verification Method | Pass/Fail |
| :--- | :--- | :--- | :---: |
| **4.1 Terminal Output** | Genuine command syntax and authentic output structure (e.g. `dig`, `nslookup`, `ping`). | Terminal HUD code review against standard BIND utilities. | [ ] |
| **4.2 Record Types** | Accurate record names (`A`, `AAAA`, `CNAME`, `MX`, `TXT`, `SOA`, `PTR`). | Record card verification. | [ ] |
| **4.3 Network Ports** | Accurate standard protocol port numbers (e.g. DNS=53, HTTPS=443). | HUD port indicator check. | [ ] |

---

## 5. Brand, Links & Social Handles Safety

| Item | Acceptance Criterion | Verification Method | Pass/Fail |
| :--- | :--- | :--- | :---: |
| **5.1 No Unverified URLs** | Zero hardcoded naked domain URLs unless DNS registrar delegation is confirmed live. | Scan for `http://` or `www.` in outro scenes. | [ ] |
| **5.2 Verified Handles** | Prominently displays verified social handles (e.g. `@RTechLab` / `youtube.com/@RTechLab`). | Outro frame audit. | [ ] |

---

## 6. Official Technical Citations & RFC References

1. **RFC 1034**: *Domain Names - Concepts and Facilities* (P. Mockapetris, 1987) — Defines the hierarchical domain space and master file formats.
2. **RFC 1035**: *Domain Names - Implementation and Specification* (P. Mockapetris, 1987) — Defines DNS query and response message formats over UDP/TCP port 53.
3. **RFC 8446**: *The Transport Layer Security (TLS) Protocol Version 1.3* (E. Rescorla, 2018) — Defines separate post-DNS 1-RTT cryptographic handshake.
4. **RFC 9000**: *QUIC: A UDP-Based Multiplexed and Secure Transport* (J. Iyengar, M. Thomson, 2021) — Defines modern transport protocol for HTTP/3.
