import React from 'react';
import { Link } from 'react-router';

export function Footer() {
  return (
    <footer className="border-t border-white/[0.08] bg-black text-[#86868B] text-xs pt-16 pb-12 px-4 sm:px-6 lg:px-8 mt-auto print:hidden">
      <div className="max-w-7xl mx-auto">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-8 mb-12">
          {/* Col 1: Roadmaps */}
          <div>
            <h4 className="text-white text-xs font-semibold uppercase tracking-wider mb-4 font-mono">
              Learning Tracks
            </h4>
            <ul className="space-y-2.5">
              <li><Link to="/notes" className="hover:text-white transition-colors">Enterprise Networking</Link></li>
              <li><Link to="/notes" className="hover:text-white transition-colors">Cisco CCNA 200-301</Link></li>
              <li><Link to="/notes" className="hover:text-white transition-colors">Linux Administration</Link></li>
              <li><Link to="/notes" className="hover:text-white transition-colors">Cybersecurity &amp; SOC</Link></li>
              <li><Link to="/notes" className="hover:text-white transition-colors">Cloud &amp; DevOps</Link></li>
            </ul>
          </div>

          {/* Col 2: Tools */}
          <div>
            <h4 className="text-white text-xs font-semibold uppercase tracking-wider mb-4 font-mono">
              Free Tools
            </h4>
            <ul className="space-y-2.5">
              <li><Link to="/tools/subnet-calculator" className="hover:text-white transition-colors">Subnet Calculator</Link></li>
              <li><Link to="/tools/dns-lookup" className="hover:text-white transition-colors">Live DNS Lookup</Link></li>
              <li><Link to="/tools/port-analyzer" className="hover:text-white transition-colors">Port Analyzer</Link></li>
              <li><Link to="/tools/password-strength" className="hover:text-white transition-colors">Password Auditor</Link></li>
              <li><Link to="/tools/chmod-calculator" className="hover:text-white transition-colors">chmod Calculator</Link></li>
              <li><Link to="/tools/office-toolkit" className="hover:text-white transition-colors">Excel Formula Finder</Link></li>
              <li><Link to="/tools" className="font-semibold text-white/90 hover:text-white transition-colors">All tools →</Link></li>
            </ul>
          </div>

          {/* Col 3: Simulators & Practice */}
          <div>
            <h4 className="text-white text-xs font-semibold uppercase tracking-wider mb-4 font-mono">
              Practice
            </h4>
            <ul className="space-y-2.5">
              <li><Link to="/system-design" className="hover:text-white transition-colors">System Design Simulator</Link></li>
              <li><Link to="/tutorials" className="hover:text-white transition-colors">Engineering Tutorials</Link></li>
              <li><a href="#interview-prep" className="hover:text-white transition-colors">Interview Scenarios</a></li>
              <li><Link to="/hi/notes" className="hover:text-white transition-colors">हिंदी संस्करण (Hindi Edition)</Link></li>
            </ul>
          </div>

          {/* Col 4: Legal & About */}
          <div>
            <h4 className="text-white text-xs font-semibold uppercase tracking-wider mb-4 font-mono">
              Platform &amp; Legal
            </h4>
            <ul className="space-y-2.5">
              <li><Link to="/about" className="hover:text-white transition-colors">About RTechLab</Link></li>
              <li><Link to="/editorial-policy" className="hover:text-white transition-colors">Editorial Policy</Link></li>
              <li><Link to="/privacy" className="hover:text-white transition-colors">Privacy Policy</Link></li>
              <li><Link to="/terms" className="hover:text-white transition-colors">Terms of Service</Link></li>
              <li><Link to="/contact" className="hover:text-white transition-colors">Contact Support</Link></li>
            </ul>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="pt-8 border-t border-white/[0.06] flex flex-col sm:flex-row items-center justify-between gap-4">
          <div className="flex items-center gap-2">
            <span className="font-bold text-white tracking-tight">RTechLab</span>
            <span className="text-[#6E6E73]">·</span>
            <span>Universal Open-Access Technical Education</span>
          </div>
          <div className="text-[#6E6E73] text-[11px] font-mono">
            © {new Date().getFullYear()} RTechLab. All rights reserved.
          </div>
        </div>
      </div>
    </footer>
  );
}
