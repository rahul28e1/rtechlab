import os

notes_path = 'app/pages/NotesPage.jsx'
with open(notes_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Replace the Card Price & Buttons
old_card_price_block = '''                  {/* Price Tag with Highlighted Crosses & Rich Slogans */}
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
                  </div>

                  {/* Two Action Buttons: Preview 5 Pages vs Buy */}
                  <div className="grid grid-cols-2 gap-2">
                    <button
                      type="button"
                      onClick={() => handleOpenPreviewModal(sub)}
                      className="py-2.5 rounded-xl bg-white/[0.08] hover:bg-white/[0.16] hover:text-white text-xs font-bold text-white transition-all text-center border border-white/10 active:scale-95 flex items-center justify-center gap-1 shadow-sm"
                    >
                      <span>Preview 5p</span>
                      <span>→</span>
                    </button>
                    <button
                      type="button"
                      onClick={() => handleOpenPurchaseModal(sub, 'bundle')}
                      className="py-2.5 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-95 text-black text-xs font-black transition-all text-center shadow-lg shadow-emerald-500/20 active:scale-95"
                    >
                      Get Notes
                    </button>
                  </div>'''

new_card_price_block = '''                  {/* Price Tag with Highlighted Crosses & Rich Slogans */}
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
                  ) : (
                    <>
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
                      </div>

                      {/* Two Action Buttons: Preview 5 Pages vs Buy */}
                      <div className="grid grid-cols-2 gap-2">
                        <button
                          type="button"
                          onClick={() => handleOpenPreviewModal(sub)}
                          className="py-2.5 rounded-xl bg-white/[0.08] hover:bg-white/[0.16] hover:text-white text-xs font-bold text-white transition-all text-center border border-white/10 active:scale-95 flex items-center justify-center gap-1 shadow-sm cursor-pointer"
                        >
                          <span>Preview 5p</span>
                          <span>→</span>
                        </button>
                        <button
                          type="button"
                          onClick={() => handleOpenPurchaseModal(sub, 'bundle')}
                          className="py-2.5 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-95 text-black text-xs font-black transition-all text-center shadow-lg shadow-emerald-500/20 active:scale-95 cursor-pointer"
                        >
                          Get Notes
                        </button>
                      </div>
                    </>
                  )}'''

assert old_card_price_block in content, "old_card_price_block not found!"
content = content.replace(old_card_price_block, new_card_price_block, 1)

# 2. Package Selector Modal: Dual/Triple Option with Guidance
old_modal_options = '''              {/* Two Selectable Options */}
              <div className="space-y-3 mb-5">
                
                {/* Plan 1: ₹149 Career Accelerator Suite (PRE-SELECTED / BEST VALUE) */}
                <div
                  onClick={() => setModalSelectedPlan('bundle')}
                  className={`p-4 sm:p-5 rounded-2xl cursor-pointer border-2 transition-all flex items-start justify-between gap-3 relative ${
                    modalSelectedPlan === 'bundle'
                      ? 'bg-[#0E161B] border-emerald-500 text-white shadow-xl shadow-emerald-500/15 ring-1 ring-emerald-500/40'
                      : 'bg-black/40 border-white/[0.1] text-[#86868B] hover:border-emerald-500/40'
                  }`}
                >
                  <div className="flex items-start gap-3">
                    <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                      modalSelectedPlan === 'bundle' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'
                    }`}>
                      {modalSelectedPlan === 'bundle' && <div className="w-2 h-2 rounded-full bg-black" />}
                    </div>
                    <div>
                      <div className="flex items-center gap-2 mb-1 flex-wrap">
                        <span className="font-bold text-white text-sm sm:text-base">
                          Executive Career Accelerator Suite™ (Elite Edition)
                        </span>
                        <span className="text-[9px] font-mono px-2 py-0.5 rounded-full bg-emerald-500/15 text-emerald-400 font-extrabold border border-emerald-500/30">
                          👑 RECOMMENDED BY 89% STUDENTS · BEST VALUE
                        </span>
                      </div>
                      <div className="text-[11px] font-mono text-emerald-400 font-semibold mb-1">
                        👑 The 6-Figure Placement Arsenal · Real-World Enterprise Advantage
                      </div>
                      <p className="text-xs text-emerald-200/90 leading-relaxed mb-2">
                        Includes <strong>all {selectedSubject.bundleItems.length} specialized engineering guides</strong> ({selectedSubject.bundlePages}): English, Hindi &amp; Gujarati Core Guides + Top MNC Interview Vault + Practical Labs/Templates + Career Salary Blueprint + 1-Click ZIP Download.
                      </p>
                      <div className="text-[11px] font-mono text-[#86868B]">
                        ✓ Personal Mentorship Email from Rahul Sir · 100% Lifetime Free Yearly Updates
                      </div>
                    </div>
                  </div>
                  <div className="text-right shrink-0">
                    <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹1,099</div>
                    <div className="text-lg sm:text-2xl font-black text-emerald-400">₹149</div>
                    <div className="text-[9px] font-mono text-emerald-300 font-bold">SAVE ₹950 · 86% OFF</div>
                  </div>
                </div>

                {/* Plan 2: ₹49 Single Core Notes */}
                <div
                  onClick={() => setModalSelectedPlan('single')}
                  className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border transition-all flex items-start justify-between gap-3 ${
                    modalSelectedPlan === 'single'
                      ? 'bg-black border-white text-white shadow-lg ring-1 ring-white/20'
                      : 'bg-black/40 border-white/[0.08] text-[#86868B] hover:border-white/20'
                  }`}
                >
                  <div className="flex items-start gap-3">
                    <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                      modalSelectedPlan === 'single' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'
                    }`}>
                      {modalSelectedPlan === 'single' && <div className="w-2 h-2 rounded-full bg-black" />}
                    </div>
                    <div>
                      <div className="flex items-center gap-2 mb-0.5">
                        <span className="font-bold text-white text-sm sm:text-base">
                          Foundational Engineering Master Pass™
                        </span>
                        <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-white/[0.06] text-[#86868B]">
                          {selectedSubject.pages}
                        </span>
                      </div>
                      <div className="text-[11px] font-mono text-zinc-400 font-semibold mb-1">
                        📘 The Essential Technical Blueprint · 100% Concept Mastery &amp; Academic Excellence
                      </div>
                      <p className="text-xs text-[#86868B] leading-relaxed">
                        Complete {selectedSubject.pages} Theory Handbook PDF in your chosen language with verified silicon concepts, vector schematics, and practice MCQs. (Does NOT include the MNC Interview Vault, Practical Labs, or Salary Blueprint).
                      </p>
                    </div>
                  </div>
                  <div className="text-right shrink-0">
                    <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹199</div>
                    <div className="text-lg sm:text-xl font-black text-white">₹49</div>
                    <div className="text-[9px] font-mono text-zinc-400">SAVE 75%</div>
                  </div>
                </div>

              </div>'''

new_modal_options = '''              {/* Selectable Options (With Custom 3-Tier Clarity for Tally Prime) */}
              {selectedSubject.id === 'tally' ? (
                <div className="space-y-3 mb-5">
                  {/* Transparent Guidance Box: No Confusion for Students */}
                  <div className="p-3 sm:p-3.5 rounded-2xl bg-amber-500/10 border border-amber-500/30 text-xs space-y-2">
                    <div className="text-[11px] font-mono text-amber-400 font-bold flex items-center gap-1.5">
                      <span>💡</span>
                      <span>कौैन सा एडिशन आपके लिए सही है? (Which one is right for you?):</span>
                    </div>
                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-2 text-[11px] text-[#A1A1A6]">
                      <div className="p-2 rounded-xl bg-black/50 border border-white/5">
                        <strong className="text-amber-300 block mb-0.5">⚡ ₹22 चीट शीट लें:</strong>
                        अगर आप ऑफिस में टेबल पर रखने के लिए तुरंत 28 ग्रुप्स, 24 वाउचर्स व शॉर्टकट्स का 1-नज़र रेफरेंस चाहते हैं।
                      </div>
                      <div className="p-2 rounded-xl bg-black/50 border border-white/5">
                        <strong className="text-white block mb-0.5">📘 ₹49 मास्टर गाइड लें:</strong>
                        अगर आप पूरा टैली बेसिक से एडवांस तक 10 चैप्टर्स और 50+ इनवॉइस के साथ डीप में स्टेप-बाय-स्टेप सीखना चाहते हैं।
                      </div>
                      <div className="p-2 rounded-xl bg-black/50 border border-white/5">
                        <strong className="text-emerald-300 block mb-0.5">👑 ₹149 कम्प्लीट सुइट:</strong>
                        अगर आपको दोनों बुक्स + 50 इंटरव्यू Q&amp;A + 50 इनवॉइस वर्कबुक + राहुल सर मेंटरशिप सब एक साथ चाहिए।
                      </div>
                    </div>
                  </div>

                  {/* Option 1: ₹22 Quick Desk Reference (8 Pages) */}
                  <div
                    onClick={() => setModalSelectedPlan('cheatsheet')}
                    className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border-2 transition-all flex items-start justify-between gap-3 relative ${
                      modalSelectedPlan === 'cheatsheet'
                        ? 'bg-[#18150a] border-amber-400 text-white shadow-xl shadow-amber-500/15 ring-1 ring-amber-400/40'
                        : 'bg-black/40 border-white/[0.08] text-[#86868B] hover:border-amber-400/40'
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                        modalSelectedPlan === 'cheatsheet' ? 'border-amber-400 bg-amber-400' : 'border-white/30'
                      }`}>
                        {modalSelectedPlan === 'cheatsheet' && <div className="w-2 h-2 rounded-full bg-black" />}
                      </div>
                      <div>
                        <div className="flex items-center gap-2 mb-1 flex-wrap">
                          <span className="font-bold text-white text-sm sm:text-base">
                            ⚡ 8-Page Desk Reference &amp; Cheat Sheet
                          </span>
                          <span className="text-[9px] font-mono px-2 py-0.5 rounded-full bg-amber-500/20 text-amber-300 font-extrabold border border-amber-500/40">
                            🔥 DAILY DESK COMPANION · ₹22 ONLY
                          </span>
                        </div>
                        <div className="text-[11px] font-mono text-amber-300 font-semibold mb-1">
                          ⚡ Quick Memory Recall · All 28 Groups · 24 Vouchers · Top 35 Shortcuts
                        </div>
                        <p className="text-xs text-[#D2D2D7] leading-relaxed">
                          Ultra-dense 8-page desk companion with Bestseller Cover, 15 Primary + 13 Secondary Groups, 24 Vouchers, Rule 46 GST invoice structure, CTS-2010 cheque BRS &amp; Form 26Q calendar. (Available in Hindi, English, Gujarati).
                        </p>
                      </div>
                    </div>
                    <div className="text-right shrink-0">
                      <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹99</div>
                      <div className="text-lg sm:text-2xl font-black text-amber-400">₹22</div>
                      <div className="text-[9px] font-mono text-amber-300 font-bold">SAVE 78%</div>
                    </div>
                  </div>

                  {/* Option 2: ₹49 Complete Master Study Guide (51 Pages) */}
                  <div
                    onClick={() => setModalSelectedPlan('single')}
                    className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border-2 transition-all flex items-start justify-between gap-3 relative ${
                      modalSelectedPlan === 'single'
                        ? 'bg-black border-white text-white shadow-lg ring-1 ring-white/30'
                        : 'bg-black/40 border-white/[0.08] text-[#86868B] hover:border-white/20'
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                        modalSelectedPlan === 'single' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'
                      }`}>
                        {modalSelectedPlan === 'single' && <div className="w-2 h-2 rounded-full bg-black" />}
                      </div>
                      <div>
                        <div className="flex items-center gap-2 mb-1 flex-wrap">
                          <span className="font-bold text-white text-sm sm:text-base">
                            📘 Complete Master Study Guide &amp; Vocational Textbook
                          </span>
                          <span className="text-[9px] font-mono px-2 py-0.5 rounded bg-white/10 text-white font-bold border border-white/20">
                            51 PAGES FULL COURSE
                          </span>
                        </div>
                        <div className="text-[11px] font-mono text-zinc-300 font-semibold mb-1">
                          📘 Step-by-Step Concepts · 10 In-Depth Chapters · 50+ Invoices
                        </div>
                        <p className="text-xs text-[#86868B] leading-relaxed">
                          Full textbook from accounting basics to advanced company creation, multi-currency, APMC mandi trading entries, interstate IGST, and year-end trial balance audit.
                        </p>
                      </div>
                    </div>
                    <div className="text-right shrink-0">
                      <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹199</div>
                      <div className="text-lg sm:text-2xl font-black text-white">₹49</div>
                      <div className="text-[9px] font-mono text-zinc-400">SAVE 75%</div>
                    </div>
                  </div>

                  {/* Option 3: ₹149 Complete Career Accelerator Suite */}
                  <div
                    onClick={() => setModalSelectedPlan('bundle')}
                    className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border-2 transition-all flex items-start justify-between gap-3 relative ${
                      modalSelectedPlan === 'bundle'
                        ? 'bg-[#0E161B] border-emerald-500 text-white shadow-xl shadow-emerald-500/15 ring-1 ring-emerald-500/40'
                        : 'bg-black/40 border-white/[0.08] text-[#86868B] hover:border-emerald-500/40'
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                        modalSelectedPlan === 'bundle' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'
                      }`}>
                        {modalSelectedPlan === 'bundle' && <div className="w-2 h-2 rounded-full bg-black" />}
                      </div>
                      <div>
                        <div className="flex items-center gap-2 mb-1 flex-wrap">
                          <span className="font-bold text-white text-sm sm:text-base">
                            👑 Executive Career Accelerator Suite (All-In-One ZIP)
                          </span>
                          <span className="text-[9px] font-mono px-2 py-0.5 rounded-full bg-emerald-500/15 text-emerald-400 font-extrabold border border-emerald-500/30">
                            ALL 7 DELIVERABLES · BEST VALUE
                          </span>
                        </div>
                        <div className="text-[11px] font-mono text-emerald-400 font-semibold mb-1">
                          👑 Everything Included: Both ₹22 &amp; ₹49 Books + Interview Vault + Labs
                        </div>
                        <p className="text-xs text-emerald-200/90 leading-relaxed">
                          Includes 8-Page Desk Sheet + 51-Page Master Guide (All 3 Languages) + Top 50 Accountant Interview Vault + 50 Real Invoices Workbook + TDS Practice Set + Direct Rahul Sir Mentorship!
                        </p>
                      </div>
                    </div>
                    <div className="text-right shrink-0">
                      <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹1,099</div>
                      <div className="text-lg sm:text-2xl font-black text-emerald-400">₹149</div>
                      <div className="text-[9px] font-mono text-emerald-300 font-bold">SAVE 86%</div>
                    </div>
                  </div>
                </div>
              ) : (
                <div className="space-y-3 mb-5">
                  {/* Plan 1: ₹149 Career Accelerator Suite (PRE-SELECTED / BEST VALUE) */}
                  <div
                    onClick={() => setModalSelectedPlan('bundle')}
                    className={`p-4 sm:p-5 rounded-2xl cursor-pointer border-2 transition-all flex items-start justify-between gap-3 relative ${
                      modalSelectedPlan === 'bundle'
                        ? 'bg-[#0E161B] border-emerald-500 text-white shadow-xl shadow-emerald-500/15 ring-1 ring-emerald-500/40'
                        : 'bg-black/40 border-white/[0.1] text-[#86868B] hover:border-emerald-500/40'
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                        modalSelectedPlan === 'bundle' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'
                      }`}>
                        {modalSelectedPlan === 'bundle' && <div className="w-2 h-2 rounded-full bg-black" />}
                      </div>
                      <div>
                        <div className="flex items-center gap-2 mb-1 flex-wrap">
                          <span className="font-bold text-white text-sm sm:text-base">
                            Executive Career Accelerator Suite™ (Elite Edition)
                          </span>
                          <span className="text-[9px] font-mono px-2 py-0.5 rounded-full bg-emerald-500/15 text-emerald-400 font-extrabold border border-emerald-500/30">
                            👑 RECOMMENDED BY 89% STUDENTS · BEST VALUE
                          </span>
                        </div>
                        <div className="text-[11px] font-mono text-emerald-400 font-semibold mb-1">
                          👑 The 6-Figure Placement Arsenal · Real-World Enterprise Advantage
                        </div>
                        <p className="text-xs text-emerald-200/90 leading-relaxed mb-2">
                          Includes <strong>all {selectedSubject.bundleItems.length} specialized engineering guides</strong> ({selectedSubject.bundlePages}): English, Hindi &amp; Gujarati Core Guides + Top MNC Interview Vault + Practical Labs/Templates + Career Salary Blueprint + 1-Click ZIP Download.
                        </p>
                        <div className="text-[11px] font-mono text-[#86868B]">
                          ✓ Personal Mentorship Email from Rahul Sir · 100% Lifetime Free Yearly Updates
                        </div>
                      </div>
                    </div>
                    <div className="text-right shrink-0">
                      <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹1,099</div>
                      <div className="text-lg sm:text-2xl font-black text-emerald-400">₹149</div>
                      <div className="text-[9px] font-mono text-emerald-300 font-bold">SAVE ₹950 · 86% OFF</div>
                    </div>
                  </div>

                  {/* Plan 2: ₹49 Single Core Notes */}
                  <div
                    onClick={() => setModalSelectedPlan('single')}
                    className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border transition-all flex items-start justify-between gap-3 ${
                      modalSelectedPlan === 'single'
                        ? 'bg-black border-white text-white shadow-lg ring-1 ring-white/20'
                        : 'bg-black/40 border-white/[0.08] text-[#86868B] hover:border-white/20'
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                        modalSelectedPlan === 'single' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'
                      }`}>
                        {modalSelectedPlan === 'single' && <div className="w-2 h-2 rounded-full bg-black" />}
                      </div>
                      <div>
                        <div className="flex items-center gap-2 mb-0.5">
                          <span className="font-bold text-white text-sm sm:text-base">
                            Foundational Engineering Master Pass™
                          </span>
                          <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-white/[0.06] text-[#86868B]">
                            {selectedSubject.pages}
                          </span>
                        </div>
                        <div className="text-[11px] font-mono text-zinc-400 font-semibold mb-1">
                          📘 The Essential Technical Blueprint · 100% Concept Mastery &amp; Academic Excellence
                        </div>
                        <p className="text-xs text-[#86868B] leading-relaxed">
                          Complete {selectedSubject.pages} Theory Handbook PDF in your chosen language with verified silicon concepts, vector schematics, and practice MCQs. (Does NOT include the MNC Interview Vault, Practical Labs, or Salary Blueprint).
                        </p>
                      </div>
                    </div>
                    <div className="text-right shrink-0">
                      <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹199</div>
                      <div className="text-lg sm:text-xl font-black text-white">₹49</div>
                      <div className="text-[9px] font-mono text-zinc-400">SAVE 75%</div>
                    </div>
                  </div>
                </div>
              )}'''

assert old_modal_options in content, "old_modal_options not found!"
content = content.replace(old_modal_options, new_modal_options, 1)

# 3. Dynamic Modal Button Text
old_modal_btn = '''                <button
                  onClick={proceedToCheckoutWithSelectedPlan}
                  className={`w-full py-3.5 sm:py-4 rounded-xl sm:rounded-full font-black text-sm sm:text-base transition-all shadow-xl flex items-center justify-center gap-2 active:scale-98 ${
                    modalSelectedPlan === 'bundle'
                      ? 'bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-95 text-black shadow-emerald-500/30'
                      : 'bg-white hover:bg-zinc-200 text-black shadow-white/20'
                  }`}
                >
                  {modalSelectedPlan === 'bundle' ? (
                    <>
                      <span>Proceed with ₹149 Career Accelerator Suite (All Files + ZIP)</span>
                      <span>→</span>
                    </>
                  ) : (
                    <>
                      <span>Proceed with ₹49 Core Master Pass Only</span>
                      <span>→</span>
                    </>
                  )}
                </button>'''

new_modal_btn = '''                <button
                  onClick={proceedToCheckoutWithSelectedPlan}
                  className={`w-full py-3.5 sm:py-4 rounded-xl sm:rounded-full font-black text-sm sm:text-base transition-all shadow-xl flex items-center justify-center gap-2 active:scale-98 cursor-pointer ${
                    modalSelectedPlan === 'cheatsheet'
                      ? 'bg-gradient-to-r from-amber-400 to-amber-500 hover:brightness-110 text-black shadow-amber-500/30'
                      : modalSelectedPlan === 'bundle'
                      ? 'bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-95 text-black shadow-emerald-500/30'
                      : 'bg-white hover:bg-zinc-200 text-black shadow-white/20'
                  }`}
                >
                  {modalSelectedPlan === 'cheatsheet' ? (
                    <>
                      <span>Proceed with ₹22 Quick Desk Reference (8-Page PDF)</span>
                      <span>→</span>
                    </>
                  ) : modalSelectedPlan === 'bundle' ? (
                    <>
                      <span>Proceed with ₹149 Career Accelerator Suite (All Files + ZIP)</span>
                      <span>→</span>
                    </>
                  ) : (
                    <>
                      <span>Proceed with ₹49 Core Master Pass Only</span>
                      <span>→</span>
                    </>
                  )}
                </button>'''

assert old_modal_btn in content, "old_modal_btn not found!"
content = content.replace(old_modal_btn, new_modal_btn, 1)

# 4. Checkout Header Price Tag
old_checkout_price = '''                      <span className="text-base font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                        {checkoutItem.price === 149 ? '₹1,099' : '₹199'}
                      </span>'''

new_checkout_price = '''                      <span className="text-base font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                        {checkoutItem.price === 149 ? '₹1,099' : (checkoutItem.price === 22 ? '₹99' : '₹199')}
                      </span>'''

assert old_checkout_price in content, "old_checkout_price not found!"
content = content.replace(old_checkout_price, new_checkout_price, 1)

# 5. Victory Download Access: Handle Cheat Sheet
old_download_btn = '''                    <a
                      href={checkoutItem.plan === 'bundle' && selectedSubject.bundleZip ? selectedSubject.bundleZip : (selectedLanguage === 'gu' && selectedSubject.fullPdfGu ? selectedSubject.fullPdfGu : (selectedLanguage === 'hi' ? selectedSubject.fullPdfHi : selectedSubject.fullPdfEn))}
                      download
                      className="w-full py-4 sm:py-5 px-6 rounded-2xl bg-gradient-to-r from-emerald-400 via-teal-300 to-emerald-400 hover:brightness-110 text-black text-base sm:text-xl font-black tracking-tight text-center shadow-2xl shadow-emerald-500/50 transform hover:scale-[1.01] active:scale-[0.98] transition-all flex items-center justify-center gap-3 border-2 border-white/60 cursor-pointer block"
                    >
                      <span className="text-2xl sm:text-3xl">📥</span>
                      <span className="uppercase">DOWNLOAD NOTES NOW</span>
                      <span className="text-[11px] font-mono bg-black text-emerald-400 px-2.5 py-0.5 rounded-full font-bold">
                        {checkoutItem.plan === 'bundle' ? 'ZIP BUNDLE' : 'MASTER PDF'}
                      </span>
                    </a>

                    <p className="text-[11px] text-emerald-200/90 font-mono">
                      {checkoutItem.plan === 'bundle'
                        ? `📦 Complete Master Bundle (.ZIP · ${selectedSubject.bundleZipSize}) — All Theory Guides + Interview Vaults + Labs`
                        : `⚡ Core Master Guide (${selectedLanguage === 'gu' ? 'ગુજરાતી' : (selectedLanguage === 'hi' ? 'Hindi' : 'English')} Edition · ${selectedSubject.pages})`}
                    </p>'''

new_download_btn = '''                    <a
                      href={
                        checkoutItem.plan === 'cheatsheet'
                          ? (selectedLanguage === 'gu' ? (selectedSubject.cheatSheetPdfGu || selectedSubject.cheatSheetPdfHi) : (selectedLanguage === 'hi' ? selectedSubject.cheatSheetPdfHi : (selectedSubject.cheatSheetPdfEn || selectedSubject.cheatSheetPdfHi)))
                          : (checkoutItem.plan === 'bundle' && selectedSubject.bundleZip ? selectedSubject.bundleZip : (selectedLanguage === 'gu' && selectedSubject.fullPdfGu ? selectedSubject.fullPdfGu : (selectedLanguage === 'hi' ? selectedSubject.fullPdfHi : selectedSubject.fullPdfEn)))
                      }
                      download
                      className="w-full py-4 sm:py-5 px-6 rounded-2xl bg-gradient-to-r from-emerald-400 via-teal-300 to-emerald-400 hover:brightness-110 text-black text-base sm:text-xl font-black tracking-tight text-center shadow-2xl shadow-emerald-500/50 transform hover:scale-[1.01] active:scale-[0.98] transition-all flex items-center justify-center gap-3 border-2 border-white/60 cursor-pointer block"
                    >
                      <span className="text-2xl sm:text-3xl">📥</span>
                      <span className="uppercase">{checkoutItem.plan === 'cheatsheet' ? 'DOWNLOAD CHEAT SHEET' : 'DOWNLOAD NOTES NOW'}</span>
                      <span className="text-[11px] font-mono bg-black text-emerald-400 px-2.5 py-0.5 rounded-full font-bold">
                        {checkoutItem.plan === 'cheatsheet' ? '8-PAGE PDF' : (checkoutItem.plan === 'bundle' ? 'ZIP BUNDLE' : 'MASTER PDF')}
                      </span>
                    </a>

                    <p className="text-[11px] text-emerald-200/90 font-mono">
                      {checkoutItem.plan === 'cheatsheet'
                        ? `⚡ Tally Prime 2027 Quick Desk Reference (${selectedLanguage === 'gu' ? 'ગુજરાતી' : (selectedLanguage === 'hi' ? 'Hindi' : 'English')} Edition · 8 Pages Desk Companion)`
                        : checkoutItem.plan === 'bundle'
                        ? `📦 Complete Master Bundle (.ZIP · ${selectedSubject.bundleZipSize}) — All Theory Guides + Interview Vaults + Labs`
                        : `⚡ Core Master Guide (${selectedLanguage === 'gu' ? 'ગુજરાતી' : (selectedLanguage === 'hi' ? 'Hindi' : 'English')} Edition · ${selectedSubject.pages})`}
                    </p>'''

assert old_download_btn in content, "old_download_btn not found!"
content = content.replace(old_download_btn, new_download_btn, 1)

with open(notes_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Part 2: UI cards, modal options, and download handler updated successfully!")
