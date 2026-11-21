import glob, re

for p in glob.glob("scripts/ai_chapters_hi_part*.py"):
    with open(p, "r", encoding="utf-8") as f:
        c = f.read()
    
    # Replace ($52 with (\$52
    c = re.sub(r'\$(\d+)', r'\\$\1', c)
    # But wait, math variables like $T$, $Q$, $K$, $V$, $d_k$, $P(X)$ should stay math!
    # \$\d+ only replaces dollar amounts like $52, $47, $18,000, $350
    # Let's also check if \$\$ or \$ followed by space or words
    c = c.replace("\\$52 बिलियन", "\\$52 बिलियन")
    
    with open(p, "w", encoding="utf-8") as f:
        f.write(c)

print("[INFO] Replaced currency dollar signs in all Hindi chapters!")
