with open('scripts/ai_chapters_hi_part3.py', 'r', encoding='utf-8') as f:
    text = f.read()

text = text.replace(r'(\$1 "शब्द" approx 0.75 "टोकन"$)', r'($1 "शब्द" approx 0.75 "टोकन"$)')

with open('scripts/ai_chapters_hi_part3.py', 'w', encoding='utf-8') as f:
    f.write(text)

print('Updated part 3!')
