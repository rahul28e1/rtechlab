import React, { useEffect, useState } from 'react';
import { Link, NavLink, useLocation } from 'react-router';

export function Navbar({ onOpenSearch }) {
  const [scrolled, setScrolled] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const location = useLocation();

  const isHindi = location.pathname.startsWith('/hi');

  useEffect(() => {
    const handleScroll = () => setScrolled(window.scrollY > 15);
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  // Close mobile menu on route change
  useEffect(() => {
    setMobileMenuOpen(false);
  }, [location.pathname]);

  const navItems = [
    { to: isHindi ? '/hi/notes' : '/notes', label: isHindi ? 'रोडमैप्स (Notes)' : 'Roadmaps' },
    { to: '/tools', label: isHindi ? 'टूल्स (Tools)' : 'Tools' },
    { to: isHindi ? '/hi/tutorials' : '/tutorials', label: isHindi ? 'ट्यूटोरियल्स' : 'Tutorials' },
    { to: isHindi ? '/hi/system-design' : '/system-design', label: isHindi ? 'सिम्युलेटर' : 'Simulator' },
    { to: '/about', label: isHindi ? 'हमारे बारे में' : 'About' },
  ];

  return (
    <header
      className={`sticky top-0 z-50 w-full transition-all duration-300 print:hidden ${
        scrolled
          ? 'bg-black/80 backdrop-blur-xl border-b border-white/[0.08] shadow-2xl'
          : 'bg-black/50 backdrop-blur-md border-b border-white/[0.04]'
      }`}
    >
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-14 sm:h-16">
          {/* Brand Logo */}
          <Link
            to={isHindi ? '/hi/notes' : '/'}
            className="flex items-center gap-2 group tracking-tight"
          >
            <div className="w-8 h-8 rounded-lg bg-white flex items-center justify-center font-black text-black text-sm tracking-tighter group-hover:scale-105 transition-transform">
              R
            </div>
            <span className="font-bold text-lg sm:text-xl text-white tracking-tight">
              TechLab<span className="text-[#86868B] text-xs font-mono ml-1 font-normal">.io</span>
            </span>
          </Link>

          {/* Desktop Navigation Links (Clean Apple / Roadmap.sh style) */}
          <nav className="hidden md:flex items-center gap-1 lg:gap-2">
            {navItems.map(({ to, label }) => (
              <NavLink
                key={to}
                to={to}
                className={({ isActive }) =>
                  `px-3 py-1.5 rounded-full text-[13px] font-medium tracking-tight transition-all duration-200 ${
                    isActive
                      ? 'bg-white/10 text-white font-semibold'
                      : 'text-[#A1A1A6] hover:text-white hover:bg-white/[0.05]'
                  }`
                }
              >
                {label}
              </NavLink>
            ))}
          </nav>

          {/* Right Action Tools: Language, Search, Mobile Menu */}
          <div className="flex items-center gap-2 sm:gap-3">
            {/* Language Switcher Pill */}
            <Link
              to={isHindi ? '/' : '/hi/notes'}
              className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold bg-white/[0.06] hover:bg-white/[0.12] border border-white/[0.08] text-[#D2D2D7] hover:text-white transition-all"
              title={isHindi ? 'Switch to English' : 'हिंदी संस्करण देखें'}
            >
              <svg className="w-3.5 h-3.5 text-[#86868B]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.75} d="M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129" />
              </svg>
              <span>{isHindi ? 'English' : 'हिंदी'}</span>
            </Link>

            {/* Search Pill Button */}
            <button
              onClick={onOpenSearch}
              className="flex items-center gap-2 px-3 py-1.5 rounded-full bg-white/[0.06] hover:bg-white/[0.1] border border-white/[0.08] text-[#86868B] hover:text-white transition-all duration-200 text-xs font-medium"
              aria-label="Search"
            >
              <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
              <span className="hidden sm:inline">Search</span>
              <kbd className="hidden sm:inline-flex items-center px-1.5 py-0.5 text-[10px] bg-white/[0.08] text-[#A1A1A6] rounded font-mono border border-white/[0.1]">
                ⌘K
              </kbd>
            </button>

            {/* Mobile Hamburger Toggle */}
            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="md:hidden p-2 rounded-lg text-[#A1A1A6] hover:text-white hover:bg-white/[0.08] transition-colors"
              aria-label="Toggle navigation menu"
            >
              {mobileMenuOpen ? (
                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                </svg>
              ) : (
                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
                </svg>
              )}
            </button>
          </div>
        </div>

        {/* Mobile Navigation Drawer */}
        {mobileMenuOpen && (
          <div className="md:hidden py-4 border-t border-white/[0.08] space-y-1 bg-black/95 animate-fadeIn">
            {navItems.map(({ to, label }) => (
              <NavLink
                key={to}
                to={to}
                className={({ isActive }) =>
                  `block px-4 py-2.5 rounded-lg text-sm font-medium tracking-tight transition-all ${
                    isActive
                      ? 'bg-white/10 text-white font-semibold'
                      : 'text-[#A1A1A6] hover:text-white hover:bg-white/[0.05]'
                  }`
                }
              >
                {label}
              </NavLink>
            ))}
          </div>
        )}
      </div>
    </header>
  );
}
