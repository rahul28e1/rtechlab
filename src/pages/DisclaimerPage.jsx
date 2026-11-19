import React from 'react';
import { Link } from 'react-router-dom';

export function DisclaimerPage() {
  return (
    <div className="legal-page">
      <h1>Disclaimer</h1>
      <p>Disclaimer placeholder.</p>
      <p><Link to="/">Home</Link></p>
    </div>
  );
}
