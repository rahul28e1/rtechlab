import React from 'react';
import { FormTool, InfoList } from './kit';
import { Callout, Panel } from './toolUi';

const toInt = (ip) => ip.trim().split('.').reduce((acc, octet) => (acc * 256) + Number(octet || 0), 0);
const toIp = (value) => [24, 16, 8, 0].map((shift) => Math.floor(value / Math.pow(2, shift)) % 256).join('.');

export const VpcSubnetPlanner = () => (
  <FormTool
    fields={[
      { key: 'vpc', label: 'VPC CIDR', type: 'text', default: '10.0.0.0/16' },
      { key: 'subnetPrefix', label: 'Subnet size', type: 'number', default: 24, min: 16, max: 28 },
      { key: 'azs', label: 'Availability zones', type: 'number', default: 2, min: 1, max: 4 },
      { key: 'tiers', label: 'Tiers per AZ', type: 'number', default: 2, min: 1, max: 4, hint: 'Public + private is the usual pair' },
    ]}
    compute={({ vpc, subnetPrefix, azs, tiers }) => {
      const match = /^(\d{1,3}\.){3}\d{1,3}\/(\d{1,2})$/.exec((vpc || '').trim());
      if (!match) return { error: 'Enter a VPC CIDR such as 10.0.0.0/16.' };
      const [ipPart, prefixPart] = vpc.trim().split('/');
      const vpcPrefix = Number(prefixPart);
      const subnetPrefixValue = Number(subnetPrefix);
      if (subnetPrefixValue <= vpcPrefix) return { error: 'Subnets must be smaller than the VPC (a higher prefix number).' };
      const subnetSize = Math.pow(2, 32 - subnetPrefixValue);
      const base = toInt(ipPart) & ((0xFFFFFFFF << (32 - vpcPrefix)) >>> 0);
      const totalSubnets = Math.floor(Math.pow(2, 32 - vpcPrefix) / subnetSize);
      const needed = Number(azs) * Number(tiers);
      if (needed > totalSubnets) return { error: `That VPC only fits ${totalSubnets} subnets of /${subnetPrefixValue}.` };
      const rows = [];
      for (let index = 0; index < needed; index += 1) {
        const az = Math.floor(index / Number(tiers)) + 1;
        const tier = (index % Number(tiers)) === 0 ? 'public' : (index % Number(tiers)) === 1 ? 'private' : 'data';
        rows.push({ label: `AZ-${az} ${tier}`, value: `${toIp(base + index * subnetSize)}/${subnetPrefixValue}` });
      }
      return {
        stats: [
          { label: 'Subnets created', value: needed },
          { label: 'Addresses each', value: subnetSize.toLocaleString(), hint: `${subnetSize - 5} usable (AWS reserves 5)` },
          { label: 'Fits in VPC', value: totalSubnets.toLocaleString(), tone: 'text-cyan-300' },
          { label: 'Free space', value: `${totalSubnets - needed} subnets`, tone: 'text-emerald-400' },
        ],
        lines: rows,
        note: 'AWS reserves the first four and the last address of every subnet, so a /24 gives 251 usable addresses, not 254.',
      };
    }}
  >
    <InfoList
      title="Public vs private, in one line each"
      items={[
        'Public subnet: route table has 0.0.0.0/0 → internet gateway. Only put load balancers and bastions here.',
        'Private subnet: no direct internet route; outbound traffic goes through a NAT gateway.',
        'One subnet belongs to one availability zone — spread tiers across AZs for real resilience.',
        'Never overlap the VPC range with your office LAN or VPN, or routing will break silently.',
      ]}
    />
  </FormTool>
);

const CLASSES = [
  { id: 'standard', label: 'Standard', storage: 0.023, retrieval: 0, minimumDays: 0 },
  { id: 'ia', label: 'Infrequent Access', storage: 0.0125, retrieval: 0.01, minimumDays: 30 },
  { id: 'glacier', label: 'Archive (Glacier class)', storage: 0.004, retrieval: 0.02, minimumDays: 90 },
];

export const StorageClassComparator = () => (
  <FormTool
    fields={[
      { key: 'size', label: 'Data size (GB)', type: 'number', default: 500, min: 1 },
      { key: 'reads', label: 'GB retrieved per month', type: 'number', default: 20, min: 0 },
      { key: 'months', label: 'Retention (months)', type: 'number', default: 12, min: 1 },
    ]}
    compute={({ size, reads, months }) => {
      const gb = Number(size) || 0;
      const retrieved = Number(reads) || 0;
      const period = Number(months) || 1;
      const rows = CLASSES.map((item) => {
        const storageCost = gb * item.storage * period;
        const retrievalCost = retrieved * item.retrieval * period;
        return { ...item, total: storageCost + retrievalCost, storageCost, retrievalCost };
      });
      const cheapest = [...rows].sort((a, b) => a.total - b.total)[0];
      return {
        stats: rows.slice(0, 3).map((row) => ({
          label: row.label,
          value: `$${row.total.toFixed(2)}`,
          hint: row === cheapest ? 'Cheapest for this pattern' : `$${row.storage.toFixed(3)}/GB-month`,
          tone: row === cheapest ? 'text-emerald-400' : undefined,
        })),
        lines: rows.map((row) => ({
          label: `${row.label} storage`,
          value: `$${row.storageCost.toFixed(2)} + retrieval $${row.retrievalCost.toFixed(2)}`,
        })),
        note: `Cheapest for ${gb} GB read ${retrieved} GB/month for ${period} months: ${cheapest.label}. Archive tiers also charge an early-deletion fee before ${cheapest.minimumDays} days.`,
      };
    }}
  >
    <InfoList
      title="Choosing a class"
      items={[
        'Standard: anything read more than once a month, plus active websites and uploads.',
        'Infrequent Access: backups read a few times a year; cheaper storage, small retrieval fee.',
        'Archive: compliance and old logs. Retrieval takes minutes to hours and costs the most.',
        'Use lifecycle rules to move objects automatically instead of moving them by hand.',
      ]}
    />
  </FormTool>
);

export const DataTransferCost = () => (
  <FormTool
    fields={[
      { key: 'egress', label: 'Monthly egress (GB)', type: 'number', default: 1000, min: 0 },
      { key: 'rate', label: 'Egress rate ($/GB)', type: 'number', default: 0.09, min: 0, step: 0.001 },
      { key: 'cdnShare', label: 'Share served via CDN (%)', type: 'number', default: 0, min: 0, max: 100 },
      { key: 'cdnRate', label: 'CDN rate ($/GB)', type: 'number', default: 0.085, min: 0, step: 0.001 },
    ]}
    compute={({ egress, rate, cdnShare, cdnRate }) => {
      const total = Number(egress) || 0;
      const direct = total * (1 - Number(cdnShare) / 100) * Number(rate);
      const cdn = total * (Number(cdnShare) / 100) * Number(cdnRate);
      const bill = direct + cdn;
      return {
        stats: [
          { label: 'Monthly egress cost', value: `$${bill.toFixed(2)}`, tone: 'text-emerald-400' },
          { label: 'Yearly', value: `$${(bill * 12).toFixed(2)}` },
          { label: 'Cost per TB', value: `$${total > 0 ? ((bill / total) * 1024).toFixed(2) : '0.00'}`, tone: 'text-cyan-300' },
          { label: 'Free tier check', value: total <= 100 ? 'Within 100 GB free' : 'Above free tier', tone: total <= 100 ? 'text-emerald-400' : 'text-amber-300' },
        ],
        lines: [
          { label: 'Direct egress', value: `$${direct.toFixed(2)}` },
          { label: 'Via CDN', value: `$${cdn.toFixed(2)}` },
          { label: 'Ingress', value: 'Usually free' },
        ],
        note: 'Egress is the line item that surprises students and startups: storing 1 TB is cheap, serving it to users is not. Cache aggressively and compress before you add bandwidth.',
      };
    }}
  />
);

export const K8sResources = () => (
  <FormTool
    fields={[
      { key: 'replicas', label: 'Pod replicas', type: 'number', default: 6, min: 1 },
      { key: 'cpu', label: 'CPU request per pod (millicores)', type: 'number', default: 250, min: 10 },
      { key: 'mem', label: 'Memory request per pod (Mi)', type: 'number', default: 512, min: 16 },
      { key: 'nodeCpu', label: 'Node CPU (cores)', type: 'number', default: 4, min: 1 },
      { key: 'nodeMem', label: 'Node memory (Gi)', type: 'number', default: 16, min: 1 },
      { key: 'reserve', label: 'Node reserved for system (%)', type: 'number', default: 15, min: 0, max: 40 },
    ]}
    compute={({ replicas, cpu, mem, nodeCpu, nodeMem, reserve }) => {
      const pods = Number(replicas) || 1;
      const cpuPer = (Number(cpu) || 0) / 1000;
      const memPer = (Number(mem) || 0) / 1024;
      const usableCpu = Number(nodeCpu) * (1 - Number(reserve) / 100);
      const usableMem = Number(nodeMem) * (1 - Number(reserve) / 100);
      const podsByCpu = Math.floor(usableCpu / Math.max(cpuPer, 0.001));
      const podsByMem = Math.floor(usableMem / Math.max(memPer, 0.001));
      const podsPerNode = Math.max(1, Math.min(podsByCpu, podsByMem));
      const nodes = Math.ceil(pods / podsPerNode);
      return {
        stats: [
          { label: 'Pods per node', value: podsPerNode, tone: 'text-cyan-300' },
          { label: 'Nodes needed', value: nodes, tone: 'text-emerald-400' },
          { label: 'Limited by', value: podsByCpu <= podsByMem ? 'CPU' : 'Memory' },
          { label: 'Total CPU requested', value: `${(cpuPer * pods).toFixed(2)} cores` },
        ],
        lines: [
          { label: 'Usable CPU per node', value: `${usableCpu.toFixed(2)} cores` },
          { label: 'Usable memory per node', value: `${usableMem.toFixed(2)} Gi` },
          { label: 'Total memory requested', value: `${(memPer * pods).toFixed(2)} Gi` },
          { label: 'Spare capacity', value: `${(podsPerNode * nodes) - pods} pod slots` },
        ],
        note: 'Requests are what the scheduler reserves; limits are what the kernel enforces. Setting a memory limit too low causes OOMKills, and no limit lets one pod starve the node.',
      };
    }}
  />
);

const SLA_TIERS = [99, 99.5, 99.9, 99.95, 99.99, 99.999];

export const SlaDowntime = () => (
  <div className="space-y-5">
    <Panel>
      <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">Allowed downtime per SLA</h2>
      <div className="overflow-x-auto rounded-xl border border-slate-800">
        <table className="w-full text-left text-xs">
          <thead className="border-b border-slate-800 bg-navy-950 text-[10px] uppercase tracking-wider text-slate-500">
            <tr>
              <th className="px-3 py-2.5">SLA</th>
              <th className="px-3 py-2.5">Per day</th>
              <th className="px-3 py-2.5">Per month</th>
              <th className="px-3 py-2.5">Per year</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-800/80">
            {SLA_TIERS.map((sla) => {
              const yearMinutes = 365 * 24 * 60 * (1 - sla / 100);
              const monthMinutes = 30 * 24 * 60 * (1 - sla / 100);
              const dayMinutes = 24 * 60 * (1 - sla / 100);
              const human = (minutes) => {
                if (minutes >= 60) return `${(minutes / 60).toFixed(1)} h`;
                if (minutes >= 1) return `${minutes.toFixed(1)} min`;
                return `${(minutes * 60).toFixed(0)} s`;
              };
              return (
                <tr key={sla} className="hover:bg-slate-900/50">
                  <td className="px-3 py-2.5 font-mono font-semibold text-white">{sla}%</td>
                  <td className="px-3 py-2.5 font-mono text-slate-300">{human(dayMinutes)}</td>
                  <td className="px-3 py-2.5 font-mono text-cyan-300">{human(monthMinutes)}</td>
                  <td className="px-3 py-2.5 font-mono text-slate-300">{human(yearMinutes)}</td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>
      <div className="mt-4">
        <Callout tone="info">
          Each extra nine multiplies the engineering work. 99.9% allows about 43 minutes of downtime a month; 99.99% allows only 4.3 minutes.
        </Callout>
      </div>
    </Panel>
  </div>
);
