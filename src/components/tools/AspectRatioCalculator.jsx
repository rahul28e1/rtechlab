import React, { useMemo, useState } from 'react';
import { Callout, Field, Panel, Stat } from './toolUi';

const gcd = (a, b) => (b === 0 ? a : gcd(b, a % b));

const PRESETS = [
  { label: 'Instagram square post', width: 1080, height: 1080 },
  { label: 'Instagram portrait post', width: 1080, height: 1350 },
  { label: 'Instagram / TikTok story', width: 1080, height: 1920 },
  { label: 'YouTube thumbnail', width: 1280, height: 720 },
  { label: 'YouTube channel banner', width: 2560, height: 1440 },
  { label: 'LinkedIn post', width: 1200, height: 627 },
  { label: 'X / Twitter header', width: 1500, height: 500 },
  { label: 'A4 print at 300 DPI', width: 2480, height: 3508 },
  { label: 'HD slides (16:9)', width: 1920, height: 1080 },
  { label: 'Full HD video', width: 1920, height: 1080 },
];

const TARGETS = [720, 1080, 1280, 1920, 2560, 3840];

const num = 'w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400';

export const AspectRatioCalculator = () => {
  const [width, setWidth] = useState(1920);
  const [height, setHeight] = useState(1080);
  const [lock, setLock] = useState(true);

  const ratio = useMemo(() => {
    const w = Math.max(1, Math.round(Number(width) || 0));
    const h = Math.max(1, Math.round(Number(height) || 0));
    const divisor = gcd(w, h);
    const rw = w / divisor;
    const rh = h / divisor;
    const portrait = h > w;
    const orientation = h === w ? 'Square' : portrait ? 'Portrait' : 'Landscape';
    const decimal = w / h;
    const common = [
      { label: '1:1', value: 1 },
      { label: '4:3', value: 4 / 3 },
      { label: '3:2', value: 3 / 2 },
      { label: '16:9', value: 16 / 9 },
      { label: '16:10', value: 16 / 10 },
      { label: '21:9', value: 21 / 9 },
      { label: '9:16', value: 9 / 16 },
      { label: '2:3', value: 2 / 3 },
      { label: '3:4', value: 3 / 4 },
      { label: '4:5', value: 4 / 5 },
    ];
    const nearest = common
      .map((item) => ({ ...item, diff: Math.abs(item.value - decimal) }))
      .sort((a, b) => a.diff - b.diff)[0];
    return {
      w,
      h,
      rw,
      rh,
      orientation,
      decimal,
      nearest,
      megapixels: (w * h) / 1e6,
    };
  }, [width, height]);

  const applyPreset = (preset) => {
    setWidth(preset.width);
    setHeight(preset.height);
  };

  const changeWidth = (next) => {
    const w = Number(next) || 0;
    setWidth(next);
    if (lock && ratio.decimal > 0) setHeight(Math.max(1, Math.round(w / ratio.decimal)));
  };

  const changeHeight = (next) => {
    const h = Number(next) || 0;
    setHeight(next);
    if (lock && ratio.decimal > 0) setWidth(Math.max(1, Math.round(h * ratio.decimal)));
  };

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-[1fr_1fr_auto]">
          <Field label="Width (px)">
            <input type="number" min="1" value={width} onChange={(e) => changeWidth(e.target.value)} className={num} />
          </Field>
          <Field label="Height (px)">
            <input type="number" min="1" value={height} onChange={(e) => changeHeight(e.target.value)} className={num} />
          </Field>
          <div className="flex items-end">
            <button
              type="button"
              onClick={() => setLock((v) => !v)}
              className={`rounded-xl border px-3 py-2.5 text-xs transition ${lock ? 'border-electric-500 text-white' : 'border-slate-700 text-slate-400'}`}
            >
              {lock ? '🔒 Ratio locked' : '🔓 Ratio free'}
            </button>
          </div>
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-4">
          <Stat label="Simplified ratio" value={`${ratio.rw}:${ratio.rh}`} tone="text-cyan-300" />
          <Stat label="Decimal ratio" value={ratio.decimal.toFixed(3)} hint="Width ÷ height" />
          <Stat label="Orientation" value={ratio.orientation} />
          <Stat label="Megapixels" value={`${ratio.megapixels.toFixed(2)} MP`} hint="Pixels ÷ 1,000,000" />
        </div>

        <div className="mt-4">
          <Callout tone="info">
            Closest standard ratio: <strong>{ratio.nearest.label}</strong>. {ratio.nearest.diff > 0.01 ? 'Your canvas is not a standard ratio — cropping or letterboxing will happen on some platforms.' : 'This matches a standard ratio exactly.'}
          </Callout>
        </div>
      </Panel>

      <div className="grid gap-5 lg:grid-cols-2">
        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Scale to a target width</h2>
          <div className="flex flex-wrap gap-2">
            {TARGETS.map((target) => (
              <button
                key={target}
                type="button"
                onClick={() => changeWidth(target)}
                className="rounded-lg border border-slate-700 bg-navy-950 px-3 py-1.5 font-mono text-xs text-slate-300 transition hover:border-slate-500 hover:text-white"
              >
                {target}px → {Math.max(1, Math.round(target / ratio.decimal))}px
              </button>
            ))}
          </div>
          <p className="mt-3 text-[11px] text-slate-500">
            Scaling keeps the ratio, so nothing stretches. Quality still depends on the source file — never upscale a small export.
          </p>
        </Panel>

        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Common canvas presets</h2>
          <div className="max-h-64 space-y-1.5 overflow-y-auto pr-1">
            {PRESETS.map((preset) => (
              <button
                key={preset.label}
                type="button"
                onClick={() => applyPreset(preset)}
                className="flex w-full items-center justify-between rounded-lg border border-slate-800 bg-navy-950 px-3 py-2 text-left text-xs transition hover:border-slate-600"
              >
                <span className="text-slate-300">{preset.label}</span>
                <span className="font-mono text-[11px] text-cyan-300">
                  {preset.width} × {preset.height}
                </span>
              </button>
            ))}
          </div>
        </Panel>
      </div>
    </div>
  );
};

export default AspectRatioCalculator;
