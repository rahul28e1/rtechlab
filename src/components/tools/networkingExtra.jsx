import React from 'react';
import { FormTool, InfoList } from './kit';
import { Panel } from './toolUi';

const toInt = (ip) => (ip || '').trim().split('.').reduce((acc, octet) => (acc * 256) + Number(octet || 0), 0);
const toIp = (value) => [24, 16, 8, 0].map((shift) => Math.floor(value / Math.pow(2, shift)) % 256).join('.');
const isIp = (ip) => /^(\d{1,3}\.){3}\d{1,3}$/.test((ip || '').trim()) && (ip || '').trim().split('.').every((o) => Number(o) <= 255);

const PREFIXES = Array.from({ length: 33 }, (_, index) => ({ value: index, label: `/${index}` }));

export const CidrNetmask = () => (
  <FormTool
    fields={[{ key: 'prefix', label: 'CIDR prefix', type: 'select', numeric: true, default: 24, options: PREFIXES }]}
    compute={({ prefix }) => {
      const p = Number(prefix);
      const mask = p === 0 ? 0 : (0xFFFFFFFF << (32 - p)) >>> 0;
      const wildcard = (~mask) >>> 0;
      const block = Math.pow(2, 32 - p);
      const usable = p === 32 ? 1 : p === 31 ? 2 : block - 2;
      const bin = (num) => (num >>> 0).toString(2).padStart(32, '0').match(/.{8}/g).join('.');
      return {
        stats: [
          { label: 'Subnet mask', value: toIp(mask), tone: 'text-white' },
          { label: 'Wildcard mask', value: toIp(wildcard), tone: 'text-amber-300', hint: 'Use this in Cisco ACLs' },
          { label: 'Block size', value: block.toLocaleString(), tone: 'text-cyan-300', hint: `${block} addresses per subnet` },
          { label: 'Usable hosts', value: usable.toLocaleString(), tone: 'text-emerald-400' },
        ],
        lines: [
          { label: 'Prefix', value: `/${p}` },
          { label: 'Mask in binary', value: bin(mask) },
          { label: 'Host bits', value: String(32 - p) },
          { label: 'Subnet increment', value: `+${block} in the ${p >= 24 ? '4th' : p >= 16 ? '3rd' : '2nd'} octet` },
        ],
        note: p === 31
          ? 'RFC 3021: a /31 is a point-to-point link with two usable addresses and no broadcast.'
          : p === 32
            ? 'A /32 is a single host route — used for loopbacks and host-specific firewall rules.'
            : `Memorise the pattern: /${p} leaves ${32 - p} host bits, so 2^${32 - p} = ${block} addresses and ${usable} usable hosts.`,
      };
    }}
  />
);

export const IpRangeCidr = () => (
  <FormTool
    fields={[
      { key: 'start', label: 'First IP', type: 'text', default: '10.0.0.0', placeholder: '10.0.0.0' },
      { key: 'end', label: 'Last IP', type: 'text', default: '10.0.3.255', placeholder: '10.0.3.255' },
    ]}
    compute={({ start, end }) => {
      if (!isIp(start) || !isIp(end)) return { error: 'Enter two valid IPv4 addresses.' };
      let s = toInt(start);
      const e = toInt(end);
      if (s > e) return { error: 'The first IP must be lower than the last IP.' };
      if (e - s > 4294967) return { error: 'That range is too large to summarise (over 4 million addresses).' };
      const blocks = [];
      while (s <= e && blocks.length < 200) {
        let size = 1;
        while (size * 2 <= 4294967296 && s % (size * 2) === 0 && s + size * 2 - 1 <= e) size *= 2;
        blocks.push(`${toIp(s)}/${32 - Math.log2(size)}`);
        s += size;
      }
      return {
        stats: [
          { label: 'CIDR blocks', value: blocks.length, tone: 'text-cyan-300' },
          { label: 'Addresses covered', value: (e - toInt(start) + 1).toLocaleString(), tone: 'text-emerald-400' },
        ],
        lines: blocks.map((block, index) => ({ label: `Block ${index + 1}`, value: block })),
        note: 'Paste these blocks into a firewall rule, security group or route table. Fewer blocks means faster matching.',
      };
    }}
  />
);

export const DhcpLease = () => (
  <FormTool
    fields={[
      { key: 'prefix', label: 'Subnet prefix', type: 'select', numeric: true, default: 24, options: PREFIXES.filter((p) => p.value >= 16 && p.value <= 30) },
      { key: 'devices', label: 'Devices to serve', type: 'number', default: 120, min: 1 },
      { key: 'lease', label: 'Lease (hours)', type: 'number', default: 8, min: 1 },
      { key: 'reserved', label: 'Reserved addresses', type: 'number', default: 10, min: 0, hint: 'Gateway, printers, servers' },
    ]}
    compute={({ prefix, devices, lease, reserved }) => {
      const block = Math.pow(2, 32 - Number(prefix));
      const usable = block - 2;
      const pool = Math.max(0, usable - (Number(reserved) || 0));
      const need = Number(devices) || 0;
      const leaseHours = Number(lease) || 1;
      return {
        stats: [
          { label: 'Usable addresses', value: usable.toLocaleString() },
          { label: 'DHCP pool', value: pool.toLocaleString(), tone: 'text-cyan-300', hint: `After ${reserved} reserved` },
          { label: 'Needed for devices', value: need.toLocaleString() },
          { label: 'Pool verdict', value: pool >= need ? 'Enough' : 'Too small', tone: pool >= need ? 'text-emerald-400' : 'text-red-400' },
        ],
        lines: [
          { label: 'Renewal T1 (50%)', value: `${(leaseHours / 2).toFixed(1)} h` },
          { label: 'Rebind T2 (87.5%)', value: `${(leaseHours * 0.875).toFixed(1)} h` },
          { label: 'Lease expiry', value: `${leaseHours} h` },
          { label: 'Suggested scope', value: `${(100 * need / Math.max(pool, 1)).toFixed(0)}% of the pool in use` },
        ],
        note: pool >= need
          ? 'Leave at least 20% spare in the pool: guests, phones and temporary devices all take leases.'
          : 'The pool cannot serve every device. Use a larger prefix, shorten the lease, or split the network with a second scope.',
        noteTone: pool >= need ? 'ok' : 'warn',
      };
    }}
    />
);

const OUI = {
  '00:1A:2B': 'Cisco Systems', '00:00:0C': 'Cisco Systems', '00:1B:54': 'Cisco Systems',
  '00:50:56': 'VMware', '00:0C:29': 'VMware', '08:00:27': 'Oracle VirtualBox',
  '00:1C:42': 'Parallels', '3C:5A:B4': 'Google', 'F4:F5:D8': 'Google',
  '00:1D:D8': 'Microsoft', '00:15:5D': 'Microsoft Hyper-V', 'AC:DE:48': 'Private (locally administered)',
  'B8:27:EB': 'Raspberry Pi', 'DC:A6:32': 'Raspberry Pi', 'E4:5F:01': 'Raspberry Pi',
  '00:1E:C2': 'Apple', 'F0:18:98': 'Apple', 'A4:83:E7': 'Apple',
  '00:24:E8': 'Dell', 'B8:2A:72': 'Dell', '3C:2A:F4': 'Brother',
  '00:1F:3B': 'Intel', '8C:16:45': 'Intel', 'F8:63:3F': 'Samsung',
  '44:65:0D': 'Amazon Technologies', '0A:00:27': 'VirtualBox host-only',
};

export const MacOui = () => (
  <FormTool
    fields={[{ key: 'mac', label: 'MAC address', type: 'text', default: '00:1A:2B:3C:4D:5E', placeholder: '00:1A:2B:3C:4D:5E' }]}
    compute={({ mac }) => {
      const clean = (mac || '').toUpperCase().replace(/[^0-9A-F]/g, '');
      if (clean.length !== 12) return { error: 'A MAC address must contain 12 hexadecimal digits (6 bytes).' };
      const octets = clean.match(/.{2}/g);
      const formatted = octets.join(':');
      const oui = octets.slice(0, 3).join(':');
      const first = parseInt(octets[0], 16);
      const multicast = (first & 1) === 1;
      const local = (first & 2) === 2;
      return {
        stats: [
          { label: 'Vendor (OUI)', value: OUI[oui] || 'Unknown in this table', tone: 'text-cyan-300' },
          { label: 'OUI', value: oui },
          { label: 'Address type', value: multicast ? 'Multicast' : 'Unicast', tone: 'text-emerald-400' },
          { label: 'Administration', value: local ? 'Locally assigned' : 'Globally unique (vendor)', tone: 'text-amber-300' },
        ],
        lines: [
          { label: 'Normalised', value: formatted },
          { label: 'Cisco style', value: octets.join('.').toLowerCase().replace(/(.{4})/g, '$1.').replace(/\.$/, '') },
          { label: 'First byte bits', value: first.toString(2).padStart(8, '0') },
        ],
        note: 'Bit 0 of the first byte marks multicast, bit 1 marks a locally administered address — which is how virtual machines and Wi-Fi privacy MACs appear.',
      };
    }}
  />
);

export const Ipv6Subnet = () => (
  <FormTool
    fields={[
      { key: 'base', label: 'Base /48 network', type: 'text', default: '2001:db8:1::', placeholder: '2001:db8:1::' },
      { key: 'count', label: 'How many /64s to list', type: 'number', default: 8, min: 1, max: 50 },
    ]}
    compute={({ base, count }) => {
      const parts = (base || '').split(':');
      if (parts.length < 4) return { error: 'Enter a /48 prefix such as 2001:db8:1:: — four hextets before the subnet part.' };
      const hextets = [parts[0], parts[1], parts[2], parts[3] || '0'];
      if (hextets.some((part) => part === '' || !/^[0-9a-fA-F]{1,4}$/.test(part))) {
        return { error: 'Each hextet must be 1–4 hex characters, for example 2001:db8:1:0::' };
      }
      const subnets = [];
      const first = parseInt(hextets[3], 16);
      for (let index = 0; index < Math.min(Number(count) || 1, 50); index += 1) {
        const value = (first + index).toString(16);
        subnets.push(`${hextets[0]}:${hextets[1]}:${hextets[2]}:${value}::/64`);
      }
      return {
        stats: [
          { label: 'Total /64 subnets', value: '65,536', tone: 'text-cyan-300', hint: '2^(64−48)' },
          { label: 'Hosts per /64', value: '18,446,744,073,709,551,616', hint: 'Never subnet below /64' },
          { label: 'Listed here', value: subnets.length },
          { label: 'SLAAC', value: 'Supported', tone: 'text-emerald-400' },
        ],
        lines: subnets.map((subnet, index) => ({ label: `VLAN ${index + 1}`, value: subnet })),
        note: 'Standard practice: one /64 per VLAN, and never smaller than /64 because SLAAC needs 64 host bits.',
      };
    }}
  />
);

const CHANNELS_24 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
const CHANNELS_5 = [36, 40, 44, 48, 52, 56, 60, 64, 100, 104, 108, 112, 116, 120, 124, 128, 132, 136, 140, 144, 149, 153, 157, 161, 165];

export const WifiChannels = () => (
  <div className="space-y-5">
    <Panel>
      <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">2.4 GHz — only 1, 6 and 11 do not overlap</h2>
      <div className="flex flex-wrap gap-1.5">
        {CHANNELS_24.map((channel) => {
          const clean = [1, 6, 11].includes(channel);
          return (
            <span key={channel} className={`rounded-lg border px-2.5 py-1 font-mono text-xs ${clean ? 'border-emerald-500/40 bg-emerald-500/10 text-emerald-300' : 'border-slate-800 text-slate-500'}`}>
              {channel}
            </span>
          );
        })}
      </div>
      <p className="mt-3 text-[11px] leading-relaxed text-slate-500">
        2.4 GHz has 13 channels but each is 20 MHz wide, so only three can run without interference. In a hostel or apartment, set your router to 1, 6 or 11 — whichever is least crowded.
      </p>
    </Panel>

    <Panel>
      <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">5 GHz — all channels below are non-overlapping</h2>
      <div className="flex flex-wrap gap-1.5">
        {CHANNELS_5.map((channel) => (
          <span key={channel} className="rounded-lg border border-slate-800 bg-navy-950 px-2.5 py-1 font-mono text-xs text-cyan-300">
            {channel}
          </span>
        ))}
      </div>
      <p className="mt-3 text-[11px] leading-relaxed text-slate-500">
        5 GHz gives far more clean channels but shorter range. Prefer 80 MHz channels (36, 40, 44, 48 group together) for speed, and 20/40 MHz for many users.
      </p>
    </Panel>
  </div>
);

const CABLES = [
  { value: 'cat5e', label: 'Cat 5e copper (1 Gbps, 100 m)' },
  { value: 'cat6', label: 'Cat 6 copper (10 Gbps to 55 m)' },
  { value: 'cat6a', label: 'Cat 6a copper (10 Gbps, 100 m)' },
  { value: 'om3', label: 'OM3 multimode fibre (10 Gbps, 300 m)' },
  { value: 'os2', label: 'OS2 single-mode fibre (long haul)' },
];

export const CableBudget = () => (
  <FormTool
    fields={[
      { key: 'type', label: 'Cable type', type: 'select', default: 'cat6', options: CABLES },
      { key: 'distance', label: 'Distance (metres)', type: 'number', default: 80, min: 1 },
      { key: 'connectors', label: 'Connectors / patch panels', type: 'number', default: 2, min: 0 },
      { key: 'splices', label: 'Splices', type: 'number', default: 0, min: 0 },
    ]}
    compute={({ type, distance, connectors, splices }) => {
      const metres = Number(distance) || 0;
      if (type === 'cat5e' || type === 'cat6' || type === 'cat6a') {
        const limit = type === 'cat6' ? 55 : 100;
        return {
          stats: [
            { label: 'Distance limit', value: `${limit} m`, tone: 'text-cyan-300' },
            { label: 'Your distance', value: `${metres} m` },
            { label: 'Verdict', value: metres <= limit ? 'Pass' : 'Too long', tone: metres <= limit ? 'text-emerald-400' : 'text-red-400' },
            { label: 'Headroom', value: `${Math.max(0, limit - metres)} m` },
          ],
          note: type === 'cat6'
            ? 'Cat 6 only reaches 10 Gbps up to 55 m. Beyond that it falls back to 1 Gbps — use Cat 6a or fibre for a full 100 m run.'
            : 'Copper Ethernet is limited to 100 m per run including patch leads. For longer distances, convert to fibre.',
          noteTone: metres <= limit ? 'ok' : 'error',
        };
      }
      const attenuation = type === 'om3' ? 3.5 : 0.4; // dB per km, rough 850nm / 1310nm figures
      const loss = (metres / 1000) * attenuation + (Number(connectors) || 0) * 0.3 + (Number(splices) || 0) * 0.1;
      const budget = type === 'om3' ? 3.5 : 8.0;
      return {
        stats: [
          { label: 'Estimated loss', value: `${loss.toFixed(2)} dB`, tone: 'text-cyan-300' },
          { label: 'Link budget', value: `${budget.toFixed(1)} dB` },
          { label: 'Verdict', value: loss <= budget ? 'Pass' : 'Fails', tone: loss <= budget ? 'text-emerald-400' : 'text-red-400' },
          { label: 'Margin', value: `${(budget - loss).toFixed(2)} dB`, tone: 'text-amber-300' },
        ],
        lines: [
          { label: 'Fibre attenuation', value: `${attenuation} dB/km` },
          { label: 'Connector loss', value: `${((Number(connectors) || 0) * 0.3).toFixed(2)} dB` },
          { label: 'Splice loss', value: `${((Number(splices) || 0) * 0.1).toFixed(2)} dB` },
        ],
        note: loss <= budget
          ? 'Inside budget. Always keep at least 3 dB margin for ageing, dirt on connectors and future splices.'
          : 'Over budget: shorten the run, reduce connectors, or move to single-mode optics with a larger budget.',
        noteTone: loss <= budget ? 'ok' : 'error',
      };
    }}
  >
    <InfoList
      title="Quick reference"
      items={[
        'Copper Ethernet: 100 m per channel, including both patch leads.',
        'Multimode fibre (OM3/OM4): 300–400 m at 10 Gbps, ideal inside a campus.',
        'Single-mode fibre: kilometres of range, used between buildings and to the ISP.',
        'Every connector costs ~0.3 dB; every splice ~0.1 dB.',
      ]}
    />
  </FormTool>
);
