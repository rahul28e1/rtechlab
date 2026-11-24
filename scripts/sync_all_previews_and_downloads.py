# -*- coding: utf-8 -*-
import os
import shutil
import fitz

print("Extracting 5-page previews and syncing downloads...")

# 1. AI Essentials Gujarati
ai_gu_pdf = r"DIGITAL/AI_ESSENTIALS/01_CORE_MASTER_EDITION/AI-Essentials-Gujarati-Edition-1.pdf"
doc_ai = fitz.open(ai_gu_pdf)

os.makedirs("public/previews/ai", exist_ok=True)
os.makedirs("public/downloads", exist_ok=True)

# Generate preview images for AI Gujarati
for i in range(5):
    page = doc_ai[i]
    pix = page.get_pixmap(dpi=150)
    out_png = f"public/previews/ai/preview-gu-{i+1}.png"
    pix.save(out_png)

# Generate 5-page preview PDF for AI Gujarati
doc_ai_5p = fitz.open()
doc_ai_5p.insert_pdf(doc_ai, from_page=0, to_page=4)
doc_ai_5p.save("public/downloads/AI-Essentials-Gujarati-Edition-1-5Page-Preview.pdf")
doc_ai_5p.close()
doc_ai.close()

# Copy full master PDF for AI Gujarati
shutil.copy2(ai_gu_pdf, "public/downloads/AI-Essentials-Gujarati-Edition-1.pdf")
print("AI Essentials Gujarati synced successfully!")

# 2. Office 365 Gujarati
o365_gu_pdf = r"DIGITAL/OFFICE_365/01_CORE_MASTER_EDITION/Office-365-Gujarati-Edition-1.pdf"
doc_o365 = fitz.open(o365_gu_pdf)

os.makedirs("public/previews/office365", exist_ok=True)

# Generate preview images for O365 Gujarati
for i in range(5):
    page = doc_o365[i]
    pix = page.get_pixmap(dpi=150)
    out_png = f"public/previews/office365/preview-gu-{i+1}.png"
    pix.save(out_png)

# Generate 5-page preview PDF for O365 Gujarati
doc_o365_5p = fitz.open()
doc_o365_5p.insert_pdf(doc_o365, from_page=0, to_page=4)
doc_o365_5p.save("public/downloads/Office-365-Gujarati-Edition-1-5Page-Preview.pdf")
doc_o365_5p.close()
doc_o365.close()

# Copy full master PDF for O365 Gujarati
shutil.copy2(o365_gu_pdf, "public/downloads/Office-365-Gujarati-Edition-1.pdf")
print("Office 365 Gujarati synced successfully!")

# 3. Also sync to READY_FOR_GOOGLE_DRIVE
drive_o365 = r"READY_FOR_GOOGLE_DRIVE/RTechLab_Official_Digital_Handbooks/03_Microsoft_Office_365"
if os.path.exists(drive_o365):
    shutil.copy2(o365_gu_pdf, os.path.join(drive_o365, "Office-365-Gujarati-Edition-1.pdf"))
    shutil.copy2("public/downloads/Office-365-Gujarati-Edition-1-5Page-Preview.pdf", os.path.join(drive_o365, "Office-365-Gujarati-Edition-1-5Page-Preview.pdf"))
    print("READY_FOR_GOOGLE_DRIVE O365 synced!")

drive_ai = r"READY_FOR_GOOGLE_DRIVE/RTechLab_Official_Digital_Handbooks/04_Artificial_Intelligence_Essentials"
if os.path.exists(drive_ai):
    shutil.copy2(ai_gu_pdf, os.path.join(drive_ai, "AI-Essentials-Gujarati-Edition-1.pdf"))
    shutil.copy2("public/downloads/AI-Essentials-Gujarati-Edition-1-5Page-Preview.pdf", os.path.join(drive_ai, "AI-Essentials-Gujarati-Edition-1-5Page-Preview.pdf"))
    print("READY_FOR_GOOGLE_DRIVE AI synced!")

print("All previews and downloads synchronization complete!")
