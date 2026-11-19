import React from 'react';
import { Link } from 'react-router';
import { AboutSection } from '../../src/components/AboutSection';

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
          <Link to="/tools/subnet-calculator" className="font-semibold text-electric-400 hover:text-electric-300">Tools</Link>
          <span>·</span>
          <Link to="/tutorials" className="font-semibold text-electric-400 hover:text-electric-300">Tutorials</Link>
          <span>·</span>
          <Link to="/system-design" className="font-semibold text-electric-400 hover:text-electric-300">Simulators</Link>
        </p>
      </div>

      <AboutSection />
    </div>
  );
}

export default AboutPage;
