/**
 * Dispatch Windows Server 2025 Master Editions (English, Gujarati, Hindi)
 * to Rahul Patel (rahuliantpln@gmail.com)
 */

const fs = require('fs');
const path = require('path');
const nodemailer = require('nodemailer');

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

async function sendDispatches() {
  const gmailUser = process.env.GMAIL_USER || 'rahul.28e1@gmail.com';
  const gmailPass = (process.env.GMAIL_APP_PASSWORD || '').replace(/["'\s]/g, '');
  const recipient = 'rahuliantpln@gmail.com';

  console.log(`[INFO] Preparing Windows Server 2025 release dispatch to: ${recipient}`);

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

  const driveLinks = {
    folder: 'https://drive.google.com/drive/folders/1hIDp2ibd08JcAWdaZLZFm383gFVShjF0',
    bundle: 'https://drive.google.com/file/d/1y2bpQmMbPgElo4AEZgy0pqiei6Q8cApr/view',
    en: 'https://drive.google.com/file/d/1mQLreAXx-IuzeBbQzhAEBPhbZ4Gc_GSY/view',
    gu: 'https://drive.google.com/file/d/1h9pXOVwSlHID2otJpdMZoWqFjtZ3eI6R/view',
    hi: 'https://drive.google.com/file/d/1l5krBYVWeCo5CerALmrr37LLdq8xkCH4/view',
    workbook: 'https://drive.google.com/file/d/1rXCa9QOs3iYajAr2t2YtpkxuN4K5YC77/view',
    blueprint: 'https://drive.google.com/file/d/1IGMw7uNltbhCFahHCRjggsmrYNPVud66/view',
    vault: 'https://drive.google.com/file/d/1p8fDDvSB1HDZOHyP3LHeZQT2K5yAzyOt/view'
  };

  const downloadsDir = path.resolve(process.cwd(), 'public/downloads');

  const editions = [
    {
      lang: 'English Master Edition',
      subject: '📘 [RTechLab Release] Microsoft Windows Server 2025 Master Guide (English Edition · 60 Pages)',
      filename: 'Windows-Server-2025-English-Master-Guide.pdf',
      badge: 'INTERNATIONAL MASTER EDITION',
      desc: '100% Enterprise English · Zero Devanagari · Exactly 60 Pages · All 14 Chapters'
    },
    {
      lang: 'Gujarati Master Edition',
      subject: '📙 [RTechLab Release] Microsoft Windows Server 2025 Master Guide (Gujarati Edition · 60 Pages)',
      filename: 'Windows-Server-2025-Gujarati-Master-Guide.pdf',
      badge: 'REGIONAL MASTER EDITION (ગુજરાતી)',
      desc: '100% Authentic Gujarati Script · Zero Devanagari · Exactly 60 Pages · All 14 Chapters'
    },
    {
      lang: 'Hindi Master Edition',
      subject: '📕 [RTechLab Release] Microsoft Windows Server 2025 Master Guide (Hindi Edition · 60 Pages)',
      filename: 'Windows-Server-2025-Hindi-Master-Guide.pdf',
      badge: 'NATIONAL MASTER EDITION (हिंदी)',
      desc: '100% Academic Hindi · Exactly 60 Pages · All 14 Chapters'
    }
  ];

  for (const ed of editions) {
    const filePath = path.join(downloadsDir, ed.filename);
    if (!fs.existsSync(filePath)) {
      console.error(`[ERROR] File not found: ${filePath}`);
      continue;
    }

    const fileSizeMb = (fs.statSync(filePath).size / (1024 * 1024)).toFixed(2);
    console.log(`[DISPATCHING] ${ed.lang} (${fileSizeMb} MB)...`);

    const htmlContent = `
    <div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; max-width: 650px; margin: 0 auto; background: #ffffff; border: 1.5pt solid #0284C7; border-radius: 12px; padding: 24px; color: #1e293b;">
      <div style="text-align: center; border-bottom: 2px solid #0284C7; padding-bottom: 16px; margin-bottom: 20px;">
        <h1 style="color: #0f172a; margin: 0; font-size: 22px;">RTechLab Systems & Infrastructure Academy</h1>
        <p style="color: #0284c7; font-weight: bold; margin: 4px 0 0; font-size: 14px;">Microsoft Windows Server 2025 & Active Directory Master Suite</p>
        <span style="display: inline-block; background: #eff6ff; color: #0284c7; border: 1px solid #bae6fd; font-size: 11px; font-weight: bold; padding: 3px 10px; border-radius: 999px; margin-top: 8px;">
          ${ed.badge}
        </span>
      </div>

      <p style="font-size: 15px; line-height: 1.5;">Dear <strong>Rahul Patel</strong>,</p>
      <p style="font-size: 14px; line-height: 1.6; color: #334155;">
        As requested, here is your official release copy of the <strong>${ed.lang}</strong> for testing and verification.
      </p>

      <div style="background: #f8fafc; border-left: 4px solid #0284c7; padding: 14px 18px; margin: 20px 0; border-radius: 4px;">
        <h3 style="margin: 0 0 6px 0; font-size: 15px; color: #0f172a;">📄 Deliverable Overview</h3>
        <ul style="margin: 0; padding-left: 20px; font-size: 13.5px; color: #475569; line-height: 1.6;">
          <li><strong>Document:</strong> ${ed.filename}</li>
          <li><strong>Page Count:</strong> Exactly 60 Pages (Ends with Author Bio & Academy Dedication)</li>
          <li><strong>Format:</strong> High-Resolution Print-Ready Vector PDF (${fileSizeMb} MB)</li>
          <li><strong>Language Standard:</strong> ${ed.desc}</li>
        </ul>
      </div>

      <div style="margin: 24px 0; text-align: center;">
        <a href="${driveLinks.folder}" style="display: inline-block; background: #0284c7; color: #ffffff; text-decoration: none; padding: 12px 24px; border-radius: 6px; font-weight: bold; font-size: 14px; margin: 4px;">
          📂 Open Google Drive Master Folder
        </a>
        <a href="${driveLinks.bundle}" style="display: inline-block; background: #059669; color: #ffffff; text-decoration: none; padding: 12px 24px; border-radius: 6px; font-weight: bold; font-size: 14px; margin: 4px;">
          📦 Download Full Bundle (.ZIP)
        </a>
      </div>

      <div style="background: #f0fdf4; border: 1px solid #bbf7d0; border-radius: 8px; padding: 14px; margin: 20px 0;">
        <h4 style="margin: 0 0 8px 0; color: #166534; font-size: 13.5px;">🌐 Complete 2025 Deliverables on Google Drive:</h4>
        <ul style="margin: 0; padding-left: 18px; font-size: 12.5px; color: #15803d; line-height: 1.6;">
          <li><a href="${driveLinks.en}" style="color: #0369a1; text-decoration: none;">📘 English Master Guide (60 Pages, 0 Devanagari)</a></li>
          <li><a href="${driveLinks.gu}" style="color: #0369a1; text-decoration: none;">📙 Gujarati Master Guide (60 Pages, 0 Devanagari)</a></li>
          <li><a href="${driveLinks.hi}" style="color: #0369a1; text-decoration: none;">📕 Hindi Master Guide (60 Pages)</a></li>
          <li><a href="${driveLinks.workbook}" style="color: #0369a1; text-decoration: none;">🛠️ 16-Lab Practice & Hands-On Workbook (Watermarked)</a></li>
          <li><a href="${driveLinks.blueprint}" style="color: #0369a1; text-decoration: none;">💼 Career & Salary Blueprint (English Mentorship)</a></li>
          <li><a href="${driveLinks.vault}" style="color: #0369a1; text-decoration: none;">🎯 Top 50 MNC Placement Vault</a></li>
        </ul>
      </div>

      <div style="border-top: 1px solid #e2e8f0; padding-top: 16px; margin-top: 24px; font-size: 12px; color: #64748b; text-align: center;">
        <p style="margin: 0;">RTechLab Publications · Chief Technology Architect: Rahul Patel</p>
        <p style="margin: 4px 0 0;">WhatsApp 24x7 Helpline: <a href="https://wa.me/message/FUIEEQDZLUKVK1" style="color: #0284c7;">+91 76468 92094</a> · Official Email: rahul.28e1@gmail.com</p>
      </div>
    </div>
    `;

    const mailOptions = {
      from: `"RTechLab Publications" <${gmailUser}>`,
      to: recipient,
      subject: ed.subject,
      html: htmlContent,
      attachments: [
        {
          filename: ed.filename,
          path: filePath,
          contentType: 'application/pdf'
        }
      ]
    };

    const info = await transporter.sendMail(mailOptions);
    console.log(`[SUCCESS] Sent ${ed.lang} to ${recipient}! Message ID: ${info.messageId}`);
  }

  console.log('[ALL COMPLETED] All 3 editions dispatched successfully to rahuliantpln@gmail.com');
}

sendDispatches().catch(err => {
  console.error('[FATAL ERROR]', err);
  process.exit(1);
});
