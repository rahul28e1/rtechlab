notes_page_path = "app/pages/NotesPage.jsx"

with open(notes_page_path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Update the Apple Frosted Glass Switcher & Section 1 to be Transparent Glass & Center-Aligned
start_marker = "{/* ── APPLE FROSTED GLASS SEGMENTED CONTROLLER ──────────────────── */}"
end_marker = "{/* 📘 SECTION 2: RTECHLAB COMPREHENSIVE MASTER HANDBOOKS (@ ₹49)       */}"

start_idx = content.find(start_marker)
end_idx = content.find(end_marker)

assert start_idx != -1, "start_marker not found!"
assert end_idx != -1, "end_marker not found!"

new_switcher_and_s1 = """{/* ── APPLE TRANSPARENT FROSTED GLASS SEGMENTED CONTROLLER ──────────────────── */}
        <div className="sticky top-16 z-30 mb-10 max-w-md mx-auto px-4">
          <div className="p-1 rounded-full bg-white/[0.04] backdrop-blur-2xl border border-white/[0.12] shadow-[0_8px_32px_rgba(0,0,0,0.5),inset_0_1px_1px_rgba(255,255,255,0.15)] grid grid-cols-3 gap-1">
            
            {/* Tab 1: ₹22 Quick Desk Sheets */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('22')}
              className={`py-2 px-3 rounded-full text-xs font-semibold transition-all cursor-pointer flex items-center justify-center gap-1.5 ${
                activeStoreTab === '22'
                  ? 'bg-white/20 backdrop-blur-xl text-white font-bold border border-white/30 shadow-[inset_0_1px_1px_rgba(255,255,255,0.35),0_4px_16px_rgba(0,0,0,0.3)]'
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
                  ? 'bg-white/20 backdrop-blur-xl text-white font-bold border border-white/30 shadow-[inset_0_1px_1px_rgba(255,255,255,0.35),0_4px_16px_rgba(0,0,0,0.3)]'
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
                  ? 'bg-white/20 backdrop-blur-xl text-white font-bold border border-white/30 shadow-[inset_0_1px_1px_rgba(255,255,255,0.35),0_4px_16px_rgba(0,0,0,0.3)]'
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
            {/* Minimal Centered Header */}
            <div className="text-center mb-4">
              <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full bg-white/[0.04] backdrop-blur-xl border border-white/[0.1] text-xs font-mono text-zinc-300">
                <span>⚡ 8-Page Desk Cheat Sheets</span>
                <span className="w-1 h-1 rounded-full bg-amber-400" />
                <span className="text-amber-300 font-bold">Instant ₹22</span>
              </div>
            </div>

            {/* Apple-style Frosted Single Card - Middle / Center Aligned */}
            <div className="p-6 sm:p-8 rounded-3xl bg-white/[0.03] backdrop-blur-2xl border border-white/[0.1] hover:border-white/20 transition-all shadow-2xl text-center max-w-3xl mx-auto">
              
              {/* Badges Centered */}
              <div className="flex items-center justify-center gap-2 flex-wrap mb-3">
                <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.06] text-zinc-200 font-semibold border border-white/10">
                  8-Page Desk Sheet
                </span>
                <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-zinc-400 border border-white/5">
                  Hindi · English · Gujarati
                </span>
                <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-amber-400/10 text-amber-300 border border-amber-400/20">
                  Tally Certified Trainer (TCT)
                </span>
              </div>

              {/* Title & Subtitle Centered */}
              <h3 className="text-xl sm:text-3xl font-bold text-white tracking-tight mb-2 text-center">
                Tally Prime 2027 Quick Desk Reference &amp; Cheat Sheet
              </h3>

              <p className="text-xs sm:text-sm text-zinc-400 max-w-xl mx-auto leading-relaxed mb-4 text-center">
                Golden Rules, 28 Groups, 24 Vouchers, Rule 46 GST, Cheque BRS &amp; Top 35 Hotkeys. Authored by <strong>Rahul Patel</strong> (IANT Palanpur · 10+ Yrs IT Exp).
              </p>

              {/* Centered Sample Button */}
              <div className="mb-6 text-center">
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

              {/* Centered Price & Buy Action */}
              <div className="flex flex-col items-center justify-center max-w-xs mx-auto text-center">
                <div className="flex items-baseline justify-center gap-2 mb-2.5">
                  <span className="text-3xl sm:text-4xl font-black text-white">₹22</span>
                  <span className="text-sm font-mono text-zinc-500 line-through">₹99</span>
                  <span className="text-[10px] font-mono text-emerald-400 font-bold bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
                    78% OFF
                  </span>
                </div>

                <button
                  type="button"
                  onClick={() => {
                    const tallySub = SUBJECTS.find(s => s.id === 'tally');
                    if (tallySub) handleDirectCheckout(tallySub, 'cheatsheet');
                  }}
                  className="w-full py-3 px-6 rounded-full bg-white hover:bg-zinc-200 text-black text-sm font-bold transition-all shadow-lg active:scale-95 cursor-pointer flex items-center justify-center gap-1.5"
                >
                  <span>⚡ Get ₹22 Sheet</span>
                  <span>→</span>
                </button>

                <button
                  type="button"
                  onClick={() => setActiveStoreTab('49')}
                  className="text-xs font-mono text-zinc-500 hover:text-zinc-300 text-center mt-2.5 cursor-pointer"
                >
                  Need Full 51p Book? (₹49) →
                </button>
              </div>

              {/* Minimal Upcoming Strip Centered */}
              <div className="mt-6 pt-4 border-t border-white/[0.06] flex flex-wrap items-center justify-center gap-3 text-[11px] font-mono text-zinc-500">
                <span>Coming Soon @ ₹22: CCNA Hotkeys · Excel 365 Formulas · Server 2025 Commands</span>
                <span className="text-zinc-400 font-semibold">• Weekly Releases</span>
              </div>
            </div>
          </div>
        )}

        """

content = content[:start_idx] + new_switcher_and_s1 + content[end_idx:]
print("Updated switcher to Apple transparent frosted glass and centered Section 1 card!")

# 2. Center-align the Subject Cards in Section 2
old_card_content = """                <div>
                  {/* Header Track Tag & Status Badges */}
                  <div className="flex items-center justify-between mb-3.5">
                    <span className="text-[10px] font-mono text-white/50 font-bold px-2 py-0.5 rounded bg-white/[0.04] border border-white/[0.06]">
                      TRACK #{index + 1}
                    </span>
                    <span className={`text-[10px] font-mono font-bold px-2.5 py-0.5 rounded-full border ${
                      sub.id === 'server2025'
                        ? 'bg-sky-500/15 text-sky-300 border-sky-500/30'
                        : sub.id === 'ai'
                        ? 'bg-purple-500/15 text-purple-300 border-purple-500/30'
                        : sub.id === 'office-365'
                        ? 'bg-blue-500/15 text-blue-300 border-blue-500/30'
                        : sub.id === 'fundamentals'
                        ? 'bg-emerald-500/15 text-emerald-300 border-emerald-500/30'
                        : sub.id === 'tally'
                        ? 'bg-amber-500/15 text-amber-300 border-amber-500/30'
                        : 'bg-cyan-500/15 text-cyan-300 border-cyan-500/30'
                    }`}>
                      {sub.badge}
                    </span>
                  </div>

                  {/* Title & Description Clean & Scannable */}
                  <div className="mb-3">
                    <h3 className="text-base sm:text-lg font-bold text-white mb-1 group-hover:text-emerald-400 transition-colors leading-snug">
                      {sub.title}
                    </h3>
                    <p className="text-xs text-zinc-400 line-clamp-2 leading-relaxed mb-3">
                      {sub.subtitle}
                    </p>

                      {/* Quick Specs Pill */}
                      <div className="flex items-center justify-between text-[11px] font-mono p-2 rounded-lg bg-zinc-950 border border-zinc-800/80 text-zinc-400 mb-2.5">
                        <span>📄 {sub.pages.includes('Pages') ? sub.pages.split('Pages')[0] + 'Pages' : sub.pages}</span>
                        <span>🌐 Hindi · Eng · ગુજ</span>
                      </div>

                    {/* Progressive Disclosure: Tap to View Full Syllabus & Sample */}
                    <button
                      type="button"
                      onClick={() => handleOpenPreviewModal(sub)}
                      className="w-full py-2 px-3 rounded-lg bg-zinc-900/80 hover:bg-zinc-800 text-zinc-300 hover:text-white border border-zinc-800 text-xs font-medium transition-colors flex items-center justify-between group/btn cursor-pointer"
                    >
                      <span className="flex items-center gap-1.5 truncate">
                        <span>📖</span>
                        <span className="truncate">View Syllabus &amp; 5p Sample</span>
                      </span>
                      <span className="text-zinc-500 group-hover/btn:text-white font-mono text-[11px] shrink-0">Details →</span>
                    </button>
                  </div>
                </div>

                <div className="space-y-2.5 pt-3 border-t border-white/[0.06]">
                  {/* Uniform Price Tag: ₹49 Core Master Pass vs ₹149 Career Suite */}
                  <div className="flex items-baseline justify-between p-2.5 rounded-xl bg-white/[0.02] border border-white/[0.05]">
                    <div>
                      <div className="text-[9px] font-mono text-[#86868B] uppercase tracking-wider font-semibold">
                        Core Master Pass
                      </div>
                      <div className="flex items-baseline gap-1.5 mt-0.5">
                        <span className="text-xl sm:text-2xl font-black text-white">₹49</span>
                        <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                          ₹199
                        </span>
                      </div>
                    </div>
                    <div className="text-right">
                      <div className="text-[9px] font-mono text-emerald-400 uppercase tracking-wider font-bold">
                        👑 Executive Suite
                      </div>
                      <div className="flex items-baseline justify-end gap-1.5 mt-0.5">
                        <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                          ₹1,099
                        </span>
                        <span className="text-xl sm:text-2xl font-black text-emerald-400">₹149</span>
                      </div>
                    </div>
                  </div>"""

new_card_content = """                <div className="text-center">
                  {/* Header Track Tag & Status Badges Centered */}
                  <div className="flex items-center justify-center gap-2 mb-3">
                    <span className="text-[10px] font-mono text-white/50 font-bold px-2 py-0.5 rounded bg-white/[0.04] border border-white/[0.06]">
                      TRACK #{index + 1}
                    </span>
                    <span className={`text-[10px] font-mono font-bold px-2.5 py-0.5 rounded-full border ${
                      sub.id === 'server2025'
                        ? 'bg-sky-500/15 text-sky-300 border-sky-500/30'
                        : sub.id === 'ai'
                        ? 'bg-purple-500/15 text-purple-300 border-purple-500/30'
                        : sub.id === 'office-365'
                        ? 'bg-blue-500/15 text-blue-300 border-blue-500/30'
                        : sub.id === 'fundamentals'
                        ? 'bg-emerald-500/15 text-emerald-300 border-emerald-500/30'
                        : sub.id === 'tally'
                        ? 'bg-amber-500/15 text-amber-300 border-amber-500/30'
                        : 'bg-cyan-500/15 text-cyan-300 border-cyan-500/30'
                    }`}>
                      {sub.badge}
                    </span>
                  </div>

                  {/* Title & Description Clean & Center-Aligned */}
                  <div className="mb-3 text-center">
                    <h3 className="text-base sm:text-lg font-bold text-white mb-1 group-hover:text-emerald-400 transition-colors leading-snug text-center">
                      {sub.title}
                    </h3>
                    <p className="text-xs text-zinc-400 line-clamp-2 leading-relaxed mb-3 text-center mx-auto max-w-xs">
                      {sub.subtitle}
                    </p>

                    {/* Quick Specs Pill Centered */}
                    <div className="flex items-center justify-center gap-3 text-[11px] font-mono p-2 rounded-lg bg-zinc-950 border border-zinc-800/80 text-zinc-400 mb-2.5 text-center">
                      <span>📄 {sub.pages.includes('Pages') ? sub.pages.split('Pages')[0] + 'Pages' : sub.pages}</span>
                      <span>•</span>
                      <span>🌐 Hindi · Eng · ગુજ</span>
                    </div>

                    {/* Progressive Disclosure: Tap to View Full Syllabus & Sample Centered */}
                    <button
                      type="button"
                      onClick={() => handleOpenPreviewModal(sub)}
                      className="w-full py-2 px-3 rounded-lg bg-zinc-900/80 hover:bg-zinc-800 text-zinc-300 hover:text-white border border-zinc-800 text-xs font-medium transition-colors flex items-center justify-center gap-1.5 group/btn cursor-pointer text-center"
                    >
                      <span>📖</span>
                      <span className="font-semibold">View 10 Chapters &amp; 5p Sample</span>
                      <span className="text-zinc-500 group-hover/btn:text-white font-mono text-[11px]">→</span>
                    </button>
                  </div>
                </div>

                <div className="space-y-2.5 pt-3 border-t border-white/[0.06]">
                  {/* Uniform Price Tag Centered: ₹49 Core Master Pass vs ₹149 Career Suite */}
                  <div className="flex items-center justify-around p-2.5 rounded-xl bg-white/[0.02] border border-white/[0.05] text-center">
                    <div className="text-center">
                      <div className="text-[9px] font-mono text-[#86868B] uppercase tracking-wider font-semibold">
                        Core Master Pass
                      </div>
                      <div className="flex items-baseline justify-center gap-1.5 mt-0.5">
                        <span className="text-xl sm:text-2xl font-black text-white">₹49</span>
                        <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                          ₹199
                        </span>
                      </div>
                    </div>
                    <div className="w-[1px] h-8 bg-white/10" />
                    <div className="text-center">
                      <div className="text-[9px] font-mono text-emerald-400 uppercase tracking-wider font-bold">
                        👑 Executive Suite
                      </div>
                      <div className="flex items-baseline justify-center gap-1.5 mt-0.5">
                        <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                          ₹1,099
                        </span>
                        <span className="text-xl sm:text-2xl font-black text-emerald-400">₹149</span>
                      </div>
                    </div>
                  </div>"""

assert old_card_content in content, "old_card_content not found!"
content = content.replace(old_card_content, new_card_content)
print("Section 2 cards center-aligned successfully!")

with open(notes_page_path, "w", encoding="utf-8") as f:
    f.write(content)

print("NotesPage.jsx fully updated with Apple transparent frosted glass & middle alignment!")
