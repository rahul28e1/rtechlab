import React from 'react';
import { Link } from 'react-router-dom';

export function IpAddressInfoPage() {
  return (
    <div className="tool-page">
      <h1>IP Address Info</h1>
      <p>Inspect IPv4 and IPv6 addresses.</p>
      <p><Link to="/tools">Back to tools</Link></p>
    </div>
  );
}
