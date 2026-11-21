import os
import re

path = 'scripts/build_full_practical_templates_workbook.py'
with open(path, 'r', encoding='utf-8') as f:
    text = f.read()

# Fix formula: '...' to formula: "..."
# But wait, inside python raw string r""" ... """
# If the typst file needs: formula: "=IF(...)"
# Let's inspect how formula-box is called in typst.
# In typst:
# #formula-box(
#   title: "Reorder Trigger Logic",
#   formula: "=IF(Current_Stock <= Reorder_Level, \"⚠️ TRIGGER REORDER\", \"✓ OPTIMAL\")",
#   ...
# )
# Or formula: [=IF(Current_Stock <= Reorder_Level, "⚠️ TRIGGER REORDER", "✓ OPTIMAL")]

# Let's see all formula: '...' occurrences
pattern = r"formula:\s*'([^']*)'"
matches = re.findall(pattern, text)
print(f"Found {len(matches)} single-quoted formula parameters:")
for m in matches:
    print("  -", m[:50])

# Fix single quotes around formula: '...' to formula: "..." with escaped inner quotes:
def replace_formula(m):
    inner = m.group(1).replace('"', '\\"')
    return f'formula: "{inner}"'

text = re.sub(pattern, replace_formula, text)

# Fix [*Tmpl #*] -> [*Tmpl No.*]
text = text.replace("[*Tmpl #*]", "[*Tmpl No.*]")
text = text.replace("[*Task #*]", "[*Task No.*]")
text = text.replace("[*Sample #*]", "[*Sample No.*]")
text = text.replace("[*Check #*]", "[*Check No.*]")

# Fix <5 Yrs -> <5 is parsed as label in Typst if not escaped, or replace with (Ineligible Under 5 Yrs)
text = text.replace("<5 Yrs", "Under 5 Yrs")

# Fix Cheque # -> Cheque No.
text = text.replace("Cheque #", "Cheque No.")

with open(path, 'w', encoding='utf-8') as f:
    f.write(text)

print("Updated scripts/build_full_practical_templates_workbook.py")
