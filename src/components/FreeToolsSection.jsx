import React from 'react';
import { Link } from 'react-router-dom';

export function FreeToolsSection() {
  return (
    <div className="free-tools">
      <h1>Free Network Tools</h1>
      <p>
        Subnet calculator, DNS lookup, IP address info, binary converter,
        port reference and protocol explorer — all in your browser, no sign-up.
      </p>
      <div className="tools-grid">
        <div><Link to="/tools/subnet-calculator">Subnet Calculator</Link></div>
        <div><Link to="/tools/dns-lookup">DNS Lookup</Link></div>
        <div><Link to="/tools/ip-address-info">IP Address Info</Link></div>
        <div><Link to="/tools/binary-converter">Binary Converter</Link></div>
        <div><Link to="/tools/port-reference">Port Reference</Link></div>
        <div><Link to="/tools/protocol-explorer">Protocol Explorer</Link></div>
      </div>
    </div>
  );
}
