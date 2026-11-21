import React, { useState } from 'react';
import { Link } from 'react-router';
import { categoriesData } from '../../src/data/categories';

export function Hero() {
  return (
    <section className="relative overflow-hidden pt-16 sm:pt-24 pb-16 px-4 sm:px-6">
      {/* Apple-style ambient radial light behind the headline */}
      <div className="absolute top-0 left-1/2 -translate-x-1/2 w-[900px] h-[450px] bg-gradient-to-b from-white/[0.08] via-transparent to-transparent blur-3xl pointer-events-none -z-10" />

      <div className="max-w-6xl mx-auto text-center">
        {/* Universal Pill Badge */}
        <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-white/[0.05] border border-white/[0.12] text-xs font-semibold text-white/90 mb-8 backdrop-blur-md">
          <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
          <span>Universal Engineering Academy · 100% Free · Hardware to Cloud</span>
        </div>

        {/* Clean, Bold, Universal Headline */}
        <h1 className="text-5xl sm:text-7xl lg:text-8xl font-black tracking-[-0.04em] text-white leading-[1.03] mb-6">
          Master Modern Tech.<br />
          <span className="bg-gradient-to-b from-[#EDEDED] via-[#A1A1A6] to-[#6E6E73] bg-clip-text text-transparent">
            From Silicon to Cloud.
          </span>
        </h1>

        {/* Crisp Universal Subtitle */}
        <p className="text-lg sm:text-xl md:text-2xl text-[#86868B] max-w-3xl mx-auto font-normal leading-relaxed mb-10 tracking-tight">
          Comprehensive, zero-fluff roadmaps across Computer Fundamentals, Hardware, Enterprise Networking, Linux, Cybersecurity, Cloud, DevOps &amp; AI. Built for real-world engineers worldwide.
        </p>

        {/* 3 Core Pillars: Notes (Monetization), Tools (Utility), Videos (Education) */}
        <div className="flex flex-col sm:flex-row items-center justify-center gap-2.5 sm:gap-3.5 mb-14 max-w-2xl mx-auto">
          <Link
            to="/notes"
            className="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-7 py-3 rounded-full bg-emerald-400 hover:bg-emerald-300 text-black font-extrabold text-sm sm:text-base transition-all shadow-xl shadow-emerald-500/20 active:scale-[0.98]"
          >
            <span>📚 Browse Notes (₹49)</span>
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M14 5l7 7m0 0l-7 7m7-7H3" />
            </svg>
          </Link>
          <Link
            to="/tools"
            className="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-white/[0.06] hover:bg-white/[0.12] text-white border border-white/[0.15] font-semibold text-sm sm:text-base transition-all active:scale-[0.98]"
          >
            <span>🛠️ Free Engineering Tools</span>
          </Link>
          <Link
            to="/tutorials"
            className="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-white/[0.06] hover:bg-white/[0.12] text-cyan-300 border border-cyan-500/30 font-semibold text-sm sm:text-base transition-all active:scale-[0.98]"
          >
            <span>🎬 Video Series</span>
          </Link>
        </div>

        {/* Minimalist Specs Strip */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-3 sm:gap-6 max-w-4xl mx-auto pt-8 border-t border-white/[0.08]">
          <div className="p-2 text-center">
            <div className="text-2xl sm:text-4xl font-extrabold text-white tracking-tight">120+</div>
            <div className="text-xs sm:text-sm text-[#86868B] font-medium mt-1">Video Lessons</div>
          </div>
          <div className="p-2 text-center border-l border-white/[0.08]">
            <div className="text-2xl sm:text-4xl font-extrabold text-white tracking-tight">8</div>
            <div className="text-xs sm:text-sm text-[#86868B] font-medium mt-1">Guided Tracks</div>
          </div>
          <div className="p-2 text-center border-l-0 md:border-l border-white/[0.08]">
            <div className="text-2xl sm:text-4xl font-extrabold text-white tracking-tight">6+</div>
            <div className="text-xs sm:text-sm text-[#86868B] font-medium mt-1">Live Simulators</div>
          </div>
          <div className="p-2 text-center border-l border-white/[0.08]">
            <div className="text-2xl sm:text-4xl font-extrabold text-emerald-400 tracking-tight">₹49</div>
            <div className="text-xs sm:text-sm text-[#86868B] font-medium mt-1">Student Notes</div>
          </div>
        </div>
      </div>
    </section>
  );
}

// ── ROADMAP.SH STYLE LEARNING PATHS ──────────────────────────────────────────
export function CategoryExplorer() {
  const [filter, setFilter] = useState('all');

  const filteredCategories = categoriesData.filter((cat) => {
    if (filter === 'cert') return cat.id === 'ccna';
    if (filter === 'infra') return ['networking', 'hardware', 'cloud'].includes(cat.id);
    if (filter === 'ops') return ['linux', 'cybersecurity', 'coding'].includes(cat.id);
    return true;
  });

  return (
    <section className="py-20 px-4 sm:px-6 lg:px-8 border-t border-white/[0.06]">
      <div className="max-w-7xl mx-auto">
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12">
          <div>
            <div className="text-xs font-mono uppercase tracking-widest text-[#86868B] mb-2 font-semibold">
              Curriculum &amp; Study Notes
            </div>
            <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white tracking-tight">
              Engineering Tracks &amp; Notes
            </h2>
          </div>
          <p className="text-[#A1A1A6] text-sm sm:text-base max-w-md font-normal leading-relaxed">
            Step-by-step curriculum tracks with comprehensive study notes, interactive previews, and enterprise interview question banks.
          </p>
        </div>

        {/* Filter Pills */}
        <div className="flex flex-wrap items-center gap-2 mb-8">
          {[
            { id: 'all', label: 'All Subjects' },
            { id: 'infra', label: 'Core Infrastructure' },
            { id: 'cert', label: 'Certifications (CCNA)' },
            { id: 'ops', label: 'Systems & Security' },
          ].map((tab) => (
            <button
              key={tab.id}
              onClick={() => setFilter(tab.id)}
              className={`px-4 py-2 rounded-full text-xs sm:text-sm font-semibold tracking-tight transition-all duration-200 ${
                filter === tab.id
                  ? 'bg-white text-black'
                  : 'bg-white/[0.04] text-[#A1A1A6] hover:text-white hover:bg-white/[0.08] border border-white/[0.08]'
              }`}
            >
              {tab.label}
            </button>
          ))}
        </div>

        {/* Roadmap Cards Grid (Clean, Bold, High-Contrast) */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
          {filteredCategories.map((cat) => (
            <Link
              key={cat.id}
              to={cat.id === 'freetools' ? '/tools/subnet-calculator' : '/notes'}
              className="group relative flex flex-col justify-between p-6 sm:p-7 rounded-2xl bg-[#0D0D0F] border border-white/[0.08] hover:border-white/30 hover:bg-[#121215] transition-all duration-300 shadow-xl"
            >
              <div>
                {/* Header row: Target Role & Modules Badge */}
                <div className="flex items-center justify-between gap-2 mb-4">
                  <span className="text-[11px] font-mono font-medium uppercase tracking-wider text-[#86868B] bg-white/[0.04] px-2.5 py-1 rounded-md border border-white/[0.06]">
                    {cat.level}
                  </span>
                  <span className="text-xs font-semibold text-white/70">
                    {cat.modulesCount} modules
                  </span>
                </div>

                {/* Bold Title */}
                <h3 className="text-xl sm:text-2xl font-bold text-white tracking-tight mb-2 group-hover:text-white transition-colors">
                  {cat.title}
                </h3>

                {/* Description */}
                <p className="text-sm text-[#86868B] leading-relaxed mb-6 font-normal">
                  {cat.shortDesc}
                </p>

                {/* Roadmap Milestones (Step pills) */}
                <div className="space-y-1.5 mb-6">
                  {cat.keyTopics.slice(0, 4).map((topic, idx) => (
                    <div
                      key={topic}
                      className="flex items-center gap-2 text-xs text-[#D2D2D7] font-medium"
                    >
                      <span className="w-4 h-4 rounded-full bg-white/[0.08] text-[10px] text-white flex items-center justify-center font-mono flex-shrink-0">
                        {idx + 1}
                      </span>
                      <span className="truncate">{topic}</span>
                    </div>
                  ))}
                </div>
              </div>

              {/* Bottom Card Footer */}
              <div className="pt-4 border-t border-white/[0.06] flex items-center justify-between text-xs font-semibold text-white group-hover:text-white">
                <span className="text-[#86868B] font-mono text-[11px]">
                  Target: {cat.targetRole.split('/')[0]}
                </span>
                <span className="inline-flex items-center gap-1 group-hover:translate-x-1 transition-transform">
                  Explore Notes &amp; Track →
                </span>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  );
}
