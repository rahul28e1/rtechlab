import React from 'react';
import { useParams, Link } from 'react-router-dom';

export function ArticlePage() {
  const { slug } = useParams();
  return (
    <div className="article-page">
      <h1>Article</h1>
      <p>Tutorial: {slug}</p>
      <p><Link to="/tutorials">Back to tutorials</Link></p>
    </div>
  );
}
