import React, { useState } from 'react';
import { Callout, Panel, Stat } from './toolUi';

// Cloudflare publishes these endpoints as part of its MIT-licensed speedtest
// project and they answer any origin, so the browser can measure directly.
const DOWN_URL = 'https://speed.cloudflare.com/__down';
const UP_URL = 'https://speed.cloudflare.com/__up';

const round = (value, digits = 1) => Number(value.toFixed(digits));

const measurePing = async () => {
  const samples = [];
  for (let index = 0; index < 5; index += 1) {
    const start = performance.now();
    const response = await fetch(`${DOWN_URL}?bytes=0&cb=${Math.random()}`, { cache: 'no-store' });
    await response.arrayBuffer();
    samples.push(performance.now() - start);
  }
  const average = samples.reduce((sum, value) => sum + value, 0) / samples.length;
  const jitter = samples.slice(1).reduce((sum, value, index) => sum + Math.abs(value - samples[index]), 0) / (samples.length - 1);
  return { min: Math.min(...samples), average, jitter };
};

const measureDownload = async (bytes = 10000000, onProgress) => {
  const start = performance.now();
  const response = await fetch(`${DOWN_URL}?bytes=${bytes}&cb=${Math.random()}`, { cache: 'no-store' });
  if (!response.ok || !response.body) throw new Error('Download test could not reach Cloudflare');

  const reader = response.body.getReader();
  let received = 0;
  for (;;) {
    const { done, value } = await reader.read();
    if (done) break;
    received += value.length;
    if (onProgress) onProgress(received / bytes);
  }
  const seconds = (performance.now() - start) / 1000;
  return { mbps: (received * 8) / seconds / 1e6, bytes: received, seconds };
};

const measureUpload = async (bytes = 3000000) => {
  const payload = new Uint8Array(bytes);
  for (let offset = 0; offset < bytes; offset += 65536) {
    crypto.getRandomValues(payload.subarray(offset, Math.min(offset + 65536, bytes)));
  }
  const start = performance.now();
  const response = await fetch(UP_URL, { method: 'POST', body: payload, cache: 'no-store' });
  if (!response.ok) throw new Error('Upload test failed');
  await response.arrayBuffer();
  const seconds = (performance.now() - start) / 1000;
  return { mbps: (bytes * 8) / seconds / 1e6, seconds };
};

const verdictFor = (mbps) => {
  if (!mbps) return '—';
  if (mbps >= 100) return '4K streaming, large uploads';
  if (mbps >= 25) return 'HD streaming, video calls';
  if (mbps >= 10) return 'HD video, normal browsing';
  if (mbps >= 3) return 'SD video, browsing works';
  return 'Basic browsing only';
};

export const SpeedTest = () => {
  const [running, setRunning] = useState(false);
  const [stage, setStage] = useState('');
  const [progress, setProgress] = useState(0);
  const [result, setResult] = useState(null);
  const [error, setError] = useState('');

  const run = async () => {
    setRunning(true);
    setError('');
    setResult(null);
    try {
      setStage('Measuring latency…');
      const ping = await measurePing();

      setStage('Testing download…');
      setProgress(0);
      const download = await measureDownload(10000000, setProgress);

      setStage('Testing upload…');
      setProgress(0);
      const upload = await measureUpload(3000000);

      setResult({ ping, download, upload });
      setStage('');
    } catch (err) {
      setError(err.message || 'The test could not finish. Check your connection and try again.');
    } finally {
      setRunning(false);
      setProgress(0);
    }
  };

  return (
    <div className="space-y-5">
      <Panel>
        <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
          <div>
            <h2 className="text-sm font-bold uppercase tracking-wider text-slate-300">Connection speed test</h2>
            <p className="mt-1 text-xs text-slate-500">
              Measures download, upload, ping and jitter against Cloudflare’s nearest edge — about 13 MB of data per run.
            </p>
          </div>
          <button
            type="button"
            onClick={run}
            disabled={running}
            className="rounded-xl bg-electric-600 px-5 py-2.5 text-sm font-semibold text-white transition hover:bg-electric-500 disabled:bg-slate-800"
          >
            {running ? 'Testing…' : 'Start test'}
          </button>
        </div>

        {running && (
          <div className="mt-4">
            <div className="mb-1 flex justify-between text-[11px] text-slate-400">
              <span>{stage}</span>
              <span>{Math.round(progress * 100)}%</span>
            </div>
            <div className="h-1.5 overflow-hidden rounded-full bg-slate-800">
              <div className="h-full rounded-full bg-electric-500 transition-all" style={{ width: `${Math.max(4, progress * 100)}%` }} />
            </div>
          </div>
        )}

        {error && (
          <div className="mt-4"><Callout tone="error">{error}</Callout></div>
        )}

        {result && (
          <>
            <div className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
              <Stat label="Download" value={`${round(result.download.mbps)} Mbps`} hint={`${(result.download.bytes / 1e6).toFixed(1)} MB in ${round(result.download.seconds)} s`} tone="text-emerald-400" />
              <Stat label="Upload" value={`${round(result.upload.mbps)} Mbps`} hint={`3 MB in ${round(result.upload.seconds)} s`} tone="text-cyan-300" />
              <Stat label="Ping" value={`${Math.round(result.ping.average)} ms`} hint={`best ${Math.round(result.ping.min)} ms`} />
              <Stat label="Jitter" value={`${round(result.ping.jitter)} ms`} hint="Lower is better for calls" tone={result.ping.jitter < 10 ? 'text-emerald-400' : 'text-amber-300'} />
            </div>

            <div className="mt-4 rounded-xl border border-slate-800 bg-navy-950 p-3.5">
              <div className="flex flex-wrap items-center justify-between gap-2 text-xs">
                <span className="text-slate-400">What this speed supports</span>
                <span className="font-semibold text-white">{verdictFor(result.download.mbps)}</span>
              </div>
              <p className="mt-1.5 text-[11px] text-slate-500">
                {round(result.download.mbps)} Mbps ≈ {round(result.download.mbps / 8)} MB/s actual download. Browser tests read a little lower than a wired desktop test because Wi-Fi, other devices and HTTP overhead all count.
              </p>
            </div>
          </>
        )}
      </Panel>

      <div className="grid gap-4 sm:grid-cols-2">
        <Panel>
          <h3 className="text-xs font-bold uppercase tracking-wider text-slate-300">Reading the numbers</h3>
          <ul className="mt-2 space-y-1.5 text-[11px] leading-relaxed text-slate-400">
            <li><span className="text-white">Mbps vs MB/s:</span> divide Mbps by 8 — 100 Mbps is 12.5 MB/s.</li>
            <li><span className="text-white">Ping:</span> round-trip time. Under 30 ms feels instant; over 150 ms is painful in games.</li>
            <li><span className="text-white">Jitter:</span> variation between pings. Above 30 ms, calls break up even on fast links.</li>
            <li><span className="text-white">Bufferbloat:</span> if speed collapses while others use the line, the router queue is the problem, not the plan.</li>
          </ul>
        </Panel>
        <Panel>
          <h3 className="text-xs font-bold uppercase tracking-wider text-slate-300">If the result looks wrong</h3>
          <ul className="mt-2 space-y-1.5 text-[11px] leading-relaxed text-slate-400">
            <li>Test on a laptop with an Ethernet cable, then on Wi-Fi, and compare.</li>
            <li>Close downloads, cloud sync and streaming tabs — they steal throughput.</li>
            <li>Repeat at a different time: evening congestion on shared lines is real.</li>
            <li>An ISP “100 Mbps” plan is measured to the ISP edge, not to every server you use.</li>
          </ul>
        </Panel>
      </div>

      <Callout tone="info">
        The test talks directly to <span className="font-mono">speed.cloudflare.com</span> from your browser. Those are Cloudflare’s public speed-test endpoints, the same ones its own speed test uses; RTechLab stores no results.
      </Callout>
    </div>
  );
};

export default SpeedTest;
