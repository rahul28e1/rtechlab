import React, { useState } from 'react';

export function WhatsAppHelplineButton() {
  const [showTooltip, setShowTooltip] = useState(false);
  const phoneNumber = '917646892094';
  const defaultMessage = encodeURIComponent(
    'Hi Rahul Sir, I need help regarding RTechLab study handbooks and digital notes.'
  );
  const whatsappUrl = `https://wa.me/${phoneNumber}?text=${defaultMessage}`;

  return (
    <div
      className="fixed bottom-20 right-4 sm:bottom-6 sm:right-6 z-50 flex items-center print:hidden select-none"
      onMouseEnter={() => setShowTooltip(true)}
      onMouseLeave={() => setShowTooltip(false)}
    >
      {/* Tooltip on Desktop */}
      <div
        className={`hidden sm:flex items-center gap-2 mr-3 px-3.5 py-2 rounded-xl bg-[#0e1118]/95 border border-emerald-500/30 text-white shadow-xl shadow-black/60 transition-all duration-300 pointer-events-none ${
          showTooltip
            ? 'opacity-100 translate-x-0'
            : 'opacity-0 translate-x-2'
        }`}
      >
        <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
        <div className="flex flex-col text-left">
          <span className="text-xs font-bold text-white font-mono flex items-center gap-1.5">
            WhatsApp Helpline <span className="text-[10px] text-emerald-400">· +91 76468 92094</span>
          </span>
          <span className="text-[10px] text-amber-300/90 font-sans">
            Strictly Chat Only (No Calls)
          </span>
        </div>
      </div>

      {/* Floating Action Button */}
      <a
        href={whatsappUrl}
        target="_blank"
        rel="noopener noreferrer"
        aria-label="Contact RTechLab Student Helpline on WhatsApp (Strictly Chat Only)"
        className="group relative flex items-center justify-center w-13 h-13 sm:w-14 sm:h-14 rounded-full bg-emerald-500 hover:bg-emerald-400 text-black shadow-lg shadow-emerald-500/30 hover:shadow-emerald-500/50 hover:scale-105 active:scale-95 transition-all duration-200"
      >
        {/* Radar ping ring */}
        <span className="absolute inset-0 rounded-full bg-emerald-400 opacity-30 group-hover:animate-ping pointer-events-none"></span>

        {/* WhatsApp Icon */}
        <svg
          className="w-7 h-7 sm:w-8 sm:h-8 fill-current text-white drop-shadow"
          viewBox="0 0 24 24"
        >
          <path d="M12.031 6.172c-3.181 0-5.767 2.586-5.768 5.766-.001 1.298.38 2.27 1.019 3.287l-.582 2.128 2.182-.573c.978.58 1.911.928 3.145.929 3.178 0 5.767-2.587 5.768-5.766.001-3.187-2.575-5.77-5.764-5.771zm3.392 8.244c-.144.405-.837.774-1.17.824-.312.045-.698.082-2.115-.508-1.574-.658-2.583-2.257-2.662-2.361-.078-.105-.639-.851-.639-1.624 0-.773.405-1.154.55-1.309.144-.156.315-.195.42-.195.105 0 .21.001.301.006.096.005.226-.036.353.271.132.318.452 1.102.492 1.182.04.079.066.173.013.278-.053.106-.079.172-.158.264-.079.092-.167.206-.238.277-.079.079-.162.164-.07.322.092.158.409.676.879 1.094.605.539 1.116.707 1.273.786.158.079.25.066.342-.04.092-.105.395-.461.5-.619.105-.158.21-.132.355-.079.145.053.92.434 1.078.513.158.079.263.118.303.184.04.066.04.382-.104.787z" />
          <path d="M12 2C6.477 2 2 6.477 2 12c0 1.89.525 3.66 1.438 5.168L2.05 22l4.98-1.307C8.454 21.536 10.17 22 12 22c5.523 0 10-4.477 10-10S17.523 2 12 2zm0 18.167c-1.63 0-3.14-.492-4.404-1.334l-.316-.21-2.964.777.791-2.89-.23-.367C3.96 14.82 3.458 13.45 3.458 12c0-4.71 3.832-8.542 8.542-8.542 4.71 0 8.542 3.832 8.542 8.542 0 4.71-3.832 8.542-8.542 8.542z" />
        </svg>

        {/* Small badge dot for mobile */}
        <span className="sm:hidden absolute top-0 right-0 w-3.5 h-3.5 rounded-full bg-amber-400 border-2 border-black"></span>
      </a>
    </div>
  );
}

export default WhatsAppHelplineButton;
