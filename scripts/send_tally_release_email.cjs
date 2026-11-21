/**
 * Dispatch Tally Prime Hindi Notes & Complete Bundle to Rahul Sir (rahuliantpln@gmail.com)
 */

const fs = require('fs');
const path = require('path');
const nodemailer = require('nodemailer');

// Load environment variables
function loadEnv() {
  const envPath = path.resolve(process.cwd(), '.env');
  if (fs.existsSync(envPath)) {
    const lines = fs.readFileSync(envPath, 'utf8').split('\n');
    for (const line of lines) {
      const trimmed = line.trim();
      if (trimmed && !trimmed.startsWith('#')) {
        const idx = trimmed.indexOf('=');
        if (idx > -1) {
          const k = trimmed.slice(0, idx).trim();
          const v = trimmed.slice(idx + 1).trim().replace(/^["']|["']$/g, '');
          if (!process.env[k]) process.env[k] = v;
        }
      }
    }
  }
}
loadEnv();

async function sendReleaseEmail() {
  const gmailUser = process.env.GMAIL_USER || 'rahul.28e1@gmail.com';
  const gmailPass = (process.env.GMAIL_APP_PASSWORD || '').replace(/["'\s]/g, '');
  const recipient = 'rahuliantpln@gmail.com';

  console.log(`[INFO] Preparing Tally Prime release dispatch to: ${recipient}`);

  if (!gmailPass) {
    console.error('[ERROR] GMAIL_APP_PASSWORD is not configured in .env');
    process.exit(1);
  }

  const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: gmailUser,
      pass: gmailPass,
    },
  });

  const baseUrl = 'https://rtechlab.vercel.app';
  const hindiPdfPath = path.resolve(process.cwd(), 'public/downloads/Tally-Prime-Hindi-Edition-1.pdf');
  const gujaratiPdfPath = path.resolve(process.cwd(), 'public/downloads/Tally-Prime-Gujarati-Edition-1.pdf');
  const workbookPdfPath = path.resolve(process.cwd(), 'public/downloads/Tally-50-Invoice-Commercial-Workbook.pdf');
  const vaultPdfPath = path.resolve(process.cwd(), 'public/downloads/Tally-Top-50-Accountant-Interview-Vault.pdf');

  const emailHtml = `
    <div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; max-width: 650px; margin: 0 auto; background: #ffffff; border: 1.5pt solid #0E7490; border-radius: 12px; padding: 24px; color: #1e293b;">
      <div style="text-align: center; border-bottom: 2px solid #0E7490; padding-bottom: 16px; margin-bottom: 20px;">
        <h1 style="color: #0f172a; margin: 0; font-size: 22px;">RTechLab Official Publication Desk</h1>
        <p style="color: #0e7490; font-weight: bold; margin: 4px 0 0; font-size: 14px;">Tally Prime with GST & Corporate Accounting — Edition 1 Released</p>
      </div>

      <p style="font-size: 15px; line-height: 1.6; color: #334155;">
        आदरणीय राहुल सर (Rahul Sir),<br><br>
        आपके निर्देशानुसार <strong>Tally Prime with GST &amp; Corporate Accounting</strong> के सम्पूर्ण नोट्स (Hindi Edition, English Edition, Gujarati Edition) और पूरा <strong>Career Accelerator Bundle Suite</strong> तैयार कर दिया गया है।
      </p>

      <div style="background: #f0fdfa; border-left: 4px solid #059669; border-radius: 6px; padding: 14px; margin: 16px 0;">
        <h3 style="margin: 0 0 8px; color: #065f46; font-size: 15px;">📦 सम्पूर्ण बंडल सुइट में शामिल प्रमुख सामग्रियां:</h3>
        <ul style="margin: 0; padding-left: 20px; font-size: 13.5px; color: #1e293b; line-height: 1.6;">
          <li><strong>Tally Prime Hindi Master Guide:</strong> 16 अध्याय, सुनहरे नियम, 28 ग्रुप्स, 24 वाउचर्स, आधुनिक GST (0%, 5%, 18%) और TDS (अटैचमेंट में शामिल)।</li>
          <li><strong>Tally Prime Gujarati Edition (ગુજરાતી આવૃત્તિ):</strong> ગુજરાતના વિદ્યાર્થીઓ માટે શુદ્ધ વ્યાવસાયિક ભાષામાં સંપૂર્ણ ગાઇડ।</li>
          <li><strong>50-Invoice Commercial Mega-Workbook:</strong> APMC ઊંઝા/પાલનપુર જીરું-ઇસબગૂલ, ઇલેક્ટ્રોનિક્સ અને IGST બિલિંગ (16 પાના, સોલ્યુશન સાથે)।</li>
          <li><strong>Advanced TDS &amp; Form 26Q Practice Set:</strong> કલમ 194C, 194J, 194I, ચલણ 281 અને ત્રિમાસિક રિટર્ન।</li>
          <li><strong>Top 50 MNC &amp; Big-4 Interview Vault:</strong> ઉચ્ચ સ્તરીય ઇન્ટરવ્યુ પ્રશ્નોત્તરી (English Standard)।</li>
          <li><strong>Corporate Accountant Career &amp; Salary Blueprint:</strong> ₹2.5L થી ₹12L+ સુધીનો રોડમેપ અને ફ્રીલાન્સ પ્રેક્ટિસ બ્લુપ્રિન્ટ।</li>
        </ul>
      </div>

      <div style="background: #fffbeb; border: 1px solid #fde68a; border-radius: 8px; padding: 16px; margin: 20px 0; text-align: center;">
        <h3 style="color: #b45309; margin: 0 0 10px; font-size: 16px;">⚡ 1-क्लिक सम्पूर्ण बंडल डाउनलोड लिंक (7.9 MB):</h3>
        <a href="${baseUrl}/downloads/Tally-Prime-Career-Accelerator-Bundle.zip" style="background: #0e7490; color: #ffffff; text-decoration: none; padding: 12px 24px; border-radius: 6px; font-weight: bold; font-size: 14px; display: inline-block;">
          📥 Download Complete Tally Prime Bundle (ZIP)
        </a>
      </div>

      <h4 style="color: #0f172a; margin: 16px 0 8px;">🔗 प्रत्येक फाइल की डायरेक्ट लिंक:</h4>
      <table style="width: 100%; border-collapse: collapse; font-size: 12.5px;">
        <tr style="border-bottom: 1px solid #e2e8f0; background: #f8fafc;">
          <th style="padding: 8px; text-align: left;">फाइल का नाम</th>
          <th style="padding: 8px; text-align: right;">डाउनलोड लिंक</th>
        </tr>
        <tr style="border-bottom: 1px solid #e2e8f0;">
          <td style="padding: 8px;">1. Tally Prime Hindi Edition (Core Master)</td>
          <td style="padding: 8px; text-align: right;"><a href="${baseUrl}/downloads/Tally-Prime-Hindi-Edition-1.pdf" style="color: #0284c7; font-weight: bold;">Download PDF</a></td>
        </tr>
        <tr style="border-bottom: 1px solid #e2e8f0;">
          <td style="padding: 8px;">2. Tally Prime English Edition (Core Master)</td>
          <td style="padding: 8px; text-align: right;"><a href="${baseUrl}/downloads/Tally-Prime-English-Edition-1.pdf" style="color: #0284c7; font-weight: bold;">Download PDF</a></td>
        </tr>
        <tr style="border-bottom: 1px solid #e2e8f0;">
          <td style="padding: 8px;">3. Tally Prime Gujarati Edition (ગુજરાતી આવૃત્તિ)</td>
          <td style="padding: 8px; text-align: right;"><a href="${baseUrl}/downloads/Tally-Prime-Gujarati-Edition-1.pdf" style="color: #0284c7; font-weight: bold;">Download PDF</a></td>
        </tr>
        <tr style="border-bottom: 1px solid #e2e8f0;">
          <td style="padding: 8px;">4. 50-Invoice Commercial Mega-Workbook</td>
          <td style="padding: 8px; text-align: right;"><a href="${baseUrl}/downloads/Tally-50-Invoice-Commercial-Workbook.pdf" style="color: #0284c7; font-weight: bold;">Download PDF</a></td>
        </tr>
        <tr style="border-bottom: 1px solid #e2e8f0;">
          <td style="padding: 8px;">5. Advanced TDS & Form 26Q Practice Set</td>
          <td style="padding: 8px; text-align: right;"><a href="${baseUrl}/downloads/Tally-TDS-and-Form-26Q-Practice-Workbook.pdf" style="color: #0284c7; font-weight: bold;">Download PDF</a></td>
        </tr>
        <tr style="border-bottom: 1px solid #e2e8f0;">
          <td style="padding: 8px;">6. Top 50 Accountant Interview Vault</td>
          <td style="padding: 8px; text-align: right;"><a href="${baseUrl}/downloads/Tally-Top-50-Accountant-Interview-Vault.pdf" style="color: #0284c7; font-weight: bold;">Download PDF</a></td>
        </tr>
        <tr>
          <td style="padding: 8px;">7. Career & Salary Blueprint</td>
          <td style="padding: 8px; text-align: right;"><a href="${baseUrl}/downloads/Tally-Accountant-Career-Salary-Blueprint-Edition-1.pdf" style="color: #0284c7; font-weight: bold;">Download PDF</a></td>
        </tr>
      </table>

      <div style="margin-top: 24px; padding-top: 16px; border-top: 1px solid #e2e8f0; font-size: 12px; color: #64748b; line-height: 1.5;">
        <p style="margin: 0 0 6px;"><strong>RTechLab Motto:</strong> Technology Made Practical · Learn. Practice. Innovate.</p>
        <p style="margin: 0;"><strong>Mentorship Desk:</strong> <a href="mailto:rahuliantpln@gmail.com">rahuliantpln@gmail.com</a> · Official Platform: <a href="https://rtechlab.vercel.app">rtechlab.vercel.app</a></p>
      </div>
    </div>
  `;

  const attachments = [];
  if (fs.existsSync(hindiPdfPath)) {
    attachments.push({
      filename: 'Tally-Prime-Hindi-Edition-1.pdf',
      path: hindiPdfPath,
    });
  }

  const mailOptions = {
    from: `"Rahul Sir · RTechLab Publications" <${gmailUser}>`,
    to: recipient,
    cc: gmailUser,
    subject: '📚 [RTechLab Master Release] Tally Prime with GST & Corporate Accounting — Hindi Notes & Complete Bundle',
    html: emailHtml,
    attachments: attachments,
  };

  console.log(`[INFO] Sending email with ${attachments.length} attachment(s)...`);
  const info = await transporter.sendMail(mailOptions);
  console.log(`[SUCCESS] Email dispatched! Message ID: ${info.messageId}`);
  console.log(`[INFO] Response:`, info.response);
}

sendReleaseEmail().catch((err) => {
  console.error('[ERROR] Failed to send release email:', err);
  process.exit(1);
});
