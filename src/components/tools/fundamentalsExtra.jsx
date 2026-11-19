import React, { useMemo, useState } from 'react';
import { FormTool, InfoList } from './kit';
import { Callout, Field, Panel } from './toolUi';

const randomInt = (min, max) => min + Math.floor(Math.random() * (max - min + 1));

const makeQuestion = (level) => {
  if (level === 'easy') {
    const value = randomInt(1, 63);
    return { prompt: `Convert ${value} (decimal) to binary`, answer: value.toString(2), hint: 'Divide by 2 and read the remainders bottom to top.' };
  }
  if (level === 'medium') {
    const value = randomInt(64, 255);
    const toHex = Math.random() > 0.5;
    return toHex
      ? { prompt: `Convert ${value} (decimal) to hexadecimal`, answer: value.toString(16).toUpperCase(), hint: 'Split into nibbles: divide by 16, remainder is the last digit.' }
      : { prompt: `Convert ${value.toString(2)} (binary) to decimal`, answer: String(value), hint: 'Add the place values: 128 64 32 16 8 4 2 1.' };
  }
  const prefix = randomInt(16, 30);
  const block = Math.pow(2, 32 - prefix);
  return { prompt: `How many usable hosts does a /${prefix} subnet have?`, answer: String(block - 2), hint: `2^${32 - prefix} = ${block}, minus network and broadcast.` };
};

export const NumberDrill = () => {
  const [level, setLevel] = useState('easy');
  const [question, setQuestion] = useState(() => makeQuestion('easy'));
  const [input, setInput] = useState('');
  const [feedback, setFeedback] = useState(null);
  const [score, setScore] = useState({ correct: 0, total: 0 });

  const check = () => {
    const given = input.trim().toUpperCase().replace(/^0B|^0X/, '');
    const expected = String(question.answer).toUpperCase();
    const correct = given === expected;
    setFeedback({ correct, expected });
    if (correct) setScore((prev) => ({ correct: prev.correct + 1, total: prev.total + 1 }));
    else setScore((prev) => ({ correct: prev.correct, total: prev.total + 1 }));
  };

  const next = () => {
    setQuestion(makeQuestion(level));
    setInput('');
    setFeedback(null);
  };

  return (
    <div className="space-y-5">
      <Panel>
        <div className="flex flex-wrap items-center gap-2">
          {['easy', 'medium', 'subnetting'].map((item) => (
            <button key={item} type="button" onClick={() => { setLevel(item); setQuestion(makeQuestion(item)); setInput(''); setFeedback(null); }} className={`rounded-xl px-3.5 py-1.5 text-xs font-semibold capitalize transition ${level === item ? 'bg-electric-600 text-white' : 'border border-slate-700 text-slate-400'}`}>
              {item}
            </button>
          ))}
          <span className="ml-auto font-mono text-[11px] text-slate-500">
            Score {score.correct}/{score.total}
          </span>
        </div>

        <p className="mt-5 text-lg font-semibold text-white">{question.prompt}</p>
        <div className="mt-3 flex flex-col gap-2 sm:flex-row">
          <input
            value={input}
            onChange={(event) => setInput(event.target.value)}
            onKeyDown={(event) => {
              if (event.key !== 'Enter') return;
              if (feedback) next();
              else check();
            }}
            placeholder="Your answer"
            className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400"
          />
          {feedback ? (
            <button type="button" onClick={next} className="rounded-xl bg-electric-600 px-5 py-2.5 text-sm font-semibold text-white hover:bg-electric-500">Next question</button>
          ) : (
            <button type="button" onClick={check} className="rounded-xl bg-electric-600 px-5 py-2.5 text-sm font-semibold text-white hover:bg-electric-500">Check</button>
          )}
        </div>

        {feedback && (
          <div className="mt-4">
            <Callout tone={feedback.correct ? 'ok' : 'error'}>
              {feedback.correct ? 'Correct.' : `Not quite — the answer is ${feedback.expected}.`} {question.hint}
            </Callout>
          </div>
        )}
      </Panel>
      <InfoList
        title="Place values to memorise"
        items={[
          '128 64 32 16 8 4 2 1 — the eight bits of one octet.',
          'A nibble is 4 bits and maps directly to one hex digit (8 + 4 + 2 + 1).',
          '255 = 11111111, 128 = 10000000, 192 = 11000000, 224 = 11100000, 240 = 11110000.',
        ]}
      />
    </div>
  );
};

const ASCII = Array.from({ length: 95 }, (_, index) => {
  const code = index + 32;
  const char = String.fromCharCode(code);
  return { code, char, hex: code.toString(16).toUpperCase().padStart(2, '0'), binary: code.toString(2).padStart(8, '0') };
}).concat([
  { code: 9, char: 'TAB', hex: '09', binary: '00001001', control: true },
  { code: 10, char: 'LF (newline)', hex: '0A', binary: '00001010', control: true },
  { code: 13, char: 'CR (carriage return)', hex: '0D', binary: '00001101', control: true },
  { code: 27, char: 'ESC', hex: '1B', binary: '00011011', control: true },
  { code: 32, char: 'SPACE', hex: '20', binary: '00100000', control: true },
]);

export const AsciiTable = () => {
  const [query, setQuery] = useState('');
  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return ASCII;
    return ASCII.filter((row) => row.char.toLowerCase().includes(q) || String(row.code) === q || row.hex.toLowerCase() === q);
  }, [query]);

  return (
    <div className="space-y-4">
      <Panel>
        <Field label="Search a character, decimal code or hex value" hint="Try “A”, “65”, “0A” or “newline”">
          <input value={query} onChange={(event) => setQuery(event.target.value)} className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400" />
        </Field>
      </Panel>
      <Panel className="p-0">
        <div className="max-h-[520px] overflow-auto">
          <table className="w-full text-left text-xs">
            <thead className="sticky top-0 border-b border-slate-800 bg-navy-950 text-[10px] uppercase tracking-wider text-slate-500">
              <tr>
                <th className="px-3 py-2.5">Char</th>
                <th className="px-3 py-2.5">Decimal</th>
                <th className="px-3 py-2.5">Hex</th>
                <th className="px-3 py-2.5">Binary</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-800/70">
              {filtered.map((row) => (
                <tr key={`${row.code}-${row.char}`} className="hover:bg-slate-900/50">
                  <td className="px-3 py-1.5 font-mono text-white">{row.char}</td>
                  <td className="px-3 py-1.5 font-mono text-slate-300">{row.code}</td>
                  <td className="px-3 py-1.5 font-mono text-cyan-300">{row.hex}</td>
                  <td className="px-3 py-1.5 font-mono text-slate-400">{row.binary}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </Panel>
      <Callout tone="info">
        “A” is 65 in decimal, 41 in hex and 01000001 in binary. Lowercase letters start at 97, and the gap between “A” and “a” is exactly 32 — that single bit is what case toggling flips.
      </Callout>
    </div>
  );
};

export const DataRateConverter = () => (
  <FormTool
    fields={[
      { key: 'value', label: 'Speed value', type: 'number', default: 100, min: 0 },
      { key: 'unit', label: 'Unit', type: 'select', default: 'Mbps', options: [
        { value: 'Kbps', label: 'Kbps (kilobits/s)' },
        { value: 'Mbps', label: 'Mbps (megabits/s)' },
        { value: 'Gbps', label: 'Gbps (gigabits/s)' },
        { value: 'MBps', label: 'MB/s (megabytes/s)' },
        { value: 'GBps', label: 'GB/s (gigabytes/s)' },
      ] },
      { key: 'size', label: 'File size to download (GB)', type: 'number', default: 4.7, min: 0 },
    ]}
    compute={({ value, unit, size }) => {
      const amount = Number(value) || 0;
      const bitsPerSecond = unit === 'Kbps' ? amount * 1e3
        : unit === 'Mbps' ? amount * 1e6
          : unit === 'Gbps' ? amount * 1e9
            : unit === 'MBps' ? amount * 8e6
              : amount * 8e9;
      const bytesPerSecond = bitsPerSecond / 8;
      const fileBytes = (Number(size) || 0) * 1e9;
      const seconds = bytesPerSecond > 0 ? fileBytes / bytesPerSecond : 0;
      const minutes = Math.floor(seconds / 60);
      const rest = Math.round(seconds % 60);
      return {
        stats: [
          { label: 'Megabits/s', value: `${(bitsPerSecond / 1e6).toFixed(2)} Mbps`, tone: 'text-cyan-300' },
          { label: 'Megabytes/s', value: `${(bytesPerSecond / 1e6).toFixed(2)} MB/s`, tone: 'text-emerald-400' },
          { label: 'Gigabits/s', value: `${(bitsPerSecond / 1e9).toFixed(3)} Gbps` },
          { label: 'Download time', value: seconds < 60 ? `${Math.round(seconds)} s` : `${minutes} min ${rest} s` },
        ],
        lines: [
          { label: 'Rule', value: 'Divide Mbps by 8 to get MB/s' },
          { label: 'Bits per second', value: Math.round(bitsPerSecond).toLocaleString() },
          { label: 'Bytes per second', value: Math.round(bytesPerSecond).toLocaleString() },
        ],
        note: 'A 100 Mbps plan downloads at about 12.5 MB/s, and real transfers reach roughly 80–90% of that because of protocol overhead and Wi-Fi.',
      };
    }}
  />
);

export { LogicGates } from './logicGates.jsx';

export const FileSizeEstimator = () => (
  <FormTool
    fields={[
      { key: 'hours', label: 'Duration (hours)', type: 'number', default: 1, min: 0 },
      { key: 'minutes', label: 'Duration (minutes)', type: 'number', default: 30, min: 0 },
      { key: 'bitrate', label: 'Bitrate (Mbps)', type: 'number', default: 8, min: 0, step: 0.1 },
      { key: 'audio', label: 'Audio bitrate (kbps)', type: 'number', default: 128, min: 0 },
      { key: 'copies', label: 'Number of recordings', type: 'number', default: 1, min: 1 },
    ]}
    compute={({ hours, minutes, bitrate, audio, copies }) => {
      const totalSeconds = (Number(hours) || 0) * 3600 + (Number(minutes) || 0) * 60;
      const videoBits = totalSeconds * (Number(bitrate) || 0) * 1e6;
      const audioBits = totalSeconds * (Number(audio) || 0) * 1e3;
      const bytes = (videoBits + audioBits) / 8;
      const perFile = bytes / (1024 * 1024 * 1024);
      const count = Number(copies) || 1;
      return {
        stats: [
          { label: 'Per recording', value: `${perFile.toFixed(2)} GB`, tone: 'text-cyan-300' },
          { label: 'All recordings', value: `${(perFile * count).toFixed(2)} GB`, tone: 'text-emerald-400' },
          { label: 'Duration', value: `${hours}h ${minutes}m` },
          { label: 'Hourly rate', value: `${(perFile / Math.max(totalSeconds / 3600, 0.01)).toFixed(2)} GB/h` },
        ],
        lines: [
          { label: 'Video data', value: `${(videoBits / 8 / 1e9).toFixed(2)} GB` },
          { label: 'Audio data', value: `${(audioBits / 8 / 1e6).toFixed(1)} MB` },
          { label: 'At 1080p 8 Mbps', value: `≈${(0.9 * 8 / 8 * 3600 / 1024).toFixed(1)} GB per hour` },
        ],
        note: 'Bitrate × time ÷ 8 is the whole formula. Storage planning fails when people count Mbps as MB/s — that one division by 8 is why a “1 hour 8 Mbps” video is about 3.6 GB, not 28 GB.',
      };
    }}
  />
);
