import React, { useMemo, useState } from 'react';
import { Callout, Field, Panel, Stat } from './toolUi';

// Published list prices per 1M tokens, rounded. Editable so the tool stays
// useful after a provider changes its pricing page.
const MODELS = [
  { id: 'mini', label: 'Small / mini tier', input: 0.15, output: 0.6 },
  { id: 'flash', label: 'Fast tier (Flash / Haiku class)', input: 0.35, output: 1.4 },
  { id: 'mid', label: 'Mid tier (4o / Sonnet class)', input: 2.5, output: 10 },
  { id: 'pro', label: 'Frontier tier (Opus / o-series class)', input: 15, output: 60 },
];

const inputCls =
  'w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400';

const money = (value) =>
  value < 0.01 && value > 0
    ? `$${value.toFixed(5)}`
    : value.toLocaleString('en-US', { style: 'currency', currency: 'USD', maximumFractionDigits: 2 });

export const AiTokenCalculator = () => {
  const [text, setText] = useState('Explain the difference between TCP and UDP for a CCNA interview in about 150 words.');
  const [outputTokens, setOutputTokens] = useState(300);
  const [callsPerDay, setCallsPerDay] = useState(200);
  const [model, setModel] = useState('mid');
  const [custom, setCustom] = useState(null);

  const prices = custom || MODELS.find((item) => item.id === model);

  const result = useMemo(() => {
    const chars = text.length;
    const words = text.trim() ? text.trim().split(/\s+/).length : 0;
    // Two heuristics: ~4 characters per token, ~1.33 tokens per English word.
    const byChars = chars / 4;
    const byWords = words * 1.33;
    const inputTokens = Math.round(Math.max(byChars, byWords));
    const out = Math.max(0, Number(outputTokens) || 0);
    const perCall = (inputTokens / 1e6) * prices.input + (out / 1e6) * prices.output;
    const daily = perCall * (Number(callsPerDay) || 0);
    return {
      chars,
      words,
      inputTokens,
      outputTokens: out,
      totalTokens: inputTokens + out,
      perCall,
      daily,
      monthly: daily * 30,
      yearly: daily * 365,
    };
  }, [text, outputTokens, callsPerDay, prices]);

  const updatePrice = (key, value) => {
    setCustom({ ...prices, [key]: Number(value) || 0 });
  };

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-2">
          <Field label="Prompt / system message" hint="Paste the text you plan to send">
            <textarea
              rows={6}
              value={text}
              onChange={(e) => setText(e.target.value)}
              className="w-full resize-y rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-xs text-white outline-none focus:border-electric-400"
            />
          </Field>
          <div className="space-y-4">
            <Field label="Expected output tokens per call">
              <input type="number" min="0" value={outputTokens} onChange={(e) => setOutputTokens(e.target.value)} className={inputCls} />
            </Field>
            <Field label="Calls per day">
              <input type="number" min="0" value={callsPerDay} onChange={(e) => setCallsPerDay(e.target.value)} className={inputCls} />
            </Field>
            <Field label="Price tier">
              <select value={model} onChange={(e) => { setModel(e.target.value); setCustom(null); }} className="w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-cyan-300 outline-none">
                {MODELS.map((item) => (
                  <option key={item.id} value={item.id}>
                    {item.label} — ${item.input}/${item.output} per 1M
                  </option>
                ))}
              </select>
            </Field>
          </div>
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-4">
          <Stat label="Input tokens" value={result.inputTokens.toLocaleString()} hint={`${result.chars} chars · ${result.words} words`} tone="text-cyan-300" />
          <Stat label="Tokens per call" value={result.totalTokens.toLocaleString()} hint="input + expected output" />
          <Stat label="Cost per call" value={money(result.perCall)} />
          <Stat label="Cost per month" value={money(result.monthly)} hint={`${result.callsPerDay} calls/day`} tone="text-emerald-400" />
        </div>

        <div className="mt-4 grid gap-3 sm:grid-cols-2">
          <Stat label="Cost per day" value={money(result.daily)} />
          <Stat label="Cost per year" value={money(result.yearly)} />
        </div>
      </Panel>

      <div className="grid gap-5 lg:grid-cols-2">
        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Price per 1M tokens (editable)</h2>
          <div className="grid gap-3 sm:grid-cols-2">
            <Field label="Input $/1M"><input type="number" step="0.01" value={prices.input} onChange={(e) => updatePrice('input', e.target.value)} className={inputCls} /></Field>
            <Field label="Output $/1M"><input type="number" step="0.01" value={prices.output} onChange={(e) => updatePrice('output', e.target.value)} className={inputCls} /></Field>
          </div>
          <div className="mt-4">
            <Callout tone="warn">
              Token counts are estimates. Every provider has its own tokenizer; code, Hindi/Devanagari text and JSON usually need more tokens per character than plain English. Always confirm with the provider&apos;s tokenizer before you budget.
            </Callout>
          </div>
        </Panel>

        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">What actually drives the bill</h2>
          <ul className="space-y-2 text-xs leading-relaxed text-slate-400">
            <li><span className="text-white">Output costs 3–4× input.</span> Trim verbose answers with a max-token limit before you negotiate price.</li>
            <li><span className="text-white">History is billed every call.</span> A 20-message chat resends the whole context each turn, so cost grows with the square of the conversation.</li>
            <li><span className="text-white">Caching changes the maths.</span> Providers that cache a repeated system prompt can cut the input price by 50–90 %.</li>
            <li><span className="text-white">Batch beats realtime.</span> Offline batch jobs are typically half price on the same model.</li>
          </ul>
          <div className="mt-4">
            <Callout tone="info">
              Your current setup: {result.callsPerDay} calls/day of roughly {result.inputTokens.toLocaleString()} input tokens costs about {money(result.monthly)} a month on the {prices === custom ? 'custom' : MODELS.find((m) => m.id === model).label.toLowerCase()} pricing.
            </Callout>
          </div>
        </Panel>
      </div>
    </div>
  );
};

export default AiTokenCalculator;
