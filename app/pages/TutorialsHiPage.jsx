import React from 'react';
import { Link } from 'react-router-dom';

export function TutorialsHiPage() {
  return (
    <div className="tutorials-hub">
      <h1>ट्यूटोरियल</h1>
      <p>नेटवर्किंग, क्लाउड और सुरक्षा ट्यूटोरियल देखें।</p>
      <p><Link to="/">होम</Link></p>
    </div>
  );
}

export default TutorialsHiPage;
