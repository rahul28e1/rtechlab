import glob

for p in glob.glob("scripts/ai_chapters_hi_part*.py"):
    with open(p, "r", encoding="utf-8") as f:
        c = f.read()
    
    # In Typst math: product, not prod
    c = c.replace("prod_", "product_")
    c = c.replace("prod ", "product ")
    
    # In Typst: *bold*, not **bold**
    c = c.replace("**", "*")
    
    with open(p, "w", encoding="utf-8") as f:
        f.write(c)

print("[INFO] Cleaned math and bold syntax in all Hindi parts!")
