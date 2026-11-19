// Presentation metadata for the Protocol Explorer dashboard.
// Kept separate from the lesson content so the teaching data stays clean.

export const lessonMeta = {
  dns: {
    osi: 7,
    port: '53',
    transport: 'UDP (TCP for large answers)',
    security: 'Cleartext — DNSSEC adds authenticity, not privacy',
    layerNote: 'Application',
  },
  tcp: {
    osi: 4,
    port: 'any (49152 → 443 here)',
    transport: 'TCP',
    security: 'None — the payload is whatever the app sends',
    layerNote: 'Transport',
  },
  http: {
    osi: 7,
    port: '443 (HTTPS) / 80 (HTTP)',
    transport: 'TCP, or QUIC over UDP for HTTP/3',
    security: 'TLS 1.3 at the edge',
    layerNote: 'Application (HTTP over TLS)',
  },
  tls: {
    osi: 5,
    port: '443',
    transport: 'TCP',
    security: 'TLS 1.3, AEAD ciphers, ephemeral keys',
    layerNote: 'Session',
  },
  arp: {
    osi: 2,
    port: 'none',
    transport: 'Ethernet — no IP involved',
    security: 'Unauthenticated — ARP spoofing is possible',
    layerNote: 'Data link',
  },
  dhcp: {
    osi: 7,
    port: '67 server / 68 client',
    transport: 'UDP',
    security: 'Unauthenticated — use DHCP snooping on switches',
    layerNote: 'Application',
  },
  rdp: {
    osi: 7,
    port: '3389 (TCP, plus UDP for shortpath)',
    transport: 'TCP, optionally UDP 3389',
    security: 'TLS + CredSSP (NLA), then AES session encryption',
    layerNote: 'Application',
  },
  icmp: {
    osi: 3,
    port: 'none (IP protocol 1)',
    transport: 'IP',
    security: 'No authentication — commonly rate-limited',
    layerNote: 'Network',
  },
};

export const protocolColors = {
  DNS: '#f5a623',
  TCP: '#34c759',
  'TLS 1.3': '#2997ff',
  HTTP: '#bf5af2',
  ARP: '#ff9f0a',
  DHCP: '#30d158',
  ICMP: '#ffd60a',
  RDP: '#ff6b6b',
};

export const lessonColors = {
  dns: '#f5a623',
  tcp: '#34c759',
  http: '#bf5af2',
  tls: '#2997ff',
  arp: '#ff9f0a',
  dhcp: '#30d158',
  icmp: '#ffd60a',
  rdp: '#ff6b6b',
};

// Which protocol a single message belongs to (used by the flow table + legend).
export const stepProtocol = (lessonId, title) => {
  if (lessonId === 'http') {
    if (/tls/i.test(title)) return 'TLS 1.3';
    if (/tcp/i.test(title)) return 'TCP';
    return 'HTTP';
  }
  if (lessonId === 'rdp') {
    if (/tcp/i.test(title)) return 'TCP';
    if (/tls/i.test(title)) return 'TLS 1.3';
    return 'RDP';
  }
  if (lessonId === 'tls') return 'TLS 1.3';
  if (lessonId === 'tcp') return 'TCP';
  if (lessonId === 'dns') return 'DNS';
  if (lessonId === 'arp') return 'ARP';
  if (lessonId === 'dhcp') return 'DHCP';
  return 'ICMP';
};

export const stepProtocolColor = (protocol) => protocolColors[protocol] || '#a1a1a6';

// Illustrative timestamps and sizes, derived from the decoded fields.
export const stepTime = (index) => `${(0.008 + index * 0.006).toFixed(3)}s`;

export const stepSize = (step) => {
  const fields = step.fields || [];
  const hexBytes = fields.reduce(
    (sum, field) => sum + (field.hex || '').trim().split(/\s+/).filter(Boolean).length,
    0
  );
  const textFields = fields.filter((field) => !field.hex).length;
  const total = hexBytes + textFields * 24 + 24;
  return total >= 1000 ? `${(total / 1024).toFixed(1)} KB` : `${total} B`;
};
