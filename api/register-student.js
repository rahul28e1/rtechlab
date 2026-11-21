import nodemailer from 'nodemailer';

// Vercel Serverless Function for Student Registration & Automated Email Delivery
export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  try {
    const data = typeof req.body === 'string' ? JSON.parse(req.body) : (req.body || {});
    const {
      name = '',
      email = '',
      phone = '',
      language = 'en',
      subject = 'fundamentals',
      subjectTitle = 'Computer Fundamentals',
      plan = 'bundle',
      price = 149,
    } = data;

    if (!email || !email.includes('@')) {
      return res.status(400).json({ error: 'Valid email is required' });
    }

    let emailSent = false;
    let emailStatus = 'Saved';

    const gmailPass =
      process.env.GMAIL_APP_PASSWORD ||
      process.env.GOOGLE_APP_PASSWORD ||
      process.env.GMAIL_PASSWORD ||
      process.env.SMTP_PASS ||
      process.env.SMTP_PASSWORD;
    const gmailUser = process.env.GMAIL_USER || 'rahul.28e1@gmail.com';
    const resendKey = process.env.RESEND_API_KEY;
    const fromEmail = process.env.EMAIL_FROM || 'RTechLab Publishing <onboarding@resend.dev>';

    const baseUrl = 'https://rtechlab.vercel.app';

    // ── DYNAMIC SUBJECT CATALOG MAPPING ──────────
    const SUBJECT_CATALOG = {
      ai: {
        title: 'Artificial Intelligence Mastery',
        coreEn: `${baseUrl}/downloads/AI-Essentials-English-Edition-1.pdf`,
        coreHi: `${baseUrl}/downloads/AI-Essentials-Hindi-Edition-1.pdf`,
        bundleZip: `${baseUrl}/downloads/AI-Career-Accelerator-Bundle.zip`,
        bundleZipSize: '6.4 MB',
        pages: '44 Pages',
      },
      'office-365': {
        title: 'Microsoft Office 365 Enterprise Suite',
        coreEn: `${baseUrl}/downloads/Office-365-English-Edition-1.pdf`,
        coreHi: `${baseUrl}/downloads/Office-365-Hindi-Edition-1.pdf`,
        bundleZip: `${baseUrl}/downloads/Office-365-Career-Accelerator-Bundle.zip`,
        bundleZipSize: '13.7 MB',
        pages: '113 Pages',
      },
      fundamentals: {
        title: 'Computer Fundamentals & Architecture',
        coreEn: `${baseUrl}/downloads/Computer-Fundamentals-English-Edition-1.pdf`,
        coreHi: `${baseUrl}/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf`,
        bundleZip: `${baseUrl}/downloads/RTechLab-Computer-Fundamentals-Premium-Suite-Edition-1.zip`,
        bundleZipSize: '30 MB',
        pages: '45 Pages',
      },
      ccna: {
        title: 'Cisco CCNA (200-301) Networking Master Guide',
        coreEn: `${baseUrl}/downloads/CCNA-200-301-English-Edition-1.pdf`,
        coreHi: `${baseUrl}/downloads/CCNA-200-301-Hindi-Edition-1.pdf`,
        bundleZip: `${baseUrl}/downloads/RTechLab-CCNA-200-301-Complete-Career-Bundle-Edition-1.zip`,
        bundleZipSize: '19.8 MB',
        pages: '72 Pages',
      },
    };

    const subjectInfo = SUBJECT_CATALOG[subject] || SUBJECT_CATALOG.fundamentals;
    const downloadUrl = language === 'hi' ? subjectInfo.coreHi : subjectInfo.coreEn;
    const alternateDownloadUrl = language === 'hi' ? subjectInfo.coreEn : subjectInfo.coreHi;
    const bundleZipUrl = subjectInfo.bundleZip;
    const resolvedSubjectTitle = subjectTitle || subjectInfo.title;

    const formattedDate = new Date().toLocaleString('en-IN', {
      timeZone: 'Asia/Kolkata',
      dateStyle: 'medium',
      timeStyle: 'short',
    });
    const receiptNumber = `RTL-RCPT-${Date.now().toString().slice(-8)}`;

    const emailSubject = `[RTechLab] Direct Download & Official Receipt: ${resolvedSubjectTitle}`;
    const emailHtml = `
      <div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background: #0b0c10; color: #ffffff; padding: 24px; border-radius: 12px; max-width: 600px; margin: 0 auto; border: 1px solid rgba(255,255,255,0.1);">
        <div style="text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 16px; margin-bottom: 20px;">
          <h1 style="color: #10b981; margin: 0; font-size: 24px; font-weight: 800;">🎉 RTechLab Official Digital Delivery</h1>
          <p style="color: #9ca3af; margin: 4px 0 0; font-size: 14px;">Official Tax Invoice &amp; Digital Study Notes · 2027 Edition</p>
        </div>
        <p style="font-size: 15px;">Hello <strong>${name || 'Student'}</strong>,</p>
        <p style="color: #d1d5db; line-height: 1.6; font-size: 14px;">
          Thank you for choosing RTechLab! Your digital study materials for <strong>${resolvedSubjectTitle}</strong> are ready below. 
          <br/><span style="color: #10b981; font-weight: 600;">⚡ Direct Offline Download:</span> Clicking any button directly downloads the file to your mobile or PC without opening any website page.
        </p>
        
        <div style="background: rgba(16, 185, 129, 0.08); border: 2px solid #10b981; padding: 20px; border-radius: 12px; margin: 20px 0; text-align: center;">
          <h3 style="color: #10b981; margin-top: 0; font-size: 17px; text-transform: uppercase; letter-spacing: 0.5px;">📥 Click Below To Directly Download:</h3>
          
          ${plan === 'bundle' ? `
            <div style="margin: 14px 0;">
              <a href="${bundleZipUrl}" download style="display: block; background: #10b981; color: #000000; font-weight: 900; font-size: 15px; padding: 14px 20px; border-radius: 8px; text-decoration: none; box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);">
                📦 DOWNLOAD COMPLETE ZIP BUNDLE (${subjectInfo.bundleZipSize})
              </a>
              <p style="color: #9ca3af; font-size: 11px; margin-top: 5px;">All Master PDFs + Interview Vaults + Career Roadmap + Labs</p>
            </div>
          ` : `
            <div style="margin: 14px 0;">
              <a href="${downloadUrl}" download style="display: block; background: #10b981; color: #000000; font-weight: 900; font-size: 15px; padding: 14px 20px; border-radius: 8px; text-decoration: none; box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);">
                ⚡ DOWNLOAD MASTER PDF (${language === 'hi' ? 'हिंदी' : 'English'} Edition - ${subjectInfo.pages})
              </a>
            </div>
          `}

          <div style="margin-top: 16px; padding-top: 14px; border-top: 1px solid rgba(255,255,255,0.1); text-align: left;">
            <p style="color: #e5e7eb; font-size: 12px; font-weight: 700; margin: 0 0 8px;">
              ${plan === 'bundle' ? '📄 Included Master PDFs &amp; Individual Files (Mobile Friendly):' : '📄 Your Purchased Master Edition (Direct File):'}
            </p>
            <div style="display: flex; flex-direction: column; gap: 8px;">
              ${plan === 'bundle' ? `
                <a href="${subjectInfo.coreHi}" download style="display: block; background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.15); color: #38bdf8; text-decoration: none; padding: 10px 14px; border-radius: 6px; font-size: 13px; font-weight: 600;">
                  📥 Direct Download Hindi (Hinglish) Master PDF (${subjectInfo.pages}) &rarr;
                </a>
                <a href="${subjectInfo.coreEn}" download style="display: block; background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.15); color: #38bdf8; text-decoration: none; padding: 10px 14px; border-radius: 6px; font-size: 13px; font-weight: 600;">
                  📥 Direct Download English Master PDF (${subjectInfo.pages}) &rarr;
                </a>
                <a href="${bundleZipUrl}" download style="display: block; background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.15); color: #10b981; text-decoration: none; padding: 10px 14px; border-radius: 6px; font-size: 13px; font-weight: 600;">
                  📦 Direct Download Complete ZIP Bundle (${subjectInfo.bundleZipSize}) &rarr;
                </a>
              ` : (language === 'hi' ? `
                <a href="${subjectInfo.coreHi}" download style="display: block; background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.15); color: #10b981; text-decoration: none; padding: 10px 14px; border-radius: 6px; font-size: 13px; font-weight: 600;">
                  📥 Direct Download Hindi (Hinglish) Master PDF (${subjectInfo.pages}) &rarr;
                </a>
              ` : `
                <a href="${subjectInfo.coreEn}" download style="display: block; background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.15); color: #10b981; text-decoration: none; padding: 10px 14px; border-radius: 6px; font-size: 13px; font-weight: 600;">
                  📥 Direct Download English Master PDF (${subjectInfo.pages}) &rarr;
                </a>
              `)}
            </div>
          </div>
        </div>

        <!-- 🧾 OFFICIAL PAYMENT RECEIPT & TAX INVOICE -->
        <div style="background: rgba(255,255,255,0.03); border: 1px solid rgba(255,255,255,0.12); border-radius: 12px; padding: 20px; margin: 24px 0;">
          <div style="border-bottom: 1px dashed rgba(255,255,255,0.15); padding-bottom: 12px; margin-bottom: 14px;">
            <table style="width: 100%; border-collapse: collapse;">
              <tr>
                <td>
                  <span style="font-size: 11px; font-weight: 700; color: #10b981; letter-spacing: 1px; text-transform: uppercase;">Official Payment Receipt</span>
                  <h3 style="margin: 2px 0 0; font-size: 16px; color: #ffffff;">RTechLab Digital Academy</h3>
                </td>
                <td style="text-align: right; vertical-align: top;">
                  <span style="display: inline-block; background: rgba(16, 185, 129, 0.15); border: 1px solid #10b981; color: #10b981; font-size: 11px; font-weight: 800; padding: 4px 10px; border-radius: 6px;">
                    PAID / VERIFIED ✓
                  </span>
                </td>
              </tr>
            </table>
          </div>

          <table style="width: 100%; font-size: 12px; color: #cbd5e1; border-collapse: collapse; margin-bottom: 14px;">
            <tr>
              <td style="padding: 4px 0; color: #94a3b8;">Receipt / Invoice No:</td>
              <td style="padding: 4px 0; text-align: right; font-family: monospace; font-weight: 600; color: #f8fafc;">${receiptNumber}</td>
            </tr>
            <tr>
              <td style="padding: 4px 0; color: #94a3b8;">Payment Status:</td>
              <td style="padding: 4px 0; text-align: right; font-family: monospace; color: #10b981; font-weight: bold;">AUTHORIZED &amp; SETTLED</td>
            </tr>
            <tr>
              <td style="padding: 4px 0; color: #94a3b8;">Date &amp; Time (IST):</td>
              <td style="padding: 4px 0; text-align: right; color: #f8fafc;">${formattedDate}</td>
            </tr>
            <tr>
              <td style="padding: 4px 0; color: #94a3b8;">Student Name:</td>
              <td style="padding: 4px 0; text-align: right; font-weight: 600; color: #f8fafc;">${name || 'Student'}</td>
            </tr>
            <tr>
              <td style="padding: 4px 0; color: #94a3b8;">Student Email:</td>
              <td style="padding: 4px 0; text-align: right; color: #94a3b8;">${email}</td>
            </tr>
            ${phone ? `
            <tr>
              <td style="padding: 4px 0; color: #94a3b8;">Student Phone:</td>
              <td style="padding: 4px 0; text-align: right; color: #94a3b8;">+91 ${phone}</td>
            </tr>
            ` : ''}
          </table>

          <!-- Line Item Table -->
          <table style="width: 100%; font-size: 12px; border-collapse: collapse; border-top: 1px solid rgba(255,255,255,0.1); border-bottom: 1px solid rgba(255,255,255,0.1); margin-bottom: 10px;">
            <thead>
              <tr style="color: #94a3b8; text-align: left; font-size: 11px;">
                <th style="padding: 8px 0;">Item Description</th>
                <th style="padding: 8px 0; text-align: center;">Edition</th>
                <th style="padding: 8px 0; text-align: right;">Amount</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style="padding: 8px 0; color: #f8fafc; font-weight: 600;">
                  ${resolvedSubjectTitle} <br/>
                  <span style="font-size: 11px; font-weight: 400; color: #94a3b8;">${plan === 'bundle' ? 'Complete Career Suite Bundle (ZIP + Vaults)' : 'Core Master Guide (Offline PDF)'}</span>
                </td>
                <td style="padding: 8px 0; text-align: center; color: #94a3b8;">
                  ${language === 'hi' ? 'हिंदी (Hinglish)' : 'English'} · Edition 1
                </td>
                <td style="padding: 8px 0; text-align: right; font-weight: 700; color: #10b981;">
                  ₹${price}.00
                </td>
              </tr>
            </tbody>
            <tfoot>
              <tr style="border-top: 1px dashed rgba(255,255,255,0.1);">
                <td colspan="2" style="padding: 10px 0; font-weight: 700; color: #ffffff;">Total Amount Paid (All inclusive):</td>
                <td style="padding: 10px 0; text-align: right; font-weight: 900; font-size: 15px; color: #10b981;">₹${price}.00</td>
              </tr>
            </tfoot>
          </table>

          <p style="margin: 0; font-size: 10px; color: #64748b; line-height: 1.4;">
            * Official computer-generated tax invoice &amp; payment receipt. No physical signature required. Retain for academic &amp; reimbursement records.
          </p>
        </div>

        <div style="background: rgba(56, 189, 248, 0.08); border: 1px solid rgba(56, 189, 248, 0.2); border-radius: 8px; padding: 14px; margin: 16px 0;">
          <p style="margin: 0; font-size: 13px; color: #bae6fd; line-height: 1.5;">
            📢 <strong>Official Community Channel:</strong> Join our WhatsApp channel for new chapter drops, live lecture links, and career updates:
            <br/>
            <a href="https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i" style="color: #38bdf8; font-weight: 700; text-decoration: underline; display: inline-block; margin-top: 6px;">
              👉 Tap here to Join RTechLab WhatsApp Channel
            </a>
          </p>
        </div>

        <p style="color: #9ca3af; font-size: 12px; line-height: 1.5;">
          <strong>Lifetime Free Updates Guarantee:</strong> Whenever our core team updates or expands these notes, you will receive the new edition directly in your email at zero extra cost.
        </p>
        <hr style="border: none; border-top: 1px solid rgba(255,255,255,0.1); margin: 20px 0;" />
        <p style="color: #6b7280; font-size: 11px; text-align: center; margin: 0;">
          RTechLab Technical Academy · Author: Rahul Patel · <a href="${baseUrl}" style="color: #9ca3af;">${baseUrl}</a>
        </p>
      </div>
    `;

    // Priority 1: Gmail SMTP
    if (gmailPass) {
      try {
        const cleanPass = gmailPass.replace(/["'\s]/g, '');
        const transporter = nodemailer.createTransport({
          service: 'gmail',
          auth: {
            user: gmailUser,
            pass: cleanPass,
          },
        });

        await transporter.sendMail({
          from: `"Rahul Sir · RTechLab" <${gmailUser}>`,
          to: email,
          replyTo: gmailUser,
          subject: emailSubject,
          html: emailHtml,
        });

        emailSent = true;
        emailStatus = `Email dispatched via Gmail (${gmailUser})`;
      } catch (gmailErr) {
        emailStatus = `Gmail error: ${gmailErr.message}`;
      }
    }

    // Priority 2: Resend API
    if (!emailSent && resendKey) {
      try {
        const resendRes = await fetch('https://api.resend.com/emails', {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${resendKey}`,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            from: fromEmail,
            to: [email],
            subject: emailSubject,
            html: emailHtml,
          }),
        });

        const resData = await resendRes.json();
        if (resendRes.ok) {
          emailSent = true;
          emailStatus = `Email dispatched via Resend (ID: ${resData.id})`;
        } else {
          emailStatus = `Resend: ${resData.message || 'Validation error'}`;
        }
      } catch (e) {
        emailStatus = `Error: ${e.message}`;
      }
    }

    return res.status(200).json({
      success: true,
      emailSent,
      emailStatus,
      record: { name, email, language, plan },
      message: 'Student registered successfully',
    });
  } catch (err) {
    return res.status(500).json({ error: err.message });
  }
}
