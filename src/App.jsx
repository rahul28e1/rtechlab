import React, { useState, useEffect } from 'react';
import { Link, NavLink, Navigate, useParams, useLocation } from 'react-router-dom';
import { SEOHead } from './components/SEOHead';
import { Navbar } from './components/Navbar';
import { Footer } from './components/Footer';
import { SearchModal } from './components/SearchModal';
import { HomePage } from './pages/HomePage';
import { NotesPage } from './pages/NotesPage';
import { SamplePage } from './pages/SamplePage';
import { QuizPage } from './pages/QuizPage';
import { QrRedirect } from './pages/QrRedirect';
import { LegalPage } from './pages/LegalPage';
import { PublishingDashboard } from './pages/PublishingDashboard';
import { NotFoundPage } from './pages/NotFoundPage';
import { AboutPage } from './pages/AboutPage';
import { ArticlePage } from './pages/ArticlePage';
import { TopicDetailPage } from './pages/TopicDetailPage';
import { TutorialsHubPage } from './pages/TutorialsHubPage';
import { Episode1Page } from './pages/Episode1Page';
import { SystemDesignSimulatorPage } from './pages/SystemDesignSimulatorPage';
import { FreeToolsSection } from './components/FreeToolsSection';
import { SubnetCalculatorPage } from './pages/SubnetCalculatorPage';
import { DnsLookupPage } from './pages/DnsLookupPage';
import { IpAddressInfoPage } from './pages/IpAddressInfoPage';
import { BinaryConverterPage } from './pages/BinaryConverterPage';
import { PortReferencePage } from './pages/PortReferencePage';
import { ProtocolExplorerPage } from './pages/ProtocolExplorerPage';

const QUIZ_CODES = {
  'ccna-m1': '/quiz/ccna-m1',
  'ccna-m2': '/quiz/ccna-m2',
  'ccna-m3': '/quiz/ccna-m3',
};

export const App = () => {
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
    <div className="min-h-screen bg-navy-950 text-slate-100 flex flex-col font-sans selection:bg-electric-600 selection:text-white">
      <Navbar onOpenSearch={() => setIsSearchOpen(true)} />
      <main className="flex-1">
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/about" element={<AboutPage />} />
          <Route path="/privacy" element={<LegalPage kind="privacy" />} />
          <Route path="/terms" element={<LegalPage kind="terms" />} />
          <Route path="/disclaimer" element={<LegalPage kind="disclaimer" />} />
          <Route path="/editorial-policy" element={<LegalPage kind="editorial-policy" />} />
          <Route path="/contact" element={<LegalPage kind="contact" />} />
          <Route path="/notes" element={<NotesPage />} />
          <Route path="/notes/sample" element={<SamplePage />} />
          <Route path="/quiz/:module" element={<QuizPage />} />
          <Route path="/quiz/:module/:chapter" element={<QuizPage />} />
          <Route path="/q/:code" element={<QrRedirect />} />
          <Route path="/hi/notes" element={<NotesPage />} />
          <Route path="/hi/notes/sample" element={<SamplePage />} />
          <Route path="/hi/quiz/:module" element={<QuizPage />} />
          <Route path="/hi/quiz/:module/:chapter" element={<QuizPage />} />
          <Route path="/hi/q/:code" element={<QrRedirect />} />
          <Route path="/tools/subnet-calculator" element={<SubnetCalculatorPage />} />
          <Route path="/tools/dns-lookup" element={<DnsLookupPage />} />
          <Route path="/tools/ip-address-info" element={<IpAddressInfoPage />} />
          <Route path="/tools/binary-converter" element={<BinaryConverterPage />} />
          <Route path="/tools/port-reference" element={<PortReferencePage />} />
          <Route path="/tools/protocol-explorer" element={<ProtocolExplorerPage />} />
          <Route path="/system-design" element={<SystemDesignSimulatorPage />} />
          <Route path="/hi/system-design" element={<SystemDesignSimulatorPage />} />
          <Route path="/tutorials" element={<TutorialsHubPage />} />
          <Route path="/hi/tutorials" element={<TutorialsHubPage />} />
          <Route path="/tutorials/:slug" element={<ArticlePage />} />
          <Route path="/hi/tutorials/:slug" element={<ArticlePage />} />
          <Route path="/episodes/:slug" element={<TopicDetailPage />} />
          <Route path="/hi/episodes/:slug" element={<TopicDetailPage />} />
          <Route path="/dashboard" element={<PublishingDashboard />} />
          <Route path="*" element={<NotFoundPage />} />
        </Routes>
      </main>
      <Footer />
      <SearchModal isOpen={isSearchOpen} onClose={() => setIsSearchOpen(false)} />
    </div>
  );
};
