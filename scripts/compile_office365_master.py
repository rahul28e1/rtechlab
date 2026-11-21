import os
import subprocess
import fitz

def build_master():
    eng_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/English'
    hi_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/Hindi'
    out_dir = 'DIGITAL/OFFICE_365/01_CORE_MASTER_EDITION'
    os.makedirs(out_dir, exist_ok=True)

    # =========================================================================
    # ENGLISH MASTER .TYP
    # =========================================================================
    en_includes = []
    for ch in range(1, 33):
        en_includes.append(f'#pagebreak()\n#include "chapter-{ch:02d}.typ"')
    
    en_master_src = f"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab Microsoft Office 365 Enterprise Master Guide (Edition 1)",
  author: "Rahul Patel"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "Microsoft Office 365 Enterprise Master Guide",
  edition: "2027 Master Edition · Edition 1 Commercial Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-O365-ED1"
)

// PAGE 2: BLUEPRINT
#include "../07_PUBLISHING_ENGINE/blueprint-v5.typ"

// CHAPTERS 01 TO 32
{chr(10).join(en_includes)}
"""

    en_master_path = os.path.join(eng_dir, "Office-365-English-Edition-1.typ")
    with open(en_master_path, "w", encoding="utf-8") as f:
        f.write(en_master_src)

    # =========================================================================
    # HINDI MASTER .TYP
    # =========================================================================
    hi_includes = []
    for ch in range(1, 33):
        hi_includes.append(f'#pagebreak()\n#include "chapter-{ch:02d}.typ"')

    hi_master_src = f"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-v5-hi

#set document(
  title: "आरटेक लैब माइक्रोसॉफ्ट ऑफिस 365 एंटरप्राइज मास्टर गाइड (संस्करण 1)",
  author: "राहुल पटेल"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5-hi()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "माइक्रोसॉफ्ट ऑफिस 365 एंटरप्राइज मास्टर गाइड",
  edition: "2027 मास्टर संस्करण · संस्करण 1 कमर्शियल रिलीज",
  author: "राहुल पटेल",
  subject-code: "RTL-2027-O365-ED1"
)

// PAGE 2: BLUEPRINT
#include "../07_PUBLISHING_ENGINE/blueprint-v5-hi.typ"

// CHAPTERS 01 TO 32
{chr(10).join(hi_includes)}
"""

    hi_master_path = os.path.join(hi_dir, "Office-365-Hindi-Edition-1.typ")
    with open(hi_master_path, "w", encoding="utf-8") as f:
        f.write(hi_master_src)

    print("Master source files generated.")

    # =========================================================================
    # COMPILE ENGLISH MASTER PDF
    # =========================================================================
    en_pdf_out = os.path.join(out_dir, "Office-365-English-Edition-1.pdf")
    print(f"Compiling English Master Edition to {en_pdf_out}...")
    res_en = subprocess.run(['typst', 'compile', '--root', '.', en_master_path, en_pdf_out], capture_output=True, text=True)
    if res_en.returncode != 0:
        print("English Master compilation ERROR:", res_en.stderr)
        return False
    else:
        doc_en = fitz.open(en_pdf_out)
        print(f"✓ English Master compiled successfully: {len(doc_en)} Pages! File size: {os.path.getsize(en_pdf_out)/1024/1024:.2f} MB")

    # =========================================================================
    # COMPILE HINDI MASTER PDF
    # =========================================================================
    hi_pdf_out = os.path.join(out_dir, "Office-365-Hindi-Edition-1.pdf")
    print(f"Compiling Hindi Master Edition to {hi_pdf_out}...")
    res_hi = subprocess.run(['typst', 'compile', '--root', '.', hi_master_path, hi_pdf_out], capture_output=True, text=True)
    if res_hi.returncode != 0:
        print("Hindi Master compilation ERROR:", res_hi.stderr)
        return False
    else:
        doc_hi = fitz.open(hi_pdf_out)
        print(f"✓ Hindi Master compiled successfully: {len(doc_hi)} Pages! File size: {os.path.getsize(hi_pdf_out)/1024/1024:.2f} MB")

    return True

if __name__ == "__main__":
    build_master()
