import React from 'react';
import { C, SANS, MONO, SCENE_W, SCENE_H, LANE_Y } from './sceneTokens';

export const Stage = ({ children, viewBox }) => (
  <div
    className="relative w-full rounded-[18px] overflow-hidden bg-[#06070a]"
    style={{ aspectRatio: '1.85' }}
  >
    <svg
      viewBox={(viewBox || [0, 0, SCENE_W, SCENE_H]).join(' ')}
      className="w-full h-full"
      preserveAspectRatio="xMidYMid meet"
      role="img"
    >
      <defs>
        <linearGradient id="sceneBg" x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor="#0b1220" stopOpacity="0.9" />
          <stop offset="55%" stopColor="#06070a" stopOpacity="0" />
          <stop offset="100%" stopColor="#101827" stopOpacity="0.7" />
        </linearGradient>
        <linearGradient id="videoGrad" x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor="#2563eb" />
          <stop offset="55%" stopColor="#7c3aed" />
          <stop offset="100%" stopColor="#f97316" />
        </linearGradient>
        <linearGradient id="wallpaper" x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor="#0f2f4f" />
          <stop offset="60%" stopColor="#14324a" />
          <stop offset="100%" stopColor="#1e2440" />
        </linearGradient>
        <pattern id="sceneGrid" width="40" height="40" patternUnits="userSpaceOnUse">
          <path d="M40 0 H0 V40" fill="none" stroke="rgba(255,255,255,0.035)" strokeWidth="1" />
        </pattern>
        <linearGradient id="edgeFadeLeft" x1="0" y1="0" x2="1" y2="0">
          <stop offset="0%" stopColor="#06070a" stopOpacity="1" />
          <stop offset="100%" stopColor="#06070a" stopOpacity="0" />
        </linearGradient>
        <linearGradient id="edgeFadeRight" x1="0" y1="0" x2="1" y2="0">
          <stop offset="0%" stopColor="#06070a" stopOpacity="0" />
          <stop offset="100%" stopColor="#06070a" stopOpacity="1" />
        </linearGradient>
      </defs>
      <rect width={SCENE_W} height={SCENE_H} fill="#06070a" />
      <rect width={SCENE_W} height={SCENE_H} fill="url(#sceneBg)" />
      <rect width={SCENE_W} height={SCENE_H} fill="url(#sceneGrid)" />
      {children}
      <rect x={viewBox ? viewBox[0] : 0} y={viewBox ? viewBox[1] : 0} width={viewBox ? viewBox[2] * 0.14 : 0} height={viewBox ? viewBox[3] : SCENE_H} fill="url(#edgeFadeLeft)" pointerEvents="none" />
      <rect
        x={viewBox ? viewBox[0] + viewBox[2] * 0.86 : 0}
        y={viewBox ? viewBox[1] : 0}
        width={viewBox ? viewBox[2] * 0.14 : 0}
        height={viewBox ? viewBox[3] : SCENE_H}
        fill="url(#edgeFadeRight)"
        pointerEvents="none"
      />
    </svg>
  </div>
);

const Laptop = ({ color, screen, clipId }) => (
  <g>
    <clipPath id={clipId}>
      <rect x="-62" y="-46" width="124" height="72" rx="3" />
    </clipPath>
    <rect
      x="-74"
      y="-56"
      width="148"
      height="94"
      rx="9"
      fill="#0c0f15"
      stroke={color}
      strokeWidth="1.6"
      strokeOpacity="0.85"
    />
    <rect x="-62" y="-46" width="124" height="72" rx="3" fill="#04060a" />
    <g clipPath={`url(#${clipId})`}>
      <g transform="translate(-62,-46)">{screen}</g>
    </g>
    <path
      d="M-74 38 h148 l-10 13 h-128 z"
      fill="#13171f"
      stroke={color}
      strokeWidth="1.3"
      strokeOpacity="0.8"
      strokeLinejoin="round"
    />
    <path d="M-26 44 h52" stroke={color} strokeOpacity="0.5" strokeWidth="2" strokeLinecap="round" />
  </g>
);

const Desktop = ({ color, screen, clipId }) => (
  <g>
    <clipPath id={clipId}>
      <rect x="-70" y="-52" width="140" height="78" rx="3" />
    </clipPath>
    <rect
      x="-82"
      y="-64"
      width="164"
      height="102"
      rx="9"
      fill="#0c0f15"
      stroke={color}
      strokeWidth="1.6"
      strokeOpacity="0.85"
    />
    <rect x="-70" y="-52" width="140" height="78" rx="3" fill="#04060a" />
    <g clipPath={`url(#${clipId})`}>
      <g transform="translate(-70,-52)">{screen}</g>
    </g>
    <rect x="-8" y="38" width="16" height="14" fill="#13171f" stroke={color} strokeWidth="1.2" strokeOpacity="0.7" />
    <rect
      x="-48"
      y="52"
      width="96"
      height="8"
      rx="4"
      fill="#13171f"
      stroke={color}
      strokeWidth="1.2"
      strokeOpacity="0.7"
    />
  </g>
);

const Rack = ({ color, lines = [] }) => (
  <g>
    <rect
      x="-64"
      y="-78"
      width="128"
      height="164"
      rx="11"
      fill="#0c0f15"
      stroke={color}
      strokeWidth="1.6"
      strokeOpacity="0.85"
    />
    {[-68, -28, 12, 52].map((y, index) => (
      <g key={y}>
        <rect x="-52" y={y} width="104" height="32" rx="5" fill={color} fillOpacity="0.1" stroke={color} strokeOpacity="0.3" />
        <circle cx="38" cy={y + 9} r="2.6" fill={color} fillOpacity={index === 0 ? 1 : 0.6} />
        <text x="-44" y={y + 13} fontSize="8.5" fontFamily={MONO} fill={color} fillOpacity="0.95">
          {lines[index] || ''}
        </text>
      </g>
    ))}
    <text x="0" y="98" textAnchor="middle" fontSize="7" fontFamily={MONO} fill="rgba(255,255,255,0.28)">
      {lines[4] || ''}
    </text>
  </g>
);

const Router = ({ color, ssid }) => (
  <g>
    <path d="M-34 -18 L-50 -46" stroke={color} strokeWidth="1.8" strokeLinecap="round" />
    <path d="M34 -18 L50 -46" stroke={color} strokeWidth="1.8" strokeLinecap="round" />
    <circle cx="-50" cy="-47" r="2.6" fill={color} />
    <circle cx="50" cy="-47" r="2.6" fill={color} />
    <rect
      x="-56"
      y="-20"
      width="112"
      height="42"
      rx="11"
      fill={color}
      fillOpacity="0.12"
      stroke={color}
      strokeWidth="1.6"
      strokeOpacity="0.85"
    />
    <rect x="-38" y="-8" width="76" height="12" rx="3" fill={color} fillOpacity="0.25" />
    {[-46, -36, -26].map((cx) => (
      <circle key={cx} cx={cx} cy="12" r="2.6" fill={color} />
    ))}
    <path d="M4 8 a14 14 0 0 1 18 0" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" />
    <path d="M8 12 a9 9 0 0 1 10 0" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" />
    {ssid && (
      <text y="44" textAnchor="middle" fontSize="9" fontFamily={MONO} fill={color} fillOpacity="0.85">
        {ssid}
      </text>
    )}
  </g>
);

const SwitchBox = ({ color, ports = 8 }) => (
  <g>
    <rect
      x="-64"
      y="-26"
      width="128"
      height="50"
      rx="8"
      fill={color}
      fillOpacity="0.1"
      stroke={color}
      strokeWidth="1.6"
      strokeOpacity="0.85"
    />
    <rect x="-64" y="-38" width="128" height="12" rx="4" fill={color} fillOpacity="0.14" stroke={color} strokeOpacity="0.4" />
    {Array.from({ length: ports }, (_, index) => (
      <rect
        key={index}
        x={-54 + index * 14}
        y="2"
        width="8"
        height="10"
        rx="1.5"
        fill={color}
        fillOpacity="0.8"
      />
    ))}
    <circle cx="50" cy="17" r="2.6" fill={color} />
  </g>
);

const Globe = ({ color }) => (
  <g>
    <circle r="62" fill={color} fillOpacity="0.1" stroke={color} strokeWidth="1.6" strokeOpacity="0.9" />
    <g fill="none" stroke={color} strokeOpacity="0.4" strokeWidth="1.1">
      <ellipse rx="62" ry="22" />
      <ellipse rx="62" ry="42" />
      <ellipse rx="22" ry="62" />
      <ellipse rx="42" ry="62" />
      <path d="M0 -62 V62" strokeOpacity="0.25" />
    </g>
    {[
      [26, -22],
      [-20, 18],
      [10, 38],
    ].map(([cx, cy]) => (
      <circle key={`${cx}-${cy}`} cx={cx} cy={cy} r="3" fill={color} />
    ))}
  </g>
);

const GLYPHS = { laptop: Laptop, desktop: Desktop, server: Rack, router: Router, switch: SwitchBox, globe: Globe };

export const Device = ({ x, y = LANE_Y, kind = 'laptop', color, active, name, addr, note, screen, lines, ssid, id }) => {
  const Glyph = GLYPHS[kind] || Laptop;
  return (
    <g transform={`translate(${x}, ${y})`}>
      <ellipse cx="0" cy="78" rx="112" ry="18" fill={color} opacity={active ? 0.12 : 0.04} />
      {active && (
        <circle r="106" fill="none" stroke={color} strokeOpacity="0.3" strokeDasharray="3 8" strokeWidth="1.2" />
      )}
      <g opacity={active ? 1 : 0.55}>
        <Glyph color={color} screen={screen} clipId={`clip-${id}`} lines={lines} ssid={ssid} />
      </g>
      <text
        y="104"
        textAnchor="middle"
        fontSize="15"
        fontFamily={SANS}
        fill={active ? C.text : 'rgba(255,255,255,0.6)'}
        fontWeight={active ? 600 : 400}
      >
        {name}
      </text>
      <text y="124" textAnchor="middle" fontSize="11" fontFamily={MONO} fill={color} fillOpacity={active ? 0.95 : 0.55}>
        {addr}
      </text>
      {note && (
        <text y="142" textAnchor="middle" fontSize="10" fill="rgba(255,255,255,0.4)">
          {note}
        </text>
      )}
    </g>
  );
};

export const Wire = ({ from, to, color, active, dashed }) => (
  <g>
    <line
      x1={from.x}
      y1={from.y}
      x2={to.x}
      y2={to.y}
      stroke="rgba(255,255,255,0.1)"
      strokeWidth="2"
      strokeLinecap="round"
    />
    {dashed && (
      <line
        x1={from.x}
        y1={from.y}
        x2={to.x}
        y2={to.y}
        stroke="rgba(255,255,255,0.2)"
        strokeWidth="1.4"
        strokeDasharray="2 8"
        strokeLinecap="round"
      />
    )}
    {active && (
      <line x1={from.x} y1={from.y} x2={to.x} y2={to.y} stroke={color} strokeWidth="2.2" strokeLinecap="round">
        <animate attributeName="stroke-dasharray" values="0 16;16 16" dur="1.1s" repeatCount="indefinite" />
      </line>
    )}
  </g>
);

const chipWidth = (label) => Math.max(62, label.length * 6.4 + 30);

export const Chip = ({ from, to, label, color, duration, tone }) => {
  const width = chipWidth(label);
  const travel = duration || 1100;
  return (
    <g>
      <animateMotion
        dur={`${travel}ms`}
        fill="freeze"
        path={`M${from.x},${from.y} L${to.x},${to.y}`}
        calcMode="spline"
        keyTimes="0;1"
        keyPoints="0;1"
        keySplines="0.2 1 0.35 1"
      />
      <animate attributeName="opacity" values="1;1;0" keyTimes="0;0.84;1" dur={`${travel}ms`} fill="freeze" />
      <rect
        x={-width / 2}
        y="-16"
        width={width}
        height="32"
        rx="16"
        fill="#0a0c11"
        stroke={tone || color}
        strokeOpacity="0.85"
      />
      <circle cx={-width / 2 + 15} cy="0" r="3.4" fill={tone || color} />
      <text x={6} y="4.5" textAnchor="middle" fontSize="11.5" fontFamily={MONO} fill={C.text}>
        {label}
      </text>
    </g>
  );
};

export const Badge = ({ x, y, text, tone = C.ok, icon = true }) => {
  const width = text.length * 6.8 + (icon ? 44 : 24);
  return (
    <g transform={`translate(${x}, ${y})`}>
      <rect
        x={-width / 2}
        y="-15"
        width={width}
        height="30"
        rx="15"
        fill="rgba(8,10,14,0.9)"
        stroke={tone}
        strokeOpacity="0.9"
      />
      {icon && (
        <path
          d={`M${-width / 2 + 14} 0 l4 4 l8 -9`}
          fill="none"
          stroke={tone}
          strokeWidth="2"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
      )}
      <text x={icon ? 8 : 0} y="4" textAnchor="middle" fontSize="11" fontFamily={MONO} fill={tone}>
        {text}
      </text>
    </g>
  );
};

export const Lock = ({ x, y, open, tone = C.ok }) => (
  <g transform={`translate(${x}, ${y})`}>
    <rect x="-9" y="-2" width="18" height="14" rx="3" fill={tone} fillOpacity="0.2" stroke={tone} strokeWidth="1.4" />
    <path
      d={open ? 'M-5 -2 v-4 a5 5 0 0 1 10 0' : 'M-5 -2 v-3 a5 5 0 0 1 10 0 v3'}
      fill="none"
      stroke={tone}
      strokeWidth="1.4"
      strokeLinecap="round"
    />
    <circle cx="0" cy="5" r="1.6" fill={tone} />
  </g>
);

export const Waves = ({ x, y, tone = C.client }) =>
  [0, 1, 2].map((ring) => (
    <circle key={ring} cx={x} cy={y} r="24" fill="none" stroke={tone} strokeWidth="2">
      <animate attributeName="r" from="30" to="148" dur="2.4s" begin={`${ring * 0.8}s`} repeatCount="indefinite" />
      <animate attributeName="opacity" values="0.7;0" dur="2.4s" begin={`${ring * 0.8}s`} repeatCount="indefinite" />
    </circle>
  ));

export const Pulses = ({ from, to, tone = C.client }) =>
  [0, 1, 2].map((pulse) => (
    <circle key={pulse} r="4" fill={tone} opacity="0">
      <animateMotion
        dur="1.8s"
        begin={`${pulse * 0.6}s`}
        repeatCount="indefinite"
        path={`M${from.x},${from.y} L${to.x},${to.y}`}
        calcMode="spline"
        keyTimes="0;1"
        keyPoints="0;1"
        keySplines="0.3 0 0.7 1"
      />
      <animate attributeName="opacity" values="0;0.95;0" dur="1.8s" begin={`${pulse * 0.6}s`} repeatCount="indefinite" />
    </circle>
  ));

export const VideoTile = ({ x, y, w, h, progress = 0.35 }) => (
  <g transform={`translate(${x},${y})`}>
    <rect width={w} height={h} rx="2.5" fill="#070b12" />
    <rect width={w} height={h} rx="2.5" fill="url(#videoGrad)" opacity="0.92" />
    <circle cx={w / 2} cy={h / 2} r={Math.min(w, h) * 0.24} fill="rgba(0,0,0,0.38)" stroke="rgba(255,255,255,0.75)" />
    <path
      d={`M${w / 2 - 3.5},${h / 2 - 5} L${w / 2 + 6},${h / 2} L${w / 2 - 3.5},${h / 2 + 5} z`}
      fill="#fff"
    />
    <rect x="4" y={h - 6} width={w - 8} height="2.2" rx="1.1" fill="rgba(255,255,255,0.28)" />
    <rect x="4" y={h - 6} width={(w - 8) * progress} height="2.2" rx="1.1" fill="#fff" />
  </g>
);
