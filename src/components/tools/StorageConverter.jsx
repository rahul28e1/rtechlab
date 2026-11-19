import React, { useMemo, useState } from 'react';
import { Callout, Field, Panel, Stat } from './toolUi';

// Decimal (SI) and binary (IEC) multipliers in bytes.
const DECIMAL = [
  { unit: 'B', label: 'Byte', bytes: 1 },
  { unit: 'KB', label: 'Kilobyte', bytes: 1e3 },
  { unit: 'MB', label: 'Megabyte', bytes: 1e6 },
  { unit: 'GB', label: 'Gigabyte', bytes: 1e9 },
  { unit: 'TB', label: 'Terabyte', bytes: 1e12 },
  { unit: 'PB', label: 'Petabyte', bytes: 1e15 },
];

const BINARY = [
  { unit: 'KiB', label: 'Kibibyte', bytes: 1024 },
  { unit: 'MiB', label: 'Mebibyte', bytes: 1024 ** 2 },
  { unit: 'GiB', label: 'Gibibyte', bytes: 1024 ** 3 },
  { unit: 'TiB', label: 'Tebibyte', bytes: 1024 ** 4 },
  { unit: 'PiB', label: 'Pebibyte', bytes: 1024 ** 5 },
];

const ALL = [...DECIMAL, ...BINARY];

const format = (value) => {
  if (value === 0) return '0';
  if (value >= 1e6 || value < 0.001) return value.toExponential(3);
  return Number(value.toPrecision(6)).toLocaleString();
};

export const StorageConverter = () => {
  const [value, setValue] = useState(500);
  const [unit, setUnit] = useState('GB');

  const bytes = useMemo(() => {
    const picked = ALL.find((item) => item.unit === unit);
    return (Number(value) || 0) * (picked ? picked.bytes : 1);
  }, [value, unit]);

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-2">
          <Field label="Value">
            <input
              type="number"
              min="0"
              step="any"
              value={value}
              onChange={(e) => setValue(e.target.value)}
              className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400"
            />
          </Field>
          <Field label="Unit">
            <select
              value={unit}
              onChange={(e) => setUnit(e.target.value)}
              className="w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-cyan-300 outline-none"
            >
              {ALL.map((item) => (
                <option key={item.unit} value={item.unit}>
                  {item.unit} — {item.label}
                </option>
              ))}
            </select>
          </Field>
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-3">
          <Stat label="Total bits" value={format(bytes * 8)} />
          <Stat label="Total bytes" value={format(bytes)} tone="text-cyan-300" />
          <Stat label="In KiB" value={format(bytes / 1024)} hint="Binary unit used by RAM" />
        </div>
      </Panel>

      <div className="grid gap-5 lg:grid-cols-2">
        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Decimal (SI, what drive vendors print)</h2>
          <table className="w-full text-left text-xs">
            <tbody className="divide-y divide-slate-800/80">
              {DECIMAL.map((item) => (
                <tr key={item.unit}>
                  <td className="py-2 font-semibold text-slate-300">{item.unit}</td>
                  <td className="py-2 text-slate-500">{item.label}</td>
                  <td className="py-2 text-right font-mono text-cyan-300">{format(bytes / item.bytes)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </Panel>

        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Binary (IEC, what Windows shows)</h2>
          <table className="w-full text-left text-xs">
            <tbody className="divide-y divide-slate-800/80">
              {BINARY.map((item) => (
                <tr key={item.unit}>
                  <td className="py-2 font-semibold text-slate-300">{item.unit}</td>
                  <td className="py-2 text-slate-500">{item.label}</td>
                  <td className="py-2 text-right font-mono text-emerald-400">{format(bytes / item.bytes)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </Panel>
      </div>

      <Panel>
        <h2 className="mb-2 text-sm font-bold uppercase tracking-wider text-slate-300">Why your 500 GB disk shows 465 GB</h2>
        <p className="text-xs leading-relaxed text-slate-400">
          A drive is sold in decimal units: 500 GB = 500 × 10<sup>9</sup> bytes. Windows divides those same bytes by 1024 three times, so it reports
          <span className="mx-1 font-mono text-emerald-400">{format(500e9 / 1024 ** 3)} GiB</span>
          and labels it “GB”. Nothing is missing — only the unit definition changed. macOS and Linux report decimal GB, which is why the same disk looks bigger there.
        </p>
        <div className="mt-4">
          <Callout tone="info">
            Exam shortcut: every jump from decimal to binary loses about 2.4 % per size step (1000 ÷ 1024). Three steps ≈ 7 % smaller, five steps ≈ 11 %.
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

export default StorageConverter;
