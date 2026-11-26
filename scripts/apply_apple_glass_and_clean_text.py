import re

notes_page_path = "app/pages/NotesPage.jsx"

with open(notes_page_path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Clean Hero Section (Remove redundant price badges and simplify paragraph)
hero_target_start = '{/* ── Page Header ────────────────────────────────────────────── */}'
hero_target_end = '{/* ── TOP-LEVEL CLEAN MATTE SEGMENTED STORE CONTROLLER ──────────────────── */}'

hero_start_idx = content.find(hero_target_start)
hero_end_idx = content.find(hero_target_end)

assert hero_start_idx != -1, "hero_target_start not found!"
assert hero_end_idx != -1, "hero_target_end not found!"

new_hero = """{/* ── Page Header ────────────────────────────────────────────── */}
        <div className="text-center max-w-3xl mx-auto mb-8 sm:mb-10">
          <div className="inline-flex items-center justify-center gap-2 px-3 py-1 rounded-full bg-white/[0.04] border border-white/[0.08] text-[11px] sm:text-xs font-mono text-zinc-300 mb-3 backdrop-blur-md">
            <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse shrink-0" />
            <span>⚡ 2027 Production-Verified Engineering &amp; Accounts Notes</span>
          </div>
          <h1 className="text-3xl sm:text-5xl font-black text-white tracking-tight mb-3 leading-tight">
            Industrial Master Digital Notes
          </h1>
          <p className="text-zinc-400 text-xs sm:text-sm max-w-xl mx-auto leading-relaxed">
            Concise, research-verified technical handbooks and quick desk cheat sheets. Designed for fast workplace lookup, college exams, and placement preparation.
          </p>
        </div>

        """

content = content[:hero_start_idx] + new_hero + content[hero_end_idx:]
print("Hero cleaned successfully!")

# 2. Apple-Style Frosted Glass Segmented Control & Clean Section 1
switcher_start_marker = "{/* ── TOP-LEVEL CLEAN MATTE SEGMENTED STORE CONTROLLER ──────────────────── */}"
switcher_end_marker = "{/* 📘 SECTION 2: RTECHLAB COMPREHENSIVE MASTER HANDBOOKS (@ ₹49)       */}"

sw_start_idx = content.find(switcher_start_marker)
sw_end_idx = content.find(switcher_end_marker)

assert sw_start_idx != -1, "switcher_start_marker not found!"
assert sw_end_idx != -1, "switcher_end_marker not found!"

new_switcher_and_section1 = """{/* ── APPLE FROSTED GLASS SEGMENTED CONTROLLER ──────────────────── */}
        <div className="sticky top-16 z-30 mb-10 max-w-md mx-auto px-4">
          <div className="p-1 rounded-full bg-zinc-900/60 backdrop-blur-2xl border border-white/10 shadow-[0_8px_32px_rgba(0,0,0,0.5),inset_0_1px_1px_rgba(255,255,255,0.1)] grid grid-cols-3 gap-1">
            
            {/* Tab 1: ₹22 Quick Desk Sheets */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('22')}
              className={`py-2 px-3 rounded-full text-xs font-semibold transition-all cursor-pointer flex items-center justify-center gap-1.5 ${
                activeStoreTab === '22'
                  ? 'bg-white text-black shadow-md'
                  : 'text-zinc-400 hover:text-white hover:bg-white/[0.05]'
              }`}
            >
              <span>⚡ ₹22 Sheets</span>
            </button>

            {/* Tab 2: ₹49 Master Handbooks Store (with ₹149 Suites) */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('49')}
              className={`py-2 px-3 rounded-full text-xs font-semibold transition-all cursor-pointer flex items-center justify-center gap-1.5 ${
                activeStoreTab === '49'
                  ? 'bg-white text-black shadow-md'
                  : 'text-zinc-400 hover:text-white hover:bg-white/[0.05]'
              }`}
            >
              <span>📘 ₹49 Books</span>
            </button>

            {/* Tab 3: All Products */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('all')}
              className={`py-2 px-3 rounded-full text-xs font-semibold transition-all cursor-pointer flex items-center justify-center gap-1.5 ${
                activeStoreTab === 'all'
                  ? 'bg-white text-black shadow-md'
                  : 'text-zinc-400 hover:text-white hover:bg-white/[0.05]'
              }`}
            >
              <span>🌐 All (7)</span>
            </button>

          </div>
        </div>

        {/* ═══════════════════════════════════════════════════════════════════ */}
        {/* ⚡ SECTION 1: RTECHLAB ₹22 QUICK DESK REFERENCE STORE              */}
        {/* ═══════════════════════════════════════════════════════════════════ */}
        {(activeStoreTab === '22' || activeStoreTab === 'all') && (
          <div id="store-22" className="mb-12 scroll-mt-20">
            {/* Minimal Header */}
            <div className="flex items-center justify-between mb-3 px-1">
              <div className="flex items-center gap-2">
                <span className="text-sm font-bold text-white tracking-tight">⚡ 8-Page Desk Cheat Sheets</span>
                <span className="text-[10px] font-mono px-2 py-0.5 rounded-full bg-amber-400/10 text-amber-300 border border-amber-400/20">
                  Instant ₹22
                </span>
              </div>
              <span className="text-[11px] font-mono text-zinc-500 hidden sm:inline">
                Office &amp; Interview Essentials
              </span>
            </div>

            {/* Apple-style Frosted Single Card (Zero nested boxes!) */}
            <div className="p-5 sm:p-6 rounded-2xl bg-zinc-900/40 backdrop-blur-xl border border-white/[0.08] hover:border-white/20 transition-all shadow-xl">
              <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-5">
                
                {/* Left: Clean Content */}
                <div className="space-y-2">
                  <div className="flex items-center gap-2">
                    <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-zinc-800 text-zinc-300 font-semibold border border-zinc-700">
                      8-Page Desk Sheet
                    </span>
                    <span className="text-[10px] font-mono text-zinc-400">
                      Hindi · English · Gujarati
                    </span>
                    <span className="text-[10px] font-mono text-amber-300 bg-amber-500/10 px-2 py-0.5 rounded border border-amber-500/20 hidden sm:inline">
                      Tally Certified Trainer (TCT)
                    </span>
                  </div>

                  <h3 className="text-lg sm:text-2xl font-bold text-white tracking-tight">
                    Tally Prime 2027 Quick Desk Reference &amp; Cheat Sheet
                  </h3>

                  <p className="text-xs sm:text-sm text-zinc-400 max-w-xl leading-relaxed">
                    Golden Rules, 28 Groups, 24 Vouchers, Rule 46 GST, Cheque BRS &amp; Top 35 Hotkeys. Authored by <strong>Rahul Patel</strong> (IANT Palanpur · 10+ Yrs IT Exp).
                  </p>

                  <div className="pt-1">
                    <button
                      type="button"
                      onClick={() => {
                        const tallySub = SUBJECTS.find(s => s.id === 'tally');
                        if (tallySub) handleOpenPreviewModal(tallySub);
                      }}
                      className="inline-flex items-center gap-1.5 text-xs font-semibold text-zinc-300 hover:text-white underline cursor-pointer"
                    >
                      <span>📖 Preview 5-Page Sample &amp; Detailed Index →</span>
                    </button>
                  </div>
                </div>

                {/* Right: Clean Price & Action */}
                <div className="lg:w-56 shrink-0 pt-3 lg:pt-0 lg:border-l lg:border-white/10 lg:pl-6 flex flex-col justify-center">
                  <div className="flex items-baseline gap-2 mb-2">
                    <span className="text-2xl sm:text-3xl font-black text-white">₹22</span>
                    <span className="text-xs font-mono text-zinc-500 line-through">₹99</span>
                    <span className="text-[10px] font-mono text-emerald-400 font-bold bg-emerald-500/10 px-1.5 py-0.5 rounded">
                      78% OFF
                    </span>
                  </div>

                  <button
                    type="button"
                    onClick={() => {
                      const tallySub = SUBJECTS.find(s => s.id === 'tally');
                      if (tallySub) handleDirectCheckout(tallySub, 'cheatsheet');
                    }}
                    className="w-full py-2.5 px-4 rounded-xl bg-white hover:bg-zinc-200 text-black text-xs font-bold transition-all shadow-md active:scale-95 cursor-pointer flex items-center justify-center gap-1.5"
                  >
                    <span>⚡ Get ₹22 Sheet</span>
                    <span>→</span>
                  </button>

                  <button
                    type="button"
                    onClick={() => setActiveStoreTab('49')}
                    className="text-[11px] font-mono text-zinc-500 hover:text-zinc-300 text-center mt-2 cursor-pointer"
                  >
                    Need Full 51p Book? (₹49) →
                  </button>
                </div>

              </div>

              {/* Minimal Upcoming Strip */}
              <div className="mt-4 pt-3 border-t border-white/[0.06] flex flex-wrap items-center justify-between gap-2 text-[11px] font-mono text-zinc-500">
                <span>Coming Soon @ ₹22: CCNA Hotkeys · Excel 365 Formulas · Server 2025 Commands</span>
                <span className="text-zinc-400 font-semibold">Weekly Releases</span>
              </div>
            </div>
          </div>
        )}

        """

content = content[:sw_start_idx] + new_switcher_and_section1 + content[sw_end_idx:]
print("Replaced switcher with Apple Frosted Glass and cleaned Section 1!")

# 3. Simplify Section 2 Header
s2_header_old = """          <div className="text-center max-w-2xl mx-auto mb-8 sm:mb-10">
            <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-white/[0.04] border border-white/[0.08] text-[11px] font-mono text-[#86868B] mb-2.5">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-400" />
              <span>6 Industry Placement Tracks Available</span>
            </div>
            <h2 className="text-2xl sm:text-4xl font-black text-white tracking-tight mb-2">
              Select Your Subject Notes
            </h2>
            <p className="text-xs sm:text-sm text-[#86868B] leading-relaxed mx-auto max-w-xl">
              Inspect syllabus topics, read real 5-page interactive previews, and choose between the ₹49 Core Pass or the ₹149 Executive Career Suite.
            </p>"""

s2_header_new = """          <div className="text-center max-w-2xl mx-auto mb-6">
            <h2 className="text-xl sm:text-3xl font-black text-white tracking-tight mb-1.5">
              📘 51-Page Master Handbooks (@ ₹49) &amp; Career Suites (@ ₹149)
            </h2>
            <p className="text-xs sm:text-sm text-zinc-400 leading-relaxed mx-auto max-w-lg">
              Comprehensive theory &amp; architectures. Tap any track below to preview real sample pages.
            </p>"""

if s2_header_old in content:
    content = content.replace(s2_header_old, s2_header_new)
    print("Section 2 header simplified successfully!")
else:
    print("Could not find exact s2_header_old")

with open(notes_page_path, "w", encoding="utf-8") as f:
    f.write(content)

print("NotesPage.jsx updated with Apple Frosted Glass & ultra-clean layout!")
