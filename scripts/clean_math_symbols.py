import re

for part in [1, 2, 3, 4, 5, 6]:
    fname = f"scripts/ai_chapters_eng_part{part}.py"
    with open(fname, "r", encoding="utf-8") as f:
        content = f.read()
    
    content = content.replace("diff ", "partial ")
    content = content.replace("diff", "partial")

    with open(fname, "w", encoding="utf-8") as f:
        f.write(content)

print("Replaced diff with partial across all parts!")
