import os

notes_path = 'app/pages/NotesPage.jsx'
with open(notes_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Add activeStoreTab state if not already there
old_state = "  // Modals\n  const [isUpsellOpen, setIsUpsellOpen] = useState(false);"
new_state = """  // Top-Level Dual Store View: 'all' | '22' (₹22 Desk Reference Store) | '49' (₹49 Master Store & ₹149 Suites)
  const [activeStoreTab, setActiveStoreTab] = useState('all');

  // Modals
  const [isUpsellOpen, setIsUpsellOpen] = useState(false);"""

if "const [activeStoreTab, setActiveStoreTab]" not in content:
    assert old_state in content, "old_state not found!"
    content = content.replace(old_state, new_state, 1)

# 2. Add URL param check for store in useEffect if not already there
old_use_effect = """      const targetId = (params.get('book') || params.get('subject') || hash).toLowerCase();
      const planParam = (params.get('plan') || '').toLowerCase();"""

new_use_effect = """      const targetId = (params.get('book') || params.get('subject') || hash).toLowerCase();
      const planParam = (params.get('plan') || '').toLowerCase();
      const storeParam = (params.get('store') || params.get('tab') || '').toLowerCase();
      if (storeParam === '22' || storeParam === 'cheatsheet') {
        setActiveStoreTab('22');
      } else if (storeParam === '49' || storeParam === 'master') {
        setActiveStoreTab('49');
      } else if (planParam === 'cheatsheet' || planParam === '22') {
        setActiveStoreTab('22');
      }"""

if "const storeParam =" not in content:
    assert old_use_effect in content, "old_use_effect not found!"
    content = content.replace(old_use_effect, new_use_effect, 1)

# 3. Add Top-Level Dual Store Navigation Switcher and Section 1 right above Section 2
old_section_header = """        {/* ── 6 MASTER SUBJECT CARDS IN EXACT USER SEQUENCE ──────────── */}
        <div className="mb-6">"""

new_section_header = """        {/* ── TOP-LEVEL DUAL STORE NAVIGATION SWITCHER ──────────────────── */}
        <div className="mb-8 p-1.5 sm:p-2 rounded-2xl sm:rounded-full bg-zinc-950/90 border border-white/[0.12] shadow-2xl max-w-3xl mx-auto backdrop-blur-xl">
          <div className="grid grid-cols-2 sm:grid-cols-3 gap-1.5 sm:gap-2">
            
            {/* Tab 1: ₹22 Quick Desk Reference Store */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('22')}
              className={`py-3 px-3 sm:px-4 rounded-xl sm:rounded-full text-left sm:text-center transition-all cursor-pointer flex flex-col sm:flex-row items-center justify-center gap-1.5 ${
                activeStoreTab === '22'
                  ? 'bg-gradient-to-r from-amber-400 to-amber-500 text-black font-black shadow-lg shadow-amber-500/30 ring-2 ring-amber-300'
                  : 'bg-white/[0.03] hover:bg-white/[0.08] text-white/80 hover:text-white border border-white/[0.06]'
              }`}
            >
              <div className="flex items-center gap-1.5">
                <span className="text-base sm:text-lg">⚡</span>
                <span className="text-xs sm:text-sm font-black tracking-tight">₹22 Desk Store</span>
              </div>
              <span className={`text-[9px] font-mono px-2 py-0.5 rounded-full ${
                activeStoreTab === '22'
                  ? 'bg-black text-amber-300 font-bold'
                  : 'bg-amber-500/15 text-amber-400 border border-amber-500/30'
              }`}>
                8-PAGE CHEAT SHEETS
              </span>
            </button>

            {/* Tab 2: ₹49 Master Handbooks Store (with ₹149 Suites) */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('49')}
              className={`py-3 px-3 sm:px-4 rounded-xl sm:rounded-full text-left sm:text-center transition-all cursor-pointer flex flex-col sm:flex-row items-center justify-center gap-1.5 ${
                activeStoreTab === '49'
                  ? 'bg-gradient-to-r from-emerald-400 to-cyan-400 text-black font-black shadow-lg shadow-emerald-500/30 ring-2 ring-emerald-300'
                  : 'bg-white/[0.03] hover:bg-white/[0.08] text-white/80 hover:text-white border border-white/[0.06]'
              }`}
            >
              <div className="flex items-center gap-1.5">
                <span className="text-base sm:text-lg">📘</span>
                <span className="text-xs sm:text-sm font-black tracking-tight">₹49 Master Store</span>
              </div>
              <span className={`text-[9px] font-mono px-2 py-0.5 rounded-full ${
                activeStoreTab === '49'
                  ? 'bg-black text-emerald-300 font-bold'
                  : 'bg-emerald-500/15 text-emerald-400 border border-emerald-500/30'
              }`}>
                + ₹149 SUITES
              </span>
            </button>

            {/* Tab 3: All Products */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('all')}
              className={`col-span-2 sm:col-span-1 py-2 sm:py-3 px-3 sm:px-4 rounded-xl sm:rounded-full text-center transition-all cursor-pointer flex items-center justify-center gap-1.5 ${
                activeStoreTab === 'all'
                  ? 'bg-white text-black font-black shadow-lg ring-2 ring-white/50'
                  : 'bg-white/[0.03] hover:bg-white/[0.08] text-white/70 hover:text-white border border-white/[0.06]'
              }`}
            >
              <span className="text-xs sm:text-sm font-bold">🌐 All Products</span>
              <span className="text-[9px] font-mono text-[#86868B]">(7)</span>
            </button>

          </div>
        </div>

        {/* ═══════════════════════════════════════════════════════════════════ */}
        {/* ⚡ SECTION 1: RTECHLAB ₹22 QUICK DESK REFERENCE STORE              */}
        {/* ═══════════════════════════════════════════════════════════════════ */}
        {(activeStoreTab === '22' || activeStoreTab === 'all') && (
          <div id="store-22" className="mb-12 scroll-mt-20 animate-fadeIn">
            {/* Store Header Box */}
            <div className="p-5 sm:p-7 rounded-3xl bg-gradient-to-b from-[#18150a] via-[#0f0e08] to-black border-2 border-amber-500/40 shadow-2xl relative overflow-hidden">
              <div className="absolute top-0 right-0 w-80 h-80 bg-amber-500/10 rounded-full blur-3xl pointer-events-none -mr-20 -mt-20" />
              
              <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 mb-3">
                <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-amber-500/20 text-amber-300 border border-amber-500/40 text-[10px] sm:text-xs font-mono font-black self-start">
                  <span>⚡ 2027 MICRO-DESK REFERENCE STORE · INSTANT ₹22 ACCESS</span>
                </div>
                <span className="text-[11px] font-mono text-emerald-400 font-bold bg-emerald-500/10 border border-emerald-500/30 px-2.5 py-0.5 rounded-full self-start sm:self-auto">
                  ✓ 100% Practical Desk Companions
                </span>
              </div>

              <h2 className="text-2xl sm:text-4xl font-black text-white tracking-tight mb-2">
                ⚡ 8-Page Daily Desk References &amp; Cheat Sheets
              </h2>
              <p className="text-xs sm:text-sm text-[#D2D2D7] max-w-2xl leading-relaxed mb-5">
                Designed for high-speed office execution &amp; 10-minute interview revision. High-density, print-ready laminated cheat sheets packed with golden rules, predefined groups, voucher keys, and statutory GST &amp; TDS compliance matrices.
              </p>

              {/* Tally Prime 2027 ₹22 Flagship Card */}
              <div className="p-4 sm:p-6 rounded-2xl bg-black/80 border border-amber-400/40 shadow-xl space-y-4">
                <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
                  
                  {/* Left: Product Info */}
                  <div className="space-y-2">
                    <div className="flex items-center gap-2 flex-wrap">
                      <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-amber-500/20 text-amber-300 font-bold border border-amber-500/30">
                        🔥 GUJARAT &amp; INDIA #1 DESK COMPANION
                      </span>
                      <span className="text-[10px] font-mono text-white/70 bg-white/[0.06] px-2 py-0.5 rounded">
                        8 Pages High-Density Reference
                      </span>
                      <span className="text-[10px] font-mono text-cyan-300 bg-cyan-500/10 px-2 py-0.5 rounded border border-cyan-500/20">
                        🏅 Tally Certified Trainer (TCT) Authored
                      </span>
                    </div>

                    <h3 className="text-xl sm:text-2xl font-black text-white tracking-tight">
                      Tally Prime 2027 Ultimate Desk Reference &amp; Cheat Sheet (8 Pages)
                    </h3>
                    <div className="text-xs font-mono text-amber-400 font-bold">
                      Golden Rules · All 28 Groups · All 24 Vouchers · Top 35 Hotkeys · Rule 46 GST &amp; CTS-2010 Cheque BRS
                    </div>
                    <p className="text-xs text-[#A1A1A6] max-w-2xl leading-relaxed">
                      Written &amp; verified by <strong>Rahul Patel</strong> (Owner of IANT Palanpur, 10+ yrs IT industry experience, trained 3,000+ students). Includes Bestseller Book Cover, complete primary &amp; secondary group divisions, hotkeys, and author mentorship hub.
                    </p>

                    {/* Deliverables Badges */}
                    <div className="grid grid-cols-2 sm:grid-cols-4 gap-2 pt-2 text-[10px] font-mono">
                      <div className="p-2 rounded-xl bg-white/[0.03] border border-white/5">
                        <span className="text-amber-400 font-bold block">Page 1-2</span>
                        <span className="text-[#86868B]">Cover &amp; 3 Golden Rules</span>
                      </div>
                      <div className="p-2 rounded-xl bg-white/[0.03] border border-white/5">
                        <span className="text-amber-400 font-bold block">Page 3-4</span>
                        <span className="text-[#86868B]">28 Groups &amp; 24 Vouchers</span>
                      </div>
                      <div className="p-2 rounded-xl bg-white/[0.03] border border-white/5">
                        <span className="text-amber-400 font-bold block">Page 5-6</span>
                        <span className="text-[#86868B]">GST Rule 46 &amp; Cheque BRS</span>
                      </div>
                      <div className="p-2 rounded-xl bg-white/[0.03] border border-white/5">
                        <span className="text-amber-400 font-bold block">Page 7-8</span>
                        <span className="text-[#86868B]">35 Hotkeys &amp; Mentorship</span>
                      </div>
                    </div>
                  </div>

                  {/* Right: Pricing & 1-Click Buy Action */}
                  <div className="lg:w-72 shrink-0 p-4 rounded-xl bg-gradient-to-b from-[#201a0a] to-[#0f0d06] border border-amber-400/30 text-center space-y-3">
                    <div>
                      <div className="text-[10px] font-mono text-amber-300 font-bold uppercase">
                        Instant 1-Click Access
                      </div>
                      <div className="flex items-baseline justify-center gap-2 mt-1">
                        <span className="text-xs font-mono font-bold text-red-400 line-through decoration-red-500 decoration-2">₹99</span>
                        <span className="text-3xl sm:text-4xl font-black text-amber-400">₹22</span>
                        <span className="text-[10px] font-mono text-emerald-300 font-bold">78% OFF</span>
                      </div>
                      <div className="text-[10px] font-mono text-[#86868B] mt-0.5">
                        Available in: <strong className="text-white">Hindi / English / ગુજરાતી</strong>
                      </div>
                    </div>

                    <button
                      type="button"
                      onClick={() => {
                        const tallySub = SUBJECTS.find(s => s.id === 'tally');
                        if (tallySub) handleDirectCheckout(tallySub, 'cheatsheet');
                      }}
                      className="w-full py-3.5 px-4 rounded-xl bg-gradient-to-r from-amber-400 to-amber-500 hover:brightness-110 text-black text-sm font-black transition-all shadow-xl shadow-amber-500/25 active:scale-95 cursor-pointer flex items-center justify-center gap-2"
                    >
                      <span>⚡ Get ₹22 Cheat Sheet</span>
                      <span>→</span>
                    </button>

                    <div className="flex items-center justify-center gap-3 text-[10px] font-mono text-[#86868B]">
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
                        className="text-emerald-400 hover:underline cursor-pointer"
                      >
                        Need Full 51p Book? →
                      </button>
                    </div>
                  </div>

                </div>
              </div>

              {/* Upcoming ₹22 Desk Cheat Sheets Teaser */}
              <div className="mt-4 pt-3 border-t border-white/[0.08]">
                <div className="text-[11px] font-mono text-[#86868B] mb-2 flex items-center justify-between">
                  <span>More Micro-Desk References in the ₹22 Pipeline:</span>
                  <span className="text-amber-400 font-bold">Releasing Every Week</span>
                </div>
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-2 text-xs">
                  <div className="p-2.5 rounded-xl bg-white/[0.02] border border-white/5 flex items-center justify-between">
                    <div>
                      <div className="font-bold text-white text-[11px]">🌐 Cisco CCNA 200-301 Hotkeys</div>
                      <div className="text-[10px] font-mono text-[#86868B]">Subnetting Matrix &amp; CLI Commands</div>
                    </div>
                    <span className="text-[9px] font-mono px-2 py-0.5 rounded bg-white/[0.05] text-[#86868B]">Soon @ ₹22</span>
                  </div>
                  <div className="p-2.5 rounded-xl bg-white/[0.02] border border-white/5 flex items-center justify-between">
                    <div>
                      <div className="font-bold text-white text-[11px]">📊 Excel 365 Top 100 Formulas</div>
                      <div className="text-[10px] font-mono text-[#86868B]">XLOOKUP, Dynamic Arrays &amp; MIS</div>
                    </div>
                    <span className="text-[9px] font-mono px-2 py-0.5 rounded bg-white/[0.05] text-[#86868B]">Soon @ ₹22</span>
                  </div>
                  <div className="p-2.5 rounded-xl bg-white/[0.02] border border-white/5 flex items-center justify-between">
                    <div>
                      <div className="font-bold text-white text-[11px]">⚡ Server 2025 SysAdmin Commands</div>
                      <div className="text-[10px] font-mono text-[#86868B]">PowerShell &amp; Active Directory</div>
                    </div>
                    <span className="text-[9px] font-mono px-2 py-0.5 rounded bg-white/[0.05] text-[#86868B]">Soon @ ₹22</span>
                  </div>
                </div>
              </div>

            </div>
          </div>
        )}

        {/* ═══════════════════════════════════════════════════════════════════ */}
        {/* 📘 SECTION 2: RTECHLAB COMPREHENSIVE MASTER HANDBOOKS (@ ₹49)       */}
        {/*              & EXECUTIVE CAREER ACCELERATOR SUITES (@ ₹149)        */}
        {/* ═══════════════════════════════════════════════════════════════════ */}
        {(activeStoreTab === '49' || activeStoreTab === 'all') && (
          <div id="store-49" className="mb-6 scroll-mt-20 animate-fadeIn">"""

assert old_section_header in content, "old_section_header not found!"
content = content.replace(old_section_header, new_section_header, 1)

# Close the Section 2 conditional div
old_close_indicator = """            <p className="text-[10px] font-mono text-[#86868B]">
              Swipe cards horizontally or tap track pills above
            </p>
          </div>
        </div>"""

new_close_indicator = """            <p className="text-[10px] font-mono text-[#86868B]">
              Swipe cards horizontally or tap track pills above
            </p>
          </div>
        </div>
        )}"""

assert old_close_indicator in content, "old_close_indicator not found!"
content = content.replace(old_close_indicator, new_close_indicator, 1)

with open(notes_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Dual Store sections successfully injected into NotesPage.jsx!")
