import React from 'react';
import { Link } from 'react-router-dom';

export function AboutPage() {
  return (
    <div className="about-page">
      <header className="page-header">
        <Link to="/" className="back-link">Home</Link>
        <h1>About RTechLab</h1>
      </header>
      <div className="about-content">
        <p>RTechLab is a free education platform for networking, cloud, security and IT students.</p>
        <p>We publish CCNA and fundamentals lessons, free tools, quizzes and digital notes in English and Hindi.</p>
        <p>
          <Link to="/notes">Notes</Link> · <Link to="/tools/subnet-calculator">Tools</Link> · <Link to="/tutorials">Tutorials</Link>
        </p>
      </div>
    </div>
  );
}
