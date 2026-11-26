import os
import subprocess

files = [
    'scripts/build_tally_hindi_v2.py',
    'scripts/build_tally_english_v2.py',
    'scripts/build_tally_gujarati_v2.py'
]

bad_seq = '''                )
              ]
            ]
            ]
          ]
        )'''

good_seq = '''                )
              ]
            ]
          ]
        )'''

for fp in files:
    with open(fp, 'r', encoding='utf-8') as f:
        content = f.read()
    if bad_seq in content:
        content = content.replace(bad_seq, good_seq)
        with open(fp, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Fixed brackets in {fp}")
    else:
        print(f"Could not find bad_seq in {fp}")
