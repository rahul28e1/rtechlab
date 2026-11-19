import React, { useState } from 'react';
import { Eye, CheckCircle2, X, Printer } from 'lucide-react';
import { resourcesData } from '../data/resources';
import { useLanguage } from '../context/LanguageContext';

export const ResourcesSection = () => {
  const [activeResource, setActiveResource] = useState(null);
  const { t, language } = useLanguage();

  const handlePrint = () => {
    window.print();
  };

  return (
    <section id="resources" className="py-24 md:py-32 px-6 max-w-6xl mx-auto">
      {/* Header */}
      <div className="text-center max-w-2xl mx-auto mb-14">
        <p className="text-[13px] font-medium text-[#86868b] mb-3">
          {t('resources.badge')}
        </p>
        <h2 className="text-[34px] sm:text-[44px] md:text-[52px] leading-[1.07] font-semibold tracking-[-0.04em] text-white">
          {t('resources.title')}
        </h2>
        <p className="mt-3 text-[15px] md:text-[17px] leading-relaxed text-[#a1a1a6]">
          {t('resources.subtitle')}
        </p>
      </div>

      {/* Resources Cards Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {resourcesData.map((res) => (
          <div
            key={res.id}
            className="bg-[#1d1d1f] rounded-[22px] p-7 flex flex-col justify-between transition-colors duration-500 hover:bg-[#242426] group"
          >
            <div>
              <div className="flex items-center justify-between text-xs mb-3">
                <span className="text-[11px] font-medium uppercase tracking-[0.06em] text-[#86868b]">
                  {language === 'hi' ? res.typeHi : res.type}
                </span>
                <span className="text-[11px] text-[#6e6e73]">{res.size}</span>
              </div>

              <h3 className="text-[19px] font-semibold text-white">
                {language === 'hi' ? res.titleHi : res.title}
              </h3>

              <p className="text-[13px] text-[#86868b] mt-2.5 leading-relaxed">
                {language === 'hi' ? res.descriptionHi : res.description}
              </p>

              {/* Highlights */}
              <div className="mt-4 space-y-1.5">
                {res.highlights.map((h, i) => (
                  <div key={i} className="flex items-center gap-2 text-[12px] text-[#a1a1a6]">
                    <CheckCircle2 className="w-3.5 h-3.5 text-[#6e6e73] flex-shrink-0" />
                    <span>{h}</span>
                  </div>
                ))}
              </div>
            </div>

            {/* Action Bar */}
            <div className="mt-7 pt-5 border-t border-white/[0.08] flex items-center justify-between">
              <span className="text-[11px] text-[#6e6e73]">
                Category: {res.category}
              </span>
              <button
                onClick={() => setActiveResource(res)}
                className="inline-flex items-center gap-1 text-[12px] font-medium text-[#2997ff] hover:text-white transition-colors duration-300"
              >
                <Eye className="w-3.5 h-3.5" />
                <span>{t('resources.viewBlueprint')}</span>
              </button>
            </div>
          </div>
        ))}
      </div>

      {/* Blueprint Inspector Modal */}
      {activeResource && (
        <div className="fixed inset-0 z-50 bg-black/70 backdrop-blur-xl flex items-center justify-center p-3 sm:p-6 animate-fadeIn">
          <div className="bg-[#1d1d1f] max-w-2xl w-full rounded-[24px] overflow-hidden flex flex-col max-h-[85vh]">
            <div className="p-6 border-b border-white/[0.06] flex items-center justify-between">
              <div>
                <span className="text-[11px] font-medium uppercase tracking-[0.06em] text-[#86868b]">
                  {language === 'hi' ? activeResource.typeHi : activeResource.type}
                </span>
                <h3 className="text-xl font-bold text-white mt-1.5">
                  {language === 'hi' ? activeResource.titleHi : activeResource.title}
                </h3>
              </div>

              <button
                onClick={() => setActiveResource(null)}
                className="p-1.5 rounded-lg text-slate-400 hover:text-white hover:bg-slate-800 transition"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            <div className="p-6 overflow-y-auto space-y-4 text-[#d2d2d7]">
              <div className="p-4 rounded-xl bg-black/40 font-mono text-[12px] whitespace-pre-wrap leading-relaxed text-[#a1a1a6]">
                {activeResource.contentDetails}
              </div>

              <div className="p-4 rounded-xl bg-white/[0.04] text-[12px] text-[#a1a1a6] flex items-center justify-between gap-4">
                <span>Print-friendly format formatted for student notebooks & NOC wall charts.</span>
                <button
                  onClick={handlePrint}
                  className="px-3 py-1.5 rounded-full bg-white/[0.08] hover:bg-white/[0.14] text-white font-medium text-[11px] flex items-center gap-1.5 transition-colors duration-300"
                >
                  <Printer className="w-3.5 h-3.5" />
                  Print View
                </button>
              </div>
            </div>

            <div className="p-4 border-t border-white/[0.06] flex justify-between items-center text-[11px] text-[#6e6e73]">
              <span>RTechLab Open Resource Repository</span>
              <button
                onClick={() => setActiveResource(null)}
                className="px-4 py-1.5 rounded-full bg-white/[0.08] hover:bg-white/[0.14] text-white font-medium transition-colors duration-300"
              >
                Done
              </button>
            </div>
          </div>
        </div>
      )}
    </section>
  );
};
