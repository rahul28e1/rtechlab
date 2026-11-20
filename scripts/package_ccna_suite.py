import os
import shutil
import zipfile
from pypdf import PdfReader, PdfWriter

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
CCNA_DIR = os.path.join(BASE_DIR, "DIGITAL", "CCNA 200-301")
DOWNLOADS_DIR = os.path.join(BASE_DIR, "public", "downloads")

eng_pdf = os.path.join(CCNA_DIR, "01_CORE_MASTER_EDITION", "CCNA-200-301-English-Edition-1.pdf")
hi_pdf = os.path.join(CCNA_DIR, "01_CORE_MASTER_EDITION", "CCNA-200-301-Hindi-Edition-1.pdf")
lab_pdf = os.path.join(CCNA_DIR, "02_PRACTICAL_LAB_WORKBOOK", "CCNA-200-301-Packet-Tracer-Lab-Workbook-Edition-1.pdf")
vault_pdf = os.path.join(CCNA_DIR, "03_INTERVIEW_QUESTION_VAULT", "CCNA-200-301-Interview-Question-Vault-Edition-1.pdf")
career_pdf = os.path.join(CCNA_DIR, "04_CAREER_AND_SALARY_BLUEPRINT", "CCNA-200-301-Network-Engineer-Career-Salary-Blueprint-Edition-1.pdf")

# 1. Extract 5-Page Previews
eng_prev = os.path.join(CCNA_DIR, "01_CORE_MASTER_EDITION", "CCNA-200-301-English-Edition-1-5Page-Preview.pdf")
hi_prev = os.path.join(CCNA_DIR, "01_CORE_MASTER_EDITION", "CCNA-200-301-Hindi-Edition-1-5Page-Preview.pdf")

def extract_preview(src, dst, pages=5):
    reader = PdfReader(src)
    writer = PdfWriter()
    for i in range(min(pages, len(reader.pages))):
        writer.add_page(reader.pages[i])
    with open(dst, "wb") as f:
        writer.write(f)
    print(f"[OK] Extracted {pages}-page preview: {dst}")

extract_preview(eng_pdf, eng_prev, 5)
extract_preview(hi_pdf, hi_prev, 5)

# 2. Package Complete Career Bundle ZIP
zip_out = os.path.join(CCNA_DIR, "RTechLab-CCNA-200-301-Complete-Career-Bundle-Edition-1.zip")
with zipfile.ZipFile(zip_out, "w", zipfile.ZIP_DEFLATED) as z:
    z.write(eng_pdf, arcname="01_CCNA-200-301-English-Master-Edition-1.pdf")
    z.write(hi_pdf, arcname="02_CCNA-200-301-Hindi-Master-Edition-1.pdf")
    z.write(lab_pdf, arcname="03_CCNA-200-301-Packet-Tracer-Lab-Workbook.pdf")
    z.write(vault_pdf, arcname="04_CCNA-200-301-Interview-Question-Vault.pdf")
    z.write(career_pdf, arcname="05_CCNA-200-301-Network-Engineer-Career-Salary-Blueprint.pdf")
print(f"[OK] Created complete bundle ZIP: {zip_out} ({os.path.getsize(zip_out)} bytes)")

# 3. Copy to public/downloads/
files_to_copy = [
    eng_pdf, hi_pdf, eng_prev, hi_prev,
    lab_pdf, vault_pdf, career_pdf, zip_out
]

for f in files_to_copy:
    dest = os.path.join(DOWNLOADS_DIR, os.path.basename(f))
    shutil.copy2(f, dest)
    print(f"[OK] Copied to public/downloads/: {os.path.basename(f)}")

print("\n[SUCCESS] All CCNA 200-301 assets packaged and deployed to public/downloads/!")
