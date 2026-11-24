import os
import shutil
import zipfile

def run_update():
    src_dir = "READY_FOR_GOOGLE_DRIVE/RTechLab_Official_Digital_Handbooks/06_Windows_Server_2025_Administration"
    os.makedirs(src_dir, exist_ok=True)
    os.makedirs("public/downloads", exist_ok=True)

    # 1. Source PDF files
    pdfs = {
        "01_Windows-Server-2025-English-Master-Guide.pdf": os.path.join(src_dir, "Windows-Server-2025-English-Master-Guide.pdf"),
        "02_Windows-Server-2025-Hindi-Master-Guide.pdf": os.path.join(src_dir, "Windows-Server-2025-Hindi-Master-Guide.pdf"),
        "03_Windows-Server-2025-Gujarati-Master-Guide.pdf": os.path.join(src_dir, "Windows-Server-2025-Gujarati-Master-Guide.pdf"),
        "04_Windows-Server-2025-Practice-Set-and-Lab-Workbook.pdf": os.path.join(src_dir, "Windows-Server-2025-Practice-Set-and-Lab-Workbook.pdf"),
        "05_Windows-Server-2025-Top-50-MNC-Interview-Vault.pdf": os.path.join(src_dir, "Windows-Server-2025-Top-50-MNC-Interview-Vault.pdf"),
        "06_Windows-Server-2025-System-Admin-Career-and-Salary-Blueprint.pdf": os.path.join(src_dir, "Windows-Server-2025-System-Admin-Career-and-Salary-Blueprint.pdf")
    }

    # Verify all PDFs exist
    for name, path in pdfs.items():
        if not os.path.exists(path):
            print(f"Warning: {path} not found!")
        else:
            print(f"Verified: {name} ({os.path.getsize(path)/(1024*1024):.2f} MB)")

    # 2. Create Readme file
    readme_path = os.path.join(src_dir, "README-WINDOWS-SERVER-2025-CAREER-ACCELERATOR-SUITE.txt")
    readme_content = """================================================================================
RTechLab Systems & Infrastructure Academy | Official Digital Publication
Windows Server 2025 & Active Directory Administration Complete Career Suite
Author: Rahul Patel (Chief Technology Architect & Founder, RTechLab)
Support Helpline (WhatsApp): +91 76468 92094 | Email: rahul.28e1@gmail.com
================================================================================

Congratulations Future Systems Administrator & Enterprise Infrastructure Leader!
You possess the complete, research-verified, battle-tested Microsoft Windows Server 2025
Career Accelerator Master Suite.

INCLUDED DELIVERABLES IN THIS CAREER BUNDLE:
--------------------------------------------------------------------------------
1. 01_Windows-Server-2025-English-Master-Guide.pdf (60 Pages)
   - Complete 14-Chapter Enterprise Handbook in English.
   - Core Architecture, Step-by-Step PowerShell, MCQs, and Interview Vault.

2. 02_Windows-Server-2025-Hindi-Master-Guide.pdf (60 Pages)
   - Complete 14-Chapter Hindi/Hinglish Master Guide.
   - Dual-language terminology with 100% density on every page.

3. 03_Windows-Server-2025-Gujarati-Master-Guide.pdf (60 Pages)
   - Complete 14-Chapter Gujarati Master Guide.
   - Full technical explanations in Gujarati with English terminology.

4. 04_Windows-Server-2025-Practice-Set-and-Lab-Workbook.pdf (7 Pages)
   - 12 Production-Grade Hands-On Labs with exact PowerShell cmdlets.
   - Automated Root DC setup, Tiered OU hierarchy, GPO lockdown, FSRM quotas, IIS SSL.

5. 05_Windows-Server-2025-Top-50-MNC-Interview-Vault.pdf (10 Pages)
   - 50 High-Yield Technical Interview Questions & Real-World Field Answers.
   - Tested at TCS, Wipro, Infosys, Cognizant, HCL, and Accenture.

6. 06_Windows-Server-2025-System-Admin-Career-and-Salary-Blueprint.pdf (3 Pages)
   - 2027 Compensation Matrix across Tier 1, 2, and 3 Indian Tech Hubs.
   - 4-Tier Career Ladder (L1 to Hybrid Architect, ₹3.5L to ₹38+ LPA).
   - Microsoft Certification Paths (AZ-800, AZ-801, SC-300).
   - High-Income Freelance & SME AMC Rate Card (₹50k-₹1.5L/month).
   - ATS Resume Keywords & High-Impact Action Bullets.

STUDENT SUPPORT & MENTORSHIP:
For resume review, mock technical interviews, or lab troubleshooting, contact:
WhatsApp Helpline: +91 76468 92094 | Email: rahul.28e1@gmail.com
Website: https://rtechlab.in
================================================================================
"""
    with open(readme_path, "w", encoding="utf-8") as f:
        f.write(readme_content)

    # 3. Create the Complete Career Accelerator Bundle ZIP
    bundle_zip = os.path.join(src_dir, "Windows-Server-2025-Career-Accelerator-Bundle.zip")
    with zipfile.ZipFile(bundle_zip, "w", compression=zipfile.ZIP_DEFLATED) as z:
        for archive_name, path in pdfs.items():
            if os.path.exists(path):
                z.write(path, archive_name)
        z.write(readme_path, "README-WINDOWS-SERVER-2025-CAREER-ACCELERATOR-SUITE.txt")

    print(f"Created Bundle ZIP: {bundle_zip} ({os.path.getsize(bundle_zip)/(1024*1024):.2f} MB)")

    # 4. Copy to public/downloads/
    for name, path in pdfs.items():
        base_name = os.path.basename(path)
        dest = os.path.join("public/downloads", base_name)
        shutil.copy2(path, dest)
        print(f"Copied to public/downloads/{base_name}")

    shutil.copy2(bundle_zip, os.path.join("public/downloads", "Windows-Server-2025-Career-Accelerator-Bundle.zip"))
    print("Copied Bundle ZIP to public/downloads/")

if __name__ == "__main__":
    run_update()
