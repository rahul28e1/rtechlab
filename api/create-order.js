import Razorpay from 'razorpay';

async function processOrderLogic(data) {
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
    return {
      status: 401,
      body: {
        error: 'Razorpay authentication credentials missing. Please set RAZORPAY_KEY_ID and RAZORPAY_KEY_SECRET in Vercel.',
        requiresSetup: true,
      },
    };
  }

  let amountInPaise;
  if (amount !== undefined && amount !== null) {
    const numAmount = Number(amount);
    amountInPaise = numAmount < 1000 ? Math.round(numAmount * 100) : Math.round(numAmount);
  } else {
    amountInPaise = 4900;
  }

  if (amountInPaise < 100) {
    return {
      status: 400,
      body: { error: 'Amount must be at least 100 paise (₹1.00)' },
    };
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

  try {
    const order = await razorpay.orders.create(orderOptions);
    return {
      status: 200,
      body: {
        success: true,
        order_id: order.id,
        orderId: order.id,
        amount: order.amount,
        currency: order.currency,
        key_id,
        keyId: key_id,
      },
    };
  } catch (err) {
    console.error('Razorpay Order Creation Error:', err);
    if (err.statusCode === 401) {
      return {
        status: 401,
        body: { error: 'Razorpay authentication failed. Invalid Key ID or Key Secret.' },
      };
    }
    return {
      status: 500,
      body: { error: err.error?.description || err.message || 'Failed to create Razorpay order' },
    };
  }
}

// Universal Web Standard Handler (Next/Vercel Edge & Web API)
export async function POST(request) {
  try {
    const data = await request.json().catch(() => ({}));
    const result = await processOrderLogic(data);
    return new Response(JSON.stringify(result.body), {
      status: result.status,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
    });
  } catch (err) {
    return new Response(JSON.stringify({ error: err.message }), {
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

// Universal Node.js Handler (req, res) for Vercel Serverless & Local Dev
export default async function handler(req, res) {
  // Check if called as Web Standard Request
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

  const data = typeof req.body === 'string' ? JSON.parse(req.body) : (req.body || {});
  const result = await processOrderLogic(data);
  return res.status(result.status).json(result.body);
}
