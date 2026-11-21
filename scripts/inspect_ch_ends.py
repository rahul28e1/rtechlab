import os

eng_dir = "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/English"
ch_to_inspect = [8, 16, 17, 20, 23, 24, 26, 27, 30, 31, 32, 33, 34, 35, 36, 41, 42]

for c in ch_to_inspect:
    path = os.path.join(eng_dir, f"chapter-{c:02d}.typ")
    if os.path.exists(path):
        with open(path, "r", encoding="utf-8") as f:
            text = f.read()
        print(f"--- Chapter {c:02d} (len: {len(text)}) ---")
        lines = [line for line in text.split("\n") if line.strip()]
        for l in lines[-4:]:
            print("  ", l[:80])
