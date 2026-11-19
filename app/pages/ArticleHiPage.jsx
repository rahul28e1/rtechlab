import React from 'react';
import { useParams, Link } from 'react-router-dom';

export function ArticleHiPage() {
  const { slug } = useParams();
  return (
    <div className="article-page">
      <h1>लेख</h1>
      <p>ट्यूटोरियल: {slug}</p>
      <p><Link to="/hi/tutorials">ट्यूटोरियल पर लौटें</Link></p>
    </div>
  );
}

export default ArticleHiPage;
