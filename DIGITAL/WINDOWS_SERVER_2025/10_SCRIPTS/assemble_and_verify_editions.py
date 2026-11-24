import os, sys, re, subprocess, shutil, zipfile
from pypdf import PdfReader

BASE_DIR = r"C:\Users\Rahul\Videos\My projects\RtechLab"
SRC_DIR = os.path.join(BASE_DIR, r"DIGITAL\WINDOWS_SERVER_2025\07_SOURCE_FILES")
CORE_DIR = os.path.join(BASE_DIR, r"DIGITAL\WINDOWS_SERVER_2025\01_CORE_MASTER_EDITION")
DRIVE_DIR = os.path.join(BASE_DIR, r"READY_FOR_GOOGLE_DRIVE\RTechLab_Official_Digital_Handbooks\06_Windows_Server_2025_Administration")
PUBLIC_DIR = os.path.join(BASE_DIR, r"public\downloads")
GDRIVE_FOLDER_ID = "1hIDp2ibd08JcAWdaZLZFm383gFVShjF0"

def verify_and_assemble(lang):
    folder = "chapters_en" if lang == "en" else "chapters_gu"
    folder_path = os.path.join(SRC_DIR, folder)
    header_file = os.path.join(folder_path, "header.typ")
    
    if not os.path.exists(header_file):
        print(f"[{lang.upper()}] Error: {header_file} missing")
        return False
        
    parts = []
    with open(header_file, "r", encoding="utf-8") as f:
        parts.append(f.read().strip())
        
    missing = []
    hindi_errors = []
    
    for i in range(1, 15):
        ch_file = os.path.join(folder_path, f"chapter_{i:02d}.typ")
        if not os.path.exists(ch_file):
            missing.append(f"chapter_{i:02d}.typ")
            continue
        with open(ch_file, "r", encoding="utf-8") as f:
            content = f.read()
            hindi_matches = re.findall(r'[\u0900-\u097F]', content)
            if hindi_matches:
                hindi_errors.append((i, len(hindi_matches)))
            parts.append(content.strip())
            
    if missing:
        print(f"[{lang.upper()}] Still waiting for chapters: {missing}")
        return False
        
    if hindi_errors:
        print(f"[{lang.upper()}] Warning: Found Hindi characters in chapters: {hindi_errors}")
        return False
        
    # Assemble master typ file
    master_file = os.path.join(SRC_DIR, f"master_book_{lang}.typ")
    combined_content = "\n\n#pagebreak()\n\n".join(parts) + "\n"
    
    with open(master_file, "w", encoding="utf-8") as f:
        f.write(combined_content)
        
    print(f"[{lang.upper()}] Successfully assembled {master_file} ({len(combined_content.splitlines())} lines).")
    
    # Compile
    out_pdf_name = f"Windows-Server-2025-{'English' if lang == 'en' else 'Gujarati'}-Master-Guide.pdf"
    out_pdf = os.path.join(CORE_DIR, out_pdf_name)
    
    print(f"[{lang.upper()}] Compiling with Typst to {out_pdf}...")
    proc = subprocess.run(["typst", "compile", "--root", BASE_DIR, master_file, out_pdf], capture_output=True, text=True)
    if proc.returncode != 0:
        print(f"[{lang.upper()}] Compilation failed: {proc.stderr}")
        return False
        
    # Verify page count
    reader = PdfReader(out_pdf)
    num_pages = len(reader.pages)
    print(f"[{lang.upper()}] Compiled successfully! Page count: {num_pages} pages.")
    
    if num_pages != 60:
        print(f"[{lang.upper()}] ALERT: Target is 60 pages, got {num_pages} pages!")
    
    # Copy to Google Drive ready folder and public/downloads
    shutil.copy2(out_pdf, os.path.join(DRIVE_DIR, out_pdf_name))
    shutil.copy2(out_pdf, os.path.join(PUBLIC_DIR, out_pdf_name))
    print(f"[{lang.upper()}] Copied to DRIVE_DIR and PUBLIC_DIR.")
    return True

if __name__ == "__main__":
    print("Checking assemblies...")
    en_ok = verify_and_assemble("en")
    gu_ok = verify_and_assemble("gu")
    print(f"Status - English: {en_ok}, Gujarati: {gu_ok}")
