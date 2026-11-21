import os
import subprocess
import fitz

def build_standalone_vault():
    eng_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/English'
    hi_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/Hindi'
    vault_dir = 'DIGITAL/OFFICE_365/03_INTERVIEW_AND_SHORTCUT_VAULT'
    os.makedirs(vault_dir, exist_ok=True)

    en_src = """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "Top 100 Office 365 Shortcuts & 50 MIS Interview Vault",
  author: "Rahul Patel"
)

// COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5(
  title: "TOP 100 SHORTCUTS & 50 MIS INTERVIEW VAULT",
  subtitle: "Corporate Cheat Sheet · Word, Excel, PowerPoint & Cloud Ecosystem · Career Accelerator Edition",
  edition: "2027 STANDALONE SPECIAL RELEASE"
)

#show: rtech-book.with(
  title: "Top 100 Shortcuts & 50 MIS Interview Vault",
  edition: "2027 Master Edition · Commercial Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-O365-VAULT"
)

#include "chapter-31.typ"
#pagebreak()
#include "chapter-32.typ"
"""

    hi_src = """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-v5-hi

#set document(
  title: "शीर्ष 100 ऑफिस 365 शॉर्टकट्स एवं 50 MIS इंटरव्यू वॉल्ट",
  author: "राहुल पटेल"
)

// COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5-hi(
  title: "शीर्ष 100 शॉर्टकट्स एवं 50 MIS इंटरव्यू वॉल्ट",
  subtitle: "कॉर्पोरेट चीट शीट · वर्ड, एक्सेल, पावरपॉइंट एवं क्लाउड इकोसिस्टम · करियर एक्सेलरेटर संस्करण",
  edition: "2027 विशेष स्टैंडअलोन संस्करण"
)

#show: rtech-book.with(
  title: "शीर्ष 100 शॉर्टकट्स एवं 50 MIS इंटरव्यू वॉल्ट",
  edition: "2027 मास्टर संस्करण · कमर्शियल रिलीज",
  author: "राहुल पटेल",
  subject-code: "RTL-2027-O365-VAULT"
)

#include "chapter-31.typ"
#pagebreak()
#include "chapter-32.typ"
"""

    en_typ_path = os.path.join(eng_dir, "standalone-vault.typ")
    hi_typ_path = os.path.join(hi_dir, "standalone-vault-hi.typ")
    with open(en_typ_path, "w", encoding="utf-8") as f:
        f.write(en_src)
    with open(hi_typ_path, "w", encoding="utf-8") as f:
        f.write(hi_src)

    en_out = os.path.join(vault_dir, "Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-English.pdf")
    hi_out = os.path.join(vault_dir, "Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-Hindi.pdf")

    subprocess.run(['typst', 'compile', '--root', '.', en_typ_path, en_out], check=True)
    subprocess.run(['typst', 'compile', '--root', '.', hi_typ_path, hi_out], check=True)

    doc_en = fitz.open(en_out)
    doc_hi = fitz.open(hi_out)
    print(f"✓ Standalone Vault EN: {len(doc_en)} pages ({en_out})")
    print(f"✓ Standalone Vault HI: {len(doc_hi)} pages ({hi_out})")

if __name__ == "__main__":
    build_standalone_vault()
