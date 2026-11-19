import React, { useMemo, useState } from 'react';
import { Callout, Field, Panel, Stat } from './toolUi';

// Default unit prices follow the AWS S3 Standard published list rates for
// us-east-1. They are editable because every region and provider differs.
const DEFAULT_PRICES = {
  storage: 0.023, // per GB-month
  put: 0.005, // per 1,000 PUT/COPY/POST/LIST
  get: 0.0004, // per 1,000 GET/SELECT
  egress: 0.09, // per GB out to the internet (first 10 TB tier)
};

const INSTANCES = [
  { label: 't3.micro — 2 vCPU, 1 GB', hourly: 0.0104 },
  { label: 't3.small — 2 vCPU, 2 GB', hourly: 0.0208 },
  { label: 't3.medium — 2 vCPU, 4 GB', hourly: 0.0416 },
  { label: 't3.large — 2 vCPU, 8 GB', hourly: 0.0832 },
  { label: 'm6i.large — 2 vCPU, 8 GB', hourly: 0.096 },
  { label: 'm6i.xlarge — 4 vCPU, 16 GB', hourly: 0.192 },
  { label: 'c6i.large — 2 vCPU, 4 GB (compute)', hourly: 0.085 },
  { label: 'r6i.large — 2 vCPU, 16 GB (memory)', hourly: 0.126 },
];

const inputCls =
  'w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400';

const money = (value) =>
  value.toLocaleString('en-US', { style: 'currency', currency: 'USD', maximumFractionDigits: 2 });

export const CloudCostCalculator = () => {
  const [storageGb, setStorageGb] = useState(100);
  const [putThousands, setPutThousands] = useState(50);
  const [getThousands, setGetThousands] = useState(500);
  const [egressGb, setEgressGb] = useState(200);
  const [hours, setHours] = useState(730);
  const [instance, setInstance] = useState(0.0208);
  const [prices, setPrices] = useState(DEFAULT_PRICES);

  const result = useMemo(() => {
    const storage = (Number(storageGb) || 0) * prices.storage;
    const puts = (Number(putThousands) || 0) * prices.put;
    const gets = (Number(getThousands) || 0) * prices.get;
    const egress = (Number(egressGb) || 0) * prices.egress;
    const compute = (Number(hours) || 0) * Number(instance);
    const items = [
      { label: 'Object storage', detail: `${storageGb} GB-month`, cost: storage },
      { label: 'PUT / POST / LIST', detail: `${putThousands}k requests`, cost: puts },
      { label: 'GET / SELECT', detail: `${getThousands}k requests`, cost: gets },
      { label: 'Data egress', detail: `${egressGb} GB to internet`, cost: egress },
      { label: 'Compute instance', detail: `${hours} h`, cost: compute },
    ];
    const total = items.reduce((sum, item) => sum + item.cost, 0);
    const biggest = [...items].sort((a, b) => b.cost - a.cost)[0];
    return { items, total, biggest, annual: total * 12 };
  }, [storageGb, putThousands, getThousands, egressGb, hours, instance, prices]);

  const setPrice = (key, value) =>
    setPrices((prev) => ({ ...prev, [key]: Number(value) || 0 }));

  return (
    <div className="space-y-5">
      <Panel>
        <h2 className="mb-4 text-sm font-bold uppercase tracking-wider text-slate-300">Workload per month</h2>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <Field label="Storage (GB-month)"><input type="number" min="0" value={storageGb} onChange={(e) => setStorageGb(e.target.value)} className={inputCls} /></Field>
          <Field label="PUT requests (thousands)"><input type="number" min="0" value={putThousands} onChange={(e) => setPutThousands(e.target.value)} className={inputCls} /></Field>
          <Field label="GET requests (thousands)"><input type="number" min="0" value={getThousands} onChange={(e) => setGetThousands(e.target.value)} className={inputCls} /></Field>
          <Field label="Egress to internet (GB)"><input type="number" min="0" value={egressGb} onChange={(e) => setEgressGb(e.target.value)} className={inputCls} /></Field>
        </div>

        <div className="mt-4 grid gap-4 sm:grid-cols-2">
          <Field label="Compute instance">
            <select value={instance} onChange={(e) => setInstance(Number(e.target.value))} className="w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-cyan-300 outline-none">
              <option value={0}>No compute instance</option>
              {INSTANCES.map((item) => (
                <option key={item.label} value={item.hourly}>
                  {item.label}
                </option>
              ))}
            </select>
          </Field>
          <Field label="Hours per month" hint="730 = one always-on instance">
            <input type="number" min="0" max="744" value={hours} onChange={(e) => setHours(e.target.value)} className={inputCls} />
          </Field>
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-3">
          <Stat label="Monthly total" value={money(result.total)} tone="text-emerald-400" />
          <Stat label="Yearly run rate" value={money(result.annual)} tone="text-cyan-300" />
          <Stat label="Biggest line item" value={result.biggest.label} hint={`${money(result.biggest.cost)} / month`} tone="text-amber-300" />
        </div>
      </Panel>

      <div className="grid gap-5 lg:grid-cols-2">
        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Bill breakdown</h2>
          <div className="space-y-2">
            {result.items.map((item) => (
              <div key={item.label} className="rounded-xl border border-slate-800 bg-navy-950 p-3">
                <div className="flex items-center justify-between text-xs">
                  <span className="font-semibold text-slate-200">{item.label}</span>
                  <span className="font-mono text-white">{money(item.cost)}</span>
                </div>
                <div className="mt-1 flex items-center justify-between text-[11px] text-slate-500">
                  <span>{item.detail}</span>
                  <span>{result.total > 0 ? ((item.cost / result.total) * 100).toFixed(0) : 0} %</span>
                </div>
                <div className="mt-1.5 h-1 overflow-hidden rounded-full bg-slate-800">
                  <div className="h-full rounded-full bg-electric-500" style={{ width: `${result.total > 0 ? (item.cost / result.total) * 100 : 0}%` }} />
                </div>
              </div>
            ))}
          </div>
        </Panel>

        <Panel>
          <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Unit prices (editable)</h2>
          <div className="grid gap-3 sm:grid-cols-2">
            <Field label="Storage $/GB-month"><input type="number" step="0.001" value={prices.storage} onChange={(e) => setPrice('storage', e.target.value)} className={inputCls} /></Field>
            <Field label="Egress $/GB"><input type="number" step="0.001" value={prices.egress} onChange={(e) => setPrice('egress', e.target.value)} className={inputCls} /></Field>
            <Field label="PUT $/1k requests"><input type="number" step="0.0001" value={prices.put} onChange={(e) => setPrice('put', e.target.value)} className={inputCls} /></Field>
            <Field label="GET $/1k requests"><input type="number" step="0.0001" value={prices.get} onChange={(e) => setPrice('get', e.target.value)} className={inputCls} /></Field>
          </div>
          <div className="mt-4">
            <Callout tone="warn">
              These are approximate on-demand list prices in USD for one common region. Change them to your provider and region — a reserved instance, savings plan or free tier can move the total by 40–70 %.
            </Callout>
          </div>
          <div className="mt-3">
            <Callout tone="info">
              The lesson most students miss: egress is usually the expensive line, not storage. 1 TB stored costs about $23 a month; serving that same 1 TB to the internet costs about $92.
            </Callout>
          </div>
        </Panel>
      </div>
    </div>
  );
};

export default CloudCostCalculator;
