import React from 'react';
import { Link } from 'react-router';

const tools = [
  {
    to: '/tools/subnet-calculator',
    name: 'Subnet & VLSM Calculator',
    badge: 'IPv4 / IPv6',
    desc: 'Instant CIDR decomposition, usable host range calculation, wildcard masks, and subnetwork allocation tables.',
  },
  {
    to: '/tools/dns-lookup',
    name: 'Live DNS Inspector',
    badge: 'DNSSEC Ready',
    desc: 'Query authoritative name servers directly for A, AAAA, MX, TXT, CNAME, and SOA record propagation.',
  },
  {
    to: '/tools/ip-address-info',
    name: 'IP & ASN Intelligence',
    badge: 'Geo & BGP',
    desc: 'Resolve public IP metadata, autonomous system numbers (ASN), BGP routing prefixes, and ISP ownership.',
  },
  {
    to: '/tools/binary-converter',
    name: 'Binary & Hex Converter',
    badge: 'Packet Math',
    desc: 'Rapid conversion across decimal, binary octets, hex headers, and bitwise netmask representations.',
  },
  {
    to: '/tools/port-reference',
    name: 'Port & Service Directory',
    badge: 'IANA Standards',
    desc: 'Searchable encyclopedia of Well-Known (0-1023) and Registered Ports with associated RFC standards.',
  },
  {
    to: '/tools/protocol-explorer',
    name: 'Interactive Protocol Visualizer',
    badge: 'Live Handshake',
    desc: 'Step through TCP 3-way handshakes, ARP resolutions, and OSI layer encapsulation frame by frame.',
  },
];

export function FreeToolsSection() {
  return (
    <section className="py-20 px-4 sm:px-6 lg:px-8 border-t border-white/[0.06] bg-[#070708]">
      <div className="max-w-7xl mx-auto">
        <div className="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12">
          <div>
            <div className="text-xs font-mono uppercase tracking-widest text-[#86868B] mb-2 font-semibold">
              Utilities &amp; Simulators
            </div>
            <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white tracking-tight">
              Free Engineering Tools
            </h2>
          </div>
          <p className="text-[#A1A1A6] text-sm sm:text-base max-w-md font-normal leading-relaxed">
            Client-side utilities designed for network engineers and students. Zero telemetry, zero tracking, instant execution.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
          {tools.map((tool) => (
            <Link
              key={tool.to}
              to={tool.to}
              className="group p-6 sm:p-7 rounded-2xl bg-[#0D0D0F] border border-white/[0.08] hover:border-white/30 hover:bg-[#121215] transition-all duration-300 flex flex-col justify-between shadow-xl"
            >
              <div>
                <div className="flex items-center justify-between gap-2 mb-4">
                  <span className="text-[11px] font-mono font-medium text-[#86868B] bg-white/[0.04] px-2.5 py-1 rounded-md border border-white/[0.06]">
                    {tool.badge}
                  </span>
                  <svg
                    className="w-4 h-4 text-[#86868B] group-hover:text-white group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-all"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
                <h3 className="text-xl font-bold text-white tracking-tight mb-2">
                  {tool.name}
                </h3>
                <p className="text-sm text-[#86868B] leading-relaxed">
                  {tool.desc}
                </p>
              </div>

              <div className="mt-6 pt-4 border-t border-white/[0.06] text-xs font-semibold text-white/90 group-hover:text-white flex items-center justify-between">
                <span>Launch Tool</span>
                <span className="text-[#86868B] group-hover:text-white transition-colors">→</span>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  );
}
