import React, { useState } from 'react';
import { Link } from 'react-router';
import { Mail, MessageSquare, Send, CheckCircle2, Globe, Clock, MapPin, Sparkles, HelpCircle } from 'lucide-react';

export function ContactPage() {
  const [formName, setFormName] = useState('');
  const [formEmail, setFormEmail] = useState('');
  const [formSubject, setFormSubject] = useState('Download Access & Receipt Inquiry');
  const [formMessage, setFormMessage] = useState('');
  const [isSubmitted, setIsSubmitted] = useState(false);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!formName.trim() || !formEmail.trim() || !formMessage.trim()) return;
    
    // Save locally or dispatch
    try {
      const messages = JSON.parse(localStorage.getItem('rtechlab_contact_queries') || '[]');
      messages.push({
        name: formName,
        email: formEmail,
        subject: formSubject,
        message: formMessage,
        date: new Date().toISOString(),
      });
      localStorage.setItem('rtechlab_contact_queries', JSON.stringify(messages));
    } catch {}

    setIsSubmitted(true);
  };

  return (
    <div className="min-h-screen bg-black text-[#EDEDED] py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-5xl mx-auto">
        
        {/* Breadcrumb Navigation */}
        <nav className="mb-6 flex items-center gap-1.5 text-xs font-mono text-[#86868B]">
          <Link to="/" className="hover:text-white transition-colors">Home</Link>
          <span>/</span>
          <Link to="/about" className="hover:text-white transition-colors">About</Link>
          <span>/</span>
          <span className="text-emerald-400">Contact Support</span>
        </nav>

        {/* Header */}
        <div className="mb-10 pb-8 border-b border-white/[0.08]">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-xs font-mono text-emerald-400 mb-3">
            <Mail className="w-3.5 h-3.5 text-emerald-400" />
            <span>Direct Student Support · Fast Turnaround</span>
          </div>
          <h1 className="text-3xl sm:text-5xl font-black text-white tracking-tight mb-4">
            Contact RTechLab Support
          </h1>
          <p className="text-sm sm:text-base text-[#86868B] leading-relaxed max-w-2xl">
            Have a question about your PDF downloads, payment receipt, or technical mentorship? Founder Rahul Patel and the RTechLab academic team are here to assist you.
          </p>
        </div>

        {/* Main 2-Column Grid */}
        <div className="grid grid-cols-1 lg:grid-cols-5 gap-8 mb-14">
          
          {/* Left Column: Direct Contact Info (2 cols) */}
          <div className="lg:col-span-2 space-y-5">
            
            {/* Primary Email Card */}
            <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
              <div className="w-10 h-10 rounded-xl bg-emerald-500/15 text-emerald-400 flex items-center justify-center mb-3">
                <Mail className="w-5 h-5" />
              </div>
              <div className="text-xs font-mono text-[#86868B] uppercase font-bold mb-1">
                Direct Founder &amp; Support Email
              </div>
              <a
                href="mailto:rahul.28e1@gmail.com"
                className="text-base font-bold text-white hover:text-emerald-400 transition-colors block font-mono"
              >
                rahul.28e1@gmail.com
              </a>
              <p className="text-xs text-[#86868B] mt-2 leading-relaxed">
                Send your payment ID, questions, or resume for direct mentorship review.
              </p>
            </div>

            {/* Official Channels */}
            <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
              <div className="text-xs font-mono text-white uppercase font-bold mb-3 flex items-center gap-2">
                <Globe className="w-4 h-4 text-cyan-400" />
                <span>Official Social Handles</span>
              </div>
              <ul className="space-y-3 text-xs font-mono">
                <li>
                  <a
                    href="https://www.instagram.com/rtechlabofficial/"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center justify-between text-[#A1A1A6] hover:text-pink-400 transition-colors p-2.5 rounded-xl bg-white/[0.03] border border-white/[0.06]"
                  >
                    <span>Instagram: @rtechlabofficial</span>
                    <span>↗</span>
                  </a>
                </li>
                <li>
                  <a
                    href="https://www.youtube.com/@RTechLabOfficial"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center justify-between text-[#A1A1A6] hover:text-red-400 transition-colors p-2.5 rounded-xl bg-white/[0.03] border border-white/[0.06]"
                  >
                    <span>YouTube: @RTechLabOfficial</span>
                    <span>↗</span>
                  </a>
                </li>
              </ul>
            </div>

            {/* Operating Hours & Location */}
            <div className="p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08] text-xs font-mono space-y-2 text-[#86868B]">
              <div className="flex items-center gap-2 text-white font-bold">
                <Clock className="w-4 h-4 text-amber-400" />
                <span>Support Response Hours</span>
              </div>
              <p className="text-[#D2D2D7]">
                Monday – Saturday: 09:30 AM – 08:30 PM (IST)
              </p>
              <div className="flex items-center gap-2 text-white font-bold pt-2">
                <MapPin className="w-4 h-4 text-emerald-400" />
                <span>Location</span>
              </div>
              <p className="text-[#D2D2D7]">
                RTechLab Publications · Gujarat, India
              </p>
            </div>

          </div>

          {/* Right Column: Interactive Support Request Form (3 cols) */}
          <div className="lg:col-span-3">
            <div className="p-6 sm:p-8 rounded-3xl bg-[#0D0D10] border border-white/[0.1] shadow-2xl">
              
              {!isSubmitted ? (
                <form onSubmit={handleSubmit} className="space-y-4">
                  <div className="mb-4">
                    <h2 className="text-xl font-bold text-white mb-1">
                      Send a Message to Support
                    </h2>
                    <p className="text-xs text-[#86868B]">
                      Fill out the form below and we will get back to your email within 12–24 hours.
                    </p>
                  </div>

                  <div>
                    <label className="text-xs font-mono text-[#86868B] block mb-1.5">
                      Your Full Name <span className="text-emerald-400">*</span>
                    </label>
                    <input
                      type="text"
                      placeholder="e.g. Rahul Sharma"
                      value={formName}
                      onChange={(e) => setFormName(e.target.value)}
                      required
                      className="w-full px-4 py-3 rounded-xl bg-white/[0.04] border border-white/10 text-xs text-white placeholder-[#86868B] focus:outline-none focus:border-emerald-400 font-mono transition-colors"
                    />
                  </div>

                  <div>
                    <label className="text-xs font-mono text-[#86868B] block mb-1.5">
                      Your Email Address <span className="text-emerald-400">*</span>
                    </label>
                    <input
                      type="email"
                      placeholder="e.g. rahul@example.com"
                      value={formEmail}
                      onChange={(e) => setFormEmail(e.target.value)}
                      required
                      className="w-full px-4 py-3 rounded-xl bg-white/[0.04] border border-white/10 text-xs text-white placeholder-[#86868B] focus:outline-none focus:border-emerald-400 font-mono transition-colors"
                    />
                  </div>

                  <div>
                    <label className="text-xs font-mono text-[#86868B] block mb-1.5">
                      Inquiry Category
                    </label>
                    <select
                      value={formSubject}
                      onChange={(e) => setFormSubject(e.target.value)}
                      className="w-full px-4 py-3 rounded-xl bg-[#141418] border border-white/10 text-xs text-white focus:outline-none focus:border-emerald-400 font-mono"
                    >
                      <option value="Download Access & Receipt Inquiry">Download Access &amp; Receipt Inquiry</option>
                      <option value="Payment Verification / Duplicate Deduction">Payment Verification / Duplicate Deduction</option>
                      <option value="Rahul Sir Mentorship & Resume Feedback">Rahul Sir Mentorship &amp; Resume Feedback</option>
                      <option value="Institutional / College Bulk Access">Institutional / College Bulk Access</option>
                      <option value="Other Technical Query">Other Technical Query</option>
                    </select>
                  </div>

                  <div>
                    <label className="text-xs font-mono text-[#86868B] block mb-1.5">
                      Your Message or Payment ID <span className="text-emerald-400">*</span>
                    </label>
                    <textarea
                      rows={4}
                      placeholder="Describe your issue or question. If this is regarding a recent purchase, please mention your Razorpay Payment ID..."
                      value={formMessage}
                      onChange={(e) => setFormMessage(e.target.value)}
                      required
                      className="w-full px-4 py-3 rounded-xl bg-white/[0.04] border border-white/10 text-xs text-white placeholder-[#86868B] focus:outline-none focus:border-emerald-400 font-mono transition-colors"
                    />
                  </div>

                  <button
                    type="submit"
                    className="w-full py-3.5 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-95 text-black font-black text-xs sm:text-sm transition-all shadow-lg shadow-emerald-500/20 flex items-center justify-center gap-2 active:scale-98 cursor-pointer"
                  >
                    <Send className="w-4 h-4" />
                    <span>Send Inquiry to Rahul Sir</span>
                  </button>

                  <p className="text-[10px] text-center text-[#86868B] font-mono">
                    🔒 Your email is 100% confidential. No spam guaranteed.
                  </p>
                </form>
              ) : (
                <div className="py-8 text-center space-y-4 animate-fadeIn">
                  <div className="w-16 h-16 rounded-full bg-emerald-500/20 text-emerald-400 flex items-center justify-center mx-auto border border-emerald-500/30">
                    <CheckCircle2 className="w-8 h-8" />
                  </div>
                  <h3 className="text-xl font-bold text-white">
                    Thank You, {formName}!
                  </h3>
                  <p className="text-xs text-[#D2D2D7] max-w-sm mx-auto leading-relaxed">
                    Your inquiry has been logged. Founder Rahul Patel will review your message and reply directly to <strong className="text-emerald-400">{formEmail}</strong>.
                  </p>
                  <button
                    type="button"
                    onClick={() => {
                      setIsSubmitted(false);
                      setFormMessage('');
                    }}
                    className="px-4 py-2 rounded-xl bg-white/[0.08] hover:bg-white/[0.15] text-xs font-mono text-white transition-all"
                  >
                    Send Another Message
                  </button>
                </div>
              )}

            </div>
          </div>

        </div>

        {/* Support FAQ Grid */}
        <div className="p-6 sm:p-8 rounded-3xl bg-[#0D0D10] border border-white/[0.08]">
          <h2 className="text-xl font-bold text-white mb-5 flex items-center gap-2">
            <HelpCircle className="w-5 h-5 text-emerald-400" />
            <span>Frequently Asked Support Questions</span>
          </h2>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-xs leading-relaxed">
            <div className="p-4 rounded-xl bg-white/[0.02] border border-white/[0.04]">
              <div className="font-bold text-white mb-1">
                Q: I paid via UPI/Card but my window closed. How do I get my files?
              </div>
              <p className="text-[#86868B]">
                Do not worry! Simply email <strong className="text-emerald-400">rahul.28e1@gmail.com</strong> with your Razorpay Payment ID or registered email, and your download links will be re-sent immediately.
              </p>
            </div>

            <div className="p-4 rounded-xl bg-white/[0.02] border border-white/[0.04]">
              <div className="font-bold text-white mb-1">
                Q: Can I read the notes on my Android/iPhone?
              </div>
              <p className="text-[#86868B]">
                Yes! All downloads are standard high-resolution PDF files with zero DRM locks. You can open and read them on Adobe Acrobat, Apple Books, Google Drive, or any PDF reader.
              </p>
            </div>

            <div className="p-4 rounded-xl bg-white/[0.02] border border-white/[0.04]">
              <div className="font-bold text-white mb-1">
                Q: How do I get direct mentorship from Rahul Sir?
              </div>
              <p className="text-[#86868B]">
                Every student who purchases the ₹149 Career Accelerator Suite gets direct email support with Rahul Sir (`rahul.28e1@gmail.com`) for resume feedback and placement guidance.
              </p>
            </div>

            <div className="p-4 rounded-xl bg-white/[0.02] border border-white/[0.04]">
              <div className="font-bold text-white mb-1">
                Q: Will I get future revisions and 2027 updates?
              </div>
              <p className="text-[#86868B]">
                Yes! All registered students receive 100% lifetime free yearly PDF edition updates directly to their email address.
              </p>
            </div>
          </div>
        </div>

      </div>
    </div>
  );
}

export default ContactPage;
