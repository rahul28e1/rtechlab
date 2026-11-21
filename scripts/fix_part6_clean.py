with open("scripts/ai_chapters_eng_part6.py", "r", encoding="utf-8") as f:
    c = f.read()

# Fix Q14
c = c.replace(r'\"softmax\"((QK^T)/sqrt{d_k})V', '"softmax"((Q K^T) / sqrt(d_k)) V')
c = c.replace(r'"softmax"((QK^T)/sqrt{d_k})V', '"softmax"((Q K^T) / sqrt(d_k)) V')

# Fix Q31
c = c.replace("r ll d", "r << d")

# Fix Q35
c = c.replace(r'X_{\"quant\"}', 'X_("quant")')
c = c.replace(r'X_{\"quant\"}', 'X_("quant")')
c = c.replace(r'X_(\"quant\")', 'X_("quant")')

# Fix Q11
c = c.replace(r'(\"dist\"_{\"max\"} - \"dist\"_{\"min\"})/\"dist\"_{\"min\"} -> 0', '(d_("max") - d_("min")) / d_("min") arrow.r 0')

# Fix Q01
c = c.replace(r'\"Bias\"^2 + \"Variance\" + sigma^2', '"Bias"^2 + "Variance" + sigma^2')

with open("scripts/ai_chapters_eng_part6.py", "w", encoding="utf-8") as f:
    f.write(c)

print("Fixed specific math items in part 6!")
