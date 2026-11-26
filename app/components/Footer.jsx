import React from 'react';
import { Link, useLocation } from 'react-router';

export function Footer() {
  const location = useLocation();
  const isHindi = location.pathname.startsWith('/hi');

  return (
    <footer className="border-t border-white/[0.08] bg-black text-[#86868B] text-xs pt-16 pb-12 px-4 sm:px-6 lg:px-8 mt-auto print:hidden">
      <div className="max-w-7xl mx-auto">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-8 mb-12">
          {/* Col 1: Roadmaps */}
          <div>
            <h4 className="text-white text-xs font-semibold uppercase tracking-wider mb-4 font-mono">
              {isHindi ? 'लर्निंग ट्रैक्स' : 'Learning Tracks'}
            </h4>
            <ul className="space-y-2.5">
              <li><Link to={isHindi ? "/hi/notes" : "/notes"} className="hover:text-white transition-colors">Enterprise Networking</Link></li>
              <li><Link to={isHindi ? "/hi/notes" : "/notes"} className="hover:text-white transition-colors">Cisco CCNA 200-301</Link></li>
              <li><Link to={isHindi ? "/hi/notes" : "/notes"} className="hover:text-white transition-colors">Linux Administration</Link></li>
              <li><Link to={isHindi ? "/hi/notes" : "/notes"} className="hover:text-white transition-colors">Cybersecurity &amp; SOC</Link></li>
              <li><Link to={isHindi ? "/hi/notes" : "/notes"} className="hover:text-white transition-colors">Cloud &amp; DevOps</Link></li>
            </ul>
          </div>

          {/* Col 2: Tools */}
          <div>
            <h4 className="text-white text-xs font-semibold uppercase tracking-wider mb-4 font-mono">
              {isHindi ? 'मुफ़्त टूल्स' : 'Free Tools'}
            </h4>
            <ul className="space-y-2.5">
              <li><Link to="/tools/subnet-calculator" className="hover:text-white transition-colors">Subnet Calculator</Link></li>
              <li><Link to="/tools/dns-lookup" className="hover:text-white transition-colors">Live DNS Lookup</Link></li>
              <li><Link to="/tools/port-analyzer" className="hover:text-white transition-colors">Port Analyzer</Link></li>
              <li><Link to="/tools/password-strength" className="hover:text-white transition-colors">Password Auditor</Link></li>
              <li><Link to="/tools/chmod-calculator" className="hover:text-white transition-colors">chmod Calculator</Link></li>
              <li><Link to="/tools/office-toolkit" className="hover:text-white transition-colors">Excel Formula Finder</Link></li>
              <li><Link to={isHindi ? "/hi/tools" : "/tools"} className="font-semibold text-white/90 hover:text-white transition-colors">{isHindi ? 'सभी टूल्स →' : 'All tools →'}</Link></li>
            </ul>
          </div>

          {/* Col 3: Simulators & Practice */}
          <div>
            <h4 className="text-white text-xs font-semibold uppercase tracking-wider mb-4 font-mono">
              {isHindi ? 'अभ्यास एवं सिमुलेटर' : 'Practice'}
            </h4>
            <ul className="space-y-2.5">
              <li><Link to={isHindi ? "/hi/system-design" : "/system-design"} className="hover:text-white transition-colors">{isHindi ? 'सिस्टम डिज़ाइन सिम्युलेटर' : 'System Design Simulator'}</Link></li>
              <li><Link to={isHindi ? "/hi/tutorials" : "/tutorials"} className="hover:text-white transition-colors">{isHindi ? 'इंजीनियरिंग ट्यूटोरियल्स' : 'Engineering Tutorials'}</Link></li>
              <li><Link to={isHindi ? "/hi/notes" : "/notes"} className="hover:text-white transition-colors">{isHindi ? 'इंटरव्यू क्वेश्चन वॉल्ट्स' : 'MNC Interview Vaults'}</Link></li>
              <li><Link to={isHindi ? "/notes" : "/hi/notes"} className="hover:text-white transition-colors">{isHindi ? 'English Edition' : 'हिंदी संस्करण (Hindi Edition)'}</Link></li>
            </ul>
          </div>

          {/* Col 4: Legal & About */}
          <div>
            <h4 className="text-white text-xs font-semibold uppercase tracking-wider mb-4 font-mono">
              {isHindi ? 'प्लेटफ़ॉर्म एवं लीगल' : 'Platform & Legal'}
            </h4>
            <ul className="space-y-2.5">
              <li><Link to={isHindi ? "/hi/about" : "/about"} className="hover:text-white transition-colors">{isHindi ? 'हमारे बारे में (About RTechLab)' : 'About RTechLab'}</Link></li>
              <li><Link to="/editorial-policy" className="hover:text-white transition-colors">Editorial Policy</Link></li>
              <li><Link to="/privacy" className="hover:text-white transition-colors">Privacy Policy</Link></li>
              <li><Link to="/terms" className="hover:text-white transition-colors">Terms of Service</Link></li>
              <li><Link to="/disclaimer" className="hover:text-white transition-colors">Legal Disclaimer</Link></li>
              <li><Link to={isHindi ? "/hi/contact" : "/contact"} className="hover:text-white transition-colors">{isHindi ? 'संपर्क करें (Contact)' : 'Contact Support'}</Link></li>
              <li className="pt-2 text-white/40 border-t border-white/[0.06]">Official Channels &amp; Help:</li>
              <li>
                <a
                  href="https://wa.me/917646892094?text=Hi%20RTechLab%2C%20I%20have%20a%20question%20regarding%20digital%20notes%20and%20handbooks."
                  target="_blank"
                  rel="noopener noreferrer"
                  className="hover:text-emerald-300 transition-colors inline-flex items-center gap-1 font-semibold text-emerald-400"
                  title="Official Student WhatsApp Helpline (Chat Only · No Calls)"
                >
                  <span>🟢 WhatsApp Helpline (+91 76468 92094)</span>
                  <span className="text-[10px]">↗</span>
                </a>
              </li>
              <li>
                <a
                  href="https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="hover:text-emerald-400 transition-colors inline-flex items-center gap-1 text-[#86868B]"
                  title="Join RTechLab Official WhatsApp Channel"
                >
                  <span>💬 WhatsApp Channel (Tech Updates)</span>
                  <span className="text-[10px]">↗</span>
                </a>
              </li>
              <li>
                <a
                  href="https://www.youtube.com/@RTechLabOfficial"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="hover:text-red-400 transition-colors inline-flex items-center gap-1"
                >
                  <span>YouTube @RTechLabOfficial</span>
                  <span className="text-[10px]">↗</span>
                </a>
              </li>
              <li>
                <a
                  href="https://www.instagram.com/rtechlabofficial/"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="hover:text-pink-400 transition-colors inline-flex items-center gap-1"
                >
                  <span>Instagram @rtechlabofficial</span>
                  <span className="text-[10px]">↗</span>
                </a>
              </li>
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
