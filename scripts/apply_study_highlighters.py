# -*- coding: utf-8 -*-
"""
Study Highlighter Application Engine
Applies authentic Yellow, Light Orange, and Light Green highlighters & underlines to key concepts across Tally Prime master publications.
"""
import os
import re

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SCRIPTS_DIR = os.path.join(BASE_DIR, "scripts")

eng_replacements = [
    # Yellow (Historical, Theoretical, Golden Rules)
    ("Shyam Sundar Goenka", "#ul-yellow[Shyam Sundar Goenka]"),
    ("Bharat Goenka", "#hl-yellow[Bharat Goenka]"),
    ("Peutronics Financial Services", "#ul-yellow[Peutronics Financial Services]"),
    ("80% market share", "#hl-yellow[80% market share]"),
    ("Cactus in-memory database", "#hl-yellow[Cactus in-memory database]"),
    ("Cactus database", "#hl-yellow[Cactus database]"),
    ("Luca Pacioli", "#ul-yellow[Luca Pacioli]"),
    ("Debit what comes in, Credit what goes out", "#ul-yellow[Debit what comes in, Credit what goes out]"),
    ("Debit the receiver, Credit the giver", "#ul-yellow[Debit the receiver, Credit the giver]"),
    ("Debit all expenses and losses, Credit all incomes and gains", "#ul-yellow[Debit all expenses and losses, Credit all incomes and gains]"),
    ("Assets = Liabilities + Capital", "#ul-yellow[Assets = Liabilities + Capital]"),
    ("Gateway of Tally (GOT)", "#hl-yellow[Gateway of Tally (GOT)]"),
    ("Going Concern Concept", "#ul-yellow[Going Concern Concept]"),
    ("Accrual Concept", "#ul-yellow[Accrual Concept]"),
    ("Matching Principle", "#ul-yellow[Matching Principle]"),
    
    # Orange (Statutory Sections, Tax Rates, Thresholds)
    ("Section 194I", "#ul-orange[Section 194I]"),
    ("Section 194J", "#ul-orange[Section 194J]"),
    ("Section 194C", "#ul-orange[Section 194C]"),
    ("Section 194H", "#ul-orange[Section 194H]"),
    ("Section 194Q", "#ul-orange[Section 194Q]"),
    ("Section 206AA", "#ul-orange[Section 206AA]"),
    ("Section 17(5)", "#ul-orange[Section 17(5)]"),
    ("Section 16(2)(aa)", "#ul-orange[Section 16(2)(aa)]"),
    ("Rule 46 Tax Invoice", "#ul-orange[Rule 46 Tax Invoice]"),
    ("Rule 46", "#ul-orange[Rule 46]"),
    ("10% TDS", "#hl-orange[10% TDS]"),
    ("2% TDS", "#hl-orange[2% TDS]"),
    ("20% penal rate", "#hl-orange[20% penal rate]"),
    ("18% GST", "#hl-orange[18% GST]"),
    ("5% GST", "#hl-orange[5% GST]"),
    ("0% GST", "#hl-orange[0% GST]"),
    ("₹2,40,000 annually", "#hl-orange[₹2,40,000 annually]"),
    ("₹50,000 threshold", "#hl-orange[₹50,000 threshold]"),
    
    # Green (Statutory Returns, Compliance, BRS, Audit)
    ("GSTR-1", "#ul-green[GSTR-1]"),
    ("GSTR-3B", "#ul-green[GSTR-3B]"),
    ("GSTR-2B", "#ul-green[GSTR-2B]"),
    ("GSTR-9", "#ul-green[GSTR-9]"),
    ("GSTR-9C", "#ul-green[GSTR-9C]"),
    ("Form 26Q", "#ul-green[Form 26Q]"),
    ("Challan 281", "#ul-green[Challan 281]"),
    ("Bank Reconciliation Statement (BRS)", "#hl-green[Bank Reconciliation Statement (BRS)]"),
    ("Input Tax Credit (ITC)", "#hl-green[Input Tax Credit (ITC)]"),
    ("Tally Vault AES-128", "#hl-green[Tally Vault AES-128]"),
    ("Tally Vault", "#hl-green[Tally Vault]"),
    ("Audit Trail (Edit Log)", "#hl-green[Audit Trail (Edit Log)]"),
    ("Bill of Materials (BOM)", "#hl-green[Bill of Materials (BOM)]"),
    ("Trial Balance", "#ul-green[Trial Balance]")
]

hi_replacements = [
    # Yellow (Historical, Theoretical, Golden Rules)
    ("श्याम सुंदर गोयनका", "#ul-yellow[श्याम सुंदर गोयनका]"),
    ("भरत गोयनका", "#hl-yellow[भरत गोयनका]"),
    ("80% बाजार हिस्सेदारी", "#hl-yellow[80% बाजार हिस्सेदारी]"),
    ("80% से अधिक बाजार हिस्सेदारी", "#hl-yellow[80% से अधिक बाजार हिस्सेदारी]"),
    ("कैक्टस इन-मेमोरी डेटाबेस", "#hl-yellow[कैक्टस इन-मेमोरी डेटाबेस]"),
    ("कैक्टस (Cactus) इन-मेमोरी डेटाबेस", "#hl-yellow[कैक्टस (Cactus) इन-मेमोरी डेटाबेस]"),
    ("कैक्टस इंजन", "#hl-yellow[कैक्टस इंजन]"),
    ("गेटवे ऑफ टैली (Gateway of Tally)", "#hl-yellow[गेटवे ऑफ टैली (Gateway of Tally)]"),
    ("गेटवे ऑफ टैली (GOT)", "#hl-yellow[गेटवे ऑफ टैली (GOT)]"),
    ("ल्यूका पैसिओली", "#ul-yellow[ल्यूका पैसिओली]"),
    ("पाने वाले को नाम (Debit) करो और देने वाले को जमा (Credit) करो", "#ul-yellow[पाने वाले को नाम (Debit) करो और देने वाले को जमा (Credit) करो]"),
    ("आने वाली संपत्ति को नाम (Debit) करो और जाने वाली संपत्ति को जमा (Credit) करो", "#ul-yellow[आने वाली संपत्ति को नाम (Debit) करो और जाने वाली संपत्ति को जमा (Credit) करो]"),
    ("सभी व्यय एवं हानियों को डेबिट करो और सभी आय एवं लाभों को क्रेडिट करो", "#ul-yellow[सभी व्यय एवं हानियों को डेबिट करो और सभी आय एवं लाभों को क्रेडिट करो]"),
    ("संपत्तियां = देनदारियां + पूंजी", "#ul-yellow[संपत्तियां = देनदारियां + पूंजी]"),
    
    # Orange (Statutory Sections, Tax Rates, Thresholds)
    ("धारा 194I", "#ul-orange[धारा 194I]"),
    ("धारा 194J", "#ul-orange[धारा 194J]"),
    ("धारा 194C", "#ul-orange[धारा 194C]"),
    ("धारा 194H", "#ul-orange[धारा 194H]"),
    ("धारा 194Q", "#ul-orange[धारा 194Q]"),
    ("धारा 206AA", "#ul-orange[धारा 206AA]"),
    ("धारा 17(5)", "#ul-orange[धारा 17(5)]"),
    ("धारा 16(2)(aa)", "#ul-orange[धारा 16(2)(aa)]"),
    ("नियम 46 टैक्स इनवॉइस", "#ul-orange[नियम 46 टैक्स इनवॉइस]"),
    ("नियम 46", "#ul-orange[नियम 46]"),
    ("10% TDS", "#hl-orange[10% TDS]"),
    ("2% TDS", "#hl-orange[2% TDS]"),
    ("20% की दंडात्मक दर", "#hl-orange[20% की दंडात्मक दर]"),
    ("18% GST", "#hl-orange[18% GST]"),
    ("5% GST", "#hl-orange[5% GST]"),
    ("0% GST", "#hl-orange[0% GST]"),
    ("₹2,40,000 से अधिक", "#hl-orange[₹2,40,000 से अधिक]"),
    ("₹50,000 से अधिक", "#hl-orange[₹50,000 से अधिक]"),
    
    # Green (Statutory Returns, Compliance, BRS, Audit)
    ("GSTR-1", "#ul-green[GSTR-1]"),
    ("GSTR-3B", "#ul-green[GSTR-3B]"),
    ("GSTR-2B", "#ul-green[GSTR-2B]"),
    ("GSTR-9", "#ul-green[GSTR-9]"),
    ("GSTR-9C", "#ul-green[GSTR-9C]"),
    ("फॉर्म 26Q", "#ul-green[फॉर्म 26Q]"),
    ("चालान 281", "#ul-green[चालान 281]"),
    ("बैंक समाधान विवरण (BRS)", "#hl-green[बैंक समाधान विवरण (BRS)]"),
    ("इनपुट टैक्स क्रेडिट (ITC)", "#hl-green[इनपुट टैक्स क्रेडिट (ITC)]"),
    ("टैली वॉल्ट (Tally Vault)", "#hl-green[टैली वॉल्ट (Tally Vault)]"),
    ("टैली वॉल्ट", "#hl-green[टैली वॉल्ट]"),
    ("ऑडिट ट्रेल (Edit Log)", "#hl-green[ऑडिट ट्रेल (Edit Log)]"),
    ("बिल ऑफ मटेरियल्स (BOM)", "#hl-green[बिल ऑफ मटेरियल्स (BOM)]"),
    ("ट्रायल बैलेंस", "#ul-green[ट्रायल बैलेंस]")
]

def apply_replacements_to_file(filepath, replacements):
    with open(filepath, "r", encoding="utf-8") as f:
        text = f.read()

    lines = text.split('\n')
    out_lines = []
    changes_count = 0

    for line in lines:
        stripped = line.strip()
        # Skip headings, typst function headers, or invoice parameter lines
        if (stripped.startswith('=') or 
            stripped.startswith('#let') or 
            stripped.startswith('#gst-tax-invoice-format') or 
            stripped.startswith('#cheque-format') or 
            stripped.startswith('#bank-statement-format') or
            'inv-no:' in line or 'seller-' in line or 'buyer-' in line or 'items-rows:' in line or
            'fill: (col, row)' in line or 'columns:' in line):
            out_lines.append(line)
            continue

        for src, dst in replacements:
            # Check if src is present and dst not already there
            if src in line and dst not in line and f"[{src}]" not in line:
                line = line.replace(src, dst)
                changes_count += 1
        out_lines.append(line)

    new_text = '\n'.join(out_lines)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(new_text)

    print(f"Applied {changes_count} highlighters to {os.path.basename(filepath)}")

# English files
eng_files = [
    "mega_content_eng_part1.py",
    "mega_content_eng_part2.py",
    "mega_content_eng_part3.py",
    "mega_capstone_eng.py"
]
for ef in eng_files:
    fpath = os.path.join(SCRIPTS_DIR, ef)
    if os.path.exists(fpath):
        apply_replacements_to_file(fpath, eng_replacements)

# Hindi files
hi_files = [
    "mega_content_hi_part1.py",
    "mega_content_hi_part2.py",
    "mega_content_hi_part3.py",
    "mega_capstone_hi.py"
]
for hf in hi_files:
    fpath = os.path.join(SCRIPTS_DIR, hf)
    if os.path.exists(fpath):
        apply_replacements_to_file(fpath, hi_replacements)

print("All highlighters successfully applied across English and Hindi source files!")
