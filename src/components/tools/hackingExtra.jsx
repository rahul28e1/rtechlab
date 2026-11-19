import React, { useMemo, useState } from 'react';
import { FormTool, InfoList } from './kit';
import { Callout, Field, Panel } from './toolUi';

const SCAN_TYPES = [
  { value: '-sS', label: 'SYN scan (stealth, needs root)', note: 'Half-open scan; fastest and most common in labs.' },
  { value: '-sT', label: 'TCP connect scan (no root)', note: 'Full handshake using the OS; works without privileges.' },
  { value: '-sU', label: 'UDP scan', note: 'Slow and noisy; use --top-ports to keep it manageable.' },
  { value: '-sn', label: 'Ping sweep only', note: 'Finds live hosts without scanning ports.' },
];

export const NmapBuilder = () => (
  <FormTool
    fields={[
      { key: 'target', label: 'Target', type: 'text', default: '192.168.1.0/24', placeholder: '192.168.1.10 or 10.0.0.0/24' },
      { key: 'scan', label: 'Scan type', type: 'select', default: '-sS', options: SCAN_TYPES.map((item) => ({ value: item.value, label: item.label })) },
      { key: 'ports', label: 'Ports', type: 'select', default: 'top', options: [
        { value: 'top', label: 'Top 1000 (default)' },
        { value: 'all', label: 'All 65535 (-p-)' },
        { value: 'common', label: 'Common services (--top-ports 100)' },
        { value: 'web', label: 'Web only (80,443,8080,8443)' },
        { value: 'custom', label: 'Custom list' },
      ] },
      { key: 'custom', label: 'Custom ports', type: 'text', default: '22,80,443', hint: 'Used only when “Custom list” is selected' },
      { key: 'version', label: 'Service/version detection', type: 'checkbox', checkboxLabel: 'Banner and version detection (-sV)', default: true },
      { key: 'os', label: 'OS detection', type: 'checkbox', checkboxLabel: 'OS fingerprinting (-O)', default: false },
      { key: 'script', label: 'Default scripts', type: 'checkbox', checkboxLabel: 'Run default NSE scripts (-sC)', default: false },
      { key: 'timing', label: 'Timing', type: 'select', default: 'T4', options: [
        { value: 'T3', label: 'T3 — normal' },
        { value: 'T4', label: 'T4 — aggressive (lab default)' },
        { value: 'T2', label: 'T2 — polite (production)' },
      ] },
      { key: 'output', label: 'Save output', type: 'checkbox', checkboxLabel: 'Write normal and XML output (-oA)', default: false },
    ]}
    compute={(values) => {
      if (!values.target?.trim()) return { error: 'Enter a target host, range or subnet.' };
      const parts = [values.scan];
      if (values.ports === 'all') parts.push('-p-');
      else if (values.ports === 'common') parts.push('--top-ports 100');
      else if (values.ports === 'web') parts.push('-p 80,443,8080,8443');
      else if (values.ports === 'custom') parts.push(`-p ${values.custom || '22,80,443'}`);
      if (values.version) parts.push('-sV');
      if (values.os) parts.push('-O');
      if (values.script) parts.push('-sC');
      parts.push(`-${values.timing}`);
      const command = `nmap ${parts.join(' ')} ${values.target.trim()}`;
      const withOutput = `${command} -oA scan-${new Date().toISOString().slice(0, 10)}`;
      return {
        stats: [
          { label: 'Scan type', value: SCAN_TYPES.find((item) => item.value === values.scan)?.value || '' },
          { label: 'Ports', value: values.ports === 'all' ? '65535' : values.ports === 'top' ? '1000' : values.ports },
          { label: 'Needs root', value: values.scan === '-sS' || values.os ? 'Yes' : 'No', tone: values.scan === '-sS' || values.os ? 'text-amber-300' : 'text-emerald-400' },
        ],
        lines: [
          { label: 'Command', value: command },
          ...(values.output ? [{ label: 'With output files', value: withOutput }] : []),
          { label: 'Why this scan', value: SCAN_TYPES.find((item) => item.value === values.scan)?.note || '' },
        ],
        note: 'Only scan systems you own or have written permission to test. Unauthorised scanning is illegal in most countries, including under India’s IT Act.',
        noteTone: 'warn',
      };
    }}
  >
    <InfoList
      title="Reading the result"
      items={[
        'open — a service is listening and accepted the connection.',
        'closed — the host replied but nothing is listening on that port.',
        'filtered — a firewall dropped the probe; there is no reply at all.',
        'Always run one version detection scan before writing a finding: the banner is what proves which service and version is exposed.',
      ]}
    />
  </FormTool>
);

const SUFFIXES = ['', '1', '123', '1234', '2024', '2025', '2026', '!', '@', '#', '01', '07'];

export const WordlistGenerator = () => {
  const [inputs, setInputs] = useState('rahul, rtechlab, cisco');
  const [years, setYears] = useState(true);
  const [symbols, setSymbols] = useState(true);
  const [caps, setCaps] = useState(true);

  const words = useMemo(() => {
    const bases = inputs
      .split(/[,\n]/)
      .map((item) => item.trim().toLowerCase())
      .filter(Boolean)
      .slice(0, 20);
    const out = new Set();
    bases.forEach((base) => {
      out.add(base);
      if (caps) out.add(base.charAt(0).toUpperCase() + base.slice(1));
      SUFFIXES.forEach((suffix) => {
        if (suffix === '' ) return;
        if (/^\d{4}$/.test(suffix) && !years) return;
        if (/[!@#]/.test(suffix) && !symbols) return;
        out.add(base + suffix);
        if (caps) out.add(base.charAt(0).toUpperCase() + base.slice(1) + suffix);
      });
    });
    return Array.from(out);
  }, [inputs, years, symbols, caps]);

  return (
    <div className="space-y-5">
      <Panel>
        <Field label="Base words" hint="One per line or comma separated — names, brand, city, pet">
          <textarea
            rows={3}
            value={inputs}
            onChange={(event) => setInputs(event.target.value)}
            className="w-full resize-y rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-xs text-white outline-none focus:border-electric-400"
          />
        </Field>
        <div className="mt-3 flex flex-wrap gap-4">
          {[
            { label: 'Add years (2024–2026)', value: years, set: setYears },
            { label: 'Add symbols (! @ #)', value: symbols, set: setSymbols },
            { label: 'Capitalise variants', value: caps, set: setCaps },
          ].map((option) => (
            <label key={option.label} className="flex cursor-pointer items-center gap-2 text-xs text-slate-300">
              <input type="checkbox" checked={option.value} onChange={(event) => option.set(event.target.checked)} className="h-4 w-4 accent-electric-500" />
              {option.label}
            </label>
          ))}
        </div>
        <div className="mt-4 flex items-center justify-between">
          <span className="text-xs text-slate-400">{words.length} candidate passwords</span>
          <button
            type="button"
            onClick={() => {
              if (typeof navigator !== 'undefined' && navigator.clipboard) navigator.clipboard.writeText(words.join('\n'));
            }}
            className="rounded-xl bg-electric-600 px-3.5 py-2 text-xs font-semibold text-white hover:bg-electric-500"
          >
            Copy list
          </button>
        </div>
        <pre className="mt-3 max-h-64 overflow-auto rounded-xl border border-slate-800 bg-navy-950 p-3 font-mono text-[11px] leading-relaxed text-slate-300">
{words.join('\n')}
        </pre>
      </Panel>
      <Callout tone="warn">
        Use this only on accounts and systems you own. The same patterns are why “name + 123” fails: attackers generate exactly these lists first.
      </Callout>
    </div>
  );
};

const rot13 = (text) =>
  text.replace(/[a-zA-Z]/g, (char) => {
    const code = char.charCodeAt(0);
    const base = code >= 97 ? 97 : 65;
    return String.fromCharCode(((code - base + 13) % 26) + base);
  });

const STEPS = [
  { value: 'base64-decode', label: 'Base64 decode' },
  { value: 'base64-encode', label: 'Base64 encode' },
  { value: 'hex-decode', label: 'Hex decode' },
  { value: 'hex-encode', label: 'Hex encode' },
  { value: 'url-decode', label: 'URL decode' },
  { value: 'url-encode', label: 'URL encode' },
  { value: 'rot13', label: 'ROT13' },
  { value: 'reverse', label: 'Reverse the string' },
];

const applyStep = (text, step) => {
  switch (step) {
    case 'base64-decode':
      return atob(text.trim());
    case 'base64-encode':
      return btoa(text);
    case 'hex-decode':
      return (text.replace(/[^0-9a-fA-F]/g, '').match(/.{2}/g) || [])
        .map((pair) => String.fromCharCode(parseInt(pair, 16)))
        .join('');
    case 'hex-encode':
      return Array.from(new TextEncoder().encode(text)).map((byte) => byte.toString(16).padStart(2, '0')).join(' ');
    case 'url-decode':
      return decodeURIComponent(text);
    case 'url-encode':
      return encodeURIComponent(text);
    case 'rot13':
      return rot13(text);
    case 'reverse':
      return text.split('').reverse().join('');
    default:
      return text;
  }
};

export const EncodingChain = () => {
  const [text, setText] = useState('SGVsbG8gUlRlY2hMYWI=');
  const [steps, setSteps] = useState(['base64-decode']);

  const run = useMemo(() => {
    const outputs = [];
    let current = text;
    for (const step of steps) {
      try {
        current = applyStep(current, step);
        outputs.push({ step, value: current });
      } catch {
        outputs.push({ step, value: '⚠ This step failed — the input is not valid for that encoding.' });
        break;
      }
    }
    return outputs;
  }, [text, steps]);

  return (
    <div className="space-y-5">
      <Panel>
        <Field label="Encoded input">
          <textarea
            rows={3}
            value={text}
            onChange={(event) => setText(event.target.value)}
            className="w-full resize-y rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-xs text-white outline-none focus:border-electric-400"
          />
        </Field>

        <div className="mt-4">
          <span className="mb-2 block text-xs font-semibold uppercase tracking-wider text-slate-400">Decoding steps, in order</span>
          <div className="flex flex-wrap gap-1.5">
            {STEPS.map((step) => (
              <button
                key={step.value}
                type="button"
                onClick={() => setSteps((prev) => [...prev, step.value])}
                className="rounded-md border border-slate-700 bg-navy-950 px-2.5 py-1 text-[11px] text-slate-300 hover:border-slate-500 hover:text-white"
              >
                + {step.label}
              </button>
            ))}
            {steps.length > 0 && (
              <button type="button" onClick={() => setSteps([])} className="rounded-md border border-red-500/40 px-2.5 py-1 text-[11px] text-red-300">
                Clear chain
              </button>
            )}
          </div>
        </div>

        {steps.length > 0 && (
          <div className="mt-4 space-y-2">
            {run.map((item, index) => (
              <div key={`${item.step}-${index}`} className="rounded-xl border border-slate-800 bg-navy-950 p-3">
                <span className="text-[10px] uppercase tracking-wider text-slate-500">Step {index + 1} · {item.step}</span>
                <pre className="mt-1 whitespace-pre-wrap break-all font-mono text-[11px] text-emerald-300">{item.value}</pre>
              </div>
            ))}
          </div>
        )}
      </Panel>
      <InfoList
        title="CTF habits that save time"
        items={[
          'Try Base64 first when you see text ending with = or == and only [A-Za-z0-9+/].',
          'Hex payloads are pairs of digits with spaces or 0x prefixes — 41 42 43 is "ABC".',
          'ROT13 keeps letters readable-looking; shifting it back twice returns the original.',
          'Note each step you apply. Chains are usually two or three encodings, not ten.',
        ]}
      />
    </div>
  );
};
