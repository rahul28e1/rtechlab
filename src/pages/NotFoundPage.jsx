import React from 'react';
import { Link } from 'react-router-dom';

export function NotFoundPage() {
  return (
    <div className="not-found">
      <h1>Page Not Found</h1>
      <p>The page you are looking for does not exist.</p>
      <p><Link to="/">Go home</Link></p>
    </div>
  );
}
