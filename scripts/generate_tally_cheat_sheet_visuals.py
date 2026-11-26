import os
import matplotlib.pyplot as plt
import matplotlib.patches as patches

output_dir = r"DIGITAL\TALLY_PRIME\02_BRAND_ASSETS"
os.makedirs(output_dir, exist_ok=True)

plt.rcParams['font.sans-serif'] = 'DejaVu Sans'

# 1. Authentic CTS-2010 Bank Cheque & BRS Visual
def create_cheque_visual():
    fig, ax = plt.subplots(figsize=(10, 4.2), dpi=300)
    fig.patch.set_facecolor('#F8FAFC')
    ax.set_facecolor('#F8FAFC')

    # Cheque Body (Standard Pastel Cyan/Security tint)
    cheque = patches.FancyBboxPatch((0.5, 0.4), 9.0, 3.4, boxstyle="round,pad=0.04", 
                                    fc='#E0F2FE', ec='#0284C7', lw=1.8)
    ax.add_patch(cheque)

    # Bank Emblem Circle & Header
    bank_badge = patches.Circle((2.0, 3.35), 0.26, fc='#0284C7', ec='#0369A1', lw=1)
    ax.add_patch(bank_badge)
    ax.text(2.0, 3.35, "SBI", fontsize=7.5, weight='black', color='white', ha='center', va='center')

    ax.text(2.45, 3.42, "STATE BANK OF INDIA", fontsize=10.5, weight='black', color='#0F172A')
    ax.text(2.45, 3.20, "Palanpur Commercial Branch (IFS Code: SBIN0001234)", fontsize=6.8, color='#0369A1', weight='bold')

    # A/c Payee crossing on top left corner
    payee_cross = patches.FancyBboxPatch((0.65, 3.38), 1.05, 0.36, boxstyle="round,pad=0.02", fc='#F8FAFC', ec='#0F172A', lw=1.1)
    ax.add_patch(payee_cross)
    ax.text(1.17, 3.56, "A/C PAYEE\nONLY", fontsize=5.2, weight='black', color='#0F172A', ha='center', va='center')

    # Date Boxes (Top Right: DD MM YYYY)
    ax.text(7.1, 3.45, "DATE", fontsize=7.5, weight='bold', color='#0F172A')
    for i in range(8):
        box = patches.Rectangle((7.6 + i * 0.21, 3.32), 0.18, 0.28, fc='white', ec='#64748B', lw=0.8)
        ax.add_patch(box)
    date_digits = ["3", "1", "0", "3", "2", "0", "2", "7"]
    for i, d in enumerate(date_digits):
        ax.text(7.69 + i * 0.21, 3.46, d, fontsize=7.5, weight='bold', color='#0F172A', ha='center', va='center')

    # Payee line
    ax.text(0.9, 2.75, "PAY", fontsize=8.5, weight='bold', color='#0F172A')
    ax.text(1.4, 2.75, "Ramesh Patel & Sons (Palanpur Traders)", fontsize=9, weight='bold', color='#0F172A')
    ax.plot([1.35, 8.8], [2.68, 2.68], color='#64748B', lw=0.8, ls=':')

    # Rupee in words
    ax.text(0.9, 2.25, "RUPEES", fontsize=8, weight='bold', color='#0F172A')
    ax.text(1.7, 2.25, "Fifty-One Thousand Two Hundred Only", fontsize=8.2, weight='bold', color='#0F172A')
    ax.plot([1.65, 6.8], [2.18, 2.18], color='#64748B', lw=0.8, ls=':')

    # Amount Box in Figures
    amt_box = patches.FancyBboxPatch((7.0, 1.95), 1.9, 0.55, boxstyle="square,pad=0", fc='white', ec='#0284C7', lw=1.4)
    ax.add_patch(amt_box)
    ax.text(7.15, 2.22, "₹", fontsize=11, weight='bold', color='#0F172A', va='center')
    ax.text(7.95, 2.22, "51,200.00 /-", fontsize=9.5, weight='black', color='#0F172A', va='center', ha='center')

    # Account Number
    ac_box = patches.FancyBboxPatch((1.6, 1.55), 2.8, 0.4, boxstyle="square,pad=0", fc='white', ec='#64748B', lw=0.8)
    ax.add_patch(ac_box)
    ax.text(0.9, 1.75, "A/C NO.", fontsize=7.5, weight='bold', color='#0F172A')
    ax.text(3.0, 1.75, "3 0 8 4 9 2 0 1 8 4 4", fontsize=8, fontfamily='monospace', weight='bold', color='#0F172A', ha='center')

    # Signature line
    ax.text(8.0, 1.15, "Rahul Patel", fontsize=9, style='italic', weight='bold', color='#0369A1', ha='center')
    ax.text(8.0, 0.95, "Authorized Signatory", fontsize=6.8, color='#64748B', ha='center')

    # Bottom MICR Band
    micr_band = patches.Rectangle((0.5, 0.4), 9.0, 0.45, fc='#F1F5F9', ec='#CBD5E1', lw=0.8)
    ax.add_patch(micr_band)
    ax.text(5.0, 0.62, "⑈ 042918 ⑈   385002005 ⑆   018442 ⑈   29", fontsize=8, fontfamily='monospace', weight='bold', color='#334155', ha='center')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 4.2)
    ax.axis('off')
    plt.tight_layout()
    out_file = os.path.join(output_dir, "bank_cheque_reconciliation.png")
    plt.savefig(out_file, dpi=300)
    plt.close()
    print("Generated bank_cheque_reconciliation.png")

# 2. Authentic GST Tax Invoice Header Flow
def create_gst_invoice_visual():
    fig, ax = plt.subplots(figsize=(10, 4.5), dpi=300)
    fig.patch.set_facecolor('#F8FAFC')
    ax.set_facecolor('#F8FAFC')

    # Outer Invoice Box
    inv_box = patches.FancyBboxPatch((0.5, 0.4), 9.0, 3.7, boxstyle="round,pad=0.04", 
                                     fc='#FFFFFF', ec='#059669', lw=1.8)
    ax.add_patch(inv_box)

    # Top Header
    ax.text(5.0, 3.8, "TAX INVOICE (RULE 46 COMPLIANT) · APMC TRADING STANDARD", fontsize=10, weight='black', color='#0F172A', ha='center')
    ax.text(5.0, 3.55, "RTechLab Commercial Accounting Suite · Intra-State CGST/SGST vs Inter-State IGST", fontsize=7.2, color='#059669', weight='bold', ha='center')

    # 2 Columns: Supplier (Left) vs Buyer (Right)
    # Supplier Box
    s_box = patches.FancyBboxPatch((0.7, 2.3), 4.1, 1.05, boxstyle="round,pad=0.02", fc='#F0FDF4', ec='#86EFAC', lw=1)
    ax.add_patch(s_box)
    ax.text(0.85, 3.15, "SUPPLIER (Seller):", fontsize=7, weight='bold', color='#059669')
    ax.text(0.85, 2.95, "RTechLab Traders LLP (Palanpur, Gujarat)", fontsize=7.8, weight='bold', color='#0F172A')
    ax.text(0.85, 2.75, "GSTIN: 24AAAFR1234A1Z5 (State Code: 24)", fontsize=7.2, fontfamily='monospace', weight='bold', color='#0369A1')
    ax.text(0.85, 2.55, "Place of Supply (POS): 24-Gujarat", fontsize=6.8, color='#475569')

    # Buyer Box
    b_box = patches.FancyBboxPatch((5.2, 2.3), 4.1, 1.05, boxstyle="round,pad=0.02", fc='#F0F9FF', ec='#BAE6FD', lw=1)
    ax.add_patch(b_box)
    ax.text(5.35, 3.15, "BUYER (Recipient):", fontsize=7, weight='bold', color='#0284C7')
    ax.text(5.35, 2.95, "Shree Balaji Electronics (Ahmedabad, Gujarat)", fontsize=7.8, weight='bold', color='#0F172A')
    ax.text(5.35, 2.75, "GSTIN: 24BBBCE5678B1Z2 (State Code: 24)", fontsize=7.2, fontfamily='monospace', weight='bold', color='#0369A1')
    ax.text(5.35, 2.55, "Invoice No: RTL/26-27/0084 | Date: 31-03-2027", fontsize=6.8, color='#475569', weight='bold')

    # Item Grid
    grid_headers = ["Item Description", "HSN/SAC", "Qty", "Rate (₹)", "Taxable (₹)", "CGST (9%)", "SGST (9%)", "Total (₹)"]
    xs = [0.7, 3.0, 3.9, 4.6, 5.5, 6.6, 7.6, 8.5]
    
    # Table Header Bar
    t_head = patches.Rectangle((0.7, 1.85), 8.6, 0.32, fc='#0F172A', ec='#0F172A')
    ax.add_patch(t_head)
    for i, h in enumerate(grid_headers):
        ax.text(xs[i] + (0.4 if i==0 else 0.3), 2.01, h, fontsize=6.5, weight='bold', color='white', ha='center')

    # Row 1: Commercial Commodity
    ax.text(0.8, 1.58, "1. Commercial APMC Jeera (Grade A)", fontsize=6.8, weight='bold', color='#0F172A')
    ax.text(3.3, 1.58, "0909", fontsize=6.8, fontfamily='monospace', color='#475569', ha='center')
    ax.text(4.2, 1.58, "100 Bags", fontsize=6.8, color='#475569', ha='center')
    ax.text(4.9, 1.58, "250.00", fontsize=6.8, color='#475569', ha='center')
    ax.text(5.9, 1.58, "25,000.00", fontsize=6.8, weight='bold', color='#0F172A', ha='center')
    ax.text(7.0, 1.58, "0.00 (0%)", fontsize=6.8, color='#059669', ha='center')
    ax.text(8.0, 1.58, "0.00 (0%)", fontsize=6.8, color='#059669', ha='center')
    ax.text(8.9, 1.58, "25,000.00", fontsize=6.8, weight='bold', color='#0F172A', ha='center')

    # Row 2: Standard GST Goods
    ax.text(0.8, 1.25, "2. Accounting Software & IT Service", fontsize=6.8, weight='bold', color='#0F172A')
    ax.text(3.3, 1.25, "9983", fontsize=6.8, fontfamily='monospace', color='#475569', ha='center')
    ax.text(4.2, 1.25, "1 License", fontsize=6.8, color='#475569', ha='center')
    ax.text(4.9, 1.25, "10,000.00", fontsize=6.8, color='#475569', ha='center')
    ax.text(5.9, 1.25, "10,000.00", fontsize=6.8, weight='bold', color='#0F172A', ha='center')
    ax.text(7.0, 1.25, "900.00", fontsize=6.8, color='#0284C7', ha='center')
    ax.text(8.0, 1.25, "900.00", fontsize=6.8, color='#0284C7', ha='center')
    ax.text(8.9, 1.25, "11,800.00", fontsize=6.8, weight='bold', color='#0284C7', ha='center')

    # Invoice Summary Footer
    tot_bar = patches.Rectangle((0.7, 0.6), 8.6, 0.42, fc='#F0FDF4', ec='#86EFAC', lw=1)
    ax.add_patch(tot_bar)
    ax.text(1.0, 0.81, "INVOICE TOTAL (IN WORDS): Thirty-Six Thousand Eight Hundred Only", fontsize=6.8, weight='bold', color='#059669')
    ax.text(8.9, 0.81, "₹ 36,800.00", fontsize=8.5, weight='black', color='#0F172A', ha='center')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 4.5)
    ax.axis('off')
    plt.tight_layout()
    out_file = os.path.join(output_dir, "gst_invoice_structure.png")
    plt.savefig(out_file, dpi=300)
    plt.close()
    print("Generated gst_invoice_structure.png")

if __name__ == "__main__":
    create_cheque_visual()
    create_gst_invoice_visual()
