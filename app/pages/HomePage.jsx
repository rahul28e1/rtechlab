import React from 'react';
import { Hero, CategoryExplorer } from '../components/Hero';
import { InterviewPrepSection } from '../components/InterviewPrepSection';
import { FreeToolsSection } from '../components/FreeToolsSection';
import { SystemDesignShowcase } from '../../src/components/SystemDesignShowcase';
import { AboutSection } from '../../src/components/AboutSection';

export default function HomePage() {
  return (
    <>
      <Hero />
      <CategoryExplorer />
      <FreeToolsSection />
      <SystemDesignShowcase />
      <AboutSection />
      <InterviewPrepSection />
    </>
  );
}
