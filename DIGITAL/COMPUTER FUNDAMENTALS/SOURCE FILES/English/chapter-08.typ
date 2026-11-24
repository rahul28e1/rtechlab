#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-cyan)[CHAPTER 08 · CYBERSECURITY & CRYPTOGRAPHY]
= Chapter 8: Cybersecurity, Threat Vectors & Defense Frameworks

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  The CIA Triad, malware taxonomy, social engineering, symmetric vs asymmetric cryptography, hashing, FIDO2 Passkeys, Zero Trust Architecture (NIST SP 800-207), and NIST Post-Quantum Cryptography standards released August 13, 2024: FIPS 203 (ML-KEM lattice-based key encapsulation), FIPS 204 (ML-DSA lattice-based digital signatures), and FIPS 205 (SLH-DSA stateless hash-based digital signatures).
]

#v(2pt)

== 8.1 Information Security Fundamentals: The CIA Triad & Risk Modeling
Information security is architected upon three core principles known as the #hl[CIA Triad]:
- *Confidentiality:* Ensuring information is accessible only to authorized entities. Enforced via AES-256 encryption, access control lists (ACLs), and hardware secure enclaves.
- *Integrity:* Guaranteeing data has not been modified, corrupted, or forged in transit or storage. Enforced via cryptographic hash digests (SHA-256), message authentication codes (HMAC), and digital signatures.
- *Availability:* Ensuring computing services, data stores, and networks remain reliably accessible to authorized users upon demand. Enforced via load balancing, DDoS mitigation, and RAID redundancy.
- *Risk Equation:* $"Risk" = "Threat" times "Vulnerability" times "Impact"$. A *Threat* is a potential danger; a *Vulnerability* is a flaw in system design; *Risk* is the operational probability of exploitation.

#v(2pt)

== 8.2 Malware Taxonomy & Attack Vectors
#table(
  columns: (1fr, 1.3fr, 2.7fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*Malware Class*], [*Propagation Mechanism*], [*Payload Behavior & System Destruction Vector*]),
  [Computer Virus], [Host file attachment], [Attaches to legitimate executable binaries (`.exe`, `.dll`). Executes only when human user launches host file; corrupts local files.],
  [Computer Worm], [#hl[Self-replicating network propagation]], [Exploits network vulnerabilities (e.g., SMB EternalBlue) to spread across computers autonomously without human intervention.],
  [Trojan Horse], [Social engineering disguise], [Masquerades as benign software (pirated games, utility tools). Once executed, drops backdoor reverse shells giving attackers remote access.],
  [Ransomware], [Phishing or unpatched exploits], [Silently encrypts user files using strong AES-256 / RSA-4096 cryptography, demanding cryptocurrency ransoms for decryption keys.],
  [Rootkit], [Kernel-level exploitation], [Modifies operating system kernel tables (`SSDT`) and API hooks to conceal malware processes, sockets, and files from Task Manager and antivirus.],
  [Botnet & DDoS], [Automated bot malware], [Compromises thousands of IoT devices and servers into 'zombies', launching Distributed Denial of Service floods saturating target servers.]
)

#pagebreak()

== 8.3 Cryptographic Systems: Symmetric vs Asymmetric Algorithms
#table(
  columns: (1.1fr, 1.4fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*Cryptographic Metric*], [*Symmetric Encryption*], [*Asymmetric Cryptography (Public-Key)*]),
  [Key Architecture], [#hl[Single shared secret key] for encryption and decryption.], [#hl[Mathematically linked key pair]: Public Key (encrypts) and Private Key (decrypts).],
  [Computational Speed], [Extremely fast; hardware-accelerated via CPU AES-NI instructions.], [Computationally intensive; relies on modular exponentiation and elliptic curve point multiplication.],
  [Key Distribution Problem], [Severe dilemma: how to securely transmit the shared secret key.], [Solves key distribution: Public keys are published openly; private keys never leave local storage.],
  [Industry Standards], [AES (Advanced Encryption Standard: 128/256-bit), ChaCha20.], [RSA (2048–4096 bit), ECC (Elliptic Curve Cryptography: Curve25519, secp256r1).],
  [Primary Applications], [Bulk storage drive encryption (BitLocker), TLS session payloads.], [TLS handshakes, digital signatures, SSH key authentication, Bitcoin addresses.]
)

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/hardware-security-yubikey.jpg",
  caption: "Figure 8.1: FIDO2 hardware security token providing phishing-resistant cryptographic authentication.",
  height: 48pt
)

#v(2pt)

== 8.4 Cryptographic Hashing & Digital Signatures
- *One-Way Hash Functions:* Mathematical algorithms mapping arbitrary-length data streams into a fixed-size digest (e.g., SHA-256 outputs strictly 256 bits). Properties: 1. Deterministic; 2. Pre-image resistant (irreversible); 3. Collision resistant (infeasible to find two inputs yielding identical digests); 4. Avalanche effect (flipping 1 bit changes $>50%$ of the digest).
- *Digital Signatures:* Guarantees sender authenticity and non-repudiation. The sender calculates the SHA-256 hash of a document and #hl[encrypts the hash using their private key]. The recipient decrypts the signature using the sender's public key; if the decrypted hash matches their newly computed hash, the document is mathematically verified.

#pagebreak()

== 8.5 Modern Authentication: FIDO2 Passkeys & Origin-Binding
Passwords suffer from human reuse, database credential stuffing, and phishing sites:
- *Passkey Architecture:* Developed by the FIDO Alliance and W3C (WebAuthn). Replaces passwords with public-key cryptography generated inside hardware secure enclaves (TPM / Apple Secure Enclave).
- *Registration & Login Flow:* During account setup, the user's device generates a unique key pair; the public key is sent to the web server while the private key remains locked in hardware. During login, the server sends a random cryptographic challenge; the user authorizes local biometrics (fingerprint/face), and the device signs the challenge.
- *Phishing Immunity via Origin-Binding:* Passkeys are #hl[cryptographically bound to the exact origin domain] in the browser address bar (e.g., `account.google.com`). If an attacker tricks a user onto a deceptive phishing domain (`account-google-login.com`), the browser recognizes the mismatched origin and refuses to present the passkey!

#v(2pt)

== 8.6 Defense Architecture: Zero Trust & The 3-2-1 Backup Rule
- *Zero Trust Architecture (NIST SP 800-207):* Traditional perimeter security operated on "trust internal corporate network, distrust external Internet". Zero Trust mandates #hl["Never Trust, Always Verify"]:
  1. *Verify Explicitly:* Continuous authentication based on user identity, device health, location, and data sensitivity.
  2. *Least Privilege Access:* Restrict user permissions with Just-In-Time (JIT) and Just-Enough-Access (JEA) controls.
  3. *Assume Breach:* Minimize blast radius through micro-segmentation, preventing lateral attacker movement.
- *The 3-2-1 Backup Rule:* Maintain #hl[3 copies] of data, stored on #hl[2 different physical media types] (e.g., NVMe and magnetic tape), with at least #hl[1 copy stored offsite or air-gapped] (immutable cloud storage immune to ransomware encryption).

#v(2pt)

== 8.7 Post-Quantum Cryptography (NIST FIPS 203/204/205)
Shor's algorithm operates on fault-tolerant quantum computers to solve prime factorization and discrete logarithms in polynomial time relative to input bit length log N (exponentially outperforming classical sub-exponential algorithms like GNFS), fundamentally compromising RSA, Diffie-Hellman, and ECC without asserting an unverified universal exact runtime formula. Grover's algorithm provides quadratic search speedup, effectively halving symmetric key security (mitigated by AES-256).
- *Harvest Now, Decrypt Later (HNDL):* Adversaries currently intercept and store encrypted government and financial traffic to decrypt it retroactively once quantum computers mature.
- *NIST Finalized Post-Quantum Standards (August 2024):*
  - #hl[FIPS 203 (ML-KEM):] Module-Lattice-Based Key-Encapsulation Mechanism for general encryption and key exchange.
  - #hl[FIPS 204 (ML-DSA):] Module-Lattice-Based Digital Signature Algorithm for primary software and document signing.
  - #hl[FIPS 205 (SLH-DSA):] Stateless Hash-Based Digital Signature Algorithm providing an alternative quantum-resistant backup.

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why are FIDO2 Passkeys completely immune to phishing attacks?", a: "Passkeys are cryptographically origin-bound to the website domain reported by the browser. A fake phishing site cannot trigger authentication for a genuine domain.")
#faq-item(q: "What is the difference between symmetric and asymmetric encryption?", a: "Symmetric uses a single shared key for encryption and decryption (very fast). Asymmetric uses a public key to encrypt and a private key to decrypt (solves key sharing).")
#faq-item(q: "Why does the 'Harvest Now, Decrypt Later' threat matter today?", a: "Adversaries are intercepting encrypted data right now. When quantum computers emerge, they will decrypt these stored historical archives unless protected by PQC.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Name the three foundational pillars of the CIA security triad.", ans: "Confidentiality, Integrity, and Availability.")
#short-q(num: 2, q: "Which malware type propagates across networks autonomously without human action?", ans: "Computer Worm.")
#short-q(num: 3, q: "State the core guiding philosophy of Zero Trust Architecture.", ans: "'Never Trust, Always Verify.'")
#short-q(num: 4, q: "Which NIST standard defines module-lattice-based post-quantum key encapsulation?", ans: "NIST FIPS 203 (ML-KEM).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which cryptographic algorithm relies on a single shared secret key for both encryption and decryption?", a: "RSA", b: "ECC", c: "AES (Advanced Encryption Standard)", d: "Diffie-Hellman", ans: "C", expl: "AES is a symmetric cipher utilizing the identical private key for encryption and decryption.")
#mcq(num: 2, q: "What property of cryptographic hash functions guarantees that changing one input bit dramatically alters the digest?", a: "Pre-image resistance", b: "Avalanche effect", c: "Collision resistance", d: "Key derivation", ans: "B", expl: "The avalanche effect ensures that even a microscopic change in plaintext flips over half the resulting digest bits.")
#mcq(num: 3, q: "What security framework replaces traditional perimeter security with continuous explicit verification?", a: "Kerberos", b: "Zero Trust Architecture (NIST SP 800-207)", c: "RADIUS", d: "DMZ Architecture", ans: "B", expl: "Zero Trust enforces continuous verification, least privilege, and assumes system breach.")
#mcq(num: 4, q: "Which newly finalized NIST post-quantum standard establishes module-lattice digital signatures?", a: "FIPS 140-3", b: "FIPS 204 (ML-DSA)", c: "IEEE 802.11", d: "RFC 1918", ans: "B", expl: "NIST FIPS 204 (ML-DSA) specifies the primary quantum-resistant digital signature standard.")
#mcq(num: 5, q: "Under the 3-2-1 backup rule, how many backup copies must be maintained offsite or air-gapped?", a: "At least 1 copy", b: "At least 2 copies", c: "All 3 copies", d: "Zero copies", ans: "A", expl: "The rule requires 3 copies, on 2 different media types, with at least 1 copy stored offsite or air-gapped.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "Password Entropy & GPU Cracking")[
      An 8-character lowercase password is brute-forced by an RTX 4090 GPU in under 45 minutes! A 16-character alphanumeric passphrase takes millions of years.
    ]
  ],
  [
    #tech-spotlight-box(title: "Hardware Security Modules & TPM 2.0")[
      TPM 2.0 chips incorporate anti-tamper shielding and silicon true random number generators (TRNGs), locking BitLocker keys securely to motherboard hardware.
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
