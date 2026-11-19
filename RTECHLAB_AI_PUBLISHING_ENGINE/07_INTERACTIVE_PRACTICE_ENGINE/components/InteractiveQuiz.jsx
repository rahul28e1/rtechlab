import React, { useState, useMemo } from 'react';

/**
 * RTechLab Interactive Practice Engine Prototype
 * Supports English & Hindi, tiered difficulties, instant feedback,
 * detailed explanations, and score tracking.
 */
export default function InteractiveQuiz({ topicTitle = "Computer Hardware Architecture", questions = [] }) {
  const [selectedDifficulty, setSelectedDifficulty] = useState('ALL');
  const [currentIdx, setCurrentIdx] = useState(0);
  const [userAnswers, setUserAnswers] = useState({}); // { [question_id]: selected_option }
  const [showFeedback, setShowFeedback] = useState({}); // { [question_id]: true }
  const [quizCompleted, setQuizCompleted] = useState(false);
  const [language, setLanguage] = useState('EN'); // 'EN' or 'HI'

  // Filtered by difficulty
  const filteredQuestions = useMemo(() => {
    if (selectedDifficulty === 'ALL') return questions;
    return questions.filter(q => q.difficulty.toUpperCase() === selectedDifficulty);
  }, [questions, selectedDifficulty]);

  const currentQ = filteredQuestions[currentIdx] || null;

  const handleSelectOption = (qId, optionKey) => {
    if (showFeedback[qId]) return; // already answered
    setUserAnswers(prev => ({ ...prev, [qId]: optionKey }));
    setShowFeedback(prev => ({ ...prev, [qId]: true }));
  };

  const handleNext = () => {
    if (currentIdx < filteredQuestions.length - 1) {
      setCurrentIdx(prev => prev + 1);
    } else {
      setQuizCompleted(true);
    }
  };

  const handlePrev = () => {
    if (currentIdx > 0) {
      setCurrentIdx(prev => prev - 1);
    }
  };

  const handleReset = () => {
    setUserAnswers({});
    setShowFeedback({});
    setCurrentIdx(0);
    setQuizCompleted(false);
  };

  const handleRetryIncorrect = () => {
    // Keep only correct answers
    const updatedAnswers = {};
    const updatedFeedback = {};
    filteredQuestions.forEach(q => {
      if (userAnswers[q.question_id] === q.correct_answer) {
        updatedAnswers[q.question_id] = userAnswers[q.question_id];
        updatedFeedback[q.question_id] = true;
      }
    });
    setUserAnswers(updatedAnswers);
    setShowFeedback(updatedFeedback);
    setCurrentIdx(0);
    setQuizCompleted(false);
  };

  // Score computation
  const score = useMemo(() => {
    let correct = 0;
    filteredQuestions.forEach(q => {
      if (userAnswers[q.question_id] === q.correct_answer) {
        correct++;
      }
    });
    return correct;
  }, [filteredQuestions, userAnswers]);

  const percentage = filteredQuestions.length > 0 ? Math.round((score / filteredQuestions.length) * 100) : 0;

  return (
    <div className="max-w-3xl mx-auto p-4 sm:p-6 bg-[#FDFDFE] text-[#202B4D] rounded-3xl border border-[#192446]/10 shadow-xl font-sans">
      
      {/* Header Bar */}
      <div className="flex flex-wrap items-center justify-between pb-4 mb-6 border-b border-[#192446]/10 gap-3">
        <div className="flex items-center gap-3">
          <div className="w-9 h-9 rounded-xl bg-[#192446] text-[#25B6F9] flex items-center justify-center font-black text-base shadow">
            R
          </div>
          <div>
            <div className="text-[10px] font-mono tracking-widest text-[#25B6F9] font-bold uppercase">
              RTechLab Practice Lab
            </div>
            <h1 className="text-lg sm:text-xl font-black text-[#192446] leading-tight">
              {topicTitle}
            </h1>
          </div>
        </div>

        {/* Controls: Difficulty & Language */}
        <div className="flex items-center gap-2">
          {/* Difficulty Filter */}
          <div className="flex items-center bg-[#192446]/5 p-1 rounded-xl text-xs font-mono font-bold">
            {['ALL', 'BASIC', 'INTERMEDIATE', 'ADVANCED'].map(d => (
              <button
                key={d}
                onClick={() => { setSelectedDifficulty(d); handleReset(); }}
                className={`px-2.5 py-1 rounded-lg transition-all ${
                  selectedDifficulty === d ? 'bg-[#192446] text-white shadow-sm' : 'text-[#192446]/60 hover:text-[#192446]'
                }`}
              >
                {d === 'ALL' ? 'All' : d.slice(0, 3)}
              </button>
            ))}
          </div>

          {/* Language Toggle */}
          <button
            onClick={() => setLanguage(l => l === 'EN' ? 'HI' : 'EN')}
            className="px-3 py-1 rounded-xl border border-[#25B6F9]/30 bg-[#25B6F9]/10 text-[#192446] font-mono text-xs font-bold hover:bg-[#25B6F9]/20 transition-all"
          >
            {language === 'EN' ? '🇬🇧 English' : '🇮🇳 हिन्दी'}
          </button>
        </div>
      </div>

      {/* Quiz Body */}
      {!quizCompleted ? (
        currentQ ? (
          <div>
            {/* Progress & Meta */}
            <div className="flex items-center justify-between text-xs font-mono mb-4 text-[#192446]/60">
              <div className="flex items-center gap-2">
                <span className="px-2 py-0.5 rounded-full bg-[#192446]/5 font-bold text-[#192446]">
                  Question {currentIdx + 1} of {filteredQuestions.length}
                </span>
                <span className={`px-2 py-0.5 rounded-full font-bold ${
                  currentQ.difficulty === 'Basic' ? 'bg-emerald-100 text-emerald-800' :
                  currentQ.difficulty === 'Intermediate' ? 'bg-amber-100 text-amber-800' :
                  'bg-rose-100 text-rose-800'
                }`}>
                  {currentQ.difficulty}
                </span>
              </div>
              <div>
                Score: <strong className="text-[#192446]">{score}</strong> / {filteredQuestions.length}
              </div>
            </div>

            {/* Question Text */}
            <div className="p-4 sm:p-5 rounded-2xl bg-white border border-[#192446]/10 shadow-sm mb-5">
              <h2 className="text-base sm:text-lg font-bold text-[#192446] leading-relaxed">
                {currentQ.question}
              </h2>
            </div>

            {/* Option Cards */}
            <div className="space-y-3 mb-6">
              {Object.entries(currentQ.options).map(([optKey, optText]) => {
                const isSelected = userAnswers[currentQ.question_id] === optKey;
                const isAnswered = showFeedback[currentQ.question_id];
                const isCorrect = currentQ.correct_answer === optKey;

                let cardStyle = "border-[#192446]/15 hover:border-[#25B6F9] hover:bg-[#25B6F9]/5";
                if (isAnswered) {
                  if (isCorrect) {
                    cardStyle = "border-emerald-500 bg-emerald-50 text-emerald-950 font-semibold";
                  } else if (isSelected && !isCorrect) {
                    cardStyle = "border-rose-500 bg-rose-50 text-rose-950 line-through opacity-80";
                  } else {
                    cardStyle = "border-[#192446]/10 opacity-60";
                  }
                } else if (isSelected) {
                  cardStyle = "border-[#25B6F9] bg-[#25B6F9]/10 text-[#192446]";
                }

                return (
                  <button
                    key={optKey}
                    onClick={() => handleSelectOption(currentQ.question_id, optKey)}
                    disabled={isAnswered}
                    className={`w-full p-4 rounded-xl border text-left transition-all flex items-start gap-3 ${cardStyle}`}
                  >
                    <span className={`w-7 h-7 rounded-lg shrink-0 flex items-center justify-center font-mono font-bold text-xs ${
                      isAnswered && isCorrect ? 'bg-emerald-600 text-white' :
                      isAnswered && isSelected && !isCorrect ? 'bg-rose-600 text-white' :
                      'bg-[#192446]/5 text-[#192446]'
                    }`}>
                      {optKey}
                    </span>
                    <span className="text-sm leading-relaxed pt-0.5">{optText}</span>
                  </button>
                );
              })}
            </div>

            {/* Explanation Box (Visible once answered) */}
            {showFeedback[currentQ.question_id] && (
              <div className="p-4 rounded-2xl bg-[#192446]/[0.03] border border-[#192446]/15 space-y-2 mb-6 animate-fadeIn">
                <div className="flex items-center gap-2 text-xs font-mono font-bold">
                  {userAnswers[currentQ.question_id] === currentQ.correct_answer ? (
                    <span className="text-emerald-700 flex items-center gap-1">✓ Correct Answer!</span>
                  ) : (
                    <span className="text-rose-700 flex items-center gap-1">✗ Incorrect. Correct: Option {currentQ.correct_answer}</span>
                  )}
                </div>
                <div className="text-xs sm:text-sm text-[#202B4D] leading-relaxed">
                  <strong>Engineering Breakdown:</strong> {currentQ.explanation.why_correct}
                </div>
                {currentQ.explanation.why_distractors_fail && (
                  <div className="text-xs text-[#202B4D]/75 leading-relaxed pt-1 border-t border-[#192446]/10">
                    <strong>Why Distractors Fail:</strong> {currentQ.explanation.why_distractors_fail}
                  </div>
                )}
                <div className="text-[10px] font-mono text-[#192446]/50 pt-1">
                  Reference: {currentQ.source_reference}
                </div>
              </div>
            )}

            {/* Navigation Buttons */}
            <div className="flex items-center justify-between pt-2">
              <button
                onClick={handlePrev}
                disabled={currentIdx === 0}
                className="px-4 py-2 rounded-xl border border-[#192446]/15 text-xs font-mono font-bold disabled:opacity-30 hover:bg-[#192446]/5"
              >
                ← Previous
              </button>

              <button
                onClick={handleNext}
                className="px-6 py-2 rounded-xl bg-[#192446] hover:bg-[#192446]/90 text-white text-xs font-mono font-bold shadow-md transition-all active:scale-95"
              >
                {currentIdx < filteredQuestions.length - 1 ? 'Next Question →' : 'View Final Score 🏁'}
              </button>
            </div>
          </div>
        ) : (
          <div className="text-center py-12 text-[#192446]/60 font-mono text-sm">
            No questions available for the selected difficulty level.
          </div>
        )
      ) : (
        /* Final Score Card */
        <div className="text-center py-8 space-y-6">
          <div className="inline-flex p-4 rounded-3xl bg-[#25B6F9]/10 text-[#25B6F9]">
            <svg className="w-16 h-16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>

          <div className="space-y-1">
            <h2 className="text-2xl font-black text-[#192446]">Practice Session Complete!</h2>
            <p className="text-sm text-[#192446]/70">
              RTechLab Topic Mastery Evaluation
            </p>
          </div>

          <div className="max-w-xs mx-auto p-5 rounded-2xl bg-[#192446]/5 border border-[#192446]/10 space-y-3">
            <div className="text-4xl font-black text-[#192446]">
              {percentage}%
            </div>
            <div className="text-xs font-mono text-[#192446]/70">
              You answered <strong>{score}</strong> out of <strong>{filteredQuestions.length}</strong> questions correctly.
            </div>
            <div className="text-xs font-bold text-[#25B6F9] uppercase tracking-wider">
              {percentage >= 80 ? "🏆 Industrial Mastery Achieved" : percentage >= 50 ? "⚡ Good Progress · Review Traps" : "⚠️ Needs Revision"}
            </div>
          </div>

          <div className="flex flex-wrap items-center justify-center gap-3 pt-4">
            <button
              onClick={handleRetryIncorrect}
              className="px-5 py-2.5 rounded-xl border border-[#192446]/20 bg-white hover:bg-[#192446]/5 text-xs font-mono font-bold text-[#192446] transition-all"
            >
              Retry Incorrect Questions ↺
            </button>
            <button
              onClick={handleReset}
              className="px-6 py-2.5 rounded-xl bg-[#192446] hover:bg-[#192446]/90 text-white text-xs font-mono font-bold shadow-md transition-all"
            >
              Restart Quiz 🔄
            </button>
          </div>
        </div>
      )}

      {/* Footer Notice */}
      <div className="mt-8 pt-4 border-t border-[#192446]/10 flex flex-wrap items-center justify-between text-[10px] font-mono text-[#192446]/50 gap-2">
        <span>RTechLab Digital Publishing Engine · Practice Lab v2027.1</span>
        <span>Author: Rahul Sir &amp; RTechLab Engineering Team</span>
      </div>
    </div>
  );
}
