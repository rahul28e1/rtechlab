import { useRef, useState } from 'react';
import { Callout, Panel } from './toolUi';

const GATES = {
  AND: (a, b) => a && b,
  OR: (a, b) => a || b,
  NAND: (a, b) => !(a && b),
  NOR: (a, b) => !(a || b),
  XOR: (a, b) => a !== b,
  XNOR: (a, b) => a === b,
  NOT: (a) => !a,
};

const GATE_INFO = {
  AND: {
    expr: 'Y = A · B',
    logic: 'Output is 1 only when every input is 1.',
    facts: [
      'Also written A ∧ B, A AND B, or AB in older texts.',
      'Two transistors in series: both must conduct to pull the output high.',
      'A single AND is rarely sold on its own — NAND is cheaper to build.',
    ],
  },
  OR: {
    expr: 'Y = A + B',
    logic: 'Output is 1 as soon as any input is 1.',
    facts: [
      'Also written A ∨ B. The + is Boolean OR, not arithmetic addition.',
      'Two transistors in parallel: either one can pull the output high.',
      'OR is not universal — you cannot build a NOT from OR alone.',
    ],
  },
  NOT: {
    expr: 'Y = A′',
    logic: 'Inverts the input: 1 becomes 0 and 0 becomes 1.',
    facts: [
      'Also written ¬A or Ā, and called an inverter on schematics.',
      'One transistor plus a pull-up is enough to build it.',
      'Two NOTs in series give back the original signal — that is a buffer.',
    ],
  },
  NAND: {
    expr: 'Y = (A · B)′',
    logic: 'AND followed by an inversion, so the output is 0 only when both inputs are 1.',
    facts: [
      'Universal gate: any circuit can be built from NAND gates alone.',
      'The cheapest CMOS gate, which is why real chips are NAND-heavy.',
      'Tie both inputs together and a NAND behaves as a NOT.',
    ],
    badge: 'Universal gate',
  },
  NOR: {
    expr: 'Y = (A + B)′',
    logic: 'OR followed by an inversion, so the output is 1 only when both inputs are 0.',
    facts: [
      'Also universal — NOR alone can build every other gate.',
      'Tie both inputs together and a NOR behaves as a NOT.',
      'Slower than NAND in CMOS, so it is used less in dense logic.',
    ],
    badge: 'Universal gate',
  },
  XOR: {
    expr: 'Y = A ⊕ B',
    logic: 'Output is 1 when the inputs differ, 0 when they match.',
    facts: [
      'The odd-parity detector: chain XORs and the output is 1 for an odd count of 1s.',
      'Half-adder core: sum = A ⊕ B while carry = A · B.',
      'Four XORs make a 4-bit parity checker, used in error detection.',
    ],
  },
  XNOR: {
    expr: 'Y = (A ⊕ B)′',
    logic: 'Output is 1 when the inputs match, which makes it an equality test.',
    facts: [
      'Also called the equivalence gate.',
      'Comparator circuits use it to check whether two bits are equal.',
      'It is simply XOR with an inverter on the output.',
    ],
  },
};

const SHAPE = { AND: 'and', NAND: 'and', OR: 'or', NOR: 'or', XOR: 'xor', XNOR: 'xor', NOT: 'not' };
const INVERTED = new Set(['NAND', 'NOR', 'XNOR', 'NOT']);

const SHAPE_PATH = {
  and: 'M190 70 H250 A50 50 0 0 1 250 170 H190 Z',
  or: 'M190 70 Q238 70 300 120 Q238 170 190 170 Q216 120 190 70 Z',
  xor: 'M190 70 Q238 70 300 120 Q238 170 190 170 Q216 120 190 70 Z',
  not: 'M200 74 L292 120 L200 166 Z',
};

const CAMERAS = [
  { id: 'wide', label: 'Wide', box: { x: 0, y: 12, w: 520, h: 216 } },
  { id: 'gate', label: 'Gate close-up', box: { x: 150, y: 45, w: 210, h: 160 } },
  { id: 'inputs', label: 'Inputs', box: { x: 0, y: 40, w: 270, h: 180 } },
  { id: 'output', label: 'Output', box: { x: 250, y: 40, w: 270, h: 180 } },
];

const WIDE = CAMERAS[0].box;

export const LogicGates = () => {
  const [gate, setGate] = useState('AND');
  const [a, setA] = useState(1);
  const [b, setB] = useState(0);
  const [view, setView] = useState(WIDE);
  const [camera, setCamera] = useState('wide');
  const drag = useRef(null);

  const info = GATE_INFO[gate];
  const single = gate === 'NOT';
  const shape = SHAPE[gate];
  const inverted = INVERTED.has(gate);
  const output = GATES[gate](Boolean(a), Boolean(b)) ? 1 : 0;
  const activeRow = single ? String(a) : `${a}${b}`;

  const yA = single ? 120 : 88;
  const yB = 152;
  const wireIn = shape === 'and' ? 190 : shape === 'not' ? 200 : 212;
  const rightEdge = shape === 'not' ? 292 : 300;
  const outStart = inverted ? rightEdge + 18 : rightEdge;

  const zoom = (factor) => {
    setCamera('custom');
    setView((current) => {
      const w = Math.min(520, Math.max(130, current.w * factor));
      const h = w / 2;
      const cx = current.x + current.w / 2;
      const cy = current.y + current.h / 2;
      return { x: cx - w / 2, y: cy - h / 2, w, h };
    });
  };

  const startDrag = (event) => {
    event.currentTarget.setPointerCapture(event.pointerId);
    drag.current = { x: event.clientX, y: event.clientY, view };
  };

  const moveDrag = (event) => {
    if (!drag.current) return;
    const rect = event.currentTarget.getBoundingClientRect();
    const scale = drag.current.view.w / Math.max(rect.width, 1);
    setCamera('custom');
    setView({
      ...drag.current.view,
      x: drag.current.view.x - (event.clientX - drag.current.x) * scale,
      y: drag.current.view.y - (event.clientY - drag.current.y) * scale,
    });
  };

  const endDrag = (event) => {
    drag.current = null;
    if (event.currentTarget.hasPointerCapture?.(event.pointerId)) {
      event.currentTarget.releasePointerCapture(event.pointerId);
    }
  };

  const setRow = (row) => {
    setA(row[0]);
    if (!single) setB(row[1]);
  };

  const wireOn = '#34d399';
  const wireOff = '#475569';
  const aOn = Boolean(a);
  const bOn = Boolean(b);

  return (
    <div className="space-y-5">
      <Panel>
        <div className="flex flex-wrap gap-2">
          {Object.keys(GATES).map((name) => (
            <button key={name} type="button" onClick={() => setGate(name)} aria-pressed={gate === name} className={`rounded-xl px-3.5 py-1.5 font-mono text-xs font-semibold transition ${gate === name ? 'bg-electric-600 text-white shadow-[0_0_18px_rgba(37,99,235,0.45)]' : 'border border-slate-700 text-slate-400 hover:border-slate-500 hover:text-slate-200'}`}>
              {name}
            </button>
          ))}
        </div>

        <div className="mt-5 flex flex-wrap items-center gap-3">
          <span className="text-xs text-slate-400">Input A</span>
          <button type="button" onClick={() => setA(a ? 0 : 1)} aria-label="Toggle input A" className={`h-10 w-14 rounded-xl border font-mono text-sm font-bold transition ${aOn ? 'border-emerald-500 bg-emerald-500/15 text-emerald-300' : 'border-slate-700 text-slate-400'}`}>{a}</button>
          {!single && (
            <>
              <span className="text-xs text-slate-400">Input B</span>
              <button type="button" onClick={() => setB(b ? 0 : 1)} aria-label="Toggle input B" className={`h-10 w-14 rounded-xl border font-mono text-sm font-bold transition ${bOn ? 'border-emerald-500 bg-emerald-500/15 text-emerald-300' : 'border-slate-700 text-slate-400'}`}>{b}</button>
            </>
          )}
          <span className="text-xs text-slate-400">Output</span>
          <span className={`flex h-10 w-14 items-center justify-center rounded-xl border font-mono text-sm font-bold transition ${output ? 'border-electric-500 bg-electric-500/15 text-electric-300 shadow-[0_0_18px_rgba(56,189,248,0.35)]' : 'border-slate-700 text-slate-400'}`}>{output}</span>
          <span className="ml-auto font-mono text-[11px] text-slate-500">{gate} · {a}{single ? '' : b} → {output}</span>
        </div>

        <div className="mt-5 grid gap-5 lg:grid-cols-5">
          <div className="lg:col-span-3">
            <div className="overflow-hidden rounded-2xl border border-slate-800 bg-[radial-gradient(circle_at_50%_15%,#0f2a4a_0%,#050c18_72%)]">
              <svg
                viewBox={`${view.x} ${view.y} ${view.w} ${view.h}`}
                className="h-[260px] w-full cursor-grab touch-none select-none active:cursor-grabbing"
                role="img"
                aria-label={`${gate} gate schematic with output ${output}`}
                onPointerDown={startDrag}
                onPointerMove={moveDrag}
                onPointerUp={endDrag}
                onPointerCancel={endDrag}
              >
                <defs>
                  <pattern id="logic-grid" width="20" height="20" patternUnits="userSpaceOnUse">
                    <path d="M20 0 H0 V20" fill="none" stroke="#1e293b" strokeWidth="0.6" />
                  </pattern>
                  <filter id="logic-glow" x="-50%" y="-50%" width="200%" height="200%">
                    <feGaussianBlur stdDeviation="3" result="blur" />
                    <feMerge>
                      <feMergeNode in="blur" />
                      <feMergeNode in="SourceGraphic" />
                    </feMerge>
                  </filter>
                </defs>

                <rect x={view.x - 200} y={view.y - 200} width={view.w + 400} height={view.h + 400} fill="url(#logic-grid)" />

                {/* input wires */}
                <path d={`M54 ${yA} H${wireIn}`} stroke={aOn ? wireOn : wireOff} strokeWidth={aOn ? 3 : 2} strokeLinecap="round" />
                {!single && <path d={`M54 ${yB} H${wireIn}`} stroke={bOn ? wireOn : wireOff} strokeWidth={bOn ? 3 : 2} strokeLinecap="round" />}

                {/* output wire */}
                <path d={`M${outStart} 120 H454`} stroke={output ? wireOn : wireOff} strokeWidth={output ? 3 : 2} strokeLinecap="round" />

                {/* live signal pulses */}
                {aOn && (
                  <circle r="3.4" fill="#a7f3d0">
                    <animateMotion dur="1.6s" repeatCount="indefinite" path={`M54 ${yA} H${wireIn}`} />
                  </circle>
                )}
                {!single && bOn && (
                  <circle r="3.4" fill="#a7f3d0">
                    <animateMotion dur="1.6s" repeatCount="indefinite" path={`M54 ${yB} H${wireIn}`} />
                  </circle>
                )}
                {output === 1 && (
                  <circle r="3.4" fill="#a7f3d0">
                    <animateMotion dur="1.6s" repeatCount="indefinite" path={`M${outStart} 120 H454`} />
                  </circle>
                )}

                {/* gate body */}
                <path d={SHAPE_PATH[shape]} fill="#0b3550" fillOpacity="0.85" stroke="#38bdf8" strokeWidth="2.5" strokeLinejoin="round" filter="url(#logic-glow)" />
                {shape === 'xor' && <path d="M176 70 Q202 120 176 170" fill="none" stroke="#38bdf8" strokeWidth="2.5" />}
                {inverted && <circle cx={rightEdge + 9} cy="120" r="8" fill="#0b3550" stroke="#38bdf8" strokeWidth="2.5" />}
                <text x={shape === 'not' ? 238 : 234} y="125" textAnchor="middle" fontSize="12" letterSpacing="1" fill="#7dd3fc" fontFamily="ui-monospace, monospace">{gate === 'NOT' ? '' : gate}</text>

                {/* input nodes */}
                <circle cx="40" cy={yA} r="13" fill={aOn ? '#10b981' : '#0b1220'} stroke={aOn ? '#6ee7b7' : '#475569'} strokeWidth="2" />
                <text x="40" y={yA + 4} textAnchor="middle" fontSize="12" fontWeight="700" fill={aOn ? '#042f1f' : '#94a3b8'} fontFamily="ui-monospace, monospace">{a}</text>
                <text x="40" y={yA - 22} textAnchor="middle" fontSize="11" fill="#64748b" fontFamily="ui-monospace, monospace">A</text>
                {!single && (
                  <>
                    <circle cx="40" cy={yB} r="13" fill={bOn ? '#10b981' : '#0b1220'} stroke={bOn ? '#6ee7b7' : '#475569'} strokeWidth="2" />
                    <text x="40" y={yB + 4} textAnchor="middle" fontSize="12" fontWeight="700" fill={bOn ? '#042f1f' : '#94a3b8'} fontFamily="ui-monospace, monospace">{b}</text>
                    <text x="40" y={yB - 22} textAnchor="middle" fontSize="11" fill="#64748b" fontFamily="ui-monospace, monospace">B</text>
                  </>
                )}

                {/* output node */}
                {output === 1 && <circle cx="470" cy="120" r="26" fill="#38bdf8" fillOpacity="0.16" />}
                <circle cx="470" cy="120" r="14" fill={output ? '#38bdf8' : '#0b1220'} stroke={output ? '#bae6fd' : '#475569'} strokeWidth="2" />
                <text x="470" y="124" textAnchor="middle" fontSize="12" fontWeight="700" fill={output ? '#062a3d' : '#94a3b8'} fontFamily="ui-monospace, monospace">{output}</text>
                <text x="470" y="102" textAnchor="middle" fontSize="11" fill="#64748b" fontFamily="ui-monospace, monospace">Y</text>
              </svg>
            </div>

            <div className="mt-2 flex flex-wrap items-center gap-1.5">
              <span className="mr-1 text-[10px] uppercase tracking-wider text-slate-500">Camera</span>
              {CAMERAS.map((shot) => (
                <button key={shot.id} type="button" onClick={() => { setCamera(shot.id); setView(shot.box); }} aria-pressed={camera === shot.id} className={`rounded-lg px-2.5 py-1 text-[11px] font-medium transition ${camera === shot.id ? 'bg-slate-700 text-white' : 'text-slate-400 hover:bg-slate-800/70 hover:text-slate-200'}`}>
                  {shot.label}
                </button>
              ))}
              <div className="ml-auto flex items-center gap-1">
                <button type="button" onClick={() => zoom(1.25)} aria-label="Zoom out" className="h-7 w-7 rounded-lg border border-slate-700 font-mono text-xs text-slate-300 hover:border-slate-500">−</button>
                <button type="button" onClick={() => zoom(0.8)} aria-label="Zoom in" className="h-7 w-7 rounded-lg border border-slate-700 font-mono text-xs text-slate-300 hover:border-slate-500">+</button>
                <button type="button" onClick={() => { setCamera('wide'); setView(WIDE); }} className="h-7 rounded-lg border border-slate-700 px-2 text-[11px] text-slate-300 hover:border-slate-500">Reset</button>
              </div>
            </div>
            <p className="mt-1 text-[11px] text-slate-500">Drag inside the schematic to pan, or pick a camera angle above.</p>
          </div>

          <div className="lg:col-span-2">
            <div className="h-full rounded-2xl border border-slate-800 bg-navy-950/60 p-4">
              <p className="text-[10px] uppercase tracking-wider text-slate-500">Boolean expression</p>
              <p className="mt-1 font-mono text-lg text-cyan-300">{info.expr}</p>
              <p className="mt-3 text-sm leading-relaxed text-slate-300">{info.logic}</p>
              <div className="mt-4 space-y-2">
                {info.facts.map((fact) => (
                  <p key={fact} className="flex gap-2 text-xs leading-relaxed text-slate-400">
                    <span className="mt-1.5 h-1 w-1 shrink-0 rounded-full bg-electric-400" aria-hidden="true" />
                    <span>{fact}</span>
                  </p>
                ))}
              </div>
              {info.badge && (
                <span className="mt-4 inline-flex rounded-full border border-emerald-500/40 bg-emerald-500/10 px-2.5 py-1 font-mono text-[10px] uppercase tracking-wider text-emerald-300">{info.badge}</span>
              )}
            </div>
          </div>
        </div>

        <div className="mt-5 overflow-hidden rounded-xl border border-slate-800">
          <table className="w-full text-left text-xs">
            <thead className="border-b border-slate-800 bg-navy-950 text-[10px] uppercase tracking-wider text-slate-500">
              <tr>
                <th className="px-3 py-2">A</th>
                {!single && <th className="px-3 py-2">B</th>}
                <th className="px-3 py-2">{gate} output</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-800/70">
              {(single ? [[0], [1]] : [[0, 0], [0, 1], [1, 0], [1, 1]]).map((row) => {
                const result = single ? (row[0] ? 0 : 1) : GATES[gate](Boolean(row[0]), Boolean(row[1])) ? 1 : 0;
                const isActive = row.join('') === activeRow;
                return (
                  <tr
                    key={row.join('')}
                    onClick={() => setRow(row)}
                    title="Click to load these inputs"
                    className={`cursor-pointer font-mono transition ${isActive ? 'bg-electric-600/15' : 'hover:bg-slate-800/40'}`}
                  >
                    <td className="px-3 py-1.5 text-slate-300">{row[0]}</td>
                    {!single && <td className="px-3 py-1.5 text-slate-300">{row[1]}</td>}
                    <td className={`px-3 py-1.5 ${result ? 'text-cyan-300' : 'text-slate-500'}`}>{result}</td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </Panel>
      <Callout tone="info">
        NAND and NOR are called universal gates: any circuit can be built from either one alone. That is why chip designers prefer them — a single repeated cell is cheaper to manufacture.
      </Callout>
    </div>
  );
};
