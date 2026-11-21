# -*- coding: utf-8 -*-

def fix_file(path, replacements):
    with open(path, "r", encoding="utf-8") as f:
        c = f.read()
    for target, replacement in replacements:
        c = c.replace(target, replacement)
    with open(path, "w", encoding="utf-8") as f:
        f.write(c)

# Part 2
fix_file("scripts/ai_chapters_hi_part2.py", [
    (r"\$7\%$ तेज", "7% तेज"),
])

# Part 3
fix_file("scripts/ai_chapters_hi_part3.py", [
    (r"(\$1 \"शब्द\" approx 0.75 \"टोकन\"$)", "(1 शब्द approx 0.75 टोकन)"),
    (r"\$60\%$ घट जाती है", "60% घट जाती है"),
])

# Part 4
fix_file("scripts/ai_chapters_hi_part4.py", [
    (r"(\$52 बिलियन)", r"(\$52 बिलियन)"),
    (r"($52 बिलियन)", r"(\$52 बिलियन)"),
    (r"($47 बिलियन)", r"(\$47 बिलियन)"),
    (r"(\$47 बिलियन)", r"(\$47 बिलियन)"),
    (r"\\\$350", r"\$350"),
    (r"\\\$1,250", r"\$1,250"),
    (r"\\\$2,500", r"\$2,500"),
    (r"\\\$650", r"\$650"),
    (r"\\\$0.05", r"\$0.05"),
])

# Part 5
fix_file("scripts/ai_chapters_hi_part5.py", [
    (r"\\\$75,000", r"\$75,000"),
    (r"\\\$110,000", r"\$110,000"),
    (r"\\\$150,000", r"\$150,000"),
    (r"\\\$195,000", r"\$195,000"),
    (r"\\\$260,000", r"\$260,000"),
    (r"\\\$450,000", r"\$450,000"),
    (r"(\$80,000 से \$180,000", r"(\$80,000 से \$180,000"),
    (r"\\\$18,000", r"\$18,000"),
])

# Part 6
fix_file("scripts/ai_chapters_hi_part6.py", [
    (r"\$1 / sqrt(d_k)$", r"$1 / sqrt(d_k)$"),
])

print("[INFO] Exactly replaced all specific math and dollar occurrences!")
