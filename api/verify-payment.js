import crypto from 'crypto';

// Vercel Serverless & Local Dev Function to Verify Razorpay Payment Signature
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

    // Support both Razorpay standard and custom field names
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

    // Missing fields check (Return 400)
    if (!order_id || !payment_id || !signature) {
      return res.status(400).json({
        success: false,
        verified: false,
        error: 'Missing required payment fields: order_id, payment_id, and signature are required.',
      });
    }

    const keySecret = process.env.RAZORPAY_KEY_SECRET;
    if (!keySecret) {
      return res.status(500).json({
        success: false,
        verified: false,
        error: 'RAZORPAY_KEY_SECRET is not configured on the server.',
      });
    }

    // Algorithm: HMAC-SHA256(order_id + "|" + payment_id, KEY_SECRET)
    const expectedSignature = crypto
      .createHmac('sha256', keySecret)
      .update(`${order_id}|${payment_id}`)
      .digest('hex');

    const isMatch = expectedSignature === signature;

    // Signature mismatch: return 400, do NOT mark as paid
    if (!isMatch) {
      return res.status(400).json({
        success: false,
        verified: false,
        error: 'Payment verification failed: Signature mismatch. Access denied.',
      });
    }

    // Payment is valid and authentic!
    const baseUrl =
      process.env.SITE_URL ||
      process.env.VITE_SITE_URL ||
      (process.env.VERCEL_PROJECT_PRODUCTION_URL ? `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}` : '') ||
      (process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : '') ||
      'https://rtechlab.vercel.app';

    const coreDownloadUrl = language === 'hi'
      ? `${baseUrl}/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf`
      : `${baseUrl}/downloads/Computer-Fundamentals-English-Edition-1.pdf`;

    const bundleZipUrl = `${baseUrl}/downloads/RTechLab-Computer-Fundamentals-Premium-Suite-Edition-1.zip`;

    // Automated Email Delivery via Resend
    let emailStatus = 'Not sent';
    const resendKey = process.env.RESEND_API_KEY;
    const fromEmail = process.env.EMAIL_FROM || 'RTechLab Publishing <onboarding@resend.dev>';

    if (resendKey && email) {
      try {
        const emailHtml = `
          <div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background: #0b0c10; color: #ffffff; padding: 24px; border-radius: 12px; max-width: 600px; margin: 0 auto;">
            <div style="text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 16px; margin-bottom: 20px;">
              <h1 style="color: #10b981; margin: 0; font-size: 22px;">RTechLab Official Verified Delivery</h1>
              <p style="color: #9ca3af; margin: 4px 0 0; font-size: 13px;">Payment ID: ${payment_id} · Amount: ₹${price}</p>
            </div>
            
            <p>Dear <strong>${name || 'Student'}</strong>,</p>
            <p>Your payment of <strong>₹${price}</strong> for <strong>${subjectTitle} (${language === 'hi' ? 'हिंदी Edition 1' : 'English Edition 1'})</strong> was successfully verified.</p>
            
            <div style="background: rgba(16, 185, 129, 0.1); border: 1px solid rgba(16, 185, 129, 0.3); padding: 18px; border-radius: 8px; margin: 20px 0;">
              <h3 style="color: #10b981; margin-top: 0; font-size: 16px;">📥 Your Verified Download Links:</h3>
              <p style="margin: 10px 0;">
                <a href="${coreDownloadUrl}" style="display: inline-block; background: #10b981; color: #000000; font-weight: bold; padding: 10px 18px; border-radius: 6px; text-decoration: none;">
                  ⚡ Download Master PDF (${language === 'hi' ? 'हिंदी Edition 1' : 'English Edition 1'})
                </a>
              </p>
              ${plan === 'bundle' ? `
                <p style="margin: 14px 0 6px;">
                  <a href="${bundleZipUrl}" style="display: inline-block; background: #06b6d4; color: #000000; font-weight: bold; padding: 10px 18px; border-radius: 6px; text-decoration: none;">
                    📦 Download Complete 5-in-1 Suite (.ZIP - 30 MB)
                  </a>
                </p>
              ` : ''}
            </div>

            <p style="color: #9ca3af; font-size: 12px; line-height: 1.5;">
              <strong>Official Receipt &amp; Lifetime Updates:</strong> Keep this email as proof of purchase. All subsequent revisions and errata updates for Edition 1 will be delivered to this email address automatically free of cost.
            </p>
            <hr style="border: none; border-top: 1px solid rgba(255,255,255,0.1); margin: 24px 0;" />
            <p style="color: #6b7280; font-size: 11px; text-align: center;">
              RTechLab Core Engineering · Author: Rahul Patel · <a href="${baseUrl}" style="color: #9ca3af;">${baseUrl}</a>
            </p>
          </div>
        `;

        const resendRes = await fetch('https://api.resend.com/emails', {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${resendKey}`,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            from: fromEmail,
            to: [email],
            subject: `[Verified Access] Your ${subjectTitle} (${language === 'hi' ? 'हिंदी' : 'English'}) Digital Download`,
            html: emailHtml,
          }),
        });

        if (resendRes.ok) {
          emailStatus = 'Dispatched successfully';
        }
      } catch (err) {
        emailStatus = `Email error: ${err.message}`;
      }
    }

    return res.status(200).json({
      success: true,
      verified: true,
      payment_id,
      order_id,
      emailStatus,
      downloads: {
        corePdf: coreDownloadUrl,
        bundleZip: plan === 'bundle' ? bundleZipUrl : null,
      },
    });
  } catch (err) {
    return res.status(500).json({
      success: false,
      verified: false,
      error: 'Internal server error while verifying payment',
      message: err.message,
    });
  }
}
