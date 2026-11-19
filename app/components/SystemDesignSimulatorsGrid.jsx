import React, { useEffect } from 'react';
import { Link, useLocation } from 'react-router';
import { Route, Network, TrendingUp, Database, Timer, Calculator, Vote, Layers } from 'lucide-react';

// Same identities as the home-page showcase, so a simulator keeps one icon
// everywhere it appears.
const ICONS = {
  'request-journey': Route,
  'load-balancer-sim': Network,
  'autoscaling-simulator': TrendingUp,
  'cache-simulator': Database,
  'rate-limiter': Timer,
  'capacity-estimator': Calculator,
  'quorum-calculator': Vote,
};

// Shared by /system-design and /hi/system-design: both pages render the same
// catalog cards, only the card copy and the two labels differ. Each card keeps
// its slug as an id so deep links like /system-design#cache-simulator land on it.
export function SystemDesignSimulatorsGrid({ simulators, copy, getCopy }) {
  const { hash } = useLocation();

  // ScrollRestoration ignores hash targets, so a link like
  // /system-design#cache-simulator would otherwise land at the top of the page.
  useEffect(() => {
    if (!hash) return;
    const target = document.getElementById(decodeURIComponent(hash.slice(1)));
    // `instant` overrides the global smooth scroll, so a deep link lands on the
    // card immediately instead of animating through the whole hero.
    if (target) target.scrollIntoView({ block: 'start', behavior: 'instant' });
  }, [hash]);

  return (
    <div className="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
      {simulators.map((tool, index) => {
        const text = getCopy ? getCopy(tool) : tool;
        const Icon = ICONS[tool.slug] || Layers;
        return (
          <Link
            key={tool.slug}
            id={tool.slug}
            to={`/tools/${tool.slug}`}
            className="group flex scroll-mt-24 flex-col rounded-2xl border border-slate-800 bg-navy-900 p-5 transition hover:-translate-y-0.5 hover:border-electric-500/40"
          >
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-2.5">
                <span className="flex h-9 w-9 items-center justify-center rounded-xl border border-slate-800 bg-navy-950 text-electric-400 transition group-hover:border-electric-500/40 group-hover:text-electric-300">
                  <Icon className="h-4 w-4" aria-hidden="true" />
                </span>
                <span className="font-mono text-[11px] text-slate-600">
                  {String(index + 1).padStart(2, '0')}
                </span>
              </div>
              {tool.featured && (
                <span className="rounded-full border border-emerald-500/30 bg-emerald-500/10 px-2 py-0.5 text-[10px] font-semibold uppercase tracking-wider text-emerald-400">
                  {copy.featured}
                </span>
              )}
            </div>
            <h2 className="mt-3 text-base font-bold leading-snug text-white group-hover:text-electric-300">
              {text.name}
            </h2>
            <p className="mt-2 flex-1 text-xs leading-relaxed text-slate-400">{text.blurb}</p>
            <div className="mt-4 flex flex-wrap gap-1.5">
              {tool.tags.map((tag) => (
                <span
                  key={tag}
                  className="rounded-full border border-slate-800 px-2 py-0.5 text-[10px] text-slate-500"
                >
                  {tag}
                </span>
              ))}
            </div>
            <span className="mt-4 text-[11px] font-semibold text-electric-400">
              {copy.open}{' '}
              <span className="inline-block transition-transform group-hover:translate-x-0.5">→</span>
            </span>
          </Link>
        );
      })}
    </div>
  );
}
