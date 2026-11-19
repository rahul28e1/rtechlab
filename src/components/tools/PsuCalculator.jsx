import React, { useMemo, useState } from 'react';
import { Callout, Field, Panel, Stat } from './toolUi';

const CPUS = [
  { label: 'Entry desktop (65 W TDP)', watts: 65 },
  { label: 'Mid desktop / gaming (95–105 W)', watts: 100 },
  { label: 'High-end desktop (125–150 W)', watts: 140 },
  { label: 'HEDT / workstation (250 W)', watts: 250 },
  { label: 'Server Xeon / EPYC (200 W)', watts: 200 },
];

const GPUS = [
  { label: 'Integrated graphics', watts: 15 },
  { label: 'Entry GPU (GTX 1650 class)', watts: 75 },
  { label: 'Mid GPU (RTX 4060 class)', watts: 115 },
  { label: 'High GPU (RTX 4070 Ti class)', watts: 285 },
  { label: 'Flagship (RTX 4090 class)', watts: 450 },
  { label: 'Workstation / dual GPU', watts: 700 },
];

const STANDARD_WATTS = [450, 550, 650, 750, 850, 1000, 1200, 1500];

const inputCls =
  'w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400';

export const PsuCalculator = () => {
  const [cpu, setCpu] = useState(100);
  const [gpu, setGpu] = useState(115);
  const [sticks, setSticks] = useState(2);
  const [ssds, setSsds] = useState(1);
  const [hdds, setHdds] = useState(1);
  const [fans, setFans] = useState(3);
  const [extra, setExtra] = useState(0);

  const result = useMemo(() => {
    const ram = (Number(sticks) || 0) * 4; // ~4 W per DDR4/DDR5 DIMM
    const ssd = (Number(ssds) || 0) * 6;
    const hdd = (Number(hdds) || 0) * 9;
    const fan = (Number(fans) || 0) * 3;
    const board = 45; // chipset, VRM, NICs, USB
    const misc = Number(extra) || 0;
    const total = Number(cpu) + Number(gpu) + ram + ssd + hdd + fan + board + misc;
    const headroom = total * 1.3;
    const recommended = STANDARD_WATTS.find((w) => w >= headroom) || 1500;
    return {
      total,
      headroom,
      recommended,
      rows: [
        { label: 'CPU', watts: Number(cpu) },
        { label: 'Graphics card', watts: Number(gpu) },
        { label: `RAM (${sticks} × 4 W)`, watts: ram },
        { label: `SSD (${ssds} × 6 W)`, watts: ssd },
        { label: `HDD (${hdds} × 9 W)`, watts: hdd },
        { label: `Fans (${fans} × 3 W)`, watts: fan },
        { label: 'Motherboard, chipset, USB', watts: board },
        { label: 'Extra (AIO pump, RGB, capture card)', watts: misc },
      ],
      peak: Number(cpu) + Number(gpu) + board + 60,
    };
  }, [cpu, gpu, sticks, ssds, hdds, fans, extra]);

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-2">
          <Field label="CPU class">
            <select value={cpu} onChange={(e) => setCpu(Number(e.target.value))} className="w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-cyan-300 outline-none">
              {CPUS.map((item) => (
                <option key={item.watts} value={item.watts}>
                  {item.label}
                </option>
              ))}
            </select>
          </Field>
          <Field label="Graphics card">
            <select value={gpu} onChange={(e) => setGpu(Number(e.target.value))} className="w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-cyan-300 outline-none">
              {GPUS.map((item) => (
                <option key={item.watts} value={item.watts}>
                  {item.label}
                </option>
              ))}
            </select>
          </Field>
        </div>

        <div className="mt-4 grid grid-cols-2 gap-3 sm:grid-cols-4">
          <Field label="RAM sticks"><input type="number" min="0" max="8" value={sticks} onChange={(e) => setSticks(e.target.value)} className={inputCls} /></Field>
          <Field label="SSDs / NVMe"><input type="number" min="0" max="12" value={ssds} onChange={(e) => setSsds(e.target.value)} className={inputCls} /></Field>
          <Field label="HDDs"><input type="number" min="0" max="24" value={hdds} onChange={(e) => setHdds(e.target.value)} className={inputCls} /></Field>
          <Field label="Case fans"><input type="number" min="0" max="12" value={fans} onChange={(e) => setFans(e.target.value)} className={inputCls} /></Field>
        </div>

        <div className="mt-3 max-w-xs">
          <Field label="Extra watts" hint="AIO pump, RGB strip, capture card, NIC">
            <input type="number" min="0" max="500" value={extra} onChange={(e) => setExtra(e.target.value)} className={inputCls} />
          </Field>
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-3">
          <Stat label="Estimated system draw" value={`${Math.round(result.total)} W`} hint="Typical load, not marketing peak" />
          <Stat label="With 30 % headroom" value={`${Math.round(result.headroom)} W`} hint="Recommended PSU rating" tone="text-cyan-300" />
          <Stat label="Buy this size" value={`${result.recommended} W`} hint="Nearest standard unit" tone="text-emerald-400" />
        </div>
      </Panel>

      <Panel>
        <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Where the watts go</h2>
        <div className="space-y-2">
          {result.rows.map((row) => {
            const pct = result.total > 0 ? (row.watts / result.total) * 100 : 0;
            return (
              <div key={row.label}>
                <div className="mb-1 flex justify-between text-[11px] text-slate-400">
                  <span>{row.label}</span>
                  <span className="font-mono">{row.watts} W</span>
                </div>
                <div className="h-1.5 overflow-hidden rounded-full bg-slate-800">
                  <div className="h-full rounded-full bg-electric-500" style={{ width: `${Math.min(100, pct)}%` }} />
                </div>
              </div>
            );
          })}
        </div>
        <div className="mt-4">
          <Callout tone="info">
            A PSU is most efficient around 40–60 % load and delivers its full rating on the 12 V rail. Transient GPU spikes can hit <strong>~{Math.round(result.peak)} W</strong> for a few milliseconds, which is why a 30 % cushion matters more than the average number.
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

export default PsuCalculator;
