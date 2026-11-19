import React from 'react';
import { Link } from 'react-router';
import { AboutSection } from '../../src/components/AboutSection';
import { ArrowUpRight, Award, CheckCircle2, Globe2, Sparkles, Terminal, Users, GraduationCap, Video } from 'lucide-react';

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
          RTechLab is an open-access education platform for networking, cloud, security and IT students. We publish CCNA and
          fundamentals lessons, free browser-based tools, interactive simulators and digital publishing suites in English and Hindi.
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
              {/* Avatar / Photo */}
              <div className="relative flex-shrink-0">
                <div className="w-24 h-24 sm:w-28 sm:h-28 rounded-2xl bg-gradient-to-tr from-emerald-600 via-teal-500 to-cyan-400 p-[2px] shadow-lg shadow-emerald-500/25 overflow-hidden">
                  <img
                    src="/brand/rahul-patel.jpg"
                    alt="Rahul Patel — Director & Senior Technical Expert, IANT Palanpur"
                    className="w-full h-full object-cover object-top rounded-[14px]"
                  />
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
                    Founder &amp; Lead Systems Architect
                  </span>
                </div>
                <p className="text-[14px] font-semibold text-emerald-400">
                  Director &amp; Senior Technical Expert · IANT COMPUTER EDUCATION, PALANPUR
                </p>
                <div className="flex flex-wrap items-center gap-x-4 gap-y-1 text-[13px] text-slate-300 font-medium pt-0.5">
                  <span className="flex items-center gap-1.5 text-slate-200">
                    <Award className="w-4 h-4 text-emerald-400" />
                    <strong>10+ Years</strong> Industry &amp; Teaching Experience
                  </span>
                  <span className="text-slate-600">·</span>
                  <span className="flex items-center gap-1.5 text-slate-200">
                    <Users className="w-4 h-4 text-cyan-400" />
                    <strong>3,000+ Students</strong> Trained &amp; Mentored
                  </span>
                </div>
                <p className="text-[13px] leading-relaxed text-[#a1a1a6] max-w-2xl pt-2">
                  Director and Senior Technical Expert at IANT Computer Education, Palanpur. With over 10+ years of deep engineering experience, Rahul has trained more than 3,000+ students in Computer Networking, Cisco CCNA, Cloud Architecture, and Cyber Security. At RTechLab, he spearheads hands-on interactive simulators, packet-level tools, and open technical publishing designed to bridge classroom theory and production engineering.
                </p>

                {/* Tech Tags */}
                <div className="flex flex-wrap gap-2 pt-2 text-[11px] text-slate-300">
                  <span className="rounded-md bg-white/[0.06] px-2.5 py-1">Computer Networking</span>
                  <span className="rounded-md bg-white/[0.06] px-2.5 py-1">Cisco CCNA &amp; Routing</span>
                  <span className="rounded-md bg-white/[0.06] px-2.5 py-1">Cloud Infrastructure</span>
                  <span className="rounded-md bg-white/[0.06] px-2.5 py-1">Cyber Security &amp; SOC</span>
                  <span className="rounded-md bg-white/[0.06] px-2.5 py-1">Systems Architecture</span>
                </div>
              </div>
            </div>

            {/* Direct Action Links */}
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

        {/* Official Channels & Community Section */}
        <div className="mt-12">
          <div className="mb-6">
            <p className="text-[12px] font-mono uppercase tracking-wider text-emerald-400">Join Our Community</p>
            <h3 className="mt-1 text-2xl font-bold text-white tracking-tight">Official RTechLab Channels</h3>
            <p className="mt-1 text-[14px] text-[#a1a1a6]">Follow our official platforms for daily video explainers, command hacks, quizzes, and live engineering labs.</p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {/* YouTube Channel Card */}
            <a
              href="https://www.youtube.com/@RTechLabOfficial"
              target="_blank"
              rel="noopener noreferrer"
              className="group p-6 sm:p-7 rounded-[22px] bg-[#1d1d1f] border border-white/[0.08] hover:border-red-500/40 transition-all duration-300 flex flex-col justify-between"
            >
              <div>
                <div className="flex items-center justify-between mb-4">
                  <div className="w-12 h-12 rounded-xl bg-red-600/15 border border-red-500/30 text-red-500 flex items-center justify-center group-hover:bg-red-600 group-hover:text-white transition-colors duration-300">
                    <YoutubeIcon className="w-6 h-6" />
                  </div>
                  <span className="text-[11px] font-mono text-red-400 bg-red-500/10 px-2.5 py-1 rounded-full border border-red-500/20">
                    @RTechLabOfficial
                  </span>
                </div>
                <h4 className="text-[18px] font-semibold text-white group-hover:text-red-400 transition-colors">
                  YouTube Channel
                </h4>
                <p className="text-[13px] text-[#a1a1a6] mt-2 leading-relaxed">
                  Deep-dive networking tutorials, Cisco CCNA lab walkthroughs, packet capture breakdowns, and animated technical explainers in English &amp; Hindi.
                </p>
              </div>
              <div className="mt-6 pt-4 border-t border-white/[0.06] flex items-center justify-between text-[13px] font-semibold text-red-400 group-hover:translate-x-1 transition-transform">
                <span>Subscribe on YouTube</span>
                <ArrowUpRight className="w-4 h-4" />
              </div>
            </a>

            {/* Instagram Channel Card */}
            <a
              href="https://www.instagram.com/rtechlabofficial/"
              target="_blank"
              rel="noopener noreferrer"
              className="group p-6 sm:p-7 rounded-[22px] bg-[#1d1d1f] border border-white/[0.08] hover:border-pink-500/40 transition-all duration-300 flex flex-col justify-between"
            >
              <div>
                <div className="flex items-center justify-between mb-4">
                  <div className="w-12 h-12 rounded-xl bg-gradient-to-tr from-yellow-500/15 via-pink-500/15 to-purple-600/15 border border-pink-500/30 text-pink-400 flex items-center justify-center group-hover:bg-gradient-to-tr group-hover:from-yellow-500 group-hover:via-pink-500 group-hover:to-purple-600 group-hover:text-white transition-colors duration-300">
                    <InstagramIcon className="w-6 h-6" />
                  </div>
                  <span className="text-[11px] font-mono text-pink-400 bg-pink-500/10 px-2.5 py-1 rounded-full border border-pink-500/20">
                    @rtechlabofficial
                  </span>
                </div>
                <h4 className="text-[18px] font-semibold text-white group-hover:text-pink-400 transition-colors">
                  Instagram Hub
                </h4>
                <p className="text-[13px] text-[#a1a1a6] mt-2 leading-relaxed">
                  Daily 60-second tech reels, quick networking cheatsheets, Linux terminal tricks, exam flashcards, and tech community highlights.
                </p>
              </div>
              <div className="mt-6 pt-4 border-t border-white/[0.06] flex items-center justify-between text-[13px] font-semibold text-pink-400 group-hover:translate-x-1 transition-transform">
                <span>Follow on Instagram</span>
                <ArrowUpRight className="w-4 h-4" />
              </div>
            </a>
          </div>
        </div>
      </div>

      <AboutSection />
    </div>
  );
}

export default AboutPage;
