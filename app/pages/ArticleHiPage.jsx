import React from 'react';
import { useParams, Link } from 'react-router';
import { tutorialsData } from '../../src/data/tutorials';
import { Clock, ArrowLeft, ArrowUpRight, CheckCircle2, Terminal, HelpCircle } from 'lucide-react';
import NotFoundPage from './NotFoundPage';

export function ArticleHiPage() {
  const { slug } = useParams();
  const article = tutorialsData.find(t => t.id === slug);

  if (!article) {
    return <NotFoundPage />;
  }

  return (
    <div className="min-h-screen bg-black text-[#EDEDED] py-12 px-4 sm:px-6 lg:px-8">
      <div className="mx-auto max-w-4xl">
        {/* Navigation Breadcrumb */}
        <div className="flex items-center justify-between mb-8 text-xs text-slate-400">
          <Link
            to="/hi/tutorials"
            className="inline-flex items-center gap-1.5 text-slate-400 hover:text-white transition-colors"
          >
            <ArrowLeft className="w-4 h-4" />
            <span>हिंदी ट्यूटोरियल्स पर वापस जाएं</span>
          </Link>
          <Link
            to={`/tutorials/${article.id}`}
            className="rounded-lg bg-blue-500/10 border border-blue-500/20 px-3 py-1 font-semibold text-blue-300 hover:bg-blue-500/20 transition-colors"
          >
            Read in English 🇬🇧
          </Link>
        </div>

        {/* Article Header */}
        <div className="mb-10 pb-8 border-b border-white/[0.08]">
          <div className="flex items-center gap-3 mb-4">
            <span className="rounded-full bg-emerald-500/15 border border-emerald-500/30 px-3 py-0.5 text-xs font-bold text-emerald-400 uppercase tracking-wide font-mono">
              {article.category}
            </span>
            <span className="flex items-center gap-1 text-xs text-slate-400">
              <Clock className="w-3.5 h-3.5" />
              {article.readTime}
            </span>
            <span className="text-xs text-slate-500 font-mono">· {article.difficultyHi || article.difficulty}</span>
          </div>

          <h1 className="text-3xl sm:text-4xl md:text-5xl font-black text-white tracking-tight leading-tight">
            {article.titleHi || article.title}
          </h1>

          <p className="mt-4 text-base sm:text-lg text-[#a1a1a6] leading-relaxed">
            {article.summaryHi || article.summary}
          </p>

          {/* Connected Tool Banner */}
          {article.connectedTool && (
            <div className="mt-6 p-4 rounded-xl bg-electric-950/40 border border-electric-500/30 flex items-center justify-between">
              <div className="flex items-center gap-3">
                <Terminal className="w-5 h-5 text-electric-400 flex-shrink-0" />
                <div>
                  <span className="text-xs font-bold text-white block">इंटरेक्टिव लैब टूल उपलब्ध है</span>
                  <span className="text-[11px] text-slate-400">इस सिद्धांत का ब्राउज़र में तुरंत अभ्यास करें</span>
                </div>
              </div>
              <Link
                to={article.connectedTool}
                className="inline-flex items-center gap-1.5 rounded-lg bg-electric-600 px-3.5 py-1.5 text-xs font-semibold text-white hover:bg-electric-500 transition-colors"
              >
                <span>टूल खोलें</span>
                <ArrowUpRight className="w-3.5 h-3.5" />
              </Link>
            </div>
          )}
        </div>

        {/* Content Body */}
        <div className="prose prose-invert max-w-none space-y-6 text-sm sm:text-base leading-relaxed text-[#c7c7c9]">
          <div className="p-6 rounded-2xl bg-[#141518] border border-white/[0.06] whitespace-pre-wrap font-sans">
            {article.contentMarkdownHi || article.contentMarkdown}
          </div>
        </div>

        {/* FAQs */}
        {article.faqs?.length > 0 && (
          <div className="mt-16 pt-10 border-t border-white/[0.08]">
            <h3 className="text-2xl font-bold text-white mb-6 flex items-center gap-2">
              <HelpCircle className="w-6 h-6 text-emerald-400" />
              <span>अक्सर पूछे जाने वाले सवाल (FAQs)</span>
            </h3>
            <div className="space-y-4">
              {article.faqs.map((faq, idx) => (
                <div key={idx} className="p-5 rounded-xl bg-[#1d1d1f] border border-white/[0.06]">
                  <h4 className="text-sm font-bold text-white mb-2">{faq.questionHi || faq.question}</h4>
                  <p className="text-xs sm:text-sm text-[#a1a1a6] leading-relaxed">{faq.answerHi || faq.answer}</p>
                </div>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

export default ArticleHiPage;
