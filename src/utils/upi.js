export const DEFAULT_WHATSAPP_LINK = 'https://wa.me/message/FUIEEQDZLUKVK1';

export const buildUpiUri = ({ vpa, name, amount, note }) => {
  const params = new URLSearchParams({
    pa: vpa,
    pn: name,
    am: String(amount),
    cu: 'INR',
    tn: note,
  });
  return `upi://pay?${params.toString()}`;
};

export const buildWhatsAppLink = (target = DEFAULT_WHATSAPP_LINK, message = '') => {
  const textParam = message ? `?text=${encodeURIComponent(message)}` : '';
  const str = String(target || DEFAULT_WHATSAPP_LINK).trim();

  // If already a full URL or wa.me/message link
  if (str.startsWith('http://') || str.startsWith('https://')) {
    const cleanUrl = str.split('?')[0];
    return `${cleanUrl}${textParam}`;
  }

  // If path like message/FUIEEQDZLUKVK1 or code like FUIEEQDZLUKVK1
  if (str.includes('message/')) {
    const code = str.split('message/')[1].split('?')[0];
    return `https://wa.me/message/${code}${textParam}`;
  }

  if (/[a-zA-Z]/.test(str)) {
    return `https://wa.me/message/${str}${textParam}`;
  }

  // Raw phone number
  const cleanNumber = str.replace(/\D/g, '');
  return `https://wa.me/${cleanNumber}${textParam}`;
};

export const buildOrderMessage = ({ title, amount, name, email, utr }) =>
  [
    'Hi RTechLab, payment done.',
    `Product: ${title}`,
    `Amount: ₹${amount}`,
    `Name: ${name}`,
    `Email: ${email}`,
    `UTR / Ref: ${utr}`,
    'Please send the PDF.',
  ].join('\n');

export const formatINR = (value) => `₹${Number(value).toLocaleString('en-IN')}`;
