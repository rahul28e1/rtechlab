import React from 'react';
import { Link } from 'react-router-dom';

export function SampleHiPage() {
  return (
    <div className="sample-page">
      <h1>नमूना पृष्ठ</h1>
      <p>नोट्स का 5 फ्री नमूना पृष्ठ।</p>
      <p><Link to="/hi/notes">नोट्स पर लौटें</Link></p>
    </div>
  );
}

export default SampleHiPage;
