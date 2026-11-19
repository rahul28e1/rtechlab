import React, { useMemo, useState } from 'react';
import { Field, Panel, Stat, SectionTitle, Callout } from './toolUi';

const LEVELS = [
  { id: 'raid0', label: 'RAID 0 — striping', min: 2 },
  { id: 'raid1', label: 'RAID 1 — mirroring', min: 2 },
  { id: 'raid5', label: 'RAID 5 — striping + 1 parity', min: 3 },
  { id: 'raid6', label: 'RAID 6 — striping + 2 parity', min: 4 },
  { id: 'raid10', label: 'RAID 10 — mirror of stripes', min: 4 },
  { id: 'jbod', label: 'JBOD — just a bunch of disks', min: 1 },
];

const calc = (level, disks, sizeTb) => {
  const raw = disks * sizeTb;
  switch (level) {
    case 'raid0':
      return { usable: raw, tolerance: 0, note: 'No redundancy. Any single disk failure loses the whole array.' };
    case 'raid1':
      return {
        usable: Math.floor(disks / 2) * sizeTb,
        tolerance: Math.floor(disks / 2),
        note: 'Every disk is mirrored in pairs, so each pair survives one failure.',
      };
    case 'raid5':
      return {
        usable: (disks - 1) * sizeTb,
        tolerance: 1,
        note: 'One parity disk equivalent is spent. Rebuild after a failure puts heavy read load on every remaining disk.',
      };
    case 'raid6':
      return {
        usable: (disks - 2) * sizeTb,
        tolerance: 2,
        note: 'Two parity equivalents, so the array survives two simultaneous failures — the safer choice for large HDD arrays.',
      };
    case 'raid10':
      return {
        usable: Math.floor(disks / 2) * sizeTb,
        tolerance: Math.floor(disks / 2),
        note: 'Mirror per stripe: one failure per mirror pair is survivable, but the wrong second failure kills the array.',
      };
    default:
      return { usable: raw, tolerance: 0, note: 'JBOD is a concatenation, not a RAID level. A failed disk can lose everything.' };
  }
};

const TABLE = [
  { level: 'RAID 0', usable: 'N × size', min: '2', tolerance: '0 disks', best: 'Scratch, cache, render' },
  { level: 'RAID 1', usable: 'N/2 × size', min: '2', tolerance: '1 per mirror', best: 'OS disks, small databases' },
  { level: 'RAID 5', usable: '(N−1) × size', min: '3', tolerance: '1 disk', best: 'File servers, archives' },
  { level: 'RAID 6', usable: '(N−2) × size', min: '4', tolerance: '2 disks', best: 'Large HDD arrays, backups' },
  { level: 'RAID 10', usable: 'N/2 × size', min: '4', tolerance: '1 per mirror', best: 'Databases, virtualisation' },
];

export const RaidCalculator = () => {
  const [level, setLevel] = useState('raid5');
  const [disks, setDisks] = useState(4);
  const [sizeTb, setSizeTb] = useState(4);

  const result = useMemo(() => {
    const n = Math.max(1, Math.min(48, Number(disks) || 0));
    const size = Math.max(0.01, Number(sizeTb) || 0);
    const picked = LEVELS.find((item) => item.id === level);
    const enough = n >= picked.min;
    const { usable, tolerance, note } = calc(level, n, size);
    const raw = n * size;
    return {
      usable,
      raw,
      tolerance,
      note,
      enough,
      min: picked.min,
      efficiency: raw > 0 ? (usable / raw) * 100 : 0,
      usableDecimalTb: usable * 1000,
      rawDecimalTb: raw * 1000,
    };
  }, [level, disks, sizeTb]);

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-3">
          <Field label="RAID level">
            <select value={level} onChange={(e) => setLevel(e.target.value)} className="w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-cyan-300 outline-none">
              {LEVELS.map((item) => (
                <option key={item.id} value={item.id}>
                  {item.label}
                </option>
              ))}
            </select>
          </Field>
          <Field label="Number of disks" hint="Same size assumed for every disk">
            <input type="number" min="1" max="48" value={disks} onChange={(e) => setDisks(e.target.value)} className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400" />
          </Field>
          <Field label="Size per disk (TB)">
            <input type="number" min="0.1" step="0.25" value={sizeTb} onChange={(e) => setSizeTb(e.target.value)} className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400" />
          </Field>
        </div>

        {!result.enough && (
          <div className="mt-4">
            <Callout tone="warn">
              This layout needs at least {result.min} disks. With {disks} disk(s) the array cannot be built — pick a different level or add disks.
            </Callout>
          </div>
        )}

        <div className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <Stat label="Usable capacity" value={`${result.usable.toFixed(1)} TiB`} hint={`${result.usableDecimalTb.toFixed(1)} TB decimal`} tone="text-emerald-400" />
          <Stat label="Raw capacity" value={`${result.raw.toFixed(1)} TiB`} hint={`${disks} × ${sizeTb} TB`} />
          <Stat label="Storage efficiency" value={`${result.efficiency.toFixed(1)} %`} hint="Usable ÷ raw" tone="text-cyan-300" />
          <Stat label="Disk failures survived" value={result.tolerance} hint="Before any data is lost" tone="text-amber-300" />
        </div>

        <div className="mt-4">
          <Callout>{result.note}</Callout>
        </div>
      </Panel>

      <Panel>
        <SectionTitle hint="Same numbers, all levels — compare before you commit">RAID comparison for {disks} disks</SectionTitle>
        <div className="overflow-x-auto rounded-xl border border-slate-800">
          <table className="w-full text-left text-xs">
            <thead className="border-b border-slate-800 bg-navy-950 text-[10px] uppercase tracking-wider text-slate-500">
              <tr>
                <th className="px-3 py-2.5">Level</th>
                <th className="px-3 py-2.5">Usable formula</th>
                <th className="px-3 py-2.5">Min disks</th>
                <th className="px-3 py-2.5">Survives</th>
                <th className="px-3 py-2.5">Usable here</th>
                <th className="px-3 py-2.5">Typical use</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-800/80">
              {TABLE.map((row) => {
                const id = row.level.toLowerCase().replace(' ', '');
                const c = calc(id, Math.max(Number(disks) || 1, 1), Number(sizeTb) || 0);
                return (
                  <tr key={row.level} className="hover:bg-slate-900/50">
                    <td className="px-3 py-2.5 font-semibold text-white">{row.level}</td>
                    <td className="px-3 py-2.5 font-mono text-slate-400">{row.usable}</td>
                    <td className="px-3 py-2.5 text-slate-400">{row.min}</td>
                    <td className="px-3 py-2.5 text-slate-400">{row.tolerance}</td>
                    <td className="px-3 py-2.5 font-mono font-bold text-cyan-300">{c.usable.toFixed(1)} TiB</td>
                    <td className="px-3 py-2.5 text-slate-400">{row.best}</td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
        <div className="mt-4">
          <Callout tone="info">
            Interview note: usable capacity is always <strong>raw minus parity or mirror copies</strong>. RAID protects against disk failure, not against deletion, ransomware or a controller failure — that is what backups are for.
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

export default RaidCalculator;
