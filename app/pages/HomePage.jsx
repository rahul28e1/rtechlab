import React from 'react';
import { Hero } from '../components/Hero';
import { FeaturedNotesShelf } from '../components/FeaturedNotesShelf';
import { QuickInterviewQuiz } from '../components/QuickInterviewQuiz';
import { StudentReviewsWall } from '../components/StudentReviewsWall';
import { InterviewPrepSection } from '../components/InterviewPrepSection';
import { FreeToolsSection } from '../components/FreeToolsSection';
import { SystemDesignShowcase } from '../../src/components/SystemDesignShowcase';
import { AboutSection } from '../../src/components/AboutSection';
import { WhatsAppCommunityCard } from '../components/WhatsAppCommunityCard';

export default function HomePage() {
  return (
    <>
      <Hero />
      <FeaturedNotesShelf />
      <FreeToolsSection />
      <QuickInterviewQuiz />
      <StudentReviewsWall />
      <SystemDesignShowcase />
      <InterviewPrepSection />
      <section className="py-12 px-4 sm:px-6 lg:px-8 max-w-7xl mx-auto">
        <WhatsAppCommunityCard />
      </section>
      <AboutSection />
    </>
  );
}

