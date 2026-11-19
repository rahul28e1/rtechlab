import React from 'react';
import { Link } from 'react-router-dom';

export function BinaryConverterPage() {
  return (
    <div className="tool-page">
      <h1>Binary Converter</h1>
      <p>Convert between binary, decimal and hex.</p>
      <p><Link to="/tools">Back to tools</Link></p>
    </div>
  );
}
