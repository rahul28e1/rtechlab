import React, { useEffect, useMemo, useState } from 'react';
import { Link, useLocation, useSearchParams } from 'react-router';
import { CATEGORIES, TOOL_COUNT, TOOLS, toolsByCategory } from '../../src/data/toolCatalog';
import { ToolCard } from '../../src/components/tools/ToolShell';
import { getTriedTools } from '../../src/utils/toolProgress';
import { WhatsAppCommunityCard } from '../components/WhatsAppCommunityCard';

export function ToolsHubPage() {
  const [params, setParams] = useSearchParams();
  const active = params.get('category');
  const [query, setQuery] = useState('');
  const [tried, setTried] = useState([]);

  useEffect(() => {
    setTried(getTriedTools());
  }, []);

  // Category order first, then the per-category `order` field: the sequence
  // mirrors what students reach for most, so browsing stays predictable.
  const ordered = useMemo(() => {
    const categoryIndex = (id) => CATEGORIES.findIndex((category) => category.id === id);
    return [...TOOLS].sort(
      (a, b) => categoryIndex(a.category) - categoryIndex(b.category) || (a.order || 99) - (b.order || 99),
    );
  }, []);

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    return ordered.filter((tool) => {
      const matchesCategory = !active || tool.category === active;
      const matchesQuery =
        !q ||
        [tool.name, tool.blurb, tool.tags.join(' ')].join(' ').toLowerCase().includes(q);
      return matchesCategory && matchesQuery;
    });
  }, [active, query, ordered]);

  const triedSet = useMemo(() => new Set(tried), [tried]);
  const remaining = Math.max(0, TOOL_COUNT - tried.length);
  const percent = Math.round((tried.length / TOOL_COUNT) * 100);
  const nextUp = ordered.filter((tool) => !triedSet.has(tool.slug)).slice(0, 4);

  const location = useLocation();
  const isHindi = location.pathname.startsWith('/hi');

  const selectCategory = (id) => {
    if (!id) setParams({});
    else setParams({ category: id });
  };

  return (
    <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 sm:py-16 lg:px-8">
      <p className="mb-3 text-[11px] font-semibold uppercase tracking-[0.2em] text-electric-400">
        {isHindi ? 'निःशुल्क इंजीनियरिंग टूलकिट' : 'Free engineering toolkit'}
      </p>
      <h1 className="max-w-3xl text-4xl font-black leading-[1.05] tracking-tight text-white sm:text-5xl lg:text-6xl">
        {isHindi ? `आपके अध्ययन के प्रत्येक ट्रैक के लिए ${TOOL_COUNT} टूल्स।` : `${TOOL_COUNT} tools for every track you study.`}
      </h1>
      <p className="mt-4 max-w-2xl text-sm leading-relaxed text-slate-400 sm:text-base">
        {isHindi
          ? 'नेटवर्किंग, हार्डवेयर, साइबर सुरक्षा, एथिकल हैकिंग, क्लाउड, AI, डिज़ाइन, कंप्यूटर फंडामेंटल्स और Office 365. सब कुछ सीधे आपके ब्राउज़र में चलता है — बिना किसी इंस्टॉलेशन या साइन-अप के।'
          : 'Networking, hardware, cyber security, ethical hacking, cloud, AI, design, computer fundamentals and Office 365. Everything runs in your browser — nothing to install, nothing to sign up for.'}
      </p>

      {/* Progress strip: turns a catalogue into something to work through. */}
      <div className="mt-7 rounded-2xl border border-slate-800 bg-navy-900 p-5">
        <div className="flex flex-wrap items-end justify-between gap-3">
          <div>
            <p className="text-sm font-semibold text-white">
              {tried.length === 0 ? 'Nothing tried yet — pick any tool below' : `${tried.length} of ${TOOL_COUNT} tools tried`}
            </p>
            <p className="mt-0.5 text-[11px] text-slate-500">
              {tried.length === 0
                ? 'Progress saves in this browser automatically, no sign-up needed.'
                : `${remaining} left${percent >= 100 ? ' — you have opened every single one.' : '. Small steps: four tools a day finishes the set in three weeks.'}`}
            </p>
          </div>
          <span className="font-mono text-2xl font-bold text-emerald-400">{percent}%</span>
        </div>
        <div className="mt-3 h-2 overflow-hidden rounded-full bg-slate-800">
          <div className="h-full rounded-full bg-emerald-500 transition-all duration-500" style={{ width: `${percent}%` }} />
        </div>
      </div>

      {/* Start-here row so a first-time visitor is not facing 67 equal cards. */}
      {nextUp.length > 0 && (
        <section className="mt-8">
          <div className="flex items-end justify-between gap-3">
            <div>
              <h2 className="text-sm font-bold uppercase tracking-wider text-slate-300">
                {tried.length === 0 ? 'Start here' : 'Pick up where you left off'}
              </h2>
              <p className="mt-1 text-[11px] text-slate-500">
                {tried.length === 0 ? 'Six-minute wins that show what the toolkit is for.' : 'The next four tools you have not opened yet.'}
              </p>
            </div>
          </div>
          <div className="mt-4 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
            {nextUp.map((tool) => (
              <Link
                key={tool.slug}
                to={`/tools/${tool.slug}`}
                className="group flex flex-col rounded-xl border border-slate-800 bg-gradient-to-b from-slate-900 to-navy-950 p-4 transition hover:-translate-y-0.5 hover:border-emerald-500/40"
              >
                <span className="text-[10px] font-semibold uppercase tracking-wider text-emerald-400">
                  {CATEGORIES.find((category) => category.id === tool.category)?.label}
                </span>
                <span className="mt-1.5 text-sm font-semibold leading-snug text-white group-hover:text-emerald-200">
                  {tool.name}
                </span>
                <span className="mt-1 flex-1 text-[11px] leading-relaxed text-slate-500">{tool.blurb}</span>
                <span className="mt-3 text-[11px] font-semibold text-electric-400">
                  Open <span className="transition-transform group-hover:translate-x-0.5">→</span>
                </span>
              </Link>
            ))}
          </div>
        </section>
      )}

      <div className="mt-10 flex flex-col gap-3 sm:flex-row sm:items-center">
        <input
          value={query}
          onChange={(event) => setQuery(event.target.value)}
          placeholder="Search tools — subnet, dns, raid, token, contrast…"
          className="w-full rounded-xl border border-slate-800 bg-navy-900 px-4 py-2.5 text-sm text-white outline-none transition placeholder:text-slate-600 focus:border-electric-500 sm:max-w-md"
        />
        <span className="text-xs text-slate-500">
          {filtered.length} of {TOOL_COUNT} tools
        </span>
      </div>

      <div className="mt-6 flex flex-wrap gap-2">
        <button
          type="button"
          onClick={() => selectCategory(null)}
          className={`rounded-full px-3.5 py-1.5 text-xs font-medium transition ${
            !active ? 'bg-white text-black' : 'border border-slate-800 text-slate-400 hover:text-white'
          }`}
        >
          All
        </button>
        {CATEGORIES.map((category) => (
          <button
            key={category.id}
            type="button"
            onClick={() => selectCategory(category.id)}
            className={`rounded-full px-3.5 py-1.5 text-xs font-medium transition ${
              active === category.id
                ? 'bg-white text-black'
                : 'border border-slate-800 text-slate-400 hover:text-white'
            }`}
          >
            {category.label}
          </button>
        ))}
      </div>

      {active && (
        <p className="mt-4 max-w-2xl text-xs leading-relaxed text-slate-500">
          {CATEGORIES.find((category) => category.id === active)?.blurb}
        </p>
      )}

      {filtered.length === 0 ? (
        <div className="mt-12 rounded-2xl border border-slate-800 bg-navy-900 p-10 text-center">
          <p className="text-sm text-slate-300">No tool matches “{query}”.</p>
          <button
            type="button"
            onClick={() => {
              setQuery('');
              selectCategory(null);
            }}
            className="mt-3 text-xs font-semibold text-electric-400 hover:text-electric-300"
          >
            Clear filters
          </button>
        </div>
      ) : (
        <div className="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
          {filtered.map((tool) => (
            <ToolCard key={tool.slug} tool={tool} tried={triedSet.has(tool.slug)} />
          ))}
        </div>
      )}

      {!active && !query && (
        <section className="mt-16 border-t border-slate-800 pt-10">
          <h2 className="text-lg font-bold text-white">Every category, in one place</h2>
          <p className="mt-1 text-xs text-slate-500">Try one tool per category and you have covered the whole syllabus.</p>
          <div className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {CATEGORIES.map((category) => {
              const categoryTools = TOOLS.filter((tool) => tool.category === category.id);
              const triedInCategory = categoryTools.filter((tool) => triedSet.has(tool.slug)).length;
              const categoryPercent = Math.round((triedInCategory / categoryTools.length) * 100);
              return (
                <button
                  key={category.id}
                  type="button"
                  onClick={() => selectCategory(category.id)}
                  className="rounded-xl border border-slate-800 bg-navy-900 p-4 text-left transition hover:border-slate-600"
                >
                  <div className="flex items-center justify-between">
                    <h3 className="text-sm font-semibold text-white">{category.label}</h3>
                    <span className="font-mono text-[11px] text-slate-500">
                      {triedInCategory}/{categoryTools.length}
                    </span>
                  </div>
                  <div className="mt-2 h-1.5 overflow-hidden rounded-full bg-slate-800">
                    <div className="h-full rounded-full bg-emerald-500" style={{ width: `${categoryPercent}%` }} />
                  </div>
                  <p className="mt-2 text-[11px] leading-relaxed text-slate-500">{category.blurb}</p>
                  <span className="mt-2 inline-block text-[10px] font-semibold uppercase tracking-wider text-electric-400">
                    {toolsByCategory(category.id)[0]?.name} →
                  </span>
                </button>
              );
            })}
          </div>
        </section>
      )}

      <section className="mt-14 grid gap-4 sm:grid-cols-2">
        <Link to="/notes" className="rounded-2xl border border-slate-800 bg-navy-900 p-6 transition hover:border-slate-600">
          <h3 className="text-base font-bold text-white">Pair a tool with the notes</h3>
          <p className="mt-1.5 text-xs leading-relaxed text-slate-400">
            Every chapter links to the tool that proves it. Subnetting chapter → subnet calculator, DNS chapter → live lookup.
          </p>
          <span className="mt-3 inline-block text-xs font-semibold text-electric-400">Browse notes →</span>
        </Link>
        <Link to="/quiz/ccna-m1" className="rounded-2xl border border-slate-800 bg-navy-900 p-6 transition hover:border-slate-600">
          <h3 className="text-base font-bold text-white">Then check you understood it</h3>
          <p className="mt-1.5 text-xs leading-relaxed text-slate-400">
            Chapter-wise quizzes, 6 questions each, with a score card you can share with a study group.
          </p>
          <span className="mt-3 inline-block text-xs font-semibold text-electric-400">Start a quiz →</span>
        </Link>
      </section>

      {/* Official WhatsApp Community Card */}
      <div className="mt-12">
        <WhatsAppCommunityCard />
      </div>
    </div>
  );
}

export default ToolsHubPage;
