import React, { useMemo, useState } from 'react';
import { Callout, Field, Panel, Stat } from './toolUi';

const parseHex = (hex) => {
  let value = (hex || '').trim().replace('#', '');
  if (value.length === 3) value = value.split('').map((c) => c + c).join('');
  if (!/^[0-9a-fA-F]{6}$/.test(value)) return null;
  return {
    r: parseInt(value.slice(0, 2), 16),
    g: parseInt(value.slice(2, 4), 16),
    b: parseInt(value.slice(4, 6), 16),
  };
};

const channelLuminance = (channel) => {
  const c = channel / 255;
  return c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
};

const luminance = ({ r, g, b }) =>
  0.2126 * channelLuminance(r) + 0.7152 * channelLuminance(g) + 0.0722 * channelLuminance(b);

const contrast = (a, b) => {
  const l1 = luminance(a);
  const l2 = luminance(b);
  const lighter = Math.max(l1, l2);
  const darker = Math.min(l1, l2);
  return (lighter + 0.05) / (darker + 0.05);
};

const toHsl = ({ r, g, b }) => {
  const rr = r / 255;
  const gg = g / 255;
  const bb = b / 255;
  const max = Math.max(rr, gg, bb);
  const min = Math.min(rr, gg, bb);
  const l = (max + min) / 2;
  const d = max - min;
  let h = 0;
  let s = 0;
  if (d !== 0) {
    s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
    if (max === rr) h = ((gg - bb) / d + (gg < bb ? 6 : 0)) / 6;
    else if (max === gg) h = ((bb - rr) / d + 2) / 6;
    else h = ((rr - gg) / d + 4) / 6;
  }
  return `${Math.round(h * 360)}°, ${Math.round(s * 100)}%, ${Math.round(l * 100)}%`;
};

const hexOf = ({ r, g, b }) =>
  '#' + [r, g, b].map((c) => c.toString(16).padStart(2, '0')).join('').toUpperCase();

const inputCls =
  'w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white uppercase outline-none focus:border-electric-400';

export const ColorContrastTool = () => {
  const [text, setText] = useState('#EDEDED');
  const [background, setBackground] = useState('#0071E3');
  const [size, setSize] = useState('normal');

  const result = useMemo(() => {
    const fg = parseHex(text);
    const bg = parseHex(background);
    if (!fg || !bg) return { error: 'Use a 6-digit hex colour such as #0071E3.' };
    const ratio = contrast(fg, bg);
    const large = size === 'large';
    return {
      ratio,
      fg,
      bg,
      aa: large ? ratio >= 3 : ratio >= 4.5,
      aaa: large ? ratio >= 4.5 : ratio >= 7,
      ui: ratio >= 3,
      fgHsl: toHsl(fg),
      bgHsl: toHsl(bg),
      error: null,
    };
  }, [text, background, size]);

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-3">
          <Field label="Text colour">
            <div className="flex gap-2">
              <input type="color" value={parseHex(text) ? hexOf(parseHex(text)) : '#ffffff'} onChange={(e) => setText(e.target.value)} className="h-11 w-12 cursor-pointer rounded-xl border border-slate-700 bg-navy-950" />
              <input value={text} onChange={(e) => setText(e.target.value)} className={inputCls} />
            </div>
          </Field>
          <Field label="Background colour">
            <div className="flex gap-2">
              <input type="color" value={parseHex(background) ? hexOf(parseHex(background)) : '#000000'} onChange={(e) => setBackground(e.target.value)} className="h-11 w-12 cursor-pointer rounded-xl border border-slate-700 bg-navy-950" />
              <input value={background} onChange={(e) => setBackground(e.target.value)} className={inputCls} />
            </div>
          </Field>
          <Field label="Text size">
            <select value={size} onChange={(e) => setSize(e.target.value)} className="w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-cyan-300 outline-none">
              <option value="normal">Normal body text (under 18.66px bold / 24px)</option>
              <option value="large">Large text (18.66px bold or 24px+)</option>
            </select>
          </Field>
        </div>

        {result.error && (
          <div className="mt-4">
            <Callout tone="error">{result.error}</Callout>
          </div>
        )}
      </Panel>

      {!result.error && (
        <>
          <Panel>
            <div
              className="rounded-xl border border-slate-800 p-6"
              style={{ backgroundColor: hexOf(result.bg), color: hexOf(result.fg) }}
            >
              <p className="text-xl font-bold">RTechLab sample heading</p>
              <p className="mt-2 text-sm">
                Body copy at 14–16px. Use this preview to judge whether the pair is comfortable, not just technically passing.
              </p>
            </div>

            <div className="mt-4 grid gap-3 sm:grid-cols-4">
              <Stat label="Contrast ratio" value={`${result.ratio.toFixed(2)} : 1`} tone={result.ratio >= 4.5 ? 'text-emerald-400' : 'text-amber-300'} />
              <Stat label="WCAG AA" value={result.aa ? 'Pass' : 'Fail'} tone={result.aa ? 'text-emerald-400' : 'text-red-400'} hint={size === 'large' ? 'needs 3:1' : 'needs 4.5:1'} />
              <Stat label="WCAG AAA" value={result.aaa ? 'Pass' : 'Fail'} tone={result.aaa ? 'text-emerald-400' : 'text-red-400'} hint={size === 'large' ? 'needs 4.5:1' : 'needs 7:1'} />
              <Stat label="UI components" value={result.ui ? 'Pass' : 'Fail'} tone={result.ui ? 'text-emerald-400' : 'text-red-400'} hint="needs 3:1 for borders and icons" />
            </div>
          </Panel>

          <Panel>
            <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Colour values</h2>
            <div className="grid gap-3 sm:grid-cols-2">
              {[
                { name: 'Text', color: result.fg, hsl: result.fgHsl },
                { name: 'Background', color: result.bg, hsl: result.bgHsl },
              ].map((row) => (
                <div key={row.name} className="rounded-xl border border-slate-800 bg-navy-950 p-3">
                  <div className="mb-2 flex items-center gap-2">
                    <span className="h-4 w-4 rounded border border-slate-700" style={{ backgroundColor: hexOf(row.color) }} />
                    <span className="text-xs font-semibold text-slate-300">{row.name}</span>
                  </div>
                  <dl className="space-y-1 font-mono text-[11px] text-slate-400">
                    <div className="flex justify-between"><dt>HEX</dt><dd className="text-slate-200">{hexOf(row.color)}</dd></div>
                    <div className="flex justify-between"><dt>RGB</dt><dd className="text-slate-200">{row.color.r}, {row.color.g}, {row.color.b}</dd></div>
                    <div className="flex justify-between"><dt>HSL</dt><dd className="text-slate-200">{row.hsl}</dd></div>
                  </dl>
                </div>
              ))}
            </div>
            <div className="mt-4">
              <Callout tone="info">
                Formula: (L1 + 0.05) ÷ (L2 + 0.05), where L is relative luminance after gamma correction. Pure black on white is 21:1 — the maximum possible.
              </Callout>
            </div>
          </Panel>
        </>
      )}
    </div>
  );
};

export default ColorContrastTool;
