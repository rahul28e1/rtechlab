import React from 'react';
import { Link } from 'react-router';
import { getCategory, toolsByCategory } from '../../data/toolCatalog';

const audienceLabel = (bestFor) =>
  bestFor === 'india' ? 'Exam prep favourite' : bestFor === 'global' ? 'Global coursework' : 'Used by both streams';

export const ToolCard = ({ tool, tried = false }) => {
  const category = getCategory(tool.category);
  return (
    <Link
      to={`/tools/${tool.slug}`}
      className={`group flex h-full flex-col rounded-2xl border bg-navy-900 p-5 transition-all duration-200 hover:-translate-y-0.5 ${
        tried ? 'border-emerald-500/30 hover:border-emerald-500/60' : 'border-slate-800 hover:border-slate-600'
      }`}
    >
      <div className="mb-3 flex items-center justify-between gap-2">
        <span className="rounded-md border border-slate-700 bg-navy-950 px-2 py-0.5 text-[10px] font-medium uppercase tracking-wider text-slate-400">
          {category?.label}
        </span>
        {tried ? (
          <span className="rounded-full bg-emerald-500/15 px-2 py-0.5 text-[10px] font-semibold uppercase tracking-wider text-emerald-300">
            ✓ Tried
          </span>
        ) : (
          <span className="text-[10px] font-semibold uppercase tracking-wider text-electric-400">
            {tool.featured ? 'Popular' : ''}
          </span>
        )}
      </div>
      <h3 className="text-base font-bold text-white transition-colors group-hover:text-electric-300">{tool.name}</h3>
      <p className="mt-2 flex-1 text-xs leading-relaxed text-slate-400">{tool.blurb}</p>
      <div className="mt-4 flex flex-wrap gap-1.5">
        {tool.tags.slice(0, 3).map((tag) => (
          <span key={tag} className="rounded-md bg-navy-950 px-1.5 py-0.5 font-mono text-[10px] text-slate-500">
            {tag}
          </span>
        ))}
      </div>
      <span className="mt-3 text-[10px] uppercase tracking-wider text-slate-600">{audienceLabel(tool.bestFor)}</span>
      <span className="mt-2 text-xs font-semibold text-electric-400">
        Open tool <span className="transition-transform group-hover:translate-x-0.5">→</span>
      </span>
    </Link>
  );
};

export function ToolShell({ tool, children }) {
  const category = getCategory(tool.category);
  const related = toolsByCategory(tool.category).filter((item) => item.slug !== tool.slug).slice(0, 3);
  const index = toolsByCategory(tool.category).findIndex((item) => item.slug === tool.slug);
  const next = toolsByCategory(tool.category)[index + 1];
  // The system-design simulators introduce themselves: blocks marked with
  // data-setup drop in from above, in order, instead of appearing all at once.
  const assemble = tool.category === 'system-design';

  return (
    <div className={`mx-auto max-w-6xl px-4 py-10 sm:px-6 sm:py-14${assemble ? ' setup-in' : ''}`}>
      <nav data-setup="0" className="mb-6 flex flex-wrap items-center gap-1.5 text-[11px] text-slate-500">
        <Link to="/" className="hover:text-white">Home</Link>
        <span>/</span>
        <Link to="/tools" className="hover:text-white">Tools</Link>
        <span>/</span>
        <Link to={`/tools?category=${tool.category}`} className="hover:text-white">{category?.label}</Link>
        <span>/</span>
        <span className="text-slate-300">{tool.name}</span>
      </nav>

      <div data-setup="1" className="mb-2 flex flex-wrap items-center gap-2">
        <span className="rounded-full border border-electric-500/30 bg-electric-500/10 px-2.5 py-0.5 text-[11px] font-medium text-electric-300">
          {category?.label}
        </span>
        <span className="rounded-md border border-slate-800 px-2 py-0.5 text-[10px] uppercase tracking-wider text-slate-500">
          {audienceLabel(tool.bestFor)}
        </span>
        {tool.tags.map((tag) => (
          <span key={tag} className="rounded-md border border-slate-800 px-2 py-0.5 font-mono text-[10px] text-slate-500">
            {tag}
          </span>
        ))}
      </div>

      <h1 data-setup="2" className="text-3xl font-black tracking-tight text-white sm:text-4xl lg:text-5xl">{tool.name}</h1>
      <p data-setup="3" className="mt-3 max-w-3xl text-sm leading-relaxed text-slate-400">{tool.blurb}</p>

      <div data-setup="4" className="mt-5 rounded-2xl border border-slate-800 bg-navy-900/60 p-4 sm:p-5">
        <h2 className="text-[11px] font-bold uppercase tracking-[0.18em] text-electric-400">How to use this tool</h2>
        <p className="mt-2 max-w-3xl text-xs leading-relaxed text-slate-300 sm:text-[13px]">{tool.howTo}</p>
      </div>

      <p data-setup="5" className="mt-3 text-[11px] text-slate-600">Runs entirely in your browser · no sign-up · no tracking</p>

      <div data-setup="6" className="mt-8">{children}</div>

      {next && (
        <div className="mt-8 flex flex-wrap items-center justify-between gap-3 rounded-xl border border-slate-800 bg-navy-900 px-4 py-3">
          <span className="text-xs text-slate-500">Next in {category?.label}</span>
          <Link to={`/tools/${next.slug}`} className="text-xs font-semibold text-electric-400 hover:text-electric-300">
            {next.name} →
          </Link>
        </div>
      )}

      {related.length > 0 && (
        <section className="mt-14 border-t border-slate-800 pt-8">
          <div className="mb-4 flex items-center justify-between">
            <h2 className="text-sm font-bold uppercase tracking-wider text-slate-300">More {category?.label} tools</h2>
            <Link to="/tools" className="text-xs font-semibold text-electric-400 hover:text-electric-300">
              All tools →
            </Link>
          </div>
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {related.map((item) => (
              <ToolCard key={item.slug} tool={item} />
            ))}
          </div>
        </section>
      )}

      <section className="mt-10 grid gap-4 sm:grid-cols-2">
        <Link to="/notes" className="rounded-2xl border border-slate-800 bg-navy-900 p-5 transition hover:border-slate-600">
          <h3 className="text-sm font-bold text-white">Study the theory behind it</h3>
          <p className="mt-1 text-xs text-slate-400">
            Chapter notes and practice sets in English and Hindi, starting free.
          </p>
          <span className="mt-3 inline-block text-xs font-semibold text-electric-400">Browse notes →</span>
        </Link>
        <Link to="/quiz/ccna-m1" className="rounded-2xl border border-slate-800 bg-navy-900 p-5 transition hover:border-slate-600">
          <h3 className="text-sm font-bold text-white">Test yourself in 5 minutes</h3>
          <p className="mt-1 text-xs text-slate-400">
            Chapter-wise quizzes with a shareable score card.
          </p>
          <span className="mt-3 inline-block text-xs font-semibold text-electric-400">Start a quiz →</span>
        </Link>
      </section>
    </div>
  );
}

