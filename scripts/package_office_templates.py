# -*- coding: utf-8 -*-
import os
import zipfile
import shutil

print("Packaging Office 365 Practice Templates Kit & Updating Master Accelerator Bundle...")

excel_dir = r"c:\Users\Rahul\Videos\My projects\RtechLab\DIGITAL\OFFICE_365\02_PRACTICAL_EXCEL_TEMPLATES\files"
word_dir = r"c:\Users\Rahul\Videos\My projects\RtechLab\DIGITAL\OFFICE_365\02_PRACTICAL_EXCEL_TEMPLATES\word_templates"
master_pdf_dir = r"c:\Users\Rahul\Videos\My projects\RtechLab\DIGITAL\OFFICE_365\01_CORE_MASTER_EDITION"
pub_downloads = r"c:\Users\Rahul\Videos\My projects\RtechLab\public\downloads"
drive_dir = r"c:\Users\Rahul\Videos\My projects\RtechLab\READY_FOR_GOOGLE_DRIVE\RTechLab_Official_Digital_Handbooks\03_Microsoft_Office_365"

# 1. Standalone Practice Templates ZIP
practice_zip_path = os.path.join(pub_downloads, "Office-365-Practice-Templates-and-Lab-Files.zip")
with zipfile.ZipFile(practice_zip_path, "w", zipfile.ZIP_DEFLATED) as zf:
    # Word templates
    for f in os.listdir(word_dir):
        if f.endswith(".docx"):
            zf.write(os.path.join(word_dir, f), os.path.join("01_Word_Templates", f))
    # Excel templates
    for f in os.listdir(excel_dir):
        if f.endswith(".xlsx"):
            zf.write(os.path.join(excel_dir, f), os.path.join("02_Excel_Templates", f))
            
print("Created standalone practice zip:", practice_zip_path)

# 2. Master Career Accelerator Bundle ZIP
bundle_zip_path = os.path.join(pub_downloads, "Office-365-Career-Accelerator-Bundle.zip")
bundle_files = [
    os.path.join(master_pdf_dir, "Office-365-English-Edition-1.pdf"),
    os.path.join(master_pdf_dir, "Office-365-Hindi-Edition-1.pdf"),
    os.path.join(master_pdf_dir, "Office-365-Gujarati-Edition-1.pdf"),
    os.path.join(pub_downloads, "Office-365-MIS-Career-and-Salary-Blueprint-Edition-1.pdf"),
    os.path.join(pub_downloads, "Office-365-Practical-Excel-Templates-Workbook-Guide.pdf"),
    os.path.join(pub_downloads, "Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-English.pdf"),
    os.path.join(pub_downloads, "Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-Hindi.pdf"),
]

with zipfile.ZipFile(bundle_zip_path, "w", zipfile.ZIP_DEFLATED) as zf:
    for bf in bundle_files:
        if os.path.exists(bf):
            zf.write(bf, os.path.basename(bf))
            
    # Add practice templates folder inside the bundle
    for f in os.listdir(word_dir):
        if f.endswith(".docx"):
            zf.write(os.path.join(word_dir, f), os.path.join("08_PRACTICE_TEMPLATES_AND_LAB_FILES", "01_Word_Templates", f))
    for f in os.listdir(excel_dir):
        if f.endswith(".xlsx"):
            zf.write(os.path.join(excel_dir, f), os.path.join("08_PRACTICE_TEMPLATES_AND_LAB_FILES", "02_Excel_Templates", f))

print("Updated Career Accelerator Bundle ZIP:", bundle_zip_path)

# 3. Copy to READY_FOR_GOOGLE_DRIVE
if os.path.exists(drive_dir):
    shutil.copy2(practice_zip_path, os.path.join(drive_dir, "Office-365-Practice-Templates-and-Lab-Files.zip"))
    shutil.copy2(bundle_zip_path, os.path.join(drive_dir, "Office-365-Career-Accelerator-Bundle.zip"))
    
    # Also create a dedicated templates folder in Google Drive staging
    drive_tmpl_dir = os.path.join(drive_dir, "08_Practice_Templates_and_Lab_Files")
    os.makedirs(drive_tmpl_dir, exist_ok=True)
    
    for f in os.listdir(word_dir):
        if f.endswith(".docx"):
            shutil.copy2(os.path.join(word_dir, f), os.path.join(drive_tmpl_dir, f))
    for f in os.listdir(excel_dir):
        if f.endswith(".xlsx"):
            shutil.copy2(os.path.join(excel_dir, f), os.path.join(drive_tmpl_dir, f))
            
    print("READY_FOR_GOOGLE_DRIVE synced with all templates!")

print("All packaging completed successfully!")
