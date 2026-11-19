import React from 'react';
import { Link } from 'react-router-dom';

export function ContactPage() {
  return (
    <div className="legal-page">
      <h1>Contact</h1>
      <p>Contact page placeholder.</p>
      <p><Link to="/">Home</Link></p>
    </div>
  );
}

export default ContactPage;
