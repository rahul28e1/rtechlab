import React from 'react';
import { Check, Minus, ArrowRight } from 'lucide-react';
import { BUNDLE, MODULES } from '../../data/products';
import { formatINR } from '../../utils/upi';

const Cell = ({ ok, children, strong }) => (
  <div className={`flex items-start gap-2 text-[12px] leading-snug ${strong ? 'text-white' : 'text-[#86868b]'}`}>
    {ok ? (
      <Check className="w-3.5 h-3.5 mt-0.5 text-[#30d158] shrink-0" />
    ) : (
      <Minus className="w-3.5 h-3.5 mt-0.5 text-[#48484a] shrink-0" />
    )}
    <span>{children}</span>
  </div>
);

export const ComparePlans = ({ copy, singlePrice = MODULES[0].price, onPickSingle, onPickBundle, compact = false }) => {
  const rows = [
    { key: 'modules', label: copy.modules, single: copy.singleModules, bundle: copy.bundleModules, singleOk: false },
    { key: 'pages', label: copy.pages, single: '42', bundle: '126', singleOk: false },
    { key: 'quizzes', label: copy.quizzes, single: copy.singleQuizzes, bundle: copy.bundleQuizzes, singleOk: true },
    { key: 'interview', label: copy.interview, single: copy.singleInterview, bundle: copy.bundleInterview, singleOk: false },
    { key: 'practice', label: copy.practice, single: copy.singlePractice, bundle: copy.bundlePractice, singleOk: true },
    { key: 'roadmap', label: copy.roadmap, single: copy.singleRoadmap, bundle: copy.bundleRoadmap, singleOk: false },
    { key: 'updates', label: copy.updates, single: copy.singleUpdates, bundle: copy.bundleUpdates, singleOk: true },
  ];

  return (
    <div className={compact ? '' : 'rounded-[24px] border border-white/[0.1] bg-[#101011] overflow-hidden'}>
      <div className={`grid grid-cols-[1.4fr_1fr_1fr] ${compact ? 'text-[10px]' : 'text-[11px]'} uppercase tracking-[0.14em] text-[#6e6e73] px-5 py-3 border-b border-white/[0.08]`}>
        <span>{copy.feature}</span>
        <span>{copy.single}</span>
        <span className="text-[#2997ff]">{copy.bundle}</span>
      </div>

      <div className="grid grid-cols-[1.4fr_1fr_1fr] px-5 py-3 items-center border-b border-white/[0.08]">
        <span className="text-[12px] text-[#a1a1a6]">{copy.price}</span>
        <span className="text-[15px] font-semibold text-white">{formatINR(singlePrice)}</span>
        <span className="text-[15px] font-semibold text-[#2997ff]">
          {formatINR(BUNDLE.price)}
          <span className="ml-1.5 text-[11px] text-[#6e6e73] line-through">{formatINR(BUNDLE.compareAt)}</span>
        </span>
      </div>

      {rows.map((row) => (
        <div key={row.key} className="grid grid-cols-[1.4fr_1fr_1fr] px-5 py-2.5 items-start border-b border-white/[0.06] last:border-b-0">
          <span className="text-[12px] text-[#a1a1a6] pr-2">{row.label}</span>
          <Cell ok={row.singleOk}>{row.single}</Cell>
          <Cell ok strong>
            {row.bundle}
          </Cell>
        </div>
      ))}

      {!compact && (
        <>
          <div className="px-5 py-3 flex items-center gap-2 text-[11px] text-[#30d158] bg-[#30d158]/[0.06] border-t border-white/[0.08]">
            <Check className="w-3.5 h-3.5" />
            {copy.save}
          </div>

          <div className="grid sm:grid-cols-2 gap-3 p-5">
            <button
              type="button"
              onClick={onPickSingle}
              className="inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-full border border-white/[0.16] text-[12.5px] text-white hover:bg-white/[0.06] transition-colors"
            >
              {copy.single} · {formatINR(singlePrice)}
            </button>
            <button
              type="button"
              onClick={onPickBundle}
              className="inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-full bg-[#0071e3] hover:bg-[#0077ed] text-white text-[12.5px] font-medium transition-colors"
            >
              {copy.bundle} · {formatINR(BUNDLE.price)}
              <ArrowRight className="w-3.5 h-3.5" />
            </button>
          </div>
        </>
      )}
    </div>
  );
};
