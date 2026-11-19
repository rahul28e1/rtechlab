import React from 'react';
import { Link } from 'react-router-dom';

export function TermsPage() {
  return (
    <div className="legal-page">
      <h1>Terms of Use</h1>
      <p>Terms of use placeholder.</p>
      <p><Link to="/">Home</Link></p>
    </div>
  );
}

export default TermsPage;
