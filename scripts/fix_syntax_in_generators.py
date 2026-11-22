files = [
    'scripts/generate_full_tally_curriculum_eng.py',
    'scripts/generate_full_tally_curriculum_eng_part2.py',
    'scripts/generate_full_tally_curriculum_eng_part3.py'
]

for fpath in files:
    with open(fpath, 'r', encoding='utf-8') as f:
        content = f.read()
    orig = content
    content = content.replace('#(Narration:', '(Narration:')
    content = content.replace('[#text(weight: "bold", fill: white)[#]]', '[#text(weight: "bold", fill: white)[Sl.]]')
    if content != orig:
        with open(fpath, 'w', encoding='utf-8') as f:
            f.write(content)
        print('Updated', fpath)
