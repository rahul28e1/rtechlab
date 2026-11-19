import React from 'react';
import { Link } from 'react-router-dom';

export function LegalPage({ kind }) {
  const titles = {
    privacy: 'Privacy Policy',
    terms: 'Terms of Use',
    disclaimer: 'Disclaimer',
    'editorial-policy': 'Editorial Policy',
    contact: 'Contact',
  };
  return (
    <div className="legal-page">
      <h1>{titles[kind] || 'Legal'}</h1>
      <p>This is a legal page placeholder for {kind}.</p>
      <p><Link to="/">Home</Link></p>
    </div>
  );
}
