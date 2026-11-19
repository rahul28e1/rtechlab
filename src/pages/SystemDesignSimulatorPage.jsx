import React from 'react';
import { Link } from 'react-router-dom';

export function SystemDesignSimulatorPage() {
  return (
    <div className="simulator-page">
      <h1>System Design Simulator</h1>
      <p>Practice system design scenarios for interviews.</p>
      <p><Link to="/">Home</Link></p>
    </div>
  );
}
