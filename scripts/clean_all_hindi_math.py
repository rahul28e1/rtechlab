import glob, re

for p in glob.glob("scripts/ai_chapters_hi_part*.py"):
    with open(p, "r", encoding="utf-8") as f:
        c = f.read()
    
    # Whenever \$ was placed right before a digit that was inside math:
    # e.g. \$0$ -> $0$, \$1$ -> $1$, \$2$ -> $2$, \$3$ -> $3$, \$4$ -> $4$, \$16$ -> $16$
    # \$60\%$ -> $60%$
    # \$1 / sqrt -> $1 / sqrt
    c = re.sub(r'\\\$(\d+)\$', r'$\1$', c)
    c = re.sub(r'\\\$(\d+[\w\s\+\-\*\/\^\=]+)\$', r'$\1$', c)
    c = re.sub(r'\\\$(\d+)\%', r'$\1%$', c)
    
    # Currency in prose: \$75,000 or \$110,000 (not closed by a math $)
    # e.g. [\$75,000 – \$110,000] should be [\\$75,000 – \\$110,000]
    
    with open(p, "w", encoding="utf-8") as f:
        f.write(c)

print("[INFO] Cleaned math delimiters in Hindi chapters!")
