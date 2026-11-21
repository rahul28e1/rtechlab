import React, { useState, useMemo } from 'react';
import { 
  BookOpen, Download, Check, Sparkles, ArrowRight, ShieldCheck, 
  ExternalLink, ChevronRight, ArrowLeft, Eye, Award, Cpu, 
  Layers, HardDrive, Network, Cloud, Terminal, CheckCircle2,
  HelpCircle, Star, Zap, Share2
} from 'lucide-react';
import { NOTES_SUBJECTS, PRICING_TIERS } from '../data/notesCatalog';
import { UPI } from '../data/products';
import { buildUpiUri, buildWhatsAppLink, buildOrderMessage, formatINR } from '../utils/upi';
import { useQrDataUrl } from '../utils/useQr';

export function NotesPage() {
  const [selectedSubjectId, setSelectedSubjectId] = useState('office365');
  const [selectedTierId, setSelectedTierId] = useState('single');
  const [showCheckoutModal, setShowCheckoutModal] = useState(false);
  const [showPreviewModal, setShowPreviewModal] = useState(false);
  const [previewPage, setPreviewPage] = useState(1);
  const [lang, setLang] = useState('en'); // 'en' | 'hi'

  // Form state for checkout
  const [form, setForm] = useState({ name: '', email: '', utr: '' });
  const [copiedVpa, setCopiedVpa] = useState(false);
  const [formError, setFormError] = useState('');
  const [checkoutItem, setCheckoutItem] = useState({
    title: 'Microsoft Office 365 Master Guide',
    amount: 49,
    code: 'RTL-2027-O365',
  });

  const selectedSubject = useMemo(() => {
    return NOTES_SUBJECTS.find((s) => s.id === selectedSubjectId) || NOTES_SUBJECTS[0];
  }, [selectedSubjectId]);

  const selectedTier = useMemo(() => {
    return PRICING_TIERS.find((t) => t.id === selectedTierId) || PRICING_TIERS[0];
  }, [selectedTierId]);

  // Handle opening checkout
  const handleOpenCheckout = (item) => {
    setCheckoutItem(item);
    setShowCheckoutModal(true);
    setFormError('');
  };

  // UPI QR generation
  const note = `RTechLab ${checkoutItem.code}`;
  const upiUri = buildUpiUri({ vpa: UPI.vpa, name: UPI.name, amount: checkoutItem.amount, note });
  const qrDataUrl = useQrDataUrl(upiUri, 280);

  const copyVpa = async () => {
    try {
      await navigator.clipboard.writeText(UPI.vpa);
      setCopiedVpa(true);
      setTimeout(() => setCopiedVpa(false), 2000);
    } catch {
      setCopiedVpa(false);
    }
  };

  const handleFormSubmit = (e) => {
    e.preventDefault();
    if (form.name.trim().length < 2) return setFormError('कृपया अपना पूरा नाम दर्ज करें');
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(form.email.trim())) return setFormError('कृपया सही ईमेल दर्ज करें');
    if (form.utr.trim().length < 6) return setFormError('कृपया सही 12-अंक का UPI UTR / Transaction No दर्ज करें');

    setFormError('');
    const msg = buildOrderMessage({
      title: checkoutItem.title,
      amount: checkoutItem.amount,
      name: form.name.trim(),
      email: form.email.trim(),
      utr: form.utr.trim(),
    });
    window.open(buildWhatsAppLink(UPI.whatsapp, msg), '_blank', 'noopener');
  };

  return (
    <div className="min-h-screen bg-black text-[#f5f5f7] pb-24">
      {/* Top Banner / Announcement */}
      <div className="border-b border-white/[0.08] bg-[#0c0d0e]/80 backdrop-blur-md sticky top-0 z-30">
        <div className="max-w-6xl mx-auto px-4 py-3 flex items-center justify-between text-xs sm:text-sm">
          <div className="flex items-center gap-2">
            <span className="inline-flex items-center px-2 py-0.5 rounded text-[10px] font-bold bg-[#25B6F9]/10 text-[#25B6F9] border border-[#25B6F9]/30">
              2027 STANDARD
            </span>
            <span className="text-[#a1a1a6] hidden sm:inline">Official Handbooks by Rahul Sir</span>
            <span className="text-white font-medium">Single Notes at ₹49 Only</span>
          </div>
          <div className="flex items-center gap-3">
            <div className="inline-flex rounded-full bg-white/[0.06] p-0.5 border border-white/[0.1]">
              <button
                onClick={() => setLang('en')}
                className={`px-2.5 py-1 text-xs rounded-full transition-colors ${
                  lang === 'en' ? 'bg-[#0071E3] text-white font-medium' : 'text-[#86868b] hover:text-white'
                }`}
              >
                English
              </button>
              <button
                onClick={() => setLang('hi')}
                className={`px-2.5 py-1 text-xs rounded-full transition-colors ${
                  lang === 'hi' ? 'bg-[#0071E3] text-white font-medium' : 'text-[#86868b] hover:text-white'
                }`}
              >
                हिंदी
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-6xl mx-auto px-4 pt-10">
        {/* Main Hero Header */}
        <div className="text-center max-w-3xl mx-auto mb-10">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white/[0.05] border border-white/[0.1] text-xs text-[#2997FF] mb-4">
            <Sparkles className="w-3.5 h-3.5" />
            <span>Zero Subscriptions · Permanent Lifetime Access</span>
          </div>
          <h1 className="text-3xl sm:text-5xl font-extrabold tracking-tight text-white mb-4">
            Industrial Engineering & IT Notes
          </h1>
          <p className="text-base sm:text-lg text-[#86868b] leading-relaxed">
            {lang === 'en'
              ? 'Complete, illustrated visual textbooks designed for university exams, certifications, and technical interviews. Authentic hardware photography with zero filler.'
              : 'विश्वविद्यालय परीक्षा, प्रतियोगी परीक्षा और तकनीकी इंटरव्यू के लिए प्रामाणिक विज़ुअल नोट्स। 100% असली हार्डवेयर फोटोग्राफ्स एवं सरल व्याख्या।'}
          </p>
          <div className="mt-5 inline-flex flex-wrap items-center justify-center gap-3 text-xs sm:text-sm text-[#a1a1a6]">
            <span className="flex items-center gap-1.5"><CheckCircle2 className="w-4 h-4 text-[#10B981]" /> All Notes ₹49</span>
            <span className="text-white/20">•</span>
            <span className="flex items-center gap-1.5"><CheckCircle2 className="w-4 h-4 text-[#10B981]" /> Free 5-Page Preview</span>
            <span className="text-white/20">•</span>
            <span className="flex items-center gap-1.5"><CheckCircle2 className="w-4 h-4 text-[#10B981]" /> Dual EN + HI Editions</span>
            <span className="text-white/20">•</span>
            <span className="flex items-center gap-1.5"><CheckCircle2 className="w-4 h-4 text-[#10B981]" /> Instant UPI Delivery</span>
          </div>
        </div>

        {/* =========================================================================
            SUBJECT SELECTOR: TOPIC-WISE BOXES (MOBILE FRIENDLY HORIZONTAL / GRID)
           ========================================================================= */}
        <div className="mb-10">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-sm font-semibold tracking-wider uppercase text-[#86868b]">
              {lang === 'en' ? 'Select Subject / Module' : 'विषय चुनें (Topic Wise Catalog)'}
            </h2>
            <span className="text-xs text-[#2997FF]">
              {NOTES_SUBJECTS.length} Subjects Available
            </span>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-3">
            {NOTES_SUBJECTS.map((sub) => {
              const active = sub.id === selectedSubjectId;
              return (
                <button
                  key={sub.id}
                  onClick={() => setSelectedSubjectId(sub.id)}
                  className={`relative text-left p-4 rounded-2xl border transition-all duration-200 flex flex-col justify-between ${
                    active
                      ? 'bg-gradient-to-b from-[#18191c] to-[#0f1012] border-white/30 ring-1 ring-white/20 shadow-lg shadow-black/60'
                      : 'bg-[#101114]/80 border-white/[0.08] hover:border-white/20 hover:bg-[#141519]'
                  }`}
                >
                  {active && (
                    <span className="absolute -top-1.5 right-3 px-2 py-0.5 rounded-full text-[9px] font-bold bg-[#0071E3] text-white">
                      SELECTED
                    </span>
                  )}
                  <div>
                    <span className={`inline-block px-2 py-0.5 rounded text-[10px] font-bold border mb-2 ${sub.badgeColor}`}>
                      {sub.badge}
                    </span>
                    <h3 className="text-sm font-bold text-white line-clamp-1">
                      {lang === 'en' ? sub.title : sub.titleHi}
                    </h3>
                    <p className="mt-1 text-[11px] text-[#86868b] font-medium">
                      {sub.pages}
                    </p>
                  </div>
                  <div className="mt-4 pt-3 border-t border-white/[0.06] flex items-center justify-between">
                    <span className="text-sm font-extrabold text-[#2997FF]">₹{sub.price}</span>
                    <span className="text-[11px] text-[#a1a1a6] flex items-center gap-0.5">
                      View <ChevronRight className="w-3 h-3" />
                    </span>
                  </div>
                </button>
              );
            })}
          </div>
        </div>

        {/* =========================================================================
            ACTIVE SUBJECT DEEP DIVE: TOPICS, 5-PAGE PREVIEW & SYLLABUS
           ========================================================================= */}
        <div className="rounded-3xl border border-white/[0.12] bg-[#0c0d10] p-6 sm:p-8 shadow-2xl relative overflow-hidden mb-12">
          {/* Subtle Accent Glow */}
          <div 
            className="absolute top-0 right-0 w-96 h-96 rounded-full blur-3xl pointer-events-none opacity-10"
            style={{ backgroundColor: selectedSubject.accentColor }}
          />

          {/* Subject Header */}
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-6 pb-6 border-b border-white/[0.08]">
            <div>
              <div className="flex items-center gap-2 mb-2">
                <span className={`px-2.5 py-0.5 rounded text-xs font-bold border ${selectedSubject.badgeColor}`}>
                  {selectedSubject.badge}
                </span>
                <span className="text-xs text-[#86868b]">Code: {selectedSubject.code}</span>
                <span className="text-xs text-[#10B981] bg-[#10B981]/10 px-2 py-0.5 rounded border border-[#10B981]/30">
                  {selectedSubject.pages}
                </span>
              </div>
              <h2 className="text-2xl sm:text-3xl font-extrabold text-white">
                {lang === 'en' ? selectedSubject.title : selectedSubject.titleHi}
              </h2>
              <p className="mt-1.5 text-sm sm:text-base text-[#a1a1a6] max-w-2xl">
                {lang === 'en' ? selectedSubject.tagline : selectedSubject.taglineHi}
              </p>
              <div className="mt-3 flex items-center gap-2 text-xs text-[#6e6e73]">
                <span>Author: <strong className="text-white">{selectedSubject.author}</strong></span>
                <span>•</span>
                <span>Edition: <strong className="text-white">{selectedSubject.edition}</strong></span>
              </div>
            </div>

            {/* Quick Action CTA Box */}
            <div className="flex flex-col gap-2.5 shrink-0 min-w-[280px]">
              <div className="flex flex-col sm:flex-row md:flex-col gap-2">
                <button
                  onClick={() =>
                    handleOpenCheckout({
                      title: `${selectedSubject.title} Master Notes`,
                      amount: selectedSubject.price,
                      code: selectedSubject.code,
                    })
                  }
                  className="inline-flex items-center justify-center gap-2 px-5 py-3 rounded-full bg-white/[0.08] hover:bg-white/[0.14] text-white text-xs sm:text-sm font-semibold border border-white/[0.15] transition-all"
                >
                  <span>{lang === 'en' ? `Get Master Guide — ₹${selectedSubject.price}` : `मास्टर गाइड लें — ₹${selectedSubject.price}`}</span>
                  <ArrowRight className="w-3.5 h-3.5" />
                </button>

                <button
                  onClick={() =>
                    handleOpenCheckout({
                      title: selectedSubject.id === 'office365' 
                        ? 'Office 365 Career Accelerator 4-in-1 Bundle' 
                        : 'Career Accelerator Complete Bundle',
                      amount: selectedSubject.bundlePrice || 149,
                      code: selectedSubject.id === 'office365' ? 'RTL-2027-O365-BUNDLE' : 'RTL-2027-BUNDLE',
                    })
                  }
                  className="inline-flex items-center justify-center gap-2 px-5 py-3 rounded-full bg-gradient-to-r from-[#0071E3] to-[#0284C7] hover:from-[#0077ED] hover:to-[#0396E5] text-white text-xs sm:text-sm font-bold transition-all shadow-lg shadow-[#0071E3]/25 ring-1 ring-white/20"
                >
                  <Sparkles className="w-4 h-4 text-[#FDE047]" />
                  <span>{lang === 'en' ? 'Complete Bundle — ₹149' : 'सम्पूर्ण 4-इन-1 बंडल — ₹149'}</span>
                </button>
              </div>

              {/* Free 5-page Preview Buttons */}
              <div className="flex items-center gap-2">
                <a
                  href={selectedSubject.previewPdfEn || '#'}
                  target="_blank"
                  rel="noreferrer"
                  download
                  className="flex-1 inline-flex items-center justify-center gap-1.5 px-3 py-2 rounded-full bg-white/[0.04] hover:bg-white/[0.08] text-[11px] text-[#a1a1a6] hover:text-white border border-white/[0.08] transition-colors"
                >
                  <Download className="w-3 h-3 text-[#25B6F9]" />
                  <span>Free 5-Page (EN)</span>
                </a>
                {selectedSubject.previewPdfHi && (
                  <a
                    href={selectedSubject.previewPdfHi}
                    target="_blank"
                    rel="noreferrer"
                    download
                    className="flex-1 inline-flex items-center justify-center gap-1.5 px-3 py-2 rounded-full bg-white/[0.04] hover:bg-white/[0.08] text-[11px] text-[#a1a1a6] hover:text-white border border-white/[0.08] transition-colors"
                  >
                    <Download className="w-3 h-3 text-[#10B981]" />
                    <span>फ्री 5-पेज (हिंदी)</span>
                  </a>
                )}
              </div>
            </div>
          </div>

          {/* Real Photography & Authenticity Highlight Bar */}
          {selectedSubject.photoHighlights && (
            <div className="py-4 border-b border-white/[0.08]">
              <div className="flex items-center gap-2 mb-2 text-xs font-semibold uppercase tracking-wider text-[#25B6F9]">
                <Cpu className="w-3.5 h-3.5" />
                <span>Authentic Real Hardware Photographs (Zero Vector Clutter)</span>
              </div>
              <div className="flex flex-wrap gap-2">
                {selectedSubject.photoHighlights.map((photo, idx) => (
                  <span
                    key={idx}
                    className="px-2.5 py-1 rounded-md text-[11px] bg-white/[0.04] border border-white/[0.08] text-[#d1d1d6]"
                  >
                    📷 {photo}
                  </span>
                ))}
              </div>
            </div>
          )}

          {/* Topic-Wise Syllabus Breakdown */}
          <div className="pt-6">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-sm font-semibold uppercase tracking-wider text-[#86868b]">
                {lang === 'en' ? 'Complete Chapter & Topic Outline' : 'सम्पूर्ण अध्याय एवं टॉपिक रूपरेखा'}
              </h3>
              <span className="text-xs text-[#a1a1a6]">
                {selectedSubject.chapters.length} In-Depth Chapters
              </span>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
              {selectedSubject.chapters.map((ch, idx) => (
                <div
                  key={idx}
                  className="rounded-2xl border border-white/[0.08] bg-[#121316] p-5 hover:border-white/20 transition-all flex flex-col justify-between"
                >
                  <div>
                    <div className="flex items-center justify-between mb-2">
                      <span className="text-xs font-mono font-bold text-[#2997FF]">
                        CHAPTER {ch.num}
                      </span>
                      {ch.pages && (
                        <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-white/[0.05] text-[#86868b]">
                          {ch.pages}
                        </span>
                      )}
                    </div>
                    <h4 className="text-sm font-bold text-white mb-3">
                      {lang === 'en' || !ch.titleHi ? ch.title : ch.titleHi}
                    </h4>
                    <ul className="space-y-1.5 text-xs text-[#a1a1a6]">
                      {ch.topics.map((t, tidx) => (
                        <li key={tidx} className="flex items-start gap-1.5 leading-relaxed">
                          <span className="text-[#25B6F9] mt-0.5">•</span>
                          <span>{t}</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* =========================================================================
            TRANSPARENT VALUE MATRIX: ₹49 vs ₹149 vs ₹249
            (Directly fulfilling user request: "promotion 49 ka hi krna hai...
             option aaye comparision ho taki value of money pata chale")
           ========================================================================= */}
        <div className="mb-14">
          <div className="text-center max-w-2xl mx-auto mb-8">
            <span className="text-xs font-semibold uppercase tracking-widest text-[#25B6F9]">
              Transparent Pricing · Zero Hidden Costs
            </span>
            <h2 className="text-2xl sm:text-3xl font-extrabold text-white mt-1">
              {lang === 'en' ? 'Choose Your Learning Pass' : 'अपनी आवश्यकता अनुसार प्लान चुनें'}
            </h2>
            <p className="mt-2 text-xs sm:text-sm text-[#86868b]">
              {lang === 'en'
                ? 'We promote ₹49 because every student deserves affordable notes. If you want career accelerators, upgrade with 1 click; otherwise proceed with ₹49!'
                : '₹49 हर छात्र के लिए सुलभ नोट्स हैं। यदि आपको इंटरव्यू और सैलरी ब्लूप्रिंट चाहिए तो अपग्रेड करें, अन्यथा बिना किसी दबाव ₹49 से शुरुआत करें!'}
            </p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {PRICING_TIERS.map((tier) => {
              const isSelected = selectedTierId === tier.id;
              return (
                <div
                  key={tier.id}
                  className={`rounded-3xl border p-6 flex flex-col justify-between transition-all duration-200 relative ${
                    tier.highlight
                      ? 'bg-gradient-to-b from-[#141d2e] to-[#0f121a] border-[#0071E3] shadow-xl shadow-[#0071E3]/15 ring-1 ring-[#0071E3]'
                      : 'bg-[#101114] border-white/[0.08] hover:border-white/20'
                  }`}
                >
                  {tier.highlight && (
                    <div className="absolute -top-3 left-1/2 -translate-x-1/2 px-3 py-1 rounded-full text-[10px] font-bold bg-[#0071E3] text-white uppercase tracking-wider shadow-md">
                      {tier.badge}
                    </div>
                  )}

                  <div>
                    <div className="flex items-center justify-between mb-3">
                      <h3 className="text-base font-bold text-white">
                        {lang === 'en' ? tier.title : tier.titleHi}
                      </h3>
                      {!tier.highlight && (
                        <span className="text-[10px] font-mono text-[#86868b] px-2 py-0.5 rounded bg-white/[0.05]">
                          {tier.badge}
                        </span>
                      )}
                    </div>

                    <div className="flex items-baseline gap-2 mb-6">
                      <span className="text-3xl sm:text-4xl font-extrabold text-white">
                        ₹{tier.price}
                      </span>
                      <span className="text-sm text-[#6e6e73] line-through">
                        ₹{tier.originalPrice}
                      </span>
                      <span className="text-xs text-[#10B981] font-semibold">
                        One-Time
                      </span>
                    </div>

                    <div className="space-y-3 pb-6 border-b border-white/[0.08]">
                      {tier.deliverables.map((del, didx) => (
                        <div key={didx} className="flex items-start gap-2.5 text-xs">
                          {del.ok ? (
                            <Check className="w-4 h-4 text-[#10B981] shrink-0 mt-0.5" />
                          ) : (
                            <span className="w-4 h-4 text-[#48484a] shrink-0 text-center font-bold mt-0.5">—</span>
                          )}
                          <span className={del.ok ? 'text-[#d1d1d6]' : 'text-[#6e6e73]'}>
                            {del.name}
                          </span>
                        </div>
                      ))}
                    </div>
                  </div>

                  <div className="mt-6">
                    <button
                      onClick={() =>
                        handleOpenCheckout({
                          title: tier.title,
                          amount: tier.price,
                          code: tier.id === 'single' ? selectedSubject.code : tier.id === 'bundle' ? 'RTL-2027-BUNDLE' : 'RTL-2027-ALLACCESS',
                        })
                      }
                      className={`w-full py-3 rounded-full text-xs sm:text-sm font-semibold transition-all flex items-center justify-center gap-2 ${
                        tier.highlight
                          ? 'bg-[#0071E3] hover:bg-[#0077ED] text-white shadow-lg shadow-[#0071E3]/25'
                          : 'bg-white/[0.08] hover:bg-white/[0.15] text-white border border-white/[0.1]'
                      }`}
                    >
                      <span>{tier.id === 'single' ? `Get ${selectedSubject.title} (₹49)` : `Upgrade to ${tier.title} (₹${tier.price})`}</span>
                      <ArrowRight className="w-3.5 h-3.5" />
                    </button>
                  </div>
                </div>
              );
            })}
          </div>
        </div>

        {/* =========================================================================
            BEST BUY COMBOS (Cross-Sell / Relevant Bundles)
            (Directly fulfilling user request: "niche me best buy option ho jaise
             koi computer hardware le raha ho toh computer networking le sake... combo ho")
           ========================================================================= */}
        <div className="rounded-3xl border border-white/[0.1] bg-[#0d0e12] p-6 sm:p-8 mb-14">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-6">
            <div>
              <div className="inline-flex items-center gap-1.5 text-xs font-semibold text-[#F59E0B] uppercase tracking-wider mb-1">
                <Zap className="w-3.5 h-3.5" />
                <span>Best Buy Value Combos</span>
              </div>
              <h3 className="text-xl sm:text-2xl font-extrabold text-white">
                {lang === 'en' ? 'Frequently Bought Together' : 'छात्रों द्वारा सबसे अधिक पसंद किए जाने वाले कॉम्बो'}
              </h3>
            </div>
            <span className="text-xs text-[#86868b]">
              Extra Discount on Paired Modules
            </span>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {/* Active Subject Best Buy Combo */}
            {selectedSubject.bestBuyCombo && (
              <div className="rounded-2xl border border-white/[0.12] bg-[#14151a] p-5 flex flex-col justify-between">
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <span className="px-2 py-0.5 rounded text-[10px] font-bold bg-[#F59E0B]/10 text-[#F59E0B] border border-[#F59E0B]/30">
                      PAIRED WITH CURRENT SELECTION
                    </span>
                    <span className="text-xs text-[#10B981] font-semibold">
                      {selectedSubject.bestBuyCombo.savings}
                    </span>
                  </div>
                  <h4 className="text-base font-bold text-white">
                    {lang === 'en' ? selectedSubject.bestBuyCombo.title : selectedSubject.bestBuyCombo.titleHi}
                  </h4>
                  <p className="mt-1 text-xs text-[#a1a1a6] leading-relaxed">
                    {selectedSubject.bestBuyCombo.desc}
                  </p>
                </div>
                <div className="mt-4 pt-3 border-t border-white/[0.08] flex items-center justify-between">
                  <div>
                    <span className="text-xl font-extrabold text-white">₹{selectedSubject.bestBuyCombo.price}</span>
                    <span className="ml-2 text-xs text-[#6e6e73] line-through">₹{selectedSubject.bestBuyCombo.originalPrice}</span>
                  </div>
                  <button
                    onClick={() =>
                      handleOpenCheckout({
                        title: selectedSubject.bestBuyCombo.title,
                        amount: selectedSubject.bestBuyCombo.price,
                        code: selectedSubject.bestBuyCombo.id,
                      })
                    }
                    className="px-4 py-2 rounded-full bg-white/[0.1] hover:bg-white/[0.2] text-xs font-semibold text-white border border-white/20 transition-colors"
                  >
                    Get This Combo (₹{selectedSubject.bestBuyCombo.price}) →
                  </button>
                </div>
              </div>
            )}

            {/* Cloud or Hardware Companion Combo */}
            <div className="rounded-2xl border border-white/[0.12] bg-[#14151a] p-5 flex flex-col justify-between">
              <div>
                <div className="flex items-center justify-between mb-2">
                  <span className="px-2 py-0.5 rounded text-[10px] font-bold bg-[#10B981]/10 text-[#10B981] border border-[#10B981]/30">
                    ENTERPRISE CAREER TRACK
                  </span>
                  <span className="text-xs text-[#10B981] font-semibold">
                    Save ₹49 (35% OFF)
                  </span>
                </div>
                <h4 className="text-base font-bold text-white">
                  Hardware & Networking IT Support Combo
                </h4>
                <p className="mt-1 text-xs text-[#a1a1a6] leading-relaxed">
                  Computer Hardware (130+ Pages) + Computer Networking CCNA (126+ Pages). Complete enterprise triage skills.
                </p>
              </div>
              <div className="mt-4 pt-3 border-t border-white/[0.08] flex items-center justify-between">
                <div>
                  <span className="text-xl font-extrabold text-white">₹79</span>
                  <span className="ml-2 text-xs text-[#6e6e73] line-through">₹128</span>
                </div>
                <button
                  onClick={() =>
                    handleOpenCheckout({
                      title: 'Hardware & Networking IT Support Combo',
                      amount: 79,
                      code: 'COMBO-HW-NET',
                    })
                  }
                  className="px-4 py-2 rounded-full bg-white/[0.1] hover:bg-white/[0.2] text-xs font-semibold text-white border border-white/20 transition-colors"
                >
                  Get This Combo (₹79) →
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* =========================================================================
            FAQ ACCORDION SECTION
           ========================================================================= */}
        <div className="max-w-3xl mx-auto mb-16">
          <div className="text-center mb-8">
            <h3 className="text-xl sm:text-2xl font-bold text-white">Frequently Asked Questions</h3>
            <p className="text-xs text-[#86868b] mt-1">Everything you need to know about delivery and formats</p>
          </div>

          <div className="space-y-3">
            {[
              {
                q: 'Are the notes delivered in English or Hindi?',
                qHi: 'नोट्स हिंदी में हैं या अंग्रेज़ी में?',
                a: 'Both! Every purchase includes both independent editions: a pure English edition and a Hindi edition with technical terms in English so you can crack interviews smoothly.',
              },
              {
                q: 'Why are notes priced at ₹49?',
                qHi: 'नोट्स की कीमत ₹49 क्यों रखी गई है?',
                a: 'Rahul Sir’s primary mission is affordable, high-quality technical education across India. ₹49 covers server delivery costs while remaining 100% accessible to every college student.',
              },
              {
                q: 'How does delivery work after paying via UPI?',
                qHi: 'UPI पेमेंट के बाद फाइल कैसे मिलेगी?',
                a: 'After paying, simply submit your 12-digit UTR on WhatsApp in one click. Our automated delivery bot verifies it and dispatches your PDF to your email and WhatsApp within 10–30 minutes.',
              },
              {
                q: 'Can I read these notes smoothly on a mobile phone?',
                qHi: 'क्या इन्हें मोबाइल फोन पर आसानी से पढ़ा जा सकता है?',
                a: 'Yes! The typography uses crisp vector fonts, high-contrast light backgrounds, and 100% authentic photographs that zoom smoothly on any smartphone or tablet.',
              },
            ].map((faq, idx) => (
              <div key={idx} className="rounded-2xl border border-white/[0.08] bg-[#0e0f12] p-5">
                <h4 className="text-sm font-semibold text-white mb-2">
                  {lang === 'en' ? faq.q : faq.qHi}
                </h4>
                <p className="text-xs text-[#a1a1a6] leading-relaxed">
                  {faq.a}
                </p>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* =========================================================================
          CHECKOUT MODAL (UPI QR + 1-TAP WHATSAPP SUBMISSION)
         ========================================================================= */}
      {showCheckoutModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/80 backdrop-blur-md">
          <div className="rounded-3xl border border-white/[0.15] bg-[#111216] w-full max-w-md overflow-hidden shadow-2xl relative animate-in fade-in zoom-in-95 duration-150">
            {/* Modal Header */}
            <div className="flex items-center justify-between px-6 py-4 border-b border-white/[0.08] bg-[#16171d]">
              <div>
                <p className="text-[10px] font-bold uppercase tracking-wider text-[#25B6F9]">Instant UPI Delivery</p>
                <h3 className="text-base font-bold text-white">{checkoutItem.title}</h3>
              </div>
              <button
                onClick={() => setShowCheckoutModal(false)}
                className="w-7 h-7 rounded-full bg-white/[0.06] hover:bg-white/[0.12] text-white flex items-center justify-center text-xs"
              >
                ✕
              </button>
            </div>

            <div className="p-6 max-h-[85vh] overflow-y-auto">
              {/* Amount Display */}
              <div className="text-center pb-4 border-b border-white/[0.08] mb-4">
                <span className="text-xs text-[#86868b]">Total Payable Amount</span>
                <div className="text-3xl font-extrabold text-white mt-0.5">
                  ₹{checkoutItem.amount}
                </div>
                <span className="text-[11px] text-[#10B981] font-medium">
                  Zero Extra Processing Fees
                </span>
              </div>

              {/* QR Code Card */}
              <div className="flex flex-col items-center justify-center p-4 rounded-2xl bg-white text-black mb-4">
                {qrDataUrl ? (
                  <img src={qrDataUrl} alt="UPI Payment QR" className="w-48 h-48 rounded-lg" />
                ) : (
                  <div className="w-48 h-48 bg-gray-100 flex items-center justify-center text-xs text-gray-500">
                    Generating QR...
                  </div>
                )}
                <span className="mt-2 text-[10px] font-mono font-bold tracking-wider text-gray-800">
                  SCAN WITH ANY UPI APP (GPAY / PHONEPE / PAYTM)
                </span>
              </div>

              {/* VPA Copy Pill */}
              <div className="flex items-center justify-between p-3 rounded-xl bg-white/[0.04] border border-white/[0.08] mb-4 text-xs">
                <div>
                  <span className="text-[10px] text-[#86868b] block">UPI ID / VPA</span>
                  <span className="font-mono text-white font-semibold">{UPI.vpa}</span>
                </div>
                <button
                  onClick={copyVpa}
                  className="px-3 py-1.5 rounded-lg bg-white/[0.08] hover:bg-white/[0.15] text-white text-xs font-medium transition-colors"
                >
                  {copiedVpa ? '✓ Copied' : 'Copy UPI'}
                </button>
              </div>

              {/* Instant WhatsApp Verification Form */}
              <form onSubmit={handleFormSubmit} className="space-y-3">
                <p className="text-xs font-semibold text-white">After payment, verify to receive PDF:</p>
                <div>
                  <label className="text-[11px] text-[#86868b] block mb-1">Your Full Name</label>
                  <input
                    type="text"
                    required
                    value={form.name}
                    onChange={(e) => setForm({ ...form, name: e.target.value })}
                    placeholder="e.g. Rahul Sharma"
                    className="w-full px-3 py-2 rounded-xl bg-white/[0.05] border border-white/[0.1] text-xs text-white placeholder-white/30 focus:outline-none focus:border-[#0071E3]"
                  />
                </div>
                <div>
                  <label className="text-[11px] text-[#86868b] block mb-1">Email (PDF Delivery Address)</label>
                  <input
                    type="email"
                    required
                    value={form.email}
                    onChange={(e) => setForm({ ...form, email: e.target.value })}
                    placeholder="student@gmail.com"
                    className="w-full px-3 py-2 rounded-xl bg-white/[0.05] border border-white/[0.1] text-xs text-white placeholder-white/30 focus:outline-none focus:border-[#0071E3]"
                  />
                </div>
                <div>
                  <label className="text-[11px] text-[#86868b] block mb-1">UPI Transaction ID / UTR (12 Digits)</label>
                  <input
                    type="text"
                    required
                    value={form.utr}
                    onChange={(e) => setForm({ ...form, utr: e.target.value })}
                    placeholder="e.g. 412384910283"
                    className="w-full px-3 py-2 rounded-xl bg-white/[0.05] border border-white/[0.1] text-xs text-white placeholder-white/30 focus:outline-none focus:border-[#0071E3]"
                  />
                </div>

                {formError && (
                  <p className="text-xs text-[#EF4444] font-medium">{formError}</p>
                )}

                <button
                  type="submit"
                  className="w-full py-3 rounded-full bg-[#10B981] hover:bg-[#0EA472] text-white text-xs sm:text-sm font-semibold transition-all shadow-lg shadow-[#10B981]/20 flex items-center justify-center gap-2 mt-4"
                >
                  <span>Submit UTR via WhatsApp for Instant Delivery</span>
                  <ExternalLink className="w-4 h-4" />
                </button>
              </form>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
