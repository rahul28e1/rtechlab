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

export const buildWhatsAppLink = (number, message) =>
  `https://wa.me/${String(number).replace(/\D/g, '')}?text=${encodeURIComponent(message)}`;

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
