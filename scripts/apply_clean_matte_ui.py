import re

notes_page_path = "app/pages/NotesPage.jsx"

with open(notes_page_path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Clean Value Badges
old_value_badges = """          {/* Value Badges Centered */}
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
          </div>"""

new_value_badges = """          {/* Clean Subtle Value Badges */}
          <div className="flex flex-wrap items-center justify-center gap-2 text-[11px] font-mono">
            <span className="px-3 py-1 rounded-full bg-white/[0.03] border border-white/[0.08] text-zinc-300">
              📘 Core Master Pass @ ₹49
            </span>
            <span className="px-3 py-1 rounded-full bg-white/[0.03] border border-white/[0.08] text-zinc-300">
              ⚡ 8-Page Desk Sheet @ ₹22
            </span>
            <span className="px-3 py-1 rounded-full bg-white/[0.03] border border-white/[0.08] text-zinc-300">
              👑 Career Suite @ ₹149
            </span>
            <span className="px-3 py-1 rounded-full bg-white/[0.03] border border-white/[0.08] text-zinc-400">
              📩 Direct Mentorship &amp; Updates
            </span>
          </div>"""

if old_value_badges in content:
    content = content.replace(old_value_badges, new_value_badges)
    print("Replaced value badges successfully!")
else:
    print("Could not find exact old_value_badges")

# 2. Clean Matte Segmented Switcher & Section 1 Replacement
# Find from "{/* ── TOP-LEVEL DUAL STORE NAVIGATION SWITCHER ──────────────────── */}"
# down to the start of Section 2: "{/* 📘 SECTION 2: RTECHLAB COMPREHENSIVE MASTER HANDBOOKS (@ ₹49)       */}"

start_marker = "{/* ── TOP-LEVEL DUAL STORE NAVIGATION SWITCHER ──────────────────── */}"
end_marker = "{/* 📘 SECTION 2: RTECHLAB COMPREHENSIVE MASTER HANDBOOKS (@ ₹49)       */}"

start_idx = content.find(start_marker)
end_idx = content.find(end_marker)

assert start_idx != -1, "start_marker not found!"
assert end_idx != -1, "end_marker not found!"

new_segmented_and_section1 = """{/* ── TOP-LEVEL CLEAN MATTE SEGMENTED STORE CONTROLLER ──────────────────── */}
        <div className="mb-10 max-w-xl mx-auto px-2">
          <div className="p-1 rounded-xl bg-zinc-900/90 border border-zinc-800 shadow-sm grid grid-cols-3 gap-1">
            
            {/* Tab 1: ₹22 Quick Desk Sheets */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('22')}
              className={`py-2 px-2.5 rounded-lg text-center transition-all cursor-pointer flex flex-col sm:flex-row items-center justify-center gap-1.5 ${
                activeStoreTab === '22'
                  ? 'bg-zinc-800 text-white font-semibold shadow-sm border border-zinc-700/80'
                  : 'text-zinc-400 hover:text-white hover:bg-white/[0.02]'
              }`}
            >
              <span className="text-xs sm:text-sm font-semibold tracking-tight">⚡ ₹22 Desk Store</span>
              <span className={`text-[9px] font-mono px-1.5 py-0.5 rounded ${
                activeStoreTab === '22'
                  ? 'bg-amber-400/15 text-amber-300 font-bold'
                  : 'text-zinc-500'
              }`}>
                8-Page
              </span>
            </button>

            {/* Tab 2: ₹49 Master Handbooks Store (with ₹149 Suites) */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('49')}
              className={`py-2 px-2.5 rounded-lg text-center transition-all cursor-pointer flex flex-col sm:flex-row items-center justify-center gap-1.5 ${
                activeStoreTab === '49'
                  ? 'bg-zinc-800 text-white font-semibold shadow-sm border border-zinc-700/80'
                  : 'text-zinc-400 hover:text-white hover:bg-white/[0.02]'
              }`}
            >
              <span className="text-xs sm:text-sm font-semibold tracking-tight">📘 ₹49 Master Store</span>
              <span className={`text-[9px] font-mono px-1.5 py-0.5 rounded ${
                activeStoreTab === '49'
                  ? 'bg-emerald-400/15 text-emerald-300 font-bold'
                  : 'text-zinc-500'
              }`}>
                + ₹149
              </span>
            </button>

            {/* Tab 3: All Products */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('all')}
              className={`py-2 px-2.5 rounded-lg text-center transition-all cursor-pointer flex items-center justify-center gap-1.5 ${
                activeStoreTab === 'all'
                  ? 'bg-zinc-800 text-white font-semibold shadow-sm border border-zinc-700/80'
                  : 'text-zinc-400 hover:text-white hover:bg-white/[0.02]'
              }`}
            >
              <span className="text-xs sm:text-sm font-semibold">🌐 All Library</span>
              <span className="text-[10px] font-mono text-zinc-500">(7)</span>
            </button>

          </div>
        </div>

        {/* ═══════════════════════════════════════════════════════════════════ */}
        {/* ⚡ SECTION 1: RTECHLAB ₹22 QUICK DESK REFERENCE STORE              */}
        {/* ═══════════════════════════════════════════════════════════════════ */}
        {(activeStoreTab === '22' || activeStoreTab === 'all') && (
          <div id="store-22" className="mb-12 scroll-mt-20">
            {/* Clean Matte Store Header Box */}
            <div className="p-5 sm:p-6 rounded-2xl bg-zinc-950/90 border border-zinc-800/80 shadow-sm relative overflow-hidden">
              <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2.5 mb-3">
                <div className="inline-flex items-center gap-1.5 px-2.5 py-0.5 rounded-md bg-zinc-900 text-zinc-300 border border-zinc-800 text-[10px] sm:text-xs font-mono font-medium self-start">
                  <span>⚡ 2027 MICRO-DESK REFERENCE STORE · INSTANT ₹22 ACCESS</span>
                </div>
                <span className="text-[10px] sm:text-[11px] font-mono text-zinc-400 bg-zinc-900 border border-zinc-800 px-2.5 py-0.5 rounded-md self-start sm:self-auto">
                  ✓ High-Density Laminated Desk Sheets
                </span>
              </div>

              <h2 className="text-xl sm:text-3xl font-bold text-white tracking-tight mb-1.5">
                ⚡ 8-Page Daily Desk References &amp; Cheat Sheets
              </h2>
              <p className="text-xs sm:text-sm text-zinc-400 max-w-2xl leading-relaxed mb-5">
                Engineered for quick office lookups and interview revision. High-density, print-ready cheat sheets with golden rules, predefined groups, voucher keys, and statutory GST &amp; TDS compliance matrices.
              </p>

              {/* Tally Prime 2027 ₹22 Normalized Product Card */}
              <div className="p-4 sm:p-5 rounded-xl bg-zinc-900/60 border border-zinc-800 space-y-4">
                <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
                  
                  {/* Left: Product Info */}
                  <div className="space-y-2">
                    <div className="flex items-center gap-2 flex-wrap">
                      <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-zinc-800 text-zinc-300 font-medium border border-zinc-700">
                        8-Page Desk Sheet
                      </span>
                      <span className="text-[10px] font-mono text-zinc-400 bg-zinc-950 px-2 py-0.5 rounded border border-zinc-800">
                        Hindi · English · Gujarati
                      </span>
                      <span className="text-[10px] font-mono text-amber-300 bg-amber-500/10 px-2 py-0.5 rounded border border-amber-500/20">
                        Tally Certified Trainer (TCT) Authored
                      </span>
                    </div>

                    <h3 className="text-lg sm:text-xl font-bold text-white tracking-tight">
                      Tally Prime 2027 Quick Desk Reference &amp; Cheat Sheet (8 Pages)
                    </h3>
                    <div className="text-xs font-mono text-zinc-300 font-medium">
                      Golden Rules · All 28 Groups · All 24 Vouchers · Top 35 Hotkeys · Rule 46 GST &amp; CTS-2010 Cheque BRS
                    </div>
                    <p className="text-xs text-zinc-400 max-w-2xl leading-relaxed">
                      Authored by <strong>Rahul Patel</strong> (Owner of IANT Palanpur · 10+ yrs IT industry experience · 3,000+ students trained). Includes Bestseller Book Cover, complete group hierarchy, voucher mapping, hotkeys, and author mentorship hub.
                    </p>

                    {/* Deliverables Badges */}
                    <div className="grid grid-cols-2 sm:grid-cols-4 gap-2 pt-1 text-[10px] font-mono">
                      <div className="p-2 rounded-lg bg-zinc-950 border border-zinc-800/80">
                        <span className="text-zinc-300 font-semibold block">Page 1-2</span>
                        <span className="text-zinc-500">Cover &amp; 3 Golden Rules</span>
                      </div>
                      <div className="p-2 rounded-lg bg-zinc-950 border border-zinc-800/80">
                        <span className="text-zinc-300 font-semibold block">Page 3-4</span>
                        <span className="text-zinc-500">28 Groups &amp; 24 Vouchers</span>
                      </div>
                      <div className="p-2 rounded-lg bg-zinc-950 border border-zinc-800/80">
                        <span className="text-zinc-300 font-semibold block">Page 5-6</span>
                        <span className="text-zinc-500">GST Rule 46 &amp; Cheque BRS</span>
                      </div>
                      <div className="p-2 rounded-lg bg-zinc-950 border border-zinc-800/80">
                        <span className="text-zinc-300 font-semibold block">Page 7-8</span>
                        <span className="text-zinc-500">35 Hotkeys &amp; Mentorship</span>
                      </div>
                    </div>
                  </div>

                  {/* Right: Pricing & 1-Click Buy Action */}
                  <div className="lg:w-64 shrink-0 p-4 rounded-xl bg-zinc-950 border border-zinc-800 text-center space-y-3">
                    <div>
                      <div className="text-[10px] font-mono text-zinc-400 uppercase tracking-wider">
                        Instant 1-Click Access
                      </div>
                      <div className="flex items-baseline justify-center gap-2 mt-1">
                        <span className="text-xs font-mono font-medium text-zinc-500 line-through">₹99</span>
                        <span className="text-2xl sm:text-3xl font-black text-white">₹22</span>
                        <span className="text-[10px] font-mono text-emerald-400 font-bold">78% OFF</span>
                      </div>
                      <div className="text-[10px] font-mono text-zinc-400 mt-0.5">
                        Hindi · English · ગુજરાતી
                      </div>
                    </div>

                    <button
                      type="button"
                      onClick={() => {
                        const tallySub = SUBJECTS.find(s => s.id === 'tally');
                        if (tallySub) handleDirectCheckout(tallySub, 'cheatsheet');
                      }}
                      className="w-full py-2.5 px-3 rounded-lg bg-white hover:bg-zinc-200 text-black text-xs font-bold transition-colors cursor-pointer flex items-center justify-center gap-1.5 shadow-sm active:scale-95"
                    >
                      <span>⚡ Get ₹22 Sheet</span>
                      <span>→</span>
                    </button>

                    <div className="flex items-center justify-center gap-2 text-[10px] font-mono text-zinc-400 pt-0.5">
                      <button
                        type="button"
                        onClick={() => {
                          const tallySub = SUBJECTS.find(s => s.id === 'tally');
                          if (tallySub) handleOpenPreviewModal(tallySub);
                        }}
                        className="hover:text-white underline cursor-pointer"
                      >
                        📖 Read 5p Sample
                      </button>
                      <span>•</span>
                      <button
                        type="button"
                        onClick={() => setActiveStoreTab('49')}
                        className="text-zinc-300 hover:text-white hover:underline cursor-pointer"
                      >
                        Need Full 51p Book? →
                      </button>
                    </div>
                  </div>

                </div>
              </div>

              {/* Upcoming ₹22 Desk Cheat Sheets Teaser */}
              <div className="mt-4 pt-3 border-t border-zinc-800/80">
                <div className="text-[10px] sm:text-[11px] font-mono text-zinc-400 mb-2 flex items-center justify-between">
                  <span>Upcoming ₹22 Micro-Desk Sheets:</span>
                  <span className="text-zinc-500 font-medium">Releasing Weekly</span>
                </div>
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-2 text-xs">
                  <div className="p-2.5 rounded-lg bg-zinc-900/40 border border-zinc-800/60 flex items-center justify-between">
                    <div>
                      <div className="font-semibold text-zinc-200 text-[11px]">🌐 Cisco CCNA 200-301 Hotkeys</div>
                      <div className="text-[10px] font-mono text-zinc-500">Subnetting Matrix &amp; CLI Commands</div>
                    </div>
                    <span className="text-[9px] font-mono px-1.5 py-0.5 rounded bg-zinc-800 text-zinc-400">Soon @ ₹22</span>
                  </div>
                  <div className="p-2.5 rounded-lg bg-zinc-900/40 border border-zinc-800/60 flex items-center justify-between">
                    <div>
                      <div className="font-semibold text-zinc-200 text-[11px]">📊 Excel 365 Top 100 Formulas</div>
                      <div className="text-[10px] font-mono text-zinc-500">XLOOKUP, Dynamic Arrays &amp; MIS</div>
                    </div>
                    <span className="text-[9px] font-mono px-1.5 py-0.5 rounded bg-zinc-800 text-zinc-400">Soon @ ₹22</span>
                  </div>
                  <div className="p-2.5 rounded-lg bg-zinc-900/40 border border-zinc-800/60 flex items-center justify-between">
                    <div>
                      <div className="font-semibold text-zinc-200 text-[11px]">⚡ Server 2025 SysAdmin Commands</div>
                      <div className="text-[10px] font-mono text-zinc-500">PowerShell &amp; Active Directory</div>
                    </div>
                    <span className="text-[9px] font-mono px-1.5 py-0.5 rounded bg-zinc-800 text-zinc-400">Soon @ ₹22</span>
                  </div>
                </div>
              </div>

            </div>
          </div>
        )}

        """

content = content[:start_idx] + new_segmented_and_section1 + content[end_idx:]
print("Replaced segmented switcher and Section 1 successfully!")

# 3. Normalize Tally card in Section 2
old_tally_section2 = """                  {/* Price Tag with Highlighted Crosses & Rich Slogans */}
                  {sub.id === 'tally' ? (
                    <div className="space-y-2">
                      <div className="p-2.5 rounded-xl bg-gradient-to-r from-amber-500/10 via-amber-500/5 to-transparent border border-amber-500/30">
                        <div className="flex items-center justify-between mb-1.5">
                          <span className="text-[10px] font-mono font-black text-amber-400 uppercase flex items-center gap-1">
                            <span>⚡</span> 2 Clear Editions Available
                          </span>
                          <span className="text-[9px] font-mono text-emerald-400 bg-emerald-500/10 px-1.5 py-0.5 rounded font-bold">
                            Hindi · English · ગુજ
                          </span>
                        </div>
                        <div className="grid grid-cols-2 gap-2 text-left">
                          <div className="p-2 rounded-lg bg-black/60 border border-amber-400/30">
                            <div className="text-[10px] font-mono text-amber-300 font-bold truncate">⚡ 8p Desk Sheet</div>
                            <div className="flex items-baseline gap-1 mt-0.5">
                              <span className="text-base sm:text-lg font-black text-white">₹22</span>
                              <span className="text-[9px] text-red-400 line-through">₹99</span>
                            </div>
                            <div className="text-[9px] text-[#86868B] mt-0.5 truncate">Office Desk &amp; Hotkeys</div>
                          </div>
                          <div className="p-2 rounded-lg bg-black/60 border border-white/10">
                            <div className="text-[10px] font-mono text-emerald-400 font-bold truncate">📘 51p Master Book</div>
                            <div className="flex items-baseline gap-1 mt-0.5">
                              <span className="text-base sm:text-lg font-black text-white">₹49</span>
                              <span className="text-[9px] text-red-400 line-through">₹199</span>
                            </div>
                            <div className="text-[9px] text-[#86868B] mt-0.5 truncate">Full 10 Ch In-Depth</div>
                          </div>
                        </div>
                      </div>

                      {/* Mobile-Friendly Action Buttons */}
                      <div className="grid grid-cols-2 gap-2">
                        <button
                          type="button"
                          onClick={() => handleDirectCheckout(sub, 'cheatsheet')}
                          className="py-2.5 px-2 rounded-xl bg-gradient-to-r from-amber-400 to-amber-500 hover:brightness-110 text-black text-[11px] sm:text-xs font-black transition-all text-center shadow-lg shadow-amber-500/20 active:scale-95 truncate flex items-center justify-center gap-1 cursor-pointer"
                        >
                          <span>⚡ Get ₹22 Sheet</span>
                        </button>
                        <button
                          type="button"
                          onClick={() => handleDirectCheckout(sub, 'single')}
                          className="py-2.5 px-2 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-95 text-black text-[11px] sm:text-xs font-black transition-all text-center shadow-lg shadow-emerald-500/20 active:scale-95 truncate flex items-center justify-center gap-1 cursor-pointer"
                        >
                          <span>📘 Get ₹49 Book</span>
                        </button>
                      </div>

                      <div className="flex items-center justify-between text-[10px] font-mono pt-0.5 px-0.5">
                        <button
                          type="button"
                          onClick={() => handleOpenPreviewModal(sub)}
                          className="text-[#86868B] hover:text-white transition-colors cursor-pointer"
                        >
                          📖 Free 5p Preview →
                        </button>
                        <button
                          type="button"
                          onClick={() => handleOpenPurchaseModal(sub, 'bundle')}
                          className="text-amber-400 hover:underline font-semibold cursor-pointer"
                        >
                          Or View ₹149 All-In-One Suite →
                        </button>
                      </div>
                    </div>
                  ) : ("""

new_tally_section2 = """                  {/* Normalized Price Tag for All Subjects */}
                  {sub.id === 'tally' ? (
                    <div className="space-y-2">
                      <div className="p-2.5 rounded-xl bg-zinc-950 border border-zinc-800">
                        <div className="flex items-center justify-between mb-1.5">
                          <span className="text-[10px] font-mono font-semibold text-zinc-300 uppercase">
                            2 Editions Available
                          </span>
                          <span className="text-[9px] font-mono text-zinc-400 bg-zinc-900 border border-zinc-800 px-1.5 py-0.5 rounded">
                            Hindi · English · ગુજ
                          </span>
                        </div>
                        <div className="grid grid-cols-2 gap-2 text-left">
                          <div className="p-2 rounded-lg bg-zinc-900/80 border border-zinc-800">
                            <div className="text-[10px] font-mono text-zinc-300 font-semibold truncate">⚡ 8p Desk Sheet</div>
                            <div className="flex items-baseline gap-1 mt-0.5">
                              <span className="text-base sm:text-lg font-bold text-white">₹22</span>
                              <span className="text-[9px] text-zinc-500 line-through">₹99</span>
                            </div>
                            <div className="text-[9px] text-zinc-500 mt-0.5 truncate">Office Desk &amp; Keys</div>
                          </div>
                          <div className="p-2 rounded-lg bg-zinc-900/80 border border-zinc-800">
                            <div className="text-[10px] font-mono text-zinc-300 font-semibold truncate">📘 51p Master Book</div>
                            <div className="flex items-baseline gap-1 mt-0.5">
                              <span className="text-base sm:text-lg font-bold text-white">₹49</span>
                              <span className="text-[9px] text-zinc-500 line-through">₹199</span>
                            </div>
                            <div className="text-[9px] text-zinc-500 mt-0.5 truncate">Full 10 Ch In-Depth</div>
                          </div>
                        </div>
                      </div>

                      {/* Clean Matte Action Buttons */}
                      <div className="grid grid-cols-2 gap-2">
                        <button
                          type="button"
                          onClick={() => handleDirectCheckout(sub, 'cheatsheet')}
                          className="py-2.5 px-2 rounded-lg bg-zinc-800 hover:bg-zinc-700 text-white text-[11px] sm:text-xs font-semibold transition-colors text-center border border-zinc-700 active:scale-95 truncate flex items-center justify-center gap-1 cursor-pointer"
                        >
                          <span>⚡ ₹22 Sheet</span>
                        </button>
                        <button
                          type="button"
                          onClick={() => handleDirectCheckout(sub, 'single')}
                          className="py-2.5 px-2 rounded-lg bg-white hover:bg-zinc-200 text-black text-[11px] sm:text-xs font-bold transition-colors text-center shadow-sm active:scale-95 truncate flex items-center justify-center gap-1 cursor-pointer"
                        >
                          <span>📘 ₹49 Book</span>
                        </button>
                      </div>

                      <div className="flex items-center justify-between text-[10px] font-mono pt-0.5 px-0.5">
                        <button
                          type="button"
                          onClick={() => handleOpenPreviewModal(sub)}
                          className="text-zinc-500 hover:text-white transition-colors cursor-pointer"
                        >
                          📖 Free 5p Preview →
                        </button>
                        <button
                          type="button"
                          onClick={() => handleOpenPurchaseModal(sub, 'bundle')}
                          className="text-zinc-400 hover:text-white hover:underline transition-colors cursor-pointer"
                        >
                          Or View ₹149 Suite →
                        </button>
                      </div>
                    </div>
                  ) : ("""

if old_tally_section2 in content:
    content = content.replace(old_tally_section2, new_tally_section2)
    print("Normalized Tally Section 2 card successfully!")
else:
    print("Could not find exact old_tally_section2")

with open(notes_page_path, "w", encoding="utf-8") as f:
    f.write(content)

print("NotesPage.jsx updated successfully!")
