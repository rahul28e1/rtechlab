import React, { useState } from 'react';

export function WhatsAppCommunityCard({ className = "" }) {
  const [copied, setCopied] = useState(false);
  const channelUrl = "https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i";
  const shareText = "Hey! Check out RTechLab for free interactive engineering tools, animated system design videos, and complete IT placement notes: https://rtechlab.vercel.app/notes";

  const handleCopyLink = () => {
    navigator.clipboard.writeText(channelUrl);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  return (
    <div className={`relative overflow-hidden rounded-2xl sm:rounded-3xl bg-gradient-to-br from-[#0c1f17] via-[#08120e] to-[#0a0a0c] border border-emerald-500/30 p-6 sm:p-8 lg:p-10 shadow-2xl shadow-emerald-950/40 ${className}`}>
      {/* Background ambient radial glow */}
      <div className="absolute top-0 right-0 -translate-y-1/2 translate-x-1/3 w-96 h-96 bg-emerald-500/10 rounded-full blur-3xl pointer-events-none" />
      <div className="absolute bottom-0 left-0 translate-y-1/3 -translate-x-1/3 w-80 h-80 bg-teal-500/10 rounded-full blur-3xl pointer-events-none" />

      <div className="relative z-10 flex flex-col lg:flex-row items-center justify-between gap-8">
        {/* Left Content */}
        <div className="flex-1 text-center lg:text-left">
          {/* Badge */}
          <div className="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-emerald-500/15 border border-emerald-500/30 text-emerald-300 text-xs font-mono font-bold mb-4">
            <span className="w-2 h-2 rounded-full bg-emerald-400 animate-ping" />
            <span>OFFICIAL STUDENT COMMUNITY · 100% FREE</span>
          </div>

          <h3 className="text-2xl sm:text-3xl lg:text-4xl font-black text-white tracking-tight mb-3">
            Join the Official <span className="text-emerald-400">RTechLab</span> WhatsApp Channel
          </h3>

          <p className="text-sm sm:text-base text-[#A1A1A6] max-w-2xl leading-relaxed mb-6 font-normal">
            Never miss an engineering drop! We post direct links to new animated explainer videos, live networking tools, daily placement cheatsheets, and special notes discounts directly to your WhatsApp.
          </p>

          {/* Feature Highlights Grid */}
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 text-xs sm:text-sm text-white/90 mb-6">
            <div className="flex items-center gap-2.5">
              <span className="w-5 h-5 rounded-full bg-emerald-500/20 text-emerald-400 flex items-center justify-center font-bold text-xs shrink-0">✓</span>
              <span>Daily Animated Tech &amp; System Design Reels</span>
            </div>
            <div className="flex items-center gap-2.5">
              <span className="w-5 h-5 rounded-full bg-emerald-500/20 text-emerald-400 flex items-center justify-center font-bold text-xs shrink-0">✓</span>
              <span>Free Cheatsheets (Subnetting, Linux, AI)</span>
            </div>
            <div className="flex items-center gap-2.5">
              <span className="w-5 h-5 rounded-full bg-emerald-500/20 text-emerald-400 flex items-center justify-center font-bold text-xs shrink-0">✓</span>
              <span>MNC Campus Placement &amp; Interview Alerts</span>
            </div>
            <div className="flex items-center gap-2.5">
              <span className="w-5 h-5 rounded-full bg-emerald-500/20 text-emerald-400 flex items-center justify-center font-bold text-xs shrink-0">✓</span>
              <span>100% Privacy Protected (Numbers Hidden)</span>
            </div>
          </div>

          {/* Social Proof Counter */}
          <div className="flex flex-wrap items-center justify-center lg:justify-start gap-4 text-xs font-mono text-[#86868B]">
            <span className="flex items-center gap-1.5">
              <span className="text-emerald-400 font-bold">3,500+</span> Students Joined
            </span>
            <span>•</span>
            <span className="flex items-center gap-1.5">
              <span className="text-white font-bold">Zero Spam</span> Guarantee
            </span>
            <span>•</span>
            <span className="flex items-center gap-1.5">
              <span className="text-cyan-400 font-bold">Direct Push</span> Updates
            </span>
          </div>
        </div>

        {/* Right CTA Actions */}
        <div className="w-full lg:w-auto flex flex-col sm:flex-row lg:flex-col gap-3 shrink-0 items-stretch">
          <a
            href={channelUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center justify-center gap-2.5 px-8 py-4 rounded-xl sm:rounded-2xl bg-gradient-to-r from-emerald-500 to-teal-400 hover:from-emerald-400 hover:to-teal-300 text-black font-extrabold text-sm sm:text-base transition-all duration-200 shadow-xl shadow-emerald-500/25 active:scale-[0.98] text-center"
          >
            <svg className="w-5 h-5 fill-current" viewBox="0 0 24 24">
              <path d="M12.031 6.172c-3.181 0-5.767 2.586-5.768 5.766-.001 1.298.38 2.27 1.019 3.287l-.582 2.128 2.182-.573c.978.58 1.911.928 3.145.929 3.178 0 5.767-2.587 5.768-5.766.001-3.187-2.575-5.77-5.764-5.771zm3.392 8.244c-.144.405-.837.774-1.17.824-.312.045-.694.072-2.18-.553-1.897-.796-3.119-2.736-3.214-2.862-.095-.126-.774-1.029-.774-1.963 0-.934.489-1.393.663-1.583.174-.19.38-.238.507-.238.127 0 .253.002.364.007.118.005.276-.045.432.33.163.394.555 1.353.604 1.452.049.099.082.215.016.345-.065.13-.098.212-.195.326-.098.114-.206.255-.295.343-.099.098-.202.204-.087.401.115.197.511.843 1.096 1.365.753.672 1.388.88 1.584.978.196.098.31.082.424-.049.115-.131.49-.571.62-.767.13-.196.26-.164.437-.098.177.066 1.123.53 1.315.626.192.096.32.144.368.225.048.082.048.475-.096.88z" />
            </svg>
            <span>Join WhatsApp Channel</span>
            <span className="text-xs bg-black/20 px-2 py-0.5 rounded-full">FREE</span>
          </a>

          <a
            href={`https://api.whatsapp.com/send?text=${encodeURIComponent(shareText)}`}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center justify-center gap-2 px-6 py-3 rounded-xl sm:rounded-2xl bg-white/[0.06] hover:bg-white/[0.12] text-white border border-white/[0.12] font-semibold text-xs sm:text-sm transition-all duration-200 active:scale-[0.98] text-center"
          >
            <span>Share with Friends</span>
            <span>📲</span>
          </a>

          <button
            type="button"
            onClick={handleCopyLink}
            className="text-[11px] font-mono text-[#86868B] hover:text-white transition-colors text-center py-1 flex items-center justify-center gap-1"
          >
            <span>{copied ? '✓ Channel Link Copied!' : 'Copy Direct Channel Link'}</span>
          </button>
        </div>
      </div>
    </div>
  );
}
