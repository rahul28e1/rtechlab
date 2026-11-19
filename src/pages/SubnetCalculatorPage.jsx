import React from 'react';
import { Link } from 'react-router-dom';

export function SubnetCalculatorPage() {
  return (
    <div className="tool-page">
      <h1>Subnet Calculator</h1>
      <p>Calculate subnet ranges, network, broadcast and usable hosts.</p>
      <p><Link to="/tools">Back to tools</Link></p>
    </div>
  );
}
