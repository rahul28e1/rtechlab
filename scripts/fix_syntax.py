import re

for part in [1, 2, 3, 4, 5, 6]:
    fname = f"scripts/ai_chapters_eng_part{part}.py"
    with open(fname, "r", encoding="utf-8") as f:
        content = f.read()
    
    # Fix odot
    content = content.replace("odot", "dot.circle")
    # Fix \" inside strings in python
    content = content.replace(r'\"Bias\"', '"Bias"')
    content = content.replace(r'\"Variance\"', '"Variance"')
    content = content.replace(r'\"softmax\"', '"softmax"')
    content = content.replace(r'\"round\"', '"round"')
    content = content.replace(r'\"quant\"', '"quant"')
    content = content.replace(r'\"dist\"', '"dist"')
    content = content.replace(r'\"max\"', '"max"')
    content = content.replace(r'\"min\"', '"min"')
    content = content.replace(r'\"argmin\"', '"argmin"')
    # Also fix any remaining backslash latex tokens
    content = content.replace(r"\sigma", "sigma")
    content = content.replace(r"\lambda", "lambda")
    content = content.replace(r"\sum", "sum")
    content = content.replace(r"\le", "<=")
    content = content.replace(r"\ge", ">=")
    content = content.replace(r"\sqrt", "sqrt")
    content = content.replace(r"\times", "times")
    content = content.replace(r"\ll", "ll")
    content = content.replace(r"\log", "log")
    content = content.replace(r"\to", "arrow")
    content = content.replace(r"\mathcal{L}", "cal(L)")
    content = content.replace(r"\partial", "diff")

    with open(fname, "w", encoding="utf-8") as f:
        f.write(content)

print("Updated syntax replacements successfully!")
