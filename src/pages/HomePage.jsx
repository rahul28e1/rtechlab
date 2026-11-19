import React from 'react';
import { Link, NavLink } from 'react-router-dom';
import { Hero } from './components/Hero';
import { CategoryExplorer } from './components/CategoryExplorer';
import { InterviewPrepSection } from './components/InterviewPrepSection';

export function HomePage() {
  return (
    <div className="home">
      <header className="home-header">
        <Link to="/" className="home-logo">RTechLab</Link>
        <nav className="home-nav">
          <NavLink to="/notes">Notes</NavLink>
          <NavLink to="/tools/subnet-calculator">Tools</NavLink>
          <NavLink to="/tutorials">Tutorials</NavLink>
          <NavLink to="/system-design">Simulator</NavLink>
          <NavLink to="/about">About</NavLink>
        </nav>
      </header>
      <Hero />
      <CategoryExplorer />
      <InterviewPrepSection />
      <footer>
        <p>
          <Link to="/privacy">Privacy</Link> · <Link to="/terms">Terms</Link> · <Link to="/contact">Contact</Link>
        </p>
      </footer>
    </div>
  );
}
