import React from 'react';
import { Link } from 'react-router';
import { FileText, ShieldAlert, Award, RefreshCw, HelpCircle, CheckCircle2 } from 'lucide-react';

export function TermsPage() {
  return (
    <div className="min-h-screen bg-black text-[#EDEDED] py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-4xl mx-auto">
        
        {/* Breadcrumb Navigation */}
        <nav className="mb-6 flex items-center gap-1.5 text-xs font-mono text-[#86868B]">
          <Link to="/" className="hover:text-white transition-colors">Home</Link>
          <span>/</span>
          <Link to="/about" className="hover:text-white transition-colors">About</Link>
          <span>/</span>
          <span className="text-emerald-400">Terms of Service</span>
        </nav>

        {/* Header */}
        <div className="mb-10 pb-8 border-b border-white/[0.08]">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-xs font-mono text-emerald-400 mb-3">
            <FileText className="w-3.5 h-3.5 text-emerald-400" />
            <span>Digital Product License &amp; Student Terms · Edition 2027</span>
          </div>
          <h1 className="text-3xl sm:text-5xl font-black text-white tracking-tight mb-4">
            RTechLab Terms of Service
          </h1>
          <p className="text-sm sm:text-base text-[#86868B] leading-relaxed max-w-2xl">
            Welcome to RTechLab (<strong className="text-white">rtechlab.vercel.app</strong>). By accessing our digital notes, tools, or purchasing educational materials, you agree to the following terms and conditions.
          </p>
        </div>

        {/* Terms Sections */}
        <div className="space-y-8 text-sm text-[#A1A1A6] leading-relaxed">
          
          {/* Section 1: License */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">01.</span>
              <span>Educational Use License</span>
            </h2>
            <p className="mb-3">
              When you purchase a <strong>Core Master Pass (₹49)</strong> or <strong>Career Accelerator Suite (₹149)</strong>, RTechLab grants you an individual, non-exclusive, non-transferable perpetual license for personal academic and professional learning.
            </p>
            <div className="p-3.5 rounded-xl bg-white/[0.03] border border-white/[0.06] text-xs">
              <strong className="text-white block mb-1">Permitted Activities:</strong>
              <ul className="list-disc list-inside space-y-1 text-[#D2D2D7]">
                <li>Downloading and reading the PDF files across your personal mobile phone, tablet, and computer.</li>
                <li>Printing physical A4 study copies for personal, offline revision.</li>
                <li>Using templates and interview vaults for your personal campus placement interviews.</li>
              </ul>
            </div>
          </div>

          {/* Section 2: Prohibited Conduct */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-red-500/20 bg-red-500/[0.02]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-red-400 font-mono text-sm">02.</span>
              <span>Prohibited Resale &amp; Piracy Restrictions</span>
            </h2>
            <p className="mb-3">
              All materials, vector diagrams, prompt libraries, and blueprints are original proprietary intellectual property protected under Indian and International Copyright Laws.
            </p>
            <ul className="list-disc list-inside space-y-1.5 text-xs sm:text-sm text-red-200/90">
              <li>You may NOT resell, sub-license, rent, or bundle our publications with third-party courses.</li>
              <li>You may NOT upload these PDFs to public document sharing networks (Scribd, Course Hero, Telegram pirated channels, or torrent repositories).</li>
              <li>Unauthorized commercial redistribution will result in immediate license termination and legal enforcement under the Copyright Act, 1957.</li>
            </ul>
          </div>

          {/* Section 3: Digital Delivery & Transparent Pricing */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">03.</span>
              <span>Instant Digital Delivery &amp; Transparent Pricing</span>
            </h2>
            <p className="mb-3">
              All prices shown (₹49 and ₹149) are transparent, one-time fees with <strong>zero recurring subscription charges</strong>.
            </p>
            <p>
              Upon successful payment verification via Razorpay, your download links are unlocked instantly on screen, and an official confirmation receipt is dispatched to your provided email address.
            </p>
          </div>

          {/* Section 4: Refund & Duplicate Payment Policy */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">04.</span>
              <span>Refund &amp; Duplicate Transaction Policy</span>
            </h2>
            <p className="mb-3">
              Because RTechLab provides immediate, full digital download access upon transaction completion, we offer comprehensive <strong>5-Page Interactive Free Previews</strong> on every card so students can inspect content before purchasing. Therefore, routine refunds for change of mind are not provided.
            </p>
            <p className="mb-2 text-white font-medium">
              However, you are 100% protected in any technical anomaly:
            </p>
            <ul className="list-disc list-inside space-y-1 text-xs text-[#D2D2D7]">
              <li>If you are accidentally charged twice for the same transaction, duplicate deductions are refunded within 24–48 hours.</li>
              <li>If you experience any delivery difficulty or lose your PDF file, email <strong className="text-emerald-400">rahul.28e1@gmail.com</strong> with your payment ID for immediate re-dispatch.</li>
            </ul>
          </div>

          {/* Section 5: Governing Law & Support */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">05.</span>
              <span>Governing Jurisdiction &amp; Legal Support</span>
            </h2>
            <p className="mb-3">
              These terms are governed by the laws of India. Any legal disputes shall be subject to the exclusive jurisdiction of the competent courts in Gujarat, India.
            </p>
            <div className="p-4 rounded-xl bg-white/[0.03] border border-white/[0.06] text-xs font-mono">
              <div className="text-white font-bold mb-1">Author &amp; Platform Publisher:</div>
              <div className="text-[#86868B]">Rahul Patel · Director &amp; Technical Lead</div>
              <div className="text-emerald-400 mt-1">Direct Inquiries: rahul.28e1@gmail.com</div>
              <div className="text-[#86868B] mt-0.5">Platform: rtechlab.vercel.app</div>
            </div>
          </div>

        </div>

      </div>
    </div>
  );
}

export default TermsPage;
