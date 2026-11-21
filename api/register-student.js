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

    const emailSubject = `[RTechLab] Direct Download: Your ${resolvedSubjectTitle} Notes Are Ready`;
    const emailHtml = `
      <div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background: #0b0c10; color: #ffffff; padding: 24px; border-radius: 12px; max-width: 600px; margin: 0 auto; border: 1px solid rgba(255,255,255,0.1);">
        <div style="text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 16px; margin-bottom: 20px;">
          <h1 style="color: #10b981; margin: 0; font-size: 24px; font-weight: 800;">🎉 RTechLab Official Digital Delivery</h1>
          <p style="color: #9ca3af; margin: 4px 0 0; font-size: 14px;">Authorized Industrial Engineering Notes · 2027 Edition</p>
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
            <p style="color: #e5e7eb; font-size: 12px; font-weight: 700; margin: 0 0 8px;">📄 Individual Direct Master PDF Downloads (Mobile Friendly):</p>
            <div style="display: flex; flex-direction: column; gap: 8px;">
              <a href="${subjectInfo.coreHi}" download style="display: block; background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.15); color: #38bdf8; text-decoration: none; padding: 10px 14px; border-radius: 6px; font-size: 13px; font-weight: 600;">
                📥 Direct Download Hindi (Hinglish) Master PDF (${subjectInfo.pages}) &rarr;
              </a>
              <a href="${subjectInfo.coreEn}" download style="display: block; background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.15); color: #38bdf8; text-decoration: none; padding: 10px 14px; border-radius: 6px; font-size: 13px; font-weight: 600;">
                📥 Direct Download English Master PDF (${subjectInfo.pages}) &rarr;
              </a>
              ${plan === 'bundle' ? `
                <a href="${bundleZipUrl}" download style="display: block; background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.15); color: #10b981; text-decoration: none; padding: 10px 14px; border-radius: 6px; font-size: 13px; font-weight: 600;">
                  📦 Direct Download Complete ZIP Bundle (${subjectInfo.bundleZipSize}) &rarr;
                </a>
              ` : ''}
            </div>
          </div>
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
