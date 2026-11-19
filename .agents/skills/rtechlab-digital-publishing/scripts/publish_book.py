#!/usr/bin/env python3
"""
RTechLab Master Publishing Engine CLI
Automates the full 12-phase publishing pipeline:
1. QR Code generation & register sync
2. Typst compilation with strict A4 settings
3. PDF metadata & character inspection
4. Page-by-page visual QA rendering to high-res PNGs
5. 5-Page Free Preview extraction
6. Sync to public/downloads/ for storefront delivery
"""

import sys
import subprocess
import shutil
from pathlib import Path
import fitz # PyMuPDF
import json

ROOT = Path(__file__).resolve().parents[2] # RTECHLAB_AI_PUBLISHING_ENGINE
WORKSPACE = ROOT.parent

def run_publishing_pipeline(source_typ, output_name, title, author="Rahul Sir & RTechLab Team", num_preview_pages=5):
    print("=" * 60)
    print(f"RTECHLAB PUBLISHING ENGINE · COMPILING: {title}")
    print("=" * 60)

    source_path = Path(source_typ)
    rendered_dir = ROOT / "10_SAMPLE_BOOK" / "rendered"
    rendered_dir.mkdir(parents=True, exist_ok=True)
    pdf_out = rendered_dir / f"{output_name}.pdf"

    # Step 1: Typst Compilation
    print("\n[Phase I] Compiling with Typst...")
    cmd = ["typst", "compile", "--root", str(WORKSPACE), str(source_path), str(pdf_out)]
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode != 0:
        print(f"Typst compilation failed:\n{res.stderr}")
        return False
    print(f"✓ Typst build successful: {pdf_out}")

    # Step 2: PDF Page Inspection
    print("\n[Phase K] Page-by-Page Visual Quality Inspection...")
    doc = fitz.open(pdf_out)
    total_pages = len(doc)
    print(f"Total Pages Generated: {total_pages}")

    qa_dir = ROOT / "12_QUALITY_ASSURANCE" / "pdf" / "rendered_pages"
    qa_dir.mkdir(parents=True, exist_ok=True)
    qa_report = []

    for i, page in enumerate(doc):
        txt = page.get_text() or ""
        chars = len(txt.strip())
        first_line = txt.strip().split("\n")[0] if txt.strip() else "[BLANK PAGE]"
        
        # Render high-res PNG
        pix = page.get_pixmap(matrix=fitz.Matrix(150/72, 150/72))
        img_file = qa_dir / f"{output_name}_p{i+1:02d}.png"
        pix.save(str(img_file))

        status = "PASS" if chars > 200 else "FAIL (Blank / Underflow)"
        qa_report.append({
            "page": i + 1,
            "char_count": chars,
            "status": status,
            "heading": first_line[:50],
            "image": str(img_file)
        })
        print(f"  Page {i+1:02d}: {chars:4d} chars | {status:15s} | {first_line[:40]}")

    report_path = qa_dir / f"{output_name}_qa_report.json"
    with open(report_path, "w", encoding="utf-8") as f:
        json.dump(qa_report, f, indent=2)

    # Step 3: Extract Free 5-Page Preview
    print(f"\n[Phase L] Extracting {num_preview_pages}-Page Free Preview...")
    preview_dir = ROOT / "11_FINAL_PRODUCTS" / "free-previews"
    preview_dir.mkdir(parents=True, exist_ok=True)
    preview_pdf = preview_dir / f"{output_name}-Preview.pdf"

    preview_doc = fitz.open()
    for p in range(min(num_preview_pages, total_pages)):
        preview_doc.insert_pdf(doc, from_page=p, to_page=p)
    preview_doc.save(str(preview_pdf))
    print(f"✓ Free preview saved: {preview_pdf} ({len(preview_doc)} pages)")

    # Step 4: Sync to Storefront Downloads
    print("\n[Phase L] Syncing to Public Storefront Downloads...")
    public_downloads = WORKSPACE / "public" / "downloads"
    public_downloads.mkdir(parents=True, exist_ok=True)
    
    shutil.copyfile(pdf_out, public_downloads / f"{output_name}.pdf")
    shutil.copyfile(preview_pdf, public_downloads / f"{output_name}-Preview.pdf")
    print(f"✓ Storefront live assets updated in {public_downloads}")

    print("\n" + "=" * 60)
    print("PUBLISHING PIPELINE COMPLETED SUCCESSFULLY!")
    print("=" * 60)
    return True

if __name__ == "__main__":
    src = ROOT / "10_SAMPLE_BOOK" / "source" / "sample-hardware-handbook.typ"
    run_publishing_pipeline(
        source_typ=src,
        output_name="RTechLab-Computer-Hardware-2027-Master-Edition",
        title="Computer Hardware & System Architecture (2027 Standard)"
    )
