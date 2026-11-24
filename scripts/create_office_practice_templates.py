# -*- coding: utf-8 -*-
import os
import openpyxl
from openpyxl.styles import Font, PatternFill, Alignment, Border, Side
from openpyxl.utils import get_column_letter

out_dir = r"c:\Users\Rahul\Videos\My projects\RtechLab\DIGITAL\OFFICE_365\02_PRACTICAL_EXCEL_TEMPLATES\files"
os.makedirs(out_dir, exist_ok=True)

# Styling palette
font_family = "Segoe UI"
header_fill = PatternFill(start_color="0F172A", end_color="0F172A", fill_type="solid") # Dark Navy
header_font = Font(name=font_family, size=11, bold=True, color="FFFFFF")
sub_header_fill = PatternFill(start_color="E2E8F0", end_color="E2E8F0", fill_type="solid") # Light Slate
sub_header_font = Font(name=font_family, size=10, bold=True, color="0F172A")
title_font = Font(name=font_family, size=16, bold=True, color="0F172A")
subtitle_font = Font(name=font_family, size=10, italic=True, color="64748B")
kpi_fill = PatternFill(start_color="F0FDFA", end_color="F0FDFA", fill_type="solid") # Mint
total_fill = PatternFill(start_color="FEF3C7", end_color="FEF3C7", fill_type="solid") # Light Amber
total_font = Font(name=font_family, size=11, bold=True, color="0F172A")

thin_border = Border(
    left=Side(style='thin', color='CBD5E1'),
    right=Side(style='thin', color='CBD5E1'),
    top=Side(style='thin', color='CBD5E1'),
    bottom=Side(style='thin', color='CBD5E1')
)

double_bottom_border = Border(
    left=Side(style='thin', color='CBD5E1'),
    right=Side(style='thin', color='CBD5E1'),
    top=Side(style='thin', color='CBD5E1'),
    bottom=Side(style='double', color='0F172A')
)

def autofit(ws):
    for col in ws.columns:
        max_len = 0
        col_letter = get_column_letter(col[0].column)
        for cell in col:
            # Skip merged cells in row 1-3
            if cell.row <= 3:
                continue
            val_str = str(cell.value or '')
            if cell.number_format and '₹' in cell.number_format:
                val_str += '   ₹'
            max_len = max(max_len, len(val_str))
        ws.column_dimensions[col_letter].width = max(max_len + 3, 11)

# ==============================================================================
# 1. CORPORATE SALARY SHEET & PAYROLL REGISTER
# ==============================================================================
def create_salary_sheet(wb=None):
    if wb is None:
        wb = openpyxl.Workbook()
        ws = wb.active
        ws.title = "Salary_Sheet"
    else:
        ws = wb.create_sheet(title="Salary_Sheet")
        
    ws.views.sheetView[0].showGridLines = True
    
    # Title Block
    ws.merge_cells("A1:N1")
    ws["A1"] = "RTECHLAB ENTERPRISE TECHNOLOGIES PVT. LTD."
    ws["A1"].font = title_font
    ws["A1"].alignment = Alignment(horizontal="left", vertical="center")
    
    ws.merge_cells("A2:N2")
    ws["A2"] = "Monthly Corporate Payroll & Statutory Compliance Register | Financial Year 2026-27"
    ws["A2"].font = subtitle_font
    ws["A2"].alignment = Alignment(horizontal="left", vertical="center")
    
    headers = [
        "Emp ID", "Employee Name", "Department", "Designation", 
        "Basic Pay (₹)", "HRA (₹)", "DA (₹)", "Spl Allowance (₹)", "Gross Salary (₹)",
        "EPF (12%)", "ESIC (0.75%)", "Prof Tax (₹)", "TDS (₹)", "Total Deductions (₹)", "Net Pay (₹)"
    ]
    
    # Header Row at row 4
    for col_idx, h in enumerate(headers, 1):
        cell = ws.cell(row=4, column=col_idx, value=h)
        cell.fill = header_fill
        cell.font = header_font
        cell.alignment = Alignment(horizontal="center", vertical="center", wrap_text=True)
        cell.border = thin_border
    ws.row_dimensions[4].height = 28
    
    employees = [
        ("RTL-101", "Aarav Sharma", "Engineering", "Principal AI Architect", 125000, 50000, 15000, 25000, 200, 18500),
        ("RTL-102", "Priya Patel", "Product", "Senior Product Manager", 95000, 38000, 11000, 18000, 200, 12500),
        ("RTL-103", "Rohan Mehta", "Cloud Infrastructure", "DevOps Lead", 85000, 34000, 10000, 15000, 200, 9500),
        ("RTL-104", "Ananya Iyer", "Data Science", "Senior ML Engineer", 80000, 32000, 9500, 14000, 200, 8500),
        ("RTL-105", "Vikram Singh", "Cybersecurity", "SOC Operations Analyst", 55000, 22000, 7000, 10000, 200, 4200),
        ("RTL-106", "Sneha Kulkarni", "Quality Assurance", "QA Automation Lead", 60000, 24000, 7500, 11000, 200, 5000),
        ("RTL-107", "Karan Verma", "Technical Support", "Network Administrator", 45000, 18000, 6000, 8000, 200, 2500),
        ("RTL-108", "Neha Deshmukh", "UI/UX Design", "Senior Product Designer", 68000, 27200, 8000, 12000, 200, 6200),
        ("RTL-109", "Aditya Nair", "Finance & Accounts", "Finance Controller", 75000, 30000, 9000, 13000, 200, 7800),
        ("RTL-110", "Pooja Joshi", "HR Operations", "Talent Acquisition Specialist", 48000, 19200, 6000, 8500, 200, 3000),
    ]
    
    start_row = 5
    for i, emp in enumerate(employees):
        row = start_row + i
        emp_id, name, dept, desig, basic, hra, da, spl, pt, tds = emp
        
        ws.cell(row=row, column=1, value=emp_id).alignment = Alignment(horizontal="center")
        ws.cell(row=row, column=2, value=name)
        ws.cell(row=row, column=3, value=dept)
        ws.cell(row=row, column=4, value=desig)
        
        # Earnings
        ws.cell(row=row, column=5, value=basic).number_format = '₹#,##0'
        ws.cell(row=row, column=6, value=hra).number_format = '₹#,##0'
        ws.cell(row=row, column=7, value=da).number_format = '₹#,##0'
        ws.cell(row=row, column=8, value=spl).number_format = '₹#,##0'
        
        # Gross Salary = SUM(Basic:Spl Allowance)
        gross_cell = ws.cell(row=row, column=9, value=f"=SUM(E{row}:H{row})")
        gross_cell.number_format = '₹#,##0'
        gross_cell.font = Font(name=font_family, bold=True)
        
        # Deductions
        # EPF: 12% of Basic, capped at standard statutory threshold or full
        epf_cell = ws.cell(row=row, column=10, value=f"=ROUND(E{row}*0.12, 0)")
        epf_cell.number_format = '₹#,##0'
        
        # ESIC: 0.75% of Gross if Gross <= 21000, else 0
        esic_cell = ws.cell(row=row, column=11, value=f"=IF(I{row}<=21000, ROUND(I{row}*0.0075, 0), 0)")
        esic_cell.number_format = '₹#,##0'
        
        # Professional Tax
        pt_cell = ws.cell(row=row, column=12, value=pt)
        pt_cell.number_format = '₹#,##0'
        
        # TDS
        tds_cell = ws.cell(row=row, column=13, value=tds)
        tds_cell.number_format = '₹#,##0'
        
        # Total Deductions = SUM(EPF, ESIC, PT, TDS)
        ded_cell = ws.cell(row=row, column=14, value=f"=SUM(J{row}:M{row})")
        ded_cell.number_format = '₹#,##0'
        ded_cell.font = Font(name=font_family, bold=True, color="DC2626")
        
        # Net Pay = Gross - Total Deductions
        net_cell = ws.cell(row=row, column=15, value=f"=I{row}-N{row}")
        net_cell.number_format = '₹#,##0'
        net_cell.font = Font(name=font_family, bold=True, color="059669")
        net_cell.fill = kpi_fill
        
        for c in range(1, 16):
            ws.cell(row=row, column=c).border = thin_border
            
    # Totals Row
    end_row = start_row + len(employees) - 1
    total_row = end_row + 1
    ws.merge_cells(f"A{total_row}:D{total_row}")
    ws[f"A{total_row}"] = "TOTAL MONTHLY DISBURSEMENT"
    ws[f"A{total_row}"].font = total_font
    ws[f"A{total_row}"].alignment = Alignment(horizontal="right", vertical="center")
    
    for c in range(5, 16):
        col_let = get_column_letter(c)
        cell = ws.cell(row=total_row, column=c, value=f"=SUM({col_let}{start_row}:{col_let}{end_row})")
        cell.font = total_font
        cell.fill = total_fill
        cell.number_format = '₹#,##0'
        cell.border = double_bottom_border
        
    for c in range(1, 5):
        ws.cell(row=total_row, column=c).fill = total_fill
        ws.cell(row=total_row, column=c).border = double_bottom_border

    autofit(ws)
    return wb

# ==============================================================================
# 2. ACADEMIC MARKSHEET & PERFORMANCE ANALYTICS
# ==============================================================================
def create_marksheet(wb=None):
    if wb is None:
        wb = openpyxl.Workbook()
        ws = wb.active
        ws.title = "Academic_Marksheet"
    else:
        ws = wb.create_sheet(title="Academic_Marksheet")
        
    ws.views.sheetView[0].showGridLines = True
    
    # Title Block
    ws.merge_cells("A1:L1")
    ws["A1"] = "RTECHLAB INSTITUTE OF ADVANCED TECHNOLOGY"
    ws["A1"].font = title_font
    ws["A1"].alignment = Alignment(horizontal="left", vertical="center")
    
    ws.merge_cells("A2:L2")
    ws["A2"] = "B.Tech Computer Science & AI — Semester VI Master Examination Grade Register"
    ws["A2"].font = subtitle_font
    ws["A2"].alignment = Alignment(horizontal="left", vertical="center")
    
    headers = [
        "Roll No", "Student Name", "Mathematics (100)", "Computer Networks (100)", 
        "Operating Systems (100)", "Machine Learning (100)", "Cloud Computing (100)",
        "Total Marks (500)", "Percentage (%)", "Result Status", "Grade Awarded", "Class Rank"
    ]
    
    for col_idx, h in enumerate(headers, 1):
        cell = ws.cell(row=4, column=col_idx, value=h)
        cell.fill = header_fill
        cell.font = header_font
        cell.alignment = Alignment(horizontal="center", vertical="center", wrap_text=True)
        cell.border = thin_border
    ws.row_dimensions[4].height = 28
    
    students = [
        ("CS-2027-01", "Aakash Varma", 95, 92, 88, 96, 94),
        ("CS-2027-02", "Bhavna Patel", 88, 85, 90, 89, 92),
        ("CS-2027-03", "Chirag Shah", 72, 68, 75, 70, 74),
        ("CS-2027-04", "Deepika Rao", 91, 94, 95, 98, 96),
        ("CS-2027-05", "Eshwar Sundaram", 64, 58, 62, 70, 65),
        ("CS-2027-06", "Fatima Sheikh", 82, 80, 86, 84, 88),
        ("CS-2027-07", "Gaurav Malhotra", 52, 45, 48, 55, 50),
        ("CS-2027-08", "Harshitha Gowda", 78, 82, 79, 85, 80),
        ("CS-2027-09", "Ishaan Roy", 38, 42, 35, 40, 45),
        ("CS-2027-10", "Jaspreet Kaur", 90, 88, 92, 91, 89)
    ]
    
    start_row = 5
    total_count = len(students)
    end_row = start_row + total_count - 1
    
    for i, st in enumerate(students):
        row = start_row + i
        roll, name, m1, m2, m3, m4, m5 = st
        
        ws.cell(row=row, column=1, value=roll).alignment = Alignment(horizontal="center")
        ws.cell(row=row, column=2, value=name)
        ws.cell(row=row, column=3, value=m1).alignment = Alignment(horizontal="center")
        ws.cell(row=row, column=4, value=m2).alignment = Alignment(horizontal="center")
        ws.cell(row=row, column=5, value=m3).alignment = Alignment(horizontal="center")
        ws.cell(row=row, column=6, value=m4).alignment = Alignment(horizontal="center")
        ws.cell(row=row, column=7, value=m5).alignment = Alignment(horizontal="center")
        
        # Total Marks = SUM(C:G)
        tot_cell = ws.cell(row=row, column=8, value=f"=SUM(C{row}:G{row})")
        tot_cell.font = Font(name=font_family, bold=True)
        tot_cell.alignment = Alignment(horizontal="center")
        
        # Percentage = Total / 500
        pct_cell = ws.cell(row=row, column=9, value=f"=H{row}/500")
        pct_cell.number_format = '0.00%'
        pct_cell.font = Font(name=font_family, bold=True)
        pct_cell.alignment = Alignment(horizontal="center")
        
        # Status = IF(MIN(C:G)>=35, "PASS", "FAIL")
        stat_cell = ws.cell(row=row, column=10, value=f'=IF(MIN(C{row}:G{row})>=35, "PASS", "FAIL")')
        stat_cell.font = Font(name=font_family, bold=True, color="059669")
        stat_cell.alignment = Alignment(horizontal="center")
        
        # Grade = IFS
        grade_formula = (
            f'=IFS(I{row}>=0.9, "A+", I{row}>=0.8, "A", I{row}>=0.7, "B+", '
            f'I{row}>=0.6, "B", I{row}>=0.5, "C", I{row}>=0.35, "D", TRUE, "F")'
        )
        grade_cell = ws.cell(row=row, column=11, value=grade_formula)
        grade_cell.font = Font(name=font_family, bold=True, color="1E40AF")
        grade_cell.alignment = Alignment(horizontal="center")
        
        # Class Rank = RANK.EQ(H5, $H$5:$H$14)
        rank_cell = ws.cell(row=row, column=12, value=f'=RANK.EQ(H{row}, $H${start_row}:$H${end_row})')
        rank_cell.font = Font(name=font_family, bold=True)
        rank_cell.alignment = Alignment(horizontal="center")
        rank_cell.fill = kpi_fill
        
        for c in range(1, 13):
            ws.cell(row=row, column=c).border = thin_border
            
    # Class Statistics Summary Block
    stat_start = end_row + 2
    ws.merge_cells(f"A{stat_start}:B{stat_start}")
    ws[f"A{stat_start}"] = "CLASS STATISTICAL SUMMARY"
    ws[f"A{stat_start}"].font = total_font
    ws[f"A{stat_start}"].fill = sub_header_fill
    
    stats = [
        ("Highest Aggregate Score (Class Topper)", f"=MAX(H{start_row}:H{end_row})", "0"),
        ("Lowest Aggregate Score", f"=MIN(H{start_row}:H{end_row})", "0"),
        ("Batch Average Percentage", f"=AVERAGE(I{start_row}:I{end_row})", "0.00%"),
        ("Total Passed Candidates", f'=COUNTIF(J{start_row}:J{end_row}, "PASS")', "0"),
        ("Pass Rate %", f'=COUNTIF(J{start_row}:J{end_row}, "PASS")/{total_count}', "0.0%")
    ]
    
    for s_idx, (label, form, nfmt) in enumerate(stats):
        r = stat_start + 1 + s_idx
        ws.merge_cells(f"A{r}:B{r}")
        ws[f"A{r}"] = label
        ws[f"A{r}"].font = Font(name=font_family, size=9.5, bold=True, color="334155")
        ws[f"A{r}"].border = thin_border
        
        val_cell = ws.cell(row=r, column=3, value=form)
        val_cell.font = Font(name=font_family, size=10, bold=True, color="0F172A")
        val_cell.fill = kpi_fill
        val_cell.alignment = Alignment(horizontal="center")
        val_cell.number_format = nfmt
        val_cell.border = thin_border
        
    autofit(ws)
    return wb

# ==============================================================================
# 3. B2B COMMERCIAL GST TAX INVOICE
# ==============================================================================
def create_b2b_gst_invoice(wb=None):
    if wb is None:
        wb = openpyxl.Workbook()
        ws = wb.active
        ws.title = "B2B_GST_Invoice"
    else:
        ws = wb.create_sheet(title="B2B_GST_Invoice")
        
    ws.views.sheetView[0].showGridLines = True
    
    # Header Banner
    ws.merge_cells("A1:J1")
    ws["A1"] = "TAX INVOICE (RULE 46 OF CGST RULES, 2017)"
    ws["A1"].font = Font(name=font_family, size=12, bold=True, color="FFFFFF")
    ws["A1"].fill = header_fill
    ws["A1"].alignment = Alignment(horizontal="center", vertical="center")
    ws.row_dimensions[1].height = 24
    
    # Supplier Details (Left) & Invoice Metadata (Right)
    ws["A2"] = "SUPPLIER DETAILS (ISSUING COMPANY)"
    ws["A2"].font = sub_header_font
    ws["A2"].fill = sub_header_fill
    ws.merge_cells("A2:E2")
    
    ws["F2"] = "INVOICE DETAILS & DISPATCH"
    ws["F2"].font = sub_header_font
    ws["F2"].fill = sub_header_fill
    ws.merge_cells("F2:J2")
    
    supplier_info = [
        ("Legal Entity:", "RTechLab Technologies Pvt. Ltd.", "Invoice No:", "RTL/2027/INV-0482"),
        ("Address:", "Tech Park Phase-II, S.G. Highway, Ahmedabad", "Invoice Date:", "2027-04-15"),
        ("GSTIN:", "24AAACR1234F1Z8", "Place of Supply:", "24 - Gujarat (State Code: 24)"),
        ("State & Code:", "Gujarat (24)", "Payment Mode:", "NEFT / RTGS (Net 30 Days)"),
        ("Email / Phone:", "billing@rtechlab.in | +91 76468 92094", "Purchase Order No:", "PO-INFOSYS-2027-891")
    ]
    
    for idx, row_data in enumerate(supplier_info, start=3):
        ws.cell(row=idx, column=1, value=row_data[0]).font = Font(name=font_family, size=9, bold=True, color="64748B")
        ws.cell(row=idx, column=2, value=row_data[1]).font = Font(name=font_family, size=9, bold=True)
        ws.merge_cells(f"B{idx}:E{idx}")
        
        ws.cell(row=idx, column=6, value=row_data[2]).font = Font(name=font_family, size=9, bold=True, color="64748B")
        ws.cell(row=idx, column=7, value=row_data[3]).font = Font(name=font_family, size=9, bold=True)
        ws.merge_cells(f"G{idx}:J{idx}")
        
    # Buyer Details
    b_row = 8
    ws.merge_cells(f"A{b_row}:J{b_row}")
    ws[f"A{b_row}"] = "BILLED TO / BUYER DETAILS"
    ws[f"A{b_row}"].font = sub_header_font
    ws[f"A{b_row}"].fill = sub_header_fill
    
    buyer_info = [
        ("Recipient Name:", "Infosys BPM Technologies Enterprise Division", "State & Code:", "Gujarat (Code: 24)"),
        ("Billing Address:", "Plot 42, Electronic City, Gandhinagar, Gujarat 382010", "Supply Category:", "B2B Commercial Standard"),
        ("Buyer GSTIN:", "24AABCI5678K1ZP", "Reverse Charge:", "NO (Tax Payable under Forward Charge)")
    ]
    for idx, (lbl1, val1, lbl2, val2) in enumerate(buyer_info, start=b_row+1):
        ws.cell(row=idx, column=1, value=lbl1).font = Font(name=font_family, size=9, bold=True, color="64748B")
        ws.cell(row=idx, column=2, value=val1).font = Font(name=font_family, size=9, bold=True)
        ws.merge_cells(f"B{idx}:E{idx}")
        
        ws.cell(row=idx, column=6, value=lbl2).font = Font(name=font_family, size=9, bold=True, color="64748B")
        ws.cell(row=idx, column=7, value=val2).font = Font(name=font_family, size=9, bold=True)
        ws.merge_cells(f"G{idx}:J{idx}")
        
    # Itemized Table Header
    item_header_row = 12
    headers = [
        "S.No", "Description of Goods / Technical Deliverable", "HSN/SAC", 
        "Qty", "Unit Rate (₹)", "Taxable Value (₹)", 
        "CGST (9%)", "SGST (9%)", "IGST (0%)", "Total Amount (₹)"
    ]
    for c_idx, h in enumerate(headers, 1):
        c = ws.cell(row=item_header_row, column=c_idx, value=h)
        c.fill = header_fill
        c.font = header_font
        c.alignment = Alignment(horizontal="center", vertical="center", wrap_text=True)
        c.border = thin_border
    ws.row_dimensions[item_header_row].height = 28
    
    items = [
        ("1", "Enterprise AI Architecture & LLM Engineering Handbook (Bulk License)", "998313", 100, 499),
        ("2", "Microsoft 365 Cloud Copilot & Power Automate Master Suite (Seat Access)", "998314", 50, 899),
        ("3", "Windows Server 2025 Active Directory Lab Manual & Practice Workbook", "998315", 40, 650),
        ("4", "On-Premises Dedicated GPU Server Optimization Consulting Hours", "998311", 15, 3500),
        ("5", "Automated Payroll & MIS Financial Template Engine Deployment", "998312", 5, 4500)
    ]
    
    start_item = 13
    for idx, itm in enumerate(items):
        r = start_item + idx
        sno, desc, hsn, qty, rate = itm
        ws.cell(row=r, column=1, value=int(sno)).alignment = Alignment(horizontal="center")
        ws.cell(row=r, column=2, value=desc)
        ws.cell(row=r, column=3, value=hsn).alignment = Alignment(horizontal="center")
        ws.cell(row=r, column=4, value=qty).alignment = Alignment(horizontal="center")
        
        rate_cell = ws.cell(row=r, column=5, value=rate)
        rate_cell.number_format = '₹#,##0.00'
        
        # Taxable Value = Qty * Rate
        tax_cell = ws.cell(row=r, column=6, value=f"=D{r}*E{r}")
        tax_cell.number_format = '₹#,##0.00'
        tax_cell.font = Font(name=font_family, bold=True)
        
        # CGST 9% = Taxable * 0.09
        cgst_cell = ws.cell(row=r, column=7, value=f"=F{r}*0.09")
        cgst_cell.number_format = '₹#,##0.00'
        
        # SGST 9% = Taxable * 0.09
        sgst_cell = ws.cell(row=r, column=8, value=f"=F{r}*0.09")
        sgst_cell.number_format = '₹#,##0.00'
        
        # IGST = 0 (Intra-state transaction)
        igst_cell = ws.cell(row=r, column=9, value=0)
        igst_cell.number_format = '₹#,##0.00'
        
        # Total = Taxable + CGST + SGST + IGST
        tot_cell = ws.cell(row=r, column=10, value=f"=SUM(F{r}:I{r})")
        tot_cell.number_format = '₹#,##0.00'
        tot_cell.font = Font(name=font_family, bold=True)
        
        for c in range(1, 11):
            ws.cell(row=r, column=c).border = thin_border
            
    end_item = start_item + len(items) - 1
    
    # Summary Totals Section
    tot_row = end_item + 1
    ws.merge_cells(f"A{tot_row}:E{tot_row}")
    ws[f"A{tot_row}"] = "TOTAL TAXABLE INVOICE VALUE"
    ws[f"A{tot_row}"].font = total_font
    ws[f"A{tot_row}"].alignment = Alignment(horizontal="right", vertical="center")
    ws[f"A{tot_row}"].fill = total_fill
    
    for c in range(1, 6):
        ws.cell(row=tot_row, column=c).border = thin_border
        ws.cell(row=tot_row, column=c).fill = total_fill
        
    for c in range(6, 11):
        col_let = get_column_letter(c)
        cell = ws.cell(row=tot_row, column=c, value=f"=SUM({col_let}{start_item}:{col_let}{end_item})")
        cell.font = total_font
        cell.fill = total_fill
        cell.number_format = '₹#,##0.00'
        cell.border = double_bottom_border
        
    # Grand Total Highlight
    gt_row = tot_row + 1
    ws.merge_cells(f"A{gt_row}:I{gt_row}")
    ws[f"A{gt_row}"] = "FINAL INVOICE AMOUNT PAYABLE (INR)"
    ws[f"A{gt_row}"].font = Font(name=font_family, size=11, bold=True, color="059669")
    ws[f"A{gt_row}"].alignment = Alignment(horizontal="right", vertical="center")
    
    gt_cell = ws.cell(row=gt_row, column=10, value=f"=J{tot_row}")
    gt_cell.font = Font(name=font_family, size=12, bold=True, color="059669")
    gt_cell.fill = kpi_fill
    gt_cell.number_format = '₹#,##0.00'
    gt_cell.border = double_bottom_border
    
    # Banking Details & Signatory
    bank_row = gt_row + 2
    ws.merge_cells(f"A{bank_row}:E{bank_row}")
    ws[f"A{bank_row}"] = "COMPANY BANKING DETAILS FOR NEFT/RTGS:"
    ws[f"A{bank_row}"].font = sub_header_font
    
    bank_info = [
        "Bank Name: HDFC Bank Ltd.",
        "Account Holder: RTechLab Technologies Private Limited",
        "Current A/c No: 50200089271638",
        "IFSC Code: HDFC0000482",
        "Branch: Corporate S.G. Highway, Ahmedabad"
    ]
    for b_idx, line in enumerate(bank_info):
        r = bank_row + 1 + b_idx
        ws.cell(row=r, column=1, value=line).font = Font(name=font_family, size=8.5, color="334155")
        ws.merge_cells(f"A{r}:E{r}")
        
    ws.merge_cells(f"G{bank_row}:J{bank_row}")
    ws[f"G{bank_row}"] = "For RTechLab Technologies Pvt. Ltd."
    ws[f"G{bank_row}"].font = sub_header_font
    ws[f"G{bank_row}"].alignment = Alignment(horizontal="center")
    
    sign_row = bank_row + 4
    ws.merge_cells(f"G{sign_row}:J{sign_row}")
    ws[f"G{sign_row}"] = "[Authorized Signatory & Corporate Seal]"
    ws[f"G{sign_row}"].font = Font(name=font_family, size=9, bold=True, color="64748B")
    ws[f"G{sign_row}"].alignment = Alignment(horizontal="center")

    autofit(ws)
    return wb

# ==============================================================================
# 4. RETAIL POS GST CASH MEMO & SALES RECEIPT
# ==============================================================================
def create_retail_pos_invoice(wb=None):
    if wb is None:
        wb = openpyxl.Workbook()
        ws = wb.active
        ws.title = "Retail_POS_Invoice"
    else:
        ws = wb.create_sheet(title="Retail_POS_Invoice")
        
    ws.views.sheetView[0].showGridLines = True
    
    # Retail Header
    ws.merge_cells("A1:H1")
    ws["A1"] = "RTECHLAB TECH STORE & DIGITAL LEARNING CENTER"
    ws["A1"].font = title_font
    ws["A1"].alignment = Alignment(horizontal="center")
    
    ws.merge_cells("A2:H2")
    ws["A2"] = "GST RETAIL CASH MEMO / TAX INVOICE (SIMPLIFIED TAX SCHEME)"
    ws["A2"].font = subtitle_font
    ws["A2"].alignment = Alignment(horizontal="center")
    
    # Metadata Box
    ws.cell(row=4, column=1, value="Receipt No:").font = Font(name=font_family, bold=True, size=9)
    ws.cell(row=4, column=2, value="REC-2027-9021").font = Font(name=font_family, size=9)
    ws.cell(row=4, column=4, value="Bill Date:").font = Font(name=font_family, bold=True, size=9)
    ws.cell(row=4, column=5, value="2027-04-18 16:45").font = Font(name=font_family, size=9)
    ws.cell(row=4, column=7, value="Cashier:").font = Font(name=font_family, bold=True, size=9)
    ws.cell(row=4, column=8, value="Rahul Patel (Station 02)").font = Font(name=font_family, size=9)
    
    ws.cell(row=5, column=1, value="Customer:").font = Font(name=font_family, bold=True, size=9)
    ws.cell(row=5, column=2, value="Walk-in Student / Retail Customer").font = Font(name=font_family, size=9)
    ws.cell(row=5, column=4, value="Payment:").font = Font(name=font_family, bold=True, size=9)
    ws.cell(row=5, column=5, value="UPI (PhonePe / GPay)").font = Font(name=font_family, size=9)
    ws.cell(row=5, column=7, value="GSTIN:").font = Font(name=font_family, bold=True, size=9)
    ws.cell(row=5, column=8, value="24AAACR1234F1Z8").font = Font(name=font_family, size=9)
    
    # Table Header
    headers = [
        "Item ID", "Description / Product Name", "HSN", "Qty", 
        "MRP Rate (₹)", "GST Slab", "GST Amount (₹)", "Net Total (₹)"
    ]
    for c_idx, h in enumerate(headers, 1):
        cell = ws.cell(row=7, column=c_idx, value=h)
        cell.fill = header_fill
        cell.font = header_font
        cell.alignment = Alignment(horizontal="center", vertical="center")
        cell.border = thin_border
    ws.row_dimensions[7].height = 25
    
    retail_items = [
        ("SKU-101", "Microsoft 365 Professional Quick Reference Card & Shortcut Mousepad", "4901", 2, 299, 0.18),
        ("SKU-102", "SanDisk 64GB Ultra High-Speed USB 3.2 Offline Study Vault Drive", "8523", 1, 649, 0.18),
        ("SKU-103", "RTechLab Official Spiral-Bound Computer Architecture Handbook", "4901", 1, 499, 0.05),
        ("SKU-104", "Logitech Silent Click Wireless Ergonomic Productivity Mouse", "8471", 1, 1199, 0.18),
        ("SKU-105", "High-Speed Type-C Gigabit Ethernet LAN Adapter (Realtek RTL8153)", "8517", 1, 850, 0.18)
    ]
    
    start_r = 8
    for idx, (sku, desc, hsn, qty, rate, gst_rate) in enumerate(retail_items):
        r = start_r + idx
        ws.cell(row=r, column=1, value=sku).alignment = Alignment(horizontal="center")
        ws.cell(row=r, column=2, value=desc)
        ws.cell(row=r, column=3, value=hsn).alignment = Alignment(horizontal="center")
        ws.cell(row=r, column=4, value=qty).alignment = Alignment(horizontal="center")
        
        ws.cell(row=r, column=5, value=rate).number_format = '₹#,##0.00'
        
        slab_cell = ws.cell(row=r, column=6, value=gst_rate)
        slab_cell.number_format = '0.0%'
        slab_cell.alignment = Alignment(horizontal="center")
        
        # GST Amount = (Qty * Rate) * (GST Slab)
        gst_amt_cell = ws.cell(row=r, column=7, value=f"=(D{r}*E{r})*F{r}")
        gst_amt_cell.number_format = '₹#,##0.00'
        
        # Net Total = (Qty * Rate) + GST Amount
        net_cell = ws.cell(row=r, column=8, value=f"=(D{r}*E{r})+G{r}")
        net_cell.number_format = '₹#,##0.00'
        net_cell.font = Font(name=font_family, bold=True)
        
        for c in range(1, 9):
            ws.cell(row=r, column=c).border = thin_border
            
    end_r = start_r + len(retail_items) - 1
    
    # Totals Row
    sum_r = end_r + 1
    ws.merge_cells(f"A{sum_r}:F{sum_r}")
    ws[f"A{sum_r}"] = "TOTAL RETAIL BILL (INCLUSIVE OF GST)"
    ws[f"A{sum_r}"].font = total_font
    ws[f"A{sum_r}"].alignment = Alignment(horizontal="right", vertical="center")
    ws[f"A{sum_r}"].fill = total_fill
    for c in range(1, 7):
        ws.cell(row=sum_r, column=c).border = thin_border
        ws.cell(row=sum_r, column=c).fill = total_fill
        
    tot_tax = ws.cell(row=sum_r, column=7, value=f"=SUM(G{start_r}:G{end_r})")
    tot_tax.font = total_font
    tot_tax.fill = total_fill
    tot_tax.number_format = '₹#,##0.00'
    tot_tax.border = double_bottom_border
    
    final_amt = ws.cell(row=sum_r, column=8, value=f"=SUM(H{start_r}:H{end_r})")
    final_amt.font = Font(name=font_family, size=12, bold=True, color="059669")
    final_amt.fill = kpi_fill
    final_amt.number_format = '₹#,##0.00'
    final_amt.border = double_bottom_border

    autofit(ws)
    return wb

# Create individual Excel files
wb_sal = create_salary_sheet()
sal_file = os.path.join(out_dir, "01_Corporate_Salary_Sheet_and_Payroll.xlsx")
wb_sal.save(sal_file)
print("Saved:", sal_file)

wb_mark = create_marksheet()
mark_file = os.path.join(out_dir, "02_Student_Academic_Marksheet_Analytics.xlsx")
wb_mark.save(mark_file)
print("Saved:", mark_file)

wb_b2b = create_b2b_gst_invoice()
b2b_file = os.path.join(out_dir, "03_B2B_Commercial_GST_Tax_Invoice.xlsx")
wb_b2b.save(b2b_file)
print("Saved:", b2b_file)

wb_pos = create_retail_pos_invoice()
pos_file = os.path.join(out_dir, "04_Retail_POS_GST_Cash_Memo.xlsx")
wb_pos.save(pos_file)
print("Saved:", pos_file)

# Create Master Multi-Sheet Workbook
master_wb = openpyxl.Workbook()
master_wb.remove(master_wb.active) # Remove default sheet
create_salary_sheet(master_wb)
create_marksheet(master_wb)
create_b2b_gst_invoice(master_wb)
create_retail_pos_invoice(master_wb)
master_file = os.path.join(out_dir, "Excel_365_Master_Practice_Templates_Suite.xlsx")
master_wb.save(master_file)
print("Saved Master Workbook:", master_file)
