import React, { useState } from 'react';
import {
  Search,
  Globe2,
  Clock,
  Copy,
  Check,
  RotateCcw,
  Sparkles,
  ShieldCheck,
  FileText,
  AlertCircle
} from 'lucide-react';
import { useLanguage } from '../../context/LanguageContext';

export const DnsLookup = ({ isStandalone = false }) => {
  const { language } = useLanguage();

  const [domainInput, setDomainInput] = useState('wikipedia.org');
  const [recordType, setRecordType] = useState('A'); // 'A' | 'AAAA' | 'MX' | 'TXT' | 'NS' | 'CNAME' | 'ALL'
  const [resolver, setResolver] = useState('cloudflare'); // 'cloudflare' | 'google'
  const [loading, setLoading] = useState(false);
  const [results, setResults] = useState(null);
  const [error, setError] = useState(null);
  const [queryTime, setQueryTime] = useState(null);
  const [copiedKey, setCopiedKey] = useState(null);

  const recordTypes = ['A', 'AAAA', 'MX', 'TXT', 'NS', 'CNAME', 'ALL'];

  // Clean domain input (remove protocol, path, port, whitespace)
  const sanitizeDomain = (raw) => {
    let cleaned = raw.trim().toLowerCase();
    cleaned = cleaned.replace(/^https?:\/\//i, '');
    cleaned = cleaned.replace(/^ftp:\/\//i, '');
    cleaned = cleaned.split('/')[0];
    cleaned = cleaned.split(':')[0];
    cleaned = cleaned.split('?')[0];
    cleaned = cleaned.replace(/\.$/, '');
    return cleaned;
  };

  const validateDomain = (d) => {
    if (!d) return 'Please enter a domain name (e.g. example.com).';
    const domainRegex = /^([a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$/;
    if (!domainRegex.test(d)) {
      return 'Please enter a valid domain format without paths or special symbols.';
    }
    return null;
  };

  const executeDnsQuery = async (targetDomain, targetType, targetResolver = resolver) => {
    const clean = sanitizeDomain(targetDomain);
    const valErr = validateDomain(clean);
    if (valErr) {
      setError(valErr);
      setResults(null);
      return;
    }

    setError(null);
    setLoading(true);
    setResults(null);
    setQueryTime(null);

    const startTime = performance.now();
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), 9000);

    try {
      if (targetType === 'ALL') {
        // Multi-query across 6 core record types concurrently
        const queries = ['A', 'AAAA', 'MX', 'TXT', 'NS', 'CNAME'].map(async (t) => {
          const url = targetResolver === 'google'
            ? `https://dns.google/resolve?name=${encodeURIComponent(clean)}&type=${t}`
            : `https://cloudflare-dns.com/dns-query?name=${encodeURIComponent(clean)}&type=${t}`;

          const res = await fetch(url, {
            headers: { Accept: 'application/dns-json' },
            signal: controller.signal
          });
          if (!res.ok) throw new Error(`HTTP ${res.status}`);
          const json = await res.json();
          return { type: t, status: json.Status, answers: json.Answer || [] };
        });

        const allResults = await Promise.all(queries);
        clearTimeout(timeoutId);
        const duration = Math.round(performance.now() - startTime);
        setQueryTime(duration);

        const flattened = [];
        for (const item of allResults) {
          for (const ans of item.answers) {
            flattened.push({
              name: ans.name,
              typeNum: ans.type,
              typeStr: item.type,
              TTL: ans.TTL,
              data: ans.data
            });
          }
        }

        setResults({
          domain: clean,
          type: 'ALL',
          status: 0,
          resolver: targetResolver,
          records: flattened,
          answersByGroup: allResults
        });
      } else {
        // Single Type Query
        const url = targetResolver === 'google'
          ? `https://dns.google/resolve?name=${encodeURIComponent(clean)}&type=${targetType}`
          : `https://cloudflare-dns.com/dns-query?name=${encodeURIComponent(clean)}&type=${targetType}`;

        const res = await fetch(url, {
          headers: { Accept: 'application/dns-json' },
          signal: controller.signal
        });

        clearTimeout(timeoutId);
        if (!res.ok) throw new Error(`Resolver returned HTTP ${res.status}`);
        const data = await res.json();
        const duration = Math.round(performance.now() - startTime);
        setQueryTime(duration);

        setResults({
          domain: clean,
          type: targetType,
          status: data.Status,
          resolver: targetResolver,
          records: (data.Answer || []).map(a => ({
            name: a.name,
            typeNum: a.type,
            typeStr: targetType,
            TTL: a.TTL,
            data: a.data
          }))
        });
      }
    } catch (err) {
      clearTimeout(timeoutId);
      if (err.name === 'AbortError') {
        setError('Query timed out after 9 seconds. The remote DNS resolver did not respond.');
      } else {
        setError(`Failed to resolve DNS query (${err.message || 'Network/CORS error'}). Please check connectivity.`);
      }
    } finally {
      setLoading(false);
    }
  };

  const handleSearch = (e) => {
    if (e) e.preventDefault();
    executeDnsQuery(domainInput, recordType);
  };

  const handleApplyPreset = (domain, type = 'A') => {
    setDomainInput(domain);
    setRecordType(type);
    executeDnsQuery(domain, type);
  };

  const handleReset = () => {
    setDomainInput('wikipedia.org');
    setRecordType('A');
    setResults(null);
    setError(null);
    setQueryTime(null);
  };

  const copyToClipboard = (text, key) => {
    navigator.clipboard.writeText(text);
    setCopiedKey(key);
    setTimeout(() => setCopiedKey(null), 2000);
  };

  const handleCopyFullReport = () => {
    if (!results || !results.records) return;
    const lines = [
      `RTechLab DNS Lookup Report: ${results.domain}`,
      `Query Type: ${results.type} | Resolver: ${results.resolver === 'cloudflare' ? 'Cloudflare 1.1.1.1' : 'Google 8.8.8.8'}`,
      `Client Response Time: ${queryTime} ms | Records Returned: ${results.records.length}`,
      '------------------------------------------------------------'
    ];

    if (results.records.length === 0) {
      lines.push('No records returned for this query type.');
    } else {
      results.records.forEach((r, idx) => {
        lines.push(`[${idx + 1}] ${r.name} | ${r.typeStr} | TTL: ${r.TTL}s | ${r.data}`);
      });
    }

    copyToClipboard(lines.join('\n'), 'full-dns-report');
  };

  const parseRecordDetail = (r) => {
    // MX records formatting: e.g. "10 mx-in1001.wikimedia.org."
    if (r.typeStr === 'MX') {
      const parts = r.data.trim().split(/\s+/);
      const priority = parts[0];
      const host = parts.slice(1).join(' ').replace(/\.$/, '');
      return (
        <div className="flex items-center gap-2">
          <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-blue-950 text-blue-300 border border-blue-800">
            Priority: {priority}
          </span>
          <span className="font-mono text-cyan-300 font-semibold">{host}</span>
        </div>
      );
    }

    // TXT records formatting
    if (r.typeStr === 'TXT') {
      const text = r.data.replace(/^"|"$/g, '');
      const isSpf = text.startsWith('v=spf1');
      const isDmarc = text.startsWith('v=DMARC1');
      return (
        <div className="space-y-1">
          <div className="flex items-center gap-2">
            {isSpf && (
              <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-emerald-950 text-emerald-300 border border-emerald-800 font-bold">
                SPF Record
              </span>
            )}
            {isDmarc && (
              <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-purple-950 text-purple-300 border border-purple-800 font-bold">
                DMARC Policy
              </span>
            )}
          </div>
          <p className="font-mono text-xs text-slate-200 whitespace-pre-wrap break-all select-all">
            {text}
          </p>
        </div>
      );
    }

    // Clean trailing dot for hosts in NS / CNAME
    const displayData = r.data.replace(/\.$/, '');
    return (
      <span className="font-mono text-cyan-300 font-semibold break-all select-all">
        {displayData}
      </span>
    );
  };

  const formatTtl = (ttl) => {
    if (ttl >= 86400) return `${ttl}s (${Math.round(ttl / 86400)}d)`;
    if (ttl >= 3600) return `${ttl}s (${Math.round(ttl / 3600)}h)`;
    if (ttl >= 60) return `${ttl}s (${Math.round(ttl / 60)}m)`;
    return `${ttl}s`;
  };

  return (
    <div className={`bg-navy-900 border border-slate-800 rounded-2xl ${isStandalone ? 'p-6 sm:p-8' : 'p-6'} shadow-2xl space-y-6`}>
      {/* Top Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-5 border-b border-slate-800">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-xl bg-electric-500/10 border border-electric-500/30 flex items-center justify-center text-electric-400 flex-shrink-0">
            <Globe2 className="w-5 h-5" />
          </div>
          <div>
            <h3 className="text-xl font-bold text-white flex items-center gap-2">
              DNS Record Lookup (DNS-over-HTTPS)
              <span className="text-[11px] font-mono px-2 py-0.5 rounded-full bg-cyan-500/10 text-cyan-400 border border-cyan-500/30">
                Live Query
              </span>
            </h3>
            <p className="text-xs text-slate-400">
              Query A, AAAA, MX, TXT, NS, and CNAME records live via authenticated DoH resolvers.
            </p>
          </div>
        </div>

        {/* Action Buttons: Reset & Copy */}
        <div className="flex items-center gap-2">
          <button
            onClick={handleReset}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-navy-950 hover:bg-slate-800 text-slate-300 hover:text-white border border-slate-700/80 text-xs transition"
            title="Reset domain and type"
          >
            <RotateCcw className="w-3.5 h-3.5" />
            <span>Reset</span>
          </button>

          {results && results.records && results.records.length > 0 && (
            <button
              onClick={handleCopyFullReport}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-electric-600 hover:bg-electric-500 text-white font-semibold text-xs transition shadow-sm"
              title="Copy formatted markdown report"
            >
              {copiedKey === 'full-dns-report' ? (
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

      {/* Preset Domains */}
      <div className="flex flex-wrap items-center gap-1.5 text-xs">
        <span className="text-slate-500 text-[11px] mr-1 flex items-center gap-1">
          <Sparkles className="w-3 h-3 text-cyan-400" /> Examples:
        </span>
        <button
          onClick={() => handleApplyPreset('wikipedia.org', 'A')}
          className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
        >
          wikipedia.org (A)
        </button>
        <button
          onClick={() => handleApplyPreset('github.com', 'MX')}
          className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
        >
          github.com (MX)
        </button>
        <button
          onClick={() => handleApplyPreset('google.com', 'TXT')}
          className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
        >
          google.com (TXT)
        </button>
        <button
          onClick={() => handleApplyPreset('cloudflare.com', 'NS')}
          className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
        >
          cloudflare.com (NS)
        </button>
        <button
          onClick={() => handleApplyPreset('www.github.com', 'CNAME')}
          className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
        >
          www.github.com (CNAME)
        </button>
      </div>

      {/* Query Form */}
      <form onSubmit={handleSearch} className="space-y-4">
        <div className="grid grid-cols-1 md:grid-cols-12 gap-3">
          {/* Domain Input */}
          <div className="md:col-span-6 relative">
            <label className="block text-xs font-semibold uppercase tracking-wider text-slate-300 mb-2">
              Domain / Hostname
            </label>
            <div className="relative">
              <Search className="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
              <input
                type="text"
                value={domainInput}
                onChange={(e) => setDomainInput(e.target.value)}
                placeholder="e.g. example.com or sub.domain.org"
                className="w-full bg-navy-950 border border-slate-700 focus:border-electric-400 focus:ring-1 focus:ring-electric-400 rounded-xl pl-10 pr-4 py-2.5 font-mono text-sm text-white outline-none transition"
              />
            </div>
          </div>

          {/* Record Type Selector */}
          <div className="md:col-span-3">
            <label className="block text-xs font-semibold uppercase tracking-wider text-slate-300 mb-2">
              Record Type
            </label>
            <select
              value={recordType}
              onChange={(e) => setRecordType(e.target.value)}
              className="w-full bg-navy-950 border border-slate-700 focus:border-electric-400 rounded-xl px-3 py-2.5 font-mono text-sm text-cyan-300 outline-none cursor-pointer"
            >
              {recordTypes.map((t) => (
                <option key={t} value={t}>
                  {t} {t === 'ALL' ? '(All Core Records)' : ''}
                </option>
              ))}
            </select>
          </div>

          {/* Public DoH Resolver */}
          <div className="md:col-span-3">
            <label className="block text-xs font-semibold uppercase tracking-wider text-slate-300 mb-2">
              DoH Resolver
            </label>
            <select
              value={resolver}
              onChange={(e) => setResolver(e.target.value)}
              className="w-full bg-navy-950 border border-slate-700 focus:border-electric-400 rounded-xl px-3 py-2.5 font-mono text-sm text-slate-200 outline-none cursor-pointer"
            >
              <option value="cloudflare">Cloudflare (1.1.1.1)</option>
              <option value="google">Google DNS (8.8.8.8)</option>
            </select>
          </div>
        </div>

        {/* Submit Button & Provider Disclosure */}
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pt-1">
          <div className="text-[11px] text-slate-500 flex items-center gap-1.5">
            <ShieldCheck className="w-3.5 h-3.5 text-emerald-400 flex-shrink-0" />
            <span>
              Queries resolved directly via RFC 8484 DNS-over-HTTPS. Zero logs stored by RTechLab.
            </span>
          </div>

          <button
            type="submit"
            disabled={loading}
            className="px-6 py-2.5 rounded-xl bg-electric-600 hover:bg-electric-500 disabled:bg-slate-800 text-white font-bold text-xs sm:text-sm shadow-md transition flex items-center justify-center gap-2 cursor-pointer"
          >
            {loading ? (
              <>
                <span className="w-3.5 h-3.5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                <span>Querying Resolver...</span>
              </>
            ) : (
              <>
                <Search className="w-4 h-4 text-cyan-200" />
                <span>Perform DNS Lookup</span>
              </>
            )}
          </button>
        </div>
      </form>

      {/* Error Banner */}
      {error && (
        <div className="p-4 bg-red-950/40 border border-red-500/40 rounded-xl text-red-300 text-xs flex items-start gap-2.5">
          <AlertCircle className="w-4 h-4 text-red-400 flex-shrink-0 mt-0.5" />
          <div>
            <strong className="block text-white">DNS Lookup Error</strong>
            <span>{error}</span>
          </div>
        </div>
      )}

      {/* Query Metadata Status Banner */}
      {results && (
        <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 flex flex-wrap items-center justify-between gap-3 text-xs font-mono">
          <div className="flex items-center gap-2">
            <span className="text-slate-400">Target:</span>
            <span className="text-white font-bold">{results.domain}</span>
            <span className="text-slate-600">•</span>
            <span className="text-cyan-400">[{results.type}]</span>
          </div>

          <div className="flex items-center gap-3 text-[11px]">
            {queryTime !== null && (
              <span className="flex items-center gap-1 text-slate-400">
                <Clock className="w-3.5 h-3.5 text-cyan-400" />
                <span>{queryTime} ms</span>
              </span>
            )}
            <span className="text-slate-400">
              Status:{' '}
              {results.status === 0 ? (
                <strong className="text-emerald-400">NOERROR (0)</strong>
              ) : results.status === 3 ? (
                <strong className="text-red-400">NXDOMAIN (3 - Domain Not Found)</strong>
              ) : (
                <strong className="text-amber-400">Status {results.status}</strong>
              )}
            </span>
          </div>
        </div>
      )}

      {/* Results Viewport */}
      {results && results.records && (
        <div className="space-y-3">
          {results.records.length === 0 ? (
            <div className="p-8 rounded-xl bg-navy-950/60 border border-slate-800 text-center text-slate-400 text-xs space-y-1">
              <p className="font-semibold text-slate-300">
                No {results.type} records returned for "{results.domain}".
              </p>
              <p className="text-[11px] text-slate-500">
                The domain exists but has no active {results.type} resource record published in this DNS zone.
              </p>
            </div>
          ) : (
            <div className="overflow-x-auto rounded-xl border border-slate-800">
              <table className="w-full text-left font-mono text-xs">
                <thead className="bg-navy-950 text-slate-400 uppercase text-[10px] border-b border-slate-800">
                  <tr>
                    <th className="py-2.5 px-4">Record Type</th>
                    <th className="py-2.5 px-4">Host / Name</th>
                    <th className="py-2.5 px-4">TTL (Time to Live)</th>
                    <th className="py-2.5 px-4">Resolved Data / Target</th>
                    <th className="py-2.5 px-4 text-right">Action</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-800/80 bg-navy-900/60">
                  {results.records.map((r, idx) => (
                    <tr key={idx} className="hover:bg-navy-850/80 transition group">
                      <td className="py-3 px-4">
                        <span className="font-bold text-xs px-2 py-0.5 rounded bg-electric-950 text-electric-400 border border-electric-800/60">
                          {r.typeStr}
                        </span>
                      </td>
                      <td className="py-3 px-4 text-slate-300 max-w-[150px] truncate" title={r.name}>
                        {r.name.replace(/\.$/, '')}
                      </td>
                      <td className="py-3 px-4 text-slate-400 text-[11px]">
                        {formatTtl(r.TTL)}
                      </td>
                      <td className="py-3 px-4">
                        {parseRecordDetail(r)}
                      </td>
                      <td className="py-3 px-4 text-right">
                        <button
                          onClick={() => copyToClipboard(r.data, `rec-${idx}`)}
                          className="p-1.5 rounded-lg bg-navy-950 hover:bg-slate-800 text-slate-400 hover:text-white border border-slate-800 transition"
                          title="Copy record data"
                        >
                          {copiedKey === `rec-${idx}` ? (
                            <Check className="w-3.5 h-3.5 text-emerald-400" />
                          ) : (
                            <Copy className="w-3.5 h-3.5" />
                          )}
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      )}

      {/* Practical Educational Reference (Bilingual) */}
      <div className="pt-6 border-t border-slate-800 text-xs text-slate-400 space-y-4">
        <h4 className="text-white font-bold text-sm flex items-center gap-2">
          <FileText className="w-4 h-4 text-electric-400" />
          {language === 'hi' ? 'DNS रिकॉर्ड प्रकारों की व्यावहारिक समझ' : 'Understanding Common DNS Record Types'}
        </h4>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-3 text-xs">
          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-cyan-300 block">A & AAAA Records</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? 'A रिकॉर्ड डोमेन को 32-बिट IPv4 एड्रेस से जोड़ता है। AAAA रिकॉर्ड 128-बिट IPv6 एड्रेस के लिए उपयोग होता है।'
                : 'A records map hostnames to 32-bit IPv4 addresses. AAAA records map hostnames to 128-bit modern IPv6 addresses.'}
            </p>
          </div>

          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-electric-400 block">MX (Mail Exchanger)</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? 'MX रिकॉर्ड ईमेल डिलीवरी के लिए सर्वर और प्राथमिकता तय करता है। कम नंबर (जैसे 10) उच्च प्राथमिकता दर्शाता है।'
                : 'Directs incoming email to designated mail servers. The lower preference integer indicates higher priority.'}
            </p>
          </div>

          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-emerald-400 block">TXT, SPF & DMARC</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? 'TXT रिकॉर्ड ईमेल स्पूफिंग रोकने के लिए SPF और DMARC प्रमाणीकरण एवं डोमेन ओनरशिप सत्यापन हेतु उपयोग होता है।'
                : 'Carries arbitrary text for domain verification, SPF (anti-spoofing sender policy), and DMARC enforcement policies.'}
            </p>
          </div>
        </div>

        {/* Third-Party Disclosure */}
        <div className="p-3 rounded-xl bg-blue-950/20 border border-blue-800/30 text-[11px] text-slate-400">
          <span className="font-semibold text-slate-300">Third-Party Resolver Notice:</span> All DNS queries from this tool use public DNS-over-HTTPS (DoH) endpoints operated by Cloudflare (1.1.1.1) or Google Public DNS (8.8.8.8). Cached TTL values reflect the public resolver cache state.
        </div>
      </div>
    </div>
  );
};
