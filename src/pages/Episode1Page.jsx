import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { 
  Play, 
  Volume2, 
  Globe2, 
  Clock, 
  Layers, 
  ExternalLink, 
  CheckCircle2, 
  Share2, 
  FileText, 
  Terminal, 
  ArrowRight, 
  Sparkles, 
  ShieldCheck, 
  Wifi, 
  Server, 
  Compass, 
  Radio
} from 'lucide-react';
import { SEOHead } from '../components/SEOHead';
import { useLanguage } from '../context/LanguageContext';
import { VIDEO_CURRICULUM } from '../data/videoCurriculum';

export const Episode1Page = () => {
  const { language } = useLanguage();
  const [activeLang, setActiveLang] = useState(language === 'hi' ? 'hi' : 'en');
  const [activeAct, setActiveAct] = useState(1);
  const [copiedLink, setCopiedLink] = useState(false);

  const epData = VIDEO_CURRICULUM[0];
  const currentYouTubeId = activeLang === 'hi' 
    ? (epData.youTubeIds?.hi || epData.canonicalYouTubeId) 
    : (epData.youTubeIds?.en || epData.canonicalYouTubeId);
  const isPendingUpload = !currentYouTubeId || currentYouTubeId === 'PENDING_STUDIO_UPLOAD';

  const handleShare = () => {
    navigator.clipboard.writeText(window.location.href);
    setCopiedLink(true);
    setTimeout(() => setCopiedLink(false), 2500);
  };

  const currentTranscript = activeLang === 'hi' ? epData.transcripts.hi : epData.transcripts.en;
  const currentTitle = activeLang === 'hi' ? epData.title.hi : epData.title.en;
  const currentSubtitle = activeLang === 'hi' ? epData.subtitle.hi : epData.subtitle.en;
  const currentSummary = activeLang === 'hi' ? epData.summary.hi : epData.summary.en;
  const currentTakeaway = activeLang === 'hi' ? epData.keyTakeaway.hi : epData.keyTakeaway.en;

  const videoSchema = {
    "@context": "https://schema.org",
    "@type": "VideoObject",
    "name": currentTitle,
    "description": currentSummary,
    "thumbnailUrl": [
      "https://rtechlab.com/brand/rtechlab_ep01_thumbnail_en_concept_a.png"
    ],
    "uploadDate": "2026-11-11T00:00:00+05:30",
    "duration": "PT6M21S",
    "contentUrl": "https://rtechlab.com/episodes/how-the-internet-works",
    "embedUrl": isPendingUpload 
      ? "https://rtechlab.com/episodes/how-the-internet-works" 
      : `https://www.youtube.com/embed/${currentYouTubeId}`,
    "publisher": {
      "@type": "Organization",
      "name": "RTechLab",
      "logo": {
        "@type": "ImageObject",
        "url": "https://rtechlab.com/logo-icon.svg"
      }
    }
  };

  return (
    <div className="py-10 px-4 sm:px-6 lg:px-8 max-w-7xl mx-auto space-y-12">
      <SEOHead
        title={`${currentTitle} | RTechLab Engineering Series`}
        description={currentSummary}
        canonicalPath="/episodes/how-the-internet-works"
        lang={activeLang}
        jsonLd={videoSchema}
      />

      {/* 1. Header & Breadcrumbs */}
      <div className="space-y-4">
        <nav className="flex items-center gap-2 text-xs text-slate-400 font-mono">
          <Link to="/" className="hover:text-white transition">Home</Link>
          <span>/</span>
          <span className="text-cyan-400">Episodes</span>
          <span>/</span>
          <span className="text-white font-semibold truncate">EP-01: How the Internet Works</span>
        </nav>

        <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-4 border-b border-slate-800 pb-6">
          <div className="space-y-2">
            <div className="flex flex-wrap items-center gap-2">
              <span className="px-2.5 py-0.5 rounded-full text-xs font-mono font-bold bg-cyan-950/70 border border-cyan-800/60 text-cyan-300 uppercase tracking-wider">
                Episode 01 • Master Edition
              </span>
              <span className="px-2.5 py-0.5 rounded-full text-xs font-mono font-semibold bg-navy-900 border border-slate-800 text-slate-300 flex items-center gap-1.5">
                <Clock className="w-3 h-3 text-electric-400" />
                {epData.durationFormatted} ({epData.durationSeconds}s)
              </span>
              <span className="px-2.5 py-0.5 rounded-full text-xs font-mono font-semibold bg-emerald-950/40 border border-emerald-800/50 text-emerald-400 flex items-center gap-1">
                <CheckCircle2 className="w-3 h-3" />
                1080p60 FHD
              </span>
              <span className="px-2.5 py-0.5 rounded-full text-xs font-mono font-semibold bg-purple-950/40 border border-purple-800/50 text-purple-300 flex items-center gap-1">
                <Volume2 className="w-3 h-3" />
                Multi-Language Audio (EN + HI)
              </span>
            </div>

            <h1 className="text-2xl sm:text-4xl lg:text-5xl font-black text-white tracking-tight leading-tight">
              {currentTitle}
            </h1>
            <p className="text-sm sm:text-base text-slate-300 max-w-3xl leading-relaxed">
              {currentSubtitle}
            </p>
          </div>

          {/* Language Switcher Pill */}
          <div className="flex items-center gap-3 self-start lg:self-center">
            <div className="bg-navy-900/90 border border-slate-800 p-1 rounded-2xl flex items-center shadow-inner">
              <button
                onClick={() => setActiveLang('en')}
                className={`px-3.5 py-1.5 rounded-xl text-xs font-semibold font-mono transition flex items-center gap-1.5 ${
                  activeLang === 'en'
                    ? 'bg-electric-600 text-white shadow-md shadow-electric-600/30'
                    : 'text-slate-400 hover:text-white'
                }`}
              >
                <Globe2 className="w-3.5 h-3.5" />
                <span>English</span>
              </button>
              <button
                onClick={() => setActiveLang('hi')}
                className={`px-3.5 py-1.5 rounded-xl text-xs font-semibold font-mono transition flex items-center gap-1.5 ${
                  activeLang === 'hi'
                    ? 'bg-cyan-600 text-white shadow-md shadow-cyan-600/30'
                    : 'text-slate-400 hover:text-white'
                }`}
              >
                <span>हिन्दी (Hindi)</span>
              </button>
            </div>

            <button
              onClick={handleShare}
              className="p-2.5 rounded-xl bg-navy-900 hover:bg-slate-800 border border-slate-800 text-slate-300 hover:text-white transition flex items-center gap-1.5 text-xs font-medium cursor-pointer"
              title="Copy Episode Link"
            >
              <Share2 className="w-4 h-4" />
              <span className="hidden sm:inline">{copiedLink ? 'Copied!' : 'Share'}</span>
            </button>
          </div>
        </div>
      </div>

      {/* 2. Video Player & Telemetry Container */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
        {/* Video Screen / Player Container (8 cols) */}
        <div className="lg:col-span-8 space-y-4">
          <div className="relative aspect-video w-full rounded-2xl overflow-hidden bg-slate-950 border border-slate-800 shadow-2xl shadow-cyan-950/20 group">
            {!isPendingUpload ? (
              <iframe
                src={`https://www.youtube.com/embed/${currentYouTubeId}?autoplay=0&rel=0`}
                title={currentTitle}
                className="w-full h-full border-0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowFullScreen
              />
            ) : (
              <div className="relative w-full h-full flex flex-col items-center justify-center p-6 text-center bg-gradient-to-br from-navy-950 via-slate-900 to-navy-950">
                {/* Background Tech Wireframe Pattern */}
                <div className="absolute inset-0 bg-[radial-gradient(#06B6D4_1px,transparent_1px)] [background-size:24px_24px] opacity-15 pointer-events-none" />
                
                {/* Center Badge & Title */}
                <div className="relative z-10 space-y-4 max-w-lg">
                  <div className="w-16 h-16 sm:w-20 sm:h-20 mx-auto rounded-full bg-electric-600/20 border border-electric-500/40 flex items-center justify-center text-cyan-400 shadow-lg shadow-cyan-500/20">
                    <Play className="w-8 h-8 sm:w-10 sm:h-10 fill-cyan-400 translate-x-0.5" />
                  </div>

                  <div className="space-y-1">
                    <span className="text-xs font-mono font-bold uppercase tracking-wider text-cyan-400 px-3 py-1 rounded-full bg-cyan-950/60 border border-cyan-800/50">
                      Approved V2 Production Master
                    </span>
                    <h3 className="text-xl sm:text-2xl font-black text-white pt-2">
                      {currentTitle}
                    </h3>
                    <p className="text-xs sm:text-sm text-slate-400">
                      Duration: 6m 21s • 10 Acts • Frame-Synced English & Hindi Masters
                    </p>
                  </div>

                  <div className="pt-2 flex flex-wrap items-center justify-center gap-2 text-[11px] font-mono text-slate-400">
                    <span className="px-2.5 py-1 rounded-md bg-slate-800/80 border border-slate-700">
                      True Peak: -3.65 dBFS (Clean Headroom)
                    </span>
                    <span className="px-2.5 py-1 rounded-md bg-slate-800/80 border border-slate-700">
                      Optical Floor: 131.4 ms
                    </span>
                    <span className="px-2.5 py-1 rounded-md bg-slate-800/80 border border-slate-700">
                      Modeled Carrier: 175.0 ms
                    </span>
                  </div>
                </div>

                {/* Subtitle Bar Overlay at Bottom */}
                <div className="absolute bottom-4 left-4 right-4 p-3 rounded-xl bg-navy-950/90 border border-slate-800 backdrop-blur-md flex items-center justify-between text-xs font-mono">
                  <span className="text-cyan-400 flex items-center gap-1.5">
                    <Volume2 className="w-4 h-4 text-electric-400" />
                    Bilingual Master Ready
                  </span>
                  <span className="text-slate-400">
                    Watch on YouTube: Launching Shortly
                  </span>
                </div>
              </div>
            )}
          </div>

          {/* Episode Summary Card */}
          <div className="p-6 rounded-2xl bg-navy-900/70 border border-slate-800 space-y-4">
            <h3 className="text-base font-bold text-white flex items-center gap-2">
              <Sparkles className="w-4 h-4 text-cyan-400" />
              <span>{activeLang === 'hi' ? 'डॉक्यूमेंट्री सारांश' : 'Documentary Overview'}</span>
            </h3>
            <p className="text-sm text-slate-300 leading-relaxed">
              {currentSummary}
            </p>

            <div className="p-4 rounded-xl bg-navy-950/80 border border-cyan-900/40 space-y-1.5">
              <span className="text-xs font-mono font-bold text-cyan-400 uppercase tracking-wider flex items-center gap-1.5">
                <CheckCircle2 className="w-3.5 h-3.5" />
                {activeLang === 'hi' ? 'मुख्य तकनीकी निष्कर्ष' : 'Core Engineering Takeaway'}
              </span>
              <p className="text-xs sm:text-sm text-slate-300 leading-relaxed font-sans">
                {currentTakeaway}
              </p>
            </div>
          </div>
        </div>

        {/* Real-World Telemetry HUD & Partner Badge (4 cols) */}
        <div className="lg:col-span-4 space-y-4">
          <div className="p-5 rounded-2xl bg-navy-900/80 border border-slate-800 space-y-4">
            <div className="flex items-center justify-between border-b border-slate-800 pb-3">
              <span className="text-xs font-mono font-bold text-slate-300 uppercase tracking-wider flex items-center gap-1.5">
                <Terminal className="w-3.5 h-3.5 text-cyan-400" />
                Physics & Latency Telemetry
              </span>
              <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-cyan-950/60 text-cyan-400 border border-cyan-800/40">
                Verified
              </span>
            </div>

            <div className="space-y-3 font-mono text-xs">
              <div className="p-3 rounded-xl bg-navy-950/70 border border-slate-800 flex justify-between items-center">
                <span className="text-slate-400">Illustrative Modeled RTT:</span>
                <span className="text-cyan-400 font-bold text-sm">~175.0 ms</span>
              </div>
              <div className="p-3 rounded-xl bg-navy-950/70 border border-slate-800 flex justify-between items-center">
                <span className="text-slate-400">Theoretical Optical Floor:</span>
                <span className="text-amber-400 font-bold text-sm">131.4 ms</span>
              </div>
              <div className="p-3 rounded-xl bg-navy-950/70 border border-slate-800 flex justify-between items-center">
                <span className="text-slate-400">Subsea Fiber Distance:</span>
                <span className="text-white font-bold">13,420 km (one-way)</span>
              </div>
              <div className="p-3 rounded-xl bg-navy-950/70 border border-slate-800 flex justify-between items-center">
                <span className="text-slate-400">Speed in Silica Glass (n≈1.47):</span>
                <span className="text-emerald-400 font-bold">204,200 km/s</span>
              </div>
              <div className="p-3 rounded-xl bg-navy-950/70 border border-slate-800 flex justify-between items-center">
                <span className="text-slate-400">Submarine Traffic Share:</span>
                <span className="text-electric-400 font-bold">99% Global</span>
              </div>
            </div>

            <p className="text-[11px] text-slate-400 leading-relaxed font-sans pt-1">
              *Note: 175 ms represents an illustrative modeled carrier round trip under real routing conditions, respecting the immutable 131.4 ms optical floor dictated by the speed of light in silica fiber.
            </p>
          </div>

          {/* IANT Computer Education Palanpur Collaboration Card */}
          <div className="p-5 rounded-2xl bg-gradient-to-br from-navy-900 to-navy-950 border border-cyan-900/50 space-y-3 shadow-lg">
            <div className="flex items-center gap-2 text-cyan-400 text-xs font-mono font-bold uppercase tracking-wider">
              <ShieldCheck className="w-4 h-4 text-cyan-400" />
              <span>{activeLang === 'hi' ? 'शैक्षणिक साझेदारी' : 'Educational Collaboration'}</span>
            </div>
            <h4 className="text-sm font-bold text-white leading-snug">
              IANT Computer Education, Palanpur
            </h4>
            <p className="text-xs text-slate-400 leading-relaxed">
              {activeLang === 'hi'
                ? 'यह वीडियो RTechLab और IANT पालनपुर (Institute of Advanced Network Technology) के संयुक्त प्रयास से तैयार किया गया है, जिसका उद्देश्य युवाओं को प्रैक्टिकल नेटवर्किंग में सशक्त बनाना है।'
                : 'Produced in collaboration with IANT Computer Education, Palanpur — training the next generation of network architects and cyber defense engineers with hands-on lab blueprints.'}
            </p>
            <a
              href="https://www.iantindia.com"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-1.5 text-xs font-semibold text-cyan-400 hover:text-cyan-300 font-mono transition pt-1"
            >
              <span>Visit IANT India</span>
              <ExternalLink className="w-3.5 h-3.5" />
            </a>
          </div>
        </div>
      </div>

      {/* 3. Interactive 10-Act Timeline */}
      <div className="space-y-6">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 border-b border-slate-800 pb-4">
          <div>
            <h2 className="text-xl sm:text-2xl font-black text-white tracking-tight flex items-center gap-2">
              <Layers className="w-5 h-5 text-electric-400" />
              <span>{activeLang === 'hi' ? '10-अध्याय इंटरेक्टिव टाइमलाइन' : 'The 10-Act Interactive Timeline'}</span>
            </h2>
            <p className="text-xs sm:text-sm text-slate-400 mt-1">
              {activeLang === 'hi' 
                ? 'प्रत्येक अध्याय पर क्लिक करके पैकेट के सफर को विस्तार से समझें।' 
                : 'Click any chapter below to explore the exact engineering mechanisms.'}
            </p>
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-3">
          {epData.chapters.map((ch) => {
            const isSelected = activeAct === ch.actNumber;
            return (
              <button
                key={ch.id}
                onClick={() => setActiveAct(ch.actNumber)}
                className={`p-3.5 rounded-xl border text-left transition-all duration-200 cursor-pointer flex flex-col justify-between ${
                  isSelected
                    ? 'bg-navy-900 border-cyan-400 shadow-lg shadow-cyan-950/40 ring-1 ring-cyan-400'
                    : 'bg-navy-950/70 border-slate-800/80 hover:border-slate-700 hover:bg-navy-900/50'
                }`}
              >
                <div>
                  <div className="flex items-center justify-between text-[11px] font-mono mb-2">
                    <span className={`px-2 py-0.5 rounded font-bold ${
                      isSelected ? 'bg-cyan-500 text-black' : 'bg-slate-800 text-slate-300'
                    }`}>
                      Act {ch.actNumber}
                    </span>
                    <span className="text-slate-400">{ch.time}</span>
                  </div>
                  <h4 className="text-xs font-bold text-white line-clamp-2 leading-snug">
                    {activeLang === 'hi' ? ch.titleHi : ch.titleEn}
                  </h4>
                </div>
                <p className="text-[11px] text-slate-400 line-clamp-2 mt-2 leading-relaxed">
                  {activeLang === 'hi' ? ch.descHi : ch.descEn}
                </p>
              </button>
            );
          })}
        </div>
      </div>

      {/* 4. Synchronized Bilingual Transcript Reader */}
      <div className="p-6 rounded-2xl bg-navy-900/80 border border-slate-800 space-y-6">
        <div className="flex items-center justify-between border-b border-slate-800 pb-4">
          <div className="flex items-center gap-2">
            <FileText className="w-5 h-5 text-cyan-400" />
            <h3 className="text-lg font-bold text-white">
              {activeLang === 'hi' ? 'संपूर्ण द्विभाषी ट्रांसक्रिप्ट' : 'Complete Bilingual Engineering Transcript'}
            </h3>
          </div>
          <span className="text-xs font-mono text-slate-400">
            {activeLang === 'hi' ? 'भाषा: हिन्दी (ऑडियो 2)' : 'Language: English (Audio 1)'}
          </span>
        </div>

        <div className="space-y-4 max-h-[460px] overflow-y-auto pr-2 scrollbar-thin scrollbar-thumb-slate-700">
          {currentTranscript.map((tItem) => {
            const isHighlighted = activeAct === tItem.act;
            const chapterMeta = epData.chapters.find(c => c.actNumber === tItem.act);
            return (
              <div
                key={tItem.act}
                onClick={() => setActiveAct(tItem.act)}
                className={`p-4 rounded-xl border transition-all cursor-pointer ${
                  isHighlighted
                    ? 'bg-navy-950 border-cyan-400/80 shadow-md ring-1 ring-cyan-400/40'
                    : 'bg-navy-950/40 border-slate-800/80 hover:border-slate-700'
                }`}
              >
                <div className="flex items-center justify-between text-xs font-mono mb-2">
                  <div className="flex items-center gap-2">
                    <span className="text-cyan-400 font-bold">Act {tItem.act}</span>
                    <span className="text-slate-500">•</span>
                    <span className="text-slate-300 font-semibold">
                      {activeLang === 'hi' ? chapterMeta?.titleHi : chapterMeta?.titleEn}
                    </span>
                  </div>
                  <span className="text-slate-400">{chapterMeta?.time}</span>
                </div>
                <p className="text-xs sm:text-sm text-slate-200 leading-relaxed font-sans">
                  "{tItem.text}"
                </p>
              </div>
            );
          })}
        </div>
      </div>

      {/* 5. Connected Hands-On Lab Tools */}
      <div className="space-y-6">
        <div>
          <h2 className="text-xl sm:text-2xl font-black text-white tracking-tight flex items-center gap-2">
            <Terminal className="w-5 h-5 text-cyan-400" />
            <span>{activeLang === 'hi' ? 'लाइव हैंड्स-ऑन लैब्स एवं टूल्स' : 'Practice With Connected Engineering Tools'}</span>
          </h2>
          <p className="text-xs sm:text-sm text-slate-400 mt-1">
            {activeLang === 'hi'
              ? 'वीडियो में समझाई गई अवधारणाओं को RTechLab के मुफ्त ब्राउज़र सिमुलेटर में खुद आज़माएँ।'
              : 'Test and verify the exact protocols from this episode using our free interactive simulators.'}
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {epData.connectedTools.map((tool, idx) => (
            <div
              key={idx}
              className="p-6 rounded-2xl bg-navy-900/80 border border-slate-800 hover:border-cyan-500/50 transition-all flex flex-col justify-between group shadow-lg"
            >
              <div className="space-y-3">
                <div className="w-10 h-10 rounded-xl bg-cyan-950/80 border border-cyan-800/50 flex items-center justify-center text-cyan-400 group-hover:scale-105 transition-transform">
                  {idx === 0 && <Compass className="w-5 h-5" />}
                  {idx === 1 && <Wifi className="w-5 h-5" />}
                  {idx === 2 && <Server className="w-5 h-5" />}
                </div>

                <h4 className="text-base font-bold text-white group-hover:text-cyan-400 transition-colors">
                  {tool.name}
                </h4>

                <p className="text-xs text-slate-400 leading-relaxed">
                  {activeLang === 'hi' ? tool.descHi : tool.descEn}
                </p>
              </div>

              <div className="pt-6 mt-4 border-t border-slate-800">
                <Link
                  to={tool.path}
                  className="inline-flex items-center gap-1.5 px-4 py-2 rounded-xl bg-navy-850 hover:bg-electric-600 text-slate-200 hover:text-white text-xs font-semibold border border-slate-700/80 hover:border-electric-500 transition w-full justify-center"
                >
                  <span>{activeLang === 'hi' ? 'टूल खोलें' : 'Launch Simulator'}</span>
                  <ArrowRight className="w-3.5 h-3.5" />
                </Link>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};
