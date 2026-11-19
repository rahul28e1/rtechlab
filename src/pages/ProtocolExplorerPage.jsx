import React from 'react';
import { Link } from 'react-router-dom';

export function ProtocolExplorerPage() {
  return (
    <div className="tool-page">
      <h1>Protocol Explorer</h1>
      <p>Explore DNS, TCP, HTTP, TLS, ARP and ICMP flows step by step.</p>
      <p><Link to="/tools">Back to tools</Link></p>
    </div>
  );
}
