import React, { useMemo, useState } from 'react';
import { Callout, Field, Panel, SectionTitle, Stat, inputClass } from './toolUi';
import { Flow, Glyph, Node, Note, ProcessScene, StepDot, Tag, TONE, Wire } from './systemDesignStage';
import { simulateCache } from './cacheSim';

// System-design simulators. Everything runs locally in the browser: no server,
// no account. Each tool answers one question a student meets in interviews and
// in real incident reviews — where does the time go, who takes the traffic, does
// the cache help, and how does a quorum survive a failed node.
//
// Every simulator also has a camera stage and a step-by-step guide, because a
// picture you can zoom into teaches faster than a table of numbers.

const RANGE_CLASS = 'w-full cursor-pointer accent-electric-500';

const Range = ({ label, value, min, max, step = 1, format, onChange }) => (
  <Field label={label} hint={format ? format(value) : String(value)}>
    <input
      type="range"
      className={RANGE_CLASS}
      min={min}
      max={max}
      step={step}
      value={value}
      onChange={(event) => onChange(Number(event.target.value))}
    />
  </Field>
);

const Toggle = ({ active, onClick, children }) => (
  <button
    type="button"
    onClick={onClick}
    className={`rounded-full px-3 py-1.5 text-[11px] font-semibold transition ${
      active ? 'bg-emerald-500 text-black' : 'border border-slate-700 text-slate-400 hover:text-white'
    }`}
  >
    {children}
  </button>
);

const ms = (value) => `${value < 10 ? value.toFixed(1) : Math.round(value)} ms`;

// ── 1. Request journey ──────────────────────────────────────────────────────
const buildHops = ({ cached, cdn, distance, dbMs, payload }) => {
  // Light in fibre travels at about 200,000 km/s, so a round trip costs
  // distance / 200,000 seconds — 75 ms one way for a 15,000 km hop.
  const rtt = Math.max(1, (distance / 200000) * 1000 * 2);
  return [
    {
      name: 'DNS lookup',
      detail: cached ? 'name already cached in the browser or OS' : 'recursive resolver walk to the authoritative server',
      ms: cached ? 0.5 : 30 + rtt * 0.4,
      color: 'bg-sky-500',
    },
    { name: 'TCP handshake', detail: 'SYN → SYN-ACK → ACK costs two round trips', ms: rtt * 2, color: 'bg-indigo-500' },
    { name: 'TLS handshake', detail: 'TLS 1.3 needs one extra round trip before data flows', ms: rtt, color: 'bg-violet-500' },
    { name: 'Server work', detail: 'app logic plus the database query you set below', ms: 5 + dbMs, color: 'bg-amber-500' },
    {
      name: 'Download assets',
      detail: cdn ? 'served from an edge cache near the user (100 Mbps)' : 'served from the origin server (20 Mbps)',
      ms: payload * (cdn ? 80 : 400),
      color: 'bg-emerald-500',
    },
  ];
};

const JOURNEY_CAMERAS = [
  { id: 'wide', label: 'Wide shot', cx: 450, cy: 210, zoom: 1 },
  { id: 'dns', label: 'DNS', cx: 274, cy: 195, zoom: 2.5 },
  { id: 'secure', label: 'Secure link', cx: 450, cy: 210, zoom: 2.3 },
  { id: 'server', label: 'Server + DB', cx: 640, cy: 240, zoom: 2.0 },
  { id: 'download', label: 'Download', cx: 770, cy: 270, zoom: 2.0 },
];

const JOURNEY_X = [20, 196, 372, 548, 724];

export const RequestJourney = () => {
  const [cached, setCached] = useState(false);
  const [cdn, setCdn] = useState(false);
  const [distance, setDistance] = useState(2000);
  const [dbMs, setDbMs] = useState(80);
  const [payload, setPayload] = useState(2);

  const hops = useMemo(
    () => buildHops({ cached, cdn, distance, dbMs, payload }),
    [cached, cdn, distance, dbMs, payload],
  );
  const total = hops.reduce((sum, hop) => sum + hop.ms, 0);
  const baseline = useMemo(
    () =>
      buildHops({ cached: false, cdn: false, distance, dbMs, payload }).reduce((sum, hop) => sum + hop.ms, 0),
    [distance, dbMs, payload],
  );
  const saved = Math.max(0, Math.round(((baseline - total) / baseline) * 100));

  const steps = useMemo(
    () => [
      {
        title: 'DNS lookup',
        meta: ms(hops[0].ms),
        camera: 'dns',
        focus: { cx: 274, cy: 200, w: 250, h: 130 },
        simple:
          'A website name is like a contact name in your phone. DNS is the contact list that turns “rtechlab.com” into the number computers actually use.',
        detail: cached
          ? 'Your device already remembers the address, so this hop is almost free. That is why repeat visits feel faster than the first one.'
          : `Your device asks a resolver, which walks to the authoritative server: ${hops[0].detail}. Right now this stop costs ${ms(hops[0].ms)}.`,
        watch: cached ? 'Cache is ON — this stop is 0.5 ms.' : 'Turn DNS cache on above and watch this stop almost disappear.',
      },
      {
        title: 'TCP hello',
        meta: ms(hops[1].ms),
        camera: 'secure',
        focus: { cx: 450, cy: 200, w: 260, h: 130 },
        simple:
          'Both computers say “can you hear me?” and wait for “yes” before sending any page. That greeting takes a full round trip.',
        detail: `SYN → SYN-ACK → ACK needs two one-way trips. Over ${distance.toLocaleString()} km that is ${ms(hops[1].ms)} of pure waiting — light in fibre covers only about 200 km in 1 ms.`,
        watch: 'This is distance, not slow code. No server upgrade can remove it.',
      },
      {
        title: 'TLS padlock',
        meta: ms(hops[2].ms),
        camera: 'secure',
        focus: { cx: 450, cy: 200, w: 260, h: 130 },
        simple:
          'The two sides agree on a secret code so nobody in the middle can read the page. This is the padlock next to the address bar.',
        detail: `TLS 1.3 needs one more round trip (${ms(hops[2].ms)}), then everything is encrypted. Without it, anyone on the Wi-Fi could read the password you type.`,
        watch: 'Encryption costs one round trip — a fair price for privacy.',
      },
      {
        title: 'Server thinks',
        meta: ms(hops[3].ms),
        camera: 'server',
        focus: { cx: 626, cy: 250, w: 200, h: 200 },
        simple:
          'The server runs the website’s code and asks the database for the record it needs. This is the part that actually “thinks”.',
        detail: `App logic plus the ${dbMs} ms database query you set above = ${ms(hops[3].ms)}. A slow query here delays every visitor, no matter how fast their internet is.`,
        watch: `Database query: ${dbMs} ms of the ${ms(hops[3].ms)} stop.`,
      },
      {
        title: 'Files come back',
        meta: ms(hops[4].ms),
        camera: 'download',
        focus: { cx: 802, cy: 210, w: 180, h: 130 },
        simple:
          'Pictures, styles and scripts travel back to you. A CDN keeps a copy in a city near you, so the files have less distance to cover.',
        detail: `${payload.toFixed(1)} MB at ${cdn ? 'about 100 Mbps from the nearest edge' : 'about 20 Mbps from the origin'} = ${ms(hops[4].ms)}. Page weight matters more than people expect: a 10 MB page is ten times the wait.`,
        watch: cdn ? 'CDN is ON — the same page is much lighter on the wire.' : 'Turn CDN on above and watch this stop collapse.',
      },
      {
        title: 'Add it all up',
        meta: ms(total),
        camera: 'wide',
        simple:
          'Add the five stops and you get the time until the page appears. Big files and far-away servers hurt more than a little extra code.',
        detail: `This load takes ${ms(total)}. With no DNS cache and no CDN it would take ${ms(baseline)} — ${saved}% saved by moving data closer to the student.`,
        watch: total > 1000 ? 'Over one second: move the data closer before optimising code.' : 'Under one second: this page feels instant.',
      },
    ],
    [hops, cached, cdn, distance, dbMs, payload, total, baseline, saved],
  );

  const renderScene = (active) => {
    const nodes = [
      { kind: 'user', label: 'You', sub: 'the browser', tone: TONE.blue, x: JOURNEY_X[0] },
      { kind: 'globe', label: 'DNS', sub: cached ? 'answered from cache' : 'name → IP address', tone: TONE.cyan, x: JOURNEY_X[1] },
      { kind: 'lock', label: 'Secure link', sub: 'TCP + TLS 1.3', tone: TONE.violet, x: JOURNEY_X[2] },
      { kind: 'server', label: 'Web server', sub: 'runs the app code', tone: TONE.amber, x: JOURNEY_X[3] },
      { kind: 'cloud', label: 'Download', sub: cdn ? 'from a nearby edge' : 'from the origin', tone: TONE.green, x: JOURNEY_X[4] },
    ];
    return (
      <g>
        {nodes.map((item, index) => (
          <g key={item.label}>
            {index > 0 && (
              <>
                <Wire d={`M${JOURNEY_X[index - 1] + 156} 196 H${JOURNEY_X[index]}`} tone={item.tone} active={active === index} />
                <Flow d={`M${JOURNEY_X[index - 1] + 156} 196 H${JOURNEY_X[index]}`} tone={item.tone} count={2} dur={2.2} size={2.6} />
              </>
            )}
            <StepDot x={item.x + 16} y={136} index={index + 1} tone={item.tone} active={active === index} />
            <Node
              x={item.x}
              y={150}
              w={156}
              h={92}
              kind={item.kind}
              label={item.label}
              sub={item.sub}
              tone={item.tone}
              active={active === index || (active === 3 && index === 3)}
            />
            <text
              x={item.x + 78}
              y={262}
              textAnchor="middle"
              fontSize="12"
              fontWeight="700"
              fontFamily="ui-monospace, monospace"
              fill={item.tone}
            >
              {ms(hops[index].ms)}
            </text>
          </g>
        ))}

        <Wire d="M626 242 V286" tone={TONE.violet} active={active === 3} />
        <Node
          x={556}
          y={286}
          w={140}
          h={66}
          kind="database"
          label="Database"
          sub="your records"
          tone={TONE.violet}
          active={active === 3}
        />

        <Wire d="M802 242 C802 388, 98 388, 98 242" tone={TONE.green} active={active >= 4} dashed />
        <Tag x={450} y={392} text={cdn ? 'files from a nearby CDN' : 'files from the origin server'} tone={TONE.green} />
        <Note x={20} y={406} text="one page load · five stops · responses travel back" />

        {cdn && (
          <>
            <Wire d="M274 242 V286" tone={TONE.green} dashed />
            <Tag x={274} y={304} text="CDN edge" tone={TONE.green} />
          </>
        )}
      </g>
    );
  };

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Change anything below and the timeline recalculates immediately.">
          One page load, hop by hop
        </SectionTitle>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          <Range label="User distance from origin" value={distance} min={50} max={16000} step={50} onChange={setDistance} format={(v) => `${v.toLocaleString()} km`} />
          <Range label="Database query time" value={dbMs} min={1} max={1500} step={1} onChange={setDbMs} format={ms} />
          <Range label="Page weight" value={payload} min={0.2} max={10} step={0.2} onChange={setPayload} format={(v) => `${v.toFixed(1)} MB`} />
        </div>
        <div className="mt-5 flex flex-wrap items-center gap-2">
          <span className="text-[11px] uppercase tracking-wider text-slate-500">Switches</span>
          <Toggle active={cached} onClick={() => setCached((value) => !value)}>
            {cached ? 'DNS cache: ON' : 'DNS cache: OFF'}
          </Toggle>
          <Toggle active={cdn} onClick={() => setCdn((value) => !value)}>
            {cdn ? 'CDN: ON' : 'CDN: OFF'}
          </Toggle>
          <Toggle active={distance <= 800} onClick={() => setDistance(distance <= 800 ? 9000 : 300)}>
            {distance <= 800 ? 'Near user' : 'Move user near edge'}
          </Toggle>
        </div>

        <ProcessScene
          cameras={JOURNEY_CAMERAS}
          steps={steps}
          ariaLabel="A page load travelling from the student's browser through DNS, a secure connection and the web server to the database and back"
          note="Step through the five stops: each camera angle zooms onto the part being explained."
          render={renderScene}
        />

        <div className="mt-6 flex h-3 overflow-hidden rounded-full bg-slate-800">
          {hops.map((hop) => (
            <div
              key={hop.name}
              className={`${hop.color} transition-all duration-500`}
              style={{ width: `${(hop.ms / total) * 100}%` }}
              title={`${hop.name}: ${ms(hop.ms)}`}
            />
          ))}
        </div>

        <div className="mt-5 space-y-2">
          {hops.map((hop) => (
            <div key={hop.name} className="rounded-xl border border-slate-800 bg-navy-950 px-3.5 py-2.5">
              <div className="flex items-baseline justify-between gap-3">
                <span className="text-xs font-semibold text-white">{hop.name}</span>
                <span className="font-mono text-xs text-slate-200">{ms(hop.ms)}</span>
              </div>
              <div className="mt-1.5 h-1 overflow-hidden rounded-full bg-slate-800">
                <div className={`h-full ${hop.color}`} style={{ width: `${(hop.ms / total) * 100}%` }} />
              </div>
              <p className="mt-1.5 text-[11px] text-slate-500">{hop.detail}</p>
            </div>
          ))}
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-3">
          <Stat label="Total load time" value={ms(total)} tone="text-emerald-400" hint="sum of every hop" />
          <Stat label="No cache, no CDN" value={ms(baseline)} hint="the same request on a cold, distant origin" />
          <Stat label={saved > 0 ? `Saved ${saved}%` : 'No savings'} value={`${Math.round(baseline - total)} ms`} hint="caching and edges, measured" />
        </div>

        <div className="mt-4">
          <Callout tone={total > 1000 ? 'warn' : 'info'}>
            {total > 1000
              ? 'Over one second: most of it is round trips, not CPU. Move the data closer (CDN, read replica) before optimising code.'
              : 'Under one second. Notice how the same page drops from seconds to a few hundred ms just by caching DNS and serving assets from the edge.'}
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

// ── 2. Load balancer ────────────────────────────────────────────────────────
const seededRandom = (seed) => {
  let value = seed;
  return () => {
    value = (value * 1664525 + 1013904223) % 4294967296;
    return value / 4294967296;
  };
};

const SERVER_NAMES = ['srv-a', 'srv-b', 'srv-c', 'srv-d'];
const MODES = [
  { id: 'round-robin', label: 'Round robin' },
  { id: 'least-conn', label: 'Least connections' },
  { id: 'hash', label: 'Consistent hash' },
];
const MODE_SHORT = { 'round-robin': 'Round robin', 'least-conn': 'Least conns', hash: 'Hashing' };

const LB_CAMERAS = [
  { id: 'wide', label: 'Wide shot', cx: 450, cy: 210, zoom: 1 },
  { id: 'balancer', label: 'Balancer', cx: 320, cy: 210, zoom: 2.2 },
  { id: 'servers', label: 'Server pool', cx: 590, cy: 210, zoom: 1.75 },
  { id: 'database', label: 'Database', cx: 790, cy: 220, zoom: 2.1 },
];

export const LoadBalancerSim = () => {
  const [mode, setMode] = useState('round-robin');
  const [down, setDown] = useState([false, false, false, false]);
  const [seed, setSeed] = useState(7);
  const [requests, setRequests] = useState(60);
  const [counts, setCounts] = useState([15, 15, 15, 15]);

  const simulate = (nextMode = mode, nextDown = down, nextSeed = seed, nextRequests = requests) => {
    const random = seededRandom(nextSeed + 1);
    const up = SERVER_NAMES.map((_, index) => index).filter((index) => !nextDown[index]);
    if (up.length === 0) {
      setCounts([0, 0, 0, 0]);
      return;
    }
    const result = [0, 0, 0, 0];
    let cursor = 0;
    for (let request = 0; request < nextRequests; request += 1) {
      let index;
      if (nextMode === 'round-robin') {
        index = up[cursor % up.length];
        cursor += 1;
      } else if (nextMode === 'least-conn') {
        index = up.reduce((best, candidate) => (result[candidate] < result[best] ? candidate : best), up[0]);
      } else {
        const hash = Math.floor(random() * 997);
        index = up[hash % up.length];
      }
      result[index] += 1;
    }
    setCounts(result);
  };

  const changeMode = (nextMode) => {
    setMode(nextMode);
    simulate(nextMode, down, seed, requests);
  };

  const changeRequests = (nextRequests) => {
    setRequests(nextRequests);
    simulate(mode, down, seed, nextRequests);
  };

  const toggleServer = (index) => {
    const nextDown = down.map((value, position) => (position === index ? !value : value));
    setDown(nextDown);
    simulate(mode, nextDown, seed, requests);
  };

  const reroll = () => {
    const nextSeed = seed + 13;
    setSeed(nextSeed);
    simulate(mode, down, nextSeed, requests);
  };

  const total = counts.reduce((sum, value) => sum + value, 0);
  const max = Math.max(...counts);
  const min = Math.min(...counts.filter((_, index) => !down[index]));
  const skew = total === 0 ? 0 : Math.round(((max - (Number.isFinite(min) ? min : max)) / max) * 100);
  const healthy = down.filter((value) => !value).length;

  const modeDetail =
    mode === 'round-robin'
      ? 'Requests go to servers in order: a, b, c, d, then back to a. Each healthy server gets roughly 25%, but one slow request still sits on the next server in line.'
      : mode === 'least-conn'
        ? 'The balancer sends each request to the server with the fewest requests in flight, so a slow server naturally receives less new work while its queue drains.'
        : 'A hash of the user or key picks the server. The same key always lands in the same place, which makes per-server caching effective.';

  const modeSimple =
    mode === 'round-robin'
      ? 'Like a teacher handing worksheets to rows of students, one by one.'
      : mode === 'least-conn'
        ? 'Like a shopkeeper calling the next customer to the shortest queue.'
        : 'Like every student always using the same locker, so their books are where they expect.';

  const steps = useMemo(
    () => [
      {
        title: 'Requests arrive',
        meta: `${total}`,
        camera: 'wide',
        focus: { cx: 210, cy: 210, w: 380, h: 180 },
        simple: 'Many browsers ask for pages at the same time. One server would quickly run out of hands, so a helper stands in front.',
        detail: `${total} requests arrive in this run, aimed at ${healthy} healthy server${healthy === 1 ? '' : 's'}.`,
        watch: 'Every click, image and API call is a separate request.',
      },
      {
        title: 'Balancer chooses',
        meta: MODE_SHORT[mode],
        camera: 'balancer',
        focus: { cx: 312, cy: 210, w: 180, h: 130 },
        simple: modeSimple,
        detail: modeDetail,
        watch:
          mode === 'hash'
            ? 'Hashing is sticky: the same key keeps hitting the same server.'
            : 'The balancer is a traffic policeman — it never serves the page itself.',
      },
      {
        title: 'Server answers',
        meta: `${max}`,
        camera: 'servers',
        focus: { cx: 500, cy: 210, w: 200, h: 290 },
        simple: 'The chosen server does the work and sends the answer straight back to the browser. The balancer is not in the return path.',
        detail: `The busiest server handles ${max} of ${total} requests (${total ? Math.round((max / total) * 100) : 0}%). Imbalance is ${skew}%; anything above 20% means one machine will age faster than the rest.`,
        watch: mode === 'round-robin' ? 'Round robin keeps the counts even — but not the queue lengths.' : 'Least connections keeps the queue lengths even.',
      },
      {
        title: 'One server fails',
        camera: 'servers',
        focus: { cx: 500, cy: 210, w: 200, h: 290 },
        simple: 'Click any server card in the picture to switch it off. Its lights turn red and the balancer stops sending it work.',
        detail: 'Health checks are short requests (“are you alive?”) every few seconds. A server that misses several checks is removed from the pool automatically, and its share moves to the survivors.',
        watch: down.some(Boolean) ? `${down.filter(Boolean).length} server is down right now — click it to bring it back.` : 'Try clicking srv-b inside the picture.',
      },
      {
        title: 'Why strategy matters',
        camera: 'servers',
        focus: { cx: 500, cy: 210, w: 200, h: 290 },
        simple: 'The strategy decides whether work is shared fairly, whether caches help, and what happens when a machine dies.',
        detail: 'Round robin is simple but ignores how long each request takes. Least connections self-corrects. Hashing pins a key to a server — great for caches, but a failed server remaps its keys (real systems use virtual nodes and replicas).',
        watch: 'No strategy fixes a slow endpoint; it only spreads the pain.',
      },
      {
        title: 'The shared database',
        camera: 'database',
        focus: { cx: 765, cy: 210, w: 180, h: 130 },
        simple: 'All four servers read and write the same database. Adding servers adds brains, not memory.',
        detail: 'Once the database is saturated, every extra app server just waits in the same queue. That is when you add a read replica, a cache, or split the data — not another web server.',
        watch: 'Scale the tier that is actually the bottleneck.',
      },
    ],
    [total, healthy, mode, modeSimple, modeDetail, max, skew, down],
  );

  const renderScene = (active) => (
    <g>
      <Node x={24} y={168} w={150} h={84} kind="user" label="Users" sub={`${total} requests`} tone={TONE.blue} active={active === 0} />
      <Node x={228} y={168} w={168} h={84} kind="balancer" label="Load balancer" sub={MODE_SHORT[mode]} tone={TONE.cyan} active={active === 1} />
      <Wire d="M174 210 H228" tone={TONE.cyan} active={active === 0 || active === 1} />
      <Flow d="M174 210 H228" tone={TONE.cyan} count={3} dur={1.8} />

      {SERVER_NAMES.map((name, index) => {
        const y = 64 + index * 76;
        const share = total ? Math.round((counts[index] / total) * 100) : 0;
        const tone = down[index] ? TONE.red : TONE.green;
        const cy = y + 32;
        return (
          <g key={name}>
            <Wire d={`M396 210 C436 210, 436 ${cy}, 470 ${cy}`} tone={tone} active={active === 1 || active === 2 || active === 3} />
            <Flow d={`M396 210 C436 210, 436 ${cy}, 470 ${cy}`} tone={tone} count={1} dur={2.1} size={2.4} />
            <Node
              x={470}
              y={y}
              w={180}
              h={64}
              kind="server"
              label={name}
              sub={down[index] ? 'offline · 0 req' : `${counts[index]} req · ${share}%`}
              tone={tone}
              dim={down[index]}
              bar={down[index] ? undefined : share}
              active={active === 2 || active === 3}
              onClick={() => toggleServer(index)}
            />
            <Wire d={`M650 ${cy} C680 ${cy}, 680 210, 708 210`} dashed />
          </g>
        );
      })}

      <Node x={708} y={168} w={168} h={84} kind="database" label="Database" sub="shared by all servers" tone={TONE.violet} active={active === 5} />
      <Wire d="M650 210 H708" tone={TONE.violet} active={active === 5} dashed />

      <Tag x={560} y={402} text="click a server to fail or restore it" tone={TONE.amber} />
      <Note x={24} y={402} text={`${healthy} of 4 healthy · ${total} routed`} />
    </g>
  );

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Pick a strategy, knock a server out, and watch where the traffic lands.">
          Traffic distribution across 4 servers
        </SectionTitle>

        <div className="flex flex-wrap gap-2">
          {MODES.map((item) => (
            <Toggle key={item.id} active={mode === item.id} onClick={() => changeMode(item.id)}>
              {item.label}
            </Toggle>
          ))}
          <button
            type="button"
            onClick={reroll}
            className="rounded-full border border-slate-700 px-3 py-1.5 text-[11px] font-semibold text-slate-300 hover:text-white"
          >
            New request mix
          </button>
        </div>

        <div className="mt-4">
          <Range label="Requests to send" value={requests} min={20} max={400} step={20} onChange={changeRequests} format={(v) => `${v} requests`} />
        </div>

        <ProcessScene
          cameras={LB_CAMERAS}
          steps={steps}
          ariaLabel="Users sending requests into a load balancer that spreads them across four servers backed by one database"
          note="The scene is live: click a server to take it down, and watch the remaining servers take its share."
          render={renderScene}
        />

        <div className="mt-4 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          {SERVER_NAMES.map((name, index) => {
            const count = counts[index];
            const share = total ? Math.round((count / total) * 100) : 0;
            return (
              <button
                key={name}
                type="button"
                onClick={() => toggleServer(index)}
                className={`rounded-xl border p-3.5 text-left transition ${
                  down[index] ? 'border-red-500/40 bg-red-500/5' : 'border-slate-800 bg-navy-950 hover:border-slate-600'
                }`}
                title={down[index] ? 'Click to bring this server back' : 'Click to take this server down'}
              >
                <div className="flex items-center justify-between">
                  <span className="font-mono text-xs font-semibold text-white">{name}</span>
                  <span className={`text-[10px] font-semibold uppercase ${down[index] ? 'text-red-300' : 'text-emerald-300'}`}>
                    {down[index] ? 'down' : 'healthy'}
                  </span>
                </div>
                <div className="mt-2 font-mono text-lg font-bold text-white">{count}</div>
                <div className="mt-1.5 h-1.5 overflow-hidden rounded-full bg-slate-800">
                  <div
                    className={`h-full transition-all duration-300 ${down[index] ? 'bg-red-500' : 'bg-emerald-500'}`}
                    style={{ width: `${share}%` }}
                  />
                </div>
                <div className="mt-1 text-[11px] text-slate-500">{share}% of traffic</div>
              </button>
            );
          })}
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-3">
          <Stat label="Requests routed" value={total} hint={`${healthy} of 4 servers healthy`} />
          <Stat label="Worst-server share" value={`${total ? Math.round((max / total) * 100) : 0}%`} hint="ideal is 25% with four servers" />
          <Stat
            label="Imbalance"
            value={total ? `${skew}%` : '—'}
            tone={skew > 20 ? 'text-amber-300' : 'text-emerald-400'}
            hint="difference between busiest and quietest"
          />
        </div>

        <div className="mt-4">
          <Callout tone={mode === 'hash' && down.some(Boolean) ? 'warn' : 'info'}>
            {mode === 'round-robin'
              ? 'Round robin ignores how long a request takes, so one slow endpoint still piles up on whichever server it hits next.'
              : mode === 'least-conn'
                ? 'Least connections is self-correcting: slow servers naturally receive less new traffic while their queue drains.'
                : down.some(Boolean)
                  ? 'With consistent hashing a failed server’s keys have to move — real systems use virtual nodes and a replication factor so only a slice of keys remaps.'
                  : 'Consistent hashing pins each key to one server, which makes caching effective. Take a server down to see the distribution wobble.'}
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

// ── 3. Cache simulator ──────────────────────────────────────────────────────
const CACHE_CAMERAS = [
  { id: 'wide', label: 'Wide shot', cx: 450, cy: 210, zoom: 1 },
  { id: 'cache', label: 'Cache close-up', cx: 405, cy: 200, zoom: 2.2 },
  { id: 'database', label: 'Database', cx: 785, cy: 230, zoom: 2.1 },
];

export const CacheSimulator = () => {
  const [cacheSize, setCacheSize] = useState(600);
  const [ttl, setTtl] = useState(60);
  const [hotShare, setHotShare] = useState(70);
  const [rps, setRps] = useState(200);
  const [dbMs, setDbMs] = useState(45);
  const [seed, setSeed] = useState(3);

  const result = useMemo(() => {
    return simulateCache({
      cacheSize,
      ttl,
      hotShare,
      rps,
      dbMs,
      random: seededRandom(seed * 31 + cacheSize + Math.round(ttl) + hotShare),
    });
  }, [cacheSize, ttl, hotShare, rps, dbMs, seed]);

  const steps = useMemo(
    () => [
      {
        title: 'A request asks for data',
        meta: `${rps} req/s`,
        camera: 'wide',
        focus: { cx: 272, cy: 205, w: 520, h: 160 },
        simple: 'The app needs one thing — say the profile of user 42. Finding it in the database is slow, so it first checks a small, fast shelf.',
        detail: `Requests arrive at ${rps}/s. The key could be a user id, a product id or a URL; whatever it is, the cache stores one value per key.`,
        watch: 'A cache never invents data — it can only return something it was given earlier.',
      },
      {
        title: 'Look on the fast shelf',
        meta: `${Math.round(result.hitRate * 100)}%`,
        camera: 'cache',
        focus: { cx: 405, cy: 196, w: 220, h: 130 },
        simple: 'The cache checks whether that exact key is already on the shelf and still fresh. Two outcomes are possible: hit or miss.',
        detail: `With this workload the cache answers ${result.hits} of ${result.requests} requests — a hit rate of ${Math.round(result.hitRate * 100)}%.`,
        watch: 'The hash of the key decides which slot it lands in; that is why lookup is instant.',
      },
      {
        title: 'HIT: answer in 2 ms',
        meta: '2 ms',
        camera: 'cache',
        focus: { cx: 405, cy: 210, w: 230, h: 150 },
        simple: 'The value is there and fresh, so it goes straight back. No database involved, no waiting.',
        detail: `Average latency is now ${ms(result.avgLatency)} — the hit path costs about 2 ms, while every miss costs the full ${dbMs} ms database query.`,
        watch: `Saved: ${ms(result.noCacheLatency - result.avgLatency)} on every request, on average.`,
      },
      {
        title: 'MISS: ask the database',
        meta: `${result.misses}`,
        camera: 'database',
        focus: { cx: 785, cy: 210, w: 180, h: 130 },
        simple: 'The shelf is empty or the copy is stale, so the app asks the real database — and puts a copy on the shelf for next time.',
        detail: `${result.misses} misses in this run. The database now serves ${result.dbQueriesPerSecond} queries/s instead of ${rps}/s — that reduction is the real reason caches exist.`,
        watch: 'A cache protects the database, not just the page load time.',
      },
      {
        title: 'TTL: copies expire',
        meta: ttl === 0 ? 'never' : `${ttl} s`,
        camera: 'cache',
        focus: { cx: 405, cy: 196, w: 220, h: 130 },
        simple: 'A copy has a “best before” time (TTL). After that the cache refuses to serve it, so the next request must fetch a fresh copy.',
        detail: ttl < 15 && ttl > 0
          ? `A ${ttl} s TTL is shorter than the reuse gap, so entries expire before they pay for themselves — the hit rate collapses and the database sees almost every request.`
          : 'TTL is the trade-off between freshness and load: long TTLs protect the database but may serve stale data; short TTLs stay fresh but hammer it.',
        watch: ttl === 0 ? 'TTL 0 means “no expiry” here — only eviction removes entries.' : `Every entry dies ${ttl} s after it was stored.`,
      },
      {
        title: 'Capacity and eviction',
        meta: `${cacheSize}`,
        camera: 'cache',
        focus: { cx: 405, cy: 196, w: 220, h: 130 },
        simple: 'The shelf has finite slots. When it is full, the least recently used item is removed to make room. Bigger is not always better — past the working set you are just paying for RAM.',
        detail: `Capacity ${cacheSize} entries ≈ ${result.memoryMb.toFixed(2)} MB at ~120 bytes each. The hot ${hotShare}% of traffic lands on only 20 keys, so those stay cached while cold keys keep getting evicted.`,
        watch: 'Measure the working set before buying memory.',
      },
    ],
    [rps, result, dbMs, ttl, cacheSize, hotShare],
  );

  const renderScene = (active) => (
    <g>
      <Node x={24} y={168} w={150} h={84} kind="laptop" label="App" sub="asks for a key" tone={TONE.blue} active={active === 0} />
      <Node
        x={300}
        y={140}
        w={210}
        h={112}
        kind="cache"
        label="Cache"
        sub={`${result.hits} hits · ${result.misses} misses`}
        tone={TONE.green}
        value={`${Math.round(result.hitRate * 100)}%`}
        active={active === 1 || active === 2 || active === 4 || active === 5}
      >
        {Array.from({ length: 7 }, (_, index) => (
          <rect
            key={index}
            x={16 + index * 26}
            y={80}
            width="20"
            height="12"
            rx="3"
            fill={index < Math.round((result.hitRate * 7)) ? TONE.green : '#1e293b'}
            fillOpacity={index < Math.round((result.hitRate * 7)) ? 0.55 : 1}
            stroke="#26364d"
            strokeWidth="0.8"
          />
        ))}
      </Node>

      <Wire d="M174 190 H300" tone={TONE.blue} active={active === 0 || active === 1} />
      <Flow d="M174 190 H300" tone={TONE.blue} count={2} dur={1.9} size={2.6} />
      <Tag x={237} y={174} text="get key 42" tone={TONE.blue} />

      <Wire d="M300 240 H174" tone={TONE.green} active={active === 2} />
      <Flow d="M300 240 H174" tone={TONE.green} count={2} dur={1.6} size={2.6} />
      <Tag x={237} y={262} text={`HIT · 2 ms`} tone={TONE.green} />

      <Node x={700} y={168} w={170} h={84} kind="database" label="Database" sub={`${result.dbQueriesPerSecond} q/s now`} tone={TONE.violet} active={active === 3} />
      <Wire d="M510 222 H700" tone={TONE.red} active={active === 3} dashed />
      <Flow d="M510 222 H700" tone={TONE.red} count={2} dur={2.4} size={2.6} />
      <Tag x={605} y={204} text={active === 3 ? `${dbMs} ms query` : 'MISS → fetch'} tone={TONE.amber} />
      <Wire d="M700 242 C640 292, 570 292, 510 242" tone={TONE.green} active={active === 3} dashed />
      <Tag x={605} y={316} text="copy stored on the shelf" tone={TONE.green} />

      <Note x={24} y={402} text={`${result.requests} requests simulated · ${Math.round(result.hitRate * 100)}% answered without the database`} />
    </g>
  );

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="600 requests simulated with a realistic hot-key skew; every miss goes to the database.">
          What a cache actually buys you
        </SectionTitle>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          <Range label="Cache capacity" value={cacheSize} min={20} max={2000} step={20} onChange={setCacheSize} format={(v) => `${v} entries`} />
          <Range label="TTL" value={ttl} min={0} max={300} step={5} onChange={setTtl} format={(v) => (v === 0 ? 'no expiry' : `${v} s`)} />
          <Range label="Hot-key traffic share" value={hotShare} min={0} max={95} step={5} onChange={setHotShare} format={(v) => `${v}%`} />
          <Range label="Incoming requests" value={rps} min={10} max={1000} step={10} onChange={setRps} format={(v) => `${v} req/s`} />
          <Range label="Database query time" value={dbMs} min={1} max={500} step={1} onChange={setDbMs} format={ms} />
        </div>

        <ProcessScene
          cameras={CACHE_CAMERAS}
          steps={steps}
          ariaLabel="An app checking a cache, falling back to the database on a miss, and returning a hit in two milliseconds"
          note="Step through the hit and miss paths; the camera follows the part that does the work."
          render={renderScene}
        />

        <div className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <Stat label="Hit rate" value={`${Math.round(result.hitRate * 100)}%`} tone="text-emerald-400" hint={`${result.hits} hits, ${result.misses} misses`} />
          <Stat label="Average latency" value={ms(result.avgLatency)} hint={`versus ${ms(result.noCacheLatency)} without a cache`} />
          <Stat label="Database load" value={`${result.dbQueriesPerSecond} q/s`} hint={`down from ${rps} q/s`} />
          <Stat label="Cache memory" value={`${(result.memoryMb).toFixed(2)} MB`} hint="roughly 120 bytes per entry" />
        </div>

        <div className="mt-5">
          <p className="mb-2 text-[11px] uppercase tracking-wider text-slate-500">Hit ratio as the run progresses</p>
          <div className="flex h-24 items-end gap-1">
            {result.timeline.map((point, index) => {
              const share = (point.hits / ((index + 1) * 100)) * 100;
              return (
                <div key={index} className="flex-1">
                  <div className="w-full rounded-t bg-emerald-500/80" style={{ height: `${Math.max(3, share)}%` }} />
                </div>
              );
            })}
          </div>
          <div className="mt-1 flex justify-between text-[10px] text-slate-500">
            <span>first 100 requests</span>
            <span>{result.requests} requests</span>
          </div>
        </div>

        <div className="mt-4 flex flex-wrap items-center gap-2">
          <button
            type="button"
            onClick={() => setSeed(seed + 7)}
            className="rounded-full border border-slate-700 px-3 py-1.5 text-[11px] font-semibold text-slate-300 hover:text-white"
          >
            Run with a different workload
          </button>
          <span className="text-[11px] text-slate-500">Same settings give the same result, so you can compare fairly.</span>
        </div>

        <div className="mt-4">
          <Callout tone={ttl > 0 && ttl < 15 ? 'warn' : 'info'}>
            {ttl > 0 && ttl < 15
              ? 'A very short TTL turns a cache into a database amplifier: entries expire before they are reused, so the hit rate collapses.'
              : 'Notice how capacity stops helping past the working set, while the hot-key share dominates the hit rate. That is why production caches track the top 20% of keys.'}
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

// ── 4. Token bucket rate limiter ────────────────────────────────────────────
const LIMITER_CAMERAS = [
  { id: 'wide', label: 'Wide shot', cx: 450, cy: 210, zoom: 1 },
  { id: 'bucket', label: 'Bucket', cx: 385, cy: 200, zoom: 2.2 },
  { id: 'api', label: 'API + 429s', cx: 775, cy: 220, zoom: 2.0 },
];

export const RateLimiterSim = () => {
  const [capacity, setCapacity] = useState(20);
  const [refill, setRefill] = useState(10);
  const [incoming, setIncoming] = useState(30);
  const [seconds, setSeconds] = useState(8);

  const stepsData = useMemo(() => {
    let tokens = capacity;
    const rows = [];
    for (let second = 1; second <= seconds; second += 1) {
      tokens = Math.min(capacity, tokens + refill);
      const allowed = Math.min(tokens, incoming);
      tokens -= allowed;
      rows.push({ second, allowed, rejected: incoming - allowed, tokensLeft: Math.round(tokens) });
    }
    const allowedTotal = rows.reduce((sum, row) => sum + row.allowed, 0);
    const rejectedTotal = rows.reduce((sum, row) => sum + row.rejected, 0);
    return { rows, allowedTotal, rejectedTotal };
  }, [capacity, refill, incoming, seconds]);

  const successRate = Math.round((stepsData.allowedTotal / Math.max(1, stepsData.allowedTotal + stepsData.rejectedTotal)) * 100);
  const steadyState = Math.min(refill, incoming);

  const steps = useMemo(
    () => [
      {
        title: 'A request knocks',
        meta: `${incoming}/s`,
        camera: 'wide',
        focus: { cx: 200, cy: 210, w: 420, h: 190 },
        simple: 'A user (or a script) sends requests faster than the server wants to handle them. The bucket is the gate that decides who gets through.',
        detail: `${incoming} requests arrive every second. Without a limiter, a single misbehaving client can use all the server’s capacity and slow everyone else down.`,
        watch: 'Rate limiting is about fairness and protection, not punishment.',
      },
      {
        title: 'Is there a token?',
        meta: `${capacity}`,
        camera: 'bucket',
        focus: { cx: 382, cy: 200, w: 200, h: 130 },
        simple: 'Every request must pick up one token from the bucket to pass. The bucket holds at most its size — that is the burst a client may send.',
        detail: `The bucket starts with ${capacity} tokens and refills at ${refill}/s. A token is taken only when the request is actually forwarded; rejected requests do not consume one.`,
        watch: `Burst allowance: ${capacity} requests. Sustained rate: ${refill}/s.`,
      },
      {
        title: 'Yes: 200 OK',
        meta: `${stepsData.allowedTotal}`,
        camera: 'api',
        focus: { cx: 660, cy: 176, w: 430, h: 130 },
        simple: 'A token is removed and the request goes to the API. Normal users see nothing different — the page just works.',
        detail: `${stepsData.allowedTotal} requests passed in this ${seconds} s window (${successRate}%). After the first burst the bucket settles at ${steadyState}/s, because that is all the refill it gets.`,
        watch: 'The API sees a smooth stream even when clients send bursts.',
      },
      {
        title: 'No: 429 Too Many Requests',
        meta: `${stepsData.rejectedTotal}`,
        camera: 'api',
        focus: { cx: 640, cy: 280, w: 470, h: 150 },
        simple: 'The bucket is empty, so the gate stays shut for that request. The client is told to wait and try again later.',
        detail: `${stepsData.rejectedTotal} requests were rejected with HTTP 429 and a Retry-After header. A good client waits that long (plus a little random jitter) instead of retrying in a tight loop.`,
        watch: 'Without jitter, all rejected clients retry at the same moment and create a second burst.',
      },
      {
        title: 'Refill adds tokens',
        meta: `${refill}/s`,
        camera: 'bucket',
        focus: { cx: 382, cy: 200, w: 200, h: 130 },
        simple: 'Every second, new tokens appear at a fixed speed — like a tap dripping into the bucket. It never fills past its size.',
        detail: `Refill is ${refill} tokens/s and the bucket caps at ${capacity}. If traffic stays above refill (${incoming} > ${refill}), the extra requests are rejected forever, by design.`,
        watch: incoming > refill ? 'Traffic is above the contract, so the steady state is throttled.' : 'Refill covers all traffic, so only the initial burst was limited.',
      },
      {
        title: 'Tune burst vs sustained',
        meta: `${capacity} / ${refill}`,
        camera: 'wide',
        simple: 'Bucket size decides how big a burst you allow; refill rate decides how much traffic the API promises to handle all day.',
        detail: `With bucket ${capacity} and refill ${refill}/s, a client may send ${capacity} at once but averages ${refill}/s over time. Pick the bucket for the burst you expect at page load, and the refill for the capacity you actually have.`,
        watch: 'A bigger bucket does not add capacity — it only lends capacity for a moment.',
      },
    ],
    [incoming, capacity, refill, seconds, stepsData, successRate, steadyState],
  );

  const tokenDots = Math.round((capacity / 120) * 8);
  const renderScene = (active) => (
    <g>
      <Node x={24} y={168} w={150} h={84} kind="user" label="Clients" sub={`${incoming} req/s`} tone={TONE.blue} active={active === 0} />
      <Wire d="M174 210 H282" tone={TONE.amber} active={active === 0 || active === 1} />
      <Flow d="M174 210 H282" tone={TONE.amber} count={3} dur={1.7} size={2.6} />
      <Tag x={228} y={178} text={`${incoming}/s`} tone={TONE.amber} />

      <Node x={282} y={128} w={200} h={128} kind="bucket" label="Token bucket" sub={`${refill}/s refill`} tone={TONE.amber} value={`${capacity}`} active={active === 1 || active === 4 || active === 5}>
        {Array.from({ length: 8 }, (_, index) => (
          <circle
            key={index}
            cx={22 + index * 22}
            cy="96"
            r="4"
            fill={index < tokenDots ? TONE.amber : '#1e293b'}
            fillOpacity={index < tokenDots ? 0.85 : 1}
          />
        ))}
      </Node>

      <Wire d="M482 186 H700" tone={TONE.green} active={active === 1 || active === 2} />
      <Flow d="M482 186 H700" tone={TONE.green} count={3} dur={1.9} size={2.6} />
      <Tag x={590} y={168} text="token taken → allowed" tone={TONE.green} />

      <Node x={700} y={112} w={170} h={84} kind="server" label="API server" sub={`${stepsData.allowedTotal} passed`} tone={TONE.green} active={active === 2} />
      <Node x={700} y={258} w={170} h={84} kind="shield" label="Rejected" sub={`${stepsData.rejectedTotal} × 429`} tone={TONE.red} active={active === 3} />

      <Wire d="M482 240 C560 300, 620 300, 700 300" tone={TONE.red} active={active === 3} dashed />
      <Flow d="M482 240 C560 300, 620 300, 700 300" tone={TONE.red} count={2} dur={2.2} size={2.4} />
      <Tag x={580} y={332} text="bucket empty" tone={TONE.red} />

      <Note x={24} y={402} text={`${stepsData.allowedTotal} allowed · ${stepsData.rejectedTotal} rejected · ${successRate}% success`} />
      {incoming > refill && <Tag x={590} y={392} text="sustained traffic above refill" tone={TONE.amber} />}
    </g>
  );

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="A bucket holds burst capacity and refills at a fixed rate — the standard API limiter.">
          Token bucket in action
        </SectionTitle>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <Range label="Bucket size" value={capacity} min={1} max={120} step={1} onChange={setCapacity} format={(v) => `${v} tokens`} />
          <Range label="Refill rate" value={refill} min={1} max={60} onChange={setRefill} format={(v) => `${v}/s`} />
          <Range label="Incoming traffic" value={incoming} min={1} max={100} onChange={setIncoming} format={(v) => `${v} req/s`} />
          <Range label="Observation window" value={seconds} min={4} max={20} onChange={setSeconds} format={(v) => `${v} s`} />
        </div>

        <ProcessScene
          cameras={LIMITER_CAMERAS}
          steps={steps}
          ariaLabel="Requests arriving at a token bucket that either forwards them to the API server or rejects them with 429"
          note="Follow one request at a time: the bucket, the allowed path, and the rejected path all have their own camera."
          render={renderScene}
        />

        <div className="mt-5 space-y-2">
          {stepsData.rows.map((row) => (
            <div key={row.second} className="flex items-center gap-3">
              <span className="w-10 font-mono text-[11px] text-slate-500">{row.second}s</span>
              <div className="flex h-5 flex-1 overflow-hidden rounded bg-slate-800">
                <div className="flex items-center justify-end bg-emerald-500/80 pr-1 text-[10px] font-semibold text-black" style={{ width: `${(row.allowed / Math.max(1, incoming)) * 100}%` }}>
                  {row.allowed > 0 ? row.allowed : ''}
                </div>
                <div className="flex items-center justify-end bg-red-500/70 pr-1 text-[10px] font-semibold text-black" style={{ width: `${(row.rejected / Math.max(1, incoming)) * 100}%` }}>
                  {row.rejected > 0 ? row.rejected : ''}
                </div>
              </div>
              <span className="w-16 text-right font-mono text-[10px] text-slate-500">{row.tokensLeft} left</span>
            </div>
          ))}
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-3">
          <Stat label="Allowed" value={stepsData.allowedTotal} tone="text-emerald-400" hint="returned 200" />
          <Stat label="Rejected" value={stepsData.rejectedTotal} tone="text-red-300" hint="returned 429, with Retry-After" />
          <Stat label="Steady-state rate" value={`${steadyState}/s`} hint={incoming > refill ? 'traffic exceeds refill, so the extra is throttled' : 'refill covers the traffic'} />
        </div>

        <div className="mt-4">
          <Callout tone={incoming > refill ? 'warn' : 'ok'}>
            {incoming > refill
              ? `The bucket absorbs the first burst, then settles at ${refill}/s. Allowing ${stepsData.allowedTotal} requests or ${successRate}% means your client must back off and retry with jitter — a limiter is not an outage.`
              : `Refill (${refill}/s) covers the traffic (${incoming}/s), so after the initial burst everything passes. Size the bucket for the burst you want to allow, and the refill rate for the sustained contract.`}
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

// ── 5. Capacity estimator ───────────────────────────────────────────────────
const CAPACITY_CAMERAS = [
  { id: 'wide', label: 'Wide shot', cx: 450, cy: 210, zoom: 1 },
  { id: 'users', label: 'Users → QPS', cx: 100, cy: 210, zoom: 2.4 },
  { id: 'fleet', label: 'Server fleet', cx: 505, cy: 210, zoom: 1.75 },
  { id: 'storage', label: 'Cache + storage', cx: 750, cy: 300, zoom: 2.0 },
];

export const CapacityEstimator = () => {
  const [dau, setDau] = useState(100000);
  const [requestsPerUser, setRequestsPerUser] = useState(50);
  const [peakMultiplier, setPeakMultiplier] = useState(3);
  const [serverCapacity, setServerCapacity] = useState(500);
  const [payloadKb, setPayloadKb] = useState(20);
  const [newRecords, setNewRecords] = useState(2);
  const [recordKb, setRecordKb] = useState(5);
  const [replicas, setReplicas] = useState(3);
  const [retentionDays, setRetentionDays] = useState(365);
  const [cacheHit, setCacheHit] = useState(85);

  const values = useMemo(() => {
    const totalRequests = dau * requestsPerUser;
    const avgQps = totalRequests / 86400;
    const peakQps = avgQps * peakMultiplier;
    const servers = Math.ceil(peakQps / Math.max(1, serverCapacity));
    const egressGbPerDay = (totalRequests * (1 - cacheHit / 100) * payloadKb) / 1024 / 1024;
    const storageGbPerDay = (dau * newRecords * recordKb * replicas) / 1024 / 1024;
    const storageTotalGb = storageGbPerDay * retentionDays;
    const workingSetGb = (peakQps * 60 * 30 * payloadKb) / 1024 / 1024; // ~30 min of peak responses
    return { avgQps, peakQps, servers, egressGbPerDay, storageGbPerDay, storageTotalGb, workingSetGb, totalRequests };
  }, [dau, requestsPerUser, peakMultiplier, serverCapacity, payloadKb, newRecords, recordKb, replicas, retentionDays, cacheHit]);

  const tb = (gb) => (gb >= 1024 ? `${(gb / 1024).toFixed(2)} TB` : `${gb.toFixed(1)} GB`);

  const steps = useMemo(
    () => [
      {
        title: 'Start with people',
        meta: `${dau.toLocaleString()}`,
        camera: 'users',
        focus: { cx: 95, cy: 210, w: 180, h: 130 },
        simple: 'First count the people who use the app in a day. Every other number is built from this one.',
        detail: `${dau.toLocaleString()} daily active users each make about ${requestsPerUser} requests — pages, images, API calls — for ${values.totalRequests.toLocaleString()} requests per day.`,
        watch: 'Daily active users, not registered users. Only active people create traffic.',
      },
      {
        title: 'Average requests/s',
        meta: `${values.avgQps.toFixed(0)}/s`,
        camera: 'users',
        focus: { cx: 95, cy: 210, w: 180, h: 130 },
        simple: 'Spread a day’s requests over 86,400 seconds. That is the average load — useful, but never the number you size a fleet for.',
        detail: `${values.totalRequests.toLocaleString()} requests ÷ 86,400 s = ${values.avgQps.toFixed(1)} requests/s. Most of the traffic happens in a few busy hours, so the average hides the peaks.`,
        watch: '1 million users × 10 requests/day ≈ 115 req/s average.',
      },
      {
        title: 'Peak is the real load',
        meta: `${values.peakQps.toFixed(0)}/s`,
        camera: 'fleet',
        focus: { cx: 470, cy: 210, w: 400, h: 300 },
        simple: 'At the busiest moment — lunch break, a match, a sale — traffic can be 2–4× the average. Machines must be ready for that moment.',
        detail: `${values.avgQps.toFixed(1)} × ${peakMultiplier} = ${values.peakQps.toFixed(1)} requests/s at peak. Size for this, then add headroom for deployments and one failed zone.`,
        watch: 'A fleet sized for the average collapses exactly when everyone arrives.',
      },
      {
        title: 'Count the servers',
        meta: `${values.servers}`,
        camera: 'fleet',
        focus: { cx: 470, cy: 210, w: 400, h: 300 },
        simple: 'Draw a box for each server that can answer 500 requests a second. The peak decides how many boxes you need.',
        detail: `${values.peakQps.toFixed(0)} peak req/s ÷ ${serverCapacity} per server = ${values.servers} server${values.servers === 1 ? '' : 's'} before redundancy. Add one per zone or keep automatic scaling as a safety net.`,
        watch: 'More servers only help if the database and cache keep up too.',
      },
      {
        title: 'Cache and egress',
        meta: `${cacheHit}%`,
        camera: 'storage',
        focus: { cx: 620, cy: 200, w: 460, h: 260 },
        simple: 'The cache answers most reads, so only the leftovers travel from the database to the user. That saves money on bandwidth — the “egress” line on a cloud bill.',
        detail: `At a ${cacheHit}% hit rate, egress is about ${tb(values.egressGbPerDay)}/day (${tb(values.egressGbPerDay * 30)}/month). The cache needs about ${tb(values.workingSetGb)} of memory to hold roughly 30 minutes of peak responses.`,
        watch: 'Egress grows with users but barely shrinks — it is the quiet bill.',
      },
      {
        title: 'Storage grows daily',
        meta: tb(values.storageGbPerDay),
        camera: 'storage',
        focus: { cx: 750, cy: 300, w: 200, h: 130 },
        simple: 'Every new record is stored, copied for safety, and kept for months. A small daily number becomes a very large yearly number.',
        detail: `${newRecords} records × ${recordKb} KB × ${replicas} copies × ${dau.toLocaleString()} users = ${tb(values.storageGbPerDay)}/day. Kept for ${retentionDays} days that is ${tb(values.storageTotalGb)}.`,
        watch: 'Retention and replication multiply storage; decide both before launch.',
      },
    ],
    [dau, requestsPerUser, values, peakMultiplier, serverCapacity, cacheHit, newRecords, recordKb, replicas, retentionDays],
  );

  const shown = Math.max(1, Math.min(5, values.servers));
  const stackHeight = shown * 54 + (shown - 1) * 10;
  const stackTop = 210 - stackHeight / 2;

  const renderScene = (active) => (
    <g>
      <Node x={20} y={168} w={150} h={84} kind="user" label="Users" sub={`${dau.toLocaleString()} per day`} tone={TONE.blue} active={active === 0 || active === 1} />
      <Node x={205} y={168} w={160} h={84} kind="balancer" label="Load balancer" sub={`${Math.round(values.peakQps)} peak QPS`} tone={TONE.cyan} active={active === 2} />
      <Wire d="M170 210 H205" tone={TONE.cyan} active={active <= 2} />
      <Flow d="M170 210 H205" tone={TONE.cyan} count={2} dur={1.8} size={2.4} />

      {Array.from({ length: shown }, (_, index) => {
        const y = stackTop + index * 64;
        return (
          <g key={index}>
            <Wire d={`M365 210 C385 210, 385 ${y + 27}, 405 ${y + 27}`} tone={TONE.blue} active={active === 2 || active === 3} />
            <Node
              x={405}
              y={y}
              w={200}
              h={54}
              kind="server"
              label={`server ${index + 1}`}
              sub={`${serverCapacity.toLocaleString()} req/s`}
              tone={TONE.blue}
              active={active === 3}
            />
          </g>
        );
      })}
      {values.servers > shown && (
        <Tag x={505} y={stackTop + stackHeight + 18} text={`+${values.servers - shown} more servers`} tone={TONE.blue} />
      )}
      {values.servers === 1 && <Note x={405} y={stackTop + 78} text="one server + redundancy" />}

      <Node x={650} y={78} w={200} h={84} kind="cache" label="Cache" sub={`hit rate ${cacheHit}%`} tone={TONE.green} active={active === 4} />
      <Node x={650} y={258} w={200} h={92} kind="database" label="Storage" sub="grows every day" tone={TONE.violet} value={tb(values.storageTotalGb)} active={active === 5} />

      <Wire d="M605 210 C625 210, 625 120, 650 120" tone={TONE.green} active={active === 4} />
      <Flow d="M605 210 C625 210, 625 120, 650 120" tone={TONE.green} count={2} dur={2.2} size={2.4} />
      <Wire d="M750 162 V258" tone={TONE.violet} active={active === 5} />
      <Tag x={525} y={392} text={`${values.servers} servers · ${tb(values.egressGbPerDay)} egress/day`} tone={TONE.slate} />
      <Note x={20} y={402} text="back-of-the-envelope numbers, sized for peak" />
    </g>
  );

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="The back-of-the-envelope numbers interviewers ask for — in one screen.">
          Estimate a system from daily active users
        </SectionTitle>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          <Field label="Daily active users"><input type="number" min={1} className={inputClass} value={dau} onChange={(event) => setDau(Number(event.target.value) || 0)} /></Field>
          <Field label="Requests per user per day"><input type="number" min={1} className={inputClass} value={requestsPerUser} onChange={(event) => setRequestsPerUser(Number(event.target.value) || 0)} /></Field>
          <Field label="Peak multiplier" hint="Peak is usually 2–4× the daily average"><input type="number" min={1} step={0.5} className={inputClass} value={peakMultiplier} onChange={(event) => setPeakMultiplier(Number(event.target.value) || 1)} /></Field>
          <Field label="Requests one server handles" hint="Requests per second at acceptable latency"><input type="number" min={1} className={inputClass} value={serverCapacity} onChange={(event) => setServerCapacity(Number(event.target.value) || 1)} /></Field>
          <Field label="Average response size (KB)"><input type="number" min={1} className={inputClass} value={payloadKb} onChange={(event) => setPayloadKb(Number(event.target.value) || 0)} /></Field>
          <Field label="Cache hit rate (%)"><input type="number" min={0} max={99} className={inputClass} value={cacheHit} onChange={(event) => setCacheHit(Number(event.target.value) || 0)} /></Field>
          <Field label="New records per user per day"><input type="number" min={0} className={inputClass} value={newRecords} onChange={(event) => setNewRecords(Number(event.target.value) || 0)} /></Field>
          <Field label="Size of one record (KB)"><input type="number" min={0} className={inputClass} value={recordKb} onChange={(event) => setRecordKb(Number(event.target.value) || 0)} /></Field>
          <Field label="Replication factor"><input type="number" min={1} max={5} className={inputClass} value={replicas} onChange={(event) => setReplicas(Number(event.target.value) || 1)} /></Field>
          <Field label="Data retention (days)"><input type="number" min={1} className={inputClass} value={retentionDays} onChange={(event) => setRetentionDays(Number(event.target.value) || 1)} /></Field>
        </div>

        <ProcessScene
          cameras={CAPACITY_CAMERAS}
          steps={steps}
          ariaLabel="Daily active users flowing through a load balancer into a server fleet, a cache and long-term storage"
          note="Change any input and the numbers on the picture update; the guide follows the calculation in order."
          render={renderScene}
        />

        <div className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <Stat label="Average QPS" value={values.avgQps.toFixed(0)} hint={`${values.totalRequests.toLocaleString()} requests/day`} />
          <Stat label="Peak QPS" value={values.peakQps.toFixed(0)} tone="text-amber-300" hint="size your fleet for this, not the average" />
          <Stat label="App servers" value={values.servers} tone="text-emerald-400" hint="plus one for redundancy in each zone" />
          <Stat label="Egress per day" value={tb(values.egressGbPerDay)} hint="after the cache absorbs its share" />
          <Stat label="New storage per day" value={tb(values.storageGbPerDay)} hint={`${newRecords} records × ${recordKb} KB × ${replicas} copies`} />
          <Stat label="Total stored data" value={tb(values.storageTotalGb)} hint={`${retentionDays} days of retention`} />
          <Stat label="Cache working set" value={tb(values.workingSetGb)} hint="about 30 minutes of peak responses" />
          <Stat label="Monthly egress" value={tb(values.egressGbPerDay * 30)} hint="the line that surprises most teams on the bill" />
        </div>

        <div className="mt-4">
          <Callout>
            Rule of thumb: 1 million users × 10 requests a day is about 115 requests per second on average, so the peak is the number that decides your fleet. Add headroom for deploys and one zone failing, then check the storage and egress lines — those grow quietly and never shrink.
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

// ── 6. Quorum calculator ────────────────────────────────────────────────────
const PRESETS = [
  { label: 'Dynamo quorum', n: 3, r: 2, w: 2 },
  { label: 'Fast writes', n: 3, r: 3, w: 1 },
  { label: 'Fast reads', n: 3, r: 1, w: 3 },
  { label: 'Wide cluster', n: 5, r: 3, w: 3 },
];

export const QuorumCalculator = () => {
  const [n, setN] = useState(3);
  const [r, setR] = useState(2);
  const [w, setW] = useState(2);
  const [nodeMs, setNodeMs] = useState(12);

  const consistent = r + w > n;
  const writeFailures = n - w;
  const readFailures = n - r;
  const bothFailures = n - Math.max(r, w);
  const overlap = r + w - n;

  const positions = useMemo(() => {
    const rows = n <= 5 ? [n] : [5, n - 5];
    const cardW = 104;
    const gapX = 22;
    const y = rows.length === 1 ? 164 : 116;
    return rows.flatMap((count, rowIndex) => {
      const totalW = count * cardW + (count - 1) * gapX;
      const startX = 260 + (616 - totalW) / 2;
      const before = rows.slice(0, rowIndex).reduce((sum, value) => sum + value, 0);
      return Array.from({ length: count }, (_, col) => ({
        x: startX + col * (cardW + gapX),
        y: y + rowIndex * 148,
        w: cardW,
        h: 92,
        index: before + col,
      }));
    });
  }, [n]);

  const readSet = useMemo(() => new Set(Array.from({ length: Math.min(r, n) }, (_, index) => index)), [r, n]);
  const writeSet = useMemo(
    () => new Set(Array.from({ length: Math.min(w, n) }, (_, index) => n - Math.min(w, n) + index)),
    [w, n],
  );
  const overlapNodes = positions.filter((_, index) => readSet.has(index) && writeSet.has(index));

  // Camera box around the whole replica grid; it moves when N changes.
  const grid = useMemo(() => {
    const minX = Math.min(...positions.map((pos) => pos.x));
    const maxX = Math.max(...positions.map((pos) => pos.x + pos.w));
    const minY = Math.min(...positions.map((pos) => pos.y));
    const maxY = Math.max(...positions.map((pos) => pos.y + pos.h));
    return { cx: (minX + maxX) / 2, cy: (minY + maxY) / 2, w: maxX - minX, h: maxY - minY };
  }, [positions]);

  const cameras = useMemo(() => {
    const list = [
      { id: 'wide', label: 'Wide shot', cx: 450, cy: 210, zoom: 1 },
      { id: 'replicas', label: 'Replica set', cx: 560, cy: 210, zoom: 1.65 },
    ];
    if (overlapNodes.length) {
      list.push({
        id: 'overlap',
        label: `Overlap (${overlap})`,
        cx: overlapNodes[0].x + 52,
        cy: overlapNodes[0].y + 46,
        zoom: 2.4,
      });
    }
    return list;
  }, [overlapNodes, overlap]);

  const steps = useMemo(
    () => [
      {
        title: 'Data lives on N nodes',
        meta: `N=${n}`,
        camera: 'wide',
        focus: grid,
        simple: 'The same information is copied onto several computers. If one is asleep or broken, another copy still exists.',
        detail: `${n} replicas hold the same data. Copies are what let a system survive a machine dying, but they also create a question: when is a write “done”?`,
        watch: 'Replication is for safety and speed — not a backup you can restore from a month later.',
      },
      {
        title: 'A write reaches W nodes',
        meta: `W=${w}`,
        camera: 'replicas',
        focus: grid,
        simple: 'When you save something, the system waits until W copies have it, then says “saved”.',
        detail: `A write is acknowledged after ${w} of ${n} replicas store it. The remaining ${n - w} copies catch up later. Bigger W means safer writes but more waiting.`,
        watch: `${writeFailures} replica${writeFailures === 1 ? '' : 's'} may be down and writes still succeed.`,
      },
      {
        title: 'A read asks R nodes',
        meta: `R=${r}`,
        camera: 'replicas',
        focus: grid,
        simple: 'When someone opens the data, the system asks R copies and returns the newest answer it finds.',
        detail: `A read contacts ${r} of ${n} replicas. If those copies disagree, the newest version wins (using timestamps or version numbers). Reads can continue with ${readFailures} failed replica${readFailures === 1 ? '' : 's'}.`,
        watch: 'Reading more copies costs latency but improves confidence.',
      },
      {
        title: 'Do R and W overlap?',
        meta: `${r}+${w} vs ${n}`,
        camera: overlap > 0 ? 'overlap' : 'replicas',
        focus: overlapNodes.length
          ? { cx: overlapNodes[0].x + 52, cy: overlapNodes[0].y + 46, w: 104, h: 92 }
          : grid,
        simple: 'If the write group and the read group share at least one computer, the reader is guaranteed to meet the newest copy. If they cannot overlap, the reader may get an old copy.',
        detail: consistent
          ? `R + W = ${r + w} > N = ${n}, so every read set and write set must share ${overlap} node${overlap === 1 ? '' : 's'}. That shared node has the newest write, which makes the system strongly consistent.`
          : `R + W = ${r + w} ≤ N = ${n}, so the groups can miss each other completely. A read may return stale data. Systems accept this for lower latency and reconcile later — that is eventual consistency.`,
        watch: consistent ? 'Strong consistency: a read always sees the last acknowledged write.' : 'Eventual consistency: “new” is not guaranteed, only “soon”.',
      },
      {
        title: 'Count the failures',
        meta: `${bothFailures}`,
        camera: 'replicas',
        focus: grid,
        simple: 'The same maths tells you how many computers can break while the system keeps working.',
        detail: `With N=${n}, R=${r}, W=${w} you can lose ${writeFailures} replica${writeFailures === 1 ? '' : 's'} for writes, ${readFailures} for reads, and ${bothFailures} while still serving both. Lose more than that and one operation has to wait for a copy to return.`,
        watch: 'A quorum is a budget of failures, not a promise of uptime.',
      },
      {
        title: 'Latency and the slowest node',
        meta: ms(nodeMs),
        camera: 'wide',
        focus: { cx: 450, cy: 210, w: 860, h: 260 },
        simple: 'You do not wait for all N copies — only for enough of them. The slowest of those W (or R) replies decides the wait.',
        detail: `Each replica takes about ${ms(nodeMs)}. A write waits for the slowest of ${w} replies and a read for the slowest of ${r}. That is why quorums are faster than “wait for every replica”, and why one slow node can still hurt.`,
        watch: consistent ? 'Strong consistency costs availability and latency — choose it where correctness matters.' : 'Lower latency is the trade you made for stale reads.',
      },
    ],
    [n, r, w, consistent, overlap, writeFailures, readFailures, bothFailures, nodeMs, grid, overlapNodes],
  );

  const replicaTone = (index) => {
    const read = readSet.has(index);
    const write = writeSet.has(index);
    if (read && write) return TONE.green;
    if (read) return TONE.blue;
    if (write) return TONE.amber;
    return TONE.slate;
  };

  const renderScene = (active) => (
    <g>
      <Node x={20} y={164} w={170} h={92} kind="network" label="Client" sub={`reads ${r} · writes ${w}`} tone={TONE.cyan} active={active === 0} />
      {positions.map((pos) => {
        const read = readSet.has(pos.index);
        const write = writeSet.has(pos.index);
        const both = read && write;
        const tone = replicaTone(pos.index);
        const cy = pos.y + pos.h / 2;
        return (
          <g key={pos.index}>
            <Wire d={`M190 210 C228 210, 228 ${cy}, ${pos.x} ${cy}`} tone={tone} active={active === 2 || active === 3} dashed={!read && !write} />
            <g transform={`translate(${pos.x} ${pos.y})`}>
              {both && (
                <>
                  <rect x="-6" y="-6" width={pos.w + 12} height={pos.h + 12} rx="18" fill={TONE.green} opacity="0.1" />
                  <rect x="-6" y="-6" width={pos.w + 12} height={pos.h + 12} rx="18" fill="none" stroke={TONE.green} strokeOpacity="0.7" strokeWidth="1.6" />
                </>
              )}
              <rect width={pos.w} height={pos.h} rx="14" fill="#0a1322" stroke={both ? TONE.green : read ? TONE.blue : write ? TONE.amber : '#1e293b'} strokeWidth={both ? 2 : 1.2} />
              <Glyph kind="database" x={12} y={10} size={22} color={tone} />
              <text x="42" y="26" fontSize="12" fontWeight="700" fill="#e2e8f0">node {pos.index + 1}</text>
              <text x="12" y="46" fontSize="8.5" fontFamily="ui-monospace, monospace" fill={both ? TONE.green : '#64748b'}>
                {both ? 'in both quorums' : read ? 'read quorum' : write ? 'write quorum' : 'idle replica'}
              </text>
              <g transform="translate(12 58)">
                <rect width="36" height="20" rx="10" fill={read ? '#0b2a3f' : '#0f172a'} stroke={read ? TONE.blue : '#26364d'} />
                <text x="18" y="13.5" textAnchor="middle" fontSize="10" fontWeight="700" fontFamily="ui-monospace, monospace" fill={read ? TONE.blue : '#475569'}>R</text>
              </g>
              <g transform="translate(54 58)">
                <rect width="38" height="20" rx="10" fill={write ? '#3a2a08' : '#0f172a'} stroke={write ? TONE.amber : '#26364d'} />
                <text x="19" y="13.5" textAnchor="middle" fontSize="10" fontWeight="700" fontFamily="ui-monospace, monospace" fill={write ? TONE.amber : '#475569'}>W</text>
              </g>
            </g>
          </g>
        );
      })}

      <Tag x={620} y={30} text={consistent ? `R + W > N · overlap ${overlap}` : `R + W ≤ N · no guaranteed overlap`} tone={consistent ? TONE.green : TONE.amber} />
      <Note x={20} y={402} text={`${n} replicas · ${r} read · ${w} write · ${nodeMs} ms per node`} />
      <Tag x={620} y={398} text={consistent ? 'a read always sees the newest write' : 'a read may see stale data'} tone={consistent ? TONE.green : TONE.amber} />
    </g>
  );

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Strong consistency needs the read set and the write set to overlap on at least one node.">
          N replicas, R reads, W writes
        </SectionTitle>
        <div className="flex flex-wrap gap-2">
          {PRESETS.map((preset) => (
            <button
              key={preset.label}
              type="button"
              onClick={() => {
                setN(preset.n);
                setR(preset.r);
                setW(preset.w);
              }}
              className="rounded-full border border-slate-700 px-3 py-1.5 text-[11px] font-semibold text-slate-300 hover:text-white"
            >
              {preset.label} (N={preset.n} R={preset.r} W={preset.w})
            </button>
          ))}
        </div>

        <div className="mt-4 grid gap-4 sm:grid-cols-4">
          <Range label="Replicas (N)" value={n} min={1} max={9} onChange={(value) => { setN(value); setR((old) => Math.min(old, value)); setW((old) => Math.min(old, value)); }} />
          <Range label="Read quorum (R)" value={Math.min(r, n)} min={1} max={n} onChange={setR} />
          <Range label="Write quorum (W)" value={Math.min(w, n)} min={1} max={n} onChange={setW} />
          <Range label="Node latency" value={nodeMs} min={1} max={200} onChange={setNodeMs} format={ms} />
        </div>

        <ProcessScene
          cameras={cameras}
          steps={steps}
          ariaLabel="A client reading and writing to replicas, with read quorum and write quorum nodes highlighted and overlapping nodes marked green"
          note="The R and W badges on each node show the two quorums; green nodes belong to both."
          render={renderScene}
        />

        <div className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <Stat label="R + W" value={`${r} + ${w} = ${r + w}`} hint={`N is ${n}`} />
          <Stat label="Consistency" value={consistent ? 'Strong' : 'Eventual'} tone={consistent ? 'text-emerald-400' : 'text-amber-300'} hint={consistent ? `overlap of ${overlap} node${overlap === 1 ? '' : 's'}` : 'readers may miss the latest write'} />
          <Stat label="Failures tolerated" value={`${bothFailures} node${bothFailures === 1 ? '' : 's'}`} hint={`writes: ${writeFailures} · reads: ${readFailures}`} />
          <Stat label="Latency" value={ms(nodeMs)} hint="waits for the slowest R or W response, not all N" />
        </div>

        <div className="mt-4">
          <Callout tone={consistent ? 'ok' : 'warn'}>
            {consistent
              ? `R + W > N guarantees at least one node in every read set has seen every acknowledged write, so a read always returns the newest value. Pay for it in availability: with ${n} replicas you can lose ${bothFailures} and still serve both reads and writes.`
              : `R + W ≤ N means read and write sets can miss each other entirely, so a read may return stale data. That is a deliberate choice for low latency — Dynamo-style systems accept it and reconcile with vector clocks or last-write-wins.`}
          </Callout>
        </div>
      </Panel>
    </div>
  );
};
