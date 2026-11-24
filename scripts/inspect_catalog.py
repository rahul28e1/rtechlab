with open('src/data/notesCatalog.js', 'r', encoding='utf-8') as f:
    c = f.read()

import re
matches = re.findall(r'(id:\s*[\'"](\w+)[\'"],[\s\S]*?bundleZip:\s*[\'"][^\'"]+[\'"])', c)
for m, id_name in matches:
    print(f'=== {id_name} ===')
    for line in m.splitlines():
        if 'preview' in line or 'fullPdf' in line:
            print(' ', line.strip())
