import os
import subprocess

out_dir = "DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui"
os.makedirs(out_dir, exist_ok=True)
chrome_path = r"C:\Program Files\Google\Chrome\Application\chrome.exe"

screens = [
    {
        "filename": "excel-vlookup-xlookup-ui.png",
        "title": "Excel 365 - Modern Lookup Architecture (XLOOKUP vs VLOOKUP)",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #107C41; padding: 20px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .window { width: 1220px; background: #fff; border-radius: 8px; box-shadow: 0 20px 50px rgba(0,0,0,0.3); overflow: hidden; border: 1px solid #d1d5db; }
            .titlebar { background: #107C41; color: white; padding: 10px 18px; display: flex; justify-content: space-between; align-items: center; font-size: 13px; font-weight: 600; }
            .ribbon { background: #f3f4f6; border-bottom: 1px solid #e5e7eb; padding: 8px 18px; display: flex; gap: 24px; font-size: 13px; color: #374151; }
            .ribbon span.active { color: #107C41; font-weight: 700; border-bottom: 2px solid #107C41; padding-bottom: 4px; }
            .formula-bar { background: #ffffff; border-bottom: 1px solid #e5e7eb; padding: 8px 18px; display: flex; align-items: center; gap: 12px; font-family: Consolas, monospace; font-size: 13px; }
            .name-box { background: #f9fafb; border: 1px solid #d1d5db; padding: 4px 10px; border-radius: 4px; font-weight: 600; color: #111827; }
            .fx-btn { color: #6b7280; font-weight: bold; font-style: italic; }
            .formula-input { flex: 1; color: #0284c7; font-weight: 600; }
            .grid-container { display: grid; grid-template-columns: 2fr 1fr; gap: 20px; padding: 20px; background: #fafafa; }
            .sheet-table { width: 100%; border-collapse: collapse; background: #fff; box-shadow: 0 2px 4px rgba(0,0,0,0.05); border-radius: 6px; overflow: hidden; }
            .sheet-table th { background: #107C41; color: white; padding: 8px 12px; font-size: 12px; text-align: left; }
            .sheet-table td { padding: 8px 12px; font-size: 12px; border-bottom: 1px solid #f3f4f6; color: #1f2937; }
            .sheet-table tr:nth-child(even) { background: #f9fafb; }
            .highlight-cell { background: #ecfdf5 !important; color: #047857; font-weight: bold; }
            .sidebar { background: #ffffff; border: 1px solid #e5e7eb; border-radius: 6px; padding: 16px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
            .sidebar h3 { font-size: 14px; color: #107C41; margin-bottom: 12px; font-weight: 700; }
            .arg-box { background: #f0fdf4; border-left: 3px solid #107C41; padding: 8px 12px; margin-bottom: 10px; font-size: 12px; }
            .arg-title { font-weight: 700; color: #166534; font-family: monospace; }
            .arg-desc { color: #374151; margin-top: 2px; }
            .badge { display: inline-block; padding: 3px 8px; border-radius: 12px; font-size: 10px; font-weight: 700; }
            .badge-active { background: #dcfce7; color: #15803d; }
          </style>
        </head>
        <body>
          <div class="window">
            <div class="titlebar">
              <span>AutoSave [ON] &nbsp;·&nbsp; Enterprise_Sales_Master_2027.xlsx - Excel</span>
              <span>Rahul Patel (RTechLab Certified)</span>
            </div>
            <div class="ribbon">
              <span>Home</span>
              <span>Insert</span>
              <span>Page Layout</span>
              <span class="active">Formulas</span>
              <span>Data</span>
              <span>Review</span>
              <span>View</span>
              <span>Copilot</span>
            </div>
            <div class="formula-bar">
              <div class="name-box">F2</div>
              <div class="fx-btn">fx</div>
              <div class="formula-input">=XLOOKUP(E2, tbl_Products[SKU], tbl_Products[Unit_Price], "NOT FOUND", 0, 1)</div>
            </div>
            <div class="grid-container">
              <div>
                <table class="sheet-table">
                  <thead>
                    <tr>
                      <th>Order ID</th>
                      <th>Customer Name</th>
                      <th>SKU Code</th>
                      <th>Quantity</th>
                      <th>Resolved Price (XLOOKUP)</th>
                      <th>Total Gross</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>ORD-9021</td>
                      <td>Tata Steel Ltd</td>
                      <td>SKU-ST-401</td>
                      <td>250</td>
                      <td class="highlight-cell">₹14,500.00</td>
                      <td>₹36,25,000.00</td>
                    </tr>
                    <tr>
                      <td>ORD-9022</td>
                      <td>Reliance Infra</td>
                      <td>SKU-CB-102</td>
                      <td>120</td>
                      <td class="highlight-cell">₹8,750.00</td>
                      <td>₹10,50,000.00</td>
                    </tr>
                    <tr>
                      <td>ORD-9023</td>
                      <td>L&T Construction</td>
                      <td>SKU-VL-880</td>
                      <td>40</td>
                      <td class="highlight-cell">₹32,000.00</td>
                      <td>₹12,80,000.00</td>
                    </tr>
                    <tr>
                      <td>ORD-9024</td>
                      <td>Infosys Campus</td>
                      <td>SKU-NT-550</td>
                      <td>500</td>
                      <td class="highlight-cell">₹1,850.00</td>
                      <td>₹9,25,000.00</td>
                    </tr>
                    <tr>
                      <td>ORD-9025</td>
                      <td>Wipro Technologies</td>
                      <td>SKU-CB-102</td>
                      <td>85</td>
                      <td class="highlight-cell">₹8,750.00</td>
                      <td>₹7,43,750.00</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="sidebar">
                <h3>XLOOKUP Argument Inspector</h3>
                <div class="arg-box">
                  <div class="arg-title">lookup_value: E2</div>
                  <div class="arg-desc">Target SKU to locate dynamically.</div>
                </div>
                <div class="arg-box">
                  <div class="arg-title">lookup_array: tbl[SKU]</div>
                  <div class="arg-desc">One-dimensional key column vector.</div>
                </div>
                <div class="arg-box">
                  <div class="arg-title">return_array: tbl[Price]</div>
                  <div class="arg-desc">Returned data vector (supports left lookup!).</div>
                </div>
                <div class="arg-box">
                  <div class="arg-title">if_not_found: "NOT FOUND"</div>
                  <div class="arg-desc">Built-in error trap (No #N/A!).</div>
                </div>
                <div style="margin-top:14px; text-align:right;">
                  <span class="badge badge-active">Exact Match Default (0)</span>
                </div>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    },
    {
        "filename": "excel-conditional-formatting-ui.png",
        "title": "Excel 365 - Conditional Formatting Rules Manager",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #0c4a2b; padding: 20px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .dialog { width: 1100px; background: #fff; border-radius: 8px; box-shadow: 0 25px 60px rgba(0,0,0,0.4); overflow: hidden; border: 1px solid #9ca3af; }
            .d-header { background: #f3f4f6; padding: 12px 20px; border-bottom: 1px solid #d1d5db; display: flex; justify-content: space-between; align-items: center; }
            .d-header h2 { font-size: 15px; color: #111827; font-weight: 700; }
            .d-body { padding: 20px; }
            .toolbar { display: flex; gap: 10px; margin-bottom: 16px; }
            .btn { padding: 6px 14px; border-radius: 4px; font-size: 12px; font-weight: 600; cursor: pointer; border: 1px solid #d1d5db; background: #fff; }
            .btn-primary { background: #107C41; color: white; border-color: #107C41; }
            .rules-table { width: 100%; border-collapse: collapse; font-size: 12px; }
            .rules-table th { background: #f9fafb; border: 1px solid #e5e7eb; padding: 10px; text-align: left; color: #374151; }
            .rules-table td { border: 1px solid #e5e7eb; padding: 10px; color: #1f2937; vertical-align: middle; }
            .chip-green { background: #dcfce7; color: #15803d; padding: 4px 8px; border-radius: 4px; font-weight: bold; border: 1px solid #86efac; display: inline-block; }
            .chip-red { background: #fee2e2; color: #b91c1c; padding: 4px 8px; border-radius: 4px; font-weight: bold; border: 1px solid #fca5a5; display: inline-block; }
            .chip-amber { background: #fef3c7; color: #b45309; padding: 4px 8px; border-radius: 4px; font-weight: bold; border: 1px solid #fde68a; display: inline-block; }
            .sample-box { display: flex; align-items: center; gap: 8px; font-family: monospace; }
            .footer-info { margin-top: 18px; padding-top: 14px; border-top: 1px solid #e5e7eb; display: flex; justify-content: space-between; font-size: 11px; color: #6b7280; }
          </style>
        </head>
        <body>
          <div class="dialog">
            <div class="d-header">
              <h2>Conditional Formatting Rules Manager - Current Selection</h2>
              <span style="color:#6b7280; font-size:12px;">Applies to: =$G$2:$G$150</span>
            </div>
            <div class="d-body">
              <div class="toolbar">
                <button class="btn btn-primary">+ New Rule...</button>
                <button class="btn">Edit Rule...</button>
                <button class="btn">Delete Rule</button>
                <button class="btn">Move Up ▲</button>
                <button class="btn">Move Down ▼</button>
              </div>
              <table class="rules-table">
                <thead>
                  <tr>
                    <th>Rule (Applied in Order)</th>
                    <th>Format Preview</th>
                    <th>Applies to Range</th>
                    <th>Stop If True</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><strong>Formula: =G2 &gt;= 100000</strong><br><span style="color:#6b7280; font-size:11px;">High-Value Revenue Alert</span></td>
                    <td><div class="sample-box"><span class="chip-green">AaBbCc ₹1,45,000</span></div></td>
                    <td>=$G$2:$G$150</td>
                    <td><input type="checkbox" checked></td>
                  </tr>
                  <tr>
                    <td><strong>Formula: =AND(G2&lt;20000, G2&gt;0)</strong><br><span style="color:#6b7280; font-size:11px;">Critical Low Revenue Trigger</span></td>
                    <td><div class="sample-box"><span class="chip-red">AaBbCc ₹12,400</span></div></td>
                    <td>=$G$2:$G$150</td>
                    <td><input type="checkbox" checked></td>
                  </tr>
                  <tr>
                    <td><strong>Cell Value between 20000 and 99999</strong><br><span style="color:#6b7280; font-size:11px;">Moderate Performance Slab</span></td>
                    <td><div class="sample-box"><span class="chip-amber">AaBbCc ₹54,200</span></div></td>
                    <td>=$G$2:$G$150</td>
                    <td><input type="checkbox"></td>
                  </tr>
                </tbody>
              </table>
              <div class="footer-info">
                <span>RTechLab Financial Architecture Standard · Color-Coded Executive KPIs</span>
                <span>Press Alt + O + D to trigger Conditional Formatting Manager</span>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    },
    {
        "filename": "word-mailmerge-ui.png",
        "title": "Word 365 - Mail Merge Automation Architecture",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #185ABD; padding: 20px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .window { width: 1200px; background: #fff; border-radius: 8px; box-shadow: 0 20px 50px rgba(0,0,0,0.3); overflow: hidden; }
            .titlebar { background: #185ABD; color: white; padding: 10px 18px; display: flex; justify-content: space-between; font-size: 13px; font-weight: 600; }
            .ribbon { background: #f3f4f6; border-bottom: 1px solid #d1d5db; padding: 8px 18px; display: flex; gap: 20px; font-size: 13px; color: #374151; }
            .ribbon span.active { color: #185ABD; font-weight: 700; border-bottom: 2px solid #185ABD; padding-bottom: 4px; }
            .mailings-tools { background: #ffffff; border-bottom: 1px solid #e5e7eb; padding: 10px 20px; display: flex; gap: 15px; align-items: center; font-size: 12px; }
            .tool-btn { background: #eff6ff; border: 1px solid #bfdbfe; color: #1d4ed8; padding: 6px 12px; border-radius: 4px; font-weight: 600; }
            .layout-doc { display: grid; grid-template-columns: 2.2fr 1fr; gap: 20px; padding: 25px; background: #e5e7eb; }
            .paper { background: white; border-radius: 4px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); padding: 40px; min-height: 400px; font-size: 13px; line-height: 1.6; color: #1f2937; }
            .field-pill { background: #fef08a; border: 1px dashed #ca8a04; color: #854d0e; padding: 1px 6px; border-radius: 3px; font-family: monospace; font-weight: bold; }
            .recipient-pane { background: white; border-radius: 4px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); padding: 20px; }
            .recipient-pane h4 { font-size: 13px; color: #185ABD; margin-bottom: 12px; font-weight: 700; }
            .rec-item { padding: 8px; border-bottom: 1px solid #f3f4f6; font-size: 12px; display: flex; justify-content: space-between; }
            .badge-verified { color: #16a34a; font-weight: bold; }
          </style>
        </head>
        <body>
          <div class="window">
            <div class="titlebar">
              <span>Appointment_Offer_Letters_Master.docx - Word</span>
              <span>Rahul Patel · RTechLab Corporate Publishing</span>
            </div>
            <div class="ribbon">
              <span>Home</span>
              <span>Insert</span>
              <span>Design</span>
              <span>Layout</span>
              <span>References</span>
              <span class="active">Mailings</span>
              <span>Review</span>
              <span>View</span>
            </div>
            <div class="mailings-tools">
              <span class="tool-btn">Select Recipients (Excel Sheet)</span>
              <span class="tool-btn">Insert Merge Field ▼</span>
              <span class="tool-btn" style="background:#dcfce7; border-color:#86efac; color:#15803d;">«» Highlight Merge Fields</span>
              <span class="tool-btn" style="background:#185ABD; color:white;">Finish & Merge ▼</span>
            </div>
            <div class="layout-doc">
              <div class="paper">
                <p style="text-align:right; color:#6b7280; font-size:11px;">Ref: RTL/HR/2027/«EMP_ID»</p>
                <p style="margin-top:14px;"><strong>To,</strong><br>
                <span class="field-pill">«Candidate_Full_Name»</span><br>
                <span class="field-pill">«Residential_Address»</span><br>
                <span class="field-pill">«City_State_PIN»</span></p>

                <p style="margin-top:16px;">Dear <span class="field-pill">«Candidate_First_Name»</span>,</p>

                <p style="margin-top:10px;">We are pleased to offer you the position of <strong><span class="field-pill">«Designation»</span></strong> at RTechLab Solutions. Your annual Cost to Company (CTC) will be <strong><span class="field-pill">«Annual_CTC_INR»</span></strong> effective from your date of joining on <strong><span class="field-pill">«Joining_Date»</span></strong>.</p>

                <p style="margin-top:10px;">Please report to our corporate office at 9:00 AM on the aforementioned date.</p>

                <p style="margin-top:24px;">Sincerely,<br>
                <strong>Human Resources Directorate</strong><br>
                RTechLab Technologies India</p>
              </div>
              <div class="recipient-pane">
                <h4>Connected Data Source: Recipient_List.xlsx</h4>
                <div class="rec-item">
                  <span>Record 1: Rahul Sharma</span>
                  <span class="badge-verified">✓ Loaded</span>
                </div>
                <div class="rec-item">
                  <span>Record 2: Priya Deshmukh</span>
                  <span class="badge-verified">✓ Loaded</span>
                </div>
                <div class="rec-item">
                  <span>Record 3: Ananya Nair</span>
                  <span class="badge-verified">✓ Loaded</span>
                </div>
                <div class="rec-item">
                  <span>Record 4: Amit Singhania</span>
                  <span class="badge-verified">✓ Loaded</span>
                </div>
                <div style="margin-top:16px; font-size:11px; color:#6b7280; line-height:1.4;">
                  <strong>Rule Applied:</strong> Filtered for Status = "Accepted". Total 128 merged documents generated in 4.2 seconds.
                </div>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    },
    {
        "filename": "ppt-slidemaster-ui.png",
        "title": "PowerPoint 365 - Slide Master Architecture & Theme Hierarchy",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #C43E1C; padding: 20px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .window { width: 1220px; background: #fff; border-radius: 8px; box-shadow: 0 20px 50px rgba(0,0,0,0.3); overflow: hidden; }
            .titlebar { background: #C43E1C; color: white; padding: 10px 18px; display: flex; justify-content: space-between; font-size: 13px; font-weight: 600; }
            .ribbon { background: #f3f4f6; border-bottom: 1px solid #d1d5db; padding: 8px 18px; display: flex; gap: 20px; font-size: 13px; color: #374151; }
            .ribbon span.active { color: #C43E1C; font-weight: 700; border-bottom: 2px solid #C43E1C; padding-bottom: 4px; }
            .workspace { display: grid; grid-template-columns: 240px 1fr; min-height: 480px; }
            .master-sidebar { background: #262626; padding: 16px; color: white; border-right: 1px solid #404040; }
            .sidebar-title { font-size: 11px; text-transform: uppercase; color: #a3a3a3; font-weight: 700; margin-bottom: 12px; }
            .master-thumb { background: #404040; border-radius: 4px; padding: 8px; margin-bottom: 12px; border: 2px solid #C43E1C; }
            .child-thumb { background: #333333; border-radius: 4px; padding: 6px; margin-bottom: 8px; margin-left: 20px; border-left: 2px solid #a3a3a3; font-size: 11px; color: #d4d4d4; }
            .canvas-area { background: #f5f5f5; padding: 30px; display: flex; justify-content: center; align-items: center; }
            .slide-canvas { width: 700px; height: 394px; background: white; box-shadow: 0 10px 25px rgba(0,0,0,0.15); padding: 30px; position: relative; border-radius: 4px; }
            .master-banner { background: #C43E1C; color: white; padding: 12px 20px; font-size: 18px; font-weight: 700; border-radius: 2px; }
            .dashed-placeholder { border: 2px dashed #9ca3af; padding: 20px; margin-top: 20px; border-radius: 4px; color: #6b7280; font-size: 13px; }
            .footer-branding { position: absolute; bottom: 14px; left: 30px; right: 30px; display: flex; justify-content: space-between; font-size: 10px; color: #9ca3af; border-top: 1px solid #e5e7eb; padding-top: 6px; }
          </style>
        </head>
        <body>
          <div class="window">
            <div class="titlebar">
              <span>Corporate_Deck_Master_Template.pptx - Slide Master View - PowerPoint</span>
              <span>Rahul Patel · RTechLab Design Standards</span>
            </div>
            <div class="ribbon">
              <span class="active">Slide Master</span>
              <span>Insert Layout</span>
              <span>Master Layout</span>
              <span>Themes</span>
              <span>Colors</span>
              <span>Fonts</span>
              <span style="background:#fee2e2; color:#b91c1c; padding:2px 8px; border-radius:4px; font-weight:bold;">Close Master View ✕</span>
            </div>
            <div class="workspace">
              <div class="master-sidebar">
                <div class="sidebar-title">Master Slide Tree</div>
                <div class="master-thumb">
                  <strong>★ Primary Slide Master (1)</strong>
                  <div style="font-size:10px; color:#a3a3a3; margin-top:2px;">Controls global fonts, logos & footers</div>
                </div>
                <div class="child-thumb">1_Title Slide Layout</div>
                <div class="child-thumb" style="border-left-color:#C43E1C; color:white; font-weight:bold;">2_Title & Content (Active)</div>
                <div class="child-thumb">3_Section Header Layout</div>
                <div class="child-thumb">4_Two Content Comparison</div>
                <div class="child-thumb">5_Executive KPI Dashboard</div>
              </div>
              <div class="canvas-area">
                <div class="slide-canvas">
                  <div class="master-banner">
                    Click to edit Master title style
                  </div>
                  <div class="dashed-placeholder">
                    • Click to edit Master text styles<br>
                    &nbsp;&nbsp;– Second level bullet style<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;— Third level bullet style<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;• Fourth level bullet style
                  </div>
                  <div class="footer-branding">
                    <span>RTechLab Official Deck · 2027 Edition</span>
                    <span>Confidential & Proprietary</span>
                    <span>&lt;#&gt;</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    },
    {
        "filename": "copilot-office365-ui.png",
        "title": "Microsoft 365 Copilot - AI Executive Assistant Pane",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #4f46e5; padding: 20px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .window { width: 1220px; background: #fff; border-radius: 8px; box-shadow: 0 20px 50px rgba(0,0,0,0.3); overflow: hidden; display: grid; grid-template-columns: 2fr 1.1fr; }
            .left-editor { background: #f9fafb; padding: 25px; border-right: 1px solid #e5e7eb; }
            .header-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
            .header-bar h2 { font-size: 16px; color: #111827; }
            .mock-grid { width: 100%; border-collapse: collapse; background: white; font-size: 12px; border-radius: 4px; overflow: hidden; box-shadow: 0 1px 3px rgba(0,0,0,0.08); }
            .mock-grid th { background: #107C41; color: white; padding: 8px; text-align: left; }
            .mock-grid td { padding: 8px; border-bottom: 1px solid #f3f4f6; }
            .copilot-pane { background: #ffffff; display: flex; flex-direction: column; height: 100%; }
            .c-header { background: linear-gradient(135deg, #6366f1, #a855f7); color: white; padding: 14px 20px; display: flex; align-items: center; gap: 10px; font-weight: 700; font-size: 14px; }
            .c-chat { flex: 1; padding: 18px; font-size: 12px; display: flex; flex-direction: column; gap: 14px; }
            .user-msg { background: #f3f4f6; padding: 10px 14px; border-radius: 12px 12px 2px 12px; align-self: flex-end; max-width: 85%; color: #1f2937; }
            .ai-msg { background: #f5f3ff; border: 1px solid #ddd6fe; padding: 12px 14px; border-radius: 12px 12px 12px 2px; align-self: flex-start; max-width: 90%; color: #312e81; }
            .ai-action-btn { background: #4f46e5; color: white; border: none; padding: 6px 12px; border-radius: 4px; font-weight: 600; margin-top: 8px; cursor: pointer; display: inline-block; }
            .c-input { border-top: 1px solid #e5e7eb; padding: 14px; background: #fafafa; display: flex; gap: 8px; }
            .c-input input { flex: 1; padding: 8px 12px; border: 1px solid #d1d5db; border-radius: 6px; font-size: 12px; outline: none; }
          </style>
        </head>
        <body>
          <div class="window">
            <div class="left-editor">
              <div class="header-bar">
                <h2>Quarterly_Revenue_Model_2027.xlsx</h2>
                <span style="font-size:11px; background:#e0e7ff; color:#4338ca; padding:3px 8px; border-radius:4px; font-weight:bold;">Copilot Active</span>
              </div>
              <table class="mock-grid">
                <thead>
                  <tr>
                    <th>Region</th>
                    <th>Q1 Actual</th>
                    <th>Q2 Actual</th>
                    <th>Projected Q3</th>
                    <th>Growth %</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>North India</td>
                    <td>₹84,20,000</td>
                    <td>₹96,50,000</td>
                    <td>₹1,12,00,000</td>
                    <td style="color:#16a34a; font-weight:bold;">+16.0%</td>
                  </tr>
                  <tr>
                    <td>West India</td>
                    <td>₹1,12,00,000</td>
                    <td>₹1,28,40,000</td>
                    <td>₹1,45,00,000</td>
                    <td style="color:#16a34a; font-weight:bold;">+12.9%</td>
                  </tr>
                  <tr>
                    <td>South India</td>
                    <td>₹92,10,000</td>
                    <td>₹1,04,20,000</td>
                    <td>₹1,18,50,000</td>
                    <td style="color:#16a34a; font-weight:bold;">+13.7%</td>
                  </tr>
                  <tr>
                    <td>East India</td>
                    <td>₹45,00,000</td>
                    <td>₹48,20,000</td>
                    <td>₹55,00,000</td>
                    <td style="color:#16a34a; font-weight:bold;">+14.1%</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="copilot-pane">
              <div class="c-header">
                <span>✦ Microsoft 365 Copilot</span>
              </div>
              <div class="c-chat">
                <div class="user-msg">
                  Identify top performing region and write a forecast formula for Q4 based on average quarterly velocity.
                </div>
                <div class="ai-msg">
                  <strong>Analysis Complete:</strong><br>
                  • Top Region: <strong>West India</strong> (₹1.45 Cr Projected Q3).<br>
                  • Suggested Formula: <code>=FORECAST.ETS(E2, C2:D2, {1,2})</code>.<br>
                  I have prepared a new forecast column for your review.
                  <br>
                  <span class="ai-action-btn">Insert Column to Grid →</span>
                </div>
              </div>
              <div class="c-input">
                <input type="text" placeholder="Ask Copilot a question or command..." value="Calculate CAGR across all 4 territories">
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    }
]

for sc in screens:
    dest_png = os.path.join(out_dir, sc["filename"])
    temp_html = os.path.join(out_dir, f"temp_{sc['filename']}.html")
    with open(temp_html, "w", encoding="utf-8") as f:
        f.write(sc["html"])
    
    cmd = [
        chrome_path,
        "--headless",
        "--disable-gpu",
        f"--screenshot={os.path.abspath(dest_png)}",
        "--window-size=1280,720",
        os.path.abspath(temp_html)
    ]
    subprocess.run(cmd, check=True)
    if os.path.exists(temp_html):
        os.remove(temp_html)
    print(f"Generated: {sc['filename']} ({round(os.path.getsize(dest_png)/1024, 1)} KB)")

print("All extra UI screenshots generated successfully!")
