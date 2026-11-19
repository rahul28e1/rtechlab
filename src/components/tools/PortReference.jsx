import React, { useState, useMemo } from 'react';
import {
  Search,
  ShieldCheck,
  ShieldAlert,
  BookOpen,
  Copy,
  Check,
  RotateCcw,
  Sparkles,
  ChevronDown,
  ChevronUp,
  Terminal,
  Filter,
  Layers,
  ArrowUpDown
} from 'lucide-react';
import { portsData } from '../../data/portsData';
import { useLanguage } from '../../context/LanguageContext';

export const PortReference = ({ isStandalone = false }) => {
  const { language } = useLanguage();

  const [searchTerm, setSearchTerm] = useState('');
  const [protocolFilter, setProtocolFilter] = useState('ALL'); // 'ALL' | 'TCP' | 'UDP' | 'Both'
  const [categoryFilter, setCategoryFilter] = useState('ALL');
  const [rangeFilter, setRangeFilter] = useState('ALL');
  const [sortBy, setSortBy] = useState('port-asc'); // 'port-asc' | 'port-desc' | 'name-asc'
  const [expandedPort, setExpandedPort] = useState(null);
  const [copiedKey, setCopiedKey] = useState(null);

  // Extract unique categories
  const categories = useMemo(() => {
    const set = new Set(portsData.map(p => p.category));
    return ['ALL', ...Array.from(set).sort()];
  }, []);

  // Filtered & Sorted Ports
  const filteredPorts = useMemo(() => {
    const term = searchTerm.toLowerCase().trim();

    const list = portsData.filter((p) => {
      // Protocol Match
      if (protocolFilter !== 'ALL') {
        if (protocolFilter === 'Both' && p.protocol !== 'Both') return false;
        if (protocolFilter === 'TCP' && p.protocol !== 'TCP' && p.protocol !== 'Both') return false;
        if (protocolFilter === 'UDP' && p.protocol !== 'UDP' && p.protocol !== 'Both') return false;
      }

      // Category Match
      if (categoryFilter !== 'ALL' && p.category !== categoryFilter) return false;

      // Range Match
      if (rangeFilter !== 'ALL' && !p.range.startsWith(rangeFilter)) return false;

      // Text Search
      if (term) {
        const matchesPort = p.port.toString().includes(term);
        const matchesService = p.service.toLowerCase().includes(term);
        const matchesDesc = p.description.toLowerCase().includes(term);
        const matchesUsage = p.commonUsage.toLowerCase().includes(term);
        const matchesSec = p.security.toLowerCase().includes(term);
        const matchesCcna = p.ccnaNote.toLowerCase().includes(term);
        const matchesRfc = p.rfc.toLowerCase().includes(term);
        return (
          matchesPort ||
          matchesService ||
          matchesDesc ||
          matchesUsage ||
          matchesSec ||
          matchesCcna ||
          matchesRfc
        );
      }

      return true;
    });

    // Sorting
    return list.sort((a, b) => {
      if (sortBy === 'port-asc') return a.port - b.port;
      if (sortBy === 'port-desc') return b.port - a.port;
      if (sortBy === 'name-asc') return a.service.localeCompare(b.service);
      return 0;
    });
  }, [searchTerm, protocolFilter, categoryFilter, rangeFilter, sortBy]);

  // Copy helper
  const copyToClipboard = (text, key) => {
    navigator.clipboard.writeText(text);
    setCopiedKey(key);
    setTimeout(() => setCopiedKey(null), 2000);
  };

  const handleCopyReport = () => {
    if (filteredPorts.length === 0) return;
    const header = `RTechLab Port & Protocol Reference Report (${filteredPorts.length} entries matched)\n\n`;
    const rows = filteredPorts.map(p =>
      `• Port ${p.port}/${p.protocol} - ${p.service} [${p.category}]\n  Usage: ${p.commonUsage}\n  Security: ${p.security}\n  Hardening: ${p.protection}\n  Cisco ACL: ${p.aclExample}\n  RFC: ${p.rfc}\n`
    ).join('\n');
    copyToClipboard(header + rows, 'full-port-report');
  };

  const handleResetFilters = () => {
    setSearchTerm('');
    setProtocolFilter('ALL');
    setCategoryFilter('ALL');
    setRangeFilter('ALL');
    setSortBy('port-asc');
  };

  const toggleExpand = (portNumber) => {
    setExpandedPort(prev => prev === portNumber ? null : portNumber);
  };

  return (
    <div className={`bg-navy-900 border border-slate-800 rounded-2xl ${isStandalone ? 'p-6 sm:p-8' : 'p-6'} shadow-2xl space-y-6`}>
      {/* Top Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-5 border-b border-slate-800">
        <div>
          <h3 className="text-xl font-bold text-white flex items-center gap-2">
            Port & Protocol Reference Database
            <span className="text-[11px] font-mono px-2 py-0.5 rounded-full bg-cyan-500/10 text-cyan-400 border border-cyan-500/30">
              60+ Curated Ports
            </span>
          </h3>
          <p className="text-xs text-slate-400 mt-1">
            Authoritative IANA/RFC database of Layer 4 transport protocols, security hardening, and Cisco ACL patterns.
          </p>
        </div>

        {/* Action Controls */}
        <div className="flex items-center gap-2">
          <button
            onClick={handleResetFilters}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-navy-950 hover:bg-slate-800 text-slate-300 hover:text-white border border-slate-700/80 text-xs transition"
            title="Reset all filters"
          >
            <RotateCcw className="w-3.5 h-3.5" />
            <span>Reset</span>
          </button>

          {filteredPorts.length > 0 && (
            <button
              onClick={handleCopyReport}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-electric-600 hover:bg-electric-500 text-white font-semibold text-xs transition shadow-sm"
              title="Copy formatted markdown report"
            >
              {copiedKey === 'full-port-report' ? (
                <>
                  <Check className="w-3.5 h-3.5 text-emerald-300" />
                  <span>Report Copied</span>
                </>
              ) : (
                <>
                  <Copy className="w-3.5 h-3.5" />
                  <span>Copy Report ({filteredPorts.length})</span>
                </>
              )}
            </button>
          )}
        </div>
      </div>

      {/* IANA Port Range Reference Banner */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-2 text-xs font-mono">
        <button
          onClick={() => setRangeFilter(rangeFilter === 'Well-Known' ? 'ALL' : 'Well-Known')}
          className={`p-3 rounded-xl border text-left transition ${
            rangeFilter === 'Well-Known'
              ? 'bg-electric-950/70 border-electric-500/60 text-electric-200'
              : 'bg-navy-950 border-slate-800 text-slate-400 hover:border-slate-700'
          }`}
        >
          <span className="text-[10px] uppercase font-bold text-slate-500 block">Ports 0 – 1023</span>
          <strong className="text-white block mt-0.5">Well-Known Ports</strong>
          <span className="text-[11px] text-slate-400">Privileged system services (HTTP, SSH, DNS)</span>
        </button>

        <button
          onClick={() => setRangeFilter(rangeFilter === 'Registered' ? 'ALL' : 'Registered')}
          className={`p-3 rounded-xl border text-left transition ${
            rangeFilter === 'Registered'
              ? 'bg-cyan-950/70 border-cyan-500/60 text-cyan-200'
              : 'bg-navy-950 border-slate-800 text-slate-400 hover:border-slate-700'
          }`}
        >
          <span className="text-[10px] uppercase font-bold text-slate-500 block">Ports 1024 – 49151</span>
          <strong className="text-white block mt-0.5">Registered Ports</strong>
          <span className="text-[11px] text-slate-400">Vendor & app services (MySQL, RDP, Redis)</span>
        </button>

        <div className="p-3 rounded-xl border bg-navy-950 border-slate-800 text-slate-400">
          <span className="text-[10px] uppercase font-bold text-slate-500 block">Ports 49152 – 65535</span>
          <strong className="text-white block mt-0.5">Dynamic / Ephemeral Ports</strong>
          <span className="text-[11px] text-slate-400">Client source ports allocated dynamically by OS</span>
        </div>
      </div>

      {/* Search & Filter Toolbar */}
      <div className="space-y-3">
        {/* Search Input Bar */}
        <div className="relative">
          <Search className="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            placeholder="Search port number (e.g. 22, 53, 443), service (e.g. SSH, MySQL, DNS), or keyword (e.g. cleartext, database, VPN)..."
            className="w-full bg-navy-950 border border-slate-700 focus:border-electric-400 focus:ring-1 focus:ring-electric-400 rounded-xl pl-10 pr-20 py-2.5 font-sans text-sm text-white placeholder-slate-500 outline-none transition"
          />
          {searchTerm && (
            <button
              onClick={() => setSearchTerm('')}
              className="absolute right-3 top-1/2 -translate-y-1/2 text-xs text-slate-400 hover:text-white px-2 py-0.5 rounded bg-slate-800"
            >
              Clear
            </button>
          )}
        </div>

        {/* Multi-Filters: Protocol, Category, Sort */}
        <div className="flex flex-wrap items-center justify-between gap-3 text-xs">
          {/* Protocol Toggle Buttons */}
          <div className="flex items-center gap-1.5 bg-navy-950 p-1 rounded-xl border border-slate-800">
            <span className="text-slate-500 text-[11px] px-2 font-semibold">Protocol:</span>
            {['ALL', 'TCP', 'UDP', 'Both'].map((proto) => (
              <button
                key={proto}
                onClick={() => setProtocolFilter(proto)}
                className={`px-2.5 py-1 rounded-lg text-xs font-semibold transition ${
                  protocolFilter === proto
                    ? 'bg-electric-600 text-white shadow-sm'
                    : 'text-slate-400 hover:text-white'
                }`}
              >
                {proto}
              </button>
            ))}
          </div>

          {/* Category Dropdown */}
          <div className="flex items-center gap-2">
            <div className="flex items-center gap-1.5 bg-navy-950 px-2 py-1 rounded-xl border border-slate-800">
              <Filter className="w-3.5 h-3.5 text-slate-400" />
              <select
                value={categoryFilter}
                onChange={(e) => setCategoryFilter(e.target.value)}
                className="bg-transparent text-slate-300 text-xs outline-none cursor-pointer"
              >
                {categories.map((cat) => (
                  <option key={cat} value={cat} className="bg-navy-950 text-white">
                    {cat === 'ALL' ? 'All Categories' : cat}
                  </option>
                ))}
              </select>
            </div>

            {/* Sort Dropdown */}
            <div className="flex items-center gap-1.5 bg-navy-950 px-2 py-1 rounded-xl border border-slate-800">
              <ArrowUpDown className="w-3.5 h-3.5 text-slate-400" />
              <select
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value)}
                className="bg-transparent text-slate-300 text-xs outline-none cursor-pointer"
              >
                <option value="port-asc" className="bg-navy-950 text-white">Port (Ascending 0→65535)</option>
                <option value="port-desc" className="bg-navy-950 text-white">Port (Descending)</option>
                <option value="name-asc" className="bg-navy-950 text-white">Service Name (A→Z)</option>
              </select>
            </div>
          </div>
        </div>
      </div>

      {/* Results Count & Presets */}
      <div className="flex flex-wrap items-center justify-between text-xs text-slate-400 pt-1 border-t border-slate-800/60">
        <div>
          Showing <span className="font-bold text-cyan-300">{filteredPorts.length}</span> of {portsData.length} ports
          {protocolFilter !== 'ALL' && <span className="ml-1 text-slate-400">({protocolFilter})</span>}
          {categoryFilter !== 'ALL' && <span className="ml-1 text-slate-400">in {categoryFilter}</span>}
        </div>

        {/* Quick Example Shortcuts */}
        <div className="flex items-center gap-1.5 text-[11px]">
          <span className="text-slate-500 flex items-center gap-1">
            <Sparkles className="w-3 h-3 text-cyan-400" /> Quick:
          </span>
          {['SSH', 'DNS', 'HTTPS', 'MySQL', 'RDP', 'WireGuard'].map((preset) => (
            <button
              key={preset}
              onClick={() => {
                setSearchTerm(preset);
                setProtocolFilter('ALL');
                setCategoryFilter('ALL');
              }}
              className="px-2 py-0.5 rounded bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
            >
              {preset}
            </button>
          ))}
        </div>
      </div>

      {/* Ports List Display */}
      <div className="space-y-3 max-h-[600px] overflow-y-auto pr-1">
        {filteredPorts.length === 0 ? (
          <div className="p-12 text-center text-slate-500 rounded-xl bg-navy-950 border border-slate-800 space-y-2">
            <p className="text-sm font-semibold text-slate-400">No ports found matching your criteria.</p>
            <p className="text-xs">Try clearing filters or searching for terms like 'SSH', 'DNS', 'MySQL', or port numbers like '22', '443'.</p>
            <button
              onClick={handleResetFilters}
              className="mt-2 px-3 py-1.5 rounded-lg bg-electric-600 hover:bg-electric-500 text-white font-semibold text-xs transition"
            >
              Clear All Filters
            </button>
          </div>
        ) : (
          filteredPorts.map((item) => {
            const isExpanded = expandedPort === item.port;
            const isBoth = item.protocol === 'Both';
            const isUdp = item.protocol === 'UDP';

            return (
              <div
                key={item.port}
                className="rounded-xl bg-navy-950 border border-slate-800 hover:border-slate-700 transition overflow-hidden shadow-sm"
              >
                {/* Header Row */}
                <div
                  onClick={() => toggleExpand(item.port)}
                  className="p-3.5 sm:p-4 flex flex-col sm:flex-row sm:items-center justify-between gap-3 cursor-pointer hover:bg-navy-850/60 transition group"
                >
                  <div className="flex items-start sm:items-center gap-3">
                    {/* Port Number Pill */}
                    <div className="flex-shrink-0 w-20 text-center py-1.5 px-2 rounded-lg bg-navy-900 border border-slate-700 group-hover:border-electric-500/50 transition">
                      <span className="text-base font-bold font-mono text-cyan-300 block leading-tight">
                        {item.port}
                      </span>
                      <span className={`text-[10px] font-mono font-bold uppercase block mt-0.5 ${
                        isBoth ? 'text-purple-400' : isUdp ? 'text-amber-400' : 'text-electric-400'
                      }`}>
                        {item.protocol}
                      </span>
                    </div>

                    {/* Service & Brief Description */}
                    <div>
                      <div className="flex flex-wrap items-center gap-2">
                        <h4 className="font-bold text-white text-sm group-hover:text-cyan-300 transition">
                          {item.service}
                        </h4>
                        <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-slate-900 text-slate-400 border border-slate-800">
                          {item.category}
                        </span>
                        <span className="text-[10px] font-mono text-slate-500 hidden md:inline">
                          {item.rfc}
                        </span>
                      </div>
                      <p className="text-xs text-slate-400 mt-1 line-clamp-1 sm:line-clamp-none">
                        {item.description}
                      </p>
                    </div>
                  </div>

                  {/* Right Badges & Expand Indicator */}
                  <div className="flex items-center gap-2 self-end sm:self-center">
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        copyToClipboard(item.port.toString(), `port-${item.port}`);
                      }}
                      className="p-1.5 rounded-lg bg-navy-900 hover:bg-slate-800 text-slate-400 hover:text-white border border-slate-800 transition text-xs flex items-center gap-1"
                      title="Copy port number"
                    >
                      {copiedKey === `port-${item.port}` ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                      <span className="hidden lg:inline text-[11px]">Port</span>
                    </button>

                    <div className="p-1 rounded-lg text-slate-400 group-hover:text-white transition">
                      {isExpanded ? <ChevronUp className="w-4 h-4 text-cyan-400" /> : <ChevronDown className="w-4 h-4" />}
                    </div>
                  </div>
                </div>

                {/* Expanded In-Depth Information Panel */}
                {isExpanded && (
                  <div className="p-4 pt-2 border-t border-slate-800/80 bg-navy-900/40 space-y-3.5 text-xs">
                    {/* Common Usage & Scope */}
                    <div>
                      <span className="text-[10px] font-bold text-slate-400 uppercase tracking-wider block mb-1">
                        Operational Usage & Protocol Mechanics
                      </span>
                      <p className="text-slate-300 leading-relaxed font-sans">
                        {item.commonUsage}
                      </p>
                    </div>

                    {/* Security & Risk Analysis */}
                    <div className="p-3 rounded-xl bg-amber-950/20 border border-amber-900/40 space-y-1">
                      <div className="flex items-center gap-1.5 text-amber-300 font-bold text-[11px] uppercase tracking-wider">
                        <ShieldAlert className="w-3.5 h-3.5 text-amber-400" />
                        <span>Security Risk & Threat Profile</span>
                      </div>
                      <p className="text-amber-200/90 text-xs leading-relaxed">
                        {item.security}
                      </p>
                    </div>

                    {/* Recommended Protection / Hardening */}
                    <div className="p-3 rounded-xl bg-emerald-950/20 border border-emerald-900/40 space-y-1">
                      <div className="flex items-center gap-1.5 text-emerald-300 font-bold text-[11px] uppercase tracking-wider">
                        <ShieldCheck className="w-3.5 h-3.5 text-emerald-400" />
                        <span>Recommended Hardening & Architecture</span>
                      </div>
                      <p className="text-emerald-200/90 text-xs leading-relaxed">
                        {item.protection}
                      </p>
                    </div>

                    {/* Commands & Cisco ACL Snippet */}
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-3 pt-1">
                      {/* OS Diagnostic / Firewall Command */}
                      <div className="p-3 rounded-xl bg-navy-950 border border-slate-800 space-y-1.5">
                        <div className="flex items-center justify-between text-slate-400 text-[10px] font-bold uppercase">
                          <span className="flex items-center gap-1">
                            <Terminal className="w-3 h-3 text-cyan-400" />
                            Linux / Host Diagnostic Command
                          </span>
                          <button
                            onClick={() => copyToClipboard(item.command, `cmd-${item.port}`)}
                            className="text-slate-400 hover:text-white p-0.5"
                            title="Copy command"
                          >
                            {copiedKey === `cmd-${item.port}` ? <Check className="w-3 h-3 text-emerald-400" /> : <Copy className="w-3 h-3" />}
                          </button>
                        </div>
                        <code className="text-cyan-300 font-mono text-[11px] block break-all select-all">
                          {item.command}
                        </code>
                      </div>

                      {/* Cisco IOS ACL Snippet */}
                      <div className="p-3 rounded-xl bg-navy-950 border border-slate-800 space-y-1.5">
                        <div className="flex items-center justify-between text-slate-400 text-[10px] font-bold uppercase">
                          <span className="flex items-center gap-1">
                            <Layers className="w-3 h-3 text-electric-400" />
                            Cisco IOS Access-List Example
                          </span>
                          <button
                            onClick={() => copyToClipboard(item.aclExample, `acl-${item.port}`)}
                            className="text-slate-400 hover:text-white p-0.5"
                            title="Copy Cisco ACL"
                          >
                            {copiedKey === `acl-${item.port}` ? <Check className="w-3 h-3 text-emerald-400" /> : <Copy className="w-3 h-3" />}
                          </button>
                        </div>
                        <code className="text-electric-300 font-mono text-[11px] block break-all select-all">
                          {item.aclExample}
                        </code>
                      </div>
                    </div>

                    {/* CCNA Note */}
                    <div className="pt-1 flex items-start gap-2 text-[11px] text-slate-400">
                      <BookOpen className="w-3.5 h-3.5 text-cyan-400 flex-shrink-0 mt-0.5" />
                      <span>
                        <strong className="text-slate-300">Cisco CCNA Exam Tip:</strong> {item.ccnaNote}
                      </span>
                    </div>
                  </div>
                )}
              </div>
            );
          })
        )}
      </div>

      {/* Educational & Practical Technical Notes (Bilingual) */}
      <div className="pt-6 border-t border-slate-800 text-xs text-slate-400 space-y-4">
        <h4 className="text-white font-bold text-sm flex items-center gap-2">
          <BookOpen className="w-4 h-4 text-electric-400" />
          {language === 'hi' ? 'नेटवर्किंग में पोर्ट और प्रोटोकॉल के बुनियादी सिद्धांत' : 'Transport Layer Engineering: TCP vs UDP & Port Multiplexing'}
        </h4>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-3 text-xs">
          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-cyan-300 block">IP Address vs Port Number</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? 'IP एड्रेस नेटवर्क पर होस्ट मशीन की पहचान करता है (जैसे किसी बिल्डिंग का पता), जबकि पोर्ट नंबर उस मशीन के भीतर चल रहे विशिष्ट सॉफ्टवेयर एप्लिकेशन की पहचान करता है (जैसे उस बिल्डिंग में कमरा नंबर)।'
                : 'An IP address routes packets to the target physical or virtual host (OSI Layer 3). A Port number directs the payload to the specific software process or daemon listening on that host (OSI Layer 4).'}
            </p>
          </div>

          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-electric-300 block">TCP (3-Way Handshake) vs UDP</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? 'TCP कनेक्शन-उन्मुख है (SYN, SYN-ACK, ACK) जो डेटा डिलीवरी की गारंटी देता है। UDP कनेक्शन-रहित और हल्का है, जिसका उपयोग DNS, DHCP और वीडियो स्ट्रीमिंग जैसे कम विलंबता वाले प्रोटोकॉल करते हैं।'
                : 'TCP establishes reliable, sequence-acknowledged sessions (SYN, SYN-ACK, ACK). UDP transmits connectionless, lightweight datagrams without retransmission overhead, optimal for DNS, NTP, and real-time voice.'}
            </p>
          </div>

          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-emerald-300 block">Port Security & Attack Surface</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? 'केवल एक पोर्ट का खुला होना ही सुरक्षा खतरा नहीं है। खतरा तब उत्पन्न होता है जब उस पोर्ट पर पुराना, अनपैच किया गया या कमजोर पासवर्ड वाला सॉफ्टवेयर चल रहा हो। फ़ायरवॉल अनाधिकृत ट्रैफिक को रोकता है।'
                : 'An open port is not inherently vulnerable; danger arises when the listening daemon has unpatched software vulnerabilities, weak authentication, or cleartext protocols. Defense-in-depth requires firewall whitelisting.'}
            </p>
          </div>
        </div>

        {/* Client-Side Safety Disclosures */}
        <div className="p-3 rounded-xl bg-blue-950/20 border border-blue-800/30 text-[11px] text-slate-400 flex items-center gap-2">
          <ShieldCheck className="w-4 h-4 text-emerald-400 flex-shrink-0" />
          <span>
            <strong>Authoritative IANA Classification:</strong> Port definitions strictly adhere to RFC 6335 guidelines. Default port numbers represent conventional assignments; actual daemon listening ports may be customized by administrators.
          </span>
        </div>
      </div>
    </div>
  );
};
