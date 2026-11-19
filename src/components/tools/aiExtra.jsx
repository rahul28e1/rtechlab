import React, { useMemo, useState } from 'react';
import { FormTool, InfoList } from './kit';
import { Callout, Field, Panel, Stat } from './toolUi';

export const JsonFormatter = () => {
  const [input, setInput] = useState('{"name":"RTechLab","tools":20,"topics":["CCNA","Linux"],"free":true}');
  const [mode, setMode] = useState('pretty');

  const result = useMemo(() => {
    if (!input.trim()) return { output: '', error: null, keys: 0 };
    try {
      const parsed = JSON.parse(input);
      const output = mode === 'pretty' ? JSON.stringify(parsed, null, 2) : JSON.stringify(parsed);
      const countKeys = (value) => {
        if (Array.isArray(value)) return value.reduce((sum, item) => sum + countKeys(item), 0);
        if (value && typeof value === 'object') return Object.keys(value).length + Object.values(value).reduce((sum, item) => sum + countKeys(item), 0);
        return 0;
      };
      return { output, error: null, keys: countKeys(parsed) };
    } catch (error) {
      return { output: '', error: error.message, keys: 0 };
    }
  }, [input, mode]);

  return (
    <div className="space-y-5">
      <Panel>
        <div className="mb-3 flex flex-wrap gap-2">
          {[{ id: 'pretty', label: 'Format (pretty)' }, { id: 'minify', label: 'Minify' }].map((item) => (
            <button key={item.id} type="button" onClick={() => setMode(item.id)} className={`rounded-xl px-3.5 py-1.5 text-xs font-semibold transition ${mode === item.id ? 'bg-electric-600 text-white' : 'border border-slate-700 text-slate-400'}`}>
              {item.label}
            </button>
          ))}
          {result.output && (
            <button type="button" onClick={() => { if (navigator.clipboard) navigator.clipboard.writeText(result.output); }} className="ml-auto rounded-xl border border-slate-700 px-3 py-1.5 text-xs text-slate-300 hover:text-white">
              Copy output
            </button>
          )}
        </div>
        <div className="grid gap-3 lg:grid-cols-2">
          <Field label="Paste JSON">
            <textarea rows={12} value={input} onChange={(event) => setInput(event.target.value)} className="w-full resize-y rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-[11px] text-white outline-none focus:border-electric-400" />
          </Field>
          <Field label="Result">
            <pre className="h-[276px] overflow-auto rounded-xl border border-slate-800 bg-navy-950 p-3 font-mono text-[11px] text-emerald-300">
{result.error ? '' : result.output}
            </pre>
          </Field>
        </div>
        {result.error ? (
          <div className="mt-3"><Callout tone="error">Invalid JSON: {result.error}</Callout></div>
        ) : (
          <p className="mt-3 text-[11px] text-slate-500">{input.length} characters · {result.keys} keys · valid JSON</p>
        )}
      </Panel>
      <InfoList
        title="The four JSON mistakes that break an API call"
        items={[
          'A trailing comma before } or ] — JSON does not allow it, JavaScript does.',
          'Single quotes instead of double quotes around keys.',
          'Unescaped newlines inside a string; use \\n instead.',
          'Comments — JSON has none. Remove the // lines some examples include.',
        ]}
      />
    </div>
  );
};

export const RegexTester = () => {
  const [pattern, setPattern] = useState('(\\d{1,3}\\.){3}\\d{1,3}');
  const [flags, setFlags] = useState('g');
  const [text, setText] = useState('Router 10.0.0.1, gateway 192.168.1.1, DNS 8.8.8.8');

  const result = useMemo(() => {
    if (!pattern) return { matches: [], error: null };
    try {
      const expression = new RegExp(pattern, flags.includes('g') ? flags : `${flags}g`);
      const matches = [];
      let match = expression.exec(text);
      let guard = 0;
      while (match && guard < 200) {
        matches.push({ value: match[0], index: match.index, groups: match.slice(1) });
        if (match.index === expression.lastIndex) expression.lastIndex += 1;
        match = expression.exec(text);
        guard += 1;
      }
      return { matches, error: null };
    } catch (error) {
      return { matches: [], error: error.message };
    }
  }, [pattern, flags, text]);

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-[2fr_1fr]">
          <Field label="Pattern" hint="No slashes needed — just the expression">
            <input value={pattern} onChange={(event) => setPattern(event.target.value)} className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-xs text-cyan-300 outline-none focus:border-electric-400" />
          </Field>
          <Field label="Flags" hint="g = all matches, i = case-insensitive, m = multiline">
            <input value={flags} onChange={(event) => setFlags(event.target.value.replace(/[^gimsuy]/g, ''))} className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-xs text-white outline-none focus:border-electric-400" />
          </Field>
        </div>
        <div className="mt-3">
          <Field label="Test text">
            <textarea rows={5} value={text} onChange={(event) => setText(event.target.value)} className="w-full resize-y rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-xs text-white outline-none focus:border-electric-400" />
          </Field>
        </div>

        {result.error ? (
          <div className="mt-3"><Callout tone="error">Invalid pattern: {result.error}</Callout></div>
        ) : (
          <>
            <div className="mt-4 grid gap-3 sm:grid-cols-3">
              <Stat label="Matches" value={result.matches.length} tone="text-emerald-400" />
              <Stat label="Expression" value={`/${pattern}/${flags}`} />
              <Stat label="Capture groups" value={result.matches[0]?.groups.length || 0} />
            </div>
            {result.matches.length > 0 && (
              <div className="mt-3 space-y-1.5">
                {result.matches.slice(0, 20).map((match, index) => (
                  <div key={`${match.index}-${index}`} className="flex items-center justify-between gap-3 rounded-lg border border-slate-800 bg-navy-950 px-3 py-2 font-mono text-[11px]">
                    <span className="text-emerald-300">{match.value}</span>
                    <span className="text-slate-500">at {match.index}{match.groups.length ? ` · groups: ${match.groups.join(', ')}` : ''}</span>
                  </div>
                ))}
              </div>
            )}
          </>
        )}
      </Panel>
      <InfoList
        title="Patterns worth keeping"
        items={[
          'IPv4: (\\d{1,3}\\.){3}\\d{1,3} — good for matching, not for validating ranges.',
          'Interface: ^(GigabitEthernet|FastEthernet)\\d/\\d+$',
          'Log level: \\b(ERROR|WARN|CRITICAL)\\b',
          'Email (simple): [\\w.+-]+@[\\w-]+\\.[\\w.]+',
        ]}
      />
    </div>
  );
};

export const EmbeddingCost = () => (
  <FormTool
    fields={[
      { key: 'docs', label: 'Documents', type: 'number', default: 500, min: 1 },
      { key: 'tokens', label: 'Tokens per chunk', type: 'number', default: 400, min: 16 },
      { key: 'chunks', label: 'Chunks per document', type: 'number', default: 5, min: 1 },
      { key: 'dims', label: 'Embedding dimensions', type: 'select', numeric: true, default: 1536, options: [
        { value: 384, label: '384 — small local model' },
        { value: 768, label: '768 — base model' },
        { value: 1536, label: '1536 — OpenAI small' },
        { value: 3072, label: '3072 — OpenAI large' },
      ] },
      { key: 'price', label: 'Embedding price ($/1M tokens)', type: 'number', default: 0.02, min: 0, step: 0.001 },
    ]}
    compute={({ docs, tokens, chunks, dims, price }) => {
      const documentCount = Number(docs) || 0;
      const chunkCount = Number(chunks) || 1;
      const tokenCount = Number(tokens) || 0;
      const vectors = documentCount * chunkCount;
      const totalTokens = vectors * tokenCount;
      const dimensions = Number(dims) || 1536;
      const bytes = vectors * dimensions * 4; // float32
      return {
        stats: [
          { label: 'Vectors', value: vectors.toLocaleString() },
          { label: 'Embedding tokens', value: totalTokens.toLocaleString() },
          { label: 'Index size', value: `${(bytes / (1024 * 1024)).toFixed(1)} MB`, tone: 'text-cyan-300' },
          { label: 'One-off cost', value: `$${((totalTokens / 1e6) * price).toFixed(2)}`, tone: 'text-emerald-400' },
        ],
        lines: [
          { label: 'Per-query cost', value: `$${(((tokenCount / 4) / 1e6) * price).toFixed(6)}` },
          { label: 'Storage per vector', value: `${(dimensions * 4).toLocaleString()} bytes` },
          { label: 'With 10% growth buffer', value: `${((bytes / (1024 * 1024)) * 1.1).toFixed(1)} MB` },
        ],
        note: 'Embedding is cheap; keeping thousands of stale vectors is not. Re-embed only changed documents and store the source hash next to each vector.',
      };
    }}
  />
);

export const RagChunkPlanner = () => (
  <FormTool
    fields={[
      { key: 'size', label: 'Document size (pages)', type: 'number', default: 40, min: 1 },
      { key: 'wordsPerPage', label: 'Words per page', type: 'number', default: 450, min: 50 },
      { key: 'chunk', label: 'Chunk size (tokens)', type: 'number', default: 400, min: 50 },
      { key: 'overlap', label: 'Overlap (tokens)', type: 'number', default: 50, min: 0 },
    ]}
    compute={({ size, wordsPerPage, chunk, overlap }) => {
      const totalWords = (Number(size) || 0) * (Number(wordsPerPage) || 0);
      const totalTokens = Math.round(totalWords * 1.33);
      const chunkSize = Number(chunk) || 400;
      const overlapSize = Number(overlap) || 0;
      if (overlapSize >= chunkSize) return { error: 'Overlap must be smaller than the chunk size.' };
      const effective = chunkSize - overlapSize;
      const chunks = Math.ceil(totalTokens / Math.max(effective, 1));
      return {
        stats: [
          { label: 'Total tokens', value: totalTokens.toLocaleString() },
          { label: 'Chunks', value: chunks.toLocaleString(), tone: 'text-cyan-300' },
          { label: 'Overlap cost', value: `${Math.round((overlapSize / chunkSize) * 100)}%`, hint: 'Extra storage and embedding spend' },
          { label: 'Recommended top-k', value: Math.max(3, Math.ceil(2000 / chunkSize)), tone: 'text-emerald-400' },
        ],
        lines: [
          { label: 'Effective tokens per chunk', value: effective.toLocaleString() },
          { label: 'Words per chunk', value: Math.round(effective / 1.33).toLocaleString() },
          { label: 'Context used by top-k', value: `${(Math.max(3, Math.ceil(2000 / chunkSize)) * chunkSize).toLocaleString()} tokens` },
        ],
        note: 'Overlap stops an answer being cut in half at a boundary. 10–15% is enough; more just multiplies cost. Retrieval quality usually improves more from better headings than from bigger chunks.',
      };
    }}
  />
);

export const ContextWindow = () => (
  <FormTool
    fields={[
      { key: 'window', label: 'Model context window', type: 'select', numeric: true, default: 128000, options: [
        { value: 8192, label: '8K' },
        { value: 32768, label: '32K' },
        { value: 128000, label: '128K' },
        { value: 200000, label: '200K' },
        { value: 1000000, label: '1M' },
      ] },
      { key: 'promptTokens', label: 'Prompt / document tokens', type: 'number', default: 25000, min: 0 },
      { key: 'historyTokens', label: 'Chat history tokens', type: 'number', default: 4000, min: 0 },
      { key: 'reserve', label: 'Reserved for the answer', type: 'number', default: 2000, min: 0 },
    ]}
    compute={({ window, promptTokens, historyTokens, reserve }) => {
      const limit = Number(window) || 8192;
      const used = (Number(promptTokens) || 0) + (Number(historyTokens) || 0) + (Number(reserve) || 0);
      const free = limit - used;
      return {
        stats: [
          { label: 'Window', value: limit.toLocaleString(), tone: 'text-cyan-300' },
          { label: 'Used', value: used.toLocaleString(), hint: `${((used / limit) * 100).toFixed(0)}% of the window` },
          { label: 'Free', value: free.toLocaleString(), tone: free < 0 ? 'text-red-400' : 'text-emerald-400' },
          { label: 'Fits', value: free >= 0 ? 'Yes' : 'No — truncation', tone: free >= 0 ? 'text-emerald-400' : 'text-red-400' },
        ],
        note: free >= 0
          ? `About ${Math.floor(free * 0.75)} English words still fit. Remember the whole context is billed on every call.`
          : 'The request will be rejected or silently truncated. Summarise the history, trim the document, or move to a larger window model.',
        noteTone: free >= 0 ? 'ok' : 'error',
      };
    }}
  >
    <Callout tone="info">
      Rule of thumb: 1 token ≈ 4 English characters ≈ 0.75 words. Hindi, code and JSON usually cost more tokens per character.
    </Callout>
  </FormTool>
);
