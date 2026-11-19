import React from 'react';
import { Link } from 'react-router-dom';

export function SamplePage() {
  return (
    <div className="sample-page">
      <h1>Sample Pages</h1>
      <p>5 free sample pages to preview the notes.</p>
      <p><Link to="/notes">Back to notes</Link></p>
    </div>
  );
}

export default SamplePage;
