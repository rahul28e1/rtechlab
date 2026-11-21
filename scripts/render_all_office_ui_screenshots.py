import os
import subprocess

def render_ui():
    ui_dir = os.path.abspath("DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui")
    os.makedirs(ui_dir, exist_ok=True)
    chrome_path = r"C:\Program Files\Google\Chrome\Application\chrome.exe"

    screens = {
        "excel-365-full-workspace.png": """<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', -apple-system, sans-serif; }
    body { background: #f3f2f1; height: 720px; width: 1280px; display: flex; flex-direction: column; overflow: hidden; }
    .titlebar { background: #107c41; color: white; height: 38px; display: flex; align-items: center; padding: 0 16px; font-size: 13px; font-weight: 600; justify-content: space-between; }
    .title-left { display: flex; align-items: center; gap: 12px; }
    .autosave-pill { background: rgba(255,255,255,0.22); padding: 3px 10px; border-radius: 12px; font-size: 11px; display: flex; align-items: center; gap: 6px; }
    .autosave-dot { width: 8px; height: 8px; background: #86efac; border-radius: 50%; }
    .ribbon-tabs { background: #ffffff; display: flex; border-bottom: 1px solid #e1dfdd; padding: 0 8px; }
    .tab { padding: 9px 14px; font-size: 12px; font-weight: 500; color: #323130; cursor: pointer; border-bottom: 3px solid transparent; }
    .tab.active { font-weight: 700; color: #107c41; border-bottom-color: #107c41; }
    .ribbon-toolbar { background: #fbfbfb; border-bottom: 1px solid #edebe9; padding: 6px 14px; display: flex; align-items: center; gap: 16px; height: 72px; }
    .tool-group { display: flex; align-items: center; gap: 8px; border-right: 1px solid #edebe9; padding-right: 14px; }
    .tool-btn { display: flex; flex-direction: column; align-items: center; font-size: 10px; color: #323130; gap: 2px; }
    .icon-btn { font-size: 16px; padding: 4px; border-radius: 4px; }
    .formula-bar-container { background: #ffffff; border-bottom: 1px solid #e1dfdd; display: flex; align-items: center; padding: 4px 14px; height: 34px; gap: 10px; }
    .name-box { width: 72px; height: 24px; border: 1px solid #cbd5e1; font-size: 11.5px; font-weight: 700; display: flex; align-items: center; justify-content: center; background: #f8fafc; border-radius: 3px; color:#0f172a; }
    .fx-symbol { color: #64748b; font-style: italic; font-weight: 800; font-size: 14px; }
    .formula-input { flex: 1; height: 24px; border: 1px solid #cbd5e1; border-radius: 3px; padding: 0 10px; font-family: 'Consolas', monospace; font-size: 12.5px; display: flex; align-items: center; background: #ffffff; color: #0369a1; font-weight: 600; }
    .main-content { display: flex; flex: 1; overflow: hidden; }
    .grid-container { flex: 1; background: #ffffff; overflow: hidden; display: flex; flex-direction: column; }
    .grid-header-row { display: flex; background: #f8fafc; border-bottom: 1px solid #cbd5e1; height: 26px; }
    .corner-cell { width: 44px; border-right: 1px solid #cbd5e1; background: #f1f5f9; }
    .col-hdr { flex: 1; display: flex; align-items: center; justify-content: center; font-size: 11px; font-weight: 700; color: #475569; border-right: 1px solid #e2e8f0; }
    .grid-row { display: flex; height: 28px; border-bottom: 1px solid #f1f5f9; }
    .row-hdr { width: 44px; display: flex; align-items: center; justify-content: center; font-size: 10.5px; font-weight: 700; color: #64748b; background: #f8fafc; border-right: 1px solid #cbd5e1; }
    .cell { flex: 1; display: flex; align-items: center; padding: 0 10px; font-size: 11.5px; border-right: 1px solid #f1f5f9; color: #1e293b; }
    .cell.num { justify-content: flex-end; font-variant-numeric: tabular-nums; font-family: 'Consolas', monospace; }
    .cell.hdr-cell { background: #0f172a; color: #ffffff; font-weight: 700; font-size: 11px; }
    .cell.active-cell { outline: 2.5pt solid #107c41; outline-offset: -2.5pt; background: #ecfdf5; font-weight: bold; }
    .badge-success { background: #dcfce7; color: #15803d; font-weight: 700; border-radius: 4px; padding: 2px 8px; font-size: 10px; }
    .badge-warning { background: #fef3c7; color: #b45309; font-weight: 700; border-radius: 4px; padding: 2px 8px; font-size: 10px; }
    .copilot-sidebar { width: 330px; background: #ffffff; border-left: 1px solid #cbd5e1; display: flex; flex-direction: column; padding: 18px; box-shadow: -4px 0 16px rgba(0,0,0,0.03); }
    .copilot-header { display: flex; align-items: center; gap: 8px; font-size: 14px; font-weight: 700; color: #0284c7; padding-bottom: 12px; border-bottom: 1px solid #f1f5f9; }
    .copilot-bubble { background: #f0f9ff; border: 1px solid #bae6fd; border-radius: 8px; padding: 12px; margin-top: 14px; font-size: 11.5px; color: #0369a1; line-height: 1.5; }
    .copilot-prompt { background: #f8fafc; border: 1px solid #cbd5e1; border-radius: 6px; padding: 12px; margin-top: auto; font-size: 11px; color: #64748b; display: flex; justify-content: space-between; }
    .statusbar { height: 26px; background: #107c41; color: white; display: flex; align-items: center; justify-content: space-between; padding: 0 16px; font-size: 11px; font-weight: 600; }
  </style>
</head>
<body>
  <div class="titlebar">
    <div class="title-left">
      <span style="font-size:18px;">📊</span>
      <span>RTechLab_Corporate_Enterprise_Financial_Model_2027.xlsx - Microsoft Excel 365</span>
      <div class="autosave-pill"><div class="autosave-dot"></div> AutoSave On (OneDrive)</div>
    </div>
    <div>Rahul Patel (Founder & Chief Architect, RTechLab)</div>
  </div>
  <div class="ribbon-tabs">
    <div class="tab">File</div>
    <div class="tab active">Home</div>
    <div class="tab">Insert</div>
    <div class="tab">Page Layout</div>
    <div class="tab">Formulas</div>
    <div class="tab">Data</div>
    <div class="tab">Review</div>
    <div class="tab">View</div>
    <div class="tab" style="color:#0284c7; font-weight:bold;">✨ Copilot AI</div>
  </div>
  <div class="ribbon-toolbar">
    <div class="tool-group">
      <div class="tool-btn"><span class="icon-btn">📋</span><span>Paste</span></div>
      <div class="tool-btn"><span class="icon-btn">✂️</span><span>Cut</span></div>
      <div class="tool-btn"><span class="icon-btn">🖌️</span><span>Format</span></div>
    </div>
    <div class="tool-group">
      <div style="font-weight:700; font-size:12px; margin-bottom:4px; color:#1e293b;">Aptos Display · 11pt</div>
      <div style="display:flex; gap:6px; font-size:12px; font-weight:bold;">
        <span style="background:#e2e8f0; padding:2px 7px; border-radius:3px;">B</span>
        <span style="padding:2px 7px;"><i>I</i></span>
        <span style="padding:2px 7px;"><u>U</u></span>
      </div>
    </div>
    <div class="tool-group">
      <div class="tool-btn"><span class="icon-btn">₹ % ,</span><span>Number</span></div>
      <div class="tool-btn"><span class="icon-btn">🎨</span><span>Conditional</span></div>
      <div class="tool-btn"><span class="icon-btn">📑</span><span>Format Table</span></div>
    </div>
    <div class="tool-group">
      <div class="tool-btn"><span class="icon-btn">∑</span><span>AutoSum</span></div>
      <div class="tool-btn"><span class="icon-btn">⚡</span><span>Flash Fill</span></div>
      <div class="tool-btn"><span class="icon-btn">🔍</span><span>Sort & Filter</span></div>
    </div>
  </div>
  <div class="formula-bar-container">
    <div class="name-box">D4</div>
    <div class="fx-symbol">fx</div>
    <div class="formula-input">=XLOOKUP(C4, Master_Products[SKU_Code], Master_Products[Unit_Price] * Master_Products[GST_Rate], "Not Found")</div>
  </div>
  <div class="main-content">
    <div class="grid-container">
      <div class="grid-header-row">
        <div class="corner-cell"></div>
        <div class="col-hdr" style="width:70px;">A</div>
        <div class="col-hdr" style="width:140px;">B</div>
        <div class="col-hdr" style="width:180px;">C</div>
        <div class="col-hdr" style="width:140px;">D</div>
        <div class="col-hdr" style="width:120px;">E</div>
        <div class="col-hdr" style="width:140px;">F</div>
        <div class="col-hdr">G</div>
      </div>
      <div class="grid-row">
        <div class="row-hdr">1</div>
        <div class="cell hdr-cell">Invoice #</div>
        <div class="cell hdr-cell">Branch Location</div>
        <div class="cell hdr-cell">Product SKU ID</div>
        <div class="cell hdr-cell num">Taxable Value</div>
        <div class="cell hdr-cell num">GST (18%)</div>
        <div class="cell hdr-cell num">Net Payable</div>
        <div class="cell hdr-cell">SLA Compliance</div>
      </div>
      <div class="grid-row">
        <div class="row-hdr">2</div>
        <div class="cell">INV-2027-001</div>
        <div class="cell">Bengaluru HQ</div>
        <div class="cell">SKU-ENT-SERVER-09</div>
        <div class="cell num">₹8,45,000.00</div>
        <div class="cell num">₹1,52,100.00</div>
        <div class="cell num" style="font-weight:700;">₹9,97,100.00</div>
        <div class="cell"><span class="badge-success">✓ Verified & Cleared</span></div>
      </div>
      <div class="grid-row">
        <div class="row-hdr">3</div>
        <div class="cell">INV-2027-002</div>
        <div class="cell">Gurgaon Hub</div>
        <div class="cell">SKU-SWITCH-CAT93</div>
        <div class="cell num">₹4,20,000.00</div>
        <div class="cell num">₹75,600.00</div>
        <div class="cell num" style="font-weight:700;">₹4,95,600.00</div>
        <div class="cell"><span class="badge-success">✓ Verified & Cleared</span></div>
      </div>
      <div class="grid-row">
        <div class="row-hdr">4</div>
        <div class="cell">INV-2027-003</div>
        <div class="cell">Hyderabad DC</div>
        <div class="cell">SKU-FIBER-LC-40G</div>
        <div class="cell num active-cell">₹1,85,500.00</div>
        <div class="cell num">₹33,390.00</div>
        <div class="cell num" style="font-weight:700;">₹2,18,890.00</div>
        <div class="cell"><span class="badge-warning">⏳ Under Audit</span></div>
      </div>
      <div class="grid-row">
        <div class="row-hdr">5</div>
        <div class="cell">INV-2027-004</div>
        <div class="cell">Mumbai West</div>
        <div class="cell">SKU-STORAGE-NVME</div>
        <div class="cell num">₹6,15,000.00</div>
        <div class="cell num">₹1,10,700.00</div>
        <div class="cell num" style="font-weight:700;">₹7,25,700.00</div>
        <div class="cell"><span class="badge-success">✓ Verified & Cleared</span></div>
      </div>
      <div class="grid-row">
        <div class="row-hdr">6</div>
        <div class="cell">INV-2027-005</div>
        <div class="cell">Pune Core</div>
        <div class="cell">SKU-ROUTER-ISR44</div>
        <div class="cell num">₹5,90,000.00</div>
        <div class="cell num">₹1,06,200.00</div>
        <div class="cell num" style="font-weight:700;">₹6,96,200.00</div>
        <div class="cell"><span class="badge-success">✓ Verified & Cleared</span></div>
      </div>
      <div class="grid-row" style="background:#f8fafc; font-weight:bold;">
        <div class="row-hdr">Σ</div>
        <div class="cell">Total Corporate Run</div>
        <div class="cell">5 Active Hubs</div>
        <div class="cell">5 Core SKUs</div>
        <div class="cell num">₹26,55,500.00</div>
        <div class="cell num">₹4,77,990.00</div>
        <div class="cell num" style="color:#15803d; font-size:12.5px;">₹31,33,490.00</div>
        <div class="cell">99.4% SLA Target</div>
      </div>
    </div>
    <div class="copilot-sidebar">
      <div class="copilot-header">
        <span>✨</span>
        <span>Copilot AI Financial Insights</span>
      </div>
      <div class="copilot-bubble">
        <strong>Executive Spend Analysis:</strong><br>
        • Total Gross Spend: <strong>₹31,33,490.00</strong> across 5 regional hubs.<br>
        • <strong>Bengaluru HQ</strong> represents 31.8% of procurement.<br>
        • <strong>Reorder Strategy:</strong> Consolidate NVMe and Server SKU purchase orders to trigger a 6.5% bulk supplier rebate.
      </div>
      <div class="copilot-bubble" style="background:#f0fdf4; border-color:#bbf7d0; color:#166534;">
        <strong>Python in Excel (=PY) Script:</strong><br>
        <code>import seaborn as sns</code><br>
        Predictive cash flow modeling indicates optimal payment discount capture at Day 10.
      </div>
      <div class="copilot-prompt">
        <span>Ask Copilot about this workbook...</span>
        <span>➤</span>
      </div>
    </div>
  </div>
  <div class="statusbar">
    <div>READY · Calculation: Automatic · 100% Zoom · RTechLab Enterprise Grid</div>
    <div>AVERAGE: ₹6,26,698.00 | COUNT: 5 | SUM: ₹31,33,490.00</div>
  </div>
</body>
</html>""",

        "word-365-full-workspace.png": """<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', -apple-system, sans-serif; }
    body { background: #f3f2f1; height: 720px; width: 1280px; display: flex; flex-direction: column; overflow: hidden; }
    .titlebar { background: #185abd; color: white; height: 38px; display: flex; align-items: center; padding: 0 16px; font-size: 13px; font-weight: 600; justify-content: space-between; }
    .title-left { display: flex; align-items: center; gap: 12px; }
    .autosave-pill { background: rgba(255,255,255,0.22); padding: 3px 10px; border-radius: 12px; font-size: 11px; display: flex; align-items: center; gap: 6px; }
    .autosave-dot { width: 8px; height: 8px; background: #86efac; border-radius: 50%; }
    .ribbon-tabs { background: #ffffff; display: flex; border-bottom: 1px solid #e1dfdd; padding: 0 8px; }
    .tab { padding: 9px 14px; font-size: 12px; font-weight: 500; color: #323130; cursor: pointer; border-bottom: 3px solid transparent; }
    .tab.active { font-weight: 700; color: #185abd; border-bottom-color: #185abd; }
    .ribbon-toolbar { background: #fbfbfb; border-bottom: 1px solid #edebe9; padding: 6px 14px; display: flex; align-items: center; gap: 16px; height: 72px; }
    .tool-group { display: flex; align-items: center; gap: 8px; border-right: 1px solid #edebe9; padding-right: 14px; }
    .tool-btn { display: flex; flex-direction: column; align-items: center; font-size: 10px; color: #323130; gap: 2px; }
    .icon-btn { font-size: 16px; padding: 4px; border-radius: 4px; }
    .style-gallery { display: flex; gap: 6px; }
    .style-chip { border: 1px solid #d1d5db; border-radius: 3px; padding: 4px 8px; text-align: center; background: white; font-size: 10px; min-width: 62px; }
    .style-chip.active { border-color: #185abd; background: #eff6ff; font-weight: bold; color: #185abd; }
    .workspace { flex: 1; display: flex; background: #e5e7eb; overflow: hidden; justify-content: center; padding: 20px; gap: 24px; }
    .nav-sidebar { width: 240px; background: white; border: 1px solid #cbd5e1; border-radius: 4px; padding: 14px; font-size: 11.5px; display: flex; flex-direction: column; gap: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.06); }
    .nav-title { font-weight: bold; color: #185abd; font-size: 12.5px; margin-bottom: 4px; }
    .nav-item { padding: 4px 6px; border-radius: 3px; color: #334155; }
    .nav-item.active { background: #eff6ff; font-weight: bold; color: #185abd; }
    .doc-paper { width: 600px; background: white; box-shadow: 0 4px 18px rgba(0,0,0,0.12); padding: 48px; border-radius: 2px; display: flex; flex-direction: column; }
    .doc-header { font-size: 9.5px; color: #94a3b8; text-transform: uppercase; border-bottom: 1px solid #f1f5f9; padding-bottom: 8px; margin-bottom: 24px; display: flex; justify-content: space-between; font-weight:600; }
    .doc-title { font-size: 22px; font-weight: 800; color: #0f172a; margin-bottom: 8px; line-height: 1.2; }
    .doc-subtitle { font-size: 12px; font-weight: 700; color: #0284c7; margin-bottom: 16px; }
    .doc-para { font-size: 11px; line-height: 1.6; color: #334155; margin-bottom: 12px; }
    .doc-callout { background: #f8fafc; border-left: 3.5px solid #185abd; padding: 12px; margin: 12px 0; font-size: 10.5px; color: #1e293b; border-radius: 0 4px 4px 0; line-height:1.5; }
    .statusbar { height: 26px; background: #185abd; color: white; display: flex; align-items: center; justify-content: space-between; padding: 0 16px; font-size: 11px; font-weight: 600; }
  </style>
</head>
<body>
  <div class="titlebar">
    <div class="title-left">
      <span style="font-size:18px;">📝</span>
      <span>RTechLab_Executive_Corporate_Agreement_2027.docx - Microsoft Word 365</span>
      <div class="autosave-pill"><div class="autosave-dot"></div> AutoSave On (OneDrive)</div>
    </div>
    <div>Rahul Patel (Founder & Chief Architect, RTechLab)</div>
  </div>
  <div class="ribbon-tabs">
    <div class="tab">File</div>
    <div class="tab active">Home</div>
    <div class="tab">Insert</div>
    <div class="tab">Draw</div>
    <div class="tab">Design</div>
    <div class="tab">Layout</div>
    <div class="tab">References</div>
    <div class="tab">Mailings</div>
    <div class="tab">Review</div>
    <div class="tab">View</div>
    <div class="tab" style="color:#0284c7; font-weight:bold;">✨ Copilot AI</div>
  </div>
  <div class="ribbon-toolbar">
    <div class="tool-group">
      <div class="tool-btn"><span class="icon-btn">📋</span><span>Paste</span></div>
      <div class="tool-btn"><span class="icon-btn">✂️</span><span>Cut</span></div>
      <div class="tool-btn"><span class="icon-btn">🖌️</span><span>Format</span></div>
    </div>
    <div class="tool-group">
      <div style="font-weight:700; font-size:12px; margin-bottom:4px; color:#1e293b;">Aptos (Body) · 11pt</div>
      <div style="display:flex; gap:6px; font-size:12px; font-weight:bold;">
        <span style="background:#e2e8f0; padding:2px 7px; border-radius:3px;">B</span>
        <span style="padding:2px 7px;"><i>I</i></span>
        <span style="padding:2px 7px;"><u>U</u></span>
        <span style="padding:2px 7px; color:#185abd;">A▼</span>
      </div>
    </div>
    <div class="tool-group">
      <div class="style-gallery">
        <div class="style-chip">Normal<br>AaBbCc</div>
        <div class="style-chip active">Heading 1<br>AaBbCc</div>
        <div class="style-chip">Heading 2<br>AaBbCc</div>
        <div class="style-chip">Title<br>AaBbCc</div>
        <div class="style-chip">Subtle<br>AaBbCc</div>
      </div>
    </div>
    <div class="tool-group">
      <div class="tool-btn"><span class="icon-btn">🔍</span><span>Find</span></div>
      <div class="tool-btn"><span class="icon-btn">🔄</span><span>Replace</span></div>
      <div class="tool-btn"><span class="icon-btn">🎙️</span><span>Dictate</span></div>
    </div>
  </div>
  <div class="workspace">
    <div class="nav-sidebar">
      <div class="nav-title">Navigation Pane</div>
      <div class="nav-item">1. Executive Overview</div>
      <div class="nav-item active">2. Commercial Framework</div>
      <div class="nav-item" style="padding-left:14px;">2.1 Deliverables & SLAs</div>
      <div class="nav-item" style="padding-left:14px;">2.2 Milestone Schedule</div>
      <div class="nav-item">3. Confidentiality & IP</div>
      <div class="nav-item">4. Signature Validation</div>
    </div>
    <div class="doc-paper">
      <div class="doc-header">
        <span>RTechLab Official Publication · Confidential</span>
        <span>Section 2 · Page 4 of 28</span>
      </div>
      <div class="doc-title">Master Enterprise Services Agreement</div>
      <div class="doc-subtitle">Commercial Architecture, Operational SLAs & Technical Governance (2027)</div>
      <div class="doc-para">
        This Agreement is executed between RTechLab Digital Technologies and the Enterprise Client. All technical documentation, automated Power Query ETL pipelines, and corporate training deliverables conform to strict ISO/IEC 27001 data hygiene protocols.
      </div>
      <div class="doc-callout">
        <strong>CRITICAL GOVERNANCE MANDATE:</strong><br>
        All sensitive employee payroll records and corporate financial models must be stored exclusively in Microsoft Purview encrypted cloud repositories with restricted rights management.
      </div>
      <div class="doc-para">
        Each corporate deliverable shall be subject to 5-stage signoff, ensuring full parity across dual English and Hindi corporate editions with zero external branding conflicts.
      </div>
    </div>
  </div>
  <div class="statusbar">
    <div>PAGE 4 OF 28 · 1,420 WORDS · ENGLISH (UNITED STATES) · ACCESSIBILITY: GOOD</div>
    <div>PRINT LAYOUT · 100% ZOOM · REVISION TRACKING: ON</div>
  </div>
</body>
</html>""",

        "powerpoint-365-full-workspace.png": """<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', -apple-system, sans-serif; }
    body { background: #f3f2f1; height: 720px; width: 1280px; display: flex; flex-direction: column; overflow: hidden; }
    .titlebar { background: #c43e1c; color: white; height: 38px; display: flex; align-items: center; padding: 0 16px; font-size: 13px; font-weight: 600; justify-content: space-between; }
    .title-left { display: flex; align-items: center; gap: 12px; }
    .autosave-pill { background: rgba(255,255,255,0.22); padding: 3px 10px; border-radius: 12px; font-size: 11px; display: flex; align-items: center; gap: 6px; }
    .autosave-dot { width: 8px; height: 8px; background: #86efac; border-radius: 50%; }
    .ribbon-tabs { background: #ffffff; display: flex; border-bottom: 1px solid #e1dfdd; padding: 0 8px; }
    .tab { padding: 9px 14px; font-size: 12px; font-weight: 500; color: #323130; cursor: pointer; border-bottom: 3px solid transparent; }
    .tab.active { font-weight: 700; color: #c43e1c; border-bottom-color: #c43e1c; }
    .ribbon-toolbar { background: #fbfbfb; border-bottom: 1px solid #edebe9; padding: 6px 14px; display: flex; align-items: center; gap: 16px; height: 72px; }
    .tool-group { display: flex; align-items: center; gap: 8px; border-right: 1px solid #edebe9; padding-right: 14px; }
    .tool-btn { display: flex; flex-direction: column; align-items: center; font-size: 10px; color: #323130; gap: 2px; }
    .icon-btn { font-size: 16px; padding: 4px; border-radius: 4px; }
    .workspace { flex: 1; display: flex; background: #334155; overflow: hidden; padding: 16px; gap: 16px; }
    .slide-sorter { width: 180px; display: flex; flex-direction: column; gap: 12px; overflow-y: auto; padding-right: 6px; }
    .thumb-card { background: white; border-radius: 4px; padding: 6px; border: 2.5px solid transparent; cursor: pointer; box-shadow: 0 2px 6px rgba(0,0,0,0.2); }
    .thumb-card.active { border-color: #c43e1c; }
    .thumb-num { font-size: 9.5px; font-weight: bold; color: #94a3b8; margin-bottom: 3px; }
    .thumb-preview { height: 75px; background: #0f172a; border-radius: 2px; display: flex; align-items: center; justify-content: center; color: white; font-size: 8.5px; text-align: center; }
    .main-slide-container { flex: 1; display: flex; align-items: center; justify-content: center; }
    .slide-canvas { width: 880px; height: 495px; background: #0f172a; border-radius: 6px; box-shadow: 0 12px 36px rgba(0,0,0,0.5); padding: 44px; color: white; display: flex; flex-direction: column; justify-content: space-between; position: relative; }
    .slide-tag { font-size: 11px; font-weight: 700; color: #38bdf8; text-transform: uppercase; letter-spacing: 1.5px; }
    .slide-title { font-size: 30px; font-weight: 800; color: #ffffff; line-height: 1.2; margin-top: 8px; }
    .slide-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 18px; margin: 24px 0; }
    .card-kpi { background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.12); border-radius: 8px; padding: 18px; }
    .card-title { font-size: 11px; color: #94a3b8; font-weight: 700; text-transform: uppercase; }
    .card-val { font-size: 26px; font-weight: 800; color: #38bdf8; margin: 8px 0; }
    .card-desc { font-size: 10px; color: #cbd5e1; line-height: 1.45; }
    .slide-footer { display: flex; justify-content: space-between; align-items: center; font-size: 10.5px; color: #64748b; border-top: 1px solid rgba(255,255,255,0.1); padding-top: 12px; }
    .morph-badge { background: #c43e1c; color: white; font-size: 9.5px; font-weight: 700; padding: 3px 10px; border-radius: 12px; display: inline-flex; align-items: center; gap: 4px; }
    .statusbar { height: 26px; background: #c43e1c; color: white; display: flex; align-items: center; justify-content: space-between; padding: 0 16px; font-size: 11px; font-weight: 600; }
  </style>
</head>
<body>
  <div class="titlebar">
    <div class="title-left">
      <span style="font-size:18px;">📽️</span>
      <span>RTechLab_Executive_Investor_Pitch_Deck_2027.pptx - Microsoft PowerPoint 365</span>
      <div class="autosave-pill"><div class="autosave-dot"></div> AutoSave On (OneDrive)</div>
    </div>
    <div>Rahul Patel (Founder & Chief Architect, RTechLab)</div>
  </div>
  <div class="ribbon-tabs">
    <div class="tab">File</div>
    <div class="tab">Home</div>
    <div class="tab">Insert</div>
    <div class="tab">Draw</div>
    <div class="tab">Design</div>
    <div class="tab active">Transitions</div>
    <div class="tab">Animations</div>
    <div class="tab">Slide Show</div>
    <div class="tab">Record</div>
    <div class="tab">View</div>
    <div class="tab" style="color:#38bdf8; font-weight:bold;">✨ Copilot AI</div>
  </div>
  <div class="ribbon-toolbar">
    <div class="tool-group">
      <div class="tool-btn" style="background:#fee2e2; border-radius:4px; padding:4px 8px;">
        <span class="icon-btn" style="color:#c43e1c;">✨</span><span style="font-weight:bold; color:#c43e1c;">Morph</span>
      </div>
      <div class="tool-btn"><span class="icon-btn">🌊</span><span>Fade</span></div>
      <div class="tool-btn"><span class="icon-btn">➡️</span><span>Push</span></div>
      <div class="tool-btn"><span class="icon-btn">🧹</span><span>Wipe</span></div>
    </div>
    <div class="tool-group">
      <div style="font-size:11.5px; font-weight:700; color:#334155;">Effect Options: <span style="color:#c43e1c;">Objects (60fps Fluid)</span></div>
      <div style="font-size:11px; color:#64748b;">Duration: 1.25s · Advance on Click: Checked</div>
    </div>
    <div class="tool-group">
      <div class="tool-btn"><span class="icon-btn">🖥️</span><span>Slide Show</span></div>
      <div class="tool-btn"><span class="icon-btn">⏱️</span><span>Rehearse Coach</span></div>
    </div>
  </div>
  <div class="workspace">
    <div class="slide-sorter">
      <div class="thumb-card">
        <div class="thumb-num">1. Title Slide</div>
        <div class="thumb-preview" style="background:#0284c7;">RTechLab 2027 Vision</div>
      </div>
      <div class="thumb-card active">
        <div class="thumb-num">2. C-Suite Market Opportunity</div>
        <div class="thumb-preview">Financial Model & KPIs</div>
      </div>
      <div class="thumb-card">
        <div class="thumb-num">3. Scalable Architecture</div>
        <div class="thumb-preview" style="background:#059669;">Power Query ETL</div>
      </div>
      <div class="thumb-card">
        <div class="thumb-num">4. Revenue Projection</div>
        <div class="thumb-preview" style="background:#7c3aed;">DCF Valuation Model</div>
      </div>
    </div>
    <div class="main-slide-container">
      <div class="slide-canvas">
        <div>
          <div style="display:flex; justify-content:space-between; align-items:center;">
            <span class="slide-tag">Enterprise Executive Review</span>
            <span class="morph-badge">⚡ Morph Transition Active</span>
          </div>
          <div class="slide-title">2027 Global Market Expansion & Operational KPIs</div>
        </div>
        <div class="slide-grid">
          <div class="card-kpi">
            <div class="card-title">Annual Gross Spend</div>
            <div class="card-val">₹31.33L</div>
            <div class="card-desc">+42% YoY growth across 5 regional cloud datacenters with automated SLA tracking.</div>
          </div>
          <div class="card-kpi">
            <div class="card-title">ETL Latency Reduction</div>
            <div class="card-val">96.4%</div>
            <div class="card-desc">Power Query automated M-code consolidation replaced 12 weekly manual hours.</div>
          </div>
          <div class="card-kpi">
            <div class="card-title">Executive SLA Score</div>
            <div class="card-val">99.8%</div>
            <div class="card-desc">Zero contract breaches; verified through live Excel-PowerPoint dynamic linked charts.</div>
          </div>
        </div>
        <div class="slide-footer">
          <span>CONFIDENTIAL · RTECHLAB COMMERCIAL SUITE 2027</span>
          <span>SLIDE 2 OF 24 · 16:9 WIDESCREEN PRESENTATION</span>
        </div>
      </div>
    </div>
  </div>
  <div class="statusbar">
    <div>SLIDE 2 OF 24 · 16:9 RATIO · ENGLISH (UNITED STATES) · DESIGN IDEAS: AVAILABLE</div>
    <div>PRESENTER VIEW READY · 100% ZOOM · NOTES PANE</div>
  </div>
</body>
</html>"""
    }

    tmp_html = os.path.abspath("temp_render.html")
    for name, html in screens.items():
        with open(tmp_html, "w", encoding="utf-8") as f:
            f.write(html)
        out_img = os.path.join(ui_dir, name)
        html_url = "file:///" + tmp_html.replace("\\", "/")
        cmd = [
            chrome_path,
            "--headless",
            "--disable-gpu",
            f"--screenshot={out_img}",
            "--window-size=1280,720",
            html_url
        ]
        subprocess.run(cmd, check=True)
        print(f"✓ Rendered {name} ({os.path.getsize(out_img)} bytes)")

    if os.path.exists(tmp_html):
        os.remove(tmp_html)

if __name__ == "__main__":
    render_ui()
