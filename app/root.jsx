import {
  Links,
  Meta,
  Outlet,
  Scripts,
  ScrollRestoration,
} from 'react-router';
import React, { useState, useEffect } from 'react';
import { Analytics } from '@vercel/analytics/react';
import { Navbar } from './components/Navbar';
import { Footer } from './components/Footer';
import { SearchModal } from './components/SearchModal';
import { MobileBottomNav } from './components/MobileBottomNav';
import { WhatsAppHelplineButton } from './components/WhatsAppHelplineButton';
import { LanguageProvider } from '../src/context/LanguageProvider';
import '../src/index.css';

export const links = () => [
  { rel: "preconnect", href: "https://fonts.googleapis.com" },
  { rel: "preconnect", href: "https://fonts.gstatic.com", crossOrigin: "anonymous" },
  {
    rel: "stylesheet",
    href: "https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&family=Plus+Jakarta+Sans:wght@500;600;700;800&display=swap",
  },
];

export function Layout({ children }) {
  return (
    <html lang="en" className="dark bg-[#090a0f]">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>RTechLab — Master Computer Networking, Cloud &amp; Security</title>
        <meta
          name="description"
          content="Universal, high-impact education in Computer Networking, CCNA, Linux, Cybersecurity, and Cloud Architecture. Free and open access."
        />
        <link rel="icon" type="image/x-icon" href="/brand/favicon.ico" />
        <script src="https://checkout.razorpay.com/v1/checkout.js" async></script>
        <Meta />
        <Links />
      </head>
      <body className="bg-[#090a0f] text-[#EDEDED] font-sans antialiased selection:bg-white selection:text-black min-h-screen">
        {children}
        <Analytics />
        <ScrollRestoration />
        <Scripts />
      </body>
    </html>
  );
}

export default function App() {
  const [isSearchOpen, setIsSearchOpen] = useState(false);

  useEffect(() => {
    const handleKeyDown = (e) => {
      if ((e.ctrlKey || e.metaKey) && e.key.toLowerCase() === 'k') {
        e.preventDefault();
        setIsSearchOpen((prev) => !prev);
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, []);

  return (
    <LanguageProvider>
      <div className="min-h-screen bg-[#090a0f] text-[#EDEDED] flex flex-col font-sans">
        <Navbar onOpenSearch={() => setIsSearchOpen(true)} />
        <main className="flex-1 pb-16 md:pb-0">
          <Outlet />
        </main>
        <Footer />
        <MobileBottomNav />
        <WhatsAppHelplineButton />
        <SearchModal isOpen={isSearchOpen} onClose={() => setIsSearchOpen(false)} />
      </div>
    </LanguageProvider>
  );
}
