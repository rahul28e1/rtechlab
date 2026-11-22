with open('DIGITAL/TALLY_PRIME/07_PUBLISHING_ENGINE/master-theme.typ', 'r', encoding='utf-8') as f:
    text = f.read()

idx = text.find('#let key-pill')
print(text[idx:idx+400])
