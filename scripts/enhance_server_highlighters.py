# -*- coding: utf-8 -*-
import os
import re
import subprocess
import shutil
from pypdf import PdfReader

BASE_DIR = r"C:\Users\Rahul\Videos\My projects\RtechLab"
SRC_DIR = os.path.join(BASE_DIR, r"DIGITAL\WINDOWS_SERVER_2025\07_SOURCE_FILES")
CORE_DIR = os.path.join(BASE_DIR, r"DIGITAL\WINDOWS_SERVER_2025\01_CORE_MASTER_EDITION")
DRIVE_DIR = os.path.join(BASE_DIR, r"READY_FOR_GOOGLE_DRIVE\RTechLab_Official_Digital_Handbooks\06_Windows_Server_2025_Administration")
PUBLIC_DIR = os.path.join(BASE_DIR, r"public\downloads")

# Terms to highlight carefully without nested highlighting
TERMS = [
    # Yellow (Core components, Management Tools, Architectures)
    ("Active Directory Domain Services", "#hl-yellow[Active Directory Domain Services]"),
    ("Active Directory Administrative Center", "#hl-yellow[Active Directory Administrative Center]"),
    ("Active Directory Users and Computers", "#hl-yellow[Active Directory Users and Computers]"),
    ("Group Policy Management Console", "#hl-yellow[Group Policy Management Console]"),
    ("Storage Spaces Direct", "#hl-yellow[Storage Spaces Direct]"),
    ("Server Manager", "#hl-yellow[Server Manager]"),
    ("Server Core", "#hl-yellow[Server Core]"),
    ("Hotpatching", "#hl-yellow[Hotpatching]"),
    ("Windows Server Backup", "#hl-yellow[Windows Server Backup]"),
    ("Active Directory Recycle Bin", "#hl-yellow[Active Directory Recycle Bin]"),
    ("System State Backup", "#hl-yellow[System State Backup]"),
    ("Forward Lookup Zone", "#hl-yellow[Forward Lookup Zone]"),
    ("Reverse Lookup Zone", "#hl-yellow[Reverse Lookup Zone]"),
    ("Aging and Scavenging", "#hl-yellow[Aging and Scavenging]"),
    ("फ़ॉरवर्ड लुकअप ज़ोन", "#hl-yellow[फ़ॉरवर्ड लुकअप ज़ोन]"),
    ("रिवर्स लुकअप ज़ोन", "#hl-yellow[रिवर्स लुकअप ज़ोन]"),
    ("रूट हिंट्स", "#hl-yellow[रूट हिंट्स]"),
    ("सर्वर मैनेजर", "#hl-yellow[सर्वर मैनेजर]"),
    ("सर्वर कोर", "#hl-yellow[सर्वर कोर]"),
    ("हॉटपैचिंग", "#hl-yellow[हॉटपैचिंग]"),
    ("सिस्टम स्टेट बैकअप", "#hl-yellow[सिस्टम स्टेट बैकअप]"),
    ("એક્ટિવ ડિરેક્ટરી", "#hl-yellow[એક્ટિવ ડિરેક્ટરી]"),
    ("ડોમેન કંટ્રોલર", "#hl-yellow[ડોમેન કંટ્રોલર]"),
    ("સર્વર મેનેજર", "#hl-yellow[સર્વર મેનેજર]"),
    
    # Orange (Security alerts, Mandatory rules, Critical protocols)
    ("Bare Metal Recovery", "#hl-orange[Bare Metal Recovery]"),
    ("Directory Services Restore Mode", "#hl-orange[Directory Services Restore Mode]"),
    ("SMB over QUIC", "#hl-orange[SMB over QUIC]"),
    ("DSRM", "#hl-orange[DSRM]"),
    ("FSRM", "#hl-orange[FSRM]"),
    ("LSDOU", "#hl-orange[LSDOU]"),
    ("AGDLP", "#hl-orange[AGDLP]"),
    ("Kerberos", "#hl-orange[Kerberos]"),
    ("बेयर मेटल रिकवरी", "#hl-orange[बेयर मेटल रिकवरी]"),
    ("डिसैस्टर रिकवरी", "#hl-orange[डिसैस्टर रिकवरी]"),
    
    # Green (Standards, Ports, Performance & 2025 Flagship capabilities)
    ("32KB Database Page Size", "#hl-green[32KB Database Page Size]"),
    ("32KB Page Size", "#hl-green[32KB Page Size]"),
    ("Azure Arc", "#hl-green[Azure Arc]"),
    ("ReFS", "#hl-green[ReFS]"),
    ("Volume Shadow Copy Service", "#hl-green[Volume Shadow Copy Service]"),
    ("VSS", "#hl-green[VSS]"),
    ("DNSSEC", "#hl-green[DNSSEC]"),
    ("DoH (DNS over HTTPS)", "#hl-green[DoH (DNS over HTTPS)]"),
    ("UDP Port 53", "#hl-green[UDP Port 53]"),
    ("TCP Port 53", "#hl-green[TCP Port 53]"),
    ("Port 88", "#hl-green[Port 88]"),
    ("Port 389", "#hl-green[Port 389]"),
    ("Port 636", "#hl-green[Port 636]"),
    ("Port 445", "#hl-green[Port 445]"),
    ("Port 3389", "#hl-green[Port 3389]"),
    ("Port 80", "#hl-green[Port 80]"),
    ("Port 443", "#hl-green[Port 443]"),
    ("अज़ूर आर्क", "#hl-green[अज़ूर आर्क]"),
]

def apply_highlighters(text):
    for term, replacement in TERMS:
        # Regex to match term NOT inside brackets like #hl-xxx[...] or [Term] or #image(...)
        # We replace at most 3 occurrences per chapter to avoid visual clutter and maintain pristine aesthetics
        count = 0
        pattern = re.compile(r'(?<!\[)(?<!#hl-yellow\[)(?<!#hl-orange\[)(?<!#hl-green\[)(?<!#ul-yellow\[)(?<!#ul-orange\[)(?<!#ul-green\[)(?<!#mark-yellow\[)(?<!#mark-orange\[)(?<!#mark-green\[)' + re.escape(term) + r'(?!\])')
        
        def sub_fn(m):
            nonlocal count
            if count < 3:
                count += 1
                return replacement
            return m.group(0)
            
        text = pattern.sub(sub_fn, text)
    return text

def process_language(lang):
    folder = f"chapters_{lang}"
    folder_path = os.path.join(SRC_DIR, folder)
    header_file = os.path.join(folder_path, "header.typ")
    
    if not os.path.exists(header_file):
        print(f"[{lang.upper()}] Error: {header_file} missing")
        return False
        
    parts = []
    with open(header_file, "r", encoding="utf-8") as f:
        parts.append(f.read().strip())
        
    for i in range(1, 15):
        ch_file = os.path.join(folder_path, f"chapter_{i:02d}.typ")
        if not os.path.exists(ch_file):
            print(f"[{lang.upper()}] Error: Missing {ch_file}")
            return False
            
        with open(ch_file, "r", encoding="utf-8") as f:
            content = f.read()
            
        enhanced = apply_highlighters(content)
        
        # Save enhanced chapter back
        with open(ch_file, "w", encoding="utf-8") as f:
            f.write(enhanced)
            
        parts.append(enhanced.strip())
        
    # Assemble master file
    master_file = os.path.join(SRC_DIR, f"master_book_{lang}.typ")
    # Chapters already end with #pagebreak(), so join directly with blank line
    combined = "\n\n".join(parts) + "\n"
    with open(master_file, "w", encoding="utf-8") as f:
        f.write(combined)
        
    print(f"[{lang.upper()}] Assembled {master_file} ({len(combined.splitlines())} lines).")
    
    # Compile with Typst
    lang_name = "English" if lang == "en" else ("Hindi" if lang == "hi" else "Gujarati")
    out_pdf_name = f"Windows-Server-2025-{lang_name}-Master-Guide.pdf"
    out_pdf = os.path.join(CORE_DIR, out_pdf_name)
    
    print(f"[{lang.upper()}] Compiling {out_pdf_name} with Typst...")
    proc = subprocess.run(["typst", "compile", "--root", BASE_DIR, master_file, out_pdf], capture_output=True, text=True)
    if proc.returncode != 0:
        print(f"[{lang.upper()}] Compilation error: {proc.stderr[:400]}")
        return False
        
    reader = PdfReader(out_pdf)
    num_pages = len(reader.pages)
    print(f"[{lang.upper()}] Compilation Success! Total Pages: {num_pages}")
    
    if num_pages == 60:
        print(f"[{lang.upper()}] PERFECT 60 PAGES CONFIRMED.")
    else:
        print(f"[{lang.upper()}] WARNING: Page count is {num_pages} (Target: 60)")
        
    # Copy to Google Drive directory and public/downloads
    shutil.copy2(out_pdf, os.path.join(DRIVE_DIR, out_pdf_name))
    shutil.copy2(out_pdf, os.path.join(PUBLIC_DIR, out_pdf_name))
    print(f"[{lang.upper()}] Synced to Google Drive ready folder and public/downloads.")
    return True

if __name__ == "__main__":
    for l in ["en", "hi", "gu"]:
        print(f"\n--- Processing Language: {l.upper()} ---")
        ok = process_language(l)
        if not ok:
            print(f"Failed processing {l}")
            break
