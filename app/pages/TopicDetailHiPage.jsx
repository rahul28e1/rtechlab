import React from 'react';
import { useParams, Link } from 'react-router-dom';

export function TopicDetailHiPage() {
  const { slug } = useParams();
  return (
    <div className="topic-detail">
      <h1>विषय</h1>
      <p>एपिसोड या विषय: {slug}</p>
      <p><Link to="/hi/tutorials">ट्यूटोरियल पर लौटें</Link></p>
    </div>
  );
}

export default TopicDetailHiPage;
