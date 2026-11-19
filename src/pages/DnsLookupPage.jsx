import React from 'react';
import { Link } from 'react-router-dom';

export function DnsLookupPage() {
  return (
    <div className="tool-page">
      <h1>DNS Lookup</h1>
      <p>Look up DNS records for a domain.</p>
      <p><Link to="/tools">Back to tools</Link></p>
    </div>
  );
}
