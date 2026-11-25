import crypto from 'crypto';
import nodemailer from 'nodemailer';

const BASE_URL = 'https://rtechlab.vercel.app';

const SUBJECT_CATALOG = {
  server2025: {
    title: 'Microsoft Windows Server 2025 & Active Directory Administration',
    coreEn: `${BASE_URL}/downloads/Windows-Server-2025-English-Master-Guide.pdf`,
    coreHi: `${BASE_URL}/downloads/Windows-Server-2025-Hindi-Master-Guide.pdf`,
    coreGu: `${BASE_URL}/downloads/Windows-Server-2025-Gujarati-Master-Guide.pdf`,
    bundleZip: `${BASE_URL}/downloads/Windows-Server-2025-Career-Accelerator-Bundle.zip`,
    bundleZipSize: '17.3 MB',
    pages: '60 Pages',
  },
  ai: {
    title: 'Artificial Intelligence Mastery',
    coreEn: `${BASE_URL}/downloads/AI-Essentials-English-Edition-1.pdf`,
    coreHi: `${BASE_URL}/downloads/AI-Essentials-Hindi-Edition-1.pdf`,
    coreGu: `${BASE_URL}/downloads/AI-Essentials-Gujarati-Edition-1.pdf`,
    bundleZip: `${BASE_URL}/downloads/AI-Career-Accelerator-Bundle.zip`,
    bundleZipSize: '6.4 MB',
    pages: '44 Pages',
  },
  office365: {
    title: 'Microsoft Office 365 Enterprise Suite',
    coreEn: `${BASE_URL}/downloads/Office-365-English-Edition-1.pdf`,
    coreHi: `${BASE_URL}/downloads/Office-365-Hindi-Edition-1.pdf`,
    coreGu: `${BASE_URL}/downloads/Office-365-Gujarati-Edition-1.pdf`,
    bundleZip: `${BASE_URL}/downloads/Office-365-Career-Accelerator-Bundle.zip`,
    bundleZipSize: '16.7 MB',
    pages: '113 Pages',
  },
  'office-365': {
    title: 'Microsoft Office 365 Enterprise Suite',
    coreEn: `${BASE_URL}/downloads/Office-365-English-Edition-1.pdf`,
    coreHi: `${BASE_URL}/downloads/Office-365-Hindi-Edition-1.pdf`,
    coreGu: `${BASE_URL}/downloads/Office-365-Gujarati-Edition-1.pdf`,
    bundleZip: `${BASE_URL}/downloads/Office-365-Career-Accelerator-Bundle.zip`,
    bundleZipSize: '16.7 MB',
    pages: '113 Pages',
  },
  tally: {
    title: 'Tally Prime with GST & Corporate Accounting',
    coreEn: `${BASE_URL}/downloads/Tally-Prime-English-Edition-1.pdf`,
    coreHi: `${BASE_URL}/downloads/Tally-Prime-Hindi-Edition-1.pdf`,
    coreGu: `${BASE_URL}/downloads/Tally-Prime-Gujarati-Edition-1.pdf`,
    bundleZip: `${BASE_URL}/downloads/Tally-Prime-Career-Accelerator-Bundle.zip`,
    bundleZipSize: '11.4 MB',
    pages: '51 Pages',
  },
  fundamentals: {
    title: 'Computer Fundamentals & Architecture',
    coreEn: `${BASE_URL}/downloads/Computer-Fundamentals-English-Edition-1.pdf`,
    coreHi: `${BASE_URL}/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf`,
    coreGu: `${BASE_URL}/downloads/Computer-Fundamentals-Gujarati-Edition-1.pdf`,
    bundleZip: `${BASE_URL}/downloads/RTechLab-Computer-Fundamentals-Premium-Suite-Edition-1.zip`,
    bundleZipSize: '30 MB',
    pages: '45 Pages',
  },
  ccna: {
    title: 'Cisco CCNA (200-301) Networking Master Guide',
    coreEn: `${BASE_URL}/downloads/CCNA-200-301-English-Edition-1.pdf`,
    coreHi: `${BASE_URL}/downloads/CCNA-200-301-Hindi-Edition-1.pdf`,
    coreGu: `${BASE_URL}/downloads/CCNA-200-301-Gujarati-Edition-1.pdf`,
    bundleZip: `${BASE_URL}/downloads/RTechLab-CCNA-200-301-Complete-Career-Bundle-Edition-1.zip`,
    bundleZipSize: '19.8 MB',
    pages: '49 Pages',
  },
};

/**
 * Dispatches the official tax invoice & direct download links email to the student
 */
async function dispatchInvoiceEmail({
  name,
  email,
  phone,
  payment_id,
  order_id,
  subject,
  subjectTitle,
  plan,
  price,
  language,
}) {
  const subjectInfo = SUBJECT_CATALOG[subject] || SUBJECT_CATALOG.fundamentals;
  const resolvedSubjectTitle = subjectTitle || subjectInfo.title;
  const languageLabel = language === 'gu' ? 'ગુજરાતી' : (language === 'hi' ? 'हिंदी' : 'English');

  const coreDownloadUrl = language === 'gu'
    ? (subjectInfo.coreGu || subjectInfo.coreHi)
    : (language === 'hi' ? subjectInfo.coreHi : subjectInfo.coreEn);
  const bundleZipUrl = subjectInfo.bundleZip;

  const formattedDate = new Date().toLocaleString('en-IN', {
    timeZone: 'Asia/Kolkata',
    dateStyle: 'medium',
    timeStyle: 'short',
  });
  const receiptNumber = payment_id ? `RTL-RCPT-${payment_id.slice(-8).toUpperCase()}` : `RTL-RCPT-${Date.now().toString().slice(-8)}`;

  const gmailPass =
    process.env.GMAIL_APP_PASSWORD ||
    process.env.GOOGLE_APP_PASSWORD ||
    process.env.GMAIL_PASSWORD ||
    process.env.SMTP_PASS ||
    process.env.SMTP_PASSWORD;
  const gmailUser = process.env.GMAIL_USER || 'rahul.28e1@gmail.com';
  const resendKey = process.env.RESEND_API_KEY;
  const fromEmail = process.env.EMAIL_FROM || 'RTechLab Publishing <onboarding@resend.dev>';

  const emailSubject = `[RTechLab Verified] Direct Download & Official Receipt: ${resolvedSubjectTitle}`;
  const emailHtml = `
    <div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background: #0b0c10; color: #ffffff; padding: 24px; border-radius: 12px; max-width: 600px; margin: 0 auto; border: 1px solid rgba(255,255,255,0.1);">
      <div style="text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 16px; margin-bottom: 20px;">
        <h1 style="color: #10b981; margin: 0; font-size: 22px; font-weight: 800;">🎉 RTechLab Official Verified Delivery</h1>
        <p style="color: #9ca3af; margin: 4px 0 0; font-size: 13px;">Official Tax Invoice &amp; Digital Study Notes · 2027 Edition</p>
      </div>
      <p style="font-size: 15px;">Dear <strong>${name || 'Student'}</strong>,</p>
      <p style="color: #d1d5db; line-height: 1.6; font-size: 14px;">
        Your payment of <strong>₹${price}</strong> for <strong>${resolvedSubjectTitle}</strong> was successfully verified via Webhook. 
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
              ⚡ DOWNLOAD MASTER PDF (${languageLabel} Edition - ${subjectInfo.pages})
            </a>
          </div>
        `}
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
            <td style="padding: 4px 0; color: #94a3b8;">Payment Reference ID:</td>
            <td style="padding: 4px 0; text-align: right; font-family: monospace; color: #38bdf8;">${payment_id || 'RZP-CAPTURED'}</td>
          </tr>
          <tr>
            <td style="padding: 4px 0; color: #94a3b8;">Order ID:</td>
            <td style="padding: 4px 0; text-align: right; font-family: monospace; color: #f8fafc;">${order_id || 'N/A'}</td>
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
                ${languageLabel} · Edition 1
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
        <p style="margin: 0 0 6px;"><strong>👨‍🏫 Rahul Sir's Direct Mentorship:</strong> Reply directly to this email or write to <strong style="color: #10b981;">rahul.28e1@gmail.com</strong> with your Payment ID.</p>
        <p style="margin: 0;"><strong>Lifetime Free Updates:</strong> All future revisions are included free of charge.</p>
      </div>
    </div>
  `;

  if (gmailPass) {
    try {
      const cleanPass = gmailPass.replace(/["'\s]/g, '');
      const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: { user: gmailUser, pass: cleanPass },
      });
      await transporter.sendMail({
        from: `"Rahul Sir · RTechLab" <${gmailUser}>`,
        to: email,
        replyTo: gmailUser,
        subject: emailSubject,
        html: emailHtml,
      });
      return `Dispatched via Gmail (${gmailUser})`;
    } catch (e) {
      console.error('Gmail error:', e.message);
    }
  }

  if (resendKey) {
    try {
      const res = await fetch('https://api.resend.com/emails', {
        method: 'POST',
        headers: {
          Authorization: `Bearer ${resendKey}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          from: fromEmail,
          to: [email],
          subject: emailSubject,
          html: emailHtml,
        }),
      });
      if (res.ok) return 'Dispatched via Resend';
    } catch (e) {
      console.error('Resend error:', e.message);
    }
  }

  return 'No email provider active';
}

/**
 * Handles Webhook Request Logic
 */
async function processWebhookLogic(rawBody, signature) {
  const webhookSecret = process.env.RAZORPAY_WEBHOOK_SECRET || process.env.RAZORPAY_KEY_SECRET;

  if (!webhookSecret) {
    return {
      status: 500,
      body: { error: 'Razorpay webhook secret not configured on server' },
    };
  }

  if (!signature) {
    return {
      status: 400,
      body: { error: 'Missing x-razorpay-signature header' },
    };
  }

  const expectedSignature = crypto
    .createHmac('sha256', webhookSecret)
    .update(rawBody)
    .digest('hex');

  if (expectedSignature !== signature) {
    return {
      status: 400,
      body: { error: 'Invalid webhook signature: HMAC validation failed' },
    };
  }

  let eventData = {};
  try {
    eventData = typeof rawBody === 'string' ? JSON.parse(rawBody) : rawBody;
  } catch (err) {
    return {
      status: 400,
      body: { error: 'Invalid JSON payload' },
    };
  }

  const eventName = eventData.event;
  console.log(`[RTechLab Webhook] Received verified Razorpay event: ${eventName}`);

  // Supported Razorpay payment events
  if (eventName === 'payment.captured' || eventName === 'order.paid') {
    const payment = eventData.payload?.payment?.entity || {};
    const order = eventData.payload?.order?.entity || {};
    const notes = payment.notes || order.notes || {};

    const studentName = notes.studentName || payment.notes?.studentName || payment.name || 'Student';
    const studentEmail = notes.studentEmail || payment.notes?.studentEmail || payment.email;
    const studentPhone = notes.studentPhone || payment.notes?.studentPhone || payment.contact;
    const subject = notes.subject || payment.notes?.subject || 'fundamentals';
    const subjectTitle = notes.subjectTitle || payment.notes?.subjectTitle;
    const plan = notes.plan || payment.notes?.plan || (payment.amount === 14900 ? 'bundle' : 'single');
    const price = plan === 'bundle' ? 149 : 49;
    const language = notes.language || payment.notes?.language || 'en';

    let emailStatus = 'No student email attached';
    if (studentEmail) {
      emailStatus = await dispatchInvoiceEmail({
        name: studentName,
        email: studentEmail,
        phone: studentPhone,
        payment_id: payment.id,
        order_id: payment.order_id || order.id,
        subject,
        subjectTitle,
        plan,
        price,
        language,
      });
    }

    return {
      status: 200,
      body: {
        status: 'ok',
        event: eventName,
        paymentId: payment.id,
        orderId: payment.order_id || order.id,
        emailStatus,
        verified: true,
      },
    };
  }

  return {
    status: 200,
    body: { status: 'ignored', event: eventName, message: 'Event received and ignored' },
  };
}

// Universal Web Standard Handler (Edge / Fetch API)
export async function POST(request) {
  try {
    const signature = request.headers.get('x-razorpay-signature');
    const rawBody = await request.text();
    const result = await processWebhookLogic(rawBody, signature);
    return new Response(JSON.stringify(result.body), {
      status: result.status,
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (err) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
}

export async function GET() {
  return new Response(
    JSON.stringify({
      status: 'ready',
      endpoint: '/api/webhook',
      methods: ['POST', 'GET'],
      service: 'RTechLab Razorpay Webhook Engine',
      supportedEvents: ['payment.captured', 'order.paid'],
    }),
    {
      status: 200,
      headers: { 'Content-Type': 'application/json' },
    }
  );
}

// Universal Node.js Handler (Serverless / Express)
export default async function handler(req, res) {
  if (req instanceof Request || (req && !res?.status)) {
    return req.method === 'GET' ? GET(req) : POST(req);
  }

  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, x-razorpay-signature');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  if (req.method === 'GET') {
    return res.status(200).json({
      status: 'ready',
      endpoint: '/api/webhook',
      service: 'RTechLab Razorpay Webhook Engine',
      supportedEvents: ['payment.captured', 'order.paid'],
    });
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  try {
    const signature = req.headers['x-razorpay-signature'];
    const rawBody = typeof req.body === 'string' ? req.body : JSON.stringify(req.body);
    const result = await processWebhookLogic(rawBody, signature);
    return res.status(result.status).json(result.body);
  } catch (err) {
    return res.status(500).json({ error: err.message });
  }
}
