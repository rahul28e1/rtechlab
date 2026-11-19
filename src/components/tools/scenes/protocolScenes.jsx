import React, { useEffect, useRef, useState } from 'react';
import { Stage, Device, Wire, Chip, Badge, Lock, Waves, Pulses, VideoTile } from './sceneKit';
import { C, MONO, SANS, LANE_Y, positionsFor, cameraFor } from './sceneTokens';

// ---------------------------------------------------------------- screens

const screenShell = (children) => <g>{children}</g>;

const desktopChrome = (title, subtitle) => (
  <g>
    <rect width="124" height="11" fill="#1b212b" />
    <circle cx="6" cy="5.5" r="1.9" fill="#ff5f57" />
    <circle cx="12.5" cy="5.5" r="1.9" fill="#febc2e" />
    <circle cx="19" cy="5.5" r="1.9" fill="#28c840" />
    <text x="26" y="7.8" fontSize="5.6" fontFamily={SANS} fill="rgba(255,255,255,0.72)">
      {title}
    </text>
    <rect y="11" width="124" height="61" fill="#080b10" />
    {subtitle}
  </g>
);

// RDP: workstation showing the remote session
const rdpClientScreen = (index) => {
  const live = index >= 4;
  if (!live) {
    return screenShell(
      <>
        {desktopChrome(
          'Remote Desktop Connection',
          <>
            <text x="62" y="30" textAnchor="middle" fontSize="7" fontFamily={MONO} fill="rgba(255,255,255,0.66)">
              mstsc → 10.0.5.12
            </text>
            <text x="62" y="41" textAnchor="middle" fontSize="5.6" fill="rgba(255,255,255,0.32)">
              connecting…
            </text>
            {[0, 1, 2].map((dot) => (
              <circle key={dot} cx={48 + dot * 8} cy="51" r="2.2" fill={C.client}>
                <animate
                  attributeName="opacity"
                  values="0.15;1;0.15"
                  dur="1.2s"
                  begin={`${dot * 0.2}s`}
                  repeatCount="indefinite"
                />
              </circle>
            ))}
            {index >= 2 && (
              <text x="62" y="65" textAnchor="middle" fontSize="5.4" fill={C.ok}>
                credentials accepted
              </text>
            )}
          </>,
        )}
      </>,
    );
  }

  return screenShell(
    <>
      {desktopChrome(
        'Remote Desktop Connection',
        <>
          <rect y="11" width="124" height="61" fill="url(#wallpaper)" />
          <VideoTile x={14} y={16} w={54} h={32} />
          <rect x="14" y="16" width="54" height="32" rx="2.5" fill="none" stroke="rgba(255,255,255,0.24)" />
          <text x="74" y="26" fontSize="5" fontFamily={SANS} fill="rgba(255,255,255,0.62)">
            remote window
          </text>
          <text x="74" y="34" fontSize="5" fontFamily={SANS} fill={C.client}>
            same video, mirrored
          </text>
          <rect y="60" width="124" height="12" fill="#0a1420" opacity="0.92" />
          <rect x="4" y="63" width="12" height="6" rx="1" fill="#2563eb" />
          <rect x="20" y="63" width="12" height="6" rx="1" fill="rgba(255,255,255,0.16)" />
          <path d="M92 42 l0 11 l3 -3 l2 4 l2.4 -1.2 l-2 -3.8 l4 0 z" fill="#fff" />
        </>,
      )}
    </>,
  );
};

// RDP: host desktop that owns the real video
const rdpHostScreen = (index) => {
  const live = index >= 4;
  return (
    <g>
      <rect width="140" height="78" fill="url(#wallpaper)" />
      <rect x="8" y="10" width="15" height="15" rx="2" fill="rgba(255,255,255,0.2)" />
      <rect x="8" y="30" width="15" height="15" rx="2" fill="rgba(255,255,255,0.12)" />
      <VideoTile x={46} y={14} w={72} h={42} />
      <text x="82" y="66" textAnchor="middle" fontSize="5.8" fontFamily={MONO} fill="rgba(255,255,255,0.6)">
        holiday.mp4
      </text>
      {live && (
        <g>
          <rect x="42" y="10" width="80" height="50" rx="2" fill="none" stroke={C.ok} strokeDasharray="3 3" />
          <text x="82" y="6" textAnchor="middle" fontSize="5.2" fill={C.ok}>
            capture region
          </text>
        </g>
      )}
      {index >= 2 && <Lock x={126} y={38} tone={C.ok} />}
    </g>
  );
};

// DHCP: Wi-Fi panel becoming a configured adapter
const dhcpClientScreen = (index) => {
  const leased = index >= 5;
  return (
    <g>
      <rect width="124" height="11" fill="#13171f" />
      <text x="6" y="7.6" fontSize="5.6" fontFamily={SANS} fill="rgba(255,255,255,0.6)">
        Wi-Fi
      </text>
      <rect y="11" width="124" height="61" fill="#080b10" />
      {leased ? (
        <g>
          <text x="7" y="24" fontSize="6" fill={C.ok}>
            connected
          </text>
          <text x="7" y="36" fontSize="5.6" fontFamily={MONO} fill="rgba(255,255,255,0.78)">
            IP 192.168.1.57
          </text>
          <text x="7" y="45" fontSize="5.2" fontFamily={MONO} fill="rgba(255,255,255,0.45)">
            GW 192.168.1.1
          </text>
          <text x="7" y="54" fontSize="5.2" fontFamily={MONO} fill="rgba(255,255,255,0.45)">
            DNS 192.168.1.1
          </text>
          <text x="7" y="66" fontSize="5" fontFamily={MONO} fill={C.client}>
            lease 24 h
          </text>
        </g>
      ) : (
        <g>
          <text x="7" y="24" fontSize="5.8" fill={C.client}>
            RTechLab-5G
          </text>
          <text x="7" y="34" fontSize="5.2" fill="rgba(255,255,255,0.35)">
            securing…
          </text>
          {index >= 1 && (
            <text x="7" y="45" fontSize="5.2" fill={C.ok}>
              password verified
            </text>
          )}
          <text x="7" y="60" fontSize="5.2" fontFamily={MONO} fill="rgba(255,255,255,0.3)">
            no IP yet
          </text>
        </g>
      )}
    </g>
  );
};

// DNS: browser waiting for the answer
const dnsClientScreen = (index) => (
  <g>
    <rect width="124" height="12" fill="#1b212b" />
    <rect x="4" y="3" width="102" height="6.5" rx="3.2" fill="#0b0e13" stroke="rgba(255,255,255,0.14)" />
    <text x="8" y="7.8" fontSize="4.8" fontFamily={MONO} fill="rgba(255,255,255,0.75)">
      example.com
    </text>
    <rect y="12" width="124" height="60" fill="#0a0d12" />
    {index >= 3 ? (
      <g>
        <text x="62" y="30" textAnchor="middle" fontSize="5.6" fill={C.ok}>
          page reachable
        </text>
        <text x="62" y="44" textAnchor="middle" fontSize="5.6" fontFamily={MONO} fill="rgba(255,255,255,0.72)">
          93.184.216.34
        </text>
        <rect x="18" y="52" width="88" height="4" rx="2" fill="rgba(255,255,255,0.12)" />
      </g>
    ) : (
      <g>
        <text x="62" y="32" textAnchor="middle" fontSize="5.6" fill="rgba(255,255,255,0.45)">
          resolving…
        </text>
        <text x="62" y="46" textAnchor="middle" fontSize="5" fontFamily={MONO} fill="rgba(255,255,255,0.28)">
          query → 1.1.1.1
        </text>
      </g>
    )}
  </g>
);

// TCP: terminal transcript
const tcpClientScreen = (index) => {
  const lines = [
    '$ nc 10.0.0.20 443',
    'SYN seq=1000 →',
    '← SYN-ACK seq=5000 ack=1001',
    'ACK ack=5001  [ESTABLISHED]',
    'FIN → ...',
  ];
  return (
    <g>
      <rect width="124" height="72" fill="#06090d" />
      {lines.slice(0, Math.min(index + 1, lines.length)).map((line, row) => (
        <text
          key={line}
          x="6"
          y={13 + row * 11}
          fontSize="5.4"
          fontFamily={MONO}
          fill={row === 0 ? C.ok : row === 3 ? C.client : 'rgba(255,255,255,0.62)'}
        >
          {line}
        </text>
      ))}
    </g>
  );
};

// ICMP: ping transcript
const icmpClientScreen = (index) => {
  const lines = ['$ ping 8.8.8.8', '64 bytes from 8.8.8.8', 'ttl=117 time=14 ms', '1 received, 0% loss'];
  return (
    <g>
      <rect width="124" height="72" fill="#06090d" />
      {lines.slice(0, Math.min(index + 1, lines.length)).map((line, row) => (
        <text
          key={line}
          x="6"
          y={14 + row * 12}
          fontSize="5.4"
          fontFamily={MONO}
          fill={row === 0 ? C.ok : row === 3 ? C.client : 'rgba(255,255,255,0.62)'}
        >
          {line}
        </text>
      ))}
    </g>
  );
};

// Browser page skeleton that fills in as the response arrives
const browserScreen = (index) => {
  const locked = index >= 4;
  const loaded = index >= 6;
  return (
    <g>
      <rect width="124" height="13" fill="#1b212b" />
      <circle cx="7" cy="6.5" r="2.2" fill={C.client} />
      <rect x="14" y="3.5" width="62" height="7" rx="3.5" fill="#0b0e13" stroke="rgba(255,255,255,0.14)" />
      <text x="18" y="8.6" fontSize="4.8" fontFamily={MONO} fill="rgba(255,255,255,0.75)">
        https://example.com
      </text>
      {locked && <Lock x={112} y={11} tone={C.ok} />}
      <rect y="13" width="124" height="59" fill="#0a0d12" />
      {loaded ? (
        <g>
          <rect x="6" y="18" width="112" height="9" rx="2" fill="rgba(255,255,255,0.16)" />
          <rect x="6" y="31" width="70" height="5" rx="2.5" fill="rgba(255,255,255,0.1)" />
          <rect x="6" y="40" width="86" height="5" rx="2.5" fill="rgba(255,255,255,0.08)" />
          <circle cx="98" cy="42" r="12" fill={C.client} fillOpacity="0.14" />
          <text x="98" y="45" textAnchor="middle" fontSize="6" fill={C.client}>
            200
          </text>
        </g>
      ) : (
        <g>
          <rect x="6" y="18" width="112" height="9" rx="2" fill="rgba(255,255,255,0.08)" />
          <rect x="6" y="31" width="70" height="5" rx="2.5" fill="rgba(255,255,255,0.06)" />
          <rect x="6" y="40" width="86" height="5" rx="2.5" fill="rgba(255,255,255,0.05)" />
          <text x="62" y="62" textAnchor="middle" fontSize="5.2" fill="rgba(255,255,255,0.35)">
            waiting for response…
          </text>
        </g>
      )}
    </g>
  );
};

const tlsClientScreen = (index) => (
  <g>
    <rect width="124" height="12" fill="#1b212b" />
    <rect x="4" y="3" width="102" height="6.5" rx="3.2" fill="#0b0e13" stroke="rgba(255,255,255,0.14)" />
    <text x="8" y="7.8" fontSize="4.8" fontFamily={MONO} fill="rgba(255,255,255,0.75)">
      example.com
    </text>
    <rect y="12" width="124" height="60" fill="#0a0d12" />
    <Lock x={62} y={30} open={index < 1} tone={index < 1 ? C.warn : C.ok} />
    <text x="62" y="52" textAnchor="middle" fontSize="5.4" fill={index < 1 ? C.warn : C.ok}>
      {index < 1 ? 'plaintext' : 'TLS 1.3 secure'}
    </text>
    <text x="62" y="63" textAnchor="middle" fontSize="4.8" fontFamily={MONO} fill="rgba(255,255,255,0.4)">
      AES-128-GCM
    </text>
  </g>
);

const tlsServerScreen = () => (
  <g>
    <rect width="140" height="78" fill="#080b10" />
    <rect x="8" y="8" width="124" height="62" rx="4" fill="rgba(191,90,242,0.1)" stroke={C.server} strokeOpacity="0.5" />
    <text x="16" y="20" fontSize="5.6" fontFamily={MONO} fill={C.server}>
      certificate
    </text>
    <text x="16" y="31" fontSize="5" fontFamily={MONO} fill="rgba(255,255,255,0.6)">
      CN example.com
    </text>
    <text x="16" y="41" fontSize="5" fontFamily={MONO} fill="rgba(255,255,255,0.45)">
      valid 90 days
    </text>
    <text x="16" y="51" fontSize="5" fontFamily={MONO} fill="rgba(255,255,255,0.45)">
      ECDHE x25519
    </text>
    <text x="16" y="62" fontSize="5" fontFamily={MONO} fill={C.ok}>
      signed by CA
    </text>
  </g>
);

const defaultClientScreen = () => (
  <g>
    <rect width="124" height="10" fill="#141922" />
    <text x="6" y="7" fontSize="5" fontFamily={SANS} fill="rgba(255,255,255,0.4)">
      desktop
    </text>
    <rect y="10" width="124" height="62" fill="url(#wallpaper)" opacity="0.7" />
    <rect x="34" y="22" width="56" height="34" rx="3" fill="rgba(0,0,0,0.35)" stroke="rgba(255,255,255,0.18)" />
    <rect x="38" y="26" width="48" height="4" rx="2" fill="rgba(255,255,255,0.18)" />
    <rect x="38" y="34" width="34" height="3" rx="1.5" fill="rgba(255,255,255,0.12)" />
  </g>
);

// ---------------------------------------------------------------- specs

const SPECS = {
  rdp: {
    kinds: { host: 'desktop' },
    screens: { client: rdpClientScreen, host: rdpHostScreen },
    labels: {
      client: 'mstsc',
      host: '3389',
    },
    wire: ['TCP SYN', 'X.224 req', 'CredSSP', 'MCS join', 'frame 1920×1080', 'close'],
  },
  dhcp: {
    screens: { client: dhcpClientScreen },
    wire: ['probe', 'WPA2 MIC', 'DISCOVER', 'OFFER 192.168.1.57', 'REQUEST', 'ACK', 'online'],
    extras: (index, step) => {
      if (step.effect === 'wifi') return 'wifi';
      return null;
    },
  },
  dns: {
    screens: { pc: dnsClientScreen },
    lines: (node, index) => {
      if (node.id === 'res') {
        return ['resolver', '1.1.1.1', index >= 3 ? 'cached' : 'cache: empty'];
      }
      if (node.id === 'root') return ['. root', '198.41.0.4', 'referral .com'];
      if (node.id === 'tld') return ['.com', '192.5.6.30', 'referral ns1'];
      if (node.id === 'auth') return ['example.com', '93.184.216.34', 'TTL 3600'];
      return null;
    },
    wire: ['A? example.com', 'query', 'referral', 'referral', 'A 93.184.216.34'],
  },
  tcp: {
    screens: { client: tcpClientScreen },
    lines: () => ['listen :443', 'SYN-ACK', 'ESTABLISHED'],
    wire: ['SYN', 'SYN-ACK', 'ACK', 'FIN', 'FIN-ACK'],
  },
  http: {
    screens: { client: browserScreen },
    lines: (node, index) => {
      if (node.id === 'lb') return ['edge', '203.0.113.5', index >= 5 ? 'forward' : 'waiting'];
      if (node.id === 'app') return ['app :8080', index >= 6 ? '200 OK' : 'idle', 'gzip'];
      return null;
    },
    wire: ['SYN', 'SYN-ACK', 'ACK', 'ClientHello', 'cert + keys', 'GET /', '200 OK', 'render'],
  },
  tls: {
    screens: { client: tlsClientScreen, server: tlsServerScreen },
    lines: () => ['listen :443', 'cert', 'ECDHE x25519'],
    wire: ['ClientHello', 'ServerHello', 'certificate', 'finished', 'plaintext'],
  },
  arp: {
    wire: ['Who has .1?', 'broadcast', 'I do', 'stored'],
    extras: (index) => (index === 0 ? 'wifi' : null),
  },
  icmp: {
    screens: { pc: icmpClientScreen },
    lines: () => ['router', 'NAT', 'echo reply'],
    wire: ['echo request', 'forwarded', 'echo reply', 'RTT 14 ms'],
  },
};

// ---------------------------------------------------------------- renderer

const colorFor = (type) => C[type] || C.cloud;

const kindFor = (spec, node) => {
  if (spec.kinds?.[node.id]) return spec.kinds[node.id];
  if (node.type === 'pc') return 'laptop';
  if (node.type === 'server') return 'server';
  if (node.type === 'router') return 'router';
  if (node.type === 'switch') return 'switch';
  if (node.type === 'cloud') return 'globe';
  return 'laptop';
};

const chipLabelFor = (spec, step, index) => {
  if (spec.wire?.[index]) return spec.wire[index];
  let label = step.title;
  if (label.includes(': ')) label = label.split(': ').slice(-1)[0];
  if (label.includes(' - ')) label = label.split(' - ')[0];
  if (label.includes(',')) label = label.split(',')[0];
  return label;
};

export const ProtocolScene = ({ lesson, stepIndex, speed = 1 }) => {
  const spec = SPECS[lesson.id] || {};
  const count = lesson.actors.length;
  const xs = positionsFor(count);
  const nodes = lesson.actors.map((actor, index) => ({ ...actor, x: xs[index], y: LANE_Y }));
  const step = lesson.steps[stepIndex];
  const fromIndex = Math.max(0, nodes.findIndex((node) => node.id === step.from));
  const toIndex = Math.max(0, nodes.findIndex((node) => node.id === step.to));
  const from = nodes[fromIndex];
  const to = nodes[toIndex];
  const low = Math.min(fromIndex, toIndex);
  const high = Math.max(fromIndex, toIndex);
  const duration = Math.round(1100 / Math.max(0.5, speed));

  const effect = spec.extras ? spec.extras(stepIndex, step) : null;

  // Follow the conversation: frame only the sender and the receiver.
  const target = cameraFor(from, to);
  const [viewBox, setViewBox] = useState(target);
  const current = useRef(target);
  const targetKey = target.join(',');

  useEffect(() => {
    const end = targetKey.split(',').map(Number);
    const start = current.current.slice();
    const started = performance.now();
    let frame = 0;
    const tick = (now) => {
      const progress = Math.min(1, (now - started) / 850);
      const eased = 1 - Math.pow(1 - progress, 3);
      const next = start.map((value, index) => value + (end[index] - value) * eased);
      current.current = next;
      setViewBox(next);
      if (progress < 1) frame = requestAnimationFrame(tick);
    };
    frame = requestAnimationFrame(tick);
    return () => cancelAnimationFrame(frame);
  }, [targetKey]);

  return (
    <Stage viewBox={viewBox}>
      {/* links */}
      {nodes.slice(0, -1).map((node, index) => {
        const next = nodes[index + 1];
        const active = index >= low && index < high;
        return (
          <Wire
            key={`wire-${node.id}`}
            from={node}
            to={next}
            active={active}
            color={colorFor(node.type)}
            dashed={!active}
          />
        );
      })}

      {/* radio waves for Wi-Fi steps, behind the devices */}
      {effect === 'wifi' && (
        <>
          <Waves x={from.x} y={from.y} tone={colorFor(from.type)} />
          <Pulses from={from} to={to} tone={colorFor(from.type)} />
        </>
      )}

      {/* devices */}
      {nodes.map((node) => {
        const active = node.id === step.from || node.id === step.to;
        const color = colorFor(node.type);
        const kind = kindFor(spec, node);
        const screen = spec.screens?.[node.id]?.(stepIndex, step);
        const lines = spec.lines?.(node, stepIndex) || (kind === 'server' ? [node.label, node.sub] : null);
        return (
          <Device
            key={node.id}
            id={`${lesson.id}-${node.id}`}
            x={node.x}
            y={node.y}
            kind={kind}
            color={color}
            active={active}
            name={node.label}
            addr={spec.labels?.[node.id] || node.sub}
            screen={screen || (kind === 'laptop' || kind === 'desktop' ? defaultClientScreen() : null)}
            lines={lines}
            ssid={lesson.id === 'dhcp' && node.type === 'router' ? 'RTechLab-5G' : null}
          />
        );
      })}

      {/* protocol-specific callouts */}
      {step.effect === 'auth' && <Badge x={to.x} y={to.y - 120} text={step.badge || 'AUTH VERIFIED'} />}
      {(step.effect === 'offer' || step.effect === 'ack') && (
        <Badge
          x={(from.x + to.x) / 2}
          y={from.y - 120}
          text={step.effect === 'offer' ? '192.168.1.57 OFFERED' : 'LEASE 24 H CONFIRMED'}
          tone={C.cloud}
        />
      )}
      {lesson.id === 'rdp' && stepIndex >= 2 && (
        <Badge x={to.x} y={to.y - 118} text="CREDSSP VERIFIED" />
      )}
      {lesson.id === 'tls' && stepIndex >= 2 && <Lock x={to.x + 96} y={to.y - 106} tone={C.ok} />}

      {/* the message travelling on the wire */}
      <Chip
        from={from}
        to={to}
        label={chipLabelFor(spec, step, stepIndex)}
        color={colorFor(from.type)}
        tone={colorFor(to.type)}
        duration={duration}
      />
    </Stage>
  );
};
