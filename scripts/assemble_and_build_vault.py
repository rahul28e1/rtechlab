# -*- coding: utf-8 -*-
import os
import subprocess
import shutil

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
CCNA_DIR = os.path.join(BASE_DIR, "DIGITAL", "CCNA 200-301")
INTERVIEW_DIR = os.path.join(CCNA_DIR, "03_INTERVIEW_QUESTION_VAULT")
SOURCE_FILE = os.path.join(INTERVIEW_DIR, "source", "interview-question-vault.typ")
PDF_OUT = os.path.join(INTERVIEW_DIR, "CCNA-200-301-Interview-Question-Vault-Edition-1.pdf")
PUBLIC_PDF = os.path.join(BASE_DIR, "public", "downloads", "CCNA-200-301-Interview-Question-Vault-Edition-1.pdf")

import sys
sys.path.append(os.path.join(BASE_DIR, "scripts"))
from ccna_questions_part1 import d1_questions, d2_questions, d3_questions
from ccna_questions_part2 import d4_questions, d5_questions, d6_questions

def typ_esc(s):
    return s.replace('\\', '\\\\').replace('"', '\\"').replace('$', '\\$')

doc_header = '''#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/master-theme.typ": *
#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab CCNA 200-301 Interview Question Vault (Edition 1)",
  author: "Rahul Patel"
)

// COVER PAGE
#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5(
  title: "CCNA 200-301 INTERVIEW VAULT",
  subtitle: "120 Formal Technical Screening Questions · Senior Architect Answers · MNC Rubrics",
  edition: "2027 CAREER ACCELERATOR EDITION · EDITION 1",
  series-pill: "RTECHLAB COMMERCIAL SUITE · INTERVIEW VAULT EDITION 1",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-CCNA-VAULT-ED1",
  logo-path: "/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg"
)

// PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "CCNA 200-301 Technical Interview Vault",
  edition: "2027 Career Accelerator Edition · Edition 1 Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-CCNA-VAULT-ED1"
)

#pagebreak()

= EXECUTIVE INTERVIEW STRATEGY & MNC SCREENING RUBRIC

#concept-box(title: "SENIOR ARCHITECT INTERVIEW METHODOLOGY")[
  Technical interviews at leading multi-national corporations (MNCs) such as Cisco Systems TAC, Tata Consultancy Services (TCS), Wipro, Infosys, Bharti Airtel, HCL, and Cognizant do not merely test rote memorization. Interviewers evaluate your structural understanding of packet lifecycles, Layer 2 loop avoidance, Layer 3 routing logic, fault isolation methodology, and protocol debugging under live production pressure.
]

#v(4pt)

#table(
  columns: (1fr, 1.4fr, 2.6fr),
  stroke: (x, y) => if y == 0 { (bottom: 1.5pt + rtech-navy) } else { 0.5pt + rtech-border },
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else if calc.even(row) { rgb("#FFFFFF") } else { rgb("#F8FAFC") },
  inset: (x: 7pt, y: 5.5pt),
  [*CCNA Domain*], [*Interview Weight*], [*High-Yield Evaluation Focus Areas*],
  [Domain 1: Network Fundamentals], [20%], [TCP 3-way handshake, OSI encapsulation, IPv4 subnetting in seconds, IPv6 EUI-64 & SLAAC.],
  [Domain 2: Network Access], [20%], [802.1Q trunking, Native VLAN hopping defense, Spanning Tree Root Bridge election, EtherChannel LACP.],
  [Domain 3: IP Connectivity], [25%], [Longest Prefix Match (LPM), Floating static route failover, OSPFv2 cost tuning, DR/BDR election.],
  [Domain 4: IP Services], [10%], [DHCP DORA 4-way flow, DHCP relay agent (ip helper-address), NAT/PAT overload port allocation.],
  [Domain 5: Security Fundamentals], [15%], [Standard vs Extended ACL placement, switchport port security violation modes, SSH v2 RSA hardening.],
  [Domain 6: Automation & Cloud], [10%], [Control plane vs Data plane, SDN controllers (DNA Center), REST APIs (GET/POST/PUT), JSON/YAML.]
)

'''

domains = [
    ("DOMAIN 1: NETWORK FUNDAMENTALS & OSI ARCHITECTURE (Q01 – Q20)", d1_questions),
    ("DOMAIN 2: SWITCHING, VLANS & TRUNKING (Q21 – Q40)", d2_questions),
    ("DOMAIN 3: IP CONNECTIVITY & OSPF ROUTING (Q41 – Q60)", d3_questions),
    ("DOMAIN 4: IP SERVICES (DHCP, NAT & NTP) (Q61 – Q80)", d4_questions),
    ("DOMAIN 5: NETWORK SECURITY & ACCESS CONTROL (Q81 – Q100)", d5_questions),
    ("DOMAIN 6: AUTOMATION, PROGRAMMABILITY & CLOUD (Q101 – Q120)", d6_questions)
]

output_typ = doc_header

for title, q_list in domains:
    output_typ += f"\n#pagebreak()\n\n= {title}\n\n"
    for num, q, a, fu in q_list:
        output_typ += f'#interview-compact(num: {num}, q: "{typ_esc(q)}", a: "{typ_esc(a)}", follow_up: "{typ_esc(fu)}")\n\n'

with open(SOURCE_FILE, "w", encoding="utf-8") as f:
    f.write(output_typ)

print(f"[OK] Wrote all 120 questions to {SOURCE_FILE}")

# Compile with Typst
typst_cmd = ["typst", "compile", "--root", CCNA_DIR, SOURCE_FILE, PDF_OUT]
print("Running:", " ".join(typst_cmd))
res = subprocess.run(typst_cmd, capture_output=True, text=True)
if res.returncode != 0:
    print("[ERROR] Typst compile failed:", res.stderr)
else:
    print("[SUCCESS] Compiled PDF:", PDF_OUT)
    shutil.copyfile(PDF_OUT, PUBLIC_PDF)
    print("[OK] Copied to public/downloads/!")

    # Verify page count and file size
    import fitz
    doc = fitz.open(PDF_OUT)
    print(f"[VERIFICATION] Total pages: {len(doc)}, File size: {os.path.getsize(PDF_OUT)} bytes")
