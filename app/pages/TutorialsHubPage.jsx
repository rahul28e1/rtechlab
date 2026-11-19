import React from 'react';
import { Link } from 'react-router-dom';

export function TutorialsHubPage() {
  return (
    <div className="tutorials-hub">
      <h1>Tutorials</h1>
      <p>Browse networking, cloud and security tutorials.</p>
      <p><Link to="/">Home</Link></p>
    </div>
  );
}

export default TutorialsHubPage;
