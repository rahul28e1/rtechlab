import os

# 1. Update NotesPage.jsx Secondary Downloads for Cheat Sheet
notes_path = 'app/pages/NotesPage.jsx'
with open(notes_path, 'r', encoding='utf-8') as f:
    content = f.read()

old_sec_downloads = '''                    <div className={checkoutItem.plan === 'bundle' ? "grid grid-cols-1 sm:grid-cols-3 gap-2" : "grid grid-cols-1 gap-2"}>
                      {(checkoutItem.plan === 'bundle' || selectedLanguage === 'gu') && selectedSubject.fullPdfGu && (
                        <a
                          href={selectedSubject.fullPdfGu}
                          download
                          className="p-2.5 rounded-xl bg-white/[0.04] hover:bg-white/[0.08] border border-white/10 text-white flex items-center justify-between text-xs font-semibold group transition-all"
                        >
                          <span className="flex items-center gap-1.5 truncate">
                            <span>🦁</span>
                            <span className="truncate">ગુજરાતી આવૃત્તિ ({selectedSubject.pages})</span>
                          </span>
                          <span className="text-amber-400 font-mono text-[10px] shrink-0 font-bold">Direct Download ↓</span>
                        </a>
                      )}

                      {(checkoutItem.plan === 'bundle' || selectedLanguage === 'hi') && (
                        <a
                          href={selectedSubject.fullPdfHi}
                          download
                          className="p-2.5 rounded-xl bg-white/[0.04] hover:bg-white/[0.08] border border-white/10 text-white flex items-center justify-between text-xs font-semibold group transition-all"
                        >
                          <span className="flex items-center gap-1.5 truncate">
                            <span>🇮🇳</span>
                            <span className="truncate">Hindi Master PDF ({selectedSubject.pages})</span>
                          </span>
                          <span className="text-emerald-400 font-mono text-[10px] shrink-0 font-bold">Direct Download ↓</span>
                        </a>
                      )}

                      {(checkoutItem.plan === 'bundle' || selectedLanguage === 'en') && (
                        <a
                          href={selectedSubject.fullPdfEn}
                          download
                          className="p-2.5 rounded-xl bg-white/[0.04] hover:bg-white/[0.08] border border-white/10 text-white flex items-center justify-between text-xs font-semibold group transition-all"
                        >
                          <span className="flex items-center gap-1.5 truncate">
                            <span>🇬🇧</span>
                            <span className="truncate">English Master PDF ({selectedSubject.pages})</span>
                          </span>
                          <span className="text-emerald-400 font-mono text-[10px] shrink-0 font-bold">Direct Download ↓</span>
                        </a>
                      )}
                    </div>'''

new_sec_downloads = '''                    <div className={checkoutItem.plan === 'bundle' ? "grid grid-cols-1 sm:grid-cols-3 gap-2" : "grid grid-cols-1 gap-2"}>
                      {(checkoutItem.plan === 'bundle' || selectedLanguage === 'gu') && (
                        <a
                          href={checkoutItem.plan === 'cheatsheet' ? (selectedSubject.cheatSheetPdfGu || selectedSubject.cheatSheetPdfHi) : selectedSubject.fullPdfGu}
                          download
                          className="p-2.5 rounded-xl bg-white/[0.04] hover:bg-white/[0.08] border border-white/10 text-white flex items-center justify-between text-xs font-semibold group transition-all"
                        >
                          <span className="flex items-center gap-1.5 truncate">
                            <span>🦁</span>
                            <span className="truncate">ગુજરાતી આવૃત્તિ ({checkoutItem.plan === 'cheatsheet' ? '8 Pages Desk Sheet' : selectedSubject.pages})</span>
                          </span>
                          <span className="text-amber-400 font-mono text-[10px] shrink-0 font-bold">Direct Download ↓</span>
                        </a>
                      )}

                      {(checkoutItem.plan === 'bundle' || selectedLanguage === 'hi') && (
                        <a
                          href={checkoutItem.plan === 'cheatsheet' ? selectedSubject.cheatSheetPdfHi : selectedSubject.fullPdfHi}
                          download
                          className="p-2.5 rounded-xl bg-white/[0.04] hover:bg-white/[0.08] border border-white/10 text-white flex items-center justify-between text-xs font-semibold group transition-all"
                        >
                          <span className="flex items-center gap-1.5 truncate">
                            <span>🇮🇳</span>
                            <span className="truncate">Hindi Edition ({checkoutItem.plan === 'cheatsheet' ? '8 Pages Desk Sheet' : selectedSubject.pages})</span>
                          </span>
                          <span className="text-emerald-400 font-mono text-[10px] shrink-0 font-bold">Direct Download ↓</span>
                        </a>
                      )}

                      {(checkoutItem.plan === 'bundle' || selectedLanguage === 'en') && (
                        <a
                          href={checkoutItem.plan === 'cheatsheet' ? (selectedSubject.cheatSheetPdfEn || selectedSubject.cheatSheetPdfHi) : selectedSubject.fullPdfEn}
                          download
                          className="p-2.5 rounded-xl bg-white/[0.04] hover:bg-white/[0.08] border border-white/10 text-white flex items-center justify-between text-xs font-semibold group transition-all"
                        >
                          <span className="flex items-center gap-1.5 truncate">
                            <span>🇬🇧</span>
                            <span className="truncate">English Edition ({checkoutItem.plan === 'cheatsheet' ? '8 Pages Desk Sheet' : selectedSubject.pages})</span>
                          </span>
                          <span className="text-emerald-400 font-mono text-[10px] shrink-0 font-bold">Direct Download ↓</span>
                        </a>
                      )}
                    </div>'''

assert old_sec_downloads in content, "old_sec_downloads not found in NotesPage.jsx!"
content = content.replace(old_sec_downloads, new_sec_downloads, 1)

with open(notes_path, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated NotesPage.jsx secondary downloads!")

# 2. Update FeaturedNotesShelf.jsx
shelf_path = 'app/components/FeaturedNotesShelf.jsx'
with open(shelf_path, 'r', encoding='utf-8') as f:
    shelf_content = f.read()

old_shelf_tally = '''  {
    id: 'tally',
    title: 'Tally Prime with GST & Corporate Accounting',
    subtitle: 'Golden Rules, 28 Groups, 24 Vouchers, Modern GST (0%/5%/18%) & TDS',
    pages: '51 Pages',
    tag: 'Commerce & Accounting',
    badge: '📊 Gujarat #1 Vocational Track',
    previewUrl: '/downloads/Tally-Prime-Hindi-Edition-1-5Page-Preview.pdf',
    price: 49,
    accent: 'amber',
    highlights: ['28 Groups & 24 Vouchers', 'Modern GST 0%, 5%, 18% Slabs', 'TDS & 50+ Real Business Invoices'],
  },'''

new_shelf_tally = '''  {
    id: 'tally',
    title: 'Tally Prime with GST & Corporate Accounting',
    subtitle: 'Golden Rules, 28 Groups, 24 Vouchers, Modern GST (0%/5%/18%) & TDS',
    pages: '⚡ 8p Sheet & 51p Book',
    tag: 'Commerce & Accounting',
    badge: '📊 2 Editions: ₹22 & ₹49',
    previewUrl: '/downloads/Tally-Prime-Hindi-Edition-1-5Page-Preview.pdf',
    price: 22,
    secondPrice: 49,
    accent: 'amber',
    highlights: ['28 Groups & 24 Vouchers (8p Desk Reference)', 'Modern GST 0%, 5%, 18% Slabs & TDS', '50+ Real Commercial Invoices (51p Guide)'],
  },'''

assert old_shelf_tally in shelf_content, "old_shelf_tally not found!"
shelf_content = shelf_content.replace(old_shelf_tally, new_shelf_tally, 1)

old_shelf_btn = '''            {/* Price & Action Buttons */}
            <div className="pt-3 border-t border-white/[0.06] space-y-2">
              <div className="flex items-baseline justify-between mb-1">
                <div className="flex items-baseline gap-1.5">
                  <span className="text-lg font-black text-white">₹{book.price}</span>
                  <span className="text-[10px] text-[#86868B] line-through">₹299</span>
                </div>
                <span className="text-[10px] font-mono text-emerald-400 font-semibold bg-emerald-500/10 px-2 py-0.5 rounded">
                  Hindi / Eng / ગુજ
                </span>
              </div>

              <div className="grid grid-cols-2 gap-2">
                <a
                  href={book.previewUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="py-2 px-2.5 rounded-xl bg-white/[0.05] hover:bg-white/[0.1] border border-white/10 text-white text-xs font-semibold text-center transition-all active:scale-95 truncate"
                >
                  📖 Sample
                </a>
                <Link
                  to={`/notes?book=${book.id}`}
                  className="py-2 px-2.5 rounded-xl bg-emerald-400 hover:bg-emerald-300 text-black text-xs font-extrabold text-center transition-all shadow-md shadow-emerald-500/20 active:scale-95 truncate"
                >
                  ⚡ Get ₹{book.price}
                </Link>
              </div>
            </div>'''

new_shelf_btn = '''            {/* Price & Action Buttons */}
            <div className="pt-3 border-t border-white/[0.06] space-y-2">
              {book.id === 'tally' ? (
                <>
                  <div className="flex items-baseline justify-between mb-1">
                    <div className="flex items-baseline gap-1.5">
                      <span className="text-base font-black text-amber-400">₹22</span>
                      <span className="text-[10px] text-[#86868B]">or</span>
                      <span className="text-base font-black text-emerald-400">₹49</span>
                      <span className="text-[10px] text-[#86868B] line-through">₹199</span>
                    </div>
                    <span className="text-[10px] font-mono text-amber-400 font-semibold bg-amber-500/10 px-2 py-0.5 rounded">
                      Desk Sheet / Master
                    </span>
                  </div>

                  <div className="grid grid-cols-2 gap-2">
                    <Link
                      to="/notes?book=tally&plan=cheatsheet"
                      className="py-2 px-2 rounded-xl bg-gradient-to-r from-amber-400 to-amber-500 hover:brightness-110 text-black text-xs font-black text-center transition-all shadow-md shadow-amber-500/20 active:scale-95 truncate cursor-pointer"
                    >
                      ⚡ ₹22 Sheet
                    </Link>
                    <Link
                      to="/notes?book=tally&plan=single"
                      className="py-2 px-2 rounded-xl bg-emerald-400 hover:bg-emerald-300 text-black text-xs font-black text-center transition-all shadow-md shadow-emerald-500/20 active:scale-95 truncate cursor-pointer"
                    >
                      📘 ₹49 Book
                    </Link>
                  </div>
                </>
              ) : (
                <>
                  <div className="flex items-baseline justify-between mb-1">
                    <div className="flex items-baseline gap-1.5">
                      <span className="text-lg font-black text-white">₹{book.price}</span>
                      <span className="text-[10px] text-[#86868B] line-through">₹299</span>
                    </div>
                    <span className="text-[10px] font-mono text-emerald-400 font-semibold bg-emerald-500/10 px-2 py-0.5 rounded">
                      Hindi / Eng / ગુજ
                    </span>
                  </div>

                  <div className="grid grid-cols-2 gap-2">
                    <a
                      href={book.previewUrl}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="py-2 px-2.5 rounded-xl bg-white/[0.05] hover:bg-white/[0.1] border border-white/10 text-white text-xs font-semibold text-center transition-all active:scale-95 truncate"
                    >
                      📖 Sample
                    </a>
                    <Link
                      to={`/notes?book=${book.id}`}
                      className="py-2 px-2.5 rounded-xl bg-emerald-400 hover:bg-emerald-300 text-black text-xs font-extrabold text-center transition-all shadow-md shadow-emerald-500/20 active:scale-95 truncate"
                    >
                      ⚡ Get ₹{book.price}
                    </Link>
                  </div>
                </>
              )}
            </div>'''

assert old_shelf_btn in shelf_content, "old_shelf_btn not found!"
shelf_content = shelf_content.replace(old_shelf_btn, new_shelf_btn, 1)

with open(shelf_path, 'w', encoding='utf-8') as f:
    f.write(shelf_content)
print("Updated FeaturedNotesShelf.jsx!")
