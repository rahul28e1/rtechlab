import React from 'react';

export const Panel = ({ children, className = '' }) => (
  <div className={`rounded-2xl border border-slate-800 bg-navy-900 p-5 sm:p-6 ${className}`}>
    {children}
  </div>
);

export const SectionTitle = ({ children, hint }) => (
  <div className="mb-4">
    <h2 className="text-sm font-bold uppercase tracking-wider text-slate-300">{children}</h2>
    {hint && <p className="mt-1 text-xs text-slate-500">{hint}</p>}
  </div>
);

export const Field = ({ label, hint, children }) => (
  <label className="block">
    <span className="mb-1.5 block text-xs font-semibold uppercase tracking-wider text-slate-400">
      {label}
    </span>
    {children}
    {hint && <span className="mt-1 block text-[11px] text-slate-500">{hint}</span>}
  </label>
);

export const inputClass =
  'w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none transition focus:border-electric-400 focus:ring-1 focus:ring-electric-400';

export const selectClass =
  'w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-cyan-300 outline-none transition focus:border-electric-400';

export const Stat = ({ label, value, hint, tone = 'text-white' }) => (
  <div className="rounded-xl border border-slate-800 bg-navy-950/80 p-3.5">
    <span className="mb-1 block text-[11px] uppercase tracking-wider text-slate-500">{label}</span>
    <span className={`block font-mono text-sm font-bold ${tone}`}>{value}</span>
    {hint && <span className="mt-1 block text-[11px] text-slate-500">{hint}</span>}
  </div>
);

export const Callout = ({ children, tone = 'info' }) => {
  const tones = {
    info: 'border-electric-500/30 bg-electric-500/5 text-slate-300',
    warn: 'border-amber-500/30 bg-amber-500/5 text-amber-200',
    error: 'border-red-500/30 bg-red-500/5 text-red-200',
    ok: 'border-emerald-500/30 bg-emerald-500/5 text-emerald-200',
  };
  return (
    <div className={`rounded-xl border px-4 py-3 text-xs leading-relaxed ${tones[tone]}`}>
      {children}
    </div>
  );
};

export const Badge = ({ children }) => (
  <span className="rounded-md border border-slate-700 bg-navy-950 px-2 py-0.5 font-mono text-[11px] text-slate-300">
    {children}
  </span>
);

export const CopyValue = ({ label, value }) => {
  const [copied, setCopied] = React.useState(false);
  const copy = () => {
    if (typeof navigator !== 'undefined' && navigator.clipboard) {
      navigator.clipboard.writeText(String(value));
      setCopied(true);
      setTimeout(() => setCopied(false), 1500);
    }
  };
  return (
    <button
      type="button"
      onClick={copy}
      className="flex w-full items-center justify-between gap-2 rounded-lg border border-slate-800 bg-navy-950 px-3 py-2 text-left font-mono text-xs text-slate-200 transition hover:border-slate-600"
      title="Copy value"
    >
      <span className="truncate">{value}</span>
      <span className="flex-shrink-0 text-[10px] uppercase tracking-wider text-slate-500">
        {copied ? 'copied' : label || 'copy'}
      </span>
    </button>
  );
};
