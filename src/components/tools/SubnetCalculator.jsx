import React, { useState, useMemo } from 'react';
import {
  Calculator,
  Copy,
  Check,
  RotateCcw,
  Sparkles,
  Layers,
  Table,
  Plus,
  Trash2,
  BookOpen,
  Info
} from 'lucide-react';

export const SubnetCalculator = ({ isStandalone = false }) => {
  // Main Calculator State
  const [activeTab, setActiveTab] = useState('single'); // 'single' | 'divide' | 'vlsm'
  const [ip, setIp] = useState('192.168.10.45');
  const [cidr, setCidr] = useState(24);
  const [copiedKey, setCopiedKey] = useState(null);

  // Subnet Division State
  const [subDivideCidr, setSubDivideCidr] = useState(26);

  // VLSM Planner State
  const [vlsmBaseIp, setVlsmBaseIp] = useState('192.168.100.0');
  const [vlsmBaseCidr, setVlsmBaseCidr] = useState(24);
  const [vlsmDepartments, setVlsmDepartments] = useState([
    { id: 1, name: 'Engineering Workstations', hosts: 60 },
    { id: 2, name: 'Sales & Support LAN', hosts: 28 },
    { id: 3, name: 'Management & VoIP', hosts: 12 },
    { id: 4, name: 'Point-to-Point Router WAN', hosts: 2 }
  ]);

  // Helper conversions
  const ipToInt = (ipStr) => {
    const octets = ipStr.trim().split('.').map(Number);
    return ((octets[0] << 24) >>> 0) + ((octets[1] << 16) >>> 0) + ((octets[2] << 8) >>> 0) + (octets[3] >>> 0);
  };

  const intToIp = (num) => [
    (num >>> 24) & 255,
    (num >>> 16) & 255,
    (num >>> 8) & 255,
    num & 255
  ].join('.');

  const getMaskInt = (prefix) => (prefix === 0 ? 0 : ((0xFFFFFFFF << (32 - prefix)) >>> 0));

  // Single Subnet Calculation
  const subnetInfo = useMemo(() => {
    const rawOctets = ip.trim().split('.');
    if (
      rawOctets.length !== 4 ||
      rawOctets.some(s => s.trim() === '' || isNaN(Number(s)) || Number(s) < 0 || Number(s) > 255 || !Number.isInteger(Number(s)))
    ) {
      return { error: 'Please enter a valid IPv4 address (e.g. 192.168.1.1)' };
    }

    const cidrNum = Number(cidr);
    if (isNaN(cidrNum) || cidrNum < 1 || cidrNum > 32) {
      return { error: 'CIDR prefix must be between /1 and /32' };
    }

    const octets = rawOctets.map(Number);
    const ipIntVal = ipToInt(ip);
    const maskIntVal = getMaskInt(cidrNum);
    const netIntVal = (ipIntVal & maskIntVal) >>> 0;
    const invMaskIntVal = (~maskIntVal) >>> 0;
    const bcastIntVal = (netIntVal | invMaskIntVal) >>> 0;

    const netIp = intToIp(netIntVal);
    const bcastIp = intToIp(bcastIntVal);
    const maskIp = intToIp(maskIntVal);
    const wildcardIp = intToIp(invMaskIntVal);

    let firstUsable = 'N/A';
    let lastUsable = 'N/A';
    let usableHosts = 0;
    const totalHosts = Math.pow(2, 32 - cidrNum);

    if (cidrNum === 32) {
      firstUsable = netIp;
      lastUsable = netIp;
      usableHosts = 1;
    } else if (cidrNum === 31) {
      firstUsable = netIp;
      lastUsable = bcastIp;
      usableHosts = 2; // RFC 3021
    } else {
      firstUsable = intToIp(netIntVal + 1);
      lastUsable = intToIp(bcastIntVal - 1);
      usableHosts = totalHosts - 2;
    }

    // Determine Class
    const firstOctet = octets[0];
    let ipClass = 'Class A';
    if (firstOctet >= 128 && firstOctet <= 191) ipClass = 'Class B';
    else if (firstOctet >= 192 && firstOctet <= 223) ipClass = 'Class C';
    else if (firstOctet >= 224 && firstOctet <= 239) ipClass = 'Class D (Multicast)';
    else if (firstOctet >= 240) ipClass = 'Class E (Experimental / Reserved)';

    // Determine Scope
    let scope = 'Public Internet Unicast (RIR Allocated)';
    if (firstOctet === 10) scope = 'RFC 1918 Private (10.0.0.0/8)';
    else if (firstOctet === 172 && octets[1] >= 16 && octets[1] <= 31) scope = 'RFC 1918 Private (172.16.0.0/12)';
    else if (firstOctet === 192 && octets[1] === 168) scope = 'RFC 1918 Private (192.168.0.0/16)';
    else if (firstOctet === 100 && octets[1] >= 64 && octets[1] <= 127) scope = 'RFC 6598 Carrier-Grade NAT (100.64.0.0/10)';
    else if (firstOctet === 127) scope = 'RFC 1122 Loopback (127.0.0.0/8)';
    else if (firstOctet === 169 && octets[1] === 254) scope = 'RFC 3927 Link-Local / APIPA (169.254.0.0/16)';
    else if (firstOctet === 192 && octets[1] === 0 && octets[2] === 2) scope = 'RFC 5737 TEST-NET-1 (Documentation)';
    else if (firstOctet === 198 && octets[1] === 51 && octets[2] === 100) scope = 'RFC 5737 TEST-NET-2 (Documentation)';
    else if (firstOctet === 203 && octets[1] === 0 && octets[2] === 113) scope = 'RFC 5737 TEST-NET-3 (Documentation)';
    else if (firstOctet === 198 && (octets[1] === 18 || octets[1] === 19)) scope = 'RFC 2544 Benchmark Testing';
    else if (firstOctet >= 224 && firstOctet <= 239) scope = 'RFC 5771 Multicast';
    else if (firstOctet === 255 && octets[1] === 255 && octets[2] === 255 && octets[3] === 255) scope = 'Limited Broadcast';

    const toBin = (num) => (num >>> 0).toString(2).padStart(32, '0').match(/.{8}/g).join('.');
    const hexIp = '0x' + (ipIntVal >>> 0).toString(16).toUpperCase().padStart(8, '0');

    return {
      ip,
      cidr: cidrNum,
      netIp,
      bcastIp,
      maskIp,
      wildcardIp,
      firstUsable,
      lastUsable,
      usableHosts: usableHosts.toLocaleString(),
      totalHosts: totalHosts.toLocaleString(),
      ipClass,
      scope,
      ipBinary: toBin(ipIntVal),
      maskBinary: toBin(maskIntVal),
      hexIp,
      intVal: ipIntVal.toString(),
      error: null
    };
  }, [ip, cidr]);

  // Subnet Division Calculation
  const subnetDivisions = useMemo(() => {
    if (subnetInfo.error || subDivideCidr <= Number(cidr)) return [];
    const baseCidrNum = Number(cidr);
    const targetCidrNum = Number(subDivideCidr);
    const count = Math.min(Math.pow(2, targetCidrNum - baseCidrNum), 64); // cap at 64 rows for responsive UI
    const targetSize = Math.pow(2, 32 - targetCidrNum);
    const netBaseInt = ipToInt(subnetInfo.netIp);

    const list = [];
    for (let i = 0; i < count; i++) {
      const net = (netBaseInt + (i * targetSize)) >>> 0;
      const bcast = (net + targetSize - 1) >>> 0;
      list.push({
        id: i + 1,
        net: intToIp(net),
        cidr: targetCidrNum,
        bcast: intToIp(bcast),
        firstUsable: targetCidrNum >= 31 ? intToIp(net) : intToIp(net + 1),
        lastUsable: targetCidrNum >= 31 ? intToIp(bcast) : intToIp(bcast - 1),
        usableHosts: targetCidrNum === 32 ? 1 : targetCidrNum === 31 ? 2 : targetSize - 2
      });
    }
    return list;
  }, [subnetInfo, cidr, subDivideCidr]);

  // VLSM Calculation
  const vlsmResults = useMemo(() => {
    const rawOctets = vlsmBaseIp.trim().split('.');
    if (rawOctets.length !== 4 || rawOctets.some(s => s.trim() === '' || isNaN(Number(s)) || Number(s) < 0 || Number(s) > 255)) {
      return { error: 'Please enter a valid base IPv4 address for VLSM.' };
    }
    const baseCidrNum = Number(vlsmBaseCidr);
    if (isNaN(baseCidrNum) || baseCidrNum < 8 || baseCidrNum > 30) {
      return { error: 'Base network CIDR must be between /8 and /30.' };
    }

    const baseMask = getMaskInt(baseCidrNum);
    let currentInt = (ipToInt(vlsmBaseIp) & baseMask) >>> 0;
    const maxInt = (currentInt + Math.pow(2, 32 - baseCidrNum)) >>> 0;

    // Sort departments by needed hosts descending (Golden Rule of VLSM)
    const sorted = [...vlsmDepartments]
      .filter(d => Number(d.hosts) > 0)
      .sort((a, b) => Number(b.hosts) - Number(a.hosts));

    if (sorted.length === 0) {
      return { allocations: [], unusedRange: 'None', overflow: false, error: null };
    }

    const allocations = [];
    let hasOverflow = false;

    for (const dept of sorted) {
      const needed = Number(dept.hosts);
      let hostBits = 1;
      if (needed <= 2) {
        hostBits = 2; // /30
      } else {
        while (Math.pow(2, hostBits) - 2 < needed && hostBits < 32) {
          hostBits++;
        }
      }

      const assignedCidr = 32 - hostBits;
      const blockSize = Math.pow(2, hostBits);
      const netInt = currentInt;
      const bcastInt = (netInt + blockSize - 1) >>> 0;

      if (bcastInt >= maxInt) {
        hasOverflow = true;
        allocations.push({
          ...dept,
          error: 'Exceeds base network capacity',
          cidr: assignedCidr,
          needed
        });
        continue;
      }

      const maskIp = intToIp(getMaskInt(assignedCidr));
      allocations.push({
        name: dept.name,
        needed,
        allocatedHosts: blockSize - 2,
        wastedHosts: (blockSize - 2) - needed,
        cidr: assignedCidr,
        mask: maskIp,
        net: intToIp(netInt),
        bcast: intToIp(bcastInt),
        firstUsable: intToIp(netInt + 1),
        lastUsable: intToIp(bcastInt - 1)
      });

      currentInt = (bcastInt + 1) >>> 0;
    }

    const unusedRange = currentInt < maxInt ? `${intToIp(currentInt)} - ${intToIp(maxInt - 1)}` : 'Fully Allocated';

    return {
      allocations,
      unusedRange,
      overflow: hasOverflow,
      baseNetwork: intToIp(ipToInt(vlsmBaseIp) & baseMask) + '/' + baseCidrNum,
      error: null
    };
  }, [vlsmBaseIp, vlsmBaseCidr, vlsmDepartments]);

  const copyToClipboard = (text, key) => {
    navigator.clipboard.writeText(text);
    setCopiedKey(key);
    setTimeout(() => setCopiedKey(null), 2000);
  };

  const handleCopyFullReport = () => {
    if (subnetInfo.error) return;
    const report = `RTechLab Subnet Calculation Report
IP Address: ${subnetInfo.ip}/${subnetInfo.cidr}
Network Address: ${subnetInfo.netIp}
Broadcast Address: ${subnetInfo.bcastIp}
Subnet Mask: ${subnetInfo.maskIp}
Wildcard Mask: ${subnetInfo.wildcardIp}
Usable Host Range: ${subnetInfo.firstUsable} -> ${subnetInfo.lastUsable}
Usable Hosts: ${subnetInfo.usableHosts} (Total IPs: ${subnetInfo.totalHosts})
Class & Scope: ${subnetInfo.ipClass} • ${subnetInfo.scope}
Hexadecimal: ${subnetInfo.hexIp} | Integer: ${subnetInfo.intVal}
`;
    copyToClipboard(report, 'full-report');
  };

  const applyPreset = (presetIp, presetCidr) => {
    setIp(presetIp);
    setCidr(presetCidr);
  };

  const handleReset = () => {
    setIp('192.168.10.45');
    setCidr(24);
  };

  const addVlsmDept = () => {
    const newId = vlsmDepartments.length > 0 ? Math.max(...vlsmDepartments.map(d => d.id)) + 1 : 1;
    setVlsmDepartments([...vlsmDepartments, { id: newId, name: `Subnet ${newId}`, hosts: 10 }]);
  };

  const removeVlsmDept = (id) => {
    setVlsmDepartments(vlsmDepartments.filter(d => d.id !== id));
  };

  const updateVlsmDept = (id, field, val) => {
    setVlsmDepartments(vlsmDepartments.map(d => d.id === id ? { ...d, [field]: val } : d));
  };

  return (
    <div className={`bg-navy-900 border border-slate-800 rounded-2xl ${isStandalone ? 'p-6 sm:p-8' : 'p-6'} shadow-2xl space-y-6`}>
      {/* Top Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-5 border-b border-slate-800">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-xl bg-electric-500/10 border border-electric-500/30 flex items-center justify-center text-electric-400 flex-shrink-0">
            <Calculator className="w-5 h-5" />
          </div>
          <div>
            <h3 className="text-xl font-bold text-white flex items-center gap-2">
              Advanced IPv4 Subnet & CIDR Calculator
              <span className="text-[11px] font-mono px-2 py-0.5 rounded-full bg-cyan-500/10 text-cyan-400 border border-cyan-500/30">
                RFC Verified
              </span>
            </h3>
            <p className="text-xs text-slate-400">
              Calculate CIDR boundaries, divide networks, and plan non-overlapping VLSM allocations.
            </p>
          </div>
        </div>

        {/* Action Tools: Reset & Copy Full */}
        <div className="flex items-center gap-2">
          <button
            onClick={handleReset}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-navy-950 hover:bg-slate-800 text-slate-300 hover:text-white border border-slate-700/80 text-xs transition"
            title="Reset to default"
          >
            <RotateCcw className="w-3.5 h-3.5" />
            <span>Reset</span>
          </button>

          {!subnetInfo.error && (
            <button
              onClick={handleCopyFullReport}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-electric-600 hover:bg-electric-500 text-white font-semibold text-xs transition shadow-sm"
              title="Copy complete calculation report"
            >
              {copiedKey === 'full-report' ? (
                <>
                  <Check className="w-3.5 h-3.5 text-emerald-300" />
                  <span>Report Copied</span>
                </>
              ) : (
                <>
                  <Copy className="w-3.5 h-3.5" />
                  <span>Copy Report</span>
                </>
              )}
            </button>
          )}
        </div>
      </div>

      {/* Feature Modes Switcher */}
      <div className="flex flex-wrap items-center gap-2 border-b border-slate-800/80 pb-3">
        <button
          onClick={() => setActiveTab('single')}
          className={`flex items-center gap-2 px-3.5 py-1.5 rounded-xl text-xs font-semibold transition ${
            activeTab === 'single'
              ? 'bg-electric-600 text-white shadow'
              : 'bg-navy-950 text-slate-400 hover:text-white border border-slate-800'
          }`}
        >
          <Calculator className="w-3.5 h-3.5" />
          <span>Subnet & CIDR Inspector</span>
        </button>

        <button
          onClick={() => setActiveTab('divide')}
          className={`flex items-center gap-2 px-3.5 py-1.5 rounded-xl text-xs font-semibold transition ${
            activeTab === 'divide'
              ? 'bg-electric-600 text-white shadow'
              : 'bg-navy-950 text-slate-400 hover:text-white border border-slate-800'
          }`}
        >
          <Layers className="w-3.5 h-3.5" />
          <span>Subnet Division Table</span>
        </button>

        <button
          onClick={() => setActiveTab('vlsm')}
          className={`flex items-center gap-2 px-3.5 py-1.5 rounded-xl text-xs font-semibold transition ${
            activeTab === 'vlsm'
              ? 'bg-electric-600 text-white shadow'
              : 'bg-navy-950 text-slate-400 hover:text-white border border-slate-800'
          }`}
        >
          <Table className="w-3.5 h-3.5" />
          <span>VLSM Department Planner</span>
        </button>
      </div>

      {/* TAB 1: SINGLE SUBNET & CIDR INSPECTOR */}
      {activeTab === 'single' && (
        <div className="space-y-6">
          {/* Presets Row */}
          <div className="flex flex-wrap items-center gap-1.5 text-xs">
            <span className="text-slate-500 text-[11px] mr-1 flex items-center gap-1">
              <Sparkles className="w-3 h-3 text-cyan-400" /> Enterprise Presets:
            </span>
            <button
              onClick={() => applyPreset('192.168.1.1', 24)}
              className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
            >
              /24 Office LAN
            </button>
            <button
              onClick={() => applyPreset('172.16.10.1', 27)}
              className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
            >
              /27 DMZ (30 Hosts)
            </button>
            <button
              onClick={() => applyPreset('10.254.0.1', 30)}
              className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
            >
              /30 WAN Link
            </button>
            <button
              onClick={() => applyPreset('172.31.1.0', 31)}
              className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-cyan-300 border border-cyan-800/40 transition"
              title="RFC 3021 Point-to-Point"
            >
              /31 RFC 3021 Link
            </button>
            <button
              onClick={() => applyPreset('10.1.1.1', 32)}
              className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
            >
              /32 Host Route
            </button>
            <button
              onClick={() => applyPreset('100.64.10.1', 24)}
              className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-amber-300 border border-amber-800/40 transition"
            >
              RFC 6598 CGNAT
            </button>
          </div>

          {/* Form Inputs */}
          <div className="grid grid-cols-1 md:grid-cols-12 gap-4">
            <div className="md:col-span-7">
              <label className="block text-xs font-semibold uppercase tracking-wider text-slate-300 mb-2">
                IPv4 Address
              </label>
              <input
                type="text"
                value={ip}
                onChange={(e) => setIp(e.target.value)}
                placeholder="e.g. 192.168.1.50"
                className="w-full bg-navy-950 border border-slate-700 focus:border-electric-400 focus:ring-1 focus:ring-electric-400 rounded-xl px-4 py-2.5 font-mono text-base text-white outline-none transition"
              />
            </div>

            <div className="md:col-span-5">
              <label className="block text-xs font-semibold uppercase tracking-wider text-slate-300 mb-2">
                Subnet Mask Prefix (/{cidr})
              </label>
              <div className="flex items-center gap-3">
                <select
                  value={cidr}
                  onChange={(e) => setCidr(Number(e.target.value))}
                  className="bg-navy-950 border border-slate-700 focus:border-electric-400 rounded-xl px-3 py-2.5 font-mono text-sm text-cyan-300 outline-none w-28 cursor-pointer"
                >
                  {Array.from({ length: 32 }, (_, i) => 32 - i).map((c) => (
                    <option key={c} value={c}>
                      /{c}
                    </option>
                  ))}
                </select>
                <input
                  type="range"
                  min="1"
                  max="32"
                  value={cidr}
                  onChange={(e) => setCidr(Number(e.target.value))}
                  className="w-full accent-electric-500 cursor-pointer"
                />
              </div>
            </div>
          </div>

          {/* Error Message */}
          {subnetInfo.error && (
            <div className="p-3.5 bg-red-950/40 border border-red-500/30 rounded-xl text-red-300 text-xs flex items-center gap-2">
              <Info className="w-4 h-4 text-red-400 flex-shrink-0" />
              <span>{subnetInfo.error}</span>
            </div>
          )}

          {/* Core Results Grid */}
          {!subnetInfo.error && (
            <div className="space-y-4">
              <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
                <div className="bg-navy-950/80 p-3.5 rounded-xl border border-slate-800">
                  <span className="text-[11px] text-slate-400 uppercase tracking-wider block mb-1">Network Address</span>
                  <div className="flex items-center justify-between">
                    <span className="font-mono text-cyan-300 font-bold text-sm">{subnetInfo.netIp}</span>
                    <button
                      onClick={() => copyToClipboard(subnetInfo.netIp, 'net')}
                      className="text-slate-500 hover:text-white p-1"
                      title="Copy"
                    >
                      {copiedKey === 'net' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                    </button>
                  </div>
                </div>

                <div className="bg-navy-950/80 p-3.5 rounded-xl border border-slate-800">
                  <span className="text-[11px] text-slate-400 uppercase tracking-wider block mb-1">Broadcast Address</span>
                  <div className="flex items-center justify-between">
                    <span className="font-mono text-cyan-300 font-bold text-sm">{subnetInfo.bcastIp}</span>
                    <button
                      onClick={() => copyToClipboard(subnetInfo.bcastIp, 'bcast')}
                      className="text-slate-500 hover:text-white p-1"
                      title="Copy"
                    >
                      {copiedKey === 'bcast' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                    </button>
                  </div>
                </div>

                <div className="bg-navy-950/80 p-3.5 rounded-xl border border-slate-800">
                  <span className="text-[11px] text-slate-400 uppercase tracking-wider block mb-1">Subnet Mask</span>
                  <div className="flex items-center justify-between">
                    <span className="font-mono text-white font-bold text-sm">{subnetInfo.maskIp}</span>
                    <button
                      onClick={() => copyToClipboard(subnetInfo.maskIp, 'mask')}
                      className="text-slate-500 hover:text-white p-1"
                      title="Copy"
                    >
                      {copiedKey === 'mask' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                    </button>
                  </div>
                </div>

                <div className="bg-navy-950/80 p-3.5 rounded-xl border border-slate-800">
                  <span className="text-[11px] text-slate-400 uppercase tracking-wider block mb-1">Wildcard Mask</span>
                  <div className="flex items-center justify-between">
                    <span className="font-mono text-amber-300 font-bold text-sm">{subnetInfo.wildcardIp}</span>
                    <button
                      onClick={() => copyToClipboard(subnetInfo.wildcardIp, 'wildcard')}
                      className="text-slate-500 hover:text-white p-1"
                      title="Copy for Cisco ACL"
                    >
                      {copiedKey === 'wildcard' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                    </button>
                  </div>
                </div>
              </div>

              {/* Host range and host counts */}
              <div className="grid grid-cols-1 md:grid-cols-3 gap-3">
                <div className="bg-navy-950/80 p-3.5 rounded-xl border border-slate-800">
                  <span className="text-[11px] text-slate-400 uppercase tracking-wider block mb-1">Usable Host Range</span>
                  <div className="font-mono text-xs text-emerald-400 font-semibold truncate">
                    {subnetInfo.firstUsable} <span className="text-slate-500 font-normal">→</span> {subnetInfo.lastUsable}
                  </div>
                </div>

                <div className="bg-navy-950/80 p-3.5 rounded-xl border border-slate-800 flex items-center justify-between">
                  <div>
                    <span className="text-[11px] text-slate-400 uppercase tracking-wider block mb-1">Usable Hosts</span>
                    <span className="text-lg font-bold text-white font-mono">{subnetInfo.usableHosts}</span>
                  </div>
                  <div className="text-right">
                    <span className="text-[11px] text-slate-500 uppercase tracking-wider block mb-1">Total Block IPs</span>
                    <span className="text-sm font-mono text-slate-400">{subnetInfo.totalHosts}</span>
                  </div>
                </div>

                <div className="bg-navy-950/80 p-3.5 rounded-xl border border-slate-800">
                  <span className="text-[11px] text-slate-400 uppercase tracking-wider block mb-1">Class & RFC Scope</span>
                  <div className="text-xs text-slate-200">
                    <span className="text-electric-400 font-semibold">{subnetInfo.ipClass}</span> • {subnetInfo.scope}
                  </div>
                </div>
              </div>

              {/* Binary & Hex details */}
              <div className="p-3.5 bg-navy-950 rounded-xl border border-slate-800 text-[11px] font-mono space-y-1.5">
                <div className="flex flex-col sm:flex-row sm:items-center justify-between text-slate-400 gap-1">
                  <span>IP Address in Binary:</span>
                  <span className="text-slate-200 select-all">{subnetInfo.ipBinary}</span>
                </div>
                <div className="flex flex-col sm:flex-row sm:items-center justify-between text-slate-400 gap-1">
                  <span>Subnet Mask in Binary:</span>
                  <span className="text-cyan-400 select-all">{subnetInfo.maskBinary}</span>
                </div>
                <div className="pt-1 border-t border-slate-800/80 flex flex-col sm:flex-row sm:items-center justify-between text-slate-400 gap-1 text-[10px]">
                  <span>Hexadecimal: <strong className="text-slate-300">{subnetInfo.hexIp}</strong></span>
                  <span>Integer 32-bit: <strong className="text-slate-300">{subnetInfo.intVal}</strong></span>
                </div>
              </div>
            </div>
          )}
        </div>
      )}

      {/* TAB 2: SUBNET DIVISION GENERATOR */}
      {activeTab === 'divide' && (
        <div className="space-y-4">
          <div className="p-4 rounded-xl bg-navy-950 border border-slate-800 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
            <div>
              <span className="text-xs text-slate-400 uppercase font-semibold block">Base Network Block</span>
              <span className="text-lg font-mono font-bold text-white">
                {subnetInfo.netIp} /{cidr}
              </span>
            </div>

            <div className="flex items-center gap-3">
              <label className="text-xs text-slate-300 font-semibold">
                Divide into smaller:
              </label>
              <select
                value={subDivideCidr}
                onChange={(e) => setSubDivideCidr(Number(e.target.value))}
                className="bg-navy-900 border border-slate-700 text-cyan-300 font-mono text-sm px-3 py-1.5 rounded-xl outline-none"
              >
                {Array.from({ length: 32 - Number(cidr) }, (_, i) => Number(cidr) + 1 + i).map(c => (
                  <option key={c} value={c}>
                    /{c} ({Math.pow(2, c - Number(cidr))} subnets)
                  </option>
                ))}
              </select>
            </div>
          </div>

          <div className="overflow-x-auto rounded-xl border border-slate-800">
            <table className="w-full text-left font-mono text-xs">
              <thead className="bg-navy-950 text-slate-400 uppercase text-[10px] border-b border-slate-800">
                <tr>
                  <th className="py-2.5 px-3">#</th>
                  <th className="py-2.5 px-3">Subnet</th>
                  <th className="py-2.5 px-3">Usable Range</th>
                  <th className="py-2.5 px-3">Broadcast</th>
                  <th className="py-2.5 px-3 text-right">Usable Hosts</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-800/80 bg-navy-900/60">
                {subnetDivisions.map((sub) => (
                  <tr key={sub.id} className="hover:bg-navy-850/80 transition">
                    <td className="py-2 px-3 text-slate-500 font-sans">{sub.id}</td>
                    <td className="py-2 px-3 text-cyan-300 font-semibold">{sub.net}/{sub.cidr}</td>
                    <td className="py-2 px-3 text-slate-300">{sub.firstUsable} → {sub.lastUsable}</td>
                    <td className="py-2 px-3 text-slate-400">{sub.bcast}</td>
                    <td className="py-2 px-3 text-right text-emerald-400 font-bold">{sub.usableHosts.toLocaleString()}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}

      {/* TAB 3: VLSM DEPARTMENT PLANNER */}
      {activeTab === 'vlsm' && (
        <div className="space-y-6">
          <div className="p-4 rounded-xl bg-navy-950 border border-slate-800 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
            <div className="space-y-1">
              <span className="text-xs text-slate-400 uppercase font-semibold block">Major Base Supernet</span>
              <div className="flex items-center gap-2">
                <input
                  type="text"
                  value={vlsmBaseIp}
                  onChange={(e) => setVlsmBaseIp(e.target.value)}
                  className="bg-navy-900 border border-slate-700 rounded-lg px-3 py-1 font-mono text-sm text-white w-36 outline-none"
                />
                <span className="text-slate-400">/</span>
                <input
                  type="number"
                  min="8"
                  max="30"
                  value={vlsmBaseCidr}
                  onChange={(e) => setVlsmBaseCidr(Number(e.target.value))}
                  className="bg-navy-900 border border-slate-700 rounded-lg px-2 py-1 font-mono text-sm text-cyan-300 w-16 outline-none"
                />
              </div>
            </div>

            <button
              onClick={addVlsmDept}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-navy-900 hover:bg-slate-800 text-slate-300 border border-slate-700 text-xs transition"
            >
              <Plus className="w-3.5 h-3.5 text-cyan-400" />
              <span>Add Department</span>
            </button>
          </div>

          {/* Department Inputs List */}
          <div className="space-y-2">
            <span className="text-[11px] font-bold uppercase tracking-wider text-slate-400 block">
              Configured Subnet Requirements:
            </span>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              {vlsmDepartments.map((dept) => (
                <div key={dept.id} className="p-3 rounded-xl bg-navy-950/80 border border-slate-800 flex items-center justify-between gap-2">
                  <input
                    type="text"
                    value={dept.name}
                    onChange={(e) => updateVlsmDept(dept.id, 'name', e.target.value)}
                    className="bg-transparent text-white text-xs font-semibold outline-none flex-1"
                    placeholder="Department Name"
                  />
                  <div className="flex items-center gap-2">
                    <span className="text-[10px] text-slate-400">Hosts:</span>
                    <input
                      type="number"
                      min="1"
                      value={dept.hosts}
                      onChange={(e) => updateVlsmDept(dept.id, 'hosts', Math.max(1, Number(e.target.value)))}
                      className="w-16 bg-navy-900 border border-slate-700 rounded px-2 py-0.5 text-xs font-mono text-cyan-300 text-right outline-none"
                    />
                    <button
                      onClick={() => removeVlsmDept(dept.id)}
                      className="text-slate-500 hover:text-red-400 p-1"
                      title="Delete"
                    >
                      <Trash2 className="w-3.5 h-3.5" />
                    </button>
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* VLSM Output Table */}
          {vlsmResults.error ? (
            <div className="p-3.5 bg-red-950/40 border border-red-500/30 rounded-xl text-red-300 text-xs">
              {vlsmResults.error}
            </div>
          ) : (
            <div className="space-y-3">
              <div className="overflow-x-auto rounded-xl border border-slate-800">
                <table className="w-full text-left font-mono text-xs">
                  <thead className="bg-navy-950 text-slate-400 uppercase text-[10px] border-b border-slate-800">
                    <tr>
                      <th className="py-2.5 px-3">Subnet / Dept</th>
                      <th className="py-2.5 px-3">Needed</th>
                      <th className="py-2.5 px-3">Allocated Net</th>
                      <th className="py-2.5 px-3">Usable Range</th>
                      <th className="py-2.5 px-3">Mask</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-slate-800/80 bg-navy-900/60">
                    {vlsmResults.allocations.map((alloc, idx) => (
                      <tr key={idx} className="hover:bg-navy-850/80 transition">
                        <td className="py-2 px-3 font-sans font-semibold text-white">{alloc.name}</td>
                        <td className="py-2 px-3 text-slate-400">{alloc.needed}</td>
                        <td className="py-2 px-3 text-cyan-300 font-bold">{alloc.net}/{alloc.cidr}</td>
                        <td className="py-2 px-3 text-slate-300">{alloc.firstUsable} → {alloc.lastUsable}</td>
                        <td className="py-2 px-3 text-slate-400">{alloc.mask}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>

              <div className="flex items-center justify-between text-xs text-slate-400 pt-1">
                <span>Unallocated Range: <strong className="text-cyan-400 font-mono">{vlsmResults.unusedRange}</strong></span>
                {vlsmResults.overflow && (
                  <span className="text-red-400 font-bold">Warning: Total requested hosts exceed base network capacity!</span>
                )}
              </div>
            </div>
          )}
        </div>
      )}

      {/* Practical Educational Notes */}
      <div className="mt-8 pt-6 border-t border-slate-800 text-xs text-slate-400 space-y-3">
        <h4 className="text-white font-bold text-sm flex items-center gap-2">
          <BookOpen className="w-4 h-4 text-electric-400" />
          Practical Engineering & CCNA Subnetting Rules
        </h4>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800">
            <strong className="text-cyan-300 block mb-1">1. The Bitwise AND ASIC Operation</strong>
            <p className="leading-relaxed">
              Routers never do decimal division. When an IP packet arrives, the router applies a hardware bitwise <code className="text-slate-200 bg-slate-900 px-1 rounded">AND</code> between destination IP and subnet mask to isolate the destination network address in nanoseconds.
            </p>
          </div>
          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800">
            <strong className="text-cyan-300 block mb-1">2. RFC 3021: Why /31 Saves 50% WAN IP Space</strong>
            <p className="leading-relaxed">
              Standard /30 networks waste 50% of addresses (2 hosts out of 4). RFC 3021 permits /31 masks on point-to-point router links with zero broadcast overhead, saving millions of public IPv4 addresses globally.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};
