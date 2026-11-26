import React from 'react';
import { Link, useLocation } from 'react-router';

export function Hero() {
  const location = useLocation();
  const isHindi = location.pathname.startsWith('/hi');

  return (
    <section className="relative overflow-hidden pt-16 sm:pt-24 pb-16 px-4 sm:px-6">
      {/* Apple-style ambient radial light behind the headline */}
      <div className="absolute top-0 left-1/2 -translate-x-1/2 w-[900px] h-[450px] bg-gradient-to-b from-white/[0.08] via-transparent to-transparent blur-3xl pointer-events-none -z-10" />

      <div className="max-w-6xl mx-auto text-center">
        {/* Universal Pill Badge */}
        <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-white/[0.05] border border-white/[0.12] text-xs font-semibold text-white/90 mb-8 backdrop-blur-md">
          <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
          <span>
            {isHindi
              ? 'सार्वभौमिक इंजीनियरिंग अकादमी · 100% निःशुल्क · हार्डवेयर से क्लाउड तक'
              : 'Universal Engineering Academy · 100% Free · Hardware to Cloud'}
          </span>
        </div>

        {/* Clean, Bold, Universal Headline */}
        <h1 className="text-5xl sm:text-7xl lg:text-8xl font-black tracking-[-0.04em] text-white leading-[1.03] mb-6">
          {isHindi ? (
            <>
              आधुनिक तकनीक सीखें।<br />
              <span className="bg-gradient-to-b from-[#EDEDED] via-[#A1A1A6] to-[#6E6E73] bg-clip-text text-transparent">
                सिलिकॉन से क्लाउड तक।
              </span>
            </>
          ) : (
            <>
              Master Modern Tech.<br />
              <span className="bg-gradient-to-b from-[#EDEDED] via-[#A1A1A6] to-[#6E6E73] bg-clip-text text-transparent">
                From Silicon to Cloud.
              </span>
            </>
          )}
        </h1>

        {/* Crisp Universal Subtitle */}
        <p className="text-lg sm:text-xl md:text-2xl text-[#86868B] max-w-3xl mx-auto font-normal leading-relaxed mb-10 tracking-tight">
          {isHindi
            ? 'कंप्यूटर फंडामेंटल्स, हार्डवेयर, एंटरप्राइज नेटवर्किंग, लिनक्स, साइबर सुरक्षा, क्लाउड, डेवऑप्स और AI पर विस्तृत, व्यावहारिक रोडमैप। वैश्विक स्तर पर महत्वाकांक्षी इंजीनियरों के लिए निर्मित।'
            : 'Comprehensive, zero-fluff roadmaps across Computer Fundamentals, Hardware, Enterprise Networking, Linux, Cybersecurity, Cloud, DevOps & AI. Built for real-world engineers worldwide.'}
        </p>

        {/* 3 Core Pillars: Notes (Monetization), Tools (Utility), Videos (Education) */}
        <div className="flex flex-col sm:flex-row items-center justify-center gap-2.5 sm:gap-3.5 mb-14 max-w-2xl mx-auto">
          <Link
            to={isHindi ? "/hi/notes" : "/notes"}
            className="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-7 py-3 rounded-full bg-emerald-400 hover:bg-emerald-300 text-black font-extrabold text-sm sm:text-base transition-all shadow-xl shadow-emerald-500/20 active:scale-[0.98]"
          >
            <span>{isHindi ? '📚 नोट्स देखें (₹49)' : '📚 Browse Notes (₹49)'}</span>
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M14 5l7 7m0 0l-7 7m7-7H3" />
            </svg>
          </Link>
          <Link
            to={isHindi ? "/hi/tools" : "/tools"}
            className="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-white/[0.06] hover:bg-white/[0.12] text-white border border-white/[0.15] font-semibold text-sm sm:text-base transition-all active:scale-[0.98]"
          >
            <span>{isHindi ? '🛠️ मुफ़्त टूल्स' : '🛠️ Free Engineering Tools'}</span>
          </Link>
          <Link
            to={isHindi ? "/hi/tutorials" : "/tutorials"}
            className="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-white/[0.06] hover:bg-white/[0.12] text-cyan-300 border border-cyan-500/30 font-semibold text-sm sm:text-base transition-all active:scale-[0.98]"
          >
            <span>{isHindi ? '🎬 वीडियो श्रृंखला' : '🎬 Video Series'}</span>
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
