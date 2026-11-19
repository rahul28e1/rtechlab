import React from 'react';
import { Route } from 'react-router';
import { Links, Meta, Outlet, Scripts, ScrollRestoration } from 'react-router';
import { NavLink, Link, Navigate, useParams, useLocation } from 'react-router-dom';

export function Layout({ children }) {
  return (
    <html lang="en">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <Meta />
        <Links />
      </head>
      <body>
        {children}
        <ScrollRestoration />
        <Scripts />
      </body>
    </html>
  );
}

export function meta() {
  return [
    { title: 'RTechLab — Learn Networking, Security & Cloud' },
    { name: 'description', content: 'Free CCNA, networking, cloud and IT education with lessons, tools, quizzes and notes in English and Hindi.' },
    { property: 'og:site_name', content: 'RTechLab' },
    { name: 'theme-color', content: '#0a0a0b' },
  ];
}

export function LayoutChildren({ children }) {
  return <>{children}</>;
}

export function routes() {
  return [
    { path: '/', element: <Root /> },
    { path: '/about', element: <About /> },
    { path: '/privacy', element: <LegalPage kind="privacy" /> },
    { path: '/terms', element: <LegalPage kind="terms" /> },
    { path: '/disclaimer', element: <LegalPage kind="disclaimer" /> },
    { path: '/editorial-policy', element: <LegalPage kind="editorial-policy" /> },
    { path: '/contact', element: <LegalPage kind="contact" /> },
    { path: '/notes', element: <NotesPage /> },
    { path: '/notes/sample', element: <SamplePage /> },
    {
      path: '/quiz/:module',
      element: <QuizPageWithModuleParams />,
    },
    {
      path: '/quiz/:module/:chapter',
      element: <QuizPageWithModuleParams />,
    },
    {
      path: '/q/:code',
      element: <Redirect />,
    },
    { path: '/hi/notes', element: <NotesPage /> },
    { path: '/hi/notes/sample', element: <SamplePage /> },
    {
      path: '/hi/quiz/:module',
      element: <QuizPageWithModuleParams />,
    },
    {
      path: '/hi/quiz/:module/:chapter',
      element: <QuizPageWithModuleParams />,
    },
    {
      path: '/hi/q/:code',
      element: <Redirect />,
    },
    {
      path: '/tools/*',
      children: [
        { index: true, element: <FreeToolsSection /> },
        { path: 'subnet-calculator', element: <SubnetCalculatorPage /> },
        { path: 'dns-lookup', element: <DnsLookupPage /> },
        { path: 'ip-address-info', element: <IpAddressInfoPage /> },
        { path: 'binary-converter', element: <BinaryConverterPage /> },
        { path: 'port-reference', element: <PortReferencePage /> },
        { path: 'protocol-explorer', element: <ProtocolExplorerPage /> },
      ],
    },
    { path: '/system-design', element: <SystemDesignSimulatorPage /> },
    { path: '/hi/system-design', element: <SystemDesignSimulatorPage /> },
    { path: '/tutorials', element: <TutorialsHubPage /> },
    { path: '/hi/tutorials', element: <TutorialsHubPage /> },
    { path: '/tutorials/:slug', element: <ArticlePage /> },
    { path: '/hi/tutorials/:slug', element: <ArticlePage /> },
    { path: '/episodes/:slug', element: <TopicDetailPage /> },
    { path: '/hi/episodes/:slug', element: <TopicDetailPage /> },
    { path: '/dashboard', element: <PublishingDashboard /> },
    { path: '*', element: <NotFound /> },
  ];
}

function Root() {
  return (
    <>
      <Navbar />
      <Outlet />
      <Footer />
    </>
  );
}

function Navbar() {
  const location = useLocation();
  const isHi = location.pathname.startsWith('/hi/');
  const hrefLang = isHi ? 'en' : 'hi';
  const toggleUrl = (location.pathname.startsWith('/hi/') ? location.pathname.replace(/^\/hi/, '') : '/hi' + location.pathname);
    return (
    <nav className="navbar">
      <a href="/" className="logo">RTechLab</a>
      <div className="nav-links">
        <NavLink to="/notes">Notes</NavLink>
        <NavLink to="/tools/subnet-calculator">Tools</NavLink>
        <NavLink to="/tutorials">Tutorials</NavLink>
        <NavLink to="/system-design">Simulator</NavLink>
        <NavLink to="/about">About</NavLink>
        <NavLink to="/privacy">Privacy</NavLink>
        <NavLink to="/terms">Terms</NavLink>
        <NavLink to="/disclaimer">Disclaimer</NavLink>
        <NavLink to="/editorial-policy">Editorial Policy</NavLink>
        <NavLink to="/contact">Contact</NavLink>
        <Link to={toggleUrl} className="lang-switch">{isHi ? 'EN' : 'हिं'}</Link>
      </div>
    </nav>
  );
}

function Footer() {
  return (
    <footer>
      <div className="footer-content">
        <p>RTechLab — Free Networking, Security &amp; Cloud Education</p>
        <p>
          <Link to="/privacy">Privacy</Link> · <Link to="/terms">Terms</Link> · <Link to="/contact">Contact</Link>
        </p>
      </div>
    </footer>
  );
}

function FreeToolsSection() {
  return (
    <>
      <Navbar />
      <main className="tools-landing">
        <h1>Free Network Tools</h1>
        <p>Subnet calculator, DNS lookup, IP info, binary converter, port reference and protocol explorer.</p>
        <ul>
          <li><Link to="/tools/subnet-calculator">Subnet Calculator</Link></li>
          <li><Link to="/tools/dns-lookup">DNS Lookup</Link></li>
          <li><Link to="/tools/ip-address-info">IP Address Info</Link></li>
          <li><Link to="/tools/binary-converter">Binary Converter</Link></li>
          <li><Link to="/tools/port-reference">Port Reference</Link></li>
          <li><Link to="/tools/protocol-explorer">Protocol Explorer</Link></li>
        </ul>
      </main>
      <Footer />
    </>
  );
}

function QuizPageWithModuleParams() {
  const { module, chapter } = useParams();
  return (
    <>
      <Navbar />
      <main className="quiz-page">
        <QuizPage module={module} chapter={chapter} />
      </main>
      <Footer />
    </>
  );
}

function Redirect() {
  const { code } = useParams();
  const qrCode = qrRedirectCodes[code] || null;
  return <Navigate to={qrCode ?? '/notes'} replace />;
}

function NotFound() {
  return (
    <>
      <Navbar />
      <main className="not-found">
        <h1>Page Not Found</h1>
        <p>Sorry, we couldn't find the page you were looking for.</p>
        <Link to="/">Go Home</Link>
      </main>
      <Footer />
    </>
  );
}

function About() {
  return (
    <>
      <Navbar />
      <main className="about-page">
        <AboutPage />
      </main>
      <Footer />
    </>
  );
}

function SeoHeadTitle() {
  const location = useLocation();
  const isHi = location.pathname.startsWith('/hi/');
  const titles = {
    '/': 'RTechLab — Learn Networking, Security & Cloud',
    '/about': 'About RTechLab'
  };
  const title = titles[location.pathname] || (isHi ? 'RTechLab — हिंदी' : 'RTechLab — English');
  return <title>{title}</title>;
}

function SeoMetaDescription() {
  const location = useLocation();
  const isHi = location.pathname.startsWith('/hi/');
  const descriptions = {
    '/': 'Free CCNA, networking, cloud and IT education with lessons, tools, quizzes and notes in English and Hindi.',
    '/about': 'Learn about RTechLab — an independent, free educational platform for networking, cloud and IT students.'
  };
  const description = descriptions[location.pathname] ||
    (isHi ? 'RTechLab — निःशुल्क नेटवर्किंग, सिक्योरिटी और क्लाउड शिक्षा' : 'RTechLab — Free Networking, Security & Cloud Education');
  return <meta name="description" content={description} />;
}

function CanonicalLink() {
  const location = useLocation();
  const base = 'https://rtechlab.com';
  const canonical = base + location.pathname + location.search;
  return <link rel="canonical" href={canonical} />;
}

function HreflangLinks() {
  const location = useLocation();
  const isHi = location.pathname.startsWith('/hi/');
  const base = 'https://rtechlab.com';
  const enUrl = isHi ? location.pathname.replace(/^\/hi/, '') : location.pathname;
  const hiUrl = isHi ? location.pathname : '/hi' + location.pathname;
  return (
    <>
      <link rel="alternate" hrefLang="en" href={base + enUrl} />
      <link rel="alternate" hrefLang="hi" href={base + hiUrl} />
      <link rel="alternate" hrefLang="x-default" href={base + (isHi ? enUrl : location.pathname)} />
    </>
  );
}

function OpenGraphMeta() {
  const location = useLocation();
  const isHi = location.pathname.startsWith('/hi/');
  const title = isHi ? 'RTechLab — हिंदी' : 'RTechLab — English';
  const description = isHi
    ? 'RTechLab — निःशुल्क नेटवर्किंग, सिक्योरिटी और क्लाउड शिक्षा'
    : 'Free CCNA, networking, cloud and IT education with lessons, tools, quizzes and notes in English and Hindi.';
  return (
    <>
      <meta property="og:title" content={title} />
      <meta property="og:description" content={description} />
      <meta property="og:type" content="website" />
      <meta property="og:url" content={'https://rtechlab.com' + location.pathname} />
      <meta property="og:image" content="https://rtechlab.com/og-image.png" />
      <meta property="og:site_name" content="RTechLab" />
      <meta property="og:locale" content={isHi ? 'hi_IN' : 'en_US'} />
      <meta name="twitter:card" content="summary_large_image" />
      <meta name="twitter:title" content={title} />
      <meta name="twitter:description" content={description} />
    </>
  );
}

const qrRedirectCodes = {
  'ccna-m1': '/quiz/ccna-m1',
  'ccna-m2': '/quiz/ccna-m2',
  'ccna-m3': '/quiz/ccna-m3'
};

import { Navbar } from '~/components/Navbar';
import { Footer } from '~/components/Footer';
import { HomePage } from '~/pages/HomePage';
import { NotesPage } from '~/pages/NotesPage';
import { SamplePage } from '~/pages/SamplePage';
import { QuizPage } from '~/pages/QuizPage';
import { QrRedirect } from '~/pages/QrRedirect';
import { LegalPage } from '~/pages/LegalPage';
import { PublishingDashboard } from '~/pages/PublishingDashboard';
import { NotFoundPage } from '~/pages/NotFoundPage';
import { AboutPage } from '~/pages/AboutPage';
import { ArticlePage } from '~/pages/ArticlePage';
import { TopicDetailPage } from '~/pages/TopicDetailPage';
import { TutorialsHubPage } from '~/pages/TutorialsHubPage';
import { Episode1Page } from '~/pages/Episode1Page';
import { SystemDesignSimulatorPage } from '~/pages/SystemDesignSimulatorPage';
import { FreeToolsSection } from '~/components/FreeToolsSection';
import { SEOHead } from '~/components/SEOHead';
