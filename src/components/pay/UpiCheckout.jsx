import React, { useState } from 'react';
import { Copy, Check, ExternalLink, ShieldCheck, ArrowRight, Sparkles } from 'lucide-react';
import { UPI } from '../../data/products';
import { buildUpiUri, buildWhatsAppLink, buildOrderMessage, formatINR } from '../../utils/upi';
import { useQrDataUrl } from '../../utils/useQr';
import { ComparePlans } from './ComparePlans';

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/;

export const UpiCheckout = ({ item, copy, compareCopy, onUpgrade, onDowngrade }) => {
  const [copied, setCopied] = useState(false);
  const [sent, setSent] = useState(false);
  const [error, setError] = useState('');
  const [form, setForm] = useState({ name: '', email: '', utr: '' });

  const note = `RTechLab ${item.code}`;
  const upiUri = buildUpiUri({ vpa: UPI.vpa, name: UPI.name, amount: item.amount, note });
  const qr = useQrDataUrl(upiUri, 320);

  const copyVpa = async () => {
    try {
      await navigator.clipboard.writeText(UPI.vpa);
      setCopied(true);
      window.setTimeout(() => setCopied(false), 1800);
    } catch {
      setCopied(false);
    }
  };

  const update = (key) => (event) => setForm((prev) => ({ ...prev, [key]: event.target.value }));

  const handleSubmit = (event) => {
    event.preventDefault();
    if (form.name.trim().length < 2) return setError(copy.errName);
    if (!EMAIL_RE.test(form.email.trim())) return setError(copy.errEmail);
    if (form.utr.trim().length < 8) return setError(copy.errUtr);

    setError('');
    const message = buildOrderMessage({
      title: item.title,
      amount: item.amount,
      name: form.name.trim(),
      email: form.email.trim(),
      utr: form.utr.trim(),
    });
    window.open(buildWhatsAppLink(UPI.whatsapp, message), '_blank', 'noopener');
    setSent(true);
  };

  return (
    <div className="rounded-[22px] border border-white/[0.1] bg-[#0f1012] overflow-hidden">
      <div className="flex items-start justify-between gap-4 p-6 border-b border-white/[0.08]">
        <div>
          <p className="text-[10px] uppercase tracking-[0.22em] text-[#6e6e73]">{copy.title}</p>
          <h3 className="mt-1 text-[17px] font-semibold text-white">{item.title}</h3>
          <p className="mt-1 text-[12px] text-[#86868b]">{item.code}</p>
        </div>
        <div className="text-right">
          <p className="text-[28px] font-semibold text-white leading-none">{formatINR(item.amount)}</p>
          <p className="mt-1 text-[11px] text-[#6e6e73]">{copy.oneTime}</p>
        </div>
      </div>

      {onUpgrade && compareCopy && (
        <div className="p-5 border-b border-white/[0.08] bg-gradient-to-b from-[#12203a] to-[#0f1012]">
          <div className="flex items-center gap-2 text-[11px] uppercase tracking-[0.18em] text-[#2997ff]">
            <Sparkles className="w-3.5 h-3.5" />
            {compareCopy.upgradeTitle}
          </div>
          <p className="mt-2 text-[12.5px] leading-relaxed text-[#a1a1a6]">{compareCopy.upgradeBody}</p>
          <div className="mt-4 rounded-[16px] overflow-hidden border border-white/[0.08] bg-[#0b0b0c]">
            <ComparePlans
              copy={compareCopy}
              singlePrice={item.amount}
              compact
              onPickSingle={() => {}}
              onPickBundle={() => {}}
            />
          </div>
          <div className="mt-4 flex flex-wrap gap-2.5">
            <button
              type="button"
              onClick={onUpgrade}
              className="inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-[#0071e3] hover:bg-[#0077ed] text-white text-[12.5px] font-medium transition-colors"
            >
              {compareCopy.upgradeCta}
              <ArrowRight className="w-3.5 h-3.5" />
            </button>
            {onDowngrade && (
              <button
                type="button"
                onClick={onDowngrade}
                className="inline-flex items-center gap-2 px-4 py-2.5 rounded-full border border-white/[0.14] text-[12px] text-[#a1a1a6] hover:text-white transition-colors"
              >
                {compareCopy.downgradeCta}
              </button>
            )}
          </div>
        </div>
      )}

      <div className="p-6 grid gap-6 sm:grid-cols-[190px_1fr]">
        <div className="bg-white rounded-[14px] p-3 w-[190px] h-[190px]">
          {qr ? (
            <img src={qr} alt="UPI payment QR code" className="w-full h-full" />
          ) : (
            <div className="w-full h-full rounded bg-[#e8e8ed] animate-pulse" />
          )}
        </div>

        <div className="space-y-4">
          <div>
            <p className="text-[11px] uppercase tracking-[0.16em] text-[#6e6e73] mb-1">{copy.upiId}</p>
            <div className="flex items-center gap-2">
              <span className="font-mono text-[13px] text-white">{UPI.vpa}</span>
              <button
                type="button"
                onClick={copyVpa}
                className="p-1.5 rounded-md border border-white/[0.12] text-[#a1a1a6] hover:text-white transition-colors"
                aria-label={copy.upiId}
              >
                {copied ? <Check className="w-3.5 h-3.5 text-[#30d158]" /> : <Copy className="w-3.5 h-3.5" />}
              </button>
            </div>
          </div>

          <a
            href={upiUri}
            className="inline-flex items-center justify-center gap-2 w-full sm:w-auto px-5 py-2.5 rounded-full bg-[#0071e3] hover:bg-[#0077ed] text-white text-[13px] font-medium transition-colors"
          >
            {copy.openApp}
            <ExternalLink className="w-3.5 h-3.5" />
          </a>

          <p className="text-[12px] leading-relaxed text-[#86868b]">{copy.scan}</p>

          <p className="flex items-start gap-2 text-[11px] text-[#6e6e73]">
            <ShieldCheck className="w-3.5 h-3.5 mt-0.5 text-[#30d158] shrink-0" />
            {copy.safe}
          </p>
        </div>
      </div>

      <div className="px-6 pb-6">
        {sent ? (
          <div className="rounded-[14px] border border-[#30d158]/30 bg-[#30d158]/10 p-4">
            <p className="text-[13px] text-[#30d158] font-medium">{copy.sentTitle}</p>
            <p className="mt-1 text-[12px] text-[#86868b]">{copy.sentBody}</p>
          </div>
        ) : (
          <form onSubmit={handleSubmit} className="space-y-3">
            <p className="text-[12px] text-[#a1a1a6]">{copy.afterPay}</p>
            <div className="grid gap-3 sm:grid-cols-2">
              <input
                value={form.name}
                onChange={update('name')}
                placeholder={copy.name}
                className="w-full px-4 py-2.5 rounded-[12px] bg-[#161718] border border-white/[0.1] text-[13px] text-white placeholder:text-[#6e6e73] focus:outline-none focus:border-[#0071e3]"
              />
              <input
                value={form.email}
                onChange={update('email')}
                placeholder={copy.email}
                type="email"
                className="w-full px-4 py-2.5 rounded-[12px] bg-[#161718] border border-white/[0.1] text-[13px] text-white placeholder:text-[#6e6e73] focus:outline-none focus:border-[#0071e3]"
              />
            </div>
            <input
              value={form.utr}
              onChange={update('utr')}
              placeholder={copy.utr}
              className="w-full px-4 py-2.5 rounded-[12px] bg-[#161718] border border-white/[0.1] text-[13px] text-white placeholder:text-[#6e6e73] focus:outline-none focus:border-[#0071e3]"
            />
            {error && <p className="text-[12px] text-[#ff6b6b]">{error}</p>}
            <button
              type="submit"
              className="inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-white text-black text-[13px] font-medium hover:bg-[#e8e8ed] transition-colors"
            >
              {copy.submit}
              <ArrowRight className="w-3.5 h-3.5" />
            </button>
          </form>
        )}
      </div>

      {import.meta.env.DEV && !UPI.configured && (
        <p className="px-6 pb-5 text-[11px] text-[#ffd60a]">{copy.devNote}</p>
      )}
    </div>
  );
};
