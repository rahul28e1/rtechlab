import React, { useState } from 'react';
import { Callout, Field, Panel, Stat } from './toolUi';

const cleanHost = (value) =>
  (value || '')
    .trim()
    .toLowerCase()
    .replace(/^https?:\/\//, '')
    .split('/')[0];

const EXAMPLES = ['google.com', 'github.com', 'rtechlab.io', 'cloudflare.com'];

export const SiteStatus = () => {
  const [host, setHost] = useState('google.com');
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState(null);
  const [error, setError] = useState('');
  const [history, setHistory] = useState([]);

  const check = async (target = host) => {
    const clean = cleanHost(target);
    if (!clean || !clean.includes('.')) {
      setError('Enter a website address such as example.com');
      return;
    }
    setLoading(true);
    setError('');
    setResult(null);
    try {
      const response = await fetch(`/api/site-status?host=${encodeURIComponent(clean)}`);
      const json = await response.json();
      if (!response.ok) throw new Error(json.error || 'The check failed');
      setResult(json);
      setHistory((previous) => [{ host: clean, ok: json.ok, status: json.status, ms: json.responseMs, at: json.checkedAt }, ...previous].slice(0, 5));
    } catch (err) {
      setError(err.message || 'Could not complete the check. Try again in a moment.');
    } finally {
      setLoading(false);
    }
  };

  const nodesUp = result?.nodes?.filter((node) => node.up).length || 0;
  const nodesTotal = result?.nodes?.length || 0;

  return (
    <div className="space-y-5">
      <Panel>
        <form
          onSubmit={(event) => { event.preventDefault(); check(); }}
          className="flex flex-col gap-3 sm:flex-row sm:items-end"
        >
          <div className="flex-1">
            <Field label="Website to check" hint="Checks from our server, plus three independent locations">
              <input
                value={host}
                onChange={(event) => setHost(event.target.value)}
                placeholder="example.com"
                className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400"
              />
            </Field>
          </div>
          <button
            type="submit"
            disabled={loading}
            className="rounded-xl bg-electric-600 px-5 py-2.5 text-sm font-semibold text-white transition hover:bg-electric-500 disabled:bg-slate-800"
          >
            {loading ? 'Checking…' : 'Check status'}
          </button>
        </form>

        <div className="mt-3 flex flex-wrap items-center gap-1.5 text-[11px]">
          <span className="text-slate-500">Try:</span>
          {EXAMPLES.map((example) => (
            <button
              key={example}
              type="button"
              onClick={() => { setHost(example); check(example); }}
              className="rounded-md border border-slate-800 px-2 py-0.5 font-mono text-slate-400 transition hover:border-slate-600 hover:text-white"
            >
              {example}
            </button>
          ))}
        </div>

        {error && <div className="mt-4"><Callout tone="error">{error}</Callout></div>}
      </Panel>

      {result && (
        <Panel>
          <div className="flex flex-wrap items-center justify-between gap-3">
            <div className="flex items-center gap-3">
              <span className={`inline-flex h-3 w-3 rounded-full ${result.ok ? 'bg-emerald-400' : 'bg-red-500'}`} />
              <div>
                <h2 className="text-lg font-bold text-white">{result.host}</h2>
                <p className="text-[11px] text-slate-500">
                  Checked {new Date(result.checkedAt).toLocaleTimeString()} from the RTechLab server
                </p>
              </div>
            </div>
            <span className={`rounded-full px-3 py-1 text-xs font-semibold ${result.ok ? 'bg-emerald-500/10 text-emerald-300' : 'bg-red-500/10 text-red-300'}`}>
              {result.ok ? 'Up and responding' : result.status >= 500 ? 'Server error' : 'Down or unreachable'}
            </span>
          </div>

          <div className="mt-5 grid gap-3 sm:grid-cols-3">
            <Stat label="HTTP status" value={result.status || '—'} hint={result.status ? 'Status code returned' : 'No response received'} tone={result.status && result.status < 400 ? 'text-emerald-400' : 'text-amber-300'} />
            <Stat label="Response time" value={`${result.responseMs} ms`} hint="Server to first byte" />
            <Stat label="Locations agreeing" value={nodesTotal ? `${nodesUp}/${nodesTotal}` : 'n/a'} hint={nodesTotal ? 'Independent check-host nodes' : 'Multi-location check unavailable'} tone={nodesTotal && nodesUp === nodesTotal ? 'text-emerald-400' : 'text-amber-300'} />
          </div>

          {result.message && (
            <div className="mt-3"><Callout tone="warn">{result.message}</Callout></div>
          )}

          {result.nodes && result.nodes.length > 0 && (
            <div className="mt-4">
              <span className="mb-2 block text-[11px] uppercase tracking-wider text-slate-500">Checks from other locations</span>
              <div className="space-y-1.5">
                {result.nodes.map((node) => (
                  <div key={node.node} className="flex items-center justify-between rounded-lg border border-slate-800 bg-navy-950 px-3 py-2 text-[11px]">
                    <span className="font-mono text-slate-300">{node.node.replace('.node.check-host.net', '')}</span>
                    <span className="flex items-center gap-2">
                      {node.time !== null && <span className="font-mono text-slate-500">{node.time} ms</span>}
                      <span className={node.up ? 'text-emerald-400' : 'text-red-400'}>{node.up ? 'reachable' : 'failed'}</span>
                    </span>
                  </div>
                ))}
              </div>
            </div>
          )}
        </Panel>
      )}

      {history.length > 0 && (
        <Panel>
          <h3 className="mb-2 text-xs font-bold uppercase tracking-wider text-slate-300">Checks in this session</h3>
          <div className="space-y-1.5">
            {history.map((item) => (
              <div key={`${item.host}-${item.at}`} className="flex items-center justify-between text-[11px]">
                <span className="font-mono text-slate-400">{item.host}</span>
                <span className="flex items-center gap-3">
                  <span className="text-slate-500">{new Date(item.at).toLocaleTimeString()}</span>
                  <span className={item.ok ? 'text-emerald-400' : 'text-red-400'}>{item.ok ? `${item.status} · ${item.ms} ms` : item.status || 'down'}</span>
                </span>
              </div>
            ))}
          </div>
        </Panel>
      )}

      <Callout tone="info">
        A site can be up for everyone and still look broken for you: local DNS cache, ISP routing, a VPN or an ad-blocker are the usual causes. If every location fails here, the site really is down — check its status page before contacting support.
      </Callout>
    </div>
  );
};

export default SiteStatus;
