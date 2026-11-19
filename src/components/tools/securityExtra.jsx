import React, { useMemo, useState } from 'react';
import { Callout, Field, Panel, Stat } from './toolUi';
import { InfoList } from './kit';

const bufferToHex = (buffer) =>
  Array.from(new Uint8Array(buffer)).map((byte) => byte.toString(16).padStart(2, '0')).join('');

const ALGOS = [
  { value: 'SHA-256', label: 'SHA-256 (recommended)' },
  { value: 'SHA-512', label: 'SHA-512' },
  { value: 'SHA-1', label: 'SHA-1 (legacy, broken)' },
];

export const HashGenerator = () => {
  const [text, setText] = useState('RTechLab-Student-2026');
  const [algo, setAlgo] = useState('SHA-256');
  const [hashes, setHashes] = useState(null);
  const [busy, setBusy] = useState(false);

  const generate = async () => {
    if (typeof crypto === 'undefined' || !crypto.subtle) return;
    setBusy(true);
    const data = new TextEncoder().encode(text || '');
    const result = {};
    for (const name of ['SHA-1', 'SHA-256', 'SHA-512']) {
      const digest = await crypto.subtle.digest(name, data);
      result[name] = bufferToHex(digest);
    }
    setHashes(result);
    setBusy(false);
  };

  const primary = hashes?.[algo];

  return (
    <div className="space-y-5">
      <Panel>
        <Field label="Text to hash">
          <textarea
            rows={4}
            value={text}
            onChange={(event) => setText(event.target.value)}
            className="w-full resize-y rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-xs text-white outline-none focus:border-electric-400"
          />
        </Field>
        <div className="mt-3 flex flex-wrap items-center gap-3">
          <select value={algo} onChange={(event) => setAlgo(event.target.value)} className="cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3 py-2 font-mono text-xs text-cyan-300 outline-none">
            {ALGOS.map((item) => (
              <option key={item.value} value={item.value}>{item.label}</option>
            ))}
          </select>
          <button type="button" onClick={generate} disabled={busy} className="rounded-xl bg-electric-600 px-4 py-2 text-xs font-semibold text-white hover:bg-electric-500 disabled:bg-slate-800">
            {busy ? 'Hashing…' : 'Generate hashes'}
          </button>
          <span className="text-[11px] text-slate-500">Runs locally with the Web Crypto API</span>
        </div>

        {primary && (
          <div className="mt-5 space-y-2">
            <div className="rounded-xl border border-slate-800 bg-navy-950 p-3">
              <span className="text-[10px] uppercase tracking-wider text-slate-500">{algo}</span>
              <code className="mt-1 block break-all font-mono text-xs text-emerald-300">{primary}</code>
            </div>
            {hashes['SHA-1'] && (
              <p className="break-all font-mono text-[10px] text-slate-600">SHA-1: {hashes['SHA-1']}</p>
            )}
            {hashes['SHA-512'] && (
              <p className="break-all font-mono text-[10px] text-slate-600">SHA-512: {hashes['SHA-512']}</p>
            )}
          </div>
        )}
      </Panel>
      <InfoList
        title="Where hashes are used"
        items={[
          'Password storage: a server stores the hash, never the password, so a database leak does not reveal passwords.',
          'File integrity: vendors publish a SHA-256 value so you can prove a download was not altered.',
          'Digital signatures and certificates: the signature is over a hash, not the whole file.',
          'MD5 and SHA-1 are broken for security use — use SHA-256 or better.',
        ]}
      />
    </div>
  );
};

export const FileChecksum = () => {
  const [file, setFile] = useState(null);
  const [expected, setExpected] = useState('');
  const [result, setResult] = useState(null);
  const [busy, setBusy] = useState(false);

  const run = async () => {
    if (!file || typeof crypto === 'undefined' || !crypto.subtle) return;
    setBusy(true);
    const buffer = await file.arrayBuffer();
    const digest = await crypto.subtle.digest('SHA-256', buffer);
    const hex = bufferToHex(digest);
    const match = expected.trim() ? hex.toLowerCase() === expected.trim().toLowerCase().replace(/[^0-9a-f]/g, '') : null;
    setResult({ hex, match, size: file.size, name: file.name });
    setBusy(false);
  };

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-2">
          <Field label="File" hint="Stays on your machine — nothing is uploaded">
            <input
              type="file"
              onChange={(event) => { setFile(event.target.files?.[0] || null); setResult(null); }}
              className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3 py-2 text-xs text-slate-300 file:mr-3 file:rounded-lg file:border-0 file:bg-slate-800 file:px-3 file:py-1.5 file:text-xs file:text-white"
            />
          </Field>
          <Field label="Expected SHA-256 (optional)" hint="Paste the value published by the vendor">
            <input value={expected} onChange={(event) => setExpected(event.target.value)} placeholder="e.g. 3f5a…" className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-xs text-white outline-none focus:border-electric-400" />
          </Field>
        </div>
        <button type="button" onClick={run} disabled={!file || busy} className="mt-4 rounded-xl bg-electric-600 px-4 py-2 text-xs font-semibold text-white hover:bg-electric-500 disabled:bg-slate-800">
          {busy ? 'Calculating…' : 'Verify checksum'}
        </button>

        {result && (
          <div className="mt-5 space-y-3">
            <div className="grid gap-3 sm:grid-cols-3">
              <Stat label="File" value={result.name} />
              <Stat label="Size" value={`${(result.size / 1024).toFixed(1)} KB`} />
              <Stat
                label="Verdict"
                value={result.match === null ? 'Hash computed' : result.match ? 'Match' : 'Mismatch'}
                tone={result.match === null ? 'text-cyan-300' : result.match ? 'text-emerald-400' : 'text-red-400'}
              />
            </div>
            <div className="rounded-xl border border-slate-800 bg-navy-950 p-3">
              <span className="text-[10px] uppercase tracking-wider text-slate-500">SHA-256</span>
              <code className="mt-1 block break-all font-mono text-[11px] text-emerald-300">{result.hex}</code>
            </div>
          </div>
        )}
      </Panel>
      <Callout tone="warn">
        A mismatch means the file is not byte-identical to the published one: a partial download, a different build, or tampering. Never run an installer that fails its checksum.
      </Callout>
    </div>
  );
};

const decodePart = (part) => {
  const padded = part.replace(/-/g, '+').replace(/_/g, '/').padEnd(Math.ceil(part.length / 4) * 4, '=');
  const decoded = atob(padded);
  try {
    return JSON.stringify(JSON.parse(decodeURIComponent(escape(decoded))), null, 2);
  } catch {
    return decoded;
  }
};

export const JwtDecoder = () => {
  const [token, setToken] = useState('');

  const result = useMemo(() => {
    const value = token.trim();
    if (!value) return null;
    const parts = value.split('.');
    if (parts.length !== 3) return { error: 'A JWT has exactly three parts separated by dots: header.payload.signature' };
    try {
      const header = JSON.parse(decodePart(parts[0]));
      const payload = JSON.parse(decodePart(parts[1]));
      const exp = payload.exp;
      const iat = payload.iat;
      return {
        header: decodePart(parts[0]),
        payload: decodePart(parts[1]),
        algorithm: header.alg,
        expires: exp ? new Date(exp * 1000).toISOString() : null,
        issued: iat ? new Date(iat * 1000).toISOString() : null,
      };
    } catch {
      return { error: 'Could not decode the token. It may be truncated or not a JWT at all.' };
    }
  }, [token]);

  return (
    <div className="space-y-5">
      <Panel>
        <Field label="Paste the token">
          <textarea
            rows={4}
            value={token}
            onChange={(event) => setToken(event.target.value)}
            placeholder="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjMifQ.signature"
            className="w-full resize-y rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-[11px] text-white outline-none focus:border-electric-400"
          />
        </Field>

        {result?.error && (
          <div className="mt-4">
            <Callout tone="error">{result.error}</Callout>
          </div>
        )}

        {result && !result.error && (
          <>
            <div className="mt-4 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
              <Stat label="Algorithm" value={result.algorithm || '—'} tone="text-cyan-300" />
              <Stat label="Issued at" value={result.issued ? result.issued.slice(0, 19).replace('T', ' ') : '—'} />
              <Stat label="Expires" value={result.expires ? result.expires.slice(0, 19).replace('T', ' ') : '—'} />
              <Stat label="Signature" value="Not verified" hint="Decoding is not verification" tone="text-amber-300" />
            </div>
            <div className="mt-4 grid gap-3 lg:grid-cols-2">
              <div className="rounded-xl border border-slate-800 bg-navy-950 p-3">
                <span className="text-[10px] uppercase tracking-wider text-slate-500">Header</span>
                <pre className="mt-1 overflow-x-auto font-mono text-[11px] text-cyan-300">{result.header}</pre>
              </div>
              <div className="rounded-xl border border-slate-800 bg-navy-950 p-3">
                <span className="text-[10px] uppercase tracking-wider text-slate-500">Payload</span>
                <pre className="mt-1 overflow-x-auto font-mono text-[11px] text-emerald-300">{result.payload}</pre>
              </div>
            </div>
          </>
        )}
      </Panel>
      <Callout tone="warn">
        Decoding is not verification. Anyone can read a JWT payload — never put secrets in it. A server must still verify the signature, and “Valid” here only means the expiry date has not passed.
      </Callout>
    </div>
  );
};

const SETS = [
  { key: 'lower', label: 'Lowercase a–z', chars: 'abcdefghijklmnopqrstuvwxyz' },
  { key: 'upper', label: 'Uppercase A–Z', chars: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' },
  { key: 'digits', label: 'Digits 0–9', chars: '0123456789' },
  { key: 'symbols', label: 'Symbols !@#$%', chars: '!@#$%^&*()-_=+[]{};:,.?' },
];

const PHRASE_WORDS = ['orbit', 'packet', 'router', 'copper', 'signal', 'kernel', 'socket', 'buffer', 'switch', 'packet', 'static', 'subnet', 'tunnel', 'vector', 'matrix', 'anchor', 'battery', 'cipher', 'domain', 'engine', 'fabric', 'gateway', 'harbor', 'island', 'jungle', 'kernel', 'lantern', 'module', 'network', 'ocean', 'pixel', 'quartz', 'rocket', 'silver', 'tiger', 'umbrella', 'velvet', 'window', 'xenon', 'yonder', 'zephyr'];

export const PasswordGenerator = () => {
  const [mode, setMode] = useState('password');
  const [length, setLength] = useState(16);
  const [words, setWords] = useState(4);
  const [sets, setSets] = useState({ lower: true, upper: true, digits: true, symbols: true });
  const [output, setOutput] = useState('');

  const generate = () => {
    const randomIndex = (max) => {
      if (typeof crypto !== 'undefined' && crypto.getRandomValues) {
        const buffer = new Uint32Array(1);
        crypto.getRandomValues(buffer);
        return buffer[0] % max;
      }
      return Math.floor(Math.random() * max);
    };

    if (mode === 'passphrase') {
      const picked = [];
      for (let index = 0; index < Number(words); index += 1) {
        picked.push(PHRASE_WORDS[randomIndex(PHRASE_WORDS.length)]);
      }
      setOutput(picked.join('-'));
      return;
    }

    const pool = SETS.filter((item) => sets[item.key]).map((item) => item.chars).join('');
    if (!pool) {
      setOutput('');
      return;
    }
    let value = '';
    for (let index = 0; index < Number(length); index += 1) {
      value += pool[randomIndex(pool.length)];
    }
    setOutput(value);
  };

  return (
    <div className="space-y-5">
      <Panel>
        <div className="flex flex-wrap gap-2">
          {[{ id: 'password', label: 'Random password' }, { id: 'passphrase', label: 'Memorable passphrase' }].map((item) => (
            <button key={item.id} type="button" onClick={() => setMode(item.id)} className={`rounded-xl px-3.5 py-1.5 text-xs font-semibold transition ${mode === item.id ? 'bg-electric-600 text-white' : 'border border-slate-700 text-slate-400'}`}>
              {item.label}
            </button>
          ))}
        </div>

        {mode === 'password' ? (
          <div className="mt-4 space-y-3">
            <Field label={`Length: ${length} characters`}>
              <input type="range" min="8" max="64" value={length} onChange={(event) => setLength(event.target.value)} className="w-full accent-electric-500" />
            </Field>
            <div className="grid gap-2 sm:grid-cols-2">
              {SETS.map((item) => (
                <label key={item.key} className="flex cursor-pointer items-center gap-2 text-xs text-slate-300">
                  <input type="checkbox" checked={sets[item.key]} onChange={(event) => setSets((prev) => ({ ...prev, [item.key]: event.target.checked }))} className="h-4 w-4 accent-electric-500" />
                  {item.label}
                </label>
              ))}
            </div>
          </div>
        ) : (
          <div className="mt-4">
            <Field label={`Words: ${words}`} hint="Four to five words is stronger and easier to remember">
              <input type="range" min="3" max="8" value={words} onChange={(event) => setWords(event.target.value)} className="w-full accent-electric-500" />
            </Field>
          </div>
        )}

        <button type="button" onClick={generate} className="mt-4 rounded-xl bg-electric-600 px-5 py-2.5 text-sm font-semibold text-white hover:bg-electric-500">
          Generate
        </button>

        {output && (
          <div className="mt-4 rounded-xl border border-slate-800 bg-navy-950 p-4">
            <code className="block break-all font-mono text-base text-emerald-300">{output}</code>
            <p className="mt-2 text-[11px] text-slate-500">Copy this into your password manager now. If you share it, generate a new one.</p>
          </div>
        )}
      </Panel>
      <Callout tone="info">
        Length beats complexity: 16 random characters or a 4-word passphrase both resist offline attacks far better than a short “P@ssw0rd”. Use a unique password per site.
      </Callout>
    </div>
  );
};

const METRICS = {
  AV: { label: 'Attack vector', options: [['N', 'Network', 0.85], ['A', 'Adjacent', 0.62], ['L', 'Local', 0.55], ['P', 'Physical', 0.2]] },
  AC: { label: 'Attack complexity', options: [['L', 'Low', 0.77], ['H', 'High', 0.44]] },
  PR: { label: 'Privileges required', options: [['N', 'None', 0.85], ['L', 'Low', 0.62], ['H', 'High', 0.27]] },
  UI: { label: 'User interaction', options: [['N', 'None', 0.85], ['R', 'Required', 0.62]] },
  S: { label: 'Scope', options: [['U', 'Unchanged', 0], ['C', 'Changed', 0]] },
  C: { label: 'Confidentiality', options: [['H', 'High', 0.56], ['L', 'Low', 0.22], ['N', 'None', 0]] },
  I: { label: 'Integrity', options: [['H', 'High', 0.56], ['L', 'Low', 0.22], ['N', 'None', 0]] },
  A: { label: 'Availability', options: [['H', 'High', 0.56], ['L', 'Low', 0.22], ['N', 'None', 0]] },
};

const roundUp = (value) => Math.ceil(value * 10) / 10;

export const CvssCalculator = () => {
  const [values, setValues] = useState({ AV: 'N', AC: 'L', PR: 'N', UI: 'N', S: 'U', C: 'H', I: 'H', A: 'H' });

  const result = useMemo(() => {
    const weight = (key) => {
      const metric = METRICS[key];
      const found = metric.options.find((option) => option[0] === values[key]);
      return found ? found[2] : 0;
    };
    const scopeChanged = values.S === 'C';
    const prValue = scopeChanged
      ? { N: 0.85, L: 0.68, H: 0.5 }[values.PR]
      : { N: 0.85, L: 0.62, H: 0.27 }[values.PR];

    const iss = 1 - ((1 - weight('C')) * (1 - weight('I')) * (1 - weight('A')));
    const impact = scopeChanged
      ? 7.52 * (iss - 0.029) - 3.25 * Math.pow(iss - 0.02, 15)
      : 6.42 * iss;
    const exploitability = 8.22 * weight('AV') * weight('AC') * prValue * weight('UI');

    let score = 0;
    if (impact > 0) {
      score = scopeChanged
        ? roundUp(Math.min(1.08 * (impact + exploitability), 10))
        : roundUp(Math.min(impact + exploitability, 10));
    }

    const severity = score === 0 ? 'None' : score < 4 ? 'Low' : score < 7 ? 'Medium' : score < 9 ? 'High' : 'Critical';
    const vector = `CVSS:3.1/AV:${values.AV}/AC:${values.AC}/PR:${values.PR}/UI:${values.UI}/S:${values.S}/C:${values.C}/I:${values.I}/A:${values.A}`;
    return { score: score.toFixed(1), severity, vector, impact: impact.toFixed(2), exploitability: exploitability.toFixed(2) };
  }, [values]);

  const tone = { None: 'text-slate-400', Low: 'text-emerald-400', Medium: 'text-amber-300', High: 'text-orange-400', Critical: 'text-red-400' }[result.severity];

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {Object.entries(METRICS).map(([key, metric]) => (
            <Field key={key} label={metric.label}>
              <select
                value={values[key]}
                onChange={(event) => setValues((prev) => ({ ...prev, [key]: event.target.value }))}
                className="w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3 py-2.5 font-mono text-xs text-cyan-300 outline-none"
              >
                {metric.options.map((option) => (
                  <option key={option[0]} value={option[0]}>{option[1]}</option>
                ))}
              </select>
            </Field>
          ))}
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-4">
          <Stat label="Base score" value={result.score} tone={tone} />
          <Stat label="Severity" value={result.severity} tone={tone} />
          <Stat label="Impact" value={result.impact} />
          <Stat label="Exploitability" value={result.exploitability} />
        </div>

        <div className="mt-4 rounded-xl border border-slate-800 bg-navy-950 p-3">
          <span className="text-[10px] uppercase tracking-wider text-slate-500">Vector string for your report</span>
          <code className="mt-1 block break-all font-mono text-[11px] text-emerald-300">{result.vector}</code>
        </div>
      </Panel>
    </div>
  );
};
