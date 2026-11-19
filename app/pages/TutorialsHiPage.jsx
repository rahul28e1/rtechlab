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
  ChevronRight
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

export function TutorialsHiPage() {
  const [selectedFormat, setSelectedFormat] = useState('ALL'); // 'ALL' | 'YOUTUBE' | 'REELS' | 'WRITTEN'
  const [selectedStatus, setSelectedStatus] = useState('ALL'); // 'ALL' | 'PUBLISHED' | 'SCHEDULED'
  const [searchQuery, setSearchQuery] = useState('');

  const filteredYouTube = useMemo(() => {
    return YOUTUBE_MASTERCLASSES.filter(item => {
      const q = searchQuery.toLowerCase();
      const matchesSearch = !q ||
        item.title.hi.toLowerCase().includes(q) ||
        item.title.en.toLowerCase().includes(q) ||
        item.category.toLowerCase().includes(q);

      const matchesStatus =
        selectedStatus === 'ALL' ||
        (selectedStatus === 'PUBLISHED' && item.status === 'published') ||
        (selectedStatus === 'SCHEDULED' && item.status === 'scheduled');

      return matchesSearch && matchesStatus;
    });
  }, [searchQuery, selectedStatus]);

  const filteredReels = useMemo(() => {
    return INSTAGRAM_REELS_AND_SHORTS.filter(item => {
      const q = searchQuery.toLowerCase();
      const matchesSearch = !q ||
        item.title.hi.toLowerCase().includes(q) ||
        item.title.en.toLowerCase().includes(q) ||
        item.category.toLowerCase().includes(q) ||
        item.highlight.toLowerCase().includes(q);

      const matchesStatus =
        selectedStatus === 'ALL' ||
        (selectedStatus === 'PUBLISHED' && item.status === 'published') ||
        (selectedStatus === 'SCHEDULED' && item.status === 'scheduled');

      return matchesSearch && matchesStatus;
    });
  }, [searchQuery, selectedStatus]);

  const filteredWritten = useMemo(() => {
    return tutorialsData.filter(item => {
      const q = searchQuery.toLowerCase();
      return !q ||
        (item.titleHi && item.titleHi.toLowerCase().includes(q)) ||
        item.title.toLowerCase().includes(q) ||
        item.category.toLowerCase().includes(q);
    });
  }, [searchQuery]);

  return (
    <div className="min-h-screen bg-black text-[#EDEDED]">
      <div className="mx-auto max-w-7xl px-4 pt-12 sm:px-6 sm:pt-16 lg:px-8">
        {/* Navigation */}
        <nav className="mb-6 flex items-center gap-1.5 text-[11px] text-slate-500">
          <Link to="/" className="hover:text-white transition-colors">होम</Link>
          <span>/</span>
          <span className="text-slate-300">हिंदी ट्यूटोरियल्स और मीडिया</span>
          <span className="ml-auto">
            <Link to="/tutorials" className="text-electric-400 hover:text-electric-300 text-xs font-semibold">
              Switch to English 🇬🇧
            </Link>
          </span>
        </nav>

        {/* Hero */}
        <div className="flex flex-col lg:flex-row lg:items-end justify-between gap-8 pb-10 border-b border-white/[0.08]">
          <div className="max-w-3xl">
            <p className="text-[12px] font-mono uppercase tracking-[0.15em] text-emerald-400 mb-2">
              आरटेक लैब हिंदी लर्निंग हब
            </p>
            <h1 className="text-4xl sm:text-5xl md:text-6xl font-black tracking-tight text-white leading-[1.06]">
              यूट्यूब मास्टरक्लास, इंस्टाग्राम रील्स और लैब गाइड्स।
            </h1>
            <p className="mt-4 text-base sm:text-lg leading-relaxed text-[#a1a1a6]">
              कंप्यूटर नेटवर्किंग, सबमरीन केबल्स, CCNA और क्लाउड इंफ्रास्ट्रक्चर की पूरी शिक्षा अब सरल और तकनीकी हिंदी में।
            </p>
          </div>

          <div className="flex flex-wrap items-center gap-3 text-[12px]">
            <div className="rounded-xl border border-white/[0.08] bg-[#1d1d1f] px-4 py-2.5">
              <span className="text-[#86868b] block text-[11px]">यूट्यूब वीडियो</span>
              <span className="text-white font-bold text-lg">7 मास्टरक्लास</span>
            </div>
            <div className="rounded-xl border border-white/[0.08] bg-[#1d1d1f] px-4 py-2.5">
              <span className="text-[#86868b] block text-[11px]">इंस्टाग्राम रील्स</span>
              <span className="text-white font-bold text-lg">11 रील्स और शॉर्ट्स</span>
            </div>
            <div className="rounded-xl border border-white/[0.08] bg-[#1d1d1f] px-4 py-2.5">
              <span className="text-[#86868b] block text-[11px]">लिखित गाइड्स</span>
              <span className="text-white font-bold text-lg">16 लैब नोट्स</span>
            </div>
          </div>
        </div>

        {/* Official Channels */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 my-10">
          <div className="rounded-[24px] border border-red-500/20 bg-gradient-to-br from-[#1c1214] via-[#161214] to-[#0f0c0d] p-6 sm:p-8 relative overflow-hidden">
            <div className="relative z-10 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-6">
              <div className="flex items-center gap-4">
                <div className="w-14 h-14 rounded-2xl bg-red-600 flex items-center justify-center text-white shadow-lg shadow-red-600/30 flex-shrink-0">
                  <YoutubeIcon className="w-8 h-8" />
                </div>
                <div>
                  <h2 className="text-xl font-bold text-white tracking-tight">RTechLab यूट्यूब चैनल</h2>
                  <p className="text-xs text-slate-400 mt-1">
                    हिंदी मल्टी-लैंग्वेज ऑडियो · पैकेट ट्रेसिंग · 4K सबसी केबल्स डॉक्यूमेंट्री
                  </p>
                </div>
              </div>

              <a
                href="https://www.youtube.com/@RTechLabOfficial"
                target="_blank"
                rel="noopener noreferrer"
                className="w-full sm:w-auto inline-flex items-center justify-center gap-2 rounded-xl bg-red-600 px-5 py-3 text-sm font-semibold text-white hover:bg-red-500 transition-colors"
              >
                <span>सब्सक्राइब करें @RTechLabOfficial</span>
                <ArrowUpRight className="w-4 h-4" />
              </a>
            </div>
          </div>

          <div className="rounded-[24px] border border-pink-500/20 bg-gradient-to-br from-[#1c1218] via-[#161218] to-[#0f0c0e] p-6 sm:p-8 relative overflow-hidden">
            <div className="relative z-10 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-6">
              <div className="flex items-center gap-4">
                <div className="w-14 h-14 rounded-2xl bg-gradient-to-tr from-yellow-500 via-pink-500 to-purple-600 flex items-center justify-center text-white shadow-lg shadow-pink-500/30 flex-shrink-0">
                  <InstagramIcon className="w-7 h-7" />
                </div>
                <div>
                  <h2 className="text-xl font-bold text-white tracking-tight">RTechLab इंस्टाग्राम रील्स</h2>
                  <p className="text-xs text-slate-400 mt-1">
                    डेली 60 सेकंड टेक रील्स · चीटशीट्स · Linux कमांड्स ट्रिक्स
                  </p>
                </div>
              </div>

              <a
                href="https://www.instagram.com/rtechlabofficial/"
                target="_blank"
                rel="noopener noreferrer"
                className="w-full sm:w-auto inline-flex items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-pink-600 to-purple-600 px-5 py-3 text-sm font-semibold text-white hover:opacity-90 transition-opacity"
              >
                <span>फॉलो करें @rtechlabofficial</span>
                <ArrowUpRight className="w-4 h-4" />
              </a>
            </div>
          </div>
        </div>

        {/* Toolbar */}
        <div className="sticky top-16 z-30 mb-10 rounded-2xl border border-white/[0.08] bg-[#121316]/95 backdrop-blur-xl p-4 shadow-xl">
          <div className="flex flex-col md:flex-row items-stretch md:items-center justify-between gap-4">
            <div className="flex flex-wrap items-center gap-1.5">
              <button
                onClick={() => setSelectedFormat('ALL')}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-semibold ${
                  selectedFormat === 'ALL' ? 'bg-white text-black' : 'bg-white/[0.06] text-slate-300'
                }`}
              >
                सभी सामग्री ({YOUTUBE_MASTERCLASSES.length + INSTAGRAM_REELS_AND_SHORTS.length + tutorialsData.length})
              </button>
              <button
                onClick={() => setSelectedFormat('YOUTUBE')}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-semibold inline-flex items-center gap-1.5 ${
                  selectedFormat === 'YOUTUBE' ? 'bg-red-600 text-white' : 'bg-white/[0.06] text-slate-300'
                }`}
              >
                <YoutubeIcon className="w-3.5 h-3.5" />
                <span>यूट्यूब मास्टरक्लास ({YOUTUBE_MASTERCLASSES.length})</span>
              </button>
              <button
                onClick={() => setSelectedFormat('REELS')}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-semibold inline-flex items-center gap-1.5 ${
                  selectedFormat === 'REELS' ? 'bg-gradient-to-r from-pink-600 to-purple-600 text-white' : 'bg-white/[0.06] text-slate-300'
                }`}
              >
                <InstagramIcon className="w-3.5 h-3.5" />
                <span>रील्स और शॉर्ट्स ({INSTAGRAM_REELS_AND_SHORTS.length})</span>
              </button>
              <button
                onClick={() => setSelectedFormat('WRITTEN')}
                className={`px-3.5 py-1.5 rounded-lg text-xs font-semibold inline-flex items-center gap-1.5 ${
                  selectedFormat === 'WRITTEN' ? 'bg-emerald-600 text-white' : 'bg-white/[0.06] text-slate-300'
                }`}
              >
                <BookOpen className="w-3.5 h-3.5" />
                <span>लिखित गाइड्स ({tutorialsData.length})</span>
              </button>
            </div>

            <div className="flex items-center rounded-lg bg-black/60 p-1 border border-white/[0.06] text-xs">
              <button
                onClick={() => setSelectedStatus('ALL')}
                className={`px-2.5 py-1 rounded-md ${selectedStatus === 'ALL' ? 'bg-white/20 text-white font-bold' : 'text-slate-400'}`}
              >
                सभी स्टेटस
              </button>
              <button
                onClick={() => setSelectedStatus('PUBLISHED')}
                className={`px-2.5 py-1 rounded-md ${selectedStatus === 'PUBLISHED' ? 'bg-emerald-500/20 text-emerald-300 font-bold' : 'text-slate-400'}`}
              >
                ● लाइव
              </button>
              <button
                onClick={() => setSelectedStatus('SCHEDULED')}
                className={`px-2.5 py-1 rounded-md ${selectedStatus === 'SCHEDULED' ? 'bg-amber-500/20 text-amber-300 font-bold' : 'text-slate-400'}`}
              >
                🗓 आने वाले
              </button>
            </div>
          </div>

          <div className="mt-3 relative">
            <Search className="w-4 h-4 absolute left-3.5 top-1/2 -translate-y-1/2 text-slate-500" />
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="खोजें: सबमरीन केबल, DNS, BGP, TCP, फाइबर, पैकेट्स..."
              className="w-full rounded-xl bg-black/50 border border-white/[0.08] pl-10 pr-4 py-2 text-xs text-white placeholder-slate-500 focus:outline-none focus:border-emerald-500 transition-colors"
            />
          </div>
        </div>

        {/* Section 1: YouTube */}
        {(selectedFormat === 'ALL' || selectedFormat === 'YOUTUBE') && (
          <section className="mb-20">
            <div className="flex items-center justify-between mb-8">
              <div>
                <span className="text-xs font-mono uppercase tracking-wider text-red-400">लॉन्ग-फॉर्म वीडियो</span>
                <h2 className="text-2xl sm:text-3xl font-bold text-white tracking-tight mt-1">
                  यूट्यूब डॉक्यूमेंट्री और मास्टरक्लास
                </h2>
              </div>
              <span className="text-xs font-mono text-slate-500">{filteredYouTube.length} एपिसोड्स</span>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
              {filteredYouTube.map((ep) => {
                const isPublished = ep.status === 'published';
                const hasHiLink = !!ep.links.hi?.url;

                return (
                  <div
                    key={ep.id}
                    className="rounded-[22px] bg-[#1d1d1f] border border-white/[0.08] hover:border-red-500/30 p-6 sm:p-7 flex flex-col justify-between transition-all group"
                  >
                    <div>
                      <div className="flex items-center justify-between gap-2 mb-4">
                        <span className="rounded-md bg-white/[0.08] text-white text-[11px] font-bold px-2 py-0.5 font-mono">
                          एपिसोड {ep.episode}
                        </span>
                        <div className="flex items-center gap-2">
                          <span className="flex items-center gap-1 text-[11px] text-slate-400">
                            <Clock className="w-3.5 h-3.5" />
                            {ep.duration}
                          </span>
                          {isPublished ? (
                            <span className="rounded-full bg-emerald-500/15 border border-emerald-500/30 px-2.5 py-0.5 text-[10px] font-bold text-emerald-400">
                              ● यूट्यूब पर लाइव
                            </span>
                          ) : (
                            <span className="rounded-full bg-amber-500/15 border border-amber-500/30 px-2.5 py-0.5 text-[10px] font-bold text-amber-400">
                              रिलिज़ डेट: {ep.scheduledDate}
                            </span>
                          )}
                        </div>
                      </div>

                      <h3 className="text-lg sm:text-xl font-bold text-white group-hover:text-red-400 transition-colors leading-snug">
                        {ep.title.hi}
                      </h3>
                      <p className="text-xs text-slate-400 mt-1">{ep.title.en}</p>
                      <p className="text-xs sm:text-[13px] text-[#a1a1a6] mt-3 leading-relaxed">
                        {ep.summary.hi}
                      </p>
                    </div>

                    <div className="mt-6 pt-5 border-t border-white/[0.08] flex items-center justify-between">
                      {isPublished && hasHiLink ? (
                        <a
                          href={ep.links.hi.url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="inline-flex items-center gap-1.5 rounded-xl bg-red-600 px-4 py-2 text-xs font-semibold text-white hover:bg-red-500 transition-colors shadow-sm"
                        >
                          <Play className="w-3.5 h-3.5 fill-current" />
                          <span>हिंदी में देखें (YouTube) ↗</span>
                        </a>
                      ) : (
                        <span className="text-xs text-amber-400 font-medium">
                          प्रीमियर डेट: {ep.scheduledDate} ({ep.scheduledTime})
                        </span>
                      )}
                      <span className="text-[11px] text-[#6e6e73] font-mono">
                        एपिसोड {ep.episode} / 7
                      </span>
                    </div>
                  </div>
                );
              })}
            </div>
          </section>
        )}

        {/* Section 2: Reels */}
        {(selectedFormat === 'ALL' || selectedFormat === 'REELS') && (
          <section className="mb-20">
            <div className="flex items-center justify-between mb-8">
              <div>
                <span className="text-xs font-mono uppercase tracking-wider text-pink-400">वर्टिकल फास्ट रील्स</span>
                <h2 className="text-2xl sm:text-3xl font-bold text-white tracking-tight mt-1">
                  इंस्टाग्राम रील्स और शॉर्ट्स
                </h2>
              </div>
              <span className="text-xs font-mono text-slate-500">{filteredReels.length} रील्स</span>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
              {filteredReels.map((reel) => {
                const isPublished = reel.status === 'published';
                const igUrl = reel.platforms?.instagramHi || reel.platforms?.instagramEn;
                const ytUrl = reel.platforms?.youtubeShortHi || reel.platforms?.youtubeShortEn;

                return (
                  <div
                    key={reel.id}
                    className="rounded-[22px] bg-[#1d1d1f] border border-white/[0.08] hover:border-pink-500/30 p-6 flex flex-col justify-between transition-all group"
                  >
                    <div>
                      <div className="flex items-center justify-between mb-3 text-[11px]">
                        <span className="font-mono text-slate-400">एपिसोड {reel.episode}</span>
                        <div className="flex items-center gap-2">
                          <span className="text-slate-400 font-mono">{reel.duration}</span>
                          {isPublished ? (
                            <span className="rounded-full bg-emerald-500/15 border border-emerald-500/30 px-2 py-0.5 text-[10px] font-bold text-emerald-400">
                              ● लाइव
                            </span>
                          ) : (
                            <span className="rounded-full bg-amber-500/15 border border-amber-500/30 px-2 py-0.5 text-[10px] font-bold text-amber-400">
                              {reel.scheduledDate}
                            </span>
                          )}
                        </div>
                      </div>

                      <h3 className="text-base font-bold text-white group-hover:text-pink-400 transition-colors leading-snug">
                        {reel.title.hi}
                      </h3>
                      <p className="mt-1 text-xs text-slate-400">{reel.title.en}</p>

                      <div className="mt-3 p-3 rounded-xl bg-black/40 border border-white/[0.04] text-[11px] text-slate-400">
                        <strong className="text-slate-300 block mb-0.5">मुख्य सीख:</strong>
                        {reel.highlight}
                      </div>
                    </div>

                    <div className="mt-5 pt-4 border-t border-white/[0.06]">
                      <div className="flex flex-col gap-2">
                        {/* Instagram Link / Schedule Status */}
                        {reel.platforms?.isIgPublished ? (
                          <div className="flex items-center gap-2">
                            {reel.platforms.instagramHi && (
                              <a
                                href={reel.platforms.instagramHi}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex-1 inline-flex items-center justify-center gap-1.5 rounded-lg bg-gradient-to-r from-pink-600 to-purple-600 px-3 py-1.5 text-[11px] font-semibold text-white hover:opacity-90 transition-opacity shadow-sm"
                              >
                                <InstagramIcon className="w-3.5 h-3.5" />
                                <span>रील (हिंदी)</span>
                              </a>
                            )}
                            {reel.platforms.instagramEn && (
                              <a
                                href={reel.platforms.instagramEn}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex-1 inline-flex items-center justify-center gap-1.5 rounded-lg bg-white/[0.1] border border-white/[0.15] px-3 py-1.5 text-[11px] font-semibold text-white hover:bg-white/[0.2] transition-colors"
                              >
                                <InstagramIcon className="w-3.5 h-3.5 text-pink-400" />
                                <span>रील (EN)</span>
                              </a>
                            )}
                          </div>
                        ) : (
                          <a
                            href="https://www.instagram.com/rtechlabofficial/"
                            target="_blank"
                            rel="noopener noreferrer"
                            className="w-full inline-flex items-center justify-between rounded-lg bg-pink-950/20 border border-pink-500/20 px-3 py-1.5 text-[11px] font-medium text-pink-300 hover:bg-pink-900/30 hover:border-pink-500/40 transition-colors"
                            title="मेटा बिज़नेस सुइट में शेड्यूल्ड @rtechlabofficial"
                          >
                            <span className="flex items-center gap-1.5">
                              <InstagramIcon className="w-3.5 h-3.5 text-pink-400" />
                              <span>इंस्टाग्राम पर शेड्यूल्ड</span>
                            </span>
                            <span className="text-[10px] font-mono text-pink-400/90 font-semibold">
                              {reel.scheduledDate || reel.date} · {reel.platforms?.scheduledTime || '18:30 IST'} ↗
                            </span>
                          </a>
                        )}

                        {/* YouTube Short Links */}
                        {(reel.platforms?.youtubeShortHi || reel.platforms?.youtubeShortEn) && (
                          <div className="flex items-center gap-2">
                            {reel.platforms.youtubeShortHi && (
                              <a
                                href={reel.platforms.youtubeShortHi}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex-1 inline-flex items-center justify-center gap-1.5 rounded-lg bg-red-600/20 border border-red-500/30 px-3 py-1.5 text-[11px] font-semibold text-red-300 hover:bg-red-600/30 transition-colors"
                              >
                                <YoutubeIcon className="w-3 h-3" />
                                <span>{reel.platforms.isYtPublished ? 'शॉर्ट (हिंदी)' : 'प्रीमियर (हिंदी)'}</span>
                              </a>
                            )}
                            {reel.platforms.youtubeShortEn && (
                              <a
                                href={reel.platforms.youtubeShortEn}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex-1 inline-flex items-center justify-center gap-1.5 rounded-lg bg-white/[0.06] border border-white/[0.1] px-3 py-1.5 text-[11px] font-semibold text-slate-300 hover:bg-white/[0.1] transition-colors"
                              >
                                <YoutubeIcon className="w-3 h-3 text-red-400" />
                                <span>{reel.platforms.isYtPublished ? 'Short (EN)' : 'Premiere (EN)'}</span>
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

        {/* Section 3: Written */}
        {(selectedFormat === 'ALL' || selectedFormat === 'WRITTEN') && (
          <section className="mb-20">
            <div className="flex items-center justify-between mb-8">
              <div>
                <span className="text-xs font-mono uppercase tracking-wider text-emerald-400">लिखित लैब गाइड्स</span>
                <h2 className="text-2xl sm:text-3xl font-bold text-white tracking-tight mt-1">
                  विस्तृत इंजीनियरिंग गाइड्स (हिंदी)
                </h2>
              </div>
              <span className="text-xs font-mono text-slate-500">{filteredWritten.length} गाइड्स</span>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {filteredWritten.map((tut) => (
                <div
                  key={tut.id}
                  className="rounded-[22px] bg-[#1d1d1f] border border-white/[0.08] hover:border-emerald-500/30 p-6 flex flex-col justify-between transition-all group"
                >
                  <div>
                    <div className="flex items-center justify-between text-[11px] mb-3">
                      <span className="font-semibold text-emerald-400 uppercase tracking-wider">
                        {tut.badge || tut.category}
                      </span>
                      <span className="flex items-center gap-1 text-slate-400">
                        <Clock className="w-3.5 h-3.5" />
                        {tut.readTime}
                      </span>
                    </div>

                    <h3 className="text-base sm:text-lg font-bold text-white group-hover:text-emerald-400 transition-colors leading-snug">
                      {tut.titleHi || tut.title}
                    </h3>
                    <p className="text-xs text-[#a1a1a6] mt-2.5 line-clamp-3 leading-relaxed">
                      {tut.summaryHi || tut.summary}
                    </p>
                  </div>

                  <div className="mt-6 pt-4 border-t border-white/[0.08] flex items-center justify-between">
                    {tut.connectedTool ? (
                      <Link
                        to={tut.connectedTool}
                        className="text-[11px] font-semibold text-electric-400 hover:text-electric-300 inline-flex items-center gap-1"
                      >
                        <span>टूल खोलें</span>
                        <ChevronRight className="w-3 h-3" />
                      </Link>
                    ) : (
                      <span className="text-[11px] text-slate-500">{tut.difficultyHi || tut.difficulty}</span>
                    )}

                    <Link
                      to={`/hi/tutorials/${tut.id}`}
                      className="rounded-lg bg-emerald-500/20 border border-emerald-500/30 px-3.5 py-1.5 text-xs font-semibold text-emerald-300 hover:bg-emerald-500/30 transition-colors"
                    >
                      गाइड पढ़ें 🇮🇳
                    </Link>
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

export default TutorialsHiPage;
