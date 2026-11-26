import os
import re

notes_path = 'app/pages/NotesPage.jsx'
with open(notes_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Clean up Hero section: Remove 4 noisy badges and clean title
old_hero_block = '''          <div className="inline-flex items-center justify-center gap-2 px-3.5 py-1.5 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-[11px] sm:text-xs font-mono text-emerald-400 mb-4 backdrop-blur-md shadow-lg shadow-emerald-500/5 max-w-full">
            <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse shrink-0" />
            <span className="truncate">⚡ 2027 OFFICIAL INDUSTRIAL EDITIONS · TRANSPARENT PRICING · NO SUBSCRIPTIONS</span>
          </div>
          <h1 className="text-3xl sm:text-5xl lg:text-6xl font-black text-white tracking-tight mb-3 sm:mb-4 leading-tight">
            Industrial Master Digital Notes
          </h1>
          <p className="text-[#86868B] text-xs sm:text-base max-w-2xl mx-auto leading-relaxed mb-6">
            Comprehensive, research-verified engineering handbooks designed for modern IT professionals, college students, and placement aspirants. Start with the core theory handbook at just <strong className="text-white">₹49</strong>, or unlock the complete <strong className="text-emerald-400">₹149 Career Accelerator Suite</strong> (+MNC Interview Vault, Practical Labs &amp; Salary Blueprint).
          </p>

          {/* Value Badges Centered */}
          <div className="flex flex-wrap items-center justify-center gap-2 text-[11px] sm:text-xs font-mono">
            <span className="px-3 py-1 rounded-full bg-white/[0.05] border border-white/10 text-white font-semibold">
              ✅ Core Master Pass @ ₹49 (Bilingual Theory Guide)
            </span>
            <span className="px-3 py-1 rounded-full bg-emerald-500/15 border border-emerald-500/30 text-emerald-300 font-bold">
              🔥 Career Accelerator Suite @ ₹149 (Complete Interview Vault + Labs + Blueprint)
            </span>
            <span className="px-3 py-1 rounded-full bg-cyan-500/10 border border-cyan-500/20 text-cyan-300">
              ⚡ Instant 1-Click Offline ZIP Downloads
            </span>
            <span className="px-3 py-1 rounded-full bg-purple-500/10 border border-purple-500/20 text-purple-300">
              📩 Rahul Sir Direct Mentorship &amp; Free Updates
            </span>
          </div>'''

new_hero_block = '''          <div className="inline-flex items-center justify-center gap-2 px-3 py-1 rounded-full bg-white/[0.05] border border-white/10 text-xs font-mono text-[#A1A1A6] mb-3">
            <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 shrink-0" />
            <span>RTechLab Official Publications · 2027 Reference Library</span>
          </div>
          <h1 className="text-2xl sm:text-4xl lg:text-5xl font-black text-white tracking-tight mb-3 leading-tight">
            Technical Study Handbooks &amp; Desk References
          </h1>
          <p className="text-[#86868B] text-xs sm:text-base max-w-2xl mx-auto leading-relaxed">
            Practical, zero-fluff study guides and quick desk cheat sheets in Hindi, English &amp; Gujarati. Direct offline PDFs with instant access on mobile &amp; laptop.
          </p>'''

assert old_hero_block in content, "old_hero_block not found!"
content = content.replace(old_hero_block, new_hero_block, 1)

# 2. Clean Segmented Switcher (Minimalist, Apple/Vercel style, NO glossy gradients)
# Let's replace the whole top-level switcher and section 1 with clean, matte layout
old_switcher_and_section1_regex = r'\{\/\* ── TOP-LEVEL DUAL STORE NAVIGATION SWITCHER ──[\s\S]*?\{\/\* ═══════════════════════════════════════════════════════════════════ \*\/\s*\{\/\* 📘 SECTION 2: RTECHLAB COMPREHENSIVE MASTER HANDBOOKS'

match = re.search(old_switcher_and_section1_regex, content)
assert match, "Could not find old_switcher_and_section1_regex!"

new_clean_switcher_and_section1 = '''{/* ── CLEAN MATTE STORE SWITCHER (NO GLOSSY GRADIENTS) ──────────── */}
        <div className="mt-8 mb-8 flex justify-center">
          <div className="inline-flex p-1 rounded-2xl bg-[#141417] border border-white/10 shadow-lg max-w-md w-full sm:w-auto">
            <button
              type="button"
              onClick={() => setActiveStoreTab('49')}
              className={`flex-1 sm:flex-initial py-2.5 px-4 sm:px-6 rounded-xl text-xs sm:text-sm font-semibold transition-all cursor-pointer flex items-center justify-center gap-2 ${
                activeStoreTab === '49'
                  ? 'bg-white text-black shadow-md font-bold'
                  : 'text-[#86868B] hover:text-white'
              }`}
            >
              <span>📘 Master Handbooks</span>
              <span className={`text-[10px] font-mono px-1.5 py-0.2 rounded ${
                activeStoreTab === '49' ? 'bg-black/10 text-black font-bold' : 'bg-white/5 text-[#86868B]'
              }`}>
                ₹49 / ₹149
              </span>
            </button>

            <button
              type="button"
              onClick={() => setActiveStoreTab('22')}
              className={`flex-1 sm:flex-initial py-2.5 px-4 sm:px-6 rounded-xl text-xs sm:text-sm font-semibold transition-all cursor-pointer flex items-center justify-center gap-2 ${
                activeStoreTab === '22'
                  ? 'bg-white text-black shadow-md font-bold'
                  : 'text-[#86868B] hover:text-white'
              }`}
            >
              <span>⚡ Desk Cheat Sheets</span>
              <span className={`text-[10px] font-mono px-1.5 py-0.2 rounded ${
                activeStoreTab === '22' ? 'bg-black/10 text-black font-bold' : 'bg-white/5 text-[#86868B]'
              }`}>
                ₹22
              </span>
            </button>
          </div>
        </div>

        {/* ═══════════════════════════════════════════════════════════════════ */}
        {/* ⚡ SECTION 1: CLEAN ₹22 DESK REFERENCE STORE                        */}
        {/* ═══════════════════════════════════════════════════════════════════ */}
        {activeStoreTab === '22' && (
          <div id="store-22" className="mb-12 animate-fadeIn">
            <div className="text-center max-w-2xl mx-auto mb-8">
              <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-white/[0.04] border border-white/[0.08] text-[11px] font-mono text-[#86868B] mb-2">
                <span className="w-1.5 h-1.5 rounded-full bg-amber-400" />
                <span>8-Page Quick Desk References · Print-Ready Laminated Guides</span>
              </div>
              <h2 className="text-xl sm:text-3xl font-bold text-white tracking-tight mb-2">
                Quick Desk References &amp; Cheat Sheets (@ ₹22)
              </h2>
              <p className="text-xs sm:text-sm text-[#86868B] leading-relaxed">
                Engineered for rapid memory recall while working on office tables or 10-minute interview revision. High-density summaries with zero fluff.
              </p>
            </div>

            {/* Grid of ₹22 Cheat Sheets (Equal, balanced cards) */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-5 max-w-5xl mx-auto">
              
              {/* Card 1: Tally Prime (Active Live Product) */}
              <div className="p-5 sm:p-6 rounded-2xl bg-[#0D0D10] border border-amber-500/40 flex flex-col justify-between shadow-lg hover:border-amber-400 transition-all">
                <div>
                  <div className="flex items-center justify-between mb-3">
                    <span className="text-[10px] font-mono text-amber-400 bg-amber-500/10 border border-amber-500/30 px-2 py-0.5 rounded font-bold">
                      ⚡ AVAILABLE NOW · ₹22
                    </span>
                    <span className="text-[11px] font-mono text-[#86868B]">8 Pages</span>
                  </div>

                  <h3 className="text-lg font-bold text-white mb-1 leading-snug">
                    Tally Prime 2027 Desk Reference &amp; Cheat Sheet
                  </h3>
                  <div className="text-xs text-[#A1A1A6] mb-3 leading-relaxed">
                    Golden Rules, 28 Master Groups (15 Primary + 13 Secondary), 24 Vouchers, Top 35 Hotkeys, Rule 46 GST &amp; CTS-2010 Cheque BRS.
                  </div>

                  <div className="space-y-1.5 p-3 rounded-xl bg-black/50 border border-white/5 text-[11px] font-mono text-[#D2D2D7] mb-4">
                    <div className="flex items-center gap-1.5">
                      <span className="text-amber-400">✓</span>
                      <span>Bestseller Cover &amp; Core Mission</span>
                    </div>
                    <div className="flex items-center gap-1.5">
                      <span className="text-amber-400">✓</span>
                      <span>All 28 Predefined Groups Divided</span>
                    </div>
                    <div className="flex items-center gap-1.5">
                      <span className="text-amber-400">✓</span>
                      <span>All 24 Vouchers with Ctrl+H Modes</span>
                    </div>
                    <div className="flex items-center gap-1.5">
                      <span className="text-amber-400">✓</span>
                      <span>Top 35 Hotkeys &amp; Year-End Audit</span>
                    </div>
                  </div>
                </div>

                <div className="pt-3 border-t border-white/[0.06] space-y-2.5">
                  <div className="flex items-baseline justify-between">
                    <div className="flex items-baseline gap-1.5">
                      <span className="text-2xl font-black text-white">₹22</span>
                      <span className="text-xs font-mono text-red-400 line-through">₹99</span>
                    </div>
                    <span className="text-[10px] font-mono text-emerald-400 font-semibold bg-emerald-500/10 px-2 py-0.5 rounded">
                      Hindi / Eng / ગુજ
                    </span>
                  </div>

                  <div className="grid grid-cols-2 gap-2">
                    <button
                      type="button"
                      onClick={() => {
                        const tallySub = SUBJECTS.find(s => s.id === 'tally');
                        if (tallySub) handleOpenPreviewModal(tallySub);
                      }}
                      className="py-2.5 px-2 rounded-xl bg-white/[0.05] hover:bg-white/10 text-white text-xs font-semibold text-center border border-white/10 transition-all active:scale-95 cursor-pointer"
                    >
                      📖 Sample
                    </button>
                    <button
                      type="button"
                      onClick={() => {
                        const tallySub = SUBJECTS.find(s => s.id === 'tally');
                        if (tallySub) handleDirectCheckout(tallySub, 'cheatsheet');
                      }}
                      className="py-2.5 px-2 rounded-xl bg-white hover:bg-zinc-200 text-black text-xs font-bold text-center transition-all shadow-md active:scale-95 cursor-pointer"
                    >
                      ⚡ Get for ₹22
                    </button>
                  </div>

                  <button
                    type="button"
                    onClick={() => setActiveStoreTab('49')}
                    className="w-full text-center text-[10px] font-mono text-[#86868B] hover:text-white pt-1 block"
                  >
                    Need Full 51p Master Book? View ₹49 Store →
                  </button>
                </div>
              </div>

              {/* Card 2: Cisco CCNA Hotkeys (Pipeline) */}
              <div className="p-5 sm:p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.06] flex flex-col justify-between opacity-80 hover:opacity-100 transition-all">
                <div>
                  <div className="flex items-center justify-between mb-3">
                    <span className="text-[10px] font-mono text-cyan-400 bg-cyan-500/10 border border-cyan-500/20 px-2 py-0.5 rounded font-bold">
                      IN PRODUCTION
                    </span>
                    <span className="text-[11px] font-mono text-[#86868B]">8 Pages</span>
                  </div>
                  <h3 className="text-lg font-bold text-white mb-1 leading-snug">
                    Cisco CCNA 200-301 Hotkeys &amp; Subnetting Matrix
                  </h3>
                  <div className="text-xs text-[#86868B] mb-3 leading-relaxed">
                    VLSM / CIDR Subnetting Cheat Wheel, Cisco IOS TAC Diagnostic Commands, OSPFv2 neighbor flow, and VLAN/Trunking shortcuts.
                  </div>
                </div>
                <div className="pt-3 border-t border-white/[0.06]">
                  <div className="flex items-center justify-between text-xs font-mono text-[#86868B]">
                    <span>Expected Price: ₹22</span>
                    <span className="text-cyan-400 text-[10px]">Coming Soon</span>
                  </div>
                </div>
              </div>

              {/* Card 3: Excel 365 Formulas (Pipeline) */}
              <div className="p-5 sm:p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.06] flex flex-col justify-between opacity-80 hover:opacity-100 transition-all">
                <div>
                  <div className="flex items-center justify-between mb-3">
                    <span className="text-[10px] font-mono text-blue-400 bg-blue-500/10 border border-blue-500/20 px-2 py-0.5 rounded font-bold">
                      IN PRODUCTION
                    </span>
                    <span className="text-[11px] font-mono text-[#86868B]">8 Pages</span>
                  </div>
                  <h3 className="text-lg font-bold text-white mb-1 leading-snug">
                    Microsoft Excel 365 Top 100 Formulas &amp; MIS Keys
                  </h3>
                  <div className="text-xs text-[#86868B] mb-3 leading-relaxed">
                    XLOOKUP, FILTER, UNIQUE, LET, Power Query M-functions, Pivot Table shortcuts, and corporate MIS reporting models.
                  </div>
                </div>
                <div className="pt-3 border-t border-white/[0.06]">
                  <div className="flex items-center justify-between text-xs font-mono text-[#86868B]">
                    <span>Expected Price: ₹22</span>
                    <span className="text-blue-400 text-[10px]">Coming Soon</span>
                  </div>
                </div>
              </div>

            </div>
          </div>
        )}

        {/* ═══════════════════════════════════════════════════════════════════ */}
        {/* 📘 SECTION 2: RTECHLAB COMPREHENSIVE MASTER HANDBOOKS'''

content = content[:match.start()] + new_clean_switcher_and_section1 + content[match.end():]

with open(notes_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Clean matte switcher and non-glossy section 1 injected successfully!")
