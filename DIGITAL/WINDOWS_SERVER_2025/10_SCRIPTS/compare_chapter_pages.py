import os, re
from pypdf import PdfReader

def get_chapter_pages(pdf_path):
    reader = PdfReader(pdf_path)
    ch_pages = {}
    for p_idx, page in enumerate(reader.pages):
        text = page.extract_text() or ""
        m = re.search(r'CHAPTER\s+(\d+)|પ્રકરણ\s+(\d+)|अध्याय\s+(\d+)', text, re.IGNORECASE)
        if m:
            num = int(m.group(1) or m.group(2) or m.group(3))
            if num not in ch_pages:
                ch_pages[num] = p_idx + 1
    return len(reader.pages), ch_pages

hi_total, hi_ch = get_chapter_pages(r"DIGITAL\WINDOWS_SERVER_2025\01_CORE_MASTER_EDITION\Windows-Server-2025-Hindi-Master-Guide.pdf")
en_total, en_ch = get_chapter_pages("test_en.pdf")
gu_total, gu_ch = get_chapter_pages("test_gu.pdf")

print(f"Total Pages: HI={hi_total}, EN={en_total}, GU={gu_total}")
print(f"{'Ch':<4} | {'HI Start':<10} | {'EN Start':<10} | {'GU Start':<10} | {'Target Length':<12}")
print("-" * 55)

for i in range(1, 15):
    hi_p = hi_ch.get(i, "-")
    en_p = en_ch.get(i, "-")
    gu_p = gu_ch.get(i, "-")
    print(f"{i:<4} | {hi_p:<10} | {en_p:<10} | {gu_p:<10}")
