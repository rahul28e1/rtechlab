import React from 'react';
import { useQrDataUrl } from '../../utils/useQr';

export const QrCard = ({ value, label, fileName = 'rtechlab-qr', size = 168, compact = false }) => {
  const src = useQrDataUrl(value, 320);

  return (
    <div className={compact ? 'flex items-center gap-3' : 'flex flex-col sm:flex-row items-start gap-4'}>
      <div className="bg-white p-2 rounded-[10px] shrink-0" style={{ width: size, height: size }}>
        {src ? (
          <img src={src} alt={`QR code for ${label}`} className="w-full h-full" />
        ) : (
          <div className="w-full h-full rounded bg-[#e8e8ed] animate-pulse" />
        )}
      </div>

      {!compact && (
        <div className="text-[12px] space-y-2 min-w-0">
          <p className="text-white text-[13px]">{label}</p>
          <p className="font-mono text-[11px] text-[#6e6e73] break-all">{value}</p>
          {src && (
            <a
              href={src}
              download={`${fileName}.png`}
              className="inline-block text-[#2997ff] hover:underline"
            >
              Download PNG (print ke liye)
            </a>
          )}
        </div>
      )}
    </div>
  );
};
