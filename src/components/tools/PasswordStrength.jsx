import React, { useMemo, useState } from 'react';
import { Callout, Panel, Stat } from './toolUi';

const COMMON = new Set([
  'password', 'password1', '123456', '12345678', '123456789', 'qwerty', 'qwerty123', 'abc123',
  'letmein', 'welcome', 'monkey', 'dragon', 'iloveyou', 'admin', 'administrator', 'root',
  'india123', 'indian', 'cricket', 'sachin', 'rahul', 'krishna', 'shiva', 'hello123',
  'passw0rd', 'p@ssw0rd', 'trustno1', 'sunshine', 'princess', 'football', 'master', 'login',
]);

const UNITS = [
  { label: 'second', seconds: 1 },
  { label: 'minute', seconds: 60 },
  { label: 'hour', seconds: 3600 },
  { label: 'day', seconds: 86400 },
  { label: 'month', seconds: 2629800 },
  { label: 'year', seconds: 31557600 },
  { label: 'century', seconds: 3155760000 },
];

const humanise = (seconds) => {
  if (!Number.isFinite(seconds)) return 'longer than the age of the universe';
  if (seconds < 1) return 'instantly';
  let chosen = UNITS[0];
  for (const unit of UNITS) if (seconds >= unit.seconds) chosen = unit;
  const value = seconds / chosen.seconds;
  if (value > 1e6) return `${value.toExponential(2)} ${chosen.label}s`;
  return `${value < 10 ? value.toFixed(1) : Math.round(value).toLocaleString()} ${chosen.label}${value >= 2 ? 's' : ''}`;
};

export const PasswordStrength = () => {
  const [password, setPassword] = useState('');
  const [visible, setVisible] = useState(false);
  const [guessesPerSecond, setGuessesPerSecond] = useState(1e10);

  const analysis = useMemo(() => {
    const value = password || '';
    const lower = /[a-z]/.test(value);
    const upper = /[A-Z]/.test(value);
    const digit = /\d/.test(value);
    const symbol = /[^A-Za-z0-9]/.test(value);
    const spaces = /\s/.test(value);

    let pool = 0;
    if (lower) pool += 26;
    if (upper) pool += 26;
    if (digit) pool += 10;
    if (symbol) pool += 33;

    const length = value.length;
    const entropy = length > 0 && pool > 0 ? length * Math.log2(pool) : 0;
    const combinations = pool > 0 ? Math.pow(pool, length) : 0;
    const seconds = combinations > 0 ? combinations / 2 / guessesPerSecond : 0;

    const unique = new Set(value).size;
    const repeated = length > 2 && unique <= Math.max(2, Math.floor(length / 3));
    const sequential = /(0123|1234|2345|3456|4567|5678|6789|abcd|bcde|cdef|qwer|asdf|zxcv)/i.test(value);
    const isCommon = COMMON.has(value.toLowerCase());
    const yearsLike = /^(19|20)\d{2}$/.test(value);

    const problems = [];
    if (length < 12) problems.push('Shorter than 12 characters — length beats symbols.');
    if (!upper) problems.push('No uppercase letter.');
    if (!lower) problems.push('No lowercase letter.');
    if (!digit) problems.push('No digit.');
    if (!symbol) problems.push('No symbol.');
    if (repeated) problems.push('Too few unique characters — repeats are guessed first.');
    if (sequential) problems.push('Contains a keyboard or number sequence.');
    if (isCommon) problems.push('This is on every published password list.');
    if (yearsLike) problems.push('A bare year is one of the first things a cracker tries.');
    if (spaces) problems.push('Spaces are fine in a passphrase, but check the site accepts them.');

    let verdict = { label: 'Start typing', tone: 'text-slate-400', pct: 0 };
    if (length > 0) {
      if (isCommon || length < 6) verdict = { label: 'Critical', tone: 'text-red-400', pct: 12 };
      else if (entropy < 36) verdict = { label: 'Weak', tone: 'text-orange-400', pct: 30 };
      else if (entropy < 60) verdict = { label: 'Fair', tone: 'text-amber-300', pct: 50 };
      else if (entropy < 90) verdict = { label: 'Strong', tone: 'text-emerald-400', pct: 75 };
      else verdict = { label: 'Very strong', tone: 'text-emerald-300', pct: 100 };
    }

    return {
      length,
      pool,
      entropy,
      seconds,
      crackTime: humanise(seconds),
      verdict,
      problems,
      checks: [
        { label: '12+ characters', pass: length >= 12 },
        { label: '16+ characters', pass: length >= 16 },
        { label: 'Uppercase', pass: upper },
        { label: 'Lowercase', pass: lower },
        { label: 'Digit', pass: digit },
        { label: 'Symbol', pass: symbol },
        { label: 'Not a known password', pass: length > 0 && !isCommon },
        { label: 'No obvious sequence', pass: length > 0 && !sequential && !repeated },
      ],
    };
  }, [password, guessesPerSecond]);

  return (
    <div className="space-y-5">
      <Panel>
        <div className="flex items-end justify-between gap-3">
          <label className="block flex-1">
            <span className="mb-1.5 block text-xs font-semibold uppercase tracking-wider text-slate-400">
              Password to test
            </span>
            <input
              type={visible ? 'text' : 'password'}
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Type or paste a password…"
              autoComplete="off"
              spellCheck="false"
              className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400"
            />
          </label>
          <button
            type="button"
            onClick={() => setVisible((v) => !v)}
            className="rounded-xl border border-slate-700 bg-navy-950 px-3 py-2.5 text-xs text-slate-300 hover:border-slate-500"
          >
            {visible ? 'Hide' : 'Show'}
          </button>
        </div>

        <div className="mt-4 h-2 overflow-hidden rounded-full bg-slate-800">
          <div className={`h-full rounded-full transition-all ${analysis.verdict.pct >= 75 ? 'bg-emerald-500' : analysis.verdict.pct >= 50 ? 'bg-amber-400' : 'bg-red-500'}`} style={{ width: `${analysis.verdict.pct}%` }} />
        </div>

        <div className="mt-4 grid gap-3 sm:grid-cols-3">
          <Stat label="Verdict" value={analysis.verdict.label} tone={analysis.verdict.tone} />
          <Stat label="Entropy" value={`${analysis.entropy.toFixed(1)} bits`} hint={`Character pool of ${analysis.pool}`} />
          <Stat label="Offline crack time" value={analysis.crackTime} hint={`at ${guessesPerSecond.toExponential(0)} guesses/sec`} tone="text-cyan-300" />
        </div>

        <div className="mt-4 flex flex-wrap items-center gap-2 text-[11px] text-slate-500">
          <span>Threat model:</span>
          {[
            { label: 'Online form (10³/s)', value: 1e3 },
            { label: 'Hashed dump (10¹⁰/s)', value: 1e10 },
            { label: 'GPU rig (10¹²/s)', value: 1e12 },
          ].map((option) => (
            <button
              key={option.value}
              type="button"
              onClick={() => setGuessesPerSecond(option.value)}
              className={`rounded-md border px-2 py-1 transition ${guessesPerSecond === option.value ? 'border-electric-500 text-white' : 'border-slate-700 text-slate-400 hover:text-white'}`}
            >
              {option.label}
            </button>
          ))}
        </div>

        <div className="mt-4">
          <Callout tone="warn">
            Everything runs in this tab. Nothing is sent anywhere — which is also why you should still never paste a password you actually use into any website you do not control.
          </Callout>
        </div>
      </Panel>

      <div className="grid gap-5 lg:grid-cols-2">
        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Checks</h2>
          <ul className="grid gap-2 sm:grid-cols-2">
            {analysis.checks.map((check) => (
              <li key={check.label} className="flex items-center gap-2 text-xs">
                <span className={`inline-flex h-4 w-4 items-center justify-center rounded-full text-[10px] ${check.pass ? 'bg-emerald-500/20 text-emerald-400' : 'bg-slate-800 text-slate-500'}`}>
                  {check.pass ? '✓' : '–'}
                </span>
                <span className={check.pass ? 'text-slate-300' : 'text-slate-500'}>{check.label}</span>
              </li>
            ))}
          </ul>
        </Panel>

        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">What to fix</h2>
          {analysis.problems.length === 0 ? (
            <p className="text-xs text-emerald-300">
              No structural weaknesses found. Store it in a password manager and use a unique value per site.
            </p>
          ) : (
            <ul className="space-y-2 text-xs text-slate-400">
              {analysis.problems.map((problem) => (
                <li key={problem} className="flex gap-2">
                  <span className="text-amber-400">•</span>
                  <span>{problem}</span>
                </li>
              ))}
            </ul>
          )}
        </Panel>
      </div>
    </div>
  );
};

export default PasswordStrength;
