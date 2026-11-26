import React, { useCallback, useEffect, useRef, useState } from 'react';
import { Link, NavLink, useLocation } from 'react-router';

export function Navbar({ onOpenSearch }) {
  const [scrolled, setScrolled] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [pillStyle, setPillStyle] = useState({ left: 0, width: 0, visible: false });
  const navRef = useRef(null);
  const itemRefs = useRef({});
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
    { to: isHindi ? '/hi/notes' : '/notes', label: isHindi ? 'नोट्स' : 'Notes' },
    { to: isHindi ? '/hi/tools' : '/tools', label: isHindi ? 'टूल्स' : 'Tools' },
    { to: isHindi ? '/hi/tutorials' : '/tutorials', label: isHindi ? 'ट्यूटोरियल्स' : 'Tutorials' },
    { to: isHindi ? '/hi/system-design' : '/system-design', label: isHindi ? 'सिम्युलेटर' : 'Simulator' },
    { to: isHindi ? '/hi/about' : '/about', label: isHindi ? 'हमारे बारे में' : 'About' },
  ];

  // Match active nav item (handles nested routes like /tutorials/:slug or /tools/:slug)
  const activeRoute = navItems.find(({ to }) =>
    location.pathname === to || location.pathname.startsWith(`${to}/`)
  )?.to;

  const updatePill = useCallback(() => {
    if (!activeRoute) {
      setPillStyle((prev) => (prev.visible ? { ...prev, visible: false } : prev));
      return;
    }
    const el = itemRefs.current[activeRoute];
    if (el) {
      setPillStyle({
        left: el.offsetLeft,
        width: el.offsetWidth,
        visible: true,
      });
    }
  }, [activeRoute]);

  useEffect(() => {
    // Wait a frame so text/font layout settles (especially when switching EN <-> HI)
    const raf = requestAnimationFrame(updatePill);
    window.addEventListener('resize', updatePill);
    return () => {
      cancelAnimationFrame(raf);
      window.removeEventListener('resize', updatePill);
    };
  }, [updatePill, isHindi]);

  // Dynamically compute the equivalent target path in the alternate language
  // so switching languages NEVER kicks the user to a different section.
  const getAlternateLangPath = () => {
    const { pathname, search, hash } = location;
    let targetPath;
    if (isHindi) {
      if (pathname === '/hi' || pathname === '/hi/') {
        targetPath = '/';
      } else {
        targetPath = pathname.replace(/^\/hi(\/|$)/, '/');
      }
    } else {
      if (pathname === '/' || pathname === '') {
        targetPath = '/hi';
      } else {
        targetPath = `/hi${pathname.startsWith('/') ? '' : '/'}${pathname}`;
      }
    }
    return `${targetPath}${search}${hash}`;
  };

  return (
    <header
      className={`sticky top-0 z-50 w-full transition-all duration-300 print:hidden ${
        scrolled
          ? 'bg-[#090a0f]/85 backdrop-blur-xl border-b border-white/[0.08] shadow-2xl shadow-black/40'
          : 'bg-[#090a0f]/60 backdrop-blur-md border-b border-white/[0.04]'
      }`}
    >
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-14 sm:h-16">
          {/* Brand Logo */}
          <Link
            to={isHindi ? '/hi' : '/'}
            className="flex items-center gap-2.5 group tracking-tight"
          >
            <img
              src="/brand/rtechlab-icon.png"
              alt="RTechLab"
              className="w-8 h-8 rounded-lg object-contain group-hover:scale-105 transition-transform"
            />
            <span className="font-bold text-lg sm:text-xl text-white tracking-tight">
              RTechLab
            </span>
          </Link>

          {/* Desktop Navigation Links (Apple Frosted Glass Capsule with Smooth Sliding Pill) */}
          <nav
            ref={navRef}
            className="relative hidden md:flex items-center gap-1 p-1 rounded-full bg-white/[0.04] backdrop-blur-2xl border border-white/[0.1] shadow-[0_4px_20px_rgba(0,0,0,0.3),inset_0_1px_1px_rgba(255,255,255,0.12)]"
          >
            {/* Sliding Transparent Frosted Glass Glider */}
            <div
              aria-hidden="true"
              className="pointer-events-none absolute top-1 bottom-1 rounded-full bg-white/[0.16] backdrop-blur-xl border border-white/30 shadow-[inset_0_1px_1px_rgba(255,255,255,0.38),0_2px_12px_rgba(0,0,0,0.35)]"
              style={{
                left: `${pillStyle.left}px`,
                width: `${pillStyle.width}px`,
                opacity: pillStyle.visible ? 1 : 0,
                transition: 'left 350ms cubic-bezier(0.22, 1, 0.36, 1), width 350ms cubic-bezier(0.22, 1, 0.36, 1), opacity 200ms ease',
              }}
            />

            {navItems.map(({ to, label }) => (
              <NavLink
                key={to}
                to={to}
                ref={(el) => {
                  if (el) itemRefs.current[to] = el;
                }}
                className={({ isActive }) =>
                  `relative z-10 px-3.5 py-1.5 rounded-full text-[13px] tracking-tight transition-colors duration-250 ${
                    isActive
                      ? 'text-white font-bold'
                      : 'text-zinc-400 font-medium hover:text-white hover:bg-white/[0.05]'
                  }`
                }
              >
                {label}
              </NavLink>
            ))}
          </nav>

          {/* Right Action Tools: Language, Search, Mobile Menu */}
          <div className="flex items-center gap-2 sm:gap-3">
            {/* Intelligent Same-Page Language Switcher Pill */}
            <Link
              to={getAlternateLangPath()}
              className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-semibold bg-white/[0.04] hover:bg-white/[0.1] backdrop-blur-xl border border-white/[0.1] text-zinc-300 hover:text-white transition-all duration-200 shadow-[inset_0_1px_1px_rgba(255,255,255,0.1)] cursor-pointer"
              title={isHindi ? 'Switch to English' : 'हिंदी संस्करण देखें'}
            >
              <svg className="w-3.5 h-3.5 text-zinc-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.75} d="M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129" />
              </svg>
              <span>{isHindi ? 'English' : 'हिंदी'}</span>
            </Link>

            {/* Search Pill Button */}
            <button
              onClick={onOpenSearch}
              className="flex items-center gap-2 px-3 py-1.5 rounded-full bg-white/[0.04] hover:bg-white/[0.1] backdrop-blur-xl border border-white/[0.1] text-zinc-400 hover:text-white transition-all duration-200 text-xs font-medium shadow-[inset_0_1px_1px_rgba(255,255,255,0.1)] cursor-pointer"
              aria-label="Search"
            >
              <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
              <span className="hidden sm:inline">Search</span>
              <kbd className="hidden sm:inline-flex items-center px-1.5 py-0.5 text-[10px] bg-white/[0.08] text-zinc-300 rounded font-mono border border-white/[0.1]">
                ⌘K
              </kbd>
            </button>

            {/* Mobile Hamburger Toggle */}
            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="md:hidden p-2 rounded-lg text-zinc-400 hover:text-white hover:bg-white/[0.08] transition-colors"
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
          <div className="md:hidden py-4 border-t border-white/[0.08] space-y-1.5 bg-[#090a0f]/95 backdrop-blur-2xl animate-fadeIn px-1">
            {navItems.map(({ to, label }) => (
              <NavLink
                key={to}
                to={to}
                className={({ isActive }) =>
                  `block px-4 py-2.5 rounded-xl text-sm font-medium tracking-tight transition-all duration-200 ${
                    isActive
                      ? 'bg-white/20 backdrop-blur-xl text-white font-bold border border-white/25 shadow-[inset_0_1px_1px_rgba(255,255,255,0.25)]'
                      : 'text-zinc-400 hover:text-white hover:bg-white/[0.05]'
                  }`
                }
              >
                {label}
              </NavLink>
            ))}
            <div className="pt-2 px-2">
              <a
                href="https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i"
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center justify-between px-3.5 py-2.5 rounded-xl text-xs font-bold text-emerald-300 bg-emerald-500/15 border border-emerald-500/30 hover:bg-emerald-500/25 transition-all"
              >
                <span className="flex items-center gap-2">
                  <span>💬</span>
                  <span>Join WhatsApp Channel</span>
                </span>
                <span className="text-[10px] font-mono bg-emerald-500/30 px-2 py-0.5 rounded-full text-white">Free</span>
              </a>
            </div>
          </div>
        )}
      </div>
    </header>
  );
}
