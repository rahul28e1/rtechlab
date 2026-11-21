import os
import zipfile
import fitz

def package_bundle():
    preview_dir = 'public/previews/office365'
    downloads_dir = 'public/downloads'
    os.makedirs(preview_dir, exist_ok=True)
    os.makedirs(downloads_dir, exist_ok=True)

    en_master_path = 'DIGITAL/OFFICE_365/01_CORE_MASTER_EDITION/Office-365-English-Edition-1.pdf'
    hi_master_path = 'DIGITAL/OFFICE_365/01_CORE_MASTER_EDITION/Office-365-Hindi-Edition-1.pdf'
    en_vault_path = 'DIGITAL/OFFICE_365/03_INTERVIEW_AND_SHORTCUT_VAULT/Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-English.pdf'
    hi_vault_path = 'DIGITAL/OFFICE_365/03_INTERVIEW_AND_SHORTCUT_VAULT/Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-Hindi.pdf'
    tmpl_guide_path = 'DIGITAL/OFFICE_365/02_PRACTICAL_EXCEL_TEMPLATES/Office-365-Practical-Excel-Templates-Workbook-Guide.pdf'
    career_blueprint_path = 'DIGITAL/OFFICE_365/04_CAREER_AND_SALARY_BLUEPRINT/Office-365-MIS-Career-and-Salary-Blueprint-Edition-1.pdf'

    # 1. Generate 5-Page Previews with Real UI Screenshots for Web Gallery
    en_doc = fitz.open(en_master_path)
    en_preview = fitz.open()
    for i in range(min(5, len(en_doc))):
        en_preview.insert_pdf(en_doc, from_page=i, to_page=i)
        # Render high-res PNG for web gallery
        page = en_doc[i]
        pix = page.get_pixmap(dpi=150)
        pix.save(os.path.join(preview_dir, f"preview-{i+1}.png"))
    en_preview_path = os.path.join(preview_dir, "Office-365-English-Edition-1-5Page-Preview.pdf")
    en_preview.save(en_preview_path)
    print(f"✓ English 5-Page preview ({len(en_preview)} pgs) and PNGs generated in {preview_dir}")

    hi_doc = fitz.open(hi_master_path)
    hi_preview = fitz.open()
    for i in range(min(5, len(hi_doc))):
        hi_preview.insert_pdf(hi_doc, from_page=i, to_page=i)
        # Render high-res PNG for web gallery
        page = hi_doc[i]
        pix = page.get_pixmap(dpi=150)
        pix.save(os.path.join(preview_dir, f"preview-hi-{i+1}.png"))
    hi_preview_path = os.path.join(preview_dir, "Office-365-Hindi-Edition-1-5Page-Preview.pdf")
    hi_preview.save(hi_preview_path)
    print(f"✓ Hindi 5-Page preview ({len(hi_preview)} pgs) and PNGs generated in {preview_dir}")

    # Copy all standalone deliverables to public/downloads/
    all_deliverables = [
        en_master_path,
        hi_master_path,
        en_vault_path,
        hi_vault_path,
        tmpl_guide_path,
        career_blueprint_path,
        en_preview_path,
        hi_preview_path
    ]

    for src in all_deliverables:
        dst = os.path.join(downloads_dir, os.path.basename(src))
        with open(src, 'rb') as f_in, open(dst, 'wb') as f_out:
            f_out.write(f_in.read())
        print(f"✓ Copied {os.path.basename(src)} to {downloads_dir} ({round(os.path.getsize(dst)/1024, 1)} KB)")

    # 2. Create README for the bundle
    readme_content = """================================================================================
RTECHLAB OFFICIAL MICROSOFT OFFICE 365 CAREER ACCELERATOR BUNDLE (EDITION 1)
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
Official Platform: https://rtechlab.in | Email: support@rtechlab.in
================================================================================

Congratulations on securing the RTechLab Microsoft Office 365 Career Accelerator
Bundle (Commercial Release 2027). This archive includes your complete master toolkit:

1. CORE 113-PAGE MASTER PUBLICATIONS:
   - Office-365-English-Edition-1.pdf (Complete 113-Page English Master Edition)
   - Office-365-Hindi-Edition-1.pdf   (Complete 113-Page Hindi Master Edition)
   Covers Word 365 (Ch 01-10), Excel 365 (Ch 11-22), PowerPoint 365 (Ch 23-28),
   Cloud Collaboration (Ch 29), and Copilot AI 2027 Integration (Ch 30) with real UI screenshots.

2. STANDALONE CHEAT SHEETS & INTERVIEW VAULTS:
   - Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-English.pdf (10 Pages)
   - Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-Hindi.pdf   (10 Pages)
   Desktop printable cheat sheets and verified answers to top 50 corporate MIS questions.

3. 12 ENTERPRISE PRACTICAL EXCEL TEMPLATES WORKBOOK GUIDE:
   - Office-365-Practical-Excel-Templates-Workbook-Guide.pdf (16 Pages)
   Complete architectural schematics, formula specimens, step-by-step construction,
   and edge-case mitigation for 12 enterprise Excel workbooks (Loan EMI Amortization,
   Dynamic Inventory, Payroll Payslips, Sales Commission Matrix, DCF Valuation,
   Gratuity Calculator, Executive KPI Dashboard, Power Query ETL, GST Invoice,
   Gantt Timeline, Six Sigma SPC, and Copilot Python Model).

4. 2027 CAREER & SALARY BLUEPRINT:
   - Office-365-MIS-Career-and-Salary-Blueprint-Edition-1.pdf (12 Pages)
   Corporate hiring salary benchmarks (₹3.5 LPA to ₹28 LPA), 2027 ATS Resume Framework,
   and senior executive career progression roadmaps.

SUPPORT & DIRECT MENTORSHIP:
For technical questions or quarterly update access, contact support@rtechlab.in
or join Rahul Sir's direct community at https://rtechlab.in

© 2027 RTechLab. All rights reserved. Technology Made Practical · Learn. Practice. Innovate.
"""
    readme_path = os.path.join(downloads_dir, "README-CAREER-ACCELERATOR-BUNDLE.txt")
    with open(readme_path, "w", encoding="utf-8") as f:
        f.write(readme_content)

    # 3. Package ZIP Bundle
    zip_path = os.path.join(downloads_dir, "Office-365-Career-Accelerator-Bundle.zip")
    print(f"Creating ZIP bundle at {zip_path}...")
    with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        zipf.write(en_master_path, arcname="01_CORE_MASTER_EDITIONS/Office-365-English-Edition-1.pdf")
        zipf.write(hi_master_path, arcname="01_CORE_MASTER_EDITIONS/Office-365-Hindi-Edition-1.pdf")
        zipf.write(en_vault_path, arcname="02_INTERVIEW_AND_SHORTCUT_VAULT/Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-English.pdf")
        zipf.write(hi_vault_path, arcname="02_INTERVIEW_AND_SHORTCUT_VAULT/Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-Hindi.pdf")
        zipf.write(tmpl_guide_path, arcname="03_PRACTICAL_EXCEL_TEMPLATES/Office-365-Practical-Excel-Templates-Workbook-Guide.pdf")
        zipf.write(career_blueprint_path, arcname="04_CAREER_AND_SALARY_BLUEPRINT/Office-365-MIS-Career-and-Salary-Blueprint-Edition-1.pdf")
        zipf.write(readme_path, arcname="README-CAREER-ACCELERATOR-BUNDLE.txt")

    print(f"✓ ZIP bundle created successfully: {round(os.path.getsize(zip_path)/1024/1024, 2)} MB")

if __name__ == "__main__":
    package_bundle()
