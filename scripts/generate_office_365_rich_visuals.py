import os
import matplotlib.pyplot as plt
import matplotlib.patches as patches

output_dir = r"DIGITAL\OFFICE_365\07_SOURCE_FILES\02_BRAND_ASSETS"
os.makedirs(output_dir, exist_ok=True)

plt.rcParams['font.sans-serif'] = 'DejaVu Sans'

# -----------------------------------------------------------------------------
# 1. WORD CORPORATE ARCHITECTURE & RESUME/REPORT LAYOUT VISUAL
# -----------------------------------------------------------------------------
def create_word_visual():
    fig, ax = plt.subplots(figsize=(10, 4.0), dpi=300)
    fig.patch.set_facecolor('#F8FAFC')
    ax.set_facecolor('#F8FAFC')

    # Word App Window Frame
    win = patches.FancyBboxPatch((0.2, 0.2), 9.6, 3.6, boxstyle="round,pad=0.03", fc='#FFFFFF', ec='#1E293B', lw=1.6)
    ax.add_patch(win)

    # Word Blue Title Bar
    w_bar = patches.Rectangle((0.2, 3.4), 9.6, 0.4, fc='#185ABD', ec='#1E293B', lw=1)
    ax.add_patch(w_bar)
    ax.text(0.4, 3.6, "W  |  Corporate_Systems_Report_2027.docx - Word 365 Enterprise", fontsize=7.5, weight='bold', color='white', va='center')
    ax.text(9.4, 3.6, "AutoSave [ON]  ●", fontsize=7, weight='bold', color='#86EFAC', va='center', ha='right')

    # Ruler & Margins Guide
    ruler = patches.Rectangle((0.4, 3.15), 9.2, 0.2, fc='#F1F5F9', ec='#CBD5E1', lw=0.6)
    ax.add_patch(ruler)
    ax.text(0.5, 3.25, "| 1 | | 2 | | 3 | | 4 | | 5 | | 6 | | 7 | | 8 |  (1.0 Inch Margins Standard)", fontsize=5.8, fontfamily='monospace', color='#64748B', va='center')

    # Document Sheet Page 1 (Simulated Page View)
    page_rect = patches.Rectangle((0.5, 0.5), 4.3, 2.55, fc='#FFFFFF', ec='#94A3B8', lw=0.9)
    ax.add_patch(page_rect)

    # Content on Page 1
    # Heading 1
    h1_box = patches.Rectangle((0.65, 2.7), 4.0, 0.24, fc='#EFF6FF', ec='#185ABD', lw=0.8)
    ax.add_patch(h1_box)
    ax.text(0.75, 2.82, "1.0 EXECUTIVE PROFILE & ARCHITECTURE", fontsize=6.8, weight='black', color='#185ABD', va='center')

    # Text lines
    for i in range(3):
        ax.plot([0.65, 4.45], [2.55 - i * 0.12, 2.55 - i * 0.12], color='#94A3B8', lw=1.2)

    # Heading 2
    h2_box = patches.Rectangle((0.65, 2.1), 3.2, 0.2, fc='#F0FDF4', ec='#059669', lw=0.8)
    ax.add_patch(h2_box)
    ax.text(0.75, 2.2, "1.1 Multilevel Style Hierarchy Linked to Headings", fontsize=6.2, weight='bold', color='#059669', va='center')

    # Mini Table
    for r in range(3):
        t_row = patches.Rectangle((0.65, 1.7 - r * 0.16), 4.0, 0.15, fc='#F8FAFC' if r%2==0 else 'white', ec='#CBD5E1', lw=0.5)
        ax.add_patch(t_row)
    ax.text(0.75, 1.77, "Skill Track", fontsize=5.5, weight='bold', color='#0F172A')
    ax.text(2.2, 1.77, "Enterprise Proficiency", fontsize=5.5, weight='bold', color='#0F172A')
    ax.text(3.5, 1.77, "Certification", fontsize=5.5, weight='bold', color='#0F172A')

    # Section Break Divider
    sb_line = patches.Rectangle((0.6, 1.05), 4.1, 0.22, fc='#FEF3C7', ec='#D97706', lw=1, ls='--')
    ax.add_patch(sb_line)
    ax.text(2.65, 1.16, "✂ SECTION BREAK (Next Page: Decoupled Landscape Annexure)", fontsize=5.5, weight='black', color='#B45309', ha='center', va='center')

    # Document Sheet Page 2 (Landscape orientation)
    page2_rect = patches.Rectangle((5.0, 0.8), 4.6, 2.25, fc='#FFFFFF', ec='#107C41', lw=1.2)
    ax.add_patch(page2_rect)
    p2_badge = patches.Rectangle((5.0, 2.8), 4.6, 0.25, fc='#DCFCE7', ec='#107C41', lw=0.8)
    ax.add_patch(p2_badge)
    ax.text(7.3, 2.92, "LANDSCAPE ANNEXURE: COMMERCIAL FINANCIAL MATRIX", fontsize=6.2, weight='black', color='#166534', ha='center', va='center')

    # Big Table on Page 2
    for r in range(5):
        t2_row = patches.Rectangle((5.2, 2.4 - r * 0.28), 4.2, 0.25, fc='#F1F5F9' if r==0 else ('#F8FAFC' if r%2==1 else 'white'), ec='#1E293B', lw=0.7)
        ax.add_patch(t2_row)
    ax.text(5.4, 2.52, "Qtr", fontsize=5.8, weight='black', color='#0F172A')
    ax.text(6.0, 2.52, "Gross Rev (₹)", fontsize=5.8, weight='black', color='#0F172A')
    ax.text(7.1, 2.52, "GST 18% (₹)", fontsize=5.8, weight='black', color='#0F172A')
    ax.text(8.3, 2.52, "Net Profit Margin", fontsize=5.8, weight='black', color='#0F172A')

    # Status Bar
    s_bar = patches.Rectangle((0.2, 0.2), 9.6, 0.25, fc='#F1F5F9', ec='#CBD5E1', lw=0.6)
    ax.add_patch(s_bar)
    ax.text(0.4, 0.32, "Page 1 of 2  |  412 words  |  English (India)  |  Display: Print Layout", fontsize=5.8, color='#64748B', va='center')
    ax.text(9.4, 0.32, "Macro Enabled  |  Zoom: 100% [—+—]", fontsize=5.8, color='#64748B', va='center', ha='right')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 4.0)
    ax.axis('off')
    plt.tight_layout()
    out = os.path.join(output_dir, "word_document_layout_visual.png")
    plt.savefig(out, dpi=300)
    plt.close()
    print("Generated word_document_layout_visual.png")


# -----------------------------------------------------------------------------
# 2. EXCEL ADVANCED DYNAMIC ARRAY GRID & FORMULA BAR VISUAL
# -----------------------------------------------------------------------------
def create_excel_visual():
    fig, ax = plt.subplots(figsize=(10, 4.0), dpi=300)
    fig.patch.set_facecolor('#F8FAFC')
    ax.set_facecolor('#F8FAFC')

    # Window
    win = patches.FancyBboxPatch((0.2, 0.2), 9.6, 3.6, boxstyle="round,pad=0.03", fc='#FFFFFF', ec='#1E293B', lw=1.6)
    ax.add_patch(win)

    # Title Bar
    t_bar = patches.Rectangle((0.2, 3.4), 9.6, 0.4, fc='#107C41', ec='#1E293B', lw=1)
    ax.add_patch(t_bar)
    ax.text(0.4, 3.6, "X  |  Enterprise_Payroll_Matrix_2027.xlsx - Excel 365 Dynamic Engine", fontsize=7.5, weight='bold', color='white', va='center')
    ax.text(9.4, 3.6, "AutoSave [ON] · Spill Engine Ready", fontsize=7, weight='bold', color='#DCFCE7', va='center', ha='right')

    # Formula Bar
    f_bar = patches.Rectangle((0.4, 2.95), 9.2, 0.35, fc='#FFFFFF', ec='#1E293B', lw=0.9)
    ax.add_patch(f_bar)
    ax.text(0.55, 3.12, "fx", fontsize=8.5, weight='bold', color='#64748B', fontfamily='serif', va='center')
    ax.plot([0.8, 0.8], [2.98, 3.27], color='#CBD5E1', lw=1)
    ax.text(0.95, 3.12, '=XLOOKUP(F2, A2:A100, B2:D100, "Employee Not Found", 0, 1)', fontsize=7.2, fontfamily='monospace', weight='black', color='#107C41', va='center')

    # Grid Headers (A, B, C, D, E, F, G)
    cols = [("A", "Emp ID", 1.0), ("B", "Name", 1.8), ("C", "Department", 1.5), ("D", "CTC (₹)", 1.2), ("E", "Target ID", 1.0), ("F:H", "Dynamic Spill Array Result (=A2#)", 2.4)]
    x = 0.5
    y = 2.6
    for c_id, c_title, w in cols:
        hdr = patches.Rectangle((x, y), w, 0.28, fc='#0F172A', ec='#1E293B', lw=0.8)
        ax.add_patch(hdr)
        ax.text(x + w/2, y + 0.14, f"{c_id} · {c_title}", fontsize=5.8, weight='bold', color='white', ha='center', va='center')
        x += w + 0.04

    # Data Rows
    rows_data = [
        ("101", "Rahul Patel", "Cloud Arch", "₹14,50,000", "102", "Amit Shah", "MIS Analytics", "₹8,40,000"),
        ("102", "Amit Shah", "MIS Analytics", "₹8,40,000", "", "", "", ""),
        ("103", "Priya Verma", "GST Finance", "₹9,20,000", "Spill Indicator:", "Blue border shows", "live multi-column", "spill array"),
        ("104", "Rohan Mehta", "DevOps Eng", "₹12,80,000", "", "", "", ""),
        ("105", "Neha Joshi", "HR Ops", "₹6,50,000", "Formula:", "=LET(x, A2#, SUM(x))", "Speed: 5x", "Zero CSE!"),
    ]

    for r_idx, r_vals in enumerate(rows_data):
        rx = 0.5
        ry = 2.25 - r_idx * 0.32
        for c_idx, (_, _, w) in enumerate(cols):
            # If in spill result zone (columns index 5)
            is_spill = (c_idx == 5 and r_idx == 0)
            cell_fc = '#EFF6FF' if is_spill else ('#F8FAFC' if r_idx%2==1 else 'white')
            cell_ec = '#0284C7' if is_spill else '#334155'
            cell = patches.Rectangle((rx, ry), w, 0.29, fc=cell_fc, ec=cell_ec, lw=1.4 if is_spill else 0.6)
            ax.add_patch(cell)

            # Draw text
            if c_idx < 4:
                val = r_vals[c_idx]
                ax.text(rx + 0.08, ry + 0.14, val, fontsize=6.2, weight='bold' if c_idx==0 else 'normal', color='#0F172A', va='center')
            elif c_idx == 4:
                val = r_vals[4]
                ax.text(rx + w/2, ry + 0.14, val, fontsize=6.2, weight='black', color='#B45309', ha='center', va='center')
            elif c_idx == 5:
                val = "  |  ".join(r_vals[5:8]) if r_vals[5] else ""
                ax.text(rx + 0.08, ry + 0.14, val, fontsize=6.2, weight='black' if is_spill else 'normal', color='#0284C7' if is_spill else '#475569', va='center')

            rx += w + 0.04

    # Spill Boundary Outline Callout
    spill_box = patches.FancyBboxPatch((6.85, 1.25), 2.75, 1.32, boxstyle="round,pad=0.03", fc='none', ec='#0284C7', lw=1.8, ls='-')
    ax.add_patch(spill_box)
    ax.text(8.22, 0.98, "⚡ Dynamic Array Multi-Column Result (Automated Spill Bounding Box)", fontsize=5.5, weight='black', color='#0284C7', ha='center')

    # Status Bar
    s_bar = patches.Rectangle((0.2, 0.2), 9.6, 0.25, fc='#F1F5F9', ec='#CBD5E1', lw=0.6)
    ax.add_patch(s_bar)
    ax.text(0.4, 0.32, "READY  |  Sheet1 (Payroll)  |  Average: ₹10,28,000  |  Count: 5  |  Sum: ₹51,40,000", fontsize=5.8, weight='bold', color='#334155', va='center')
    ax.text(9.4, 0.32, "Calculation: Automatic (LET Engine)  |  100%", fontsize=5.8, color='#334155', va='center', ha='right')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 4.0)
    ax.axis('off')
    plt.tight_layout()
    out = os.path.join(output_dir, "excel_dynamic_array_grid.png")
    plt.savefig(out, dpi=300)
    plt.close()
    print("Generated excel_dynamic_array_grid.png")


# -----------------------------------------------------------------------------
# 3. POWERPOINT SLIDE MASTER & CINEMATIC MORPH COMPARISON VISUAL
# -----------------------------------------------------------------------------
def create_powerpoint_visual():
    fig, ax = plt.subplots(figsize=(10, 3.8), dpi=300)
    fig.patch.set_facecolor('#F8FAFC')
    ax.set_facecolor('#F8FAFC')

    # Outer Frame
    win = patches.FancyBboxPatch((0.2, 0.2), 9.6, 3.4, boxstyle="round,pad=0.03", fc='#FFFFFF', ec='#1E293B', lw=1.6)
    ax.add_patch(win)

    # Title Bar
    t_bar = patches.Rectangle((0.2, 3.2), 9.6, 0.4, fc='#C43E1C', ec='#1E293B', lw=1)
    ax.add_patch(t_bar)
    ax.text(0.4, 3.4, "P  |  Executive_Pitch_Deck_Master_2027.pptx - PowerPoint 365", fontsize=7.5, weight='bold', color='white', va='center')
    ax.text(9.4, 3.4, "16:9 Widescreen  |  Slide Master Locked", fontsize=7, weight='bold', color='#FED7AA', va='center', ha='right')

    # Slide 1 (Before Morph)
    s1 = patches.Rectangle((0.5, 0.6), 3.8, 2.3, fc='#0F172A', ec='#1E293B', lw=1.4)
    ax.add_patch(s1)
    ax.text(0.65, 2.65, "SLIDE 01 (ORIGIN)", fontsize=6.5, weight='black', color='#38BDF8')
    ax.text(0.65, 2.45, "Enterprise Modern Architecture", fontsize=7.5, weight='bold', color='white')

    # Object 1 on Slide 1
    kpi1 = patches.FancyBboxPatch((0.7, 1.0), 1.6, 1.1, boxstyle="round,pad=0.03", fc='#1E293B', ec='#0284C7', lw=1.2)
    ax.add_patch(kpi1)
    ax.text(1.5, 1.8, "KPI 01", fontsize=6, weight='bold', color='#94A3B8', ha='center')
    ax.text(1.5, 1.45, "+370%", fontsize=11, weight='black', color='#38BDF8', ha='center')
    ax.text(1.5, 1.15, "Annual Efficiency", fontsize=5.5, color='white', ha='center')

    # Small shape with !!Logo tag
    shp1 = patches.Circle((3.2, 1.55), 0.45, fc='#0284C7', ec='white', lw=1)
    ax.add_patch(shp1)
    ax.text(3.2, 1.55, "!!Logo", fontsize=6.2, weight='black', color='white', ha='center', va='center')

    # Morph Arrow Transition Middle
    ax.annotate('', xy=(5.5, 1.75), xytext=(4.5, 1.75),
                arrowprops=dict(arrowstyle="->", lw=2.5, color='#C43E1C', mutation_scale=18))
    ax.text(5.0, 2.05, "MORPH", fontsize=8.5, weight='black', color='#C43E1C', ha='center')
    ax.text(5.0, 1.45, "0.75s Duration\nAutomatic Flow", fontsize=5.8, weight='bold', color='#64748B', ha='center')

    # Slide 2 (After Morph)
    s2 = patches.Rectangle((5.7, 0.6), 3.8, 2.3, fc='#0F172A', ec='#1E293B', lw=1.4)
    ax.add_patch(s2)
    ax.text(5.85, 2.65, "SLIDE 02 (CINEMATIC TARGET)", fontsize=6.5, weight='black', color='#4ADE80')
    ax.text(5.85, 2.45, "Deep-Dive Focus on Efficiency KPI", fontsize=7.5, weight='bold', color='white')

    # Enlarged Object on Slide 2
    kpi2 = patches.FancyBboxPatch((5.9, 0.8), 2.2, 1.45, boxstyle="round,pad=0.03", fc='#1E293B', ec='#22C55E', lw=1.6)
    ax.add_patch(kpi2)
    ax.text(7.0, 1.95, "DEEP ZOOM FOCUS", fontsize=6.2, weight='bold', color='#86EFAC', ha='center')
    ax.text(7.0, 1.55, "+370%", fontsize=16, weight='black', color='#4ADE80', ha='center')
    ax.text(7.0, 1.2, "Compound Speed Multiplier", fontsize=6, weight='bold', color='white', ha='center')

    # Transformed Shape on Slide 2
    shp2 = patches.RegularPolygon((8.7, 1.55), 5, radius=0.55, fc='#22C55E', ec='white', lw=1)
    ax.add_patch(shp2)
    ax.text(8.7, 1.55, "!!Logo", fontsize=6.2, weight='black', color='#0F172A', ha='center', va='center')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 3.8)
    ax.axis('off')
    plt.tight_layout()
    out = os.path.join(output_dir, "powerpoint_slide_master_morph.png")
    plt.savefig(out, dpi=300)
    plt.close()
    print("Generated powerpoint_slide_master_morph.png")


# -----------------------------------------------------------------------------
# 4. OUTLOOK & CLOUD / ONEDRIVE GOVERNANCE & 4D TRIAGE VISUAL
# -----------------------------------------------------------------------------
def create_cloud_outlook_visual():
    fig, ax = plt.subplots(figsize=(10, 3.8), dpi=300)
    fig.patch.set_facecolor('#F8FAFC')
    ax.set_facecolor('#F8FAFC')

    # Outer Box
    box = patches.FancyBboxPatch((0.2, 0.2), 9.6, 3.4, boxstyle="round,pad=0.03", fc='#FFFFFF', ec='#1E293B', lw=1.6)
    ax.add_patch(box)

    # Header Bar
    h_bar = patches.Rectangle((0.2, 3.15), 9.6, 0.45, fc='#0078D4', ec='#1E293B', lw=1)
    ax.add_patch(h_bar)
    ax.text(0.4, 3.37, "☁  |  Microsoft 365 Cloud Ecosystem · OneDrive Enterprise & 4D Inbox Zero Workflow", fontsize=7.5, weight='bold', color='white', va='center')

    # Left: 4D Decision Matrix (Triage Workflow)
    ax.text(2.6, 2.9, "THE 4D INBOX ZERO TRIAGE FLOW", fontsize=7.5, weight='black', color='#0F172A', ha='center')

    triage_cards = [
        ("1. DO IT NOW", "< 2 Minutes Task", "#EFF6FF", "#0284C7", 0.4, 1.7),
        ("2. DELEGATE", "Assign & @WaitingFor", "#F0FDF4", "#059669", 2.6, 1.7),
        ("3. DEFER", "Book Calendar Slot", "#FEF3C7", "#D97706", 0.4, 0.5),
        ("4. ARCHIVE", "Backspace / Delete", "#FFE4E6", "#E11D48", 2.6, 0.5),
    ]

    for title, desc, fc, ec, cx, cy in triage_cards:
        c_patch = patches.FancyBboxPatch((cx, cy), 2.05, 0.95, boxstyle="round,pad=0.03", fc=fc, ec=ec, lw=1.2)
        ax.add_patch(c_patch)
        ax.text(cx + 1.02, cy + 0.65, title, fontsize=6.8, weight='black', color=ec, ha='center')
        ax.text(cx + 1.02, cy + 0.32, desc, fontsize=5.8, color='#334155', ha='center')

    # Center Divider
    ax.plot([4.9, 4.9], [0.4, 2.95], color='#CBD5E1', lw=1.2, ls=':')

    # Right: OneDrive Cloud Storage & Version History Badges
    ax.text(7.4, 2.9, "ONEDRIVE 1TB ENTERPRISE GOVERNANCE", fontsize=7.5, weight='black', color='#0078D4', ha='center')

    od_items = [
        ("☁ Blue Cloud Icon", "Online-Only File (0 KB Local Disk Usage, Click to Stream)", "#0284C7"),
        ("✓ Green Circle Check", "Locally Available on Hard Disk (Offline Access Enabled)", "#059669"),
        ("● Solid Green Check", "Always Keep On This Device (Critical Corporate Database)", "#166534"),
        ("⟲ Version History", "Rollback 30+ Past Iterations in 1-Click (Ransomware Proof)", "#D97706"),
    ]

    for i, (head, sub, clr) in enumerate(od_items):
        by = 2.35 - i * 0.58
        b_box = patches.FancyBboxPatch((5.1, by), 4.5, 0.48, boxstyle="round,pad=0.02", fc='#F8FAFC', ec='#CBD5E1', lw=0.8)
        ax.add_patch(b_box)
        ax.text(5.25, by + 0.28, head, fontsize=6.5, weight='black', color=clr, va='center')
        ax.text(5.25, by + 0.12, sub, fontsize=5.5, color='#475569', va='center')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 3.8)
    ax.axis('off')
    plt.tight_layout()
    out = os.path.join(output_dir, "outlook_cloud_workflow_visual.png")
    plt.savefig(out, dpi=300)
    plt.close()
    print("Generated outlook_cloud_workflow_visual.png")

if __name__ == "__main__":
    create_word_visual()
    create_excel_visual()
    create_powerpoint_visual()
    create_cloud_outlook_visual()
    print("All 4 rich enterprise visuals generated successfully!")
