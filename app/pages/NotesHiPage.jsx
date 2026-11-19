import React from 'react';
import { Link } from 'react-router-dom';

export function NotesHiPage() {
  return (
    <div className="notes-page">
      <h1>नोट्स</h1>
      <p>डिजिटल CCNA नोट्स — अंग्रेज़ी और हिंदी।</p>
      <p><Link to="/hi/notes/sample">फ्री सैंपल</Link></p>
    </div>
  );
}

export default NotesHiPage;
