import os, subprocess
from pypdf import PdfReader

BASE_DIR = r"C:\Users\Rahul\Videos\My projects\RtechLab"
SRC_DIR = os.path.join(BASE_DIR, r"DIGITAL\WINDOWS_SERVER_2025\07_SOURCE_FILES")

target_pages = {
    1: 5, 2: 5, 3: 4, 4: 5, 5: 4, 6: 4, 7: 4,
    8: 4, 9: 4, 10: 4, 11: 3, 12: 3, 13: 4, 14: 4 # Ch 14 includes author bio
}

for lang in ["en", "gu"]:
    folder = "chapters_" + lang
    print(f"\n=================== {lang.upper()} CHAPTER AUDIT ===================")
    for i in range(1, 15):
        wrapper = f"""#import "/DIGITAL/WINDOWS_SERVER_2025/07_PUBLISHING_ENGINE/server-theme.typ": *
#show: rtech-server-book.with(
  title: "Test", subtitle: "Test", author: "Rahul Patel", edition: "Test", subject-code: "T1", lang: "{lang}"
)
#include "/DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/{folder}/chapter_{i:02d}.typ"
"""
        test_file = os.path.join(BASE_DIR, "single_ch_test.typ")
        pdf_file = os.path.join(BASE_DIR, "single_ch_test.pdf")
        with open(test_file, "w", encoding="utf-8") as f:
            f.write(wrapper)
        proc = subprocess.run(["typst", "compile", "--root", BASE_DIR, test_file, pdf_file], capture_output=True, text=True)
        if proc.returncode == 0:
            actual = len(PdfReader(pdf_file).pages)
            tgt = target_pages[i]
            diff = actual - tgt
            flag = "OK" if diff == 0 else f"{diff:+d} PAGES"
            print(f"Ch {i:02d}: actual={actual}, target={tgt} -> {flag}")
        else:
            print(f"Ch {i:02d}: ERROR {proc.stderr[:120]}")
