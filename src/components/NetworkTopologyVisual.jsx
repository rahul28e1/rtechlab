import React, { useState } from 'react';

export const NetworkTopologyVisual = () => {
  const [selectedNode, setSelectedNode] = useState('r1');

  const nodes = {
    r1: {
      id: 'r1',
      name: 'R1-CORE-EDGE',
      type: 'Cisco 2911 Router',
      role: 'Default Gateway & OSPF Area 0 Backbone',
      ip: '192.168.10.1 /30',
      interfaces: [
        { name: 'Gi0/0/0', ip: '192.168.10.1/30', status: 'UP', desc: 'WAN Uplink to ISP' },
        { name: 'Gi0/0/1', ip: '192.168.20.1/24', status: 'UP', desc: 'Trunk to SW-DIST-01' }
      ],
      protocol: 'OSPFv2 (Process 1)',
      mtu: '1500 bytes'
    },
    sw1: {
      id: 'sw1',
      name: 'SW-DIST-01',
      type: 'Catalyst 2960 Switch',
      role: 'Layer 2 Multi-VLAN Distribution',
      ip: '192.168.20.2 /24 (SVI)',
      interfaces: [
        { name: 'Gig0/1', ip: 'Trunk (802.1Q)', status: 'UP', desc: 'Uplink to Router R1' },
        { name: 'Fa0/1', ip: 'Access VLAN 20', status: 'UP', desc: 'Student Workstation' },
        { name: 'Fa0/2', ip: 'Access VLAN 30', status: 'UP', desc: 'Isolated DMZ Server' }
      ],
      protocol: 'STP (Rapid-PVST+)',
      mtu: '1500 bytes'
    },
    pc1: {
      id: 'pc1',
      name: 'STUDENT-WS-01',
      type: 'Ubuntu Linux 24.04',
      role: 'Lab Test Client',
      ip: '192.168.20.45 /24',
      interfaces: [
        { name: 'eth0', ip: '192.168.20.45/24', status: 'UP', desc: 'Connected to SW Fa0/1' }
      ],
      protocol: 'DHCP Client (Snooping Verified)',
      mtu: '1500 bytes'
    },
    srv1: {
      id: 'srv1',
      name: 'SRV-SEC-DMZ',
      type: 'Rocky Linux 9 Server',
      role: 'Target & Monitoring Daemon',
      ip: '10.0.50.80 /24',
      interfaces: [
        { name: 'eth0', ip: '10.0.50.80/24', status: 'UP', desc: 'Connected to SW Fa0/2' }
      ],
      protocol: 'Nginx + SSH Port 22/80',
      mtu: '1500 bytes'
    }
  };

  const active = nodes[selectedNode];

  return (
    <div className="bg-[#050914] border border-slate-800 rounded-2xl p-4 font-mono text-xs shadow-2xl">
      {/* Top Bar */}
      <div className="flex items-center justify-between pb-3 border-b border-slate-800/80">
        <div className="flex items-center gap-2 text-slate-300 font-sans">
          <span className="w-2.5 h-2.5 rounded-full bg-cyan-400 animate-pulse" />
          <span className="font-semibold text-xs text-white">Lab Topology: Enterprise Branch Pod</span>
          <span className="text-[10px] px-2 py-0.5 rounded bg-blue-950/80 text-blue-300 border border-blue-800/60 font-mono">
            Packet Tracer Verified
          </span>
        </div>
        <span className="text-[11px] text-slate-500 font-sans hidden sm:inline">
          Click node to inspect config
        </span>
      </div>

      {/* SVG Interactive Topology Diagram */}
      <div className="relative my-3 p-2 bg-[#030610] rounded-xl border border-slate-900 overflow-hidden">
        <svg
          viewBox="0 0 540 220"
          className="w-full h-auto select-none"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          {/* Grid lines */}
          <line x1="0" y1="55" x2="540" y2="55" stroke="#101930" strokeWidth="1" strokeDasharray="4 4" />
          <line x1="0" y1="110" x2="540" y2="110" stroke="#101930" strokeWidth="1" strokeDasharray="4 4" />
          <line x1="0" y1="165" x2="540" y2="165" stroke="#101930" strokeWidth="1" strokeDasharray="4 4" />

          {/* Connection Cables with Interface labels */}
          {/* Link Router to Switch */}
          <line x1="120" y1="90" x2="270" y2="90" stroke="#2563EB" strokeWidth="3" strokeLinecap="round" />
          {/* Interface tags */}
          <text x="145" y="80" fill="#60A5FA" fontSize="9" fontFamily="monospace">Gi0/0/1</text>
          <text x="215" y="80" fill="#60A5FA" fontSize="9" fontFamily="monospace">Gig0/1 (Trunk)</text>
          <text x="165" y="105" fill="#94A3B8" fontSize="8" fontFamily="monospace">192.168.10.0/30</text>

          {/* Link Switch to PC1 */}
          <line x1="290" y1="105" x2="410" y2="50" stroke="#00E5FF" strokeWidth="2.2" strokeLinecap="round" />
          <text x="315" y="65" fill="#38BDF8" fontSize="8" fontFamily="monospace">Fa0/1 (VLAN 20)</text>

          {/* Link Switch to Server */}
          <line x1="290" y1="105" x2="410" y2="155" stroke="#10B981" strokeWidth="2.2" strokeLinecap="round" />
          <text x="315" y="145" fill="#34D399" fontSize="8" fontFamily="monospace">Fa0/2 (VLAN 30)</text>

          {/* Simulated Packet Pulse along links */}
          <circle cx="195" cy="90" r="3" fill="#00E5FF">
            <animate attributeName="cx" values="120;270;120" dur="4s" repeatCount="indefinite" />
          </circle>
          <circle cx="350" cy="77" r="2.5" fill="#38BDF8">
            <animate attributeName="cx" values="290;410;290" dur="3s" repeatCount="indefinite" />
            <animate attributeName="cy" values="105;50;105" dur="3s" repeatCount="indefinite" />
          </circle>

          {/* Nodes Graphics */}

          {/* 1. Router Node (R1) */}
          <g
            onClick={() => setSelectedNode('r1')}
            className="cursor-pointer group"
          >
            <circle
              cx="100"
              cy="90"
              r="28"
              fill={selectedNode === 'r1' ? '#0F1E4A' : '#0B142D'}
              stroke={selectedNode === 'r1' ? '#3B82F6' : '#1E3A8A'}
              strokeWidth={selectedNode === 'r1' ? '2.5' : '1.5'}
            />
            {/* Router Arrows Icon */}
            <path d="M88 90 H112 M100 78 V102 M92 86 L88 90 L92 94 M108 86 L112 90 L108 94" stroke="#60A5FA" strokeWidth="2" strokeLinecap="round" />
            <text x="100" y="130" textAnchor="middle" fill="#FFFFFF" fontSize="10" fontWeight="bold" fontFamily="sans-serif">R1-EDGE</text>
            <text x="100" y="142" textAnchor="middle" fill="#94A3B8" fontSize="8" fontFamily="monospace">192.168.10.1</text>
          </g>

          {/* 2. Switch Node (SW1) */}
          <g
            onClick={() => setSelectedNode('sw1')}
            className="cursor-pointer group"
          >
            <rect
              x="250"
              y="72"
              width="50"
              height="36"
              rx="8"
              fill={selectedNode === 'sw1' ? '#0F1E4A' : '#0B142D'}
              stroke={selectedNode === 'sw1' ? '#00E5FF' : '#1E3A8A'}
              strokeWidth={selectedNode === 'sw1' ? '2.5' : '1.5'}
            />
            {/* Switch arrows */}
            <path d="M260 84 H290 M265 80 L260 84 L265 88 M290 96 H260 M285 92 L290 96 L285 100" stroke="#38BDF8" strokeWidth="1.5" strokeLinecap="round" />
            <text x="275" y="122" textAnchor="middle" fill="#FFFFFF" fontSize="10" fontWeight="bold" fontFamily="sans-serif">SW-DIST</text>
            <text x="275" y="134" textAnchor="middle" fill="#94A3B8" fontSize="8" fontFamily="monospace">VLAN 20/30</text>
          </g>

          {/* 3. Workstation Node (PC1) */}
          <g
            onClick={() => setSelectedNode('pc1')}
            className="cursor-pointer group"
          >
            <rect
              x="420"
              y="32"
              width="44"
              height="34"
              rx="6"
              fill={selectedNode === 'pc1' ? '#0F1E4A' : '#0B142D'}
              stroke={selectedNode === 'pc1' ? '#00E5FF' : '#1E3A8A'}
              strokeWidth={selectedNode === 'pc1' ? '2' : '1.2'}
            />
            <path d="M432 46 H452 M432 50 H446" stroke="#00E5FF" strokeWidth="1.5" strokeLinecap="round" />
            <text x="442" y="78" textAnchor="middle" fill="#FFFFFF" fontSize="9" fontWeight="bold" fontFamily="sans-serif">WS-01</text>
            <text x="442" y="89" textAnchor="middle" fill="#94A3B8" fontSize="8" fontFamily="monospace">.20.45</text>
          </g>

          {/* 4. DMZ Server Node (SRV1) */}
          <g
            onClick={() => setSelectedNode('srv1')}
            className="cursor-pointer group"
          >
            <rect
              x="420"
              y="135"
              width="44"
              height="34"
              rx="6"
              fill={selectedNode === 'srv1' ? '#0F1E4A' : '#0B142D'}
              stroke={selectedNode === 'srv1' ? '#10B981' : '#1E3A8A'}
              strokeWidth={selectedNode === 'srv1' ? '2' : '1.2'}
            />
            <line x1="426" y1="146" x2="458" y2="146" stroke="#34D399" strokeWidth="1.5" />
            <line x1="426" y1="154" x2="458" y2="154" stroke="#34D399" strokeWidth="1.5" />
            <text x="442" y="181" textAnchor="middle" fill="#FFFFFF" fontSize="9" fontWeight="bold" fontFamily="sans-serif">SRV-DMZ</text>
            <text x="442" y="192" textAnchor="middle" fill="#94A3B8" fontSize="8" fontFamily="monospace">10.0.50.80</text>
          </g>
        </svg>
      </div>

      {/* Selected Node Real Interface Details */}
      <div className="bg-[#080E1C] p-3 rounded-xl border border-slate-800 space-y-2">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <span className="text-white font-bold font-sans text-xs">{active.name}</span>
            <span className="text-slate-400 font-mono text-[10px]">({active.type})</span>
          </div>
          <span className="text-cyan-400 font-mono text-[11px] font-semibold">{active.ip}</span>
        </div>

        <div className="text-slate-400 text-[11px] font-sans">
          <span className="text-slate-500">Role:</span> {active.role} • <span className="text-slate-500">Protocol:</span> {active.protocol}
        </div>

        <div className="pt-2 border-t border-slate-800/80 grid grid-cols-1 sm:grid-cols-2 gap-2 text-[10px]">
          {active.interfaces.map((intf, idx) => (
            <div key={idx} className="p-1.5 rounded bg-navy-950 border border-slate-800/90 flex items-center justify-between">
              <span className="text-slate-300 font-bold">{intf.name}</span>
              <span className="text-cyan-300 font-mono">{intf.ip}</span>
              <span className="text-emerald-400 font-bold font-mono">[{intf.status}]</span>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};
