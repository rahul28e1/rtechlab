// Health check endpoint for Email & Payment configurations
export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Content-Type', 'application/json');

  const gmailPass =
    process.env.GMAIL_APP_PASSWORD ||
    process.env.GOOGLE_APP_PASSWORD ||
    process.env.GMAIL_PASSWORD ||
    process.env.SMTP_PASS ||
    process.env.SMTP_PASSWORD;

  const gmailUser = process.env.GMAIL_USER || 'rahul.28e1@gmail.com';
  const resendKey = process.env.RESEND_API_KEY;
  const razorpaySecret = process.env.RAZORPAY_KEY_SECRET;

  return res.status(200).json({
    status: 'ok',
    gmail: {
      configured: !!gmailPass,
      user: gmailUser,
      passLength: gmailPass ? gmailPass.trim().length : 0,
    },
    resend: {
      configured: !!resendKey,
      sender: process.env.EMAIL_FROM || 'onboarding@resend.dev',
    },
    razorpay: {
      configured: !!razorpaySecret,
    },
    environment: process.env.NODE_ENV || 'production',
  });
}
