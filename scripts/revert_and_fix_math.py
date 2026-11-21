import glob, re

for p in glob.glob("scripts/ai_chapters_hi_part*.py"):
    with open(p, "r", encoding="utf-8") as f:
        c = f.read()
    
    # Revert broken math
    c = c.replace(r"(\$3.5 - 2.5$)", r"($3.5 - 2.5$)")
    c = c.replace(r"\$1024 times 1024$", r"$1024 times 1024$")
    c = c.replace(r"\$0$ पर", r"$0$ पर")
    c = c.replace(r"अधिकतम \$0.25$", r"अधिकतम $0.25$")
    c = c.replace(r"आइगेनवैल्यू \$1$", r"आइगेनवैल्यू $1$")
    c = c.replace(r"शून्य (\$0$)", r"शून्य ($0$)")
    c = c.replace(r"[\$1 / sqrt(d_k)$]", r"[$1 / sqrt(d_k)$]")
    c = c.replace(r"(\$1 \"शब्द\"", r"($1 \"शब्द\"")
    c = c.replace(r"या \$16$)", r"या $16$)")
    c = c.replace(r"\$2 + 2$", r"$2 + 2$")
    c = c.replace(r"हमेशा \$4$", r"हमेशा $4$")
    c = c.replace(r"संभावना \$1$", r"संभावना $1$")
    c = c.replace(r"को \$2 times r$", r"को $2 times r$")
    
    # Fix real currency
    c = c.replace(r"($52 बिलियन)", r"(\$52 बिलियन)")
    c = c.replace(r"($47 बिलियन)", r"(\$47 बिलियन)")
    c = c.replace(r"(\$52 बिलियन)", r"(\$52 बिलियन)")
    c = c.replace(r"(\$47 बिलियन)", r"(\$47 बिलियन)")
    
    with open(p, "w", encoding="utf-8") as f:
        f.write(c)

print("[INFO] Reverted math and fixed currency in Hindi chapters!")
