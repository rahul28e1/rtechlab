import React from 'react';
import { Link } from 'react-router';
import { ShieldCheck, Lock, EyeOff, FileText, CheckCircle2, AlertCircle } from 'lucide-react';

export function PrivacyPage() {
  return (
    <div className="min-h-screen bg-black text-[#EDEDED] py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-4xl mx-auto">
        
        {/* Breadcrumb Navigation */}
        <nav className="mb-6 flex items-center gap-1.5 text-xs font-mono text-[#86868B]">
          <Link to="/" className="hover:text-white transition-colors">Home</Link>
          <span>/</span>
          <Link to="/about" className="hover:text-white transition-colors">About</Link>
          <span>/</span>
          <span className="text-emerald-400">Privacy Policy</span>
        </nav>

        {/* Header */}
        <div className="mb-10 pb-8 border-b border-white/[0.08]">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-xs font-mono text-emerald-400 mb-3">
            <Lock className="w-3.5 h-3.5 text-emerald-400" />
            <span>Student Privacy Commitment · DPDP Act 2023 Compliant</span>
          </div>
          <h1 className="text-3xl sm:text-5xl font-black text-white tracking-tight mb-4">
            RTechLab Privacy Policy
          </h1>
          <p className="text-sm sm:text-base text-[#86868B] leading-relaxed max-w-2xl">
            Last Updated: November 2026. This policy outlines how RTechLab ("we", "our", or "platform" at <strong className="text-white">rtechlab.vercel.app</strong>) collects, protects, and handles student information.
          </p>
        </div>

        {/* Content Sections */}
        <div className="space-y-8 text-sm text-[#A1A1A6] leading-relaxed">
          
          {/* Section 1: Data Collection */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">01.</span>
              <span>Information We Collect</span>
            </h2>
            <p className="mb-3">
              We collect only the minimal information strictly required to deliver your educational products, process receipts, and provide lifetime PDF updates:
            </p>
            <ul className="space-y-2 list-disc list-inside text-xs sm:text-sm text-[#D2D2D7]">
              <li><strong>Student Name &amp; Email Address:</strong> Used to generate your official payment receipt, dispatch PDF download access links, and verify mentorship communications.</li>
              <li><strong>Optional WhatsApp Mobile Number:</strong> Used solely as an alternative receipt delivery backup if an email bounces.</li>
              <li><strong>Anonymous Technical Telemetry:</strong> Standard web server logs (browser type, operating system, anonymous page visits) via privacy-preserving analytics to optimize platform performance.</li>
            </ul>
          </div>

          {/* Section 2: Zero Financial Data Stored */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-emerald-500/30 bg-emerald-500/[0.02]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">02.</span>
              <span>100% Secure Payments (Zero Financial Data Stored)</span>
            </h2>
            <p className="mb-3">
              RTechLab does <strong className="text-white">NOT</strong> store, process, or have access to your credit card numbers, debit card details, CVV codes, net banking passwords, or UPI PINs.
            </p>
            <p className="text-xs sm:text-sm text-[#D2D2D7]">
              All monetary transactions are processed through <strong className="text-emerald-400">Razorpay Software Private Limited</strong>, an RBI-authorized, PCI-DSS Level 1 certified payment aggregator using 256-bit cryptographic SSL encryption.
            </p>
          </div>

          {/* Section 3: Absolute Prohibition on Selling Data */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">03.</span>
              <span>No Spam &amp; No Data Selling Guarantee</span>
            </h2>
            <p className="mb-3">
              We respect your inbox. RTechLab will never sell, rent, lease, or monetize student contact information to third-party advertisers, telemarketing agencies, or commercial coaching institutes.
            </p>
            <p className="text-xs text-[#86868B]">
              Any emails you receive from us will be strictly related to your purchased course updates, revision additions, or direct mentorship responses from Founder Rahul Patel.
            </p>
          </div>

          {/* Section 4: Cookies & Storage */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">04.</span>
              <span>Local Storage &amp; Cookies</span>
            </h2>
            <p>
              We utilize browser local storage strictly to preserve your offline tool calculation states (such as Subnet Calculator progress, Chmod analyzer values, and dark mode preferences) and to retain your unlocked purchase session so you can re-download your materials without friction.
            </p>
          </div>

          {/* Section 5: Student Rights & Contact */}
          <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
            <h2 className="text-lg font-bold text-white mb-3 flex items-center gap-2">
              <span className="text-emerald-400 font-mono text-sm">05.</span>
              <span>Your Data Rights &amp; Privacy Contact</span>
            </h2>
            <p className="mb-3">
              Under India's Digital Personal Data Protection (DPDP) Act 2023, you have the full right to access your stored records or request complete deletion of your registration profile.
            </p>
            <div className="p-4 rounded-xl bg-white/[0.03] border border-white/[0.06] text-xs font-mono">
              <div className="text-white font-bold mb-1">Official Privacy Officer:</div>
              <div className="text-[#86868B]">Rahul Patel · Founder &amp; Lead Architect</div>
              <div className="text-emerald-400 mt-1">Direct Contact: rahul.28e1@gmail.com</div>
              <div className="text-[#86868B] mt-0.5">Platform: rtechlab.vercel.app</div>
            </div>
          </div>

        </div>

      </div>
    </div>
  );
}

export default PrivacyPage;
