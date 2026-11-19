import React from 'react';
import { useParams, Link } from 'react-router-dom';

export function TopicDetailPage() {
  const { slug } = useParams();
  return (
    <div className="topic-detail">
      <h1>Topic</h1>
      <p>Episode or topic: {slug}</p>
      <p><Link to="/tutorials">Back to tutorials</Link></p>
    </div>
  );
}
