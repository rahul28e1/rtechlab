import React from 'react';

export function SearchModal({ isOpen, onClose }) {
  const [query, setQuery] = React.useState('');

  if (!isOpen) return null;

  return (
    <div className="search-modal-overlay" onClick={onClose}>
      <div className="search-modal" onClick={(e) => e.stopPropagation()}>
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search lessons, tools, notes..."
        />
      </div>
    </div>
  );
}
