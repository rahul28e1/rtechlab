# -*- coding: utf-8 -*-
"""
Inject Invoices 07 & 08 into Part 3 and Edit Log Section into Part 2
"""
import os

SCRIPTS_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\scripts"

# 1. Update Part 3
p3_path = os.path.join(SCRIPTS_DIR, "mega_content_eng_part3.py")
with open(p3_path, "r", encoding="utf-8") as f:
    p3 = f.read()

invoices_extra = """
#v(8pt)

=== Invoice 07: Job-Work Procurement Invoice under Section 143 (Fabrication & Assembly)
#gst-tax-invoice-format(
  inv-no: "JBW/MEH/25-26/088",
  inv-date: "29-May-2025",
  seller-name: "Mehsana Precision Engineering Works",
  seller-address: "GIDC Industrial Estate, Mehsana, Gujarat - 384002",
  seller-gstin: "24AAAFM9012D1Z6",
  buyer-name: "Ravi Private Limited",
  buyer-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  buyer-gstin: "24AABCR9876Q1Z2",
  items-rows: (
    [1], [Precision CNC Milling of Chassis], [998811], [10 Sets], [4,500.00], [45,000.00], [4,050.00], [4,050.00], [53,100.00],
    [2], [Electrostatic Powder Coating Treatment], [998812], [10 Sets], [1,500.00], [15,000.00], [1,350.00], [1,350.00], [17,700.00]
  ),
  total-taxable: "60,000.00",
  cgst-amt: "5,400.00",
  sgst-amt: "5,400.00",
  igst-amt: "0.00",
  grand-total: "70,800.00",
  in-words: "Rupees Seventy Thousand Eight Hundred Only"
)

#v(8pt)

=== Invoice 08: Inter-State B2B Sales of Capital Goods (Enterprise Server Hardware)
#gst-tax-invoice-format(
  inv-no: "RTECH/CAP/25-26/003",
  inv-date: "30-May-2025",
  seller-name: "Ravi Private Limited",
  seller-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  seller-gstin: "24AABCR9876Q1Z2",
  buyer-name: "Rajasthan Cloud Computing Infrastructure",
  buyer-address: "Sitapura Industrial Area, Tonk Road, Jaipur - 302022",
  buyer-gstin: "08AAACR8899P1Z5",
  items-rows: (
    [1], [Dell PowerEdge Rack Server Dual Xeon], [847141], [1 Unit], [1,80,000.00], [1,80,000.00], [0.00], [0.00], [2,12,400.00],
    [2], [APC Smart-UPS On-Line 3kVA Rackmount], [850440], [1 Unit], [45,000.00], [45,000.00], [0.00], [0.00], [53,100.00]
  ),
  total-taxable: "2,25,000.00",
  cgst-amt: "0.00",
  sgst-amt: "0.00",
  igst-amt: "40,500.00",
  grand-total: "2,65,500.00",
  in-words: "Rupees Two Lakh Sixty Five Thousand Five Hundred Only"
)
"""

if "=== Invoice 07:" not in p3:
    idx = p3.find("== 9.3 Step-by-Step Tally Prime Entry Guide")
    p3 = p3[:idx] + invoices_extra + "\n" + p3[idx:]
    with open(p3_path, "w", encoding="utf-8") as f:
        f.write(p3)
    print("Updated Part 3 with Invoices 07 & 08!")

# 2. Update Part 2
p2_path = os.path.join(SCRIPTS_DIR, "mega_content_eng_part2.py")
with open(p2_path, "r", encoding="utf-8") as f:
    p2 = f.read()

editlog_section = """
== 7.9 Statutory MCA Audit Trail (Edit Log) Compliance Mandate
Under notification *GSR 235(E)* issued by the Ministry of Corporate Affairs (MCA), with effect from 1st April 2023, every company registered under the Companies Act 2013 must use accounting software featuring an unalterable audit trail:
- *Tally Prime Edit Log Edition:* Tally Solutions offers a specialized release titled *TallyPrime Edit Log*. In this release, the audit trail feature is hard-coded and cannot be disabled under any circumstances, even by the company administrator.
- *Tracking Every Change:* When an accounts clerk edits an invoice, changes a ledger amount, or deletes a voucher, Tally logs:
  1. The exact timestamp of the modification.
  2. The username of the operator who executed the change.
  3. The previous field values alongside the new altered values.
- *Auditor's Statutory Report (CARO):* Company statutory auditors must explicitly certify in their annual audit report whether the client operated accounting software with an unbroken audit trail throughout the financial year!

#v(6pt)
"""

if "== 7.9 Statutory MCA Audit Trail" not in p2:
    idx = p2.find("== 7.9 Summary & Key Revision Takeaways")
    p2 = p2[:idx] + editlog_section + "\n" + p2[idx:]
    with open(p2_path, "w", encoding="utf-8") as f:
        f.write(p2)
    print("Updated Part 2 with MCA Edit Log section!")
