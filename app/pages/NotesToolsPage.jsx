import React, { useEffect, useState } from 'react';
import { Link } from 'react-router';
import { useQrDataUrl } from '../../src/utils/useQr';
import { CATEGORIES, getTool, toolsByCategory, TOOL_COUNT } from '../../src/data/toolCatalog';

// Every entry here is a tool a student should open while reading a chapter.
// Each card prints a QR code pointing at the live tool, so the same page can be
// pasted into a PDF, a printed handout or a classroom slide.
const CHAPTER_TOOLS = [
  { chapter: 'Ch 1 · Network models & OSI', slug: 'protocol-explorer', line: 'Watch a DNS, TCP and TLS handshake frame by frame.' },
  { chapter: 'Ch 2 · IP addressing', slug: 'ip-address-info', line: 'Decode any address: class, scope, private range, binary.' },
  { chapter: 'Ch 3 · Subnetting', slug: 'subnet-calculator', line: 'Check your working and plan VLSM allocations.' },
  { chapter: 'Ch 3 · Subnetting practice', slug: 'subnet-drill', line: 'Ten quick questions with the full working shown.' },
  { chapter: 'Ch 4 · Ports & protocols', slug: 'port-reference', line: 'All 60+ enterprise ports with the ACL line for each.' },
  { chapter: 'Ch 4 · Ports practice', slug: 'port-quiz', line: 'Port number → service, four options, instant feedback.' },
  { chapter: 'Ch 5 · DNS', slug: 'dns-lookup', line: 'Query A, MX, TXT and NS records live.' },
  { chapter: 'Ch 5 · Website reachability', slug: 'site-status', line: 'Check whether a site is down for everyone or just you.' },
  { chapter: 'Ch 6 · Switching & VLANs', slug: 'mac-oui', line: 'Decode a MAC address and identify the vendor.' },
  { chapter: 'Ch 7 · Routing & OSPF', slug: 'ip-range-cidr', line: 'Turn a range into exact CIDR blocks for route tables.' },
  { chapter: 'Ch 8 · Bandwidth & performance', slug: 'speed-test', line: 'Measure download, upload, ping and jitter.' },
  { chapter: 'Ch 9 · Linux basics', slug: 'linux-terminal', line: 'Practise ip a, ping, traceroute in a safe sandbox.' },
  { chapter: 'Ch 9 · Permissions', slug: 'chmod-calculator', line: 'Build 644/755 modes and read the symbolic form.' },
  { chapter: 'Ch 10 · Storage', slug: 'raid-calculator', line: 'RAID capacity and fault tolerance maths.' },
];

const QrCard = ({ chapter, slug, line }) => {
  const tool = getTool(slug);
  // Built after mount so the server and the browser render the same markup;
  // the QR still points at whatever origin the sheet was printed from.
  const [url, setUrl] = useState('');
  useEffect(() => {
    setUrl(`${window.location.origin}/tools/${slug}`);
  }, [slug]);
  const qr = useQrDataUrl(url, 220);

  return (
    <div className="flex gap-4 rounded-2xl border border-slate-800 bg-white p-4 text-black print:break-inside-avoid">
      <div className="flex-1">
        <p className="text-[10px] font-semibold uppercase tracking-wider text-black/50">{chapter}</p>
        <h3 className="mt-1 text-sm font-bold leading-snug">{tool?.name || slug}</h3>
        <p className="mt-1 text-[11px] leading-relaxed text-black/60">{line}</p>
        <p className="mt-2 break-all font-mono text-[9px] text-black/40">{url || `/tools/${slug}`}</p>
      </div>
      <div className="flex-shrink-0">
        {qr ? (
          <img src={qr} alt={`QR code for ${tool?.name || slug}`} width={92} height={92} className="rounded-lg border border-black/10" />
        ) : (
          <div className="h-[92px] w-[92px] rounded-lg border border-black/10 bg-black/5" />
        )}
      </div>
    </div>
  );
};

export function NotesToolsPage() {
  return (
    <div className="mx-auto max-w-6xl px-4 py-10 sm:px-6 sm:py-14 print:max-w-none print:py-4">
      <p className="text-[11px] font-semibold uppercase tracking-[0.2em] text-electric-400 print:text-black">
        Notes companion
      </p>
      <h1 className="mt-2 text-3xl font-black tracking-tight text-white sm:text-4xl print:text-black">
        Interactive tools for every chapter
      </h1>
      <p className="mt-3 max-w-3xl text-sm leading-relaxed text-slate-400 print:text-black/70">
        Print this page, paste a QR into the matching chapter of your notes, and the tool opens on a phone instantly.
        Nothing to install and no sign-up — students scan, practise, and come back to the chapter with the answer checked.
      </p>

      <div className="mt-4 flex flex-wrap gap-2 print:hidden">
        <button
          type="button"
          onClick={() => window.print()}
          className="rounded-xl bg-electric-600 px-4 py-2 text-xs font-semibold text-white hover:bg-electric-500"
        >
          Print QR sheet
        </button>
        <Link to="/tools" className="rounded-xl border border-slate-700 px-4 py-2 text-xs font-semibold text-slate-300 hover:text-white">
          All {TOOL_COUNT} tools →
        </Link>
        <Link to="/notes" className="rounded-xl border border-slate-700 px-4 py-2 text-xs font-semibold text-slate-300 hover:text-white">
          Back to notes →
        </Link>
      </div>

      <div className="mt-8 grid gap-3 bg-white/0 sm:grid-cols-2 lg:grid-cols-3 print:grid-cols-2 print:gap-2">
        {CHAPTER_TOOLS.map((item) => (
          <QrCard key={item.slug + item.chapter} {...item} />
        ))}
      </div>

      <section className="mt-12 print:hidden">
        <h2 className="text-sm font-bold uppercase tracking-wider text-slate-300">Tools by subject</h2>
        <div className="mt-4 grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
          {CATEGORIES.map((category) => (
            <Link
              key={category.id}
              to={`/tools?category=${category.id}`}
              className="rounded-xl border border-slate-800 bg-navy-900 p-4 transition hover:border-slate-600"
            >
              <div className="flex items-center justify-between">
                <h3 className="text-sm font-semibold text-white">{category.label}</h3>
                <span className="font-mono text-[11px] text-slate-500">{toolsByCategory(category.id).length}</span>
              </div>
              <p className="mt-1.5 text-[11px] text-slate-500">{toolsByCategory(category.id)[0]?.name} →</p>
            </Link>
          ))}
        </div>
      </section>
    </div>
  );
}

export default NotesToolsPage;
