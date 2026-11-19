import React from 'react';
import { Link } from 'react-router-dom';

export function QuizPage({ as: Comp = 'div' }) {
  return (
    <Comp className="quiz-page">
      <h1>Quiz</h1>
      <p>Practice quizzes for CCNA.</p>
      <p><Link to="/notes">Back to notes</Link></p>
    </Comp>
  );
}
