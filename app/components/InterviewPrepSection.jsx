import React, { useState } from 'react';
import { Link } from 'react-router';
import { interviewQuestionsData } from '../../src/data/interviewQuestions';

export function InterviewPrepSection() {
  const [activeId, setActiveId] = useState(null);
  const questions = interviewQuestionsData.slice(0, 5);

  return (
    <section id="interview-prep" className="py-20 px-4 sm:px-6 lg:px-8 border-t border-white/[0.06]">
      <div className="max-w-5xl mx-auto">
        <div className="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12">
          <div>
            <div className="text-xs font-mono uppercase tracking-widest text-[#86868B] mb-2 font-semibold">
              Interview Questions &amp; Scenarios
            </div>
            <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white tracking-tight">
              High-Yield Interview Prep
            </h2>
          </div>
          <p className="text-[#A1A1A6] text-sm sm:text-base max-w-md font-normal leading-relaxed">
            Real production interview scenarios asked by Cisco, Amazon, and enterprise NOCs. Test your depth.
          </p>
        </div>

        <div className="space-y-3">
          {questions.map((q) => {
            const isOpen = activeId === q.id;
            return (
              <div
                key={q.id}
                className={`rounded-2xl border transition-all duration-300 overflow-hidden ${
                  isOpen
                    ? 'bg-[#121215] border-white/30 shadow-2xl'
                    : 'bg-[#0D0D0F] border-white/[0.08] hover:border-white/20'
                }`}
              >
                <button
                  className="w-full text-left p-6 sm:p-7 flex items-start justify-between gap-4 cursor-pointer"
                  onClick={() => setActiveId(isOpen ? null : q.id)}
                  aria-expanded={isOpen}
                >
                  <div className="flex-1 min-w-0">
                    <div className="flex flex-wrap items-center gap-2 mb-3">
                      <span className="text-[11px] font-mono font-semibold px-2.5 py-0.5 rounded-full bg-white/[0.08] text-white border border-white/[0.1]">
                        {q.difficulty}
                      </span>
                      <span className="text-xs text-[#86868B] font-mono">
                        {q.category}
                      </span>
                    </div>
                    <h3 className="text-base sm:text-lg font-bold text-white leading-snug tracking-tight">
                      {q.question}
                    </h3>
                  </div>
                  <div className={`w-8 h-8 rounded-full bg-white/[0.05] border border-white/[0.1] flex items-center justify-center text-white flex-shrink-0 mt-1 transition-transform duration-300 ${isOpen ? 'rotate-180 bg-white text-black' : ''}`}>
                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                  </div>
                </button>

                {isOpen && (
                  <div className="px-6 sm:px-7 pb-6 pt-2 border-t border-white/[0.06] text-[#D2D2D7] text-sm sm:text-base leading-relaxed animate-fadeIn">
                    <p className="mb-4">{q.answer}</p>
                    {q.command && (
                      <div className="mt-4 p-4 rounded-xl bg-black border border-white/[0.1] font-mono text-xs sm:text-sm text-emerald-400 overflow-x-auto flex items-center gap-3">
                        <span className="text-[#86868B] select-none font-bold">$</span>
                        <code>{q.command}</code>
                      </div>
                    )}
                  </div>
                )}
              </div>
            );
          })}
        </div>

        <div className="text-center mt-10">
          <Link
            to="/notes"
            className="inline-flex items-center gap-2 px-6 py-3 rounded-full bg-white/[0.05] hover:bg-white/[0.1] border border-white/[0.1] text-white text-sm font-semibold transition-all"
          >
            Access Full Question Bank (50+ Scenarios) →
          </Link>
        </div>
      </div>
    </section>
  );
}
