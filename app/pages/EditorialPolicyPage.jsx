import React from 'react';
import { Link } from 'react-router';
import { ShieldCheck, BookOpen, CheckCircle2, FileText, Sparkles, Scale, RefreshCw, Mail } from 'lucide-react';

export function EditorialPolicyPage() {
  return (
    <div className="min-h-screen bg-black text-[#EDEDED] py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-4xl mx-auto">
        
        {/* Breadcrumb Navigation */}
        <nav className="mb-6 flex items-center gap-1.5 text-xs font-mono text-[#86868B]">
          <Link to="/" className="hover:text-white transition-colors">Home</Link>
          <span>/</span>
          <Link to="/about" className="hover:text-white transition-colors">About</Link>
          <span>/</span>
          <span className="text-emerald-400">Editorial Policy</span>
        </nav>

        {/* Header */}
        <div className="mb-10 pb-8 border-b border-white/[0.08]">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-xs font-mono text-emerald-400 mb-3">
            <ShieldCheck className="w-3.5 h-3.5 text-emerald-400" />
            <span>Official Publishing Standards · Updated 2027 Edition</span>
          </div>
          <h1 className="text-3xl sm:text-5xl font-black text-white tracking-tight mb-4">
            RTechLab Editorial &amp; Verification Policy
          </h1>
          <p className="text-sm sm:text-base text-[#86868B] leading-relaxed max-w-2xl">
            At RTechLab, educational integrity is non-negotiable. Every digital note, handbook, and interactive simulator is created through rigorous engineering research, peer RFC verification, and real-world industrial practice.
          </p>
        </div>

        {/* Core Principles */}
        <div className="space-y-8 text-sm text-[#A1A1A6] leading-relaxed">
          
          {/* Principle 1 */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-8 h-8 rounded-lg bg-emerald-500/15 text-emerald-400 flex items-center justify-center font-bold font-mono">
                01
              </div>
              <h2 className="text-lg font-bold text-white">Engineering Accuracy &amp; RFC Standards</h2>
            </div>
            <p className="mb-3">
              We do not publish regurgitated textbook summaries. All networking lessons adhere strictly to official <strong>IETF RFCs</strong> (e.g., RFC 791 for IPv4, RFC 2460/8200 for IPv6, RFC 2328 for OSPFv2). In enterprise computing, architectures are cross-checked against vendor documentation from Cisco Systems, Microsoft, and IEEE hardware specifications.
            </p>
            <div className="flex flex-wrap gap-2 pt-2">
              <span className="text-[11px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-white/70 border border-white/10">IETF RFC Verified</span>
              <span className="text-[11px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-white/70 border border-white/10">Cisco TAC Standard</span>
              <span className="text-[11px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-white/70 border border-white/10">IEEE 802.3 Compliant</span>
            </div>
          </div>

          {/* Principle 2 */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-8 h-8 rounded-lg bg-cyan-500/15 text-cyan-400 flex items-center justify-center font-bold font-mono">
                02
              </div>
              <h2 className="text-lg font-bold text-white">Bilingual Integrity (English &amp; Hindi)</h2>
            </div>
            <p>
              Technical vocabulary is preserved across both language editions. Core engineering terminology such as <em>Router, Switch, Subnet Mask, Transformer Attention, XLOOKUP, Packet,</em> and <em>Kernel</em> are never transliterated into awkward literal translations. Conceptual explanations are delivered in natural, student-friendly Hindi and global English to maximize comprehension.
            </p>
          </div>

          {/* Principle 3 */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-8 h-8 rounded-lg bg-purple-500/15 text-purple-400 flex items-center justify-center font-bold font-mono">
                03
              </div>
              <h2 className="text-lg font-bold text-white">Originality &amp; Anti-Plagiarism Protocol</h2>
            </div>
            <p className="mb-2">
              Every diagram, vector schematic, practice question, and blueprint in RTechLab publications is authored from scratch. We do not copy proprietary vendor exams, leaked question dumps, or copyrighted university material.
            </p>
            <p>
              Technical interview questions reflect real industry placement interview patterns distilled by experienced corporate trainers and senior engineers.
            </p>
          </div>

          {/* Principle 4 */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-8 h-8 rounded-lg bg-amber-500/15 text-amber-400 flex items-center justify-center font-bold font-mono">
                04
              </div>
              <h2 className="text-lg font-bold text-white">Errata &amp; Continuous Revision Policy</h2>
            </div>
            <p className="mb-3">
              Technology evolves rapidly. When protocol standards are updated or an erratum is discovered, revisions are published immediately:
            </p>
            <ul className="space-y-1.5 list-disc list-inside text-xs sm:text-sm text-[#D2D2D7]">
              <li>All registered buyers receive lifetime updated PDF download links without any additional charge.</li>
              <li>Readers who submit confirmed technical corrections receive personal acknowledgement from Founder Rahul Patel.</li>
              <li>Errata submissions can be emailed directly to <strong className="text-emerald-400">rahul.28e1@gmail.com</strong>.</li>
            </ul>
          </div>

          {/* Author & Editorial Lead */}
          <div className="p-6 rounded-2xl bg-gradient-to-r from-emerald-500/10 via-cyan-500/5 to-transparent border border-emerald-500/30 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4">
            <div>
              <div className="text-xs font-mono text-emerald-400 font-bold uppercase mb-1">Chief Editor &amp; Lead Architect</div>
              <div className="text-base font-bold text-white">Rahul Patel</div>
              <p className="text-xs text-[#86868B] mt-0.5">
                Industrial Engineer · Senior Technical Trainer at IANT Palanpur · Founder of RTechLab
              </p>
            </div>
            <Link
              to="/about"
              className="px-4 py-2 rounded-xl bg-white/[0.08] hover:bg-white/[0.15] border border-white/10 text-xs font-bold text-white transition-all shrink-0"
            >
              Read Author Bio →
            </Link>
          </div>

        </div>

      </div>
    </div>
  );
}

export default EditorialPolicyPage;
