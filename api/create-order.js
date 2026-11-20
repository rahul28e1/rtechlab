import Razorpay from 'razorpay';

// Vercel Serverless & Local Dev Function to Create Razorpay Order
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
      amount,
      currency = 'INR',
      receipt,
      notes = {},
      subject = 'fundamentals',
      subjectTitle = 'Computer Fundamentals',
      plan = 'single',
      name = '',
      email = '',
      phone = '',
      language = 'en',
    } = data;

    const key_id = process.env.RAZORPAY_KEY_ID || process.env.VITE_RAZORPAY_KEY_ID;
    const key_secret = process.env.RAZORPAY_KEY_SECRET;

    if (!key_id || !key_secret) {
      return res.status(401).json({
        error: 'Razorpay authentication credentials missing. Please set RAZORPAY_KEY_ID and RAZORPAY_KEY_SECRET.',
      });
    }

    // Convert amount to paise if passed in Rupees (e.g. 49 -> 4900)
    let amountInPaise;
    if (amount !== undefined && amount !== null) {
      const numAmount = Number(amount);
      amountInPaise = numAmount < 1000 ? Math.round(numAmount * 100) : Math.round(numAmount);
    } else {
      amountInPaise = 4900; // Default ₹49
    }

    // Validation: Minimum amount 100 paise (₹1)
    if (amountInPaise < 100) {
      return res.status(400).json({
        error: 'Amount must be at least 100 paise (₹1.00)',
      });
    }

    const receiptId = receipt || `rcpt_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`;

    const razorpay = new Razorpay({
      key_id,
      key_secret,
    });

    const orderOptions = {
      amount: amountInPaise,
      currency: currency || 'INR',
      receipt: receiptId,
      notes: {
        ...notes,
        studentName: name,
        studentEmail: email,
        studentPhone: phone,
        subject,
        subjectTitle,
        plan,
        language,
      },
    };

    const order = await razorpay.orders.create(orderOptions);

    return res.status(200).json({
      success: true,
      order_id: order.id,
      orderId: order.id,
      amount: order.amount,
      currency: order.currency,
      key_id,
      keyId: key_id,
    });
  } catch (err) {
    console.error('Razorpay Order Creation Error:', err);
    if (err.statusCode === 401) {
      return res.status(401).json({
        error: 'Razorpay authentication failed. Invalid Key ID or Key Secret.',
        details: err,
      });
    }
    return res.status(500).json({
      error: err.error?.description || err.message || 'Failed to create Razorpay order',
      details: err,
    });
  }
}
