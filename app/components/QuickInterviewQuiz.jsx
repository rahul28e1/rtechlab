import React, { useState } from 'react';
import { Link } from 'react-router';

const QUIZ_QUESTIONS = [
  {
    id: 1,
    tag: 'Networking / CCNA',
    difficulty: 'Core Cisco TAC',
    question: 'What is the broadcast address for the subnetwork 192.168.10.64/27?',
    options: [
      { id: 'a', text: '192.168.10.95', correct: true },
      { id: 'b', text: '192.168.10.127', correct: false },
      { id: 'c', text: '192.168.10.255', correct: false },
      { id: 'd', text: '192.168.10.63', correct: false },
    ],
    explanation: 'A /27 subnet mask (255.255.255.224) has a block size of 32 (256 - 224). The subnet starts at .64 and spans 32 IPs (.64 to .95). The broadcast IP is always the last address: 192.168.10.95.',
    bookId: 'ccna',
    bookTitle: 'Cisco CCNA 200-301 Master Suite',
  },
  {
    id: 2,
    tag: 'Systems & Linux',
    difficulty: 'Production Incident',
    question: "A Linux server returns 'No space left on device', but 'df -h' shows 40% disk space free. Which command reveals the root cause?",
    options: [
      { id: 'a', text: 'free -m', correct: false },
      { id: 'b', text: 'df -i', correct: true },
      { id: 'c', text: 'uname -r', correct: false },
      { id: 'd', text: 'uptime', correct: false },
    ],
    explanation: "'df -i' inspects Inode exhaustion. If millions of small logs or session files consume all available inode pointers, the OS cannot create any new file even with hundreds of gigabytes remaining.",
    bookId: 'fundamentals',
    bookTitle: 'Computer Fundamentals & Architecture',
  },
  {
    id: 3,
    tag: 'Enterprise Protocols',
    difficulty: 'High Yield',
    question: 'During a TCP 3-way handshake, what packet flags does the server respond with after receiving the client SYN?',
    options: [
      { id: 'a', text: 'ACK only', correct: false },
      { id: 'b', text: 'SYN-ACK', correct: true },
      { id: 'c', text: 'RST-ACK', correct: false },
      { id: 'd', text: 'FIN-ACK', correct: false },
    ],
    explanation: 'The server synchronizes its own sequence number with SYN and acknowledges the client sequence number with ACK in a single combined SYN-ACK packet.',
    bookId: 'ccna',
    bookTitle: 'Cisco CCNA 200-301 Master Suite',
  },
  {
    id: 4,
    tag: 'Artificial Intelligence',
    difficulty: 'Next-Gen ML',
    question: 'What core architecture mechanism allows modern LLMs & Transformers to process tokens in parallel rather than sequentially?',
    options: [
      { id: 'a', text: 'Multi-Head Self-Attention', correct: true },
      { id: 'b', text: 'Recurrent Hidden Loop', correct: false },
      { id: 'c', text: 'Gradient Clipping', correct: false },
      { id: 'd', text: 'Markov State Chain', correct: false },
    ],
    explanation: 'Self-Attention computes pairwise relationship matrices between all tokens simultaneously via GPU matrix multiplication, eliminating the sequential bottleneck of legacy RNNs.',
    bookId: 'ai',
    bookTitle: 'Artificial Intelligence Mastery',
  },
  {
    id: 5,
    tag: 'Corporate MIS / Excel',
    difficulty: 'MNC Placement',
    question: 'Why is XLOOKUP universally preferred over legacy VLOOKUP in enterprise financial models?',
    options: [
      { id: 'a', text: 'It requires sorted lookup columns in ascending order', correct: false },
      { id: 'b', text: 'It defaults to exact match & looks left or right without breaking column indices', correct: true },
      { id: 'c', text: 'It automatically saves backups to Microsoft OneDrive', correct: false },
      { id: 'd', text: 'It only operates on numbers, preventing text corruptions', correct: false },
    ],
    explanation: 'XLOOKUP defaults to exact match, can retrieve columns to the left of the lookup vector, and uses range references that never break when columns are inserted or deleted.',
    bookId: 'office-365',
    bookTitle: 'Microsoft Office 365 Enterprise Suite',
  },
];

export function QuickInterviewQuiz() {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedOption, setSelectedOption] = useState(null);
  const [score, setScore] = useState(0);
  const [answeredCount, setAnsweredCount] = useState(0);

  const q = QUIZ_QUESTIONS[currentIndex];
  const isAnswered = selectedOption !== null;
  const isCorrect = isAnswered && q.options.find((o) => o.id === selectedOption)?.correct;

  const handleSelect = (optionId) => {
    if (isAnswered) return;
    setSelectedOption(optionId);
    const chosen = q.options.find((o) => o.id === optionId);
    if (chosen?.correct) {
      setScore((s) => s + 1);
    }
    setAnsweredCount((c) => c + 1);
  };

  const handleNext = () => {
    setSelectedOption(null);
    setCurrentIndex((prev) => (prev + 1) % QUIZ_QUESTIONS.length);
  };

  return (
    <section className="py-14 sm:py-20 px-4 sm:px-6 lg:px-8 border-t border-white/[0.06] bg-gradient-to-b from-[#090a0f] via-[#0d0f17] to-[#090a0f]">
      <div className="max-w-4xl mx-auto">
        {/* Header */}
        <div className="text-center mb-8 sm:mb-12">
          <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 text-xs font-mono font-semibold mb-3">
            <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-ping" />
            <span>⚡ Daily 10-Second Technical Challenge</span>
          </div>
          <h2 className="text-2xl sm:text-3xl md:text-4xl font-black text-white tracking-tight">
            Test Your Engineering Depth
          </h2>
          <p className="text-sm sm:text-base text-[#86868B] max-w-xl mx-auto mt-2">
            Instant feedback. Zero login required. Real production interview scenarios asked by Cisco, Amazon, and enterprise NOC teams.
          </p>
        </div>

        {/* Interactive Quiz Card */}
        <div className="rounded-2xl sm:rounded-3xl bg-[#0f111a] border border-white/[0.1] p-5 sm:p-8 shadow-2xl relative overflow-hidden">
          {/* Subtle Ambient Glow */}
          <div className="absolute top-0 right-0 w-64 h-64 bg-emerald-500/5 blur-3xl pointer-events-none" />

          {/* Question Meta Bar */}
          <div className="flex items-center justify-between gap-3 mb-5 pb-4 border-b border-white/[0.06]">
            <div className="flex items-center gap-2">
              <span className="text-[11px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.06] text-white/90 border border-white/[0.08] font-semibold">
                {q.tag}
              </span>
              <span className="text-xs text-[#86868B] font-mono hidden sm:inline">
                {q.difficulty}
              </span>
            </div>
            <div className="flex items-center gap-3">
              <span className="text-xs font-mono text-[#86868B]">
                Question {currentIndex + 1} of {QUIZ_QUESTIONS.length}
              </span>
              {answeredCount > 0 && (
                <span className="text-xs font-mono font-bold text-emerald-400 bg-emerald-500/10 px-2 py-0.5 rounded border border-emerald-500/20">
                  Score: {score}/{answeredCount}
                </span>
              )}
            </div>
          </div>

          {/* Question Text */}
          <h3 className="text-base sm:text-xl font-bold text-white tracking-tight leading-snug mb-6">
            {q.question}
          </h3>

          {/* 4 Options Grid */}
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 mb-6">
            {q.options.map((opt) => {
              const isSelected = selectedOption === opt.id;
              let optionStyle =
                'bg-white/[0.03] border-white/[0.08] text-white/90 hover:bg-white/[0.08] hover:border-white/20';

              if (isAnswered) {
                if (opt.correct) {
                  optionStyle = 'bg-emerald-500/15 border-emerald-400 text-emerald-200 font-semibold ring-1 ring-emerald-400/50';
                } else if (isSelected && !opt.correct) {
                  optionStyle = 'bg-rose-500/15 border-rose-400 text-rose-200 font-semibold';
                } else {
                  optionStyle = 'bg-white/[0.02] border-white/[0.04] text-white/40 opacity-50';
                }
              }

              return (
                <button
                  key={opt.id}
                  onClick={() => handleSelect(opt.id)}
                  disabled={isAnswered}
                  className={`text-left p-4 rounded-xl border transition-all duration-200 flex items-start gap-3 text-xs sm:text-sm active:scale-[0.99] cursor-pointer disabled:cursor-default ${optionStyle}`}
                >
                  <span className="w-5 h-5 rounded-full bg-white/[0.08] flex items-center justify-center font-mono text-[10px] font-bold shrink-0 mt-0.5">
                    {opt.id.toUpperCase()}
                  </span>
                  <span className="flex-1 leading-relaxed">{opt.text}</span>
                  {isAnswered && opt.correct && (
                    <span className="text-emerald-400 text-sm font-bold shrink-0">✓</span>
                  )}
                  {isAnswered && isSelected && !opt.correct && (
                    <span className="text-rose-400 text-sm font-bold shrink-0">✗</span>
                  )}
                </button>
              );
            })}
          </div>

          {/* Answer Explanation & Next Actions */}
          {isAnswered && (
            <div className="pt-5 border-t border-white/[0.08] space-y-4 animate-fadeIn">
              <div
                className={`p-4 rounded-xl border text-xs sm:text-sm leading-relaxed ${
                  isCorrect
                    ? 'bg-emerald-950/30 border-emerald-500/30 text-emerald-100'
                    : 'bg-rose-950/30 border-rose-500/30 text-rose-100'
                }`}
              >
                <div className="font-bold mb-1 flex items-center gap-1.5">
                  <span>{isCorrect ? '🎉 Correct Answer!' : '❌ Incorrect'}</span>
                </div>
                <p className="text-white/80">{q.explanation}</p>
              </div>

              {/* Bottom Row: Next Question & Handbook Upsell */}
              <div className="flex flex-col sm:flex-row items-center justify-between gap-3 pt-2">
                <button
                  onClick={handleNext}
                  className="w-full sm:w-auto px-5 py-2.5 rounded-xl bg-white/[0.08] hover:bg-white/[0.15] border border-white/10 text-white text-xs font-semibold transition-all active:scale-95 flex items-center justify-center gap-2 cursor-pointer"
                >
                  <span>Next Challenge</span>
                  <span>&rarr;</span>
                </button>

                <Link
                  to={`/notes?book=${q.bookId}`}
                  className="w-full sm:w-auto px-5 py-2.5 rounded-xl bg-emerald-400 hover:bg-emerald-300 text-black text-xs font-extrabold transition-all shadow-md shadow-emerald-500/20 active:scale-95 flex items-center justify-center gap-2"
                >
                  <span>Want 100+ Real Interview Questions? Get Notes (₹49)</span>
                  <span>&rarr;</span>
                </Link>
              </div>
            </div>
          )}
        </div>
      </div>
    </section>
  );
}
