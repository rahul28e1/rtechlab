import os
import zipfile
import shutil
import fitz

def package_ai():
    print("--- PACKAGING AI ESSENTIALS DOWNLOADS & PREVIEWS ---")
    
    # Paths
    en_pdf_src = "DIGITAL/AI_ESSENTIALS/01_CORE_MASTER_EDITION/AI-Essentials-English-Edition-1.pdf"
    hi_pdf_src = "DIGITAL/AI_ESSENTIALS/01_CORE_MASTER_EDITION/AI-Essentials-Hindi-Edition-1.pdf"
    blueprint_src = "DIGITAL/AI_ESSENTIALS/02_CAREER_AND_SALARY_ROADMAP/AI-Career-and-Salary-Blueprint-Edition-1.pdf"
    vault_src = "DIGITAL/AI_ESSENTIALS/03_INTERVIEW_AND_PROMPT_VAULT/AI-Top-50-Interview-Questions-and-100-Enterprise-Prompts-Vault.pdf"
    
    downloads_dir = "public/downloads"
    previews_dir = "public/previews/ai"
    
    os.makedirs(downloads_dir, exist_ok=True)
    os.makedirs(previews_dir, exist_ok=True)
    
    # 1. Copy full PDFs to public/downloads
    shutil.copy2(en_pdf_src, os.path.join(downloads_dir, "AI-Essentials-English-Edition-1.pdf"))
    shutil.copy2(hi_pdf_src, os.path.join(downloads_dir, "AI-Essentials-Hindi-Edition-1.pdf"))
    shutil.copy2(blueprint_src, os.path.join(downloads_dir, "AI-Career-and-Salary-Blueprint-Edition-1.pdf"))
    shutil.copy2(vault_src, os.path.join(downloads_dir, "AI-Top-50-Interview-Questions-and-100-Enterprise-Prompts-Vault.pdf"))
    print("Copied full master PDFs to public/downloads/")
    
    # 2. Extract 5-Page Previews (Pages 1 to 5)
    def extract_preview(src, dest):
        src_doc = fitz.open(src)
        dest_doc = fitz.open()
        dest_doc.insert_pdf(src_doc, from_page=0, to_page=min(4, len(src_doc)-1))
        dest_doc.save(dest)
        dest_doc.close()
        src_doc.close()
        print(f"Generated 5-page preview: {dest}")

    preview_en = os.path.join(downloads_dir, "AI-Essentials-English-Edition-1-5Page-Preview.pdf")
    preview_hi = os.path.join(downloads_dir, "AI-Essentials-Hindi-Edition-1-5Page-Preview.pdf")
    extract_preview(en_pdf_src, preview_en)
    extract_preview(hi_pdf_src, preview_hi)
    shutil.copy2(preview_en, os.path.join(previews_dir, "AI-Essentials-English-Edition-1-5Page-Preview.pdf"))
    shutil.copy2(preview_hi, os.path.join(previews_dir, "AI-Essentials-Hindi-Edition-1-5Page-Preview.pdf"))

    # 3. Render High-Resolution PNG Previews (150 DPI)
    # Selected English pages: 1 (Cover), 2 (Blueprint table), 9 (Concentric hierarchy), 17 (Transformers), 31 (Salary Ladder)
    en_doc = fitz.open(en_pdf_src)
    hi_doc = fitz.open(hi_pdf_src)
    zoom = 150 / 72.0
    mat = fitz.Matrix(zoom, zoom)
    
    pages_to_render = [0, 1, 8, 16, 30] # 0-indexed for 1, 2, 9, 17, 31
    for idx, p_num in enumerate(pages_to_render):
        # English
        p_en = en_doc[p_num]
        pix_en = p_en.get_pixmap(matrix=mat, alpha=False)
        out_en = os.path.join(previews_dir, f"preview-{idx+1}.png")
        pix_en.save(out_en)
        
        # Hindi
        p_hi = hi_doc[p_num]
        pix_hi = p_hi.get_pixmap(matrix=mat, alpha=False)
        out_hi = os.path.join(previews_dir, f"preview-hi-{idx+1}.png")
        pix_hi.save(out_hi)
        print(f"Rendered previews for page {p_num+1} -> {out_en} & {out_hi}")
        
    en_doc.close()
    hi_doc.close()
    
    # 4. Create README-AI-CAREER-ACCELERATOR-BUNDLE.txt
    readme_content = """================================================================================
RTECHLAB OFFICIAL ARTIFICIAL INTELLIGENCE CAREER ACCELERATOR BUNDLE (EDITION 1)
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
Official Platform: https://rtechlab.vercel.app | Email: rahul.28e1@gmail.com
================================================================================

Congratulations on securing the RTechLab Artificial Intelligence Career Accelerator
Bundle (Commercial Release 2027). This archive includes your complete master toolkit:

1. CORE 44-PAGE MASTER PUBLICATIONS:
   - 01_AI-Essentials-English-Edition-1.pdf (Complete 44-Page English Master Edition)
   - 02_AI-Essentials-Hindi-Edition-1.pdf   (Complete 44-Page Hindi Master Edition)
   Covers 1950 Foundations to 2027 Agentic AI, Indic LLMs (Sarvam, Krutrim, Bhashini),
   IndiaAI Mission (₹10,372 Cr GPU budget), Deep Learning, Attention, and Career Blueprints.

2. 2027 CAREER & SALARY BLUEPRINT (12 PAGES):
   - 03_AI-Career-and-Salary-Blueprint-Edition-1.pdf
   Comprehensive compensation matrices across India Tier-1 hubs (₹4.5 LPA to ₹38+ LPA),
   US Remote ($65k-$260k), 6 AI Specializations, 0-to-6 Month Learning Roadmap,
   The Million-Dollar RAG Architecture, 25 STAR ATS Resume Bullets, and Freelance Rate Cards.

3. TOP 50 INTERVIEW QUESTIONS & 100 ENTERPRISE PROMPTS VAULT (12 PAGES):
   - 04_AI-Top-50-Interview-Questions-and-100-Enterprise-Prompts-Vault.pdf
   Top 50 FAANG/MNC technical interview questions with mathematical derivations,
   Transformer mechanics, FlashAttention, vLLM continuous batching, and 100 battle-tested
   production system prompts ready for enterprise injection.

SUPPORT & DIRECT MENTORSHIP:
For technical questions or quarterly update access, contact rahul.28e1@gmail.com
or visit Rahul Sir's official platform at https://rtechlab.vercel.app

© 2027 RTechLab. All rights reserved. Technology Made Practical · Learn. Practice. Innovate.
"""
    readme_path = os.path.join(downloads_dir, "README-AI-CAREER-ACCELERATOR-BUNDLE.txt")
    with open(readme_path, "w", encoding="utf-8") as f:
        f.write(readme_content)
        
    # 5. Build ZIP Bundle
    zip_path = os.path.join(downloads_dir, "AI-Career-Accelerator-Bundle.zip")
    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zipf:
        zipf.write(os.path.join(downloads_dir, "AI-Essentials-English-Edition-1.pdf"), "01_AI-Essentials-English-Edition-1.pdf")
        zipf.write(os.path.join(downloads_dir, "AI-Essentials-Hindi-Edition-1.pdf"), "02_AI-Essentials-Hindi-Edition-1.pdf")
        zipf.write(os.path.join(downloads_dir, "AI-Career-and-Salary-Blueprint-Edition-1.pdf"), "03_AI-Career-and-Salary-Blueprint-Edition-1.pdf")
        zipf.write(os.path.join(downloads_dir, "AI-Top-50-Interview-Questions-and-100-Enterprise-Prompts-Vault.pdf"), "04_AI-Top-50-Interview-Questions-and-100-Enterprise-Prompts-Vault.pdf")
        zipf.write(readme_path, "README-AI-CAREER-ACCELERATOR-BUNDLE.txt")
        
    print(f"\nSUCCESSFULLY CREATED BUNDLE: {zip_path} (Size: {os.path.getsize(zip_path) / (1024*1024):.2f} MB)")

if __name__ == "__main__":
    package_ai()
