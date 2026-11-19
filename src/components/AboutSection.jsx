import React from 'react';
import { Terminal, Globe2, ShieldCheck, Award, CheckCircle2, ArrowUpRight } from 'lucide-react';
import { useLanguage } from '../context/LanguageContext';

export const AboutSection = () => {
  const { t } = useLanguage();

  const pillars = [
    {
      icon: Terminal,
      title: t('about.pillar1Title'),
      desc: t('about.pillar1Desc'),
      color: 'from-blue-600 to-cyan-500'
    },
    {
      icon: Globe2,
      title: t('about.pillar2Title'),
      desc: t('about.pillar2Desc'),
      color: 'from-electric-600 to-indigo-500'
    },
    {
      icon: ShieldCheck,
      title: t('about.pillar3Title'),
      desc: t('about.pillar3Desc'),
      color: 'from-emerald-600 to-teal-500'
    },
    {
      icon: Award,
      title: t('about.pillar4Title'),
      desc: t('about.pillar4Desc'),
      color: 'from-purple-600 to-blue-600'
    }
  ];

  return (
    <section id="about" className="py-24 md:py-32 px-6 max-w-6xl mx-auto relative border-t border-white/[0.08]">
      {/* Header */}
      <div className="text-center max-w-2xl mx-auto mb-16">
        <p className="text-[13px] font-medium text-[#86868b] mb-3">
          {t('about.badge')}
        </p>
        <h2 className="text-[34px] sm:text-[44px] md:text-[52px] leading-[1.07] font-semibold tracking-[-0.04em] text-white">
          {t('about.title')}
        </h2>
        <p className="mt-4 text-[19px] md:text-[24px] font-medium tracking-[-0.02em] text-[#86868b]">
          Learn. Practice. Innovate. — <span className="text-white">Technology Made Practical.</span>
        </p>
      </div>

      {/* Mission Grid */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-center mb-16">
        <div className="lg:col-span-7 space-y-5 text-[15px] sm:text-[17px] leading-relaxed text-[#a1a1a6]">
          <h3 className="text-[26px] sm:text-[32px] font-semibold text-white tracking-[-0.03em] leading-snug">
            {t('about.missionTitle')}
          </h3>
          <p>
            {t('about.missionP1')}
          </p>
          <p>
            {t('about.missionP2')}
          </p>

          <div className="pt-2 grid grid-cols-1 sm:grid-cols-2 gap-3 text-[12px] text-[#a1a1a6]">
            <div className="flex items-center gap-2.5">
              <CheckCircle2 className="w-4 h-4 text-[#6e6e73] flex-shrink-0" />
              <span>International Alignment (US, UK, CA, IN)</span>
            </div>
            <div className="flex items-center gap-2.5">
              <CheckCircle2 className="w-4 h-4 text-[#6e6e73] flex-shrink-0" />
              <span>Bilingual Architecture (English & Hindi)</span>
            </div>
          </div>
        </div>

        {/* Visual Lab Values Card with Official Brand Emblem */}
        <div className="lg:col-span-5 bg-[#1d1d1f] rounded-[26px] p-8 relative overflow-hidden">
          <div className="flex items-center gap-4 pb-6 border-b border-white/[0.08]">
            <img
              src="/brand/rtechlab-icon.png"
              alt="RTechLab Approved Emblem"
              className="w-12 h-12 rounded-[14px] object-contain"
            />
            <div>
              <h4 className="text-[18px] font-semibold text-white">
                The RTechLab Commitment
              </h4>
              <span className="text-[11px] tracking-[0.08em] text-[#86868b]">
                LEARN • PRACTICE • INNOVATE
              </span>
            </div>
          </div>

          <div className="mt-6 space-y-4 text-[13px] sm:text-[14px] leading-relaxed text-[#a1a1a6]">
            <div className="flex items-start gap-3">
              <span className="w-1.5 h-1.5 rounded-full bg-[#6e6e73] mt-2 flex-shrink-0" />
              <p>
                <strong className="text-white">Zero Paywalls:</strong> We believe essential networking and system fundamentals belong to everyone.
              </p>
            </div>
            <div className="flex items-start gap-3">
              <span className="w-1.5 h-1.5 rounded-full bg-[#6e6e73] mt-2 flex-shrink-0" />
              <p>
                <strong className="text-white">Zero Marketing Fluff:</strong> No fake reviews, inflated claims, or pay-to-win schemes. Pure lab skill.
              </p>
            </div>
            <div className="flex items-start gap-3">
              <span className="w-1.5 h-1.5 rounded-full bg-[#6e6e73] mt-2 flex-shrink-0" />
              <p>
                <strong className="text-white">Practical Over Theoretical:</strong> If it cannot be executed in a CLI or packet trace, it does not belong in our labs.
              </p>
            </div>
          </div>

          <div className="mt-6 pt-5 border-t border-white/[0.08] flex flex-col sm:flex-row sm:items-center justify-between gap-3 text-[12px]">
            <div className="flex items-center gap-2.5">
              <img
                src="/brand/rahul-patel.jpg"
                alt="Rahul Patel"
                className="w-7 h-7 rounded-full object-cover object-top ring-1 ring-emerald-500/40"
              />
              <span className="text-[#86868b]">
                Led by <strong className="text-white">Rahul Patel</strong> · Director &amp; Sr. Technical Expert, IANT Palanpur
              </span>
            </div>
            <div className="flex items-center gap-3">
              <a
                href="https://rahulprofile28.netlify.app/"
                target="_blank"
                rel="noopener noreferrer"
                className="text-emerald-400 hover:text-emerald-300 font-medium inline-flex items-center gap-1 transition-colors"
              >
                <span>Portfolio</span>
                <ArrowUpRight className="w-3.5 h-3.5" />
              </a>
              <span className="text-white/20">·</span>
              <a
                href="https://www.youtube.com/@RTechLabOfficial"
                target="_blank"
                rel="noopener noreferrer"
                className="text-red-400 hover:text-red-300 font-medium inline-flex items-center gap-1 transition-colors"
              >
                <span>YouTube</span>
                <ArrowUpRight className="w-3.5 h-3.5" />
              </a>
              <span className="text-white/20">·</span>
              <a
                href="https://www.instagram.com/rtechlabofficial/"
                target="_blank"
                rel="noopener noreferrer"
                className="text-pink-400 hover:text-pink-300 font-medium inline-flex items-center gap-1 transition-colors"
              >
                <span>Instagram</span>
                <ArrowUpRight className="w-3.5 h-3.5" />
              </a>
            </div>
          </div>
        </div>
      </div>

      {/* 4 Core Pillars Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {pillars.map((pillar, idx) => {
          const Icon = pillar.icon;
          return (
            <div
              key={idx}
              className="p-7 rounded-[22px] bg-[#1d1d1f] hover:bg-[#242426] transition-colors duration-500 flex flex-col justify-between group"
            >
              <div>
                <div className="w-11 h-11 rounded-full bg-white/[0.08] text-white flex items-center justify-center mb-5">
                  <Icon className="w-6 h-6" />
                </div>
                <h4 className="text-[17px] font-semibold text-white">
                  {pillar.title}
                </h4>
                <p className="text-[13px] text-[#86868b] mt-2 leading-relaxed">
                  {pillar.desc}
                </p>
              </div>
            </div>
          );
        })}
      </div>
    </section>
  );
};
