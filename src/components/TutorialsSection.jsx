import React, { useState } from 'react';
import { Clock, ChevronRight, Terminal, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { tutorialsData } from '../data/tutorials';
import { useLanguage } from '../context/LanguageContext';

export const TutorialsSection = () => {
  const [selectedCategoryFilter, setSelectedCategoryFilter] = useState('ALL');
  const { t, language } = useLanguage();

  const categories = ['ALL', 'CCNA & Networking', 'Linux Systems', 'Cyber Security', 'Coding & Automation', 'Cloud Computing'];

  const filteredTutorials = selectedCategoryFilter === 'ALL'
    ? tutorialsData
    : tutorialsData.filter(tut => tut.category.toLowerCase().includes(selectedCategoryFilter.toLowerCase()));

  return (
    <section id="tutorials" className="py-24 md:py-32 px-6 max-w-6xl mx-auto">
      {/* Section Header */}
      <div className="flex flex-col md:flex-row md:items-end justify-between gap-8 mb-14">
        <div>
          <p className="text-[13px] font-medium text-[#86868b] mb-3">
            {t('tutorials.badge')}
          </p>
          <h2 className="text-[34px] sm:text-[44px] md:text-[52px] leading-[1.07] font-semibold tracking-[-0.04em] text-white">
            {t('tutorials.title')}
          </h2>
          <p className="mt-3 text-[15px] md:text-[17px] leading-relaxed text-[#a1a1a6] max-w-2xl">
            {t('tutorials.subtitle')}
          </p>
        </div>

        {/* Category Filter Pills */}
        <div className="inline-flex flex-wrap items-center gap-1 rounded-full bg-[#1d1d1f] p-1">
          {categories.map((cat) => (
            <button
              key={cat}
              onClick={() => setSelectedCategoryFilter(cat)}
              className={`px-4 py-1.5 rounded-full text-[12px] font-medium transition-colors duration-300 ${
                selectedCategoryFilter === cat
                  ? 'bg-white text-black'
                  : 'text-[#a1a1a6] hover:text-white'
              }`}
            >
              {cat === 'ALL' ? 'All Guides' : cat}
            </button>
          ))}
        </div>
      </div>

      {/* Tutorials Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {filteredTutorials.map((tut) => (
          <div
            key={tut.id}
            className="bg-[#1d1d1f] rounded-[22px] p-7 flex flex-col justify-between transition-colors duration-500 hover:bg-[#242426] group"
          >
            <div>
              {/* Card Meta Header */}
              <div className="flex items-center justify-between text-xs mb-3">
                <span className="text-[11px] font-medium uppercase tracking-[0.06em] text-[#86868b]">
                  {tut.badge}
                </span>
                <span className="flex items-center gap-1 text-[11px] text-[#6e6e73]">
                  <Clock className="w-3.5 h-3.5" />
                  {tut.readTime}
                </span>
              </div>

              {/* Title */}
              <h3 className="text-[19px] font-semibold text-white leading-snug">
                <Link to={language === 'hi' ? `/hi/tutorials/${tut.id}` : `/tutorials/${tut.id}`}>
                  {language === 'hi' ? tut.titleHi : tut.title}
                </Link>
              </h3>

              {/* Summary */}
              <p className="text-[13px] text-[#86868b] mt-2.5 line-clamp-3 leading-relaxed">
                {language === 'hi' ? tut.summaryHi : tut.summary}
              </p>

              {/* Topology / Environment Note */}
              <div className="mt-5 text-[11px] text-[#6e6e73] flex items-center gap-2">
                <Terminal className="w-3.5 h-3.5 flex-shrink-0" />
                <span className="truncate">{tut.topology}</span>
              </div>
            </div>

            {/* Read Button */}
            <div className="mt-7 pt-5 border-t border-white/[0.08] flex items-center justify-between">
              <span className="text-[12px] text-[#86868b]">
                {language === 'hi' ? tut.difficultyHi : tut.difficulty}
              </span>
              <Link
                to={language === 'hi' ? `/hi/tutorials/${tut.id}` : `/tutorials/${tut.id}`}
                className="inline-flex items-center gap-1 text-[12px] font-medium text-[#2997ff] hover:text-white transition-colors duration-300"
              >
                <span>{t('tutorials.readGuide')}</span>
                <ChevronRight className="w-3.5 h-3.5" />
              </Link>
            </div>
          </div>
        ))}
      </div>

      {/* Explore All Hub Link */}
      <div className="mt-16 text-center">
        <Link
          to={language === 'hi' ? "/hi/tutorials" : "/tutorials"}
          className="group inline-flex items-center gap-1 text-[15px] font-medium text-[#2997ff] transition-colors duration-300 hover:text-white"
        >
          <span>
            {language === 'hi'
              ? `सभी ${tutorialsData.length} ट्यूटोरियल्स एवं हैंड्स-ऑन लैब्स देखें`
              : `Explore All ${tutorialsData.length} Tutorials & Hands-on Labs`}
          </span>
          <ArrowRight className="w-4 h-4 transition-transform duration-300 group-hover:translate-x-0.5" />
        </Link>
      </div>
    </section>
  );
};
