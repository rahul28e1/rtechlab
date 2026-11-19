import React from 'react';
import { Link } from 'react-router-dom';

export function PrivacyPage() {
  return (
    <div className="legal-page">
      <h1>Privacy Policy</h1>
      <p>Privacy policy placeholder.</p>
      <p><Link to="/">Home</Link></p>
    </div>
  );
}

export default PrivacyPage;
