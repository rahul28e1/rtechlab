# -*- coding: utf-8 -*-
import os
import docx
from docx.shared import Inches, Pt, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT, WD_ALIGN_VERTICAL
from docx.oxml import OxmlElement, parse_xml
from docx.oxml.ns import nsdecls, qn

out_dir = r"c:\Users\Rahul\Videos\My projects\RtechLab\DIGITAL\OFFICE_365\02_PRACTICAL_EXCEL_TEMPLATES\word_templates"
os.makedirs(out_dir, exist_ok=True)

def set_cell_background(cell, hex_color):
    tcPr = cell._tc.get_or_add_tcPr()
    shd = parse_xml(f'<w:shd {nsdecls("w")} w:fill="{hex_color}"/>')
    tcPr.append(shd)

def set_cell_margins(cell, top=100, bottom=100, left=150, right=150):
    tcPr = cell._tc.get_or_add_tcPr()
    tcMar = parse_xml(f'''
        <w:tcMar {nsdecls("w")}>
            <w:top w:w="{top}" w:type="dxa"/>
            <w:bottom w:w="{bottom}" w:type="dxa"/>
            <w:left w:w="{left}" w:type="dxa"/>
            <w:right w:w="{right}" w:type="dxa"/>
        </w:tcMar>
    ''')
    tcPr.append(tcMar)

# ==============================================================================
# 1. EXECUTIVE REPORT COVER PAGE TEMPLATE (.docx)
# ==============================================================================
def create_cover_page_template():
    doc = docx.Document()
    
    # Page setup
    section = doc.sections[0]
    section.top_margin = Inches(0.8)
    section.bottom_margin = Inches(0.8)
    section.left_margin = Inches(0.8)
    section.right_margin = Inches(0.8)
    
    # Top Accent Header Bar
    top_table = doc.add_table(rows=1, cols=2)
    top_table.alignment = WD_TABLE_ALIGNMENT.CENTER
    top_table.autofit = False
    
    cell_l = top_table.rows[0].cells[0]
    cell_l.width = Inches(4.5)
    p_l = cell_l.paragraphs[0]
    p_l.alignment = WD_ALIGN_PARAGRAPH.LEFT
    r_l = p_l.add_run("RTECHLAB ENTERPRISE PUBLICATIONS")
    r_l.font.name = "Segoe UI"
    r_l.font.size = Pt(9.5)
    r_l.font.bold = True
    r_l.font.color.rgb = RGBColor(15, 23, 42)
    
    cell_r = top_table.rows[0].cells[1]
    cell_r.width = Inches(2.4)
    p_r = cell_r.paragraphs[0]
    p_r.alignment = WD_ALIGN_PARAGRAPH.RIGHT
    r_r = p_r.add_run("ANNUAL CAPSTONE SPECIMEN")
    r_r.font.name = "Segoe UI"
    r_r.font.size = Pt(8.5)
    r_r.font.bold = True
    r_r.font.color.rgb = RGBColor(2, 132, 199)
    
    # Divider Line
    p_div = doc.add_paragraph()
    p_div.paragraph_format.space_before = Pt(4)
    p_div.paragraph_format.space_after = Pt(40)
    
    # Document Category Tag
    p_tag = doc.add_paragraph()
    p_tag.paragraph_format.space_after = Pt(8)
    r_tag = p_tag.add_run("ENTERPRISE TECHNICAL SPECIFICATION · 2027 ARCHITECTURE")
    r_tag.font.name = "Segoe UI"
    r_tag.font.size = Pt(10)
    r_tag.font.bold = True
    r_tag.font.color.rgb = RGBColor(2, 132, 199)
    
    # Document Main Title
    p_title = doc.add_paragraph()
    p_title.paragraph_format.space_after = Pt(12)
    r_title = p_title.add_run("Enterprise Cloud Infrastructure & Artificial Intelligence Strategy")
    r_title.font.name = "Segoe UI"
    r_title.font.size = Pt(28)
    r_title.font.bold = True
    r_title.font.color.rgb = RGBColor(15, 23, 42)
    
    # Subtitle
    p_sub = doc.add_paragraph()
    p_sub.paragraph_format.space_after = Pt(24)
    r_sub = p_sub.add_run("A Comprehensive Operational Blueprint for Zero-Trust Active Directory, Hybrid Cloud Migration, and Private Sovereign LLM Deployment")
    r_sub.font.name = "Segoe UI"
    r_sub.font.size = Pt(13)
    r_sub.font.italic = True
    r_sub.font.color.rgb = RGBColor(100, 116, 139)
    
    # Colored Banner Callout
    banner = doc.add_table(rows=1, cols=1)
    banner.alignment = WD_TABLE_ALIGNMENT.CENTER
    b_cell = banner.rows[0].cells[0]
    b_cell.width = Inches(6.9)
    set_cell_background(b_cell, "F0F9FF")
    set_cell_margins(b_cell, top=150, bottom=150, left=200, right=200)
    
    p_b = b_cell.paragraphs[0]
    r_b = p_b.add_run("DOCUMENT CONTROL & AUDIT VALIDATION:\n")
    r_b.font.name = "Segoe UI"
    r_b.font.size = Pt(9.5)
    r_b.font.bold = True
    r_b.font.color.rgb = RGBColor(2, 132, 199)
    
    r_b2 = p_b.add_run("This technical document is prepared in accordance with Fortune 500 corporate IT documentation standards. All architectural diagrams, Active Directory schemas, and financial models are validated for ISO 27001 compliance.")
    r_b2.font.name = "Segoe UI"
    r_b2.font.size = Pt(9)
    r_b2.font.color.rgb = RGBColor(51, 65, 85)
    
    p_sp = doc.add_paragraph()
    p_sp.paragraph_format.space_before = Pt(80)
    
    # Bottom Metadata Box
    meta_table = doc.add_table(rows=4, cols=2)
    meta_table.alignment = WD_TABLE_ALIGNMENT.CENTER
    meta_table.autofit = False
    
    meta_data = [
        ("AUTHOR & LEAD ARCHITECT:", "Rahul Patel (Founder & Chief Technology Architect)"),
        ("PREPARED FOR / CLIENT:", "Enterprise Executive Board & Technical Steering Committee"),
        ("RELEASE DATE & VERSION:", "April 15, 2027 | Release Version 5.2.0 (Certified)"),
        ("SECURITY CLASSIFICATION:", "STRICTLY CONFIDENTIAL · INTERNAL ENTERPRISE REVIEW ONLY")
    ]
    
    for row_idx, (lbl, val) in enumerate(meta_data):
        c1 = meta_table.rows[row_idx].cells[0]
        c1.width = Inches(2.3)
        p1 = c1.paragraphs[0]
        r1 = p1.add_run(lbl)
        r1.font.name = "Segoe UI"
        r1.font.size = Pt(8.5)
        r1.font.bold = True
        r1.font.color.rgb = RGBColor(100, 116, 139)
        
        c2 = meta_table.rows[row_idx].cells[1]
        c2.width = Inches(4.6)
        p2 = c2.paragraphs[0]
        r2 = p2.add_run(val)
        r2.font.name = "Segoe UI"
        r2.font.size = Pt(9)
        r2.font.bold = True
        r2.font.color.rgb = RGBColor(15, 23, 42)
        
    out_path = os.path.join(out_dir, "01_Executive_Report_Cover_Page_Template.docx")
    doc.save(out_path)
    print("Saved Cover Page Template:", out_path)

# ==============================================================================
# 2. ATS-OPTIMIZED PROFESSIONAL TECH RESUME TEMPLATE (.docx)
# ==============================================================================
def create_ats_resume_template():
    doc = docx.Document()
    
    # Standard 0.5-inch margins for modern professional 1-page/2-page resumes
    section = doc.sections[0]
    section.top_margin = Inches(0.5)
    section.bottom_margin = Inches(0.5)
    section.left_margin = Inches(0.6)
    section.right_margin = Inches(0.6)
    
    # Header: Name & Contact Info
    p_name = doc.add_paragraph()
    p_name.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_name.paragraph_format.space_after = Pt(2)
    r_name = p_name.add_run("RAHUL PATEL")
    r_name.font.name = "Calibri"
    r_name.font.size = Pt(22)
    r_name.font.bold = True
    r_name.font.color.rgb = RGBColor(15, 23, 42)
    
    p_title = doc.add_paragraph()
    p_title.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_title.paragraph_format.space_after = Pt(4)
    r_title = p_title.add_run("Senior Cloud Systems Engineer & Data Architecture Lead")
    r_title.font.name = "Calibri"
    r_title.font.size = Pt(11.5)
    r_title.font.bold = True
    r_title.font.color.rgb = RGBColor(2, 132, 199)
    
    p_contact = doc.add_paragraph()
    p_contact.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_contact.paragraph_format.space_after = Pt(12)
    r_contact = p_contact.add_run("Ahmedabad, Gujarat, India · +91 76468 92094 · rahul.28e1@gmail.com · linkedin.com/in/rahul-patel · github.com/rahulpatel")
    r_contact.font.name = "Calibri"
    r_contact.font.size = Pt(9.5)
    r_contact.font.color.rgb = RGBColor(71, 85, 105)
    
    def add_section_header(title):
        p = doc.add_paragraph()
        p.paragraph_format.space_before = Pt(10)
        p.paragraph_format.space_after = Pt(3)
        r = p.add_run(title.upper())
        r.font.name = "Calibri"
        r.font.size = Pt(11)
        r.font.bold = True
        r.font.color.rgb = RGBColor(15, 23, 42)
        
        # Bottom border under section header
        pBdr = parse_xml(f'''
            <w:pBdr {nsdecls("w")}>
                <w:bottom w:val="single" w:sz="6" w:space="2" w:color="0284C7"/>
            </w:pBdr>
        ''')
        p._p.get_or_add_pPr().append(pBdr)

    # 1. Professional Executive Summary
    add_section_header("Professional Summary")
    p_sum = doc.add_paragraph()
    p_sum.paragraph_format.space_after = Pt(6)
    r_sum = p_sum.add_run(
        "Results-driven Senior Systems Engineer with 5+ years of experience architecting high-availability hybrid cloud networks, "
        "managing enterprise Active Directory deployments for 10,000+ endpoints, and engineering automated data pipelines. "
        "Proven track record of optimizing system uptime to 99.99%, reducing cloud compute expenditures by 35% through containerization, "
        "and deploying private LLM retrieval-augmented generation (RAG) microservices in production environments."
    )
    r_sum.font.name = "Calibri"
    r_sum.font.size = Pt(9.5)
    r_sum.font.color.rgb = RGBColor(30, 41, 59)
    
    # 2. Core Technical Competencies
    add_section_header("Technical Skills & Competencies")
    skills_table = doc.add_table(rows=3, cols=2)
    skills_table.autofit = False
    skills_table.alignment = WD_TABLE_ALIGNMENT.CENTER
    
    skills = [
        ("Cloud & Operating Systems:", "Windows Server 2025, Linux (RHEL/Ubuntu), AWS (EC2, S3, IAM, VPC), Microsoft Azure"),
        ("Systems & Identity:", "Active Directory DS, Group Policy (GPO), DNS/DHCP, Entra ID, Kerberos, LDAP, SSO"),
        ("Data & Productive Automation:", "Advanced Excel 365 (Power Query, XLOOKUP, Dynamic Arrays), Python, Bash, SQL, Power Automate")
    ]
    for idx, (cat, val) in enumerate(skills):
        c1 = skills_table.rows[idx].cells[0]
        c1.width = Inches(2.2)
        p1 = c1.paragraphs[0]
        p1.paragraph_format.space_after = Pt(2)
        r1 = p1.add_run(cat)
        r1.font.name = "Calibri"
        r1.font.size = Pt(9)
        r1.font.bold = True
        
        c2 = skills_table.rows[idx].cells[1]
        c2.width = Inches(5.0)
        p2 = c2.paragraphs[0]
        p2.paragraph_format.space_after = Pt(2)
        r2 = p2.add_run(val)
        r2.font.name = "Calibri"
        r2.font.size = Pt(9)
        
    # 3. Professional Work Experience
    add_section_header("Professional Experience")
    
    # Role 1
    p_r1 = doc.add_paragraph()
    p_r1.paragraph_format.space_before = Pt(4)
    p_r1.paragraph_format.space_after = Pt(2)
    r_r1_title = p_r1.add_run("Senior Infrastructure Engineer | RTechLab Technologies Pvt. Ltd.")
    r_r1_title.font.name = "Calibri"
    r_r1_title.font.size = Pt(10)
    r_r1_title.font.bold = True
    
    r_r1_date = p_r1.add_run(" — Ahmedabad, India (2024 – Present)")
    r_r1_date.font.name = "Calibri"
    r_r1_date.font.size = Pt(9.5)
    r_r1_date.font.italic = True
    
    bullets_r1 = [
        "Architected and deployed a multi-forest Windows Server 2025 Active Directory topology supporting 3,500+ hybrid domain users with automated Hotpatching, achieving 99.99% directory uptime.",
        "Engineered automated corporate Excel reporting templates and Power Query M-code reconciliation models that saved finance teams 18+ hours per week during month-end audit closings.",
        "Designed and implemented zero-trust network segmentation across 12 branch offices using Cisco 200-301 VLANs, 802.1X NAC, and IPsec VPN tunnels, reducing attack surface by 60%."
    ]
    for b in bullets_r1:
        bp = doc.add_paragraph(style='List Bullet')
        bp.paragraph_format.space_after = Pt(2)
        br = bp.add_run(b)
        br.font.name = "Calibri"
        br.font.size = Pt(9)
        br.font.color.rgb = RGBColor(30, 41, 59)
        
    # Role 2
    p_r2 = doc.add_paragraph()
    p_r2.paragraph_format.space_before = Pt(6)
    p_r2.paragraph_format.space_after = Pt(2)
    r_r2_title = p_r2.add_run("Systems Administrator | Infosys BPM Enterprise Services")
    r_r2_title.font.name = "Calibri"
    r_r2_title.font.size = Pt(10)
    r_r2_title.font.bold = True
    
    r_r2_date = p_r2.add_run(" — Gandhinagar, India (2021 – 2024)")
    r_r2_date.font.name = "Calibri"
    r_r2_date.font.size = Pt(9.5)
    r_r2_date.font.italic = True
    
    bullets_r2 = [
        "Managed 120+ virtualized Hyper-V and VMware ESXi production servers, executing scheduled zero-downtime OS patch migrations and disaster recovery failover drills.",
        "Built automated PowerShell and Python scripts to streamline employee onboarding/offboarding, reducing user provisioning time from 48 hours to under 30 minutes.",
        "Administered enterprise Microsoft 365 tenant, including Exchange Online mailflow routing, SharePoint document governance, and conditional access security policies."
    ]
    for b in bullets_r2:
        bp = doc.add_paragraph(style='List Bullet')
        bp.paragraph_format.space_after = Pt(2)
        br = bp.add_run(b)
        br.font.name = "Calibri"
        br.font.size = Pt(9)
        br.font.color.rgb = RGBColor(30, 41, 59)
        
    # 4. Education & Industry Certifications
    add_section_header("Education & Certifications")
    p_edu = doc.add_paragraph()
    p_edu.paragraph_format.space_after = Pt(2)
    r_edu = p_edu.add_run("Bachelor of Technology (B.Tech) in Computer Engineering | Gujarat Technological University (GTU)")
    r_edu.font.name = "Calibri"
    r_edu.font.size = Pt(9.5)
    r_edu.font.bold = True
    
    p_cert = doc.add_paragraph()
    p_cert.paragraph_format.space_after = Pt(2)
    r_cert = p_cert.add_run("Certifications: Cisco Certified Network Associate (CCNA 200-301) · Microsoft Certified: Azure Administrator (AZ-104) · AWS Solutions Architect Associate")
    r_cert.font.name = "Calibri"
    r_cert.font.size = Pt(9)
    r_cert.font.color.rgb = RGBColor(71, 85, 105)
    
    out_path = os.path.join(out_dir, "02_ATS_Professional_Tech_Resume_Template.docx")
    doc.save(out_path)
    print("Saved Resume Template:", out_path)

create_cover_page_template()
create_ats_resume_template()
