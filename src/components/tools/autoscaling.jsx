import React, { useEffect, useMemo, useState } from 'react';
import { Callout, Field, Panel, SectionTitle, Stat } from './toolUi';
import { createSim, MAX_SERVERS, SERVER_RPS, stepSimulation } from './autoscalingSim';
import { Flow, Node, Note, ProcessScene, Tag, TONE, Wire } from './systemDesignStage';

// A live autoscaling simulator. Requests leave the users as dots, cross the load
// balancer and land on a server. Each server's CPU follows the traffic it has to
// absorb, and the autoscaler adds or removes a machine when the fleet average
// crosses the threshold. It runs locally; nothing is sent anywhere.

const DIAGRAM_WIDTH = 900;
const POOL = { x: 500, w: 360, h: 54, gap: 10 };
const SERVER_LABELS = ['srv-a', 'srv-b', 'srv-c', 'srv-d', 'srv-e'];

const cpuTone = (cpu, threshold) =>
  cpu > threshold ? '#F87171' : cpu > threshold - 25 ? '#FBBF24' : '#34D399';

const CAMERAS = [
  { id: 'wide', label: 'Wide shot', cx: 450, cy: 210, zoom: 1 },
  { id: 'users', label: 'Users', cx: 100, cy: 210, zoom: 2.3 },
  { id: 'balancer', label: 'Balancer', cx: 320, cy: 210, zoom: 2.2 },
  { id: 'pool', label: 'Server pool', cx: 680, cy: 210, zoom: 1.7 },
];

const RANGE_CLASS = 'w-full cursor-pointer accent-electric-500';

const Range = ({ label, value, min, max, onChange, format }) => (
  <Field label={label} hint={format ? format(value) : String(value)}>
    <input
      type="range"
      className={RANGE_CLASS}
      min={min}
      max={max}
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

const serverY = (index, count) => {
  const total = count * POOL.h + (count - 1) * POOL.gap;
  return 210 - total / 2 + index * (POOL.h + POOL.gap);
};

// Curve from the users box, past the balancer, into a server card. `t` runs
// from 0 (users) to 1 (server), so dots only ever fly forward.
const curvePoint = (t, y0, y1) => {
  const inv = 1 - t;
  return {
    x: inv * inv * 170 + 2 * inv * t * 340 + t * t * POOL.x,
    y: y0 + t * t * (y1 - y0),
  };
};

export const AutoscalingSim = () => {
  const [sim, setSim] = useState(createSim);
  const [paused, setPaused] = useState(false);
  const [ramp, setRamp] = useState(true);
  const [traffic, setTraffic] = useState(24);
  const [threshold, setThreshold] = useState(75);

  useEffect(() => {
    if (paused) return undefined;
    let last = performance.now();
    const id = setInterval(() => {
      // Real elapsed time, so a throttled background tab does not slow the run.
      const now = performance.now();
      const dt = Math.min(0.5, Math.max(0.02, (now - last) / 1000));
      last = now;
      // Copy the mutable parts before stepping, so React owns the previous frame.
      setSim((previous) => {
        const next = {
          ...previous,
          servers: previous.servers.map((server) => ({ ...server })),
          requests: previous.requests.map((request) => ({ ...request })),
          history: [...previous.history],
          log: [...previous.log],
        };
        stepSimulation(next, { ramp, traffic, threshold }, dt);
        return next;
      });
    }, 60);
    return () => clearInterval(id);
  }, [paused, ramp, traffic, threshold]);

  const count = sim.servers.length;
  // Requests that already landed and are being served, per server.
  const inFlight = sim.servers.map(() => 0);
  for (const request of sim.requests) {
    if (request.t >= 1) inFlight[request.server] += 1;
  }
  const average = sim.servers.reduce((sum, server) => sum + server.cpu, 0) / count;
  const chartMax = Math.max(20, ...sim.history.map((point) => Math.max(point.traffic, point.capacity)));
  const chartY = (value) => 110 - (value / chartMax) * 100;
  const linePath = (key) =>
    sim.history
      .map((point, index) => {
        const x = (index / Math.max(1, sim.history.length - 1)) * DIAGRAM_WIDTH;
        return `${index === 0 ? 'M' : 'L'}${x.toFixed(1)},${chartY(point[key]).toFixed(1)}`;
      })
      .join(' ');

  const reset = () => setSim(createSim());

  const steps = useMemo(
    () => [
      {
        title: 'Requests arrive',
        meta: `${Math.round(sim.traffic)}/s`,
        camera: 'users',
        focus: { cx: 95, cy: 210, w: 180, h: 130 },
        simple: 'Every second a new group of visitors opens the app. Each one is a tiny request that has to travel to a server.',
        detail: ramp
          ? 'The stress ramp is ON: traffic climbs smoothly from 6 req/s upward, like a launch day or an exam-result morning. Each green dot is one request already on its way.'
          : `The ramp is OFF, so traffic is held at the slider value (${traffic} req/s). Move the slider and the fleet reacts to the new load.`,
        watch: `${Math.round(sim.traffic)} req/s arriving · ${count * SERVER_RPS} req/s of capacity.`,
      },
      {
        title: 'Balancer spreads work',
        meta: 'round robin',
        camera: 'balancer',
        focus: { cx: 300, cy: 210, w: 200, h: 130 },
        simple: 'The load balancer hands each new request to the next server in line, so no machine gets two while another sits idle.',
        detail: `Every dot passes through the blue balancer before it reaches a server card. Round robin keeps the counts even, but it does not know which server is already busy with a slow request.`,
        watch: 'The balancer shares the queue — it does not make a server faster.',
      },
      {
        title: 'CPU follows the load',
        meta: `${Math.round(average)}%`,
        camera: 'pool',
        focus: { cx: 680, cy: 210, w: 380, h: 300 },
        simple: 'The more requests a server handles, the harder its processor works — like one teacher checking more exam papers.',
        detail: `Average CPU is ${Math.round(average)}% across ${count} server${count === 1 ? '' : 's'}. One server serves about ${SERVER_RPS} req/s at a healthy load, so this fleet can absorb ${count * SERVER_RPS} req/s before queues grow.`,
        watch: `The scale-out line is ${threshold}% average CPU.`,
      },
      {
        title: 'Cross the line',
        meta: `${threshold}%`,
        camera: 'pool',
        focus: { cx: 680, cy: 210, w: 380, h: 300 },
        simple: 'If CPU stays above the line for a while, the system decides it needs another helper. A one-second spike is ignored, because it might just be noise.',
        detail: `The autoscaler waits for a sustained hot period, then adds exactly one server (up to ${MAX_SERVERS}). Scaling on a single spike would make the fleet flap up and down all day.`,
        watch: `Currently ${count} of ${MAX_SERVERS} servers running.`,
      },
      {
        title: 'A new server joins',
        meta: '+1',
        camera: 'pool',
        focus: { cx: 680, cy: 210, w: 380, h: 300 },
        simple: 'The new machine boots, starts the app and joins the pool. Only after that does it begin taking traffic.',
        detail: `Capacity rises in steps — ${count * SERVER_RPS} req/s now. Boot time (image pull, app start, health check) is why a real fleet cannot react instantly, which is why you keep headroom.`,
        watch: `${sim.events} scaling event${sim.events === 1 ? '' : 's'} so far in this run.`,
      },
      {
        title: 'Scale in, slowly',
        meta: `${threshold - 32}%`,
        camera: 'wide',
        simple: 'When CPU is low for a long time, a server is removed — but the system waits much longer than it waited to add one.',
        detail: 'Scale-out is fast and scale-in is slow on purpose: a quiet minute should not remove a server the next minute needs. The cooldown after every event is what stops the fleet flapping.',
        watch: `Scale-in only below ${threshold - 32}% average CPU, after a long quiet period.`,
      },
    ],
    [sim.traffic, ramp, traffic, count, average, threshold, sim.events],
  );

  const renderScene = (active) => (
    <g>
      <Node
        x={20}
        y={168}
        w={150}
        h={84}
        kind="user"
        label="Users"
        sub={`${Math.round(sim.traffic)} req/s`}
        tone={TONE.blue}
        active={active === 0 || active === 1}
      />
      <Node
        x={215}
        y={168}
        w={175}
        h={84}
        kind="balancer"
        label="Load balancer"
        sub="round robin"
        tone={TONE.cyan}
        active={active === 1}
      />
      <Wire d="M170 210 H215" tone={TONE.cyan} active />
      <Flow d="M170 210 H215" tone={TONE.cyan} count={3} dur={1.8} size={2.6} />

      {sim.servers.map((server, index) => {
        const y = serverY(index, count);
        const cy = y + POOL.h / 2;
        return (
          <Wire
            key={`wire-${index}`}
            d={`M390 210 C445 210, 445 ${cy}, ${POOL.x} ${cy}`}
            tone={cpuTone(server.cpu, threshold)}
            active={active === 1 || active === 3 || active === 4}
          />
        );
      })}

      {sim.requests
        .filter((request) => request.t < 1)
        .map((request) => {
          const point = curvePoint(request.t, request.y0, serverY(request.server, count) + POOL.h / 2);
          return <circle key={request.id} cx={point.x} cy={point.y} r="2.6" fill={TONE.green} opacity="0.9" />;
        })}

      {sim.servers.map((server, index) => {
        const y = serverY(index, count);
        const tone = cpuTone(server.cpu, threshold);
        return (
          <Node
            key={`server-${index}`}
            x={POOL.x}
            y={y}
            w={POOL.w}
            h={POOL.h}
            kind="server"
            label={SERVER_LABELS[index]}
            sub={`${Math.round(server.cpu)}% CPU · ${inFlight[index]} in flight`}
            tone={tone}
            bar={server.cpu}
            active={active === 2 || active === 3 || active === 4 || active === 5}
          />
        );
      })}

      <Note x={POOL.x} y={44} text={`SERVER POOL · ${count} RUNNING · ${count * SERVER_RPS} REQ/S`} />
      <Tag x={680} y={396} text={`${sim.events} scaling events · avg CPU ${Math.round(average)}%`} tone={average > threshold ? TONE.red : TONE.green} />
      <Tag x={190} y={396} text={`traffic ${Math.round(sim.traffic)} req/s`} tone={TONE.green} />
    </g>
  );

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Traffic climbs, every request flies to a server, and the autoscaler adds a machine when CPU crosses the line.">
          Autoscaling under growing traffic
        </SectionTitle>

        <div className="flex flex-wrap items-center gap-2">
          <Toggle active={ramp} onClick={() => setRamp((value) => !value)}>
            {ramp ? 'Stress ramp: ON' : 'Stress ramp: OFF'}
          </Toggle>
          <Toggle active={paused} onClick={() => setPaused((value) => !value)}>
            {paused ? 'Resume' : 'Pause'}
          </Toggle>
          <button
            type="button"
            onClick={reset}
            className="rounded-full border border-slate-700 px-3 py-1.5 text-[11px] font-semibold text-slate-300 hover:text-white"
          >
            Reset
          </button>
        </div>

        <div className="mt-4 grid gap-4 sm:grid-cols-2">
          <Range
            label="Traffic to hold (ramp off)"
            value={traffic}
            min={5}
            max={50}
            onChange={setTraffic}
            format={(value) => `${value} req/s`}
          />
          <Range
            label="Scale-out CPU threshold"
            value={threshold}
            min={55}
            max={90}
            onChange={setThreshold}
            format={(value) => `${value}%`}
          />
        </div>

        <ProcessScene
          cameras={CAMERAS}
          steps={steps}
          ariaLabel="Requests travelling from users through a load balancer to a server pool, where the autoscaler adds or removes servers as CPU changes"
          note="Pause the run at any moment, then step through the guide to study what the picture is doing."
          render={renderScene}
        />

        <div className="mt-5">
          <div className="mb-2 flex flex-wrap items-center justify-between gap-2 text-[11px] text-slate-500">
            <span className="uppercase tracking-wider">Traffic vs capacity</span>
            <span className="flex items-center gap-3">
              <span className="flex items-center gap-1.5"><span className="h-1.5 w-4 rounded bg-emerald-400" /> traffic</span>
              <span className="flex items-center gap-1.5"><span className="h-1.5 w-4 rounded bg-sky-400" /> capacity</span>
            </span>
          </div>
          <svg viewBox={`0 0 ${DIAGRAM_WIDTH} 120`} className="w-full">
            <line x1="0" y1="110" x2={DIAGRAM_WIDTH} y2="110" stroke="#2C2C2E" strokeWidth="1" />
            <line x1="0" y1="60" x2={DIAGRAM_WIDTH} y2="60" stroke="#1D1D1F" strokeWidth="1" strokeDasharray="3 6" />
            {sim.history.length > 1 && (
              <>
                <path d={linePath('capacity')} fill="none" stroke="#38BDF8" strokeWidth="1.5" strokeLinejoin="round" />
                <path d={linePath('traffic')} fill="none" stroke="#34D399" strokeWidth="1.5" strokeLinejoin="round" />
              </>
            )}
          </svg>
          <div className="mt-1 flex justify-between text-[10px] text-slate-500">
            <span>start of the run</span>
            <span>now · {Math.round(sim.traffic)} req/s</span>
          </div>
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <Stat
            label="Traffic"
            value={`${Math.round(sim.traffic)} req/s`}
            tone="text-emerald-400"
            hint={ramp ? 'stress ramp is climbing' : 'held at the slider value'}
          />
          <Stat label="Servers running" value={`${count} / ${MAX_SERVERS}`} hint={`${count * SERVER_RPS} req/s of capacity`} />
          <Stat
            label="Average CPU"
            value={`${Math.round(average)}%`}
            tone={average > threshold ? 'text-red-300' : 'text-white'}
            hint={`scale out above ${threshold}%`}
          />
          <Stat label="Scaling events" value={sim.events} hint="servers added or removed" />
        </div>

        {sim.log.length > 0 && (
          <div className="mt-4 space-y-1.5">
            {sim.log.slice(0, 4).map((entry) => (
              <div key={entry.id} className="flex flex-wrap items-center gap-2 font-mono text-[11px]">
                <span className={entry.kind === 'up' ? 'text-emerald-400' : 'text-amber-300'}>
                  {entry.kind === 'up' ? '▲ scale out' : '▼ scale in'}
                </span>
                <span className="text-slate-400">
                  {entry.kind === 'up' ? '+1' : '−1'} server → {entry.count} running
                </span>
                <span className="text-slate-600">avg CPU {entry.cpu}%</span>
              </div>
            ))}
          </div>
        )}

        <div className="mt-4">
          <Callout>
            Capacity rises in steps but traffic climbs smoothly — that gap is why autoscaling needs a cooldown. Scale out on sustained CPU (a one-second spike is noise) and scale in slowly, so a quiet minute does not remove a server the next minute needs. On a real fleet the new machine also waits for boot time before it takes traffic.
          </Callout>
        </div>
      </Panel>
    </div>
  );
};
