import React, { useState } from 'react';
import { Link } from 'react-router';
import { categoriesData } from '../../src/data/categories';

// ── Core Technology Domains for the Hero Showcase ──────────────────────────
const coreDomains = [
  {
    icon: (
      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.75} d="M9 3v2m6-2v2M9 19v2m6-2v2M3 9h2m-2 6h2m18-6h2m-2 6h2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z" />
      </svg>
    ),
    title: 'Hardware & Architecture',
    summary: 'CPUs, Motherboards, Memory channels, Storage RAID & Assembly',
    tag: 'Physical Layer',
  },
  {
    icon: (
      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.75} d="M12 2a2 2 0 100 4 2 2 0 000-4zM2 10a2 2 0 100 4 2 2 0 000-4zm20 0a2 2 0 100 4 2 2 0 000-4zm-10 8a2 2 0 100 4 2 2 0 000-4zm-8-6l6 2m4 0l6-2m-10 4v4" />
      </svg>
    ),
    title: 'Enterprise Networking & CCNA',
    summary: 'OSI 7 Layers, TCP/IP Suite, IPv4/v6 Subnetting & Cisco 200-301',
    tag: 'Networking',
  },
  {
    icon: (
      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.75} d="M8 9l3 3-3 3m5 0h3M5 20h14a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
      </svg>
    ),
    title: 'Linux Systems & Admin',
    summary: 'Command Line Mastery, Bash Scripting, Permissions & Systemd',
    tag: 'Operating Systems',
  },
  {
    icon: (
      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.75} d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
      </svg>
    ),
    title: 'Cyber Security & Defense',
    summary: 'Wireshark Packet Analysis, Firewalls, Threat Mitigation & SOC',
    tag: 'Security',
  },
  {
    icon: (
      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.75} d="M3 15a4 4 0 004 4h9a5 5 0 10-.1-9.999 5.002 5.002 0 10-9.78 2.096A4.001 4.001 0 003 15z" />
      </svg>
    ),
    title: 'Cloud Computing & DevOps',
    summary: 'AWS, Azure, VPC Architecture, Docker Containers & Automation',
    tag: 'Cloud & Infra',
  },
  {
    icon: (
      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.75} d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
      </svg>
    ),
    title: 'AI & Automation Engineering',
    summary: 'Python for Network Engineers, REST APIs, JSON & AI Tooling',
    tag: 'Automation & AI',
  },
  {
    icon: (
      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.75} d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
      </svg>
    ),
    title: 'Computer Fundamentals',
    summary: 'Binary Math, Logic Gates, Operating System Kernels & Protocols',
    tag: 'Foundations',
  },
  {
    icon: (
      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.75} d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z" />
      </svg>
    ),
    title: 'System Design & Visuals',
    summary: 'Interactive Simulators, Architecture Topologies & Design Flow',
    tag: 'Design & Visuals',
  },
];

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

        {/* Call to Actions (Apple & Roadmap.sh style) */}
        <div className="flex flex-col sm:flex-row items-center justify-center gap-3 sm:gap-4 mb-16">
          <Link
            to="/notes"
            className="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-8 py-3.5 rounded-full bg-white text-black font-semibold text-sm sm:text-base hover:bg-[#E8E8ED] transition-all duration-200 shadow-lg shadow-white/5 active:scale-[0.98]"
          >
            Explore All Tracks
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M14 5l7 7m0 0l-7 7m7-7H3" />
            </svg>
          </Link>
          <Link
            to="/tools/subnet-calculator"
            className="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-7 py-3.5 rounded-full bg-white/[0.06] hover:bg-white/[0.12] text-white border border-white/[0.15] font-semibold text-sm sm:text-base transition-all duration-200 active:scale-[0.98]"
          >
            Interactive Tools
          </Link>
        </div>

        {/* ── Topic Spectrum Mini Details (Directly in Hero) ──────────────── */}
        <div className="pt-8 border-t border-white/[0.08] text-left">
          <div className="flex items-center justify-between mb-4">
            <span className="text-xs font-mono uppercase tracking-widest text-[#86868B] font-semibold">
              Complete Tech Spectrum Covered:
            </span>
            <span className="text-xs text-[#86868B] font-mono hidden sm:inline">
              8 Core Disciplines
            </span>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3">
            {coreDomains.map((domain) => (
              <div
                key={domain.title}
                className="p-4 rounded-xl bg-[#0D0D0F] border border-white/[0.06] hover:border-white/20 hover:bg-[#121215] transition-all duration-200 flex flex-col justify-between"
              >
                <div>
                  <div className="flex items-center justify-between gap-2 mb-2">
                    <div className="p-1.5 rounded-lg bg-white/[0.06] text-white">
                      {domain.icon}
                    </div>
                    <span className="text-[10px] font-mono text-[#86868B] uppercase tracking-wider">
                      {domain.tag}
                    </span>
                  </div>
                  <h4 className="text-sm font-bold text-white tracking-tight mb-1">
                    {domain.title}
                  </h4>
                  <p className="text-xs text-[#86868B] leading-relaxed">
                    {domain.summary}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Minimalist Specs Strip */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 sm:gap-6 max-w-4xl mx-auto mt-12 pt-8 border-t border-white/[0.08]">
          <div className="p-2 text-center">
            <div className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">120+</div>
            <div className="text-xs sm:text-sm text-[#86868B] font-medium mt-1">Video Lessons</div>
          </div>
          <div className="p-2 text-center border-l border-white/[0.08]">
            <div className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">8</div>
            <div className="text-xs sm:text-sm text-[#86868B] font-medium mt-1">Guided Tracks</div>
          </div>
          <div className="p-2 text-center border-l-0 md:border-l border-white/[0.08]">
            <div className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">6</div>
            <div className="text-xs sm:text-sm text-[#86868B] font-medium mt-1">Live Simulators</div>
          </div>
          <div className="p-2 text-center border-l border-white/[0.08]">
            <div className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">100%</div>
            <div className="text-xs sm:text-sm text-[#86868B] font-medium mt-1">Free &amp; Open</div>
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
              Curriculum &amp; Tracks
            </div>
            <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white tracking-tight">
              Interactive Roadmaps
            </h2>
          </div>
          <p className="text-[#A1A1A6] text-sm sm:text-base max-w-md font-normal leading-relaxed">
            Step-by-step learning paths created to take you from foundational concepts to production-grade infrastructure mastery.
          </p>
        </div>

        {/* Filter Pills (Roadmap.sh inspired) */}
        <div className="flex flex-wrap items-center gap-2 mb-8">
          {[
            { id: 'all', label: 'All Roadmaps' },
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
                  View Roadmap →
                </span>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  );
}
