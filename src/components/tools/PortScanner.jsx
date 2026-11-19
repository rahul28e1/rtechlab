import React, { useState } from 'react';
import { Search, ShieldAlert, BookOpen, Copy, Check } from 'lucide-react';
import { portsDatabase } from '../../data/tools';

export const PortScanner = () => {
  const [searchTerm, setSearchTerm] = useState('');
  const [protocolFilter, setProtocolFilter] = useState('ALL');
  const [copiedPort, setCopiedPort] = useState(null);

  const filteredPorts = portsDatabase.filter((p) => {
    const matchesSearch =
      p.port.toString().includes(searchTerm) ||
      p.service.toLowerCase().includes(searchTerm.toLowerCase()) ||
      p.description.toLowerCase().includes(searchTerm.toLowerCase()) ||
      p.ccnaNote.toLowerCase().includes(searchTerm.toLowerCase());

    const matchesProtocol =
      protocolFilter === 'ALL' ||
      p.protocol.toUpperCase().includes(protocolFilter);

    return matchesSearch && matchesProtocol;
  });

  const handleCopy = (portItem) => {
    navigator.clipboard.writeText(`Port ${portItem.port}/${portItem.protocol} (${portItem.service}): ${portItem.description}`);
    setCopiedPort(portItem.port);
    setTimeout(() => setCopiedPort(null), 2000);
  };

  return (
    <div className="bg-navy-900 border border-slate-800 rounded-2xl p-6 shadow-2xl">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-6 border-b border-slate-800/80">
        <div>
          <h3 className="text-xl font-bold text-white flex items-center gap-2">
            Port & Protocol Knowledge Inspector
            <span className="text-[11px] font-mono px-2 py-0.5 rounded-full bg-electric-500/10 text-electric-400 border border-electric-500/30">
              CCNA & Security DB
            </span>
          </h3>
          <p className="text-xs text-slate-400 mt-0.5">
            Real-time lookup for well-known enterprise ports, transport protocols, and exam notes.
          </p>
        </div>

        {/* Protocol Filter */}
        <div className="flex items-center gap-1.5 bg-navy-950 p-1 rounded-xl border border-slate-800">
          {['ALL', 'TCP', 'UDP'].map((proto) => (
            <button
              key={proto}
              onClick={() => setProtocolFilter(proto)}
              className={`px-3 py-1 rounded-lg text-xs font-semibold transition ${
                protocolFilter === proto
                  ? 'bg-electric-600 text-white shadow'
                  : 'text-slate-400 hover:text-white'
              }`}
            >
              {proto}
            </button>
          ))}
        </div>
      </div>

      {/* Search Input Bar */}
      <div className="relative mt-4">
        <Search className="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
        <input
          type="text"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          placeholder="Search by port number (e.g. 22, 53, 443) or service (e.g. SSH, DNS, BGP)..."
          className="w-full bg-navy-950 border border-slate-700/80 focus:border-electric-400 focus:ring-1 focus:ring-electric-400 rounded-xl pl-10 pr-4 py-2.5 text-sm text-white placeholder-slate-500 outline-none transition"
        />
        {searchTerm && (
          <button
            onClick={() => setSearchTerm('')}
            className="absolute right-3 top-1/2 -translate-y-1/2 text-xs text-slate-500 hover:text-white"
          >
            Clear
          </button>
        )}
      </div>

      {/* Port List Results */}
      <div className="mt-4 space-y-2.5 max-h-[380px] overflow-y-auto pr-1">
        {filteredPorts.length === 0 ? (
          <div className="p-8 text-center text-slate-500 text-sm">
            No ports found matching "{searchTerm}". Try searching for 'SSH', 'DNS', '22', or '443'.
          </div>
        ) : (
          filteredPorts.map((item) => (
            <div
              key={item.port}
              className="p-3.5 rounded-xl bg-navy-950/70 hover:bg-navy-850/80 border border-slate-800/80 hover:border-slate-700 transition flex flex-col md:flex-row md:items-center justify-between gap-3 group"
            >
              <div className="flex items-start gap-3">
                <div className="flex-shrink-0 w-16 text-center py-1.5 px-2 rounded-lg bg-navy-900 border border-slate-700">
                  <span className="text-base font-bold font-mono text-cyan-300 block leading-tight">
                    {item.port}
                  </span>
                  <span className="text-[10px] font-mono text-slate-400 font-semibold block">
                    {item.protocol}
                  </span>
                </div>

                <div>
                  <div className="flex items-center gap-2">
                    <h4 className="font-semibold text-white text-sm">{item.service}</h4>
                    <span className="text-xs text-slate-400 font-normal">— {item.description}</span>
                  </div>

                  <div className="flex flex-wrap items-center gap-2 mt-1.5">
                    <span className="inline-flex items-center gap-1 text-[11px] px-2 py-0.5 rounded bg-blue-950/50 text-blue-300 border border-blue-800/50">
                      <BookOpen className="w-3 h-3 text-electric-400" />
                      {item.ccnaNote}
                    </span>
                    <span className="inline-flex items-center gap-1 text-[11px] px-2 py-0.5 rounded bg-amber-950/40 text-amber-300 border border-amber-800/40">
                      <ShieldAlert className="w-3 h-3 text-amber-400" />
                      {item.risk}
                    </span>
                  </div>
                </div>
              </div>

              <button
                onClick={() => handleCopy(item)}
                className="self-end md:self-center p-2 rounded-lg bg-navy-900 hover:bg-slate-800 text-slate-400 hover:text-white border border-slate-800 transition flex items-center gap-1.5 text-xs flex-shrink-0"
                title="Copy reference info"
              >
                {copiedPort === item.port ? (
                  <>
                    <Check className="w-3.5 h-3.5 text-emerald-400" />
                    <span className="text-emerald-400">Copied</span>
                  </>
                ) : (
                  <>
                    <Copy className="w-3.5 h-3.5" />
                    <span className="hidden sm:inline">Copy</span>
                  </>
                )}
              </button>
            </div>
          ))
        )}
      </div>

      <div className="mt-4 pt-3 border-t border-slate-800/70 flex justify-between items-center text-xs text-slate-500">
        <span>Showing {filteredPorts.length} enterprise protocols</span>
        <span>Standard IANA / RFC Assigned Range</span>
      </div>
    </div>
  );
};
