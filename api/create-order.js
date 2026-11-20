// Vercel Serverless Function to Create Razorpay Order
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
      amount = 49,
      currency = 'INR',
      subject = 'fundamentals',
      subjectTitle = 'Computer Fundamentals',
      plan = 'single',
      name = '',
      email = '',
      phone = '',
      language = 'en',
    } = data;

    if (!email || !email.includes('@')) {
      return res.status(400).json({ error: 'Valid email is required' });
    }

    const keyId = process.env.RAZORPAY_KEY_ID;
    const keySecret = process.env.RAZORPAY_KEY_SECRET;

    // Check if Razorpay keys are configured
    if (!keyId || !keySecret) {
      return res.status(503).json({
        error: 'Razorpay keys not yet configured. Please set RAZORPAY_KEY_ID and RAZORPAY_KEY_SECRET in Vercel.',
        requiresSetup: true,
      });
    }

    // Convert amount in Rupees to Paise (₹49 = 4900)
    const amountInPaise = Math.round(Number(amount) * 100);
    const receiptId = `rcpt_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`;

    const authHeader = `Basic ${Buffer.from(`${keyId}:${keySecret}`).toString('base64')}`;

    const rzpResponse = await fetch('https://api.razorpay.com/v1/orders', {
      method: 'POST',
      headers: {
        'Authorization': authHeader,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        amount: amountInPaise,
        currency: currency || 'INR',
        receipt: receiptId,
        notes: {
          studentName: name,
          studentEmail: email,
          studentPhone: phone,
          subject,
          subjectTitle,
          plan,
          language,
        },
      }),
    });

    const orderData = await rzpResponse.json();

    if (!rzpResponse.ok) {
      return res.status(rzpResponse.status).json({
        error: orderData.error?.description || 'Failed to create Razorpay order',
        details: orderData,
      });
    }

    return res.status(200).json({
      success: true,
      orderId: orderData.id,
      amount: orderData.amount,
      currency: orderData.currency,
      keyId,
    });
  } catch (err) {
    return res.status(500).json({
      error: 'Internal server error while creating order',
      message: err.message,
    });
  }
}
