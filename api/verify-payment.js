import crypto from 'crypto';
import nodemailer from 'nodemailer';

async function processVerifyLogic(data) {
  const order_id = data.razorpay_order_id || data.order_id;
  const payment_id = data.razorpay_payment_id || data.payment_id;
  const signature = data.razorpay_signature || data.signature;

  const {
    name = '',
    email = '',
    phone = '',
    language = 'en',
    subject = 'fundamentals',
    subjectTitle = 'Computer Fundamentals',
    plan = 'single',
    price = 49,
  } = data;

  if (!order_id || !payment_id || !signature) {
    return {
      status: 400,
      body: {
        success: false,
        verified: false,
        error: 'Missing required payment fields: order_id, payment_id, and signature are required.',
      },
    };
  }

  const keySecret = process.env.RAZORPAY_KEY_SECRET;
  if (!keySecret) {
    return {
      status: 500,
      body: {
        success: false,
        verified: false,
        error: 'RAZORPAY_KEY_SECRET is not configured on the server.',
      },
    };
  }

  const expectedSignature = crypto
    .createHmac('sha256', keySecret)
    .update(`${order_id}|${payment_id}`)
    .digest('hex');

  const isMatch = expectedSignature === signature;

  if (!isMatch) {
    return {
      status: 400,
      body: {
        success: false,
        verified: false,
        error: 'Payment verification failed: Signature mismatch. Access denied.',
      },
    };
  }

  const baseUrl = 'https://rtechlab.vercel.app';

  // ── DYNAMIC SUBJECT CATALOG MAPPING (ALL 4 RTECHLAB SUBJECTS) ──────────
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
  const coreDownloadUrl = language === 'hi' ? subjectInfo.coreHi : subjectInfo.coreEn;
  const alternateDownloadUrl = language === 'hi' ? subjectInfo.coreEn : subjectInfo.coreHi;
  const bundleZipUrl = subjectInfo.bundleZip;
  const resolvedSubjectTitle = subjectTitle || subjectInfo.title;

  let emailStatus = 'Not sent';
  const gmailPass =
    process.env.GMAIL_APP_PASSWORD ||
    process.env.GOOGLE_APP_PASSWORD ||
    process.env.GMAIL_PASSWORD ||
    process.env.SMTP_PASS ||
    process.env.SMTP_PASSWORD;
  const gmailUser = process.env.GMAIL_USER || 'rahul.28e1@gmail.com';
  const resendKey = process.env.RESEND_API_KEY;
  const fromEmail = process.env.EMAIL_FROM || 'RTechLab Publishing <onboarding@resend.dev>';

  if (email) {
    const emailSubject = `[RTechLab Verified] Direct Download: Your ${resolvedSubjectTitle} Notes Are Ready`;
    const emailHtml = `
      <div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background: #0b0c10; color: #ffffff; padding: 24px; border-radius: 12px; max-width: 600px; margin: 0 auto; border: 1px solid rgba(255,255,255,0.1);">
        <div style="text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 16px; margin-bottom: 20px;">
          <h1 style="color: #10b981; margin: 0; font-size: 22px; font-weight: 800;">🎉 RTechLab Official Verified Delivery</h1>
          <p style="color: #9ca3af; margin: 4px 0 0; font-size: 13px;">Payment ID: ${payment_id} · Amount: ₹${price}</p>
        </div>
        <p style="font-size: 15px;">Dear <strong>${name || 'Student'}</strong>,</p>
        <p style="color: #d1d5db; line-height: 1.6; font-size: 14px;">
          Your payment of <strong>₹${price}</strong> for <strong>${resolvedSubjectTitle}</strong> was successfully verified. 
          <br/><span style="color: #10b981; font-weight: 600;">⚡ Direct Offline Download:</span> Clicking any button below directly downloads the files to your device without opening any website.
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
              <a href="${coreDownloadUrl}" download style="display: block; background: #10b981; color: #000000; font-weight: 900; font-size: 15px; padding: 14px 20px; border-radius: 8px; text-decoration: none; box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);">
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

        <div style="background: rgba(255,255,255,0.03); border: 1px solid rgba(255,255,255,0.08); padding: 14px; border-radius: 8px; font-size: 12px; color: #9ca3af; line-height: 1.6;">
          <p style="margin: 0 0 6px;"><strong>👨‍🏫 Rahul Sir's Direct Mentorship:</strong> If you ever need help, career guidance, or resume review, reply directly to this email or write to <strong style="color: #10b981;">rahul.28e1@gmail.com</strong> with your Payment ID.</p>
          <p style="margin: 0;"><strong>Lifetime Free Updates:</strong> As new chapters and interview questions are added, you will receive all future editions free of charge.</p>
        </div>

        <div style="text-align: center; margin-top: 20px; font-size: 11px; color: #6b7280;">
          RTechLab Universal Open-Access Technical Academy · Official Digital Publications
        </div>
      </div>
    `;

    // ── PRIORITY 1: GMAIL SMTP (DIRECT FROM rahul.28e1@gmail.com TO ANY EMAIL) ──
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

        emailStatus = `Dispatched successfully via Gmail (${gmailUser})`;
      } catch (gmailErr) {
        emailStatus = `Gmail SMTP error: ${gmailErr.message}`;
      }
    }

    // ── PRIORITY 2: RESEND API (FALLBACK IF GMAIL PASS NOT SET) ──
    if (!emailStatus.includes('Dispatched') && resendKey) {
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

        if (resendRes.ok) {
          emailStatus = 'Dispatched successfully via Resend';
        } else {
          const resendErr = await resendRes.json().catch(() => ({}));
          emailStatus += ` | Resend API Error: ${resendErr.message || resendRes.statusText}`;
        }
      } catch (resendErr) {
        emailStatus += ` | Resend error: ${resendErr.message}`;
      }
    }
  }

  return {
    status: 200,
    body: {
      success: true,
      verified: true,
      payment_id,
      order_id,
      emailStatus,
      downloads: {
        corePdf: coreDownloadUrl,
        bundleZip: plan === 'bundle' ? bundleZipUrl : null,
      },
    },
  };
}

// Universal Web Standard Handler
export async function POST(request) {
  try {
    const data = await request.json().catch(() => ({}));
    const result = await processVerifyLogic(data);
    return new Response(JSON.stringify(result.body), {
      status: result.status,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
    });
  } catch (err) {
    return new Response(JSON.stringify({ success: false, verified: false, error: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
}

export async function OPTIONS() {
  return new Response(null, {
    status: 200,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type',
    },
  });
}

// Universal Node.js Handler
export default async function handler(req, res) {
  if (req instanceof Request || (req && !res?.status)) {
    return POST(req);
  }

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
    const result = await processVerifyLogic(data);
    return res.status(result.status).json(result.body);
  } catch (err) {
    return res.status(500).json({
      success: false,
      verified: false,
      error: 'Internal server error while verifying payment',
      message: err.message,
    });
  }
}
