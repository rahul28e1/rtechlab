import React, { useState, useMemo } from 'react';
import { Link } from 'react-router';
import {
  Play,
  Clock,
  ArrowUpRight,
  Calendar,
  Sparkles,
  Search,
  BookOpen,
  Layers,
  ChevronRight,
  CheckCircle2,
  Tv,
  Film,
  Compass
} from 'lucide-react';
import { YOUTUBE_MASTERCLASSES, INSTAGRAM_REELS_AND_SHORTS } from '../../src/data/videoCurriculumData';
import { tutorialsData } from '../../src/data/tutorials';

const YoutubeIcon = ({ className = "w-4 h-4" }) => (
  <svg className={className} viewBox="0 0 24 24" fill="currentColor">
    <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
  </svg>
);

const InstagramIcon = ({ className = "w-4 h-4" }) => (
  <svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <rect width="20" height="20" x="2" y="2" rx="5" ry="5" />
    <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z" />
    <line x1="17.5" x2="17.51" y1="6.5" y2="6.5" />
  </svg>
);

export function TutorialsHubPage() {
  const [selectedLanguage, setSelectedLanguage] = useState('ALL'); // 'ALL' | 'EN' | 'HI'
  const [selectedFormat, setSelectedFormat] = useState('ALL'); // 'ALL' | 'YOUTUBE' | 'REELS' | 'WRITTEN'
  const [selectedStatus, setSelectedStatus] = useState('ALL'); // 'ALL' | 'PUBLISHED' | 'SCHEDULED'
  const [searchQuery, setSearchQuery] = useState('');

  // Filter YouTube Masterclasses
  const filteredYouTube = useMemo(() => {
    return YOUTUBE_MASTERCLASSES.filter(item => {
      const q = searchQuery.toLowerCase();
      const matchesSearch = !q ||
        item.title.en.toLowerCase().includes(q) ||
        item.title.hi.toLowerCase().includes(q) ||
        item.category.toLowerCase().includes(q) ||
        item.tags.some(t => t.toLowerCase().includes(q));

      const matchesStatus =
        selectedStatus === 'ALL' ||
        (selectedStatus === 'PUBLISHED' && item.status === 'published') ||
        (selectedStatus === 'SCHEDULED' && item.status === 'scheduled');

      return matchesSearch && matchesStatus;
    });
  }, [searchQuery, selectedStatus]);

  // Filter Instagram Reels & Shorts
  const filteredReels = useMemo(() => {
    return INSTAGRAM_REELS_AND_SHORTS.filter(item => {
      const q = searchQuery.toLowerCase();
      const matchesSearch = !q ||
        item.title.en.toLowerCase().includes(q) ||
        item.title.hi.toLowerCase().includes(q) ||
        item.category.toLowerCase().includes(q) ||
        item.highlight.toLowerCase().includes(q);

      const matchesStatus =
        selectedStatus === 'ALL' ||
        (selectedStatus === 'PUBLISHED' && item.status === 'published') ||
        (selectedStatus === 'SCHEDULED' && item.status === 'scheduled');

      return matchesSearch && matchesStatus;
    });
  }, [searchQuery, selectedStatus]);

  // Filter Written Tutorials
  const filteredWritten = useMemo(() => {
    return tutorialsData.filter(item => {
      const q = searchQuery.toLowerCase();
      return !q ||
        item.title.toLowerCase().includes(q) ||
        (item.titleHi && item.titleHi.toLowerCase().includes(q)) ||
        item.category.toLowerCase().includes(q) ||
        item.summary.toLowerCase().includes(q);
    });
  }, [searchQuery]);

  return (
    <div className="min-h-screen bg-black text-[#EDEDED]">
      {/* Breadcrumb & Hero Header */}
      <div className="mx-auto max-w-7xl px-4 pt-12 sm:px-6 sm:pt-16 lg:px-8">
        <nav className="mb-6 flex items-center gap-1.5 text-[11px] text-slate-500">
          <Link to="/" className="hover:text-white transition-colors">Home</Link>
          <span>/</span>
          <span className="text-slate-300">Tutorials &amp; Media</span>
        </nav>

        <div className="flex flex-col lg:flex-row lg:items-end justify-between gap-8 pb-10 border-b border-white/[0.08]">
          <div className="max-w-3xl">
            <p className="text-[12px] font-mono uppercase tracking-[0.15em] text-emerald-400 mb-2">
              Bilingual Technical Learning Hub
            </p>
            <h1 className="text-4xl sm:text-5xl md:text-6xl font-black tracking-tight text-white leading-[1.06]">
              Masterclass Videos, Reels &amp; Lab Guides.
            </h1>
            <p className="mt-4 text-base sm:text-lg leading-relaxed text-[#a1a1a6]">
              Universal engineering education across 4K YouTube masterclasses, daily Instagram 60-second reels, 
              and written packet-level guides in <strong className="text-white">English and Hindi</strong>.
            </p>
          </div>

          {/* Quick Stats Banner */}
          <div className="flex flex-wrap items-center gap-3 text-[12px]">
            <div className="rounded-xl border border-white/[0.08] bg-[#1d1d1f] px-4 py-2.5">
              <span className="text-[#86868b] block text-[11px]">YouTube Episodes</span>
              <span className="text-white font-bold text-lg">7 Masterclasses</span>
            </div>
            <div className="rounded-xl border border-white/[0.08] bg-[#1d1d1f] px-4 py-2.5">
              <span className="text-[#86868b] block text-[11px]">Reels &amp; Shorts</span>
              <span className="text-white font-bold text-lg">11 Fast Explanations</span>
            </div>
            <div className="rounded-xl border border-white/[0.08] bg-[#1d1d1f] px-4 py-2.5">
              <span className="text-[#86868b] block text-[11px]">Written Guides</span>
              <span className="text-white font-bold text-lg">16 Lab Tutorials</span>
            </div>
          </div>
        </div>

        {/* Top Official Channel Cards */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 my-10">
          {/* YouTube Channel Hero Card */}
          <div className="rounded-[24px] border border-red-500/20 bg-gradient-to-br from-[#1c1214] via-[#161214] to-[#0f0c0d] p-6 sm:p-8 relative overflow-hidden group">
            <div className="absolute top-0 right-0 w-80 h-80 bg-red-600/10 rounded-full blur-3xl pointer-events-none -mr-20 -mt-20" />
            <div className="relative z-10 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-6">
              <div className="flex items-center gap-4">
                <div className="w-14 h-14 rounded-2xl bg-red-600 flex items-center justify-center text-white shadow-lg shadow-red-600/30 flex-shrink-0">
                  <YoutubeIcon className="w-8 h-8" />
                </div>
                <div>
                  <div className="flex items-center gap-2">
                    <h2 className="text-xl font-bold text-white tracking-tight">RTechLab Official YouTube</h2>
                    <span className="rounded-full bg-red-500/20 text-red-400 text-[10px] font-mono px-2 py-0.5 border border-red-500/30">
                      4K HDR
                    </span>
                  </div>
                  <p className="text-xs text-slate-400 mt-1">
                    Multi-Language Audio (English &amp; Hindi) · Packet traces · Subsea cable documentaries
                  </p>
                </div>
              </div>

              <a
                href="https://www.youtube.com/@RTechLabOfficial"
                target="_blank"
                rel="noopener noreferrer"
                className="w-full sm:w-auto inline-flex items-center justify-center gap-2 rounded-xl bg-red-600 px-5 py-3 text-sm font-semibold text-white transition-all duration-300 hover:bg-red-500 hover:shadow-lg hover:shadow-red-600/30 active:scale-95"
              >
                <span>Subscribe @RTechLabOfficial</span>
                <ArrowUpRight className="w-4 h-4" />
              </a>
            </div>
          </div>

          {/* Instagram Hub Hero Card */}
          <div className="rounded-[24px] border border-pink-500/20 bg-gradient-to-br from-[#1c1218] via-[#161218] to-[#0f0c0e] p-6 sm:p-8 relative overflow-hidden group">
            <div className="absolute top-0 right-0 w-80 h-80 bg-pink-600/10 rounded-full blur-3xl pointer-events-none -mr-20 -mt-20" />
            <div className="relative z-10 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-6">
              <div className="flex items-center gap-4">
                <div className="w-14 h-14 rounded-2xl bg-gradient-to-tr from-yellow-500 via-pink-500 to-purple-600 flex items-center justify-center text-white shadow-lg shadow-pink-500/30 flex-shrink-0">
                  <InstagramIcon className="w-7 h-7" />
                </div>
                <div>
                  <div className="flex items-center gap-2">
                    <h2 className="text-xl font-bold text-white tracking-tight">RTechLab Instagram Reels</h2>
                    <span className="rounded-full bg-pink-500/20 text-pink-400 text-[10px] font-mono px-2 py-0.5 border border-pink-500/30">
                      Daily 60s
                    </span>
                  </div>
                  <p className="text-xs text-slate-400 mt-1">
                    Fast visual cheatsheets · CLI hacks · Exam countdown drills · Bilingual audio
                  </p>
                </div>
              </div>

              <a
                href="https://www.instagram.com/rtechlabofficial/"
                target="_blank"
                rel="noopener noreferrer"
                className="w-full sm:w-auto inline-flex items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-pink-600 to-purple-600 px-5 py-3 text-sm font-semibold text-white transition-all duration-300 hover:opacity-90 hover:shadow-lg hover:shadow-pink-600/30 active:scale-95"
              >
                <span>Follow @rtechlabofficial</span>
                <ArrowUpRight className="w-4 h-4" />
              </a>
            </div>
          </div>
        </div>

        {/* Interactive Filter Toolbar */}
        <div className="sticky top-16 z-30 mb-10 rounded-2xl border border-white/[0.08] bg-[#121316]/95 backdrop-blur-xl p-4 shadow-xl">
          <div className="flex flex-col md:flex-row items-stretch md:items-center justify-between gap-4">
            {/* Format Pills */}
            <div className="flex flex-wrap items-center gap-1.5">
              <button
                onClick={() => setSelectedFormat('ALL')}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-semibold transition-all ${
                  selectedFormat === 'ALL'
                    ? 'bg-white text-black shadow'
                    : 'bg-white/[0.06] text-slate-300 hover:bg-white/[0.1]'
                }`}
              >
                All Content ({YOUTUBE_MASTERCLASSES.length + INSTAGRAM_REELS_AND_SHORTS.length + tutorialsData.length})
              </button>
              <button
                onClick={() => setSelectedFormat('YOUTUBE')}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-semibold inline-flex items-center gap-1.5 transition-all ${
                  selectedFormat === 'YOUTUBE'
                    ? 'bg-red-600 text-white shadow'
                    : 'bg-white/[0.06] text-slate-300 hover:bg-white/[0.1]'
                }`}
              >
                <YoutubeIcon className="w-3.5 h-3.5" />
                <span>YouTube Masterclasses ({YOUTUBE_MASTERCLASSES.length})</span>
              </button>
              <button
                onClick={() => setSelectedFormat('REELS')}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-semibold inline-flex items-center gap-1.5 transition-all ${
                  selectedFormat === 'REELS'
                    ? 'bg-gradient-to-r from-pink-600 to-purple-600 text-white shadow'
                    : 'bg-white/[0.06] text-slate-300 hover:bg-white/[0.1]'
                }`}
              >
                <InstagramIcon className="w-3.5 h-3.5" />
                <span>Instagram Reels &amp; Shorts ({INSTAGRAM_REELS_AND_SHORTS.length})</span>
              </button>
              <button
                onClick={() => setSelectedFormat('WRITTEN')}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-semibold inline-flex items-center gap-1.5 transition-all ${
                  selectedFormat === 'WRITTEN'
                    ? 'bg-emerald-600 text-white shadow'
                    : 'bg-white/[0.06] text-slate-300 hover:bg-white/[0.1]'
                }`}
              >
                <BookOpen className="w-3.5 h-3.5" />
                <span>Written Lab Guides ({tutorialsData.length})</span>
              </button>
            </div>

            {/* Language & Status Toggle */}
            <div className="flex flex-wrap items-center gap-2">
              {/* Language Selector */}
              <div className="flex items-center rounded-lg bg-black/60 p-1 border border-white/[0.06] text-xs">
                <button
                  onClick={() => setSelectedLanguage('ALL')}
                  className={`px-2.5 py-1 rounded-md transition-all ${
                    selectedLanguage === 'ALL' ? 'bg-white/20 text-white font-bold' : 'text-slate-400 hover:text-white'
                  }`}
                >
                  All Lang
                </button>
                <button
                  onClick={() => setSelectedLanguage('EN')}
                  className={`px-2.5 py-1 rounded-md transition-all ${
                    selectedLanguage === 'EN' ? 'bg-blue-500/20 text-blue-300 font-bold' : 'text-slate-400 hover:text-white'
                  }`}
                >
                  English 🇬🇧
                </button>
                <button
                  onClick={() => setSelectedLanguage('HI')}
                  className={`px-2.5 py-1 rounded-md transition-all ${
                    selectedLanguage === 'HI' ? 'bg-orange-500/20 text-orange-300 font-bold' : 'text-slate-400 hover:text-white'
                  }`}
                >
                  Hindi 🇮🇳
                </button>
              </div>

              {/* Status Selector */}
              <div className="flex items-center rounded-lg bg-black/60 p-1 border border-white/[0.06] text-xs">
                <button
                  onClick={() => setSelectedStatus('ALL')}
                  className={`px-2.5 py-1 rounded-md transition-all ${
                    selectedStatus === 'ALL' ? 'bg-white/20 text-white font-bold' : 'text-slate-400 hover:text-white'
                  }`}
                >
                  All Status
                </button>
                <button
                  onClick={() => setSelectedStatus('PUBLISHED')}
                  className={`px-2.5 py-1 rounded-md transition-all ${
                    selectedStatus === 'PUBLISHED' ? 'bg-emerald-500/20 text-emerald-300 font-bold' : 'text-slate-400 hover:text-white'
                  }`}
                >
                  ● Live
                </button>
                <button
                  onClick={() => setSelectedStatus('SCHEDULED')}
                  className={`px-2.5 py-1 rounded-md transition-all ${
                    selectedStatus === 'SCHEDULED' ? 'bg-amber-500/20 text-amber-300 font-bold' : 'text-slate-400 hover:text-white'
                  }`}
                >
                  🗓 Upcoming
                </button>
              </div>
            </div>
          </div>

          {/* Search Box */}
          <div className="mt-3 relative">
            <Search className="w-4 h-4 absolute left-3.5 top-1/2 -translate-y-1/2 text-slate-500" />
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="Search across videos, reels, protocols, concepts (e.g. Subsea Cable, DNS, BGP, TCP, Fiber)..."
              className="w-full rounded-xl bg-black/50 border border-white/[0.08] pl-10 pr-4 py-2 text-xs text-white placeholder-slate-500 focus:outline-none focus:border-emerald-500 transition-colors"
            />
          </div>
        </div>

        {/* SECTION 1: YouTube Masterclass Episodes */}
        {(selectedFormat === 'ALL' || selectedFormat === 'YOUTUBE') && (
          <section className="mb-20">
            <div className="flex items-center justify-between mb-8">
              <div>
                <div className="flex items-center gap-2">
                  <div className="w-3 h-3 rounded-full bg-red-500 animate-pulse" />
                  <span className="text-xs font-mono uppercase tracking-wider text-red-400">Long-Form Masterclasses</span>
                </div>
                <h2 className="text-2xl sm:text-3xl font-bold text-white tracking-tight mt-1">
                  YouTube Documentary Episodes
                </h2>
                <p className="text-xs sm:text-sm text-[#86868b] mt-1">
                  Full 4K deep-dive technical explainers in English &amp; Hindi with visual packet routing.
                </p>
              </div>
              <span className="text-xs font-mono text-slate-500">
                {filteredYouTube.length} Episodes
              </span>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
              {filteredYouTube.map((ep) => {
                const isPublished = ep.status === 'published';
                const hasEnLink = !!ep.links.en?.url;
                const hasHiLink = !!ep.links.hi?.url;

                return (
                  <div
                    key={ep.id}
                    className="rounded-[22px] bg-[#1d1d1f] border border-white/[0.08] hover:border-red-500/30 p-6 sm:p-7 flex flex-col justify-between transition-all duration-300 group"
                  >
                    <div>
                      {/* Top Badges */}
                      <div className="flex flex-wrap items-center justify-between gap-2 mb-4">
                        <div className="flex items-center gap-2">
                          <span className="rounded-md bg-white/[0.08] text-white text-[11px] font-bold px-2 py-0.5 font-mono">
                            EPISODE {ep.episode}
                          </span>
                          <span className="text-[11px] text-slate-400 font-medium">
                            {ep.category}
                          </span>
                        </div>
                        <div className="flex items-center gap-2">
                          <span className="flex items-center gap-1 text-[11px] text-slate-400">
                            <Clock className="w-3.5 h-3.5" />
                            {ep.duration}
                          </span>
                          {isPublished ? (
                            <span className="inline-flex items-center gap-1 rounded-full bg-emerald-500/15 border border-emerald-500/30 px-2.5 py-0.5 text-[10px] font-bold text-emerald-400 uppercase tracking-wide">
                              <span className="w-1.5 h-1.5 rounded-full bg-emerald-400" />
                              Live on YouTube
                            </span>
                          ) : (
                            <span className="inline-flex items-center gap-1 rounded-full bg-amber-500/15 border border-amber-500/30 px-2.5 py-0.5 text-[10px] font-bold text-amber-400 uppercase tracking-wide">
                              <Calendar className="w-3 h-3" />
                              Releasing {ep.scheduledDate}
                            </span>
                          )}
                        </div>
                      </div>

                      {/* Title depending on Language Filter */}
                      {selectedLanguage !== 'HI' && (
                        <h3 className="text-lg sm:text-xl font-bold text-white group-hover:text-red-400 transition-colors leading-snug">
                          {ep.title.en}
                        </h3>
                      )}
                      {selectedLanguage !== 'EN' && (
                        <h3 className={`font-semibold text-slate-200 leading-snug ${
                          selectedLanguage === 'HI' ? 'text-lg sm:text-xl font-bold text-white' : 'text-sm mt-1 text-slate-400'
                        }`}>
                          🇮🇳 {ep.title.hi}
                        </h3>
                      )}

                      {/* Subtitle / Summary */}
                      <p className="text-xs sm:text-[13px] text-[#a1a1a6] mt-3 leading-relaxed">
                        {selectedLanguage === 'HI' ? ep.summary.hi : ep.summary.en}
                      </p>

                      {/* Tags */}
                      <div className="flex flex-wrap gap-1.5 mt-4">
                        {ep.tags.map(t => (
                          <span key={t} className="rounded-md bg-white/[0.04] text-[10px] text-slate-400 px-2 py-0.5">
                            #{t}
                          </span>
                        ))}
                      </div>
                    </div>

                    {/* Action Bar */}
                    <div className="mt-6 pt-5 border-t border-white/[0.08] flex flex-wrap items-center justify-between gap-3">
                      {isPublished ? (
                        <div className="flex flex-wrap items-center gap-2 w-full sm:w-auto">
                          {hasEnLink && (
                            <a
                              href={ep.links.en.url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="inline-flex items-center gap-1.5 rounded-xl bg-red-600 px-4 py-2 text-xs font-semibold text-white hover:bg-red-500 transition-colors shadow-sm"
                            >
                              <Play className="w-3.5 h-3.5 fill-current" />
                              <span>English Edition 🇬🇧</span>
                            </a>
                          )}
                          {hasHiLink && (
                            <a
                              href={ep.links.hi.url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="inline-flex items-center gap-1.5 rounded-xl bg-white/[0.1] border border-white/[0.15] px-4 py-2 text-xs font-semibold text-white hover:bg-white/[0.2] transition-colors"
                            >
                              <Play className="w-3.5 h-3.5 fill-current text-red-400" />
                              <span>हिंदी संस्करण 🇮🇳</span>
                            </a>
                          )}
                        </div>
                      ) : (
                        <div className="flex items-center gap-2 text-xs text-amber-400/90 font-medium">
                          <Calendar className="w-3.5 h-3.5" />
                          <span>Premiere Scheduled: {ep.scheduledDate} ({ep.scheduledTime})</span>
                        </div>
                      )}

                      <span className="text-[11px] text-[#6e6e73] font-mono">
                        Episode {ep.episode} of 7
                      </span>
                    </div>
                  </div>
                );
              })}
            </div>
          </section>
        )}

        {/* SECTION 2: Instagram Reels & YouTube Shorts */}
        {(selectedFormat === 'ALL' || selectedFormat === 'REELS') && (
          <section className="mb-20">
            <div className="flex items-center justify-between mb-8">
              <div>
                <div className="flex items-center gap-2">
                  <div className="w-3 h-3 rounded-full bg-pink-500 animate-pulse" />
                  <span className="text-xs font-mono uppercase tracking-wider text-pink-400">Vertical Fast Concepts</span>
                </div>
                <h2 className="text-2xl sm:text-3xl font-bold text-white tracking-tight mt-1">
                  Instagram Reels &amp; YouTube Shorts
                </h2>
                <p className="text-xs sm:text-sm text-[#86868b] mt-1">
                  60-second high-density visual explainers designed for mobile study and fast revision.
                </p>
              </div>
              <span className="text-xs font-mono text-slate-500">
                {filteredReels.length} Reels
              </span>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
              {filteredReels.map((reel) => {
                const isPublished = reel.status === 'published';
                const hasIg = reel.platforms?.instagramEn || reel.platforms?.instagramHi;
                const hasYtShort = reel.platforms?.youtubeShortEn || reel.platforms?.youtubeShortHi;

                return (
                  <div
                    key={reel.id}
                    className="rounded-[22px] bg-[#1d1d1f] border border-white/[0.08] hover:border-pink-500/30 p-6 flex flex-col justify-between transition-all duration-300 group"
                  >
                    <div>
                      {/* Header Badge */}
                      <div className="flex items-center justify-between mb-3 text-[11px]">
                        <span className="font-mono text-slate-400">
                          EP {reel.episode} · {reel.category}
                        </span>
                        <div className="flex items-center gap-2">
                          <span className="text-slate-400 font-mono">{reel.duration}</span>
                          {isPublished ? (
                            <span className="rounded-full bg-emerald-500/15 border border-emerald-500/30 px-2 py-0.5 text-[10px] font-bold text-emerald-400">
                              ● Live
                            </span>
                          ) : (
                            <span className="rounded-full bg-amber-500/15 border border-amber-500/30 px-2 py-0.5 text-[10px] font-bold text-amber-400">
                              {reel.scheduledDate}
                            </span>
                          )}
                        </div>
                      </div>

                      {/* Title EN & HI */}
                      {selectedLanguage !== 'HI' && (
                        <h3 className="text-base font-bold text-white group-hover:text-pink-400 transition-colors leading-snug">
                          {reel.title.en}
                        </h3>
                      )}
                      {selectedLanguage !== 'EN' && (
                        <p className={`mt-1 text-xs text-slate-300 leading-snug ${
                          selectedLanguage === 'HI' ? 'text-base font-bold text-white' : ''
                        }`}>
                          🇮🇳 {reel.title.hi}
                        </p>
                      )}

                      {/* Highlight */}
                      <div className="mt-3 p-3 rounded-xl bg-black/40 border border-white/[0.04] text-[11px] text-slate-400 leading-relaxed">
                        <strong className="text-slate-300 block mb-0.5">Core Takeaway:</strong>
                        {reel.highlight}
                      </div>
                    </div>

                    {/* Bottom Links */}
                    <div className="mt-5 pt-4 border-t border-white/[0.06]">
                      <div className="flex flex-col gap-2">
                        {/* Instagram Link / Schedule Status */}
                        {reel.platforms?.isIgPublished ? (
                          <div className="flex items-center gap-2">
                            {reel.platforms.instagramEn && (
                              <a
                                href={reel.platforms.instagramEn}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex-1 inline-flex items-center justify-center gap-1.5 rounded-lg bg-gradient-to-r from-pink-600 to-purple-600 px-3 py-1.5 text-[11px] font-semibold text-white hover:opacity-90 transition-opacity shadow-sm"
                              >
                                <InstagramIcon className="w-3.5 h-3.5" />
                                <span>Reel (EN)</span>
                              </a>
                            )}
                            {reel.platforms.instagramHi && (
                              <a
                                href={reel.platforms.instagramHi}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex-1 inline-flex items-center justify-center gap-1.5 rounded-lg bg-white/[0.1] border border-white/[0.15] px-3 py-1.5 text-[11px] font-semibold text-white hover:bg-white/[0.2] transition-colors"
                              >
                                <InstagramIcon className="w-3.5 h-3.5 text-pink-400" />
                                <span>Reel (HI)</span>
                              </a>
                            )}
                          </div>
                        ) : (
                          <a
                            href="https://www.instagram.com/rtechlabofficial/"
                            target="_blank"
                            rel="noopener noreferrer"
                            className="w-full inline-flex items-center justify-between rounded-lg bg-pink-950/20 border border-pink-500/20 px-3 py-1.5 text-[11px] font-medium text-pink-300 hover:bg-pink-900/30 hover:border-pink-500/40 transition-colors"
                            title="Scheduled in Meta Business Suite for @rtechlabofficial"
                          >
                            <span className="flex items-center gap-1.5">
                              <InstagramIcon className="w-3.5 h-3.5 text-pink-400" />
                              <span>Instagram: Scheduled</span>
                            </span>
                            <span className="text-[10px] font-mono text-pink-400/90 font-semibold">
                              {reel.scheduledDate || reel.date} · {reel.platforms?.scheduledTime || '18:30 IST'} ↗
                            </span>
                          </a>
                        )}

                        {/* YouTube Short Links */}
                        {hasYtShort && (
                          <div className="flex items-center gap-2">
                            {reel.platforms.youtubeShortEn && (
                              <a
                                href={reel.platforms.youtubeShortEn}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex-1 inline-flex items-center justify-center gap-1.5 rounded-lg bg-red-600/20 border border-red-500/30 px-3 py-1.5 text-[11px] font-semibold text-red-300 hover:bg-red-600/30 transition-colors"
                              >
                                <YoutubeIcon className="w-3 h-3" />
                                <span>{reel.platforms.isYtPublished ? 'Short (EN)' : 'Premiere (EN)'}</span>
                              </a>
                            )}
                            {reel.platforms.youtubeShortHi && (
                              <a
                                href={reel.platforms.youtubeShortHi}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex-1 inline-flex items-center justify-center gap-1.5 rounded-lg bg-red-600/20 border border-red-500/30 px-3 py-1.5 text-[11px] font-semibold text-red-300 hover:bg-red-600/30 transition-colors"
                              >
                                <YoutubeIcon className="w-3 h-3" />
                                <span>{reel.platforms.isYtPublished ? 'Short (HI)' : 'Premiere (HI)'}</span>
                              </a>
                            )}
                          </div>
                        )}
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          </section>
        )}

        {/* SECTION 3: Written Engineering Lab Guides */}
        {(selectedFormat === 'ALL' || selectedFormat === 'WRITTEN') && (
          <section className="mb-20">
            <div className="flex items-center justify-between mb-8">
              <div>
                <div className="flex items-center gap-2">
                  <div className="w-3 h-3 rounded-full bg-emerald-500 animate-pulse" />
                  <span className="text-xs font-mono uppercase tracking-wider text-emerald-400">Interactive Reading</span>
                </div>
                <h2 className="text-2xl sm:text-3xl font-bold text-white tracking-tight mt-1">
                  Written Engineering Guides &amp; Lab Notes
                </h2>
                <p className="text-xs sm:text-sm text-[#86868b] mt-1">
                  16 production-grade written guides with connected interactive browser tools and command cheatsheets.
                </p>
              </div>
              <span className="text-xs font-mono text-slate-500">
                {filteredWritten.length} Guides
              </span>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {filteredWritten.map((tut) => (
                <div
                  key={tut.id}
                  className="rounded-[22px] bg-[#1d1d1f] border border-white/[0.08] hover:border-emerald-500/30 p-6 flex flex-col justify-between transition-all duration-300 group"
                >
                  <div>
                    {/* Header */}
                    <div className="flex items-center justify-between text-[11px] mb-3">
                      <span className="font-semibold text-emerald-400 uppercase tracking-wider">
                        {tut.badge || tut.category}
                      </span>
                      <span className="flex items-center gap-1 text-slate-400">
                        <Clock className="w-3.5 h-3.5" />
                        {tut.readTime}
                      </span>
                    </div>

                    {/* Title */}
                    <h3 className="text-base sm:text-lg font-bold text-white group-hover:text-emerald-400 transition-colors leading-snug">
                      {selectedLanguage === 'HI' && tut.titleHi ? tut.titleHi : tut.title}
                    </h3>

                    {/* Summary */}
                    <p className="text-xs text-[#a1a1a6] mt-2.5 line-clamp-3 leading-relaxed">
                      {selectedLanguage === 'HI' && tut.summaryHi ? tut.summaryHi : tut.summary}
                    </p>

                    {/* Topology / Environment Note */}
                    {tut.topology && (
                      <div className="mt-4 p-2.5 rounded-lg bg-black/40 border border-white/[0.04] text-[11px] text-slate-400 truncate">
                        💻 {tut.topology}
                      </div>
                    )}
                  </div>

                  {/* Actions & Connected Tool */}
                  <div className="mt-6 pt-4 border-t border-white/[0.08] flex items-center justify-between">
                    {tut.connectedTool ? (
                      <Link
                        to={tut.connectedTool}
                        className="text-[11px] font-semibold text-electric-400 hover:text-electric-300 transition-colors inline-flex items-center gap-1"
                      >
                        <span>Open Tool</span>
                        <ChevronRight className="w-3 h-3" />
                      </Link>
                    ) : (
                      <span className="text-[11px] text-slate-500">{tut.difficulty}</span>
                    )}

                    <div className="flex items-center gap-2">
                      <Link
                        to={`/tutorials/${tut.id}`}
                        className="rounded-lg bg-white/[0.08] px-3 py-1.5 text-xs font-semibold text-white hover:bg-white/[0.15] transition-colors"
                      >
                        Read EN 🇬🇧
                      </Link>
                      <Link
                        to={`/hi/tutorials/${tut.id}`}
                        className="rounded-lg bg-white/[0.08] px-3 py-1.5 text-xs font-semibold text-orange-300 hover:bg-white/[0.15] transition-colors"
                      >
                        पढ़ें 🇮🇳
                      </Link>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </section>
        )}
      </div>
    </div>
  );
}

export default TutorialsHubPage;
