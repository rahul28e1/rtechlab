# -*- coding: utf-8 -*-
"""
Reformat all 11 Hindi MCQ tables into individual numbered exam drill items
"""
import os
import re

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SCRIPTS_DIR = os.path.join(BASE_DIR, "scripts")

def convert_file(filename):
    path = os.path.join(SCRIPTS_DIR, filename)
    with open(path, "r", encoding="utf-8") as f:
        text = f.read()

    matches = [m.start() for m in re.finditer(r'\n==\s+[\d\.]+\s+उच्च-प्राथमिकता', text)]
    # Process matches in reverse order so string replacement doesn't shift earlier offsets
    for start_pos in reversed(matches):
        next_pos = text.find('\n==', start_pos + 10)
        chunk = text[start_pos:next_pos] if next_pos != -1 else text[start_pos:]
        t_start = chunk.find('#table(')
        t_end = chunk.rfind('\n)')
        if t_start == -1 or t_end == -1:
            print(f"Skipping match in {filename}: table bounds not found")
            continue

        table_str = chunk[t_start:t_end+2]
        rows = re.findall(r'\[(\d+)\]\s*,\s*\[(.*?)\]\s*,\s*\[(.*?)\](?:\s*,|\s*\))', table_str, re.DOTALL)
        if len(rows) < 8:
            print(f"Skipping match in {filename}: only {len(rows)} rows found")
            continue

        # Build replacement list
        new_items = []
        for num_str, q_opt, ans_exp in rows:
            num = int(num_str)
            q_opt = q_opt.strip()
            ans_exp = ans_exp.strip()

            # Split question and options
            q_lines = q_opt.split('\\\\')
            q_text = q_lines[0].strip()
            opts_text = '\\\\\n   '.join(l.strip() for l in q_lines[1:]) if len(q_lines) > 1 else ""

            # Split answer and explanation
            ans_lines = ans_exp.split('\\\\')
            ans_text = ans_lines[0].strip()
            # Clean ans_text of surrounding asterisks if any
            if ans_text.startswith('*') and ans_text.endswith('*'):
                ans_text = ans_text[1:-1].strip()
            exp_text = ' '.join(l.strip() for l in ans_lines[1:]) if len(ans_lines) > 1 else ""

            item = f"{num}. *{q_text}*\\\\\n"
            if opts_text:
                item += f"   {opts_text}\\\\\n"
            item += f"   *{ans_text}* | *व्याख्या:* {exp_text}\n\n#v(5pt)\n"
            new_items.append(item)

        replacement_str = "\n".join(new_items)
        abs_t_start = start_pos + t_start
        abs_t_end = start_pos + t_end + 2
        text = text[:abs_t_start] + replacement_str + text[abs_t_end:]
        print(f"{filename}: Replaced 1 MCQ table with {len(rows)} items.")

    with open(path, "w", encoding="utf-8") as f:
        f.write(text)

for fn in ['mega_content_hi_part1.py', 'mega_content_hi_part2.py', 'mega_content_hi_part3.py']:
    convert_file(fn)

print("All Hindi MCQ tables converted to numbered exam drills!")
