import React, { useState } from 'react';
import { Callout, Field, Panel, Stat } from './toolUi';

const cleanDomain = (raw) =>
  (raw || '')
    .trim()
    .toLowerCase()
    .replace(/^https?:\/\//, '')
    .split('/')[0]
    .split(':')[0]
    .replace(/\.$/, '');

const DNS_TYPES = ['A', 'AAAA', 'NS', 'MX', 'TXT'];

const fetchDns = async (domain) => {
  const results = await Promise.all(
    DNS_TYPES.map(async (type) => {
      const response = await fetch(
        `https://cloudflare-dns.com/dns-query?name=${encodeURIComponent(domain)}&type=${type}`,
        { headers: { Accept: 'application/dns-json' } },
      );
      if (!response.ok) return { type, records: [] };
      const json = await response.json();
      return {
        type,
        records: (json.Answer || []).map((answer) => answer.data.replace(/\.$/, '')),
      };
    }),
  );
  return results;
};

const fetchRdap = async (domain) => {
  const response = await fetch(`https://rdap.org/domain/${encodeURIComponent(domain)}`, {
    headers: { Accept: 'application/rdap+json' },
  });
  if (!response.ok) throw new Error(`RDAP returned HTTP ${response.status}`);
  return response.json();
};

const dateOf = (rdap, action) => {
  const event = (rdap.events || []).find((item) => item.eventAction === action);
  if (!event) return '—';
  const parsed = new Date(event.eventDate);
  return Number.isNaN(parsed.getTime()) ? event.eventDate : parsed.toISOString().slice(0, 10);
};

export const DomainInspector = () => {
  const [domain, setDomain] = useState('wikipedia.org');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [dns, setDns] = useState(null);
  const [rdap, setRdap] = useState(null);
  const [rdapError, setRdapError] = useState('');

  const inspect = async (event) => {
    if (event) event.preventDefault();
    const target = cleanDomain(domain);
    if (!/^([a-z0-9-]+\.)+[a-z]{2,}$/.test(target)) {
      setError('Enter a domain such as example.com — no https://, paths or trailing dots.');
      return;
    }
    setError('');
    setRdapError('');
    setDns(null);
    setRdap(null);
    setLoading(true);

    try {
      const [dnsResult, rdapResult] = await Promise.allSettled([fetchDns(target), fetchRdap(target)]);
      if (dnsResult.status === 'fulfilled') setDns(dnsResult.value);
      if (rdapResult.status === 'fulfilled') setRdap(rdapResult.value);
      else setRdapError(rdapResult.reason?.message || 'Registration data unavailable for this domain.');
    } catch (err) {
      setError(err.message || 'Lookup failed. Check the connection and try again.');
    } finally {
      setLoading(false);
    }
  };

  const registrar = rdap?.entities?.find((entity) => (entity.roles || []).includes('registrar'));
  const registrarName = registrar?.vcardArray?.[1]?.find((field) => field[0] === 'fn')?.[3];
  const nameservers = (rdap?.nameservers || []).map((server) => server.ldhName?.toLowerCase()).filter(Boolean);
  const statuses = rdap?.status || [];

  return (
    <div className="space-y-5">
      <Panel>
        <form onSubmit={inspect} className="flex flex-col gap-3 sm:flex-row sm:items-end">
          <div className="flex-1">
            <Field label="Domain" hint="Registration (RDAP/WHOIS) plus live DNS records">
              <input
                value={domain}
                onChange={(e) => setDomain(e.target.value)}
                placeholder="example.com"
                className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400"
              />
            </Field>
          </div>
          <button
            type="submit"
            disabled={loading}
            className="rounded-xl bg-electric-600 px-5 py-2.5 text-sm font-semibold text-white transition hover:bg-electric-500 disabled:bg-slate-800"
          >
            {loading ? 'Looking up…' : 'Inspect domain'}
          </button>
        </form>

        {error && (
          <div className="mt-4">
            <Callout tone="error">{error}</Callout>
          </div>
        )}
      </Panel>

      {rdap && (
        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Registration data</h2>
          <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
            <Stat label="Registrar" value={registrarName || '—'} />
            <Stat label="Created" value={dateOf(rdap, 'registration')} />
            <Stat label="Expires" value={dateOf(rdap, 'expiration')} tone="text-amber-300" />
            <Stat label="Last changed" value={dateOf(rdap, 'last changed')} />
          </div>
          {nameservers.length > 0 && (
            <div className="mt-3">
              <span className="mb-1 block text-[11px] uppercase tracking-wider text-slate-500">Name servers</span>
              <div className="flex flex-wrap gap-1.5">
                {nameservers.map((server) => (
                  <span key={server} className="rounded-md border border-slate-700 bg-navy-950 px-2 py-0.5 font-mono text-[11px] text-cyan-300">{server}</span>
                ))}
              </div>
            </div>
          )}
          {statuses.length > 0 && (
            <div className="mt-3">
              <span className="mb-1 block text-[11px] uppercase tracking-wider text-slate-500">Domain status</span>
              <div className="flex flex-wrap gap-1.5">
                {statuses.map((status) => (
                  <span key={status} className="rounded-md border border-slate-800 px-2 py-0.5 font-mono text-[11px] text-slate-400">{status}</span>
                ))}
              </div>
            </div>
          )}
        </Panel>
      )}

      {rdapError && (
        <Callout tone="warn">
          {rdapError} Registration data depends on the registry answering RDAP; DNS records below still work because they use a different path.
        </Callout>
      )}

      {dns && (
        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Live DNS records</h2>
          <div className="space-y-2">
            {dns.map((item) => (
              <div key={item.type} className="rounded-xl border border-slate-800 bg-navy-950 p-3">
                <div className="flex items-center gap-2">
                  <span className="rounded-md border border-slate-700 px-1.5 py-0.5 font-mono text-[10px] text-cyan-300">{item.type}</span>
                  <span className="text-[11px] text-slate-500">{item.records.length} record(s)</span>
                </div>
                {item.records.length === 0 ? (
                  <p className="mt-1 text-[11px] text-slate-600">No {item.type} record published.</p>
                ) : (
                  <ul className="mt-1 space-y-0.5">
                    {item.records.slice(0, 8).map((record) => (
                      <li key={record} className="break-all font-mono text-[11px] text-slate-300">{record}</li>
                    ))}
                  </ul>
                )}
              </div>
            ))}
          </div>
        </Panel>
      )}

      {!dns && !rdap && !error && (
        <Callout tone="info">
          Run a lookup to see who owns a domain and where it points. This is the first recon step in any CTF or OSINT lab — registrar, creation date, name servers, then the records themselves.
        </Callout>
      )}
    </div>
  );
};

export default DomainInspector;
