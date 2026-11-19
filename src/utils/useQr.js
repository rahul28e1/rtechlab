import { useEffect, useState } from 'react';
import QRCode from 'qrcode';

export const useQrDataUrl = (text, width = 260) => {
  const [result, setResult] = useState({ text: '', url: '' });

  useEffect(() => {
    if (!text) return undefined;
    let alive = true;

    QRCode.toDataURL(text, {
      width,
      margin: 1,
      errorCorrectionLevel: 'M',
      color: { dark: '#000000', light: '#ffffff' },
    })
      .then((data) => {
        if (alive) setResult({ text, url: data });
      })
      .catch(() => {
        if (alive) setResult({ text, url: '' });
      });

    return () => {
      alive = false;
    };
  }, [text, width]);

  return result.text === text ? result.url : '';
};
