import React from 'react';
import { Hero, CategoryExplorer } from '../components/Hero';
import { InterviewPrepSection } from '../components/InterviewPrepSection';
import { FreeToolsSection } from '../components/FreeToolsSection';
import { SystemDesignShowcase } from '../../src/components/SystemDesignShowcase';
import { AboutSection } from '../../src/components/AboutSection';
import { WhatsAppCommunityCard } from '../components/WhatsAppCommunityCard';

export default function HomePage() {
  return (
    <>
      <Hero />
      <CategoryExplorer />
      <FreeToolsSection />
      <section className="py-12 px-4 sm:px-6 lg:px-8 max-w-7xl mx-auto">
        <WhatsAppCommunityCard />
      </section>
      <SystemDesignShowcase />
      <AboutSection />
      <InterviewPrepSection />
    </>
  );
}

