import React from 'react';
import { Link } from 'react-router';
import { toolsByCategory } from '../../src/data/toolCatalog';
import { SystemDesignSimulatorsGrid } from '../components/SystemDesignSimulatorsGrid';

const SIMULATORS = toolsByCategory('system-design');

const COPY = {
  featured: 'Start here',
  open: 'Open simulator',
};

export function SystemDesignSimulatorPage() {
  return (
    <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 sm:py-16 lg:px-8">
      <p className="mb-3 text-[11px] font-semibold uppercase tracking-[0.2em] text-electric-400">
        Interactive system design
      </p>
      <h1 className="max-w-3xl text-4xl font-black leading-[1.05] tracking-tight text-white sm:text-5xl">
        {SIMULATORS.length} simulators for the interview whiteboard.
      </h1>
      <p className="mt-4 max-w-2xl text-sm leading-relaxed text-slate-400 sm:text-base">
        Every number a system design answer depends on — latency, traffic, cache hit rate, quorum — running
        live in your browser. Change one slider and watch which part of the system breaks first.
      </p>
      <p className="mt-3 max-w-2xl text-xs leading-relaxed text-slate-500 sm:text-sm">
        Inside every simulator: camera angles and zoom on a labelled diagram, plus a step-by-step guide that
        explains each part in plain language — built to be studied, not just played with.
      </p>

      <SystemDesignSimulatorsGrid simulators={SIMULATORS} copy={COPY} />

      <p className="mt-8 text-xs text-slate-500">
        New to these ideas?{' '}
        <Link to="/notes" className="font-semibold text-electric-400 hover:text-electric-300">
          Read the roadmaps
        </Link>{' '}
        first, or see every tool in the{' '}
        <Link
          to="/tools?category=system-design"
          className="font-semibold text-electric-400 hover:text-electric-300"
        >
          system design toolkit
        </Link>
        .
      </p>
    </div>
  );
}

export default SystemDesignSimulatorPage;
