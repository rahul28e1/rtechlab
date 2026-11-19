import React from 'react';
import { Link } from 'react-router-dom';

export function PortReferencePage() {
  return (
    <div className="tool-page">
      <h1>Port Reference</h1>
      <p>Common network ports and protocols reference.</p>
      <p><Link to="/tools">Back to tools</Link></p>
    </div>
  );
}
