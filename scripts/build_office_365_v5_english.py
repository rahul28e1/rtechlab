import os, shutil, subprocess, fitz

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
ASSETS_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\07_SOURCE_FILES\02_BRAND_ASSETS")
OUTPUT_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\01_CORE_MASTER_EDITION")
DOWNLOADS_DIR = os.path.join(BASE_DIR, "public", "downloads")
os.makedirs(OUTPUT_DIR, exist_ok=True)
os.makedirs(DOWNLOADS_DIR, exist_ok=True)

TYP_PATH = os.path.join(ASSETS_DIR, "office_365_v5_english.typ")
OUT_PDF  = os.path.join(OUTPUT_DIR, "Office-365-Quick-Desk-Reference-Cheat-Sheet-English.pdf")

print("Compiling English V5 PDF...")
result = subprocess.run(
    ["typst", "compile", TYP_PATH, "--root", ASSETS_DIR, OUT_PDF],
    capture_output=True, text=True, cwd=ASSETS_DIR
)
if result.returncode != 0:
    print("COMPILE ERROR:\n", result.stderr[:3000])
    raise SystemExit(1)

doc   = fitz.open(OUT_PDF)
pages = len(doc)
doc.close()
print(f"=== ENGLISH V5: {pages} pages ===")
shutil.copy(OUT_PDF, os.path.join(DOWNLOADS_DIR, "Office-365-Quick-Desk-Reference-Cheat-Sheet-English.pdf"))
print("Done — English V5 compiled and deployed to public/downloads/")
