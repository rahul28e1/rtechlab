import React from 'react';
import { FormTool, InfoList } from './kit';

export const RamCompatibility = () => (
  <FormTool
    fields={[
      { key: 'generation', label: 'Motherboard memory type', type: 'select', default: 'ddr4', options: [
        { value: 'ddr4', label: 'DDR4' },
        { value: 'ddr5', label: 'DDR5' },
        { value: 'lpddr4', label: 'LPDDR4 (soldered laptops)' },
      ] },
      { key: 'slots', label: 'DIMM slots on board', type: 'number', default: 4, min: 1, max: 8 },
      { key: 'installed', label: 'Sticks installed', type: 'number', default: 2, min: 0, max: 8 },
      { key: 'adding', label: 'Sticks you want to add', type: 'number', default: 2, min: 0, max: 8 },
      { key: 'speed', label: 'Rated speed (MT/s)', type: 'number', default: 3200, min: 1600 },
      { key: 'speed2', label: 'New sticks speed (MT/s)', type: 'number', default: 3200, min: 1600 },
    ]}
    compute={({ generation, slots, installed, adding, speed, speed2 }) => {
      const total = Number(installed) + Number(adding);
      const free = Number(slots) - total;
      const mixedSpeed = Number(speed) !== Number(speed2);
      const minSpeed = Math.min(Number(speed), Number(speed2));
      const dualChannel = total >= 2 && total % 2 === 0;
      return {
        stats: [
          { label: 'Slots used', value: `${total} / ${slots}`, tone: free < 0 ? 'text-red-400' : 'text-cyan-300' },
          { label: 'Free slots', value: free, tone: free < 0 ? 'text-red-400' : 'text-emerald-400' },
          { label: 'Channel mode', value: dualChannel ? 'Dual channel' : 'Single channel', tone: dualChannel ? 'text-emerald-400' : 'text-amber-300' },
          { label: 'Effective speed', value: `${minSpeed} MT/s` },
        ],
        lines: [
          { label: 'Generation check', value: `${generation.toUpperCase()} board needs ${generation.toUpperCase()} DIMMs only` },
          { label: 'Mixed speeds', value: mixedSpeed ? `Yes — all sticks will run at ${minSpeed} MT/s` : 'No — matched speeds' },
          { label: 'Recommended pair layout', value: 'Slots A2 + B2 (2nd and 4th) for dual channel' },
        ],
        note: free < 0
          ? 'You are trying to install more sticks than the board has slots. Remove an existing stick or use larger capacity modules.'
          : dualChannel
            ? 'Even stick counts in matched pairs give dual-channel bandwidth — up to 2× the memory throughput of a single stick.'
            : 'An odd number of sticks drops you to single channel. Add one more matched stick for a real performance gain.',
        noteTone: free < 0 ? 'error' : dualChannel ? 'ok' : 'warn',
      };
    }}
  >
    <InfoList
      title="Before you buy memory"
      items={[
        'DDR4 and DDR5 are physically different — they never fit each other’s slots.',
        'Mixing speeds is allowed, but every stick runs at the slowest speed present.',
        'Mixing capacities works, but matched pairs are what enable dual channel.',
        'Laptop SO-DIMMs are shorter than desktop DIMMs; check which your machine uses.',
      ]}
    />
  </FormTool>
);

const DRIVES = {
  hdd: { label: 'HDD 7200 rpm', iops: 120, mbps: 160 },
  sata: { label: 'SATA SSD', iops: 90000, mbps: 550 },
  nvme: { label: 'NVMe SSD (PCIe 4.0)', iops: 600000, mbps: 5000 },
  sas: { label: 'SAS 15k enterprise', iops: 200, mbps: 210 },
};

export const StorageIops = () => (
  <FormTool
    fields={[
      { key: 'drive', label: 'Drive type', type: 'select', default: 'nvme', options: Object.entries(DRIVES).map(([value, drive]) => ({ value, label: drive.label })) },
      { key: 'count', label: 'Number of drives', type: 'number', default: 4, min: 1, max: 48 },
      { key: 'raid', label: 'RAID level', type: 'select', default: 'raid10', options: [
        { value: 'none', label: 'No RAID (single volume)' },
        { value: 'raid1', label: 'RAID 1 — mirror' },
        { value: 'raid5', label: 'RAID 5 — parity' },
        { value: 'raid6', label: 'RAID 6 — double parity' },
        { value: 'raid10', label: 'RAID 10 — mirrors + stripe' },
      ] },
      { key: 'readPct', label: 'Read share (%)', type: 'number', default: 70, min: 0, max: 100 },
    ]}
    compute={({ drive, count, raid, readPct }) => {
      const spec = DRIVES[drive];
      const n = Number(count) || 1;
      const read = Number(readPct) / 100;
      const write = 1 - read;
      // Read IOPS scale almost linearly; parity writes cost 4 operations on RAID 5 and 6 on RAID 6.
      let readFactor = n;
      let writeFactor = n;
      if (raid === 'raid1') writeFactor = Math.floor(n / 2);
      if (raid === 'raid5') writeFactor = Math.max(1, (n - 1) / 4);
      if (raid === 'raid6') writeFactor = Math.max(1, (n - 2) / 6);
      if (raid === 'raid10') { writeFactor = Math.floor(n / 2); readFactor = n; }
      if (raid === 'none') { readFactor = 1; writeFactor = 1; }
      const iops = spec.iops * (read * readFactor + write * writeFactor);
      const throughput = spec.mbps * (raid === 'raid5' || raid === 'raid6' ? Math.max(1, n - 1) : readFactor);
      return {
        stats: [
          { label: 'Mixed IOPS', value: Math.round(iops).toLocaleString(), tone: 'text-cyan-300' },
          { label: 'Sequential MB/s', value: Math.round(throughput).toLocaleString(), tone: 'text-emerald-400' },
          { label: 'Random read', value: Math.round(spec.iops * readFactor).toLocaleString() },
          { label: 'Random write', value: Math.round(spec.iops * writeFactor).toLocaleString() },
        ],
        lines: [
          { label: 'Single drive IOPS', value: spec.iops.toLocaleString() },
          { label: 'Single drive MB/s', value: spec.mbps.toLocaleString() },
          { label: 'Workload mix', value: `${readPct}% read / ${100 - readPct}% write` },
          { label: 'Usable capacity factor', value: raid === 'raid1' || raid === 'raid10' ? '50%' : raid === 'raid5' ? `${Math.round((n - 1) / n * 100)}%` : raid === 'raid6' ? `${Math.round((n - 2) / n * 100)}%` : '100%' },
        ],
        note: 'Parity RAID punishes random writes: every write becomes read-modify-write. That is why databases prefer RAID 10 and log volumes are separated from data volumes.',
      };
    }}
  />
);

export const UpsRuntime = () => (
  <FormTool
    fields={[
      { key: 'va', label: 'UPS rating (VA)', type: 'number', default: 1000, min: 100 },
      { key: 'load', label: 'Actual load (watts)', type: 'number', default: 300, min: 10 },
      { key: 'batteryAh', label: 'Battery (Ah)', type: 'number', default: 9, min: 1 },
      { key: 'batteryV', label: 'Battery voltage (V)', type: 'number', default: 12, min: 6 },
      { key: 'efficiency', label: 'Inverter efficiency (%)', type: 'number', default: 85, min: 50, max: 99 },
    ]}
    compute={({ va, load, batteryAh, batteryV, efficiency }) => {
      const watts = Number(load) || 0;
      const capacityWh = (Number(batteryAh) || 0) * (Number(batteryV) || 0) * 0.8; // 80% usable depth of discharge
      const usableWh = capacityWh * ((Number(efficiency) || 85) / 100);
      const minutes = watts > 0 ? (usableWh / watts) * 60 * 0.85 : 0; // 0.85 for inverter ageing
      const maxWatts = (Number(va) || 0) * 0.6; // typical 0.6 power factor
      return {
        stats: [
          { label: 'Runtime', value: `${Math.round(minutes)} min`, tone: minutes >= 10 ? 'text-emerald-400' : 'text-amber-300' },
          { label: 'Usable energy', value: `${Math.round(usableWh)} Wh` },
          { label: 'Safe load', value: `${Math.round(maxWatts)} W`, hint: '60% of VA rating' },
          { label: 'Load on UPS', value: `${Math.round((watts / Math.max(maxWatts, 1)) * 100)}%`, tone: watts > maxWatts ? 'text-red-400' : 'text-cyan-300' },
        ],
        lines: [
          { label: 'Battery capacity', value: `${capacityWh.toFixed(0)} Wh at 80% depth` },
          { label: 'Runtime at 50% load', value: `${Math.round(minutes * 2)} min` },
          { label: 'Runtime at 25% load', value: `${Math.round(minutes * 4)} min` },
          { label: 'Shutdown advice', value: minutes < 5 ? 'Enable auto-shutdown' : 'Manual shutdown is enough' },
        ],
        note: watts > maxWatts
          ? 'The load is above what this UPS should carry continuously. Move to the next size up: an overloaded UPS gives seconds of runtime, not minutes.'
          : 'Runtime falls faster than load rises: doubling the load roughly halves the time. Batteries also lose 20–30% capacity after three years.',
        noteTone: watts > maxWatts ? 'error' : 'info',
      };
    }}
  />
);

export const RackPlanner = () => (
  <FormTool
    fields={[
      { key: 'rackU', label: 'Rack size (U)', type: 'number', default: 42, min: 6 },
      { key: 'servers', label: 'Servers', type: 'number', default: 6, min: 0 },
      { key: 'serverU', label: 'U per server', type: 'number', default: 1, min: 1 },
      { key: 'serverWatts', label: 'Watts per server', type: 'number', default: 350, min: 10 },
      { key: 'switches', label: 'Switches', type: 'number', default: 2, min: 0 },
      { key: 'storage', label: 'Storage arrays', type: 'number', default: 1, min: 0 },
    ]}
    compute={({ rackU, servers, serverU, serverWatts, switches, storage }) => {
      const serverCount = Number(servers) || 0;
      const used = serverCount * (Number(serverU) || 1) + (Number(switches) || 0) * 1 + (Number(storage) || 0) * 4;
      const totalU = Number(rackU) || 42;
      const free = totalU - used;
      const watts = serverCount * (Number(serverWatts) || 0) + (Number(switches) || 0) * 60 + (Number(storage) || 0) * 400;
      return {
        stats: [
          { label: 'Rack used', value: `${used} U / ${totalU} U`, tone: free < 0 ? 'text-red-400' : 'text-cyan-300' },
          { label: 'Free space', value: `${free} U`, tone: free < 0 ? 'text-red-400' : 'text-emerald-400' },
          { label: 'Power draw', value: `${watts.toLocaleString()} W` },
          { label: 'Heat load', value: `${Math.round(watts * 3.412).toLocaleString()} BTU/h`, hint: 'Watts × 3.412' },
        ],
        lines: [
          { label: 'Circuit at 230 V', value: `${(watts / 230).toFixed(1)} A` },
          { label: 'Recommended circuit', value: `${Math.ceil((watts / 230) / 16) * 16} A breaker` },
          { label: 'Cooling needed', value: `${(watts / 1000).toFixed(2)} kW` },
          { label: 'Typical 42U cabinet', value: '6–8 kW limit without special cooling' },
        ],
        note: free < 0
          ? 'The layout does not fit. Reduce server count, use 2U consolidation, or add a second cabinet.'
          : 'Keep at least 4U free for cable management and airflow. Never fill a rack completely — hot air has to escape somewhere.',
        noteTone: free < 0 ? 'error' : 'info',
      };
    }}
  />
);
