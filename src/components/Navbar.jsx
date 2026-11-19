import React, { useEffect, useState } from 'react';
import { Link, NavLink } from 'react-router-dom';

export function Navbar({ onOpenSearch }) {
  const [searchOpen, setSearchOpen] = useState(false);

  useEffect(() => {
    const handleKeyDown = (e) => {
      if ((e.ctrlKey || e.metaKey) && e.key.toLowerCase() === 'k') {
        e.preventDefault();
        if (onOpenSearch) onOpenSearch();
        else setSearchOpen((prev) => !prev);
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [onOpenSearch]);

  return (
    <header className="navbar">
      <Link to="/" className="logo">RTechLab</Link>
      <nav className="nav-links">
        <NavLink to="/notes">Notes</NavLink>
        <NavLink to="/tools/subnet-calculator">Tools</NavLink>
        <NavLink to="/tutorials">Tutorials</NavLink>
        <NavLink to="/system-design">Simulator</NavLink>
        <NavLink to="/about">About</NavLink>
        <Link to="/privacy">Privacy</Link>
        <Link to="/terms">Terms</Link>
        <Link to="/disclaimer">Disclaimer</Link>
        <Link to="/editorial-policy">Editorial Policy</Link>
        <Link to="/contact">Contact</Link>
      </nav>
      {searchOpen && (
        <div className="search-open-indicator">Search</div>
      )}
    </header>
  );
}
