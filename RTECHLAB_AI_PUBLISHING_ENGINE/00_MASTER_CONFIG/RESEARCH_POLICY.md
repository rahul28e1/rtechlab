# RTechLab Technical Research & Verification Policy

## 1. Authoritative Source Hierarchy
All technical claims must be grounded in primary authoritative sources:
1. **Tier-1 Standards Bodies**: IETF RFCs, IEEE 802.3/802.11 standards, PCI-SIG specifications, JEDEC memory standards, USB-IF, NIST publications.
2. **Official Vendor Documentation**: Cisco Systems Configuration Guides, AWS Architecture Documentation, Microsoft Azure Docs, Red Hat Enterprise Linux Manuals, Intel/AMD Whitepapers.
3. **Academic & Peer-Reviewed Literature**: ACM/IEEE digital libraries, University CS department textbooks (Tanenbaum, Kurose & Ross, Patterson & Hennessy).

## 2. Fact-Checking Register
Every publication requires a companion `source-register.json` listing:
- `claim_id`: Unique identifier.
- `statement`: The exact technical statement made in the text.
- `authoritative_source`: Official URL / RFC number / Specification page.
- `verification_date`: Date verified by RTechLab engineering team.
- `status`: Verified / Caution / Needs Review.
