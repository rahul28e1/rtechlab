export function routes() {
  return [
    { path: '/', element: <RootIndex /> },
    { path: '/about', element: <About /> },
    { path: '/privacy', element: <LegalPage kind="privacy" /> },
    { path: '/terms', element: <LegalPage kind="terms" /> },
    { path: '/disclaimer', element: <LegalPage kind="disclaimer" /> },
    { path: '/editorial-policy', element: <LegalPage kind="editorial-policy" /> },
    { path: '/contact', element: <LegalPage kind="contact" /> },
    { path: '/notes', element: <NotesPage /> },
    { path: '/notes/sample', element: <SamplePage /> },
    { path: '/quiz/:module', element: <QuizPage /> },
    { path: '/quiz/:module/:chapter', element: <QuizPage /> },
    { path: '/q/:code', element: <QrRedirect /> },
    { path: '/hi/notes', element: <NotesPage /> },
    { path: '/hi/notes/sample', element: <SamplePage /> },
    { path: '/hi/quiz/:module', element: <QuizPage /> },
    { path: '/hi/quiz/:module/:chapter', element: <QuizPage /> },
    { path: '/hi/q/:code', element: <QrRedirect /> },
    {
      path: '/tools',
      children: [
        { index: true, element: <FreeToolsLanding /> },
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
    { path: '*', element: <NotFoundPage /> },
  ];
}

import React from 'react';
import { Route } from 'react-router';
import { RootLayout } from '~/components/RootLayout';
import { HomePage } from '~/pages/HomePage';
import { AboutPage } from '~/pages/AboutPage';
import { LegalPage } from '~/pages/LegalPage';
import { NotesPage } from '~/pages/NotesPage';
import { SamplePage } from '~/pages/SamplePage';
import { QuizPage } from '~/pages/QuizPage';
import { QrRedirect } from '~/pages/QrRedirect';
import { FreeToolsSection } from '~/components/FreeToolsSection';
import { SubnetCalculatorPage } from '~/pages/SubnetCalculatorPage';
import { DnsLookupPage } from '~/pages/DnsLookupPage';
import { IpAddressInfoPage } from '~/pages/IpAddressInfoPage';
import { BinaryConverterPage } from '~/pages/BinaryConverterPage';
import { PortReferencePage } from '~/pages/PortReferencePage';
import { ProtocolExplorerPage } from '~/pages/ProtocolExplorerPage';
import { SystemDesignSimulatorPage } from '~/pages/SystemDesignSimulatorPage';
import { TutorialsHubPage } from '~/pages/TutorialsHubPage';
import { ArticlePage } from '~/pages/ArticlePage';
import { TopicDetailPage } from '~/pages/TopicDetailPage';
import { PublishingDashboard } from '~/pages/PublishingDashboard';
import { NotFoundPage } from '~/pages/NotFoundPage';

function RootIndex() {
  return (
    <RootLayout>
      <HomePage />
    </RootLayout>
  );
}

function About() {
  return (
    <RootLayout>
      <AboutPage />
    </RootLayout>
  );
}

function FreeToolsLanding() {
  return (
    <RootLayout>
      <FreeToolsSection />
    </RootLayout>
  );
}
