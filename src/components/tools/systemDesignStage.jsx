import React, { useEffect, useId, useRef, useState } from 'react';

// Shared scene machinery for the system-design simulators.
//
// Every simulator gets the same three things:
//   1. a camera stage you can pan, zoom and re-frame with presets,
//   2. vector "photos" of the components (icons, labels, live numbers),
//   3. a numbered process guide that explains what is happening in words a
//      school student can follow.
//
// The stage lives in a fixed 900 × 420 coordinate space, so a simulator only
// has to describe where its boxes sit — the camera takes care of the rest.

export const STAGE_W = 900;
export const STAGE_H = 420;

export const TONE = {
  blue: '#38bdf8',
  green: '#34d399',
  amber: '#fbbf24',
  violet: '#a78bfa',
  red: '#f87171',
  cyan: '#22d3ee',
  pink: '#f472b6',
  slate: '#94a3b8',
};

const clamp = (value, min, max) => Math.min(max, Math.max(min, value));

// A phone screen is narrow, so the camera uses a taller frame there: the same
// drawing is shown in a 900 × 560 window instead of 900 × 420, which makes every
// label roughly a third bigger without letterboxing.
const WIDE_ASPECT = STAGE_W / STAGE_H;
const PHONE_ASPECT = STAGE_W / 560;
const FOCUS_PAD = 24;

// Keep the visible window inside the drawing, so panning and zooming can never
// wander off into empty space.
const clampView = (view) => ({
  ...view,
  x: clamp(view.x, 0, STAGE_W - view.w),
  y: clamp(view.y, 0, STAGE_H - view.h),
});

// Grow a box until it fills the frame's aspect ratio, then shrink it if it is
// wider than the drawing. The result always has the frame's shape, so the SVG
// never letterboxes, and it is clamped so the camera stays on the drawing.
const framedView = (box, aspect) => {
  let w = Math.max(box.w, 1);
  let h = Math.max(box.h, 1);
  if (w / h < aspect) w = h * aspect;
  else h = w / aspect;
  // Never show more than the whole drawing: width is the usual limit, but a
  // tall phone frame can hit the height limit first.
  const maxW = Math.min(STAGE_W, STAGE_H * aspect);
  const shrink = Math.min(1, maxW / w);
  w *= shrink;
  h *= shrink;
  return clampView({ x: box.cx - w / 2, y: box.cy - h / 2, w, h });
};

const presetBox = (preset) => {
  const zoom = clamp(preset.zoom || 1, 1, 4);
  return { cx: preset.cx, cy: preset.cy, w: STAGE_W / zoom, h: STAGE_H / zoom };
};

const focusBox = (focus) => ({
  cx: focus.cx,
  cy: focus.cy,
  w: focus.w + FOCUS_PAD * 2,
  h: focus.h + FOCUS_PAD * 2,
});

// The stage is taller on phones, which changes the camera frame. matchMedia is
// read in an effect so the server render and the first client render agree.
const usePhoneStage = () => {
  const [phone, setPhone] = useState(false);
  useEffect(() => {
    const query = window.matchMedia('(max-width: 639px)');
    const sync = () => setPhone(query.matches);
    sync();
    query.addEventListener('change', sync);
    return () => query.removeEventListener('change', sync);
  }, []);
  return phone;
};

// ── Icons ───────────────────────────────────────────────────────────────────
// Simple line glyphs drawn inside a 32 × 32 box. They read well at both wide
// and close-up camera angles, and they scale with the scene instead of
// needing separate image assets.
const GLYPHS = {
  user: (
    <>
      <circle cx="16" cy="10" r="5" />
      <path d="M6.5 27c0-5.3 4.2-8.6 9.5-8.6s9.5 3.3 9.5 8.6" />
    </>
  ),
  laptop: (
    <>
      <rect x="6" y="7" width="20" height="14" rx="2" />
      <path d="M3 25.5h26M13 11.5h6" />
    </>
  ),
  phone: (
    <>
      <rect x="9" y="4" width="14" height="24" rx="3" />
      <path d="M14 7.5h4M15.5 24.5h1" />
    </>
  ),
  globe: (
    <>
      <circle cx="16" cy="16" r="11" />
      <ellipse cx="16" cy="16" rx="11" ry="4.6" />
      <ellipse cx="16" cy="16" rx="4.6" ry="11" />
      <path d="M16 5v22" />
    </>
  ),
  cloud: (
    <>
      <path d="M9 24.5a6 6 0 0 1 .8-11.9A8.4 8.4 0 0 1 25 14a5.2 5.2 0 0 1-.8 10.5z" />
      <path d="M12 20h9" />
    </>
  ),
  server: (
    <>
      <rect x="7" y="4.5" width="18" height="6.4" rx="1.8" />
      <rect x="7" y="13" width="18" height="6.4" rx="1.8" />
      <rect x="7" y="21.5" width="18" height="6.4" rx="1.8" />
      <path d="M10.5 7.7h4M10.5 16.2h4M10.5 24.7h4" />
    </>
  ),
  database: (
    <>
      <ellipse cx="16" cy="7.5" rx="9" ry="3.5" />
      <path d="M7 7.5v17c0 2 4 3.5 9 3.5s9-1.5 9-3.5v-17" />
      <path d="M7 15.5c0 2 4 3.5 9 3.5s9-1.5 9-3.5" />
    </>
  ),
  cache: (
    <>
      <path d="M16 4l11 6-11 6L5 10z" />
      <path d="M5 16l11 6 11-6" />
      <path d="M5 22l11 6 11-6" />
    </>
  ),
  balancer: (
    <>
      <circle cx="8" cy="16" r="4" />
      <circle cx="25" cy="6" r="3" />
      <circle cx="25" cy="16" r="3" />
      <circle cx="25" cy="26" r="3" />
      <path d="M12 16h10M12 16l8.5-8M12 16l8.5 8" />
    </>
  ),
  bucket: (
    <>
      <path d="M8 9h16l-2.4 18h-11.2z" />
      <path d="M11 9V6a5 5 0 0 1 10 0v3" />
      <path d="M12 15h8" />
    </>
  ),
  clock: (
    <>
      <circle cx="16" cy="16" r="11" />
      <path d="M16 9v7l5 3" />
    </>
  ),
  lock: (
    <>
      <rect x="8" y="14" width="16" height="12" rx="2.5" />
      <path d="M11.5 14v-3a4.5 4.5 0 0 1 9 0v3M16 19v3" />
    </>
  ),
  bolt: <path d="M18 3L7 18h7l-1 11 12-16h-7z" />,
  shield: <path d="M16 3l11 4v9c0 6.5-4.6 11.5-11 13C9.6 27.5 5 22.5 5 16V7z" />,
  gauge: (
    <>
      <path d="M5 24a11 11 0 1 1 22 0" />
      <path d="M16 24l6-8" />
      <circle cx="16" cy="24" r="2" />
    </>
  ),
  network: (
    <>
      <circle cx="16" cy="7" r="3.5" />
      <circle cx="7" cy="25" r="3.5" />
      <circle cx="25" cy="25" r="3.5" />
      <path d="M14.2 10.2L8.8 21.8M17.8 10.2l5.4 11.6M10.5 25h11" />
    </>
  ),
  disk: (
    <>
      <rect x="4" y="8" width="24" height="16" rx="3" />
      <circle cx="16" cy="16" r="4.5" />
      <path d="M16 11.5v9" />
    </>
  ),
  layers: (
    <>
      <path d="M16 3l12 6-12 6L4 9z" />
      <path d="M4 15l12 6 12-6M4 21l12 6 12-6" />
    </>
  ),
};

export const Glyph = ({ kind, x = 0, y = 0, size = 30, color = TONE.blue }) => (
  <g
    transform={`translate(${x} ${y}) scale(${size / 32})`}
    fill="none"
    stroke={color}
    strokeWidth="1.8"
    strokeLinecap="round"
    strokeLinejoin="round"
  >
    {GLYPHS[kind] || GLYPHS.server}
  </g>
);

// ── Scene pieces ────────────────────────────────────────────────────────────

// A component "photo": icon, name, live value and an optional bar.
export function Node({
  x,
  y,
  w = 156,
  h = 78,
  kind = 'server',
  label,
  sub,
  tone = TONE.blue,
  active = false,
  dim = false,
  value,
  badge,
  bar,
  onClick,
  children,
}) {
  const clickable = Boolean(onClick);
  return (
    <g
      transform={`translate(${x} ${y})`}
      opacity={dim ? 0.38 : 1}
      onClick={onClick}
      className={clickable ? 'cursor-pointer' : undefined}
    >
      {active && (
        <>
          <rect x="-7" y="-7" width={w + 14} height={h + 14} rx="19" fill={tone} opacity="0.09" />
          <rect
            x="-7"
            y="-7"
            width={w + 14}
            height={h + 14}
            rx="19"
            fill="none"
            stroke={tone}
            strokeOpacity="0.55"
            strokeWidth="1.4"
          />
        </>
      )}
      <rect
        width={w}
        height={h}
        rx="14"
        fill="#0a1322"
        stroke={active ? tone : '#1e293b'}
        strokeWidth={active ? 2 : 1.2}
      />
      <Glyph kind={kind} x={16} y={h / 2 - 15} size={30} color={tone} />
      <text x="56" y={h / 2 + (sub ? -4 : 5)} fontSize="13" fontWeight="700" fill="#e2e8f0">
        {label}
      </text>
      {sub && (
        <text x="56" y={h / 2 + 14} fontSize="10.5" fontFamily="ui-monospace, monospace" fill="#7f8da3">
          {sub}
        </text>
      )}
      {value !== undefined && (
        <text x={w - 12} y="21" textAnchor="end" fontSize="12" fontWeight="700" fontFamily="ui-monospace, monospace" fill={tone}>
          {value}
        </text>
      )}
      {badge && (
        <text x={w - 12} y={h - 12} textAnchor="end" fontSize="9" letterSpacing="1" fontFamily="ui-monospace, monospace" fill={tone}>
          {badge}
        </text>
      )}
      {Number.isFinite(bar) && (
        <>
          <rect x="12" y={h - 9} width={w - 24} height="4" rx="2" fill="#1e293b" />
          <rect x="12" y={h - 9} width={((w - 24) * clamp(bar, 0, 100)) / 100} height="4" rx="2" fill={tone} />
        </>
      )}
      {children}
    </g>
  );
}

export const Wire = ({ d, tone = TONE.blue, active = false, dashed = false }) => (
  <path
    d={d}
    fill="none"
    stroke={active ? tone : '#26364d'}
    strokeWidth={active ? 2.4 : 1.4}
    strokeDasharray={dashed ? '5 7' : undefined}
    strokeLinecap="round"
  />
);

export const Flow = ({ d, tone = TONE.green, count = 3, dur = 2.8, size = 3.2 }) => (
  <>
    {Array.from({ length: count }, (_, index) => (
      <circle key={index} r={size} fill={tone}>
        <animateMotion
          dur={`${dur}s`}
          begin={`${(index * dur) / count}s`}
          repeatCount="indefinite"
          path={d}
        />
      </circle>
    ))}
  </>
);

export const Tag = ({ x, y, text, tone = '#7dd3fc' }) => {
  const width = text.length * 6.1 + 18;
  return (
    <g transform={`translate(${x - width / 2} ${y - 11})`}>
      <rect width={width} height="22" rx="11" fill="#0b1526" stroke={tone} strokeOpacity="0.45" />
      <text x={width / 2} y="15" textAnchor="middle" fontSize="10.5" fontFamily="ui-monospace, monospace" fill={tone}>
        {text}
      </text>
    </g>
  );
};

// A numbered marker that sits above a component so the guide and the picture
// speak the same language.
export const StepDot = ({ x, y, index, tone = TONE.blue, active = false }) => (
  <g transform={`translate(${x} ${y})`}>
    <circle r="10" fill={active ? tone : '#0b1526'} stroke={active ? tone : '#26364d'} strokeWidth="1.2" />
    <text
      y="3.6"
      textAnchor="middle"
      fontSize="10"
      fontWeight="700"
      fontFamily="ui-monospace, monospace"
      fill={active ? '#04121f' : '#64748b'}
    >
      {index}
    </text>
  </g>
);

// A small "you are here" sign inside the scene.
export const Note = ({ x, y, text, tone = '#64748b' }) => (
  <text x={x} y={y} fontSize="10" fontFamily="ui-monospace, monospace" fill={tone} letterSpacing="0.4">
    {text}
  </text>
);

// ── Camera stage ────────────────────────────────────────────────────────────
// The camera badge: rendered above the picture on phones and floating over it
// from `sm` upwards, so the frame never reserves empty space for the overlay.
const HudBadge = ({ children, className = '' }) => (
  <span
    className={`rounded-full border border-white/10 bg-black/40 px-2.5 py-1 font-mono text-[10px] text-slate-300 ${className}`}
  >
    {children}
  </span>
);

// Controlled from the parent so a guide step can move the camera. A step that
// declares `focus` (a box around the part it talks about) is framed tightly by
// default; dragging, zooming or picking a camera angle takes over until the
// step changes, so the picture always follows the words on first read.
export function CameraStage({ cameras, camera, onCamera, focus, children, ariaLabel, note }) {
  const uid = useId().replace(/[^a-zA-Z0-9]/g, '');
  const gridId = `sd-grid-${uid}`;
  const [pan, setPan] = useState(null);
  const drag = useRef(null);
  const phone = usePhoneStage();
  const aspect = phone ? PHONE_ASPECT : WIDE_ASPECT;

  const index = Math.max(0, cameras.findIndex((item) => item.id === camera));
  const preset = cameras[index] || cameras[0];
  const home = framedView(focus ? focusBox(focus) : presetBox(preset), aspect);
  const homeKey = focus
    ? `${aspect.toFixed(3)}:${focus.cx}:${focus.cy}:${focus.w}:${focus.h}`
    : `${aspect.toFixed(3)}:${preset.id}`;
  const custom = pan && pan.key === homeKey ? pan.view : null;
  const view = custom || home;
  // While the camera is following a step's focus box, the preset name would be
  // wrong, so the badge says what is actually happening.
  const label = focus && !custom ? 'Step focus' : preset.label;
  const badge = `CAM ${index + 1} · ${label}`;

  const zoomBy = (factor) => {
    const w = clamp(view.w * factor, STAGE_W / 4, Math.min(STAGE_W, STAGE_H * aspect));
    const h = w / aspect;
    const cx = view.x + view.w / 2;
    const cy = view.y + view.h / 2;
    setPan({ key: homeKey, view: clampView({ x: cx - w / 2, y: cy - h / 2, w, h }) });
  };

  const startDrag = (event) => {
    event.currentTarget.setPointerCapture(event.pointerId);
    drag.current = { x: event.clientX, y: event.clientY, view };
  };

  const moveDrag = (event) => {
    if (!drag.current) return;
    const rect = event.currentTarget.getBoundingClientRect();
    const scale = drag.current.view.w / Math.max(rect.width, 1);
    setPan({
      key: homeKey,
      view: clampView({
        ...drag.current.view,
        x: drag.current.view.x - (event.clientX - drag.current.x) * scale,
        y: drag.current.view.y - (event.clientY - drag.current.y) * scale,
      }),
    });
  };

  const endDrag = (event) => {
    drag.current = null;
    if (event.currentTarget.hasPointerCapture?.(event.pointerId)) {
      event.currentTarget.releasePointerCapture(event.pointerId);
    }
  };

  return (
    <div>
      <div className="relative overflow-hidden rounded-2xl border border-slate-800 bg-[radial-gradient(circle_at_50%_8%,#0f2a47_0%,#050b15_72%)]">
        <div className="flex items-center justify-between gap-2 px-3 pb-1 pt-2 sm:hidden">
          <HudBadge className="uppercase tracking-wider">{badge}</HudBadge>
          <HudBadge>{Math.round((STAGE_W / view.w) * 100)}%</HudBadge>
        </div>
        <svg
          viewBox={`${view.x} ${view.y} ${view.w} ${view.h}`}
          className={`block h-auto w-full cursor-grab touch-none select-none active:cursor-grabbing ${phone ? 'aspect-[900/560]' : 'aspect-[900/420]'} sm:aspect-auto sm:h-[380px]`}
          preserveAspectRatio="xMidYMid meet"
          role="img"
          aria-label={ariaLabel}
          onPointerDown={startDrag}
          onPointerMove={moveDrag}
          onPointerUp={endDrag}
          onPointerCancel={endDrag}
        >
          <defs>
            <pattern id={gridId} width="30" height="30" patternUnits="userSpaceOnUse">
              <path d="M30 0H0V30" fill="none" stroke="#16283f" strokeWidth="0.7" />
            </pattern>
          </defs>
          <rect x="-900" y="-900" width="2700" height="2220" fill={`url(#${gridId})`} />
          {children}
        </svg>

        <HudBadge className="pointer-events-none absolute left-3 top-3 hidden uppercase tracking-wider backdrop-blur sm:block">
          {badge}
        </HudBadge>
        <HudBadge className="pointer-events-none absolute right-3 top-3 hidden backdrop-blur sm:block">
          {Math.round((STAGE_W / view.w) * 100)}%
        </HudBadge>
        <span className="pointer-events-none absolute bottom-2 right-3 hidden font-mono text-[9px] uppercase tracking-wider text-slate-600 sm:block">
          drag to pan
        </span>
      </div>

      <div className="mt-2 flex flex-wrap items-center gap-1.5">
        <span className="mr-1 text-[10px] uppercase tracking-wider text-slate-500">Camera</span>
        {cameras.map((shot) => (
          <button
            key={shot.id}
            type="button"
            onClick={() => {
              setPan({ key: homeKey, view: framedView(presetBox(shot), aspect) });
              onCamera(shot.id);
            }}
            aria-pressed={shot.id === preset.id}
            className={`rounded-lg px-2.5 py-1 text-[11px] font-medium transition ${
              shot.id === preset.id
                ? 'bg-slate-700 text-white'
                : 'text-slate-400 hover:bg-slate-800/70 hover:text-slate-200'
            }`}
          >
            {shot.label}
          </button>
        ))}
        <div className="ml-auto flex items-center gap-1">
          <button
            type="button"
            onClick={() => zoomBy(1.3)}
            aria-label="Zoom out"
            className="h-7 w-7 rounded-lg border border-slate-700 font-mono text-xs text-slate-300 hover:border-slate-500"
          >
            −
          </button>
          <button
            type="button"
            onClick={() => zoomBy(0.77)}
            aria-label="Zoom in"
            className="h-7 w-7 rounded-lg border border-slate-700 font-mono text-xs text-slate-300 hover:border-slate-500"
          >
            +
          </button>
          <button
            type="button"
            onClick={() => {
              setPan(null);
              onCamera(cameras[0].id);
            }}
            className="h-7 rounded-lg border border-slate-700 px-2 text-[11px] text-slate-300 hover:border-slate-500"
          >
            Reset
          </button>
        </div>
      </div>
      <p className="mt-1 text-[11px] text-slate-500">
        {note || 'Pick a camera angle, zoom in on a part, or drag the picture to pan.'}
      </p>
    </div>
  );
}

// ── Process guide ───────────────────────────────────────────────────────────

function ProcessGuide({ steps, selected, onSelect }) {
  const step = steps[selected] || steps[0];
  return (
    <div className="flex h-full flex-col rounded-2xl border border-slate-800 bg-navy-950/60 p-4">
      <div className="flex items-center justify-between">
        <p className="text-[10px] uppercase tracking-wider text-slate-500">Process, step by step</p>
        <span className="font-mono text-[10px] text-slate-500">
          {selected + 1} / {steps.length}
        </span>
      </div>

      <ol className="mt-2.5 space-y-1">
        {steps.map((item, index) => (
          <li key={item.title}>
            <button
              type="button"
              onClick={() => onSelect(index)}
              aria-current={index === selected}
              className={`flex w-full items-center gap-2 rounded-lg px-2 py-1.5 text-left transition ${
                index === selected ? 'bg-electric-600/15 text-white' : 'text-slate-400 hover:bg-slate-800/50'
              }`}
            >
              <span
                className={`flex h-5 w-5 shrink-0 items-center justify-center rounded-full border font-mono text-[10px] ${
                  index === selected
                    ? 'border-electric-400 bg-electric-500/20 text-electric-300'
                    : 'border-slate-700 text-slate-500'
                }`}
              >
                {index + 1}
              </span>
              <span className="flex-1 truncate text-[11px] font-semibold">{item.title}</span>
              {item.meta && <span className="font-mono text-[10px] text-slate-500">{item.meta}</span>}
            </button>
          </li>
        ))}
      </ol>

      <div className="mt-2.5 flex-1 rounded-xl border border-slate-800 bg-[#080d16] p-3">
        <p className="text-[10px] uppercase tracking-wider text-electric-400">In simple words</p>
        <p className="mt-1 text-[13px] leading-relaxed text-slate-200">{step.simple}</p>
        <p className="mt-2 border-t border-slate-800/80 pt-2 text-[11px] leading-relaxed text-slate-400">
          {step.detail}
        </p>
        {step.watch && (
          <p className="mt-1.5 font-mono text-[10.5px] leading-relaxed text-amber-300/90">{step.watch}</p>
        )}
      </div>

      <div className="mt-2.5 flex gap-2">
        <button
          type="button"
          onClick={() => onSelect(selected - 1)}
          className="flex-1 rounded-lg border border-slate-700 py-1.5 text-[11px] font-semibold text-slate-300 transition hover:border-slate-500 hover:text-white"
        >
          ← Previous
        </button>
        <button
          type="button"
          onClick={() => onSelect(selected + 1)}
          className="flex-1 rounded-lg border border-electric-500/40 bg-electric-500/10 py-1.5 text-[11px] font-semibold text-electric-300 transition hover:bg-electric-500/20"
        >
          Next step →
        </button>
      </div>
    </div>
  );
}

// Stage + guide side by side. The scene receives the selected step index so it
// can highlight the matching component, and the stage receives that step's
// focus box so the camera frames the part the guide is explaining.
export function ProcessScene({ cameras, steps, render, ariaLabel, note }) {
  const [selected, setSelected] = useState(0);
  const safe = Math.min(selected, steps.length - 1);
  const [camera, setCamera] = useState(cameras[0].id);

  const choose = (index) => {
    const next = (index + steps.length) % steps.length;
    setSelected(next);
    const target = steps[next]?.camera;
    if (target && cameras.some((item) => item.id === target)) setCamera(target);
  };

  return (
    <div className="mt-5 grid gap-4 lg:grid-cols-5">
      <div data-setup="7" className="lg:col-span-3">
        <CameraStage
          cameras={cameras}
          camera={camera}
          onCamera={setCamera}
          focus={steps[safe]?.focus}
          ariaLabel={ariaLabel}
          note={note}
        >
          {render(safe, steps[safe])}
        </CameraStage>
      </div>
      <div className="lg:col-span-2">
        <ProcessGuide steps={steps} selected={safe} onSelect={choose} />
      </div>
    </div>
  );
}
