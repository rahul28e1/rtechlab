import React from 'react';
import { Link } from 'react-router';

const FEATURED_BOOKS = [
  {
    id: 'ccna',
    title: 'Cisco CCNA 200-301 Master Suite',
    subtitle: 'Enterprise Switching, OSPF, IPv6 & Cisco TAC Standard',
    pages: '72 Pages',
    tag: 'Networking Track',
    badge: '🌐 Cisco TAC Standard',
    previewUrl: '/downloads/CCNA-200-301-Hindi-Edition-1-5Page-Preview.pdf',
    price: 49,
    accent: 'cyan',
    highlights: ['IPv4 VLSM Subnetting', 'OSPFv2 Routing & Metrics', 'Top 120 Interview Vault'],
  },
  {
    id: 'office-365',
    title: 'Microsoft Office 365 Enterprise Suite',
    subtitle: 'Advanced Excel, Word, PowerPoint, Access & MIS Workflows',
    pages: '113 Pages',
    tag: 'Corporate MIS Track',
    badge: '⚡ Placement Ready',
    previewUrl: '/downloads/Office-365-Hindi-Edition-1-5Page-Preview.pdf',
    price: 49,
    accent: 'blue',
    highlights: ['Advanced Excel XLOOKUP', 'Power Query & Dynamic Arrays', 'Top 100 Shortcuts Vault'],
  },
  {
    id: 'ai',
    title: 'Artificial Intelligence Mastery',
    subtitle: 'Neural Nets, Transformers, RAG Vector Search & AI Agents',
    pages: '44 Pages',
    tag: 'AI Engineering',
    badge: '🔥 Highest CTC Track',
    previewUrl: '/downloads/AI-Essentials-Hindi-Edition-1-5Page-Preview.pdf',
    price: 49,
    accent: 'purple',
    highlights: ['Transformer & Attention Math', 'Enterprise Prompt Engineering', 'Autonomous Multi-Agent Swarms'],
  },
  {
    id: 'fundamentals',
    title: 'Computer Fundamentals & Architecture',
    subtitle: 'Silicon IPO Cycle, Memory Hierarchy & OS Kernels',
    pages: '45 Pages',
    tag: 'Core Foundation',
    badge: '💻 Core Foundation',
    previewUrl: '/downloads/Computer-Fundamentals-Hindi-Edition-1-5Page-Preview.pdf',
    price: 49,
    accent: 'emerald',
    highlights: ['CPU Machine Cycle & Cache', 'OS Kernel Architecture', 'Top 50 MNC Placement Vault'],
  },
];

export function FeaturedNotesShelf() {
  return (
    <section className="py-14 px-4 sm:px-6 lg:px-8 max-w-7xl mx-auto border-t border-white/[0.06]">
      {/* Section Header */}
      <div className="flex flex-col sm:flex-row sm:items-end justify-between mb-8 sm:mb-10 gap-4">
        <div>
          <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 text-xs font-mono font-semibold mb-3">
            <span>📚 2027 Digital Handbooks</span>
          </div>
          <h2 className="text-2xl sm:text-3xl md:text-4xl font-black text-white tracking-tight">
            Official Technical Study Handbooks
          </h2>
          <p className="text-sm sm:text-base text-[#86868B] max-w-2xl mt-1.5">
            Zero-fluff, industry-verified study materials written in simple Hinglish &amp; English. 1-click offline downloads for mobile &amp; laptop.
          </p>
        </div>
        <Link
          to="/notes"
          className="inline-flex items-center gap-1.5 text-xs sm:text-sm font-semibold text-emerald-400 hover:text-emerald-300 self-start sm:self-auto transition-colors"
        >
          <span>View All Bundles &amp; Editions</span>
          <span>&rarr;</span>
        </Link>
      </div>

      {/* 4 Clean Cards Grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {FEATURED_BOOKS.map((book) => (
          <div
            key={book.id}
            className="rounded-2xl bg-[#0f1117] border border-white/[0.08] hover:border-white/20 p-5 flex flex-col justify-between transition-all duration-200 group hover:-translate-y-0.5 hover:shadow-xl hover:shadow-black/50"
          >
            <div>
              {/* Badge & Pages */}
              <div className="flex items-center justify-between gap-2 mb-3">
                <span className="text-[10px] font-mono px-2 py-0.5 rounded-full bg-white/[0.06] text-white/80 font-semibold border border-white/[0.06] truncate">
                  {book.badge}
                </span>
                <span className="text-[11px] font-mono text-[#86868B] font-medium shrink-0">
                  {book.pages}
                </span>
              </div>

              {/* Title & Subtitle */}
              <h3 className="text-base font-bold text-white group-hover:text-emerald-300 transition-colors tracking-tight line-clamp-1 mb-1">
                {book.title}
              </h3>
              <p className="text-xs text-[#86868B] line-clamp-2 leading-relaxed mb-4">
                {book.subtitle}
              </p>

              {/* High-yield highlights list */}
              <div className="space-y-1.5 mb-5 pt-3 border-t border-white/[0.06]">
                {book.highlights.map((h, i) => (
                  <div key={i} className="flex items-center gap-2 text-[11px] text-[#A1A1A6]">
                    <span className="w-1 h-1 rounded-full bg-emerald-400 shrink-0" />
                    <span className="truncate">{h}</span>
                  </div>
                ))}
              </div>
            </div>

            {/* Price & Action Buttons */}
            <div className="pt-3 border-t border-white/[0.06] space-y-2">
              <div className="flex items-baseline justify-between mb-1">
                <div className="flex items-baseline gap-1.5">
                  <span className="text-lg font-black text-white">₹{book.price}</span>
                  <span className="text-[10px] text-[#86868B] line-through">₹299</span>
                </div>
                <span className="text-[10px] font-mono text-emerald-400 font-semibold bg-emerald-500/10 px-2 py-0.5 rounded">
                  Hindi / English
                </span>
              </div>

              <div className="grid grid-cols-2 gap-2">
                <a
                  href={book.previewUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="py-2 px-2.5 rounded-xl bg-white/[0.05] hover:bg-white/[0.1] border border-white/10 text-white text-xs font-semibold text-center transition-all active:scale-95 truncate"
                >
                  📖 Sample
                </a>
                <Link
                  to={`/notes?book=${book.id}`}
                  className="py-2 px-2.5 rounded-xl bg-emerald-400 hover:bg-emerald-300 text-black text-xs font-extrabold text-center transition-all shadow-md shadow-emerald-500/20 active:scale-95 truncate"
                >
                  ⚡ Get ₹{book.price}
                </Link>
              </div>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}
