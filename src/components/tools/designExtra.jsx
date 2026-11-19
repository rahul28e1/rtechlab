import React, { useMemo, useState } from 'react';
import { FormTool, InfoList } from './kit';
import { Callout, Field, Panel, Stat } from './toolUi';

const clamp = (value) => Math.max(0, Math.min(255, Math.round(value)));

const parseColor = (input) => {
  const value = (input || '').trim();
  const hex = value.replace('#', '');
  if (/^[0-9a-fA-F]{6}$/.test(hex)) {
    return { r: parseInt(hex.slice(0, 2), 16), g: parseInt(hex.slice(2, 4), 16), b: parseInt(hex.slice(4, 6), 16) };
  }
  if (/^[0-9a-fA-F]{3}$/.test(hex)) {
    return { r: parseInt(hex[0] + hex[0], 16), g: parseInt(hex[1] + hex[1], 16), b: parseInt(hex[2] + hex[2], 16) };
  }
  const rgb = value.match(/(\d{1,3})\D+(\d{1,3})\D+(\d{1,3})/);
  if (rgb) return { r: clamp(Number(rgb[1])), g: clamp(Number(rgb[2])), b: clamp(Number(rgb[3])) };
  return null;
};

const toHex = ({ r, g, b }) => '#' + [r, g, b].map((channel) => channel.toString(16).padStart(2, '0')).join('').toUpperCase();

const toHsl = ({ r, g, b }) => {
  const rr = r / 255, gg = g / 255, bb = b / 255;
  const max = Math.max(rr, gg, bb), min = Math.min(rr, gg, bb);
  const l = (max + min) / 2;
  const d = max - min;
  let h = 0, s = 0;
  if (d !== 0) {
    s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
    if (max === rr) h = ((gg - bb) / d + (gg < bb ? 6 : 0)) / 6;
    else if (max === gg) h = ((bb - rr) / d + 2) / 6;
    else h = ((rr - gg) / d + 4) / 6;
  }
  return { h: Math.round(h * 360), s: Math.round(s * 100), l: Math.round(l * 100) };
};

const hslToRgb = (h, s, l) => {
  const hue = h / 360;
  const sat = s / 100;
  const light = l / 100;
  const hue2rgb = (p, q, t) => {
    let tt = t;
    if (tt < 0) tt += 1;
    if (tt > 1) tt -= 1;
    if (tt < 1 / 6) return p + (q - p) * 6 * tt;
    if (tt < 1 / 2) return q;
    if (tt < 2 / 3) return p + (q - p) * (2 / 3 - tt) * 6;
    return p;
  };
  if (sat === 0) {
    const gray = light * 255;
    return { r: clamp(gray), g: clamp(gray), b: clamp(gray) };
  }
  const q = light < 0.5 ? light * (1 + sat) : light + sat - light * sat;
  const p = 2 * light - q;
  return {
    r: clamp(hue2rgb(p, q, hue + 1 / 3) * 255),
    g: clamp(hue2rgb(p, q, hue) * 255),
    b: clamp(hue2rgb(p, q, hue - 1 / 3) * 255),
  };
};

const toCmyk = ({ r, g, b }) => {
  const rr = r / 255, gg = g / 255, bb = b / 255;
  const k = 1 - Math.max(rr, gg, bb);
  if (k === 1) return { c: 0, m: 0, y: 0, k: 100 };
  return {
    c: Math.round(((1 - rr - k) / (1 - k)) * 100),
    m: Math.round(((1 - gg - k) / (1 - k)) * 100),
    y: Math.round(((1 - bb - k) / (1 - k)) * 100),
    k: Math.round(k * 100),
  };
};

const relativeLuminance = ({ r, g, b }) => {
  const channel = (value) => {
    const c = value / 255;
    return c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
  };
  return 0.2126 * channel(r) + 0.7152 * channel(g) + 0.0722 * channel(b);
};

const HARMONIES = [
  { value: 'complementary', label: 'Complementary (+180°)' },
  { value: 'analogous', label: 'Analogous (±30°)' },
  { value: 'triadic', label: 'Triadic (±120°)' },
  { value: 'split', label: 'Split complementary' },
  { value: 'mono', label: 'Monochrome shades' },
];

export const PaletteGenerator = () => {
  const [base, setBase] = useState('#0071E3');
  const [harmony, setHarmony] = useState('analogous');

  const palette = useMemo(() => {
    const rgb = parseColor(base);
    if (!rgb) return null;
    const { h, s, l } = toHsl(rgb);
    const build = (hue, sat = s, light = l) => toHex(hslToRgb((hue + 360) % 360, sat, light));
    if (harmony === 'complementary') return [build(h), build(h + 30, s, Math.min(92, l + 18)), build(h + 180), build(h + 180, s, Math.min(92, l + 20)), build(h, s, Math.max(10, l - 25))];
    if (harmony === 'triadic') return [build(h), build(h + 120), build(h + 240), build(h, s, Math.min(90, l + 22)), build(h + 120, s, Math.max(12, l - 22))];
    if (harmony === 'split') return [build(h), build(h + 150), build(h + 210), build(h, s, Math.min(92, l + 20)), build(h + 150, s, Math.max(12, l - 20))];
    if (harmony === 'mono') return [build(h, s, 20), build(h, s, 35), build(h, s, Math.max(45, l)), build(h, s, 70), build(h, Math.max(10, s - 30), 90)];
    return [build(h - 30), build(h - 15), build(h), build(h + 15), build(h + 30)];
  }, [base, harmony]);

  const contrastOf = (hex) => {
    const rgb = parseColor(hex);
    const l1 = relativeLuminance(rgb);
    const white = 1.05 / (l1 + 0.05);
    const black = (l1 + 0.05) / 0.05;
    return white > black ? `white ${white.toFixed(1)}:1` : `black ${black.toFixed(1)}:1`;
  };

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-2">
          <Field label="Base colour">
            <div className="flex gap-2">
              <input type="color" value={parseColor(base) ? toHex(parseColor(base)) : '#0071E3'} onChange={(event) => setBase(event.target.value)} className="h-11 w-12 cursor-pointer rounded-xl border border-slate-700 bg-navy-950" />
              <input value={base} onChange={(event) => setBase(event.target.value)} className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm uppercase text-white outline-none focus:border-electric-400" />
            </div>
          </Field>
          <Field label="Harmony rule">
            <select value={harmony} onChange={(event) => setHarmony(event.target.value)} className="w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-cyan-300 outline-none">
              {HARMONIES.map((item) => <option key={item.value} value={item.value}>{item.label}</option>)}
            </select>
          </Field>
        </div>

        {palette && (
          <div className="mt-5 grid grid-cols-2 gap-3 sm:grid-cols-5">
            {palette.map((hex, index) => (
              <button
                key={`${hex}-${index}`}
                type="button"
                onClick={() => { if (navigator.clipboard) navigator.clipboard.writeText(hex); }}
                className="overflow-hidden rounded-xl border border-slate-800 text-left transition hover:border-slate-600"
              >
                <span className="block h-20 w-full" style={{ backgroundColor: hex }} />
                <span className="block bg-navy-950 px-2 py-1.5 font-mono text-[10px] text-slate-300">{hex}</span>
                <span className="block bg-navy-950 px-2 pb-1.5 text-[9px] text-slate-500">{contrastOf(hex)}</span>
              </button>
            ))}
          </div>
        )}
        <p className="mt-3 text-[11px] text-slate-500">Tap a swatch to copy the HEX value. The small line shows which text colour is readable on it.</p>
      </Panel>
      <InfoList
        title="Choosing colours that survive real use"
        items={[
          'One accent colour, two neutrals and one alert colour is enough for a whole interface.',
          'Check every text/background pair with the contrast tool before you ship.',
          'Print jobs need CMYK conversion — screens and printers reproduce colour differently.',
          'Keep a palette to five values; more than that and the design loses hierarchy.',
        ]}
      />
    </div>
  );
};

export const ColorConverter = () => {
  const [value, setValue] = useState('#0071E3');
  const rgb = parseColor(value);
  const hsl = rgb ? toHsl(rgb) : null;
  const cmyk = rgb ? toCmyk(rgb) : null;

  return (
    <div className="space-y-5">
      <Panel>
        <Field label="Colour (HEX or RGB)">
          <div className="flex gap-2">
            <input type="color" value={rgb ? toHex(rgb) : '#000000'} onChange={(event) => setValue(event.target.value)} className="h-11 w-12 cursor-pointer rounded-xl border border-slate-700 bg-navy-950" />
            <input value={value} onChange={(event) => setValue(event.target.value)} className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm uppercase text-white outline-none focus:border-electric-400" />
          </div>
        </Field>

        {rgb ? (
          <div className="mt-5 grid gap-3 sm:grid-cols-2">
            <Stat label="HEX" value={toHex(rgb)} tone="text-cyan-300" />
            <Stat label="RGB" value={`${rgb.r}, ${rgb.g}, ${rgb.b}`} />
            <Stat label="HSL" value={`${hsl.h}°, ${hsl.s}%, ${hsl.l}%`} />
            <Stat label="CMYK (print approx.)" value={`${cmyk.c}, ${cmyk.m}, ${cmyk.y}, ${cmyk.k}`} tone="text-amber-300" />
            <div className="sm:col-span-2">
              <span className="block h-16 w-full rounded-xl border border-slate-800" style={{ backgroundColor: toHex(rgb) }} />
            </div>
          </div>
        ) : (
          <div className="mt-4"><Callout tone="error">Enter a colour as #0071E3 or rgb(0, 113, 227).</Callout></div>
        )}
      </Panel>
      <Callout tone="info">
        HEX and RGB are for screens; CMYK is for ink. A bright screen cyan can print noticeably duller, so always proof a brand colour once before a big print run.
      </Callout>
    </div>
  );
};

export const DpiCalculator = () => (
  <FormTool
    fields={[
      { key: 'width', label: 'Width (pixels)', type: 'number', default: 1080, min: 1 },
      { key: 'height', label: 'Height (pixels)', type: 'number', default: 1080, min: 1 },
      { key: 'dpi', label: 'Target DPI', type: 'select', numeric: true, default: 300, options: [
        { value: 72, label: '72 — screen draft' },
        { value: 150, label: '150 — everyday print' },
        { value: 300, label: '300 — professional print' },
        { value: 600, label: '600 — fine detail' },
      ] },
    ]}
    compute={({ width, height, dpi }) => {
      const w = Number(width) || 0;
      const h = Number(height) || 0;
      const d = Number(dpi) || 300;
      const inchesW = w / d;
      const inchesH = h / d;
      return {
        stats: [
          { label: 'Print size (inches)', value: `${inchesW.toFixed(2)} × ${inchesH.toFixed(2)} in`, tone: 'text-cyan-300' },
          { label: 'Print size (cm)', value: `${(inchesW * 2.54).toFixed(1)} × ${(inchesH * 2.54).toFixed(1)} cm` },
          { label: 'Megapixels', value: `${((w * h) / 1e6).toFixed(2)} MP` },
          { label: 'Quality', value: d >= 300 ? 'Print ready' : d >= 150 ? 'Acceptable' : 'Screen only', tone: d >= 300 ? 'text-emerald-400' : d >= 150 ? 'text-amber-300' : 'text-red-400' },
        ],
        lines: [
          { label: 'A4 at this DPI needs', value: `${Math.round(8.27 * d)} × ${Math.round(11.69 * d)} px` },
          { label: 'Instagram square at 1080 px', value: '10.8 cm wide at 300 DPI' },
          { label: 'Pixels to upscale from A4', value: `${Math.max(0, Math.round(8.27 * d) - w)} px` },
        ],
        note: 'Never upscale for print: interpolation invents pixels and the result looks soft. Shoot or export at the final size instead.',
      };
    }}
  />
);

export const GradientGenerator = () => {
  const [from, setFrom] = useState('#0071E3');
  const [to, setTo] = useState('#0B0B0F');
  const [angle, setAngle] = useState(135);
  const [type, setType] = useState('linear');

  const css = type === 'linear'
    ? `linear-gradient(${angle}deg, ${from} 0%, ${to} 100%)`
    : `radial-gradient(circle at 50% 50%, ${from} 0%, ${to} 100%)`;

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-3">
          <Field label="From">
            <input type="color" value={from} onChange={(event) => setFrom(event.target.value)} className="h-11 w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950" />
          </Field>
          <Field label="To">
            <input type="color" value={to} onChange={(event) => setTo(event.target.value)} className="h-11 w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950" />
          </Field>
          <Field label="Type">
            <select value={type} onChange={(event) => setType(event.target.value)} className="w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 text-sm text-cyan-300 outline-none">
              <option value="linear">Linear</option>
              <option value="radial">Radial</option>
            </select>
          </Field>
        </div>
        {type === 'linear' && (
          <div className="mt-4">
            <Field label={`Angle: ${angle}°`}>
              <input type="range" min="0" max="360" value={angle} onChange={(event) => setAngle(event.target.value)} className="w-full accent-electric-500" />
            </Field>
          </div>
        )}

        <div className="mt-5 h-40 rounded-xl border border-slate-800" style={{ backgroundImage: css }} />
        <div className="mt-3 rounded-xl border border-slate-800 bg-navy-950 p-3">
          <code className="block break-all font-mono text-[11px] text-emerald-300">background-image: {css};</code>
          <button type="button" onClick={() => { if (navigator.clipboard) navigator.clipboard.writeText(`background-image: ${css};`); }} className="mt-2 text-[10px] uppercase tracking-wider text-slate-500 hover:text-white">
            Copy CSS
          </button>
        </div>
      </Panel>
      <Callout tone="info">
        Subtle gradients read as premium; strong ones read as 2010. Keep the two stops close in lightness and avoid banding by not stretching a gradient across a huge area.
      </Callout>
    </div>
  );
};

export const ImageResizer = () => {
  const [source, setSource] = useState(null);
  const [width, setWidth] = useState(1080);
  const [quality, setQuality] = useState(85);
  const [result, setResult] = useState(null);
  const [info, setInfo] = useState(null);

  const handleFile = (file) => {
    if (!file) return;
    const reader = new FileReader();
    reader.onload = () => {
      const image = new Image();
      image.onload = () => {
        setSource(image);
        setInfo({ name: file.name, width: image.width, height: image.height, size: file.size });
        setResult(null);
      };
      image.src = reader.result;
    };
    reader.readAsDataURL(file);
  };

  const resize = () => {
    if (!source) return;
    const targetWidth = Math.max(16, Math.min(6000, Number(width) || 1080));
    const scale = targetWidth / source.width;
    const canvas = document.createElement('canvas');
    canvas.width = targetWidth;
    canvas.height = Math.round(source.height * scale);
    const context = canvas.getContext('2d');
    context.imageSmoothingQuality = 'high';
    context.drawImage(source, 0, 0, canvas.width, canvas.height);
    canvas.toBlob((blob) => {
      if (!blob) return;
      setResult({ url: URL.createObjectURL(blob), size: blob.size, width: canvas.width, height: canvas.height });
    }, 'image/jpeg', Number(quality) / 100);
  };

  return (
    <div className="space-y-5">
      <Panel>
        <Field label="Choose an image" hint="Processed locally — never uploaded">
          <input type="file" accept="image/*" onChange={(event) => handleFile(event.target.files?.[0])} className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3 py-2 text-xs text-slate-300 file:mr-3 file:rounded-lg file:border-0 file:bg-slate-800 file:px-3 file:py-1.5 file:text-xs file:text-white" />
        </Field>

        {info && (
          <>
            <div className="mt-4 grid gap-3 sm:grid-cols-3">
              <Stat label="Original size" value={`${info.width} × ${info.height}`} />
              <Stat label="File size" value={`${(info.size / 1024).toFixed(0)} KB`} />
              <Stat label="Aspect ratio" value={(info.width / info.height).toFixed(3)} />
            </div>
            <div className="mt-4 grid gap-4 sm:grid-cols-2">
              <Field label="Target width (px)">
                <input type="number" min="16" max="6000" value={width} onChange={(event) => setWidth(event.target.value)} className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400" />
              </Field>
              <Field label={`JPEG quality: ${quality}%`}>
                <input type="range" min="30" max="100" value={quality} onChange={(event) => setQuality(event.target.value)} className="w-full accent-electric-500" />
              </Field>
            </div>
            <button type="button" onClick={resize} className="mt-4 rounded-xl bg-electric-600 px-5 py-2.5 text-sm font-semibold text-white hover:bg-electric-500">
              Resize image
            </button>
          </>
        )}

        {result && (
          <div className="mt-5 rounded-xl border border-slate-800 bg-navy-950 p-4">
            <div className="grid gap-3 sm:grid-cols-3">
              <Stat label="New size" value={`${result.width} × ${result.height}`} tone="text-cyan-300" />
              <Stat label="New file size" value={`${(result.size / 1024).toFixed(0)} KB`} tone="text-emerald-400" />
              <Stat label="Saved" value={`${info ? Math.max(0, Math.round((1 - result.size / info.size) * 100)) : 0}%`} />
            </div>
            <a href={result.url} download={`rtechlab-resized-${result.width}.jpg`} className="mt-3 inline-block rounded-xl border border-slate-700 px-4 py-2 text-xs font-semibold text-white hover:border-slate-500">
              Download resized image
            </a>
          </div>
        )}
      </Panel>
      <Callout tone="info">
        For exam forms and government portals, keep the longest side under 1000 px and quality around 80% — that usually lands well inside a 200 KB limit.
      </Callout>
    </div>
  );
};
