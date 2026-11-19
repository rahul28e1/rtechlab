import fitz
from pathlib import Path

def generate_free_preview(src_pdf, dest_pdf, num_pages=5):
    src_doc = fitz.open(src_pdf)
    dest_doc = fitz.open()

    for i in range(min(num_pages, len(src_doc))):
        dest_doc.insert_pdf(src_doc, from_page=i, to_page=i)

    dest_pdf = Path(dest_pdf)
    dest_pdf.parent.mkdir(parents=True, exist_ok=True)
    dest_doc.save(str(dest_pdf))
    print(f"Generated {num_pages}-page free preview: {dest_pdf} ({len(dest_doc)} pages)")

if __name__ == "__main__":
    src = "RTECHLAB_AI_PUBLISHING_ENGINE/10_SAMPLE_BOOK/rendered/RTechLab-Computer-Hardware-2027-Master-Edition.pdf"
    dest1 = "RTECHLAB_AI_PUBLISHING_ENGINE/11_FINAL_PRODUCTS/free-previews/RTechLab-Computer-Hardware-2027-5Page-Preview.pdf"
    dest2 = "public/downloads/RTechLab-Computer-Hardware-2027-5Page-Preview.pdf"
    generate_free_preview(src, dest1, 5)
    generate_free_preview(src, dest2, 5)
    # Also update the full master edition in public/downloads for store download button
    dest_full = "public/downloads/RTechLab-Computer-Hardware-2027-Master-Edition.pdf"
    import shutil
    shutil.copyfile(src, dest_full)
    print(f"Updated store download: {dest_full}")
