import React from 'react';
import { Link } from 'react-router';
import { AboutSection } from '../../src/components/AboutSection';
import { ArrowUpRight, Award, CheckCircle2, Globe2, Sparkles, Terminal } from 'lucide-react';

export function AboutPage() {
  return (
    <div>
      <div className="mx-auto max-w-6xl px-6 pt-12 sm:pt-16">
        <nav className="mb-6 flex items-center gap-1.5 text-[11px] text-slate-500">
          <Link to="/" className="hover:text-white">Home</Link>
          <span>/</span>
          <span className="text-slate-300">About</span>
        </nav>
        <p className="text-[13px] font-medium text-[#86868b]">About RTechLab</p>
        <h1 className="mt-3 text-[34px] font-semibold leading-[1.07] tracking-[-0.04em] text-white sm:text-[44px] md:text-[52px]">
          Technology Made Practical.
        </h1>
        <p className="mt-4 max-w-2xl text-[15px] leading-relaxed text-[#a1a1a6] sm:text-[17px]">
          RTechLab is a free education platform for networking, cloud, security and IT students. We publish CCNA and
          fundamentals lessons, free tools, quizzes and digital notes in English and Hindi.
        </p>
        <p className="mt-3 flex flex-wrap gap-x-3 gap-y-1 text-[13px] text-[#86868b]">
          <Link to="/notes" className="font-semibold text-electric-400 hover:text-electric-300">Notes</Link>
          <span>·</span>
          <Link to="/tools" className="font-semibold text-electric-400 hover:text-electric-300">Tools</Link>
          <span>·</span>
          <Link to="/tutorials" className="font-semibold text-electric-400 hover:text-electric-300">Tutorials</Link>
          <span>·</span>
          <Link to="/system-design" className="font-semibold text-electric-400 hover:text-electric-300">Simulators</Link>
        </p>

        {/* Founder & Lead Architect Spotlight Card */}
        <div className="mt-12 rounded-[28px] border border-white/[0.1] bg-gradient-to-br from-[#12141c] via-[#161822] to-[#0c0d12] p-8 sm:p-10 shadow-2xl relative overflow-hidden group">
          <div className="absolute top-0 right-0 w-96 h-96 bg-emerald-500/10 rounded-full blur-3xl pointer-events-none -mr-20 -mt-20"></div>

          <div className="relative z-10 flex flex-col lg:flex-row lg:items-center justify-between gap-8">
            <div className="flex flex-col sm:flex-row items-start sm:items-center gap-6">
              {/* Avatar / Badge */}
              <div className="relative flex-shrink-0">
                <div className="w-20 h-20 sm:w-24 sm:h-24 rounded-2xl bg-gradient-to-tr from-emerald-600 via-teal-500 to-cyan-400 p-[2px] shadow-lg shadow-emerald-500/20">
                  <div className="w-full h-full bg-[#0b0c10] rounded-[14px] flex items-center justify-center">
                    <span className="text-2xl sm:text-3xl font-black tracking-tight text-white bg-gradient-to-br from-white via-slate-200 to-emerald-400 bg-clip-text text-transparent">
                      RP
                    </span>
                  </div>
                </div>
                <div className="absolute -bottom-2 -right-2 bg-emerald-500 text-black text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wider shadow">
                  Founder
                </div>
              </div>

              {/* Founder Meta */}
              <div className="space-y-1.5">
                <div className="flex flex-wrap items-center gap-2.5">
                  <h2 className="text-2xl sm:text-3xl font-bold text-white tracking-tight">
                    Rahul Patel
                  </h2>
                  <span className="rounded-full border border-emerald-500/30 bg-emerald-500/10 px-2.5 py-0.5 text-[11px] font-medium text-emerald-300">
                    Lead Systems Architect
                  </span>
                </div>
                <p className="text-[14px] font-medium text-slate-300">
                  Educator, Entrepreneur &amp; Builder · 19+ Years of Trust in Tech Education
                </p>
                <p className="text-[13px] leading-relaxed text-[#a1a1a6] max-w-2xl pt-1">
                  50% Partner at IANT Computer Education Palanpur (19 Years of Trust). Creator of RTechLab's interactive labs,
                  networking simulators, and bilingual publishing suite dedicated to high-impact, hands-on engineering education.
                </p>

                {/* Tech Tags */}
                <div className="flex flex-wrap gap-2 pt-2 text-[11px] text-slate-300">
                  <span className="rounded-md bg-white/[0.06] px-2.5 py-1">Computer Networking</span>
                  <span className="rounded-md bg-white/[0.06] px-2.5 py-1">CCNA &amp; Cloud Systems</span>
                  <span className="rounded-md bg-white/[0.06] px-2.5 py-1">Full-Stack Architecture</span>
                  <span className="rounded-md bg-white/[0.06] px-2.5 py-1">Digital Education</span>
                </div>
              </div>
            </div>

            {/* CTA Button to Portfolio */}
            <div className="flex flex-col sm:flex-row lg:flex-col items-stretch sm:items-center lg:items-end gap-3 flex-shrink-0">
              <a
                href="https://rahulprofile28.netlify.app/"
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center justify-center gap-2.5 rounded-xl bg-gradient-to-r from-emerald-500 to-teal-500 px-6 py-3.5 text-[14px] font-semibold text-black transition-all duration-300 hover:from-emerald-400 hover:to-teal-400 hover:shadow-lg hover:shadow-emerald-500/25 active:scale-95"
              >
                <span>Visit Rahul's Portfolio</span>
                <ArrowUpRight className="w-4 h-4" />
              </a>
              <span className="text-[11px] text-center lg:text-right text-[#86868b]">
                rahulprofile28.netlify.app ↗
              </span>
            </div>
          </div>
        </div>
      </div>

      <AboutSection />
    </div>
  );
}

export default AboutPage;
