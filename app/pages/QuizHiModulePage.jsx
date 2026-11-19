import React from 'react';
import { Link } from 'react-router-dom';

export function QuizHiModulePage() {
  return (
    <div className="quiz-page">
      <h1>क्विज़</h1>
      <p>CCNA के लिए अभ्यास क्विज़।</p>
      <p><Link to="/hi/notes">नोट्स पर लौटें</Link></p>
    </div>
  );
}

export default QuizHiModulePage;
