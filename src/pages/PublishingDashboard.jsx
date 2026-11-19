import React from 'react';
import { Link } from 'react-router-dom';

export function PublishingDashboard() {
  return (
    <div className="dashboard">
      <h1>Publishing Dashboard</h1>
      <p>Manage published content.</p>
      <p><Link to="/">Home</Link></p>
    </div>
  );
}
