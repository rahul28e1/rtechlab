import React, { useState, useMemo } from 'react';
import {
  Network,
  Copy,
  Check,
  RotateCcw,
  Sparkles,
  ShieldCheck,
  Info,
  BookOpen
} from 'lucide-react';
import { useLanguage } from '../../context/LanguageContext';

export const IpAddressInfo = ({ isStandalone = false }) => {
  const { language } = useLanguage();
  const [inputVal, setInputVal] = useState('2001:db8:85a3::8a2e:370:7334');
  const [copiedKey, setCopiedKey] = useState(null);

  // Helper conversions
  const ip4ToInt = (ip) => {
    const octets = ip.split('.').map(Number);
    return ((octets[0] << 24) >>> 0) + ((octets[1] << 16) >>> 0) + ((octets[2] << 8) >>> 0) + (octets[3] >>> 0);
  };

  const expandIPv6 = (rawIp) => {
    let clean = rawIp.trim().toLowerCase();

    // Check if IPv4-mapped (e.g. ::ffff:192.168.1.1)
    if (clean.includes('.')) {
      const lastColon = clean.lastIndexOf(':');
      const v4Part = clean.slice(lastColon + 1);
      const prefix = clean.slice(0, lastColon);
      const octets = v4Part.split('.').map(Number);
      if (octets.length !== 4 || octets.some(o => isNaN(o) || o < 0 || o > 255)) return null;
      const hex1 = ((octets[0] << 8) + octets[1]).toString(16).padStart(4, '0');
      const hex2 = ((octets[2] << 8) + octets[3]).toString(16).padStart(4, '0');
      clean = prefix + ':' + hex1 + ':' + hex2;
    }

    if (clean.includes('::')) {
      const parts = clean.split('::');
      if (parts.length > 2) return null;
      const left = parts[0] ? parts[0].split(':') : [];
      const right = parts[1] ? parts[1].split(':') : [];
      const missing = 8 - (left.length + right.length);
      if (missing < 1) return null;
      const fill = new Array(missing).fill('0000');
      const all = [...left, ...fill, ...right];
      if (all.some(p => !/^[0-9a-f]{1,4}$/i.test(p))) return null;
      return all.map(h => h.padStart(4, '0')).join(':');
    } else {
      const parts = clean.split(':');
      if (parts.length !== 8 || parts.some(p => !/^[0-9a-f]{1,4}$/i.test(p))) return null;
      return parts.map(h => h.padStart(4, '0')).join(':');
    }
  };

  const compressIPv6 = (expanded) => {
    const parts = expanded.split(':').map(p => parseInt(p, 16).toString(16));
    let bestStart = -1, bestLen = 0;
    let curStart = -1, curLen = 0;

    for (let i = 0; i < 8; i++) {
      if (parts[i] === '0') {
        if (curStart === -1) { curStart = i; curLen = 1; }
        else { curLen++; }
        if (curLen > bestLen) { bestStart = curStart; bestLen = curLen; }
      } else {
        curStart = -1; curLen = 0;
      }
    }

    if (bestLen < 2) return parts.join(':');
    const left = parts.slice(0, bestStart).join(':');
    const right = parts.slice(bestStart + bestLen).join(':');
    return left + '::' + right;
  };

  // Comprehensive Classification & Parser
  const parsedInfo = useMemo(() => {
    const trimmed = inputVal.trim();
    if (!trimmed) return { error: 'Please enter an IPv4 or IPv6 address.' };

    // Separate IP and optional CIDR
    let ipOnly = trimmed;
    let userCidr = null;
    if (trimmed.includes('/')) {
      const parts = trimmed.split('/');
      ipOnly = parts[0].trim();
      const parsedCidr = parseInt(parts[1].trim(), 10);
      if (!isNaN(parsedCidr)) userCidr = parsedCidr;
    }

    // Strip zone index (e.g. fe80::1%eth0)
    if (ipOnly.includes('%')) {
      ipOnly = ipOnly.split('%')[0];
    }

    // 1. Check if IPv4
    const v4Octets = ipOnly.split('.');
    if (v4Octets.length === 4 && v4Octets.every(s => s.trim() !== '' && !isNaN(Number(s)) && Number(s) >= 0 && Number(s) <= 255 && Number.isInteger(Number(s)))) {
      const octets = v4Octets.map(Number);
      const [o1, o2, o3, o4] = octets;
      const ipInt = ip4ToInt(ipOnly);

      // Default CIDR if none supplied: Class A=8, B=16, C=24
      let ipClass = 'Class A';
      let defaultCidr = 8;
      if (o1 >= 128 && o1 <= 191) { ipClass = 'Class B'; defaultCidr = 16; }
      else if (o1 >= 192 && o1 <= 223) { ipClass = 'Class C'; defaultCidr = 24; }
      else if (o1 >= 224 && o1 <= 239) { ipClass = 'Class D (Multicast)'; defaultCidr = 4; }
      else if (o1 >= 240) { ipClass = 'Class E (Reserved)'; defaultCidr = 4; }

      const effectiveCidr = userCidr !== null ? userCidr : defaultCidr;

      // RFC Classification
      let scope = 'Globally Reachable Public Internet Unicast';
      let rfc = 'IANA Special-Purpose Registry';
      let scopeType = 'Public';

      if (o1 === 0) { scope = '"This host on this network"'; rfc = 'RFC 1122'; scopeType = 'Special'; }
      else if (o1 === 10) { scope = 'Private-Use Network'; rfc = 'RFC 1918'; scopeType = 'Private'; }
      else if (o1 === 100 && (o2 >= 64 && o2 <= 127)) { scope = 'Shared Address Space (Carrier-Grade NAT)'; rfc = 'RFC 6598'; scopeType = 'CGNAT'; }
      else if (o1 === 127) { scope = 'Loopback Host Address'; rfc = 'RFC 1122'; scopeType = 'Loopback'; }
      else if (o1 === 169 && o2 === 254) { scope = 'Link-Local / APIPA (No DHCP fallback)'; rfc = 'RFC 3927'; scopeType = 'Link-Local'; }
      else if (o1 === 172 && (o2 >= 16 && o2 <= 31)) { scope = 'Private-Use Network'; rfc = 'RFC 1918'; scopeType = 'Private'; }
      else if (o1 === 192 && o2 === 0 && o3 === 0) { scope = 'IETF Protocol Assignments'; rfc = 'RFC 6890'; scopeType = 'Special'; }
      else if (o1 === 192 && o2 === 0 && o3 === 2) { scope = 'Documentation (TEST-NET-1)'; rfc = 'RFC 5737'; scopeType = 'Documentation'; }
      else if (o1 === 192 && o2 === 88 && o3 === 99) { scope = '6to4 Relay Anycast (Deprecated)'; rfc = 'RFC 7526'; scopeType = 'Anycast'; }
      else if (o1 === 192 && o2 === 168) { scope = 'Private-Use Network'; rfc = 'RFC 1918'; scopeType = 'Private'; }
      else if (o1 === 198 && (o2 === 18 || o2 === 19)) { scope = 'Network Benchmark Testing'; rfc = 'RFC 2544'; scopeType = 'Benchmark'; }
      else if (o1 === 198 && o2 === 51 && o3 === 100) { scope = 'Documentation (TEST-NET-2)'; rfc = 'RFC 5737'; scopeType = 'Documentation'; }
      else if (o1 === 203 && o2 === 0 && o3 === 113) { scope = 'Documentation (TEST-NET-3)'; rfc = 'RFC 5737'; scopeType = 'Documentation'; }
      else if (o1 >= 224 && o1 <= 239) { scope = 'Class D Multicast'; rfc = 'RFC 5771'; scopeType = 'Multicast'; }
      else if (o1 === 255 && o2 === 255 && o3 === 255 && o4 === 255) { scope = 'Limited Broadcast Address'; rfc = 'RFC 919'; scopeType = 'Broadcast'; }
      else if (o1 >= 240) { scope = 'Class E Reserved for Future Use'; rfc = 'RFC 1112'; scopeType = 'Reserved'; }

      // Reverse PTR
      const reversePtr = `${o4}.${o3}.${o2}.${o1}.in-addr.arpa`;

      // Binary
      const toBin = (num) => (num >>> 0).toString(2).padStart(32, '0').match(/.{8}/g).join('.');
      const hexVal = '0x' + (ipInt >>> 0).toString(16).toUpperCase().padStart(8, '0');

      return {
        family: 'IPv4',
        ip: ipOnly,
        cidr: effectiveCidr,
        format: 'Dotted Decimal (IPv4 Standard)',
        ipClass,
        scope,
        rfc,
        scopeType,
        reversePtr,
        binary: toBin(ipInt),
        hex: hexVal,
        integer: ipInt.toString(),
        isV6: false,
        error: null
      };
    }

    // 2. Check if IPv6
    const expanded = expandIPv6(ipOnly);
    if (expanded) {
      const compressed = compressIPv6(expanded);
      const hex = expanded.replace(/:/g, '').toLowerCase();

      let scope = 'Global Unicast Address (Public Internet IPv6)';
      let rfc = 'RFC 4291';
      let scopeType = 'Public';
      let mappedV4 = null;

      if (hex === '00000000000000000000000000000001') {
        scope = 'Loopback Address (localhost ::1)';
        rfc = 'RFC 4291';
        scopeType = 'Loopback';
      } else if (hex === '00000000000000000000000000000000') {
        scope = 'Unspecified Address (::)';
        rfc = 'RFC 4291';
        scopeType = 'Unspecified';
      } else if (hex.startsWith('00000000000000000000ffff')) {
        const v4Hex = hex.slice(24);
        mappedV4 = [
          parseInt(v4Hex.slice(0, 2), 16),
          parseInt(v4Hex.slice(2, 4), 16),
          parseInt(v4Hex.slice(4, 6), 16),
          parseInt(v4Hex.slice(6, 8), 16)
        ].join('.');
        scope = `IPv4-Mapped IPv6 Address (Dual-Stack bridge to ${mappedV4})`;
        rfc = 'RFC 4291';
        scopeType = 'IPv4-Mapped';
      } else if (hex.startsWith('0064ff9b0000000000000000')) {
        scope = 'Well-Known NAT64 Prefix (64:ff9b::/96)';
        rfc = 'RFC 6052';
        scopeType = 'NAT64';
      } else if (hex.startsWith('0100000000000000')) {
        scope = 'Discard-Only Prefix (100::/64)';
        rfc = 'RFC 6666';
        scopeType = 'Discard';
      } else if (hex.startsWith('20010000')) {
        scope = 'TEREDO Tunneling Prefix (2001::/32)';
        rfc = 'RFC 4380';
        scopeType = 'Transition';
      } else if (hex.startsWith('200100020000')) {
        scope = 'BMWG Benchmarking Prefix (2001:2::/48)';
        rfc = 'RFC 5180';
        scopeType = 'Benchmark';
      } else if (hex.startsWith('20010db8')) {
        scope = 'Documentation Prefix (2001:db8::/32 TEST-NET)';
        rfc = 'RFC 3849';
        scopeType = 'Documentation';
      } else if (hex.startsWith('2002')) {
        scope = '6to4 Transition Mechanism Prefix (2002::/16)';
        rfc = 'RFC 3056';
        scopeType = 'Transition';
      } else if (hex.startsWith('fc') || hex.startsWith('fd')) {
        const isLocal = hex.startsWith('fd');
        scope = isLocal
          ? 'Unique Local Address (ULA fd00::/8 - Private IPv6 LAN)'
          : 'Unique Local Address (ULA fc00::/8 - Centrally Assigned)';
        rfc = 'RFC 4193';
        scopeType = 'Private';
      } else if (hex.startsWith('fe8') || hex.startsWith('fe9') || hex.startsWith('fea') || hex.startsWith('feb')) {
        scope = 'Link-Local Unicast Address (fe80::/10 - Local Segment Only)';
        rfc = 'RFC 4291';
        scopeType = 'Link-Local';
      } else if (hex.startsWith('ff')) {
        scope = 'Multicast Address (ff00::/8)';
        rfc = 'RFC 4291';
        scopeType = 'Multicast';
      }

      // Reverse PTR for IPv6
      const reversePtr = hex.split('').reverse().join('.') + '.ip6.arpa';

      // 128-bit Binary Representation
      const binary128 = expanded
        .split(':')
        .map(h => parseInt(h, 16).toString(2).padStart(16, '0'))
        .join(' ');

      const int128 = BigInt('0x' + hex).toString();

      return {
        family: 'IPv6',
        ip: compressed,
        expanded,
        cidr: userCidr !== null ? userCidr : 64, // /64 standard IPv6 subnet size
        format: 'Colon-Hexadecimal (RFC 5952 Canonical)',
        scope,
        rfc,
        scopeType,
        mappedV4,
        reversePtr,
        binary: binary128,
        hex: '0x' + hex.toUpperCase(),
        integer: int128,
        isV6: true,
        error: null
      };
    }

    return {
      error: 'Unrecognized address format. Please enter a valid IPv4 address (e.g. 192.168.1.1) or IPv6 address (e.g. 2001:db8::1).'
    };
  }, [inputVal]);

  const copyToClipboard = (text, key) => {
    navigator.clipboard.writeText(text);
    setCopiedKey(key);
    setTimeout(() => setCopiedKey(null), 2000);
  };

  const handleCopyReport = () => {
    if (parsedInfo.error) return;
    const report = `RTechLab IP Address Inspection Report
Address Family: ${parsedInfo.family}
IP Address: ${parsedInfo.ip}${parsedInfo.cidr ? `/${parsedInfo.cidr}` : ''}
${parsedInfo.isV6 ? `Expanded IPv6: ${parsedInfo.expanded}` : `IP Class: ${parsedInfo.ipClass}`}
Scope & Classification: ${parsedInfo.scope}
Authoritative RFC: ${parsedInfo.rfc}
Reverse DNS PTR: ${parsedInfo.reversePtr}
Binary (128/32-bit): ${parsedInfo.binary}
Hexadecimal: ${parsedInfo.hex}
Integer Representation: ${parsedInfo.integer}
`;
    copyToClipboard(report, 'full-ip-report');
  };

  const handleApplyPreset = (val) => {
    setInputVal(val);
  };

  const handleReset = () => {
    setInputVal('2001:db8:85a3::8a2e:370:7334');
  };

  const getScopeBadgeColor = (type) => {
    switch (type) {
      case 'Private': return 'bg-emerald-950/80 text-emerald-300 border-emerald-800';
      case 'Public': return 'bg-blue-950/80 text-blue-300 border-blue-800';
      case 'CGNAT': return 'bg-amber-950/80 text-amber-300 border-amber-800';
      case 'Link-Local': return 'bg-purple-950/80 text-purple-300 border-purple-800';
      case 'Loopback': return 'bg-cyan-950/80 text-cyan-300 border-cyan-800';
      case 'Documentation': return 'bg-slate-900 text-slate-300 border-slate-700';
      default: return 'bg-navy-950 text-slate-300 border-slate-800';
    }
  };

  return (
    <div className={`bg-navy-900 border border-slate-800 rounded-2xl ${isStandalone ? 'p-6 sm:p-8' : 'p-6'} shadow-2xl space-y-6`}>
      {/* Top Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-5 border-b border-slate-800">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-xl bg-electric-500/10 border border-electric-500/30 flex items-center justify-center text-electric-400 flex-shrink-0">
            <Network className="w-5 h-5" />
          </div>
          <div>
            <h3 className="text-xl font-bold text-white flex items-center gap-2">
              IPv4 & IPv6 Address Inspector
              <span className="text-[11px] font-mono px-2 py-0.5 rounded-full bg-cyan-500/10 text-cyan-400 border border-cyan-500/30">
                Dual-Stack Engine
              </span>
            </h3>
            <p className="text-xs text-slate-400">
              Dissects address families, RFC scopes, reverse PTR, binary encoding, and dual-stack mappings.
            </p>
          </div>
        </div>

        {/* Action Controls */}
        <div className="flex items-center gap-2">
          <button
            onClick={handleReset}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-navy-950 hover:bg-slate-800 text-slate-300 hover:text-white border border-slate-700/80 text-xs transition"
            title="Reset to default"
          >
            <RotateCcw className="w-3.5 h-3.5" />
            <span>Reset</span>
          </button>

          {!parsedInfo.error && (
            <button
              onClick={handleCopyReport}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-electric-600 hover:bg-electric-500 text-white font-semibold text-xs transition shadow-sm"
              title="Copy formatted markdown report"
            >
              {copiedKey === 'full-ip-report' ? (
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

      {/* Preset Buttons for IPv4 and IPv6 */}
      <div className="space-y-2">
        <div className="flex flex-wrap items-center gap-1.5 text-xs">
          <span className="text-slate-500 text-[11px] mr-1 flex items-center gap-1">
            <Sparkles className="w-3 h-3 text-cyan-400" /> IPv4 Presets:
          </span>
          <button
            onClick={() => handleApplyPreset('192.168.1.1/24')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
          >
            192.168.1.1 (RFC 1918)
          </button>
          <button
            onClick={() => handleApplyPreset('100.64.0.1')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-amber-300 border border-amber-900/50 transition"
          >
            100.64.0.1 (CGNAT)
          </button>
          <button
            onClick={() => handleApplyPreset('127.0.0.1')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
          >
            127.0.0.1 (Loopback)
          </button>
          <button
            onClick={() => handleApplyPreset('8.8.8.8')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-blue-300 border border-blue-900/50 transition"
          >
            8.8.8.8 (Public Unicast)
          </button>
          <button
            onClick={() => handleApplyPreset('224.0.0.5')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-emerald-300 border border-emerald-900/50 transition"
          >
            224.0.0.5 (OSPF Multicast)
          </button>
        </div>

        <div className="flex flex-wrap items-center gap-1.5 text-xs">
          <span className="text-slate-500 text-[11px] mr-1 flex items-center gap-1">
            <Sparkles className="w-3 h-3 text-electric-400" /> IPv6 Presets:
          </span>
          <button
            onClick={() => handleApplyPreset('2001:db8::1')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
          >
            2001:db8::1 (Documentation)
          </button>
          <button
            onClick={() => handleApplyPreset('::1')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-cyan-300 border border-slate-800 transition"
          >
            ::1 (Loopback)
          </button>
          <button
            onClick={() => handleApplyPreset('fe80::1ff:fe23:4567')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-purple-300 border border-purple-900/50 transition"
          >
            fe80::1 (Link-Local)
          </button>
          <button
            onClick={() => handleApplyPreset('fd12:3456:789a::1')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-emerald-300 border border-emerald-900/50 transition"
          >
            fd12::1 (ULA Private)
          </button>
          <button
            onClick={() => handleApplyPreset('::ffff:192.168.1.1')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-amber-300 border border-amber-900/50 transition"
          >
            ::ffff:192.168.1.1 (IPv4-Mapped)
          </button>
        </div>
      </div>

      {/* Main Input Form */}
      <div>
        <label className="block text-xs font-semibold uppercase tracking-wider text-slate-300 mb-2">
          IPv4 or IPv6 Address (with optional CIDR prefix)
        </label>
        <div className="flex gap-2">
          <input
            type="text"
            value={inputVal}
            onChange={(e) => setInputVal(e.target.value)}
            placeholder="e.g. 192.168.1.1/24 or 2001:db8::1/64"
            className="w-full bg-navy-950 border border-slate-700 focus:border-electric-400 focus:ring-1 focus:ring-electric-400 rounded-xl px-4 py-2.5 font-mono text-sm sm:text-base text-white outline-none transition"
          />
        </div>
      </div>

      {/* Error Message */}
      {parsedInfo.error && (
        <div className="p-3.5 bg-red-950/40 border border-red-500/40 rounded-xl text-red-300 text-xs flex items-center gap-2">
          <Info className="w-4 h-4 text-red-400 flex-shrink-0" />
          <span>{parsedInfo.error}</span>
        </div>
      )}

      {/* Results Display */}
      {!parsedInfo.error && (
        <div className="space-y-4">
          {/* Main Attributes Grid */}
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-3">
            <div className="bg-navy-950/80 p-3.5 rounded-xl border border-slate-800">
              <span className="text-[11px] text-slate-400 uppercase tracking-wider block mb-1">Address Family</span>
              <div className="flex items-center gap-2">
                <span className="text-base font-bold font-mono text-white">{parsedInfo.family}</span>
                <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-electric-950 text-electric-300 border border-electric-800">
                  /{parsedInfo.cidr}
                </span>
              </div>
            </div>

            <div className="bg-navy-950/80 p-3.5 rounded-xl border border-slate-800">
              <span className="text-[11px] text-slate-400 uppercase tracking-wider block mb-1">RFC Classification</span>
              <span className={`inline-block text-[11px] font-mono font-semibold px-2 py-0.5 rounded border ${getScopeBadgeColor(parsedInfo.scopeType)}`}>
                {parsedInfo.scopeType}
              </span>
              <span className="text-[10px] font-mono text-slate-400 block mt-1">{parsedInfo.rfc}</span>
            </div>

            <div className="bg-navy-950/80 p-3.5 rounded-xl border border-slate-800 md:col-span-2">
              <span className="text-[11px] text-slate-400 uppercase tracking-wider block mb-1">Authoritative Scope Description</span>
              <div className="text-xs font-semibold text-cyan-300">{parsedInfo.scope}</div>
              <span className="text-[10px] text-slate-500 block mt-0.5">{parsedInfo.format}</span>
            </div>
          </div>

          {/* IPv4-Mapped Specific Alert */}
          {parsedInfo.mappedV4 && (
            <div className="p-3.5 rounded-xl bg-amber-950/30 border border-amber-800/40 text-xs text-amber-200 flex items-center justify-between">
              <div>
                <strong className="block text-white">Dual-Stack IPv4-Mapped IPv6 Address Detected</strong>
                <span>This address encapsulates the IPv4 host <code className="bg-slate-900 px-1 py-0.5 rounded text-cyan-300 font-mono font-bold">{parsedInfo.mappedV4}</code> within an IPv6 packet header.</span>
              </div>
              <span className="text-xs font-mono font-bold px-2 py-1 rounded bg-amber-900/60 border border-amber-700">
                RFC 4291 §2.5.5.2
              </span>
            </div>
          )}

          {/* Formats & Reverse PTR */}
          <div className="space-y-2.5">
            {/* Expanded IPv6 format */}
            {parsedInfo.isV6 && (
              <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 flex flex-col sm:flex-row sm:items-center justify-between gap-2">
                <div className="space-y-0.5">
                  <span className="text-[10px] text-slate-400 uppercase font-semibold block">Expanded 128-bit IPv6 Format</span>
                  <span className="font-mono text-xs text-slate-200 select-all">{parsedInfo.expanded}</span>
                </div>
                <button
                  onClick={() => copyToClipboard(parsedInfo.expanded, 'exp')}
                  className="self-end sm:self-center p-1.5 rounded-lg bg-navy-900 hover:bg-slate-800 text-slate-400 hover:text-white border border-slate-800 transition"
                  title="Copy expanded address"
                >
                  {copiedKey === 'exp' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                </button>
              </div>
            )}

            {/* Reverse DNS PTR */}
            <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 flex flex-col sm:flex-row sm:items-center justify-between gap-2">
              <div className="space-y-0.5 overflow-hidden">
                <span className="text-[10px] text-slate-400 uppercase font-semibold block">Reverse DNS Pointer (PTR Record)</span>
                <span className="font-mono text-xs text-cyan-300 select-all truncate block" title={parsedInfo.reversePtr}>
                  {parsedInfo.reversePtr}
                </span>
              </div>
              <button
                onClick={() => copyToClipboard(parsedInfo.reversePtr, 'ptr')}
                className="self-end sm:self-center p-1.5 rounded-lg bg-navy-900 hover:bg-slate-800 text-slate-400 hover:text-white border border-slate-800 transition flex-shrink-0"
                title="Copy Reverse PTR"
              >
                {copiedKey === 'ptr' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
              </button>
            </div>

            {/* Binary Representation */}
            <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
              <div className="flex items-center justify-between">
                <span className="text-[10px] text-slate-400 uppercase font-semibold">
                  Binary Representation ({parsedInfo.isV6 ? '128 Bits' : '32 Bits'})
                </span>
                <button
                  onClick={() => copyToClipboard(parsedInfo.binary, 'bin')}
                  className="text-slate-500 hover:text-white p-1"
                  title="Copy binary"
                >
                  {copiedKey === 'bin' ? <Check className="w-3 h-3 text-emerald-400" /> : <Copy className="w-3 h-3" />}
                </button>
              </div>
              <div className="font-mono text-[11px] text-slate-300 break-all select-all leading-relaxed">
                {parsedInfo.binary}
              </div>
            </div>

            {/* Numeric & Hex values */}
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 text-xs font-mono">
              <div className="p-3 rounded-xl bg-navy-950 border border-slate-800 flex items-center justify-between">
                <div>
                  <span className="text-[10px] text-slate-400 uppercase block">Hexadecimal:</span>
                  <span className="text-slate-200 select-all">{parsedInfo.hex}</span>
                </div>
                <button
                  onClick={() => copyToClipboard(parsedInfo.hex, 'hex')}
                  className="text-slate-500 hover:text-white p-1"
                >
                  {copiedKey === 'hex' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                </button>
              </div>

              <div className="p-3 rounded-xl bg-navy-950 border border-slate-800 flex items-center justify-between overflow-hidden">
                <div className="truncate mr-2">
                  <span className="text-[10px] text-slate-400 uppercase block">Integer Representation:</span>
                  <span className="text-slate-200 select-all truncate block">{parsedInfo.integer}</span>
                </div>
                <button
                  onClick={() => copyToClipboard(parsedInfo.integer, 'int')}
                  className="text-slate-500 hover:text-white p-1 flex-shrink-0"
                >
                  {copiedKey === 'int' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Educational & Authoritative Reference Guide (Bilingual) */}
      <div className="pt-6 border-t border-slate-800 text-xs text-slate-400 space-y-4">
        <h4 className="text-white font-bold text-sm flex items-center gap-2">
          <BookOpen className="w-4 h-4 text-electric-400" />
          {language === 'hi' ? 'IPv4 और IPv6 विशेष एड्रेस श्रेणियों का तकनीकी विश्लेषण' : 'Technical Analysis: Special-Purpose IP Registries (RFC 6890)'}
        </h4>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-3 text-xs">
          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-cyan-300 block">RFC 6598 Carrier-Grade NAT (CGNAT)</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? '100.64.0.0/10 का उपयोग मोबाइल और ब्रॉडबैंड ISP अपने कोर नेटवर्क में करते हैं ताकि आंतरिक RFC 1918 और सार्वजनिक IP के बीच टकराव न हो।'
                : 'Allocated to ISPs for Large-Scale NAT. Prevents address collision between residential customer networks (RFC 1918) and ISP infrastructure.'}
            </p>
          </div>

          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-purple-300 block">IPv6 Link-Local (fe80::/10)</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? 'प्रत्येक IPv6 इंटरफ़ेस पर स्वचालित रूप से असाइन होता है। यह केवल उसी स्थानीय स्विच या ईथरनेट केबल पर काम करता है और राउटर इसे कभी फॉरवर्ड नहीं करते।'
                : 'Mandatory on every IPv6 interface. Non-routable beyond the local physical wire/VLAN; used for Neighbor Discovery (NDP) and OSPFv3/DHCPv6 peering.'}
            </p>
          </div>

          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-emerald-300 block">IPv6 Unique Local (fc00::/7 ULA)</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? 'IPv6 की प्राइवेट एड्रेस श्रेणी (RFC 4193)। fd00::/8 का उपयोग स्थानीय स्तर पर उत्पन्न 40-बिट रैंडम ग्लोबल आईडी के साथ निजी कॉर्पोरेट नेटवर्क में होता है।'
                : 'The IPv6 equivalent of IPv4 private addresses. Non-routable on the public global Internet; globally unique with a 40-bit pseudo-random Global ID.'}
            </p>
          </div>
        </div>

        {/* Local Processing Privacy Notice */}
        <div className="p-3 rounded-xl bg-blue-950/20 border border-blue-800/30 text-[11px] text-slate-400 flex items-center gap-2">
          <ShieldCheck className="w-4 h-4 text-emerald-400 flex-shrink-0" />
          <span>
            <strong>Client-Side Processing Notice:</strong> All bitwise parsing, reverse PTR generation, and RFC classification happen entirely inside your web browser. No queries or IP values are sent across the network.
          </span>
        </div>
      </div>
    </div>
  );
};
