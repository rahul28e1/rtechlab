import React from 'react';
import { Link } from 'react-router';
import { AlertTriangle, Shield, CheckCircle2, FileText, Globe } from 'lucide-react';

export function DisclaimerPage() {
  return (
    <div className="min-h-screen bg-black text-[#EDEDED] py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-4xl mx-auto">
        
        {/* Breadcrumb Navigation */}
        <nav className="mb-6 flex items-center gap-1.5 text-xs font-mono text-[#86868B]">
          <Link to="/" className="hover:text-white transition-colors">Home</Link>
          <span>/</span>
          <Link to="/about" className="hover:text-white transition-colors">About</Link>
          <span>/</span>
          <span className="text-emerald-400">Legal Disclaimer</span>
        </nav>

        {/* Header */}
        <div className="mb-10 pb-8 border-b border-white/[0.08]">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-amber-500/10 border border-amber-500/30 text-xs font-mono text-amber-400 mb-3">
            <AlertTriangle className="w-3.5 h-3.5 text-amber-400" />
            <span>Trademark &amp; Educational Fair Use Disclosures</span>
          </div>
          <h1 className="text-3xl sm:text-5xl font-black text-white tracking-tight mb-4">
            RTechLab Legal Disclaimer
          </h1>
          <p className="text-sm sm:text-base text-[#86868B] leading-relaxed max-w-2xl">
            Please read this disclaimer carefully regarding independent educational publishing, third-party trademark attributions, and academic guidance on <strong className="text-white">rtechlab.vercel.app</strong>.
          </p>
        </div>

        {/* Content Sections */}
        <div className="space-y-8 text-sm text-[#A1A1A6] leading-relaxed">
          
          {/* Section 1: Independent Publisher */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">01.</span>
              <span>Independent Academic Publication</span>
            </h2>
            <p className="mb-3">
              RTechLab is an independent educational initiative founded by engineer Rahul Patel. Our mission is to make computer networking, system design, hardware architecture, and enterprise software engineering accessible, clear, and practical for college students and IT professionals worldwide.
            </p>
            <p className="text-xs text-[#86868B]">
              Unless explicitly stated, RTechLab is not officially affiliated with, sponsored by, or endorsed by any vendor, certification body, or commercial software provider.
            </p>
          </div>

          {/* Section 2: Trademark Attribution */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">02.</span>
              <span>Third-Party Trademark Attribution</span>
            </h2>
            <p className="mb-3">
              All third-party trademarks, product names, logos, and registered brands mentioned across our handbooks and website remain the sole intellectual property of their respective owners:
            </p>
            <ul className="space-y-2 list-disc list-inside text-xs sm:text-sm text-[#D2D2D7]">
              <li><strong>Cisco Systems, Inc.:</strong> <em>Cisco, CCNA, Cisco IOS, Packet Tracer,</em> and <em>Catalyst</em> are registered trademarks of Cisco Systems, Inc. and/or its affiliates.</li>
              <li><strong>Microsoft Corporation:</strong> <em>Microsoft, Office 365, Word, Excel, PowerPoint, Access, Outlook,</em> and <em>Power Query</em> are registered trademarks of Microsoft Corporation.</li>
              <li><strong>Other Entities:</strong> <em>TCS, Infosys, Wipro, Cognizant, L&amp;T, HDFC,</em> and other corporate names mentioned in interview prep vaults and reviews are trademarks of their respective owners and are referenced purely nominatively for curriculum context.</li>
            </ul>
          </div>

          {/* Section 3: Salary & Placement Disclaimers */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">03.</span>
              <span>Salary Benchmarks &amp; Placement Disclaimer</span>
            </h2>
            <p className="mb-3">
              All CTC salary ranges, placement statistics, and salary negotiation blueprints (e.g., ₹3.5L to ₹18L+ CTC) represent illustrative market benchmarks compiled from public Indian IT industry compensation reports (NASSCOM, AmbitionBox, Glassdoor, and campus placement drives).
            </p>
            <p className="text-xs text-[#86868B]">
              Actual job offers, salaries, and hiring decisions depend solely on an individual candidate's academic standing, technical interview performance, corporate hiring quotas, and economic conditions. RTechLab does not guarantee specific employment outcomes.
            </p>
          </div>

          {/* Section 4: Contact */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">04.</span>
              <span>Legal Contact &amp; Questions</span>
            </h2>
            <p className="mb-3">
              If you have any questions regarding intellectual property, educational permissions, or trademark notices, please contact Founder Rahul Patel:
            </p>
            <div className="p-4 rounded-xl bg-white/[0.03] border border-white/[0.06] text-xs font-mono">
              <div className="text-white font-bold mb-1">Chief Publisher:</div>
              <div className="text-[#86868B]">Rahul Patel · RTechLab Publications</div>
              <div className="text-emerald-400 mt-1">Email: rahul.28e1@gmail.com</div>
              <div className="text-[#86868B] mt-0.5">Website: rtechlab.vercel.app</div>
            </div>
          </div>

        </div>

      </div>
    </div>
  );
}

export default DisclaimerPage;
