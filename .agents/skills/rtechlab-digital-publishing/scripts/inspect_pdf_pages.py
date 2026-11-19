import fitz # PyMuPDF
from pathlib import Path
import json

def inspect_and_render_pdf(pdf_path, output_dir):
    pdf_path = Path(pdf_path)
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    doc = fitz.open(pdf_path)
    total_pages = len(doc)
    print(f"=== RTECHLAB PDF INSPECTION REPORT ===")
    print(f"File: {pdf_path.name}")
    print(f"Total Pages: {total_pages}")

    qa_report = []

    for idx, page in enumerate(doc):
        text = page.get_text() or ""
        char_count = len(text.strip())
        first_line = text.strip().split("\n")[0] if text.strip() else "[NO TEXT / BLANK]"

        # Render page to high-res image (150 DPI for visual QA)
        zoom = 150 / 72 # 150 dpi
        mat = fitz.Matrix(zoom, zoom)
        pix = page.get_pixmap(matrix=mat)
        img_name = f"page_{idx+1:02d}.png"
        img_path = output_dir / img_name
        pix.save(str(img_path))

        status = "PASS" if char_count > 250 else "WARNING (Low content)"
        if char_count == 0:
            status = "FAIL (Blank Page)"

        page_data = {
            "page_number": idx + 1,
            "char_count": char_count,
            "preview_heading": first_line[:60],
            "rendered_image": str(img_path),
            "status": status
        }
        qa_report.append(page_data)
        print(f"Page {idx+1:02d}: {char_count:4d} chars | Status: {status:18s} | Heading: {first_line[:50]}")

    report_file = output_dir / "qa-inspection-report.json"
    with open(report_file, "w", encoding="utf-8") as f:
        json.dump(qa_report, f, indent=2)

    print(f"\nAll {total_pages} pages rendered to images in {output_dir}")
    print(f"QA report written to {report_file}")
    return qa_report

if __name__ == "__main__":
    inspect_and_render_pdf(
        "RTECHLAB_AI_PUBLISHING_ENGINE/10_SAMPLE_BOOK/rendered/RTechLab-Computer-Hardware-2027-Master-Edition.pdf",
        "RTECHLAB_AI_PUBLISHING_ENGINE/12_QUALITY_ASSURANCE/pdf/rendered_pages"
    )
