import os

with open('DIGITAL/TALLY_PRIME/07_PUBLISHING_ENGINE/master-theme.typ', 'r', encoding='utf-8') as f:
    text = f.read()

print('File size:', len(text))
# Check if key-pill is in there
if '#let key-pill' in text:
    print('Found key-pill definition')
