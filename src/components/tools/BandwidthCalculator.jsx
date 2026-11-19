import React, { useState, useMemo } from 'react';
import { Clock } from 'lucide-react';

export const BandwidthCalculator = () => {
  const [fileSize, setFileSize] = useState(10);
  const [sizeUnit, setSizeUnit] = useState('GB'); // MB, GB, TB
  const [speedVal, setSpeedVal] = useState(100);
  const [speedUnit, setSpeedUnit] = useState('Mbps'); // Kbps, Mbps, Gbps
  const [includeOverhead, setIncludeOverhead] = useState(true); // ~8% TCP/IP packet overhead

  const result = useMemo(() => {
    const sizeNumber = Number(fileSize);
    const speedNumber = Number(speedVal);

    if (isNaN(sizeNumber) || sizeNumber <= 0 || isNaN(speedNumber) || speedNumber <= 0) {
      return null;
    }

    // Convert file size to Bytes
    let bytes = sizeNumber;
    if (sizeUnit === 'MB') bytes *= 1024 * 1024;
    else if (sizeUnit === 'GB') bytes *= 1024 * 1024 * 1024;
    else if (sizeUnit === 'TB') bytes *= 1024 * 1024 * 1024 * 1024;

    // Convert bytes to bits
    let totalBits = bytes * 8;
    if (includeOverhead) {
      totalBits *= 1.08; // 8% framing and TCP ACK overhead
    }

    // Convert speed to bps
    let bps = speedNumber;
    if (speedUnit === 'Kbps') bps *= 1000;
    else if (speedUnit === 'Mbps') bps *= 1000 * 1000;
    else if (speedUnit === 'Gbps') bps *= 1000 * 1000 * 1000;

    const totalSeconds = totalBits / bps;

    const days = Math.floor(totalSeconds / 86400);
    const hours = Math.floor((totalSeconds % 86400) / 3600);
    const minutes = Math.floor((totalSeconds % 3600) / 60);
    const seconds = Math.floor(totalSeconds % 60);
    const ms = Math.floor((totalSeconds % 1) * 1000);

    return {
      totalSeconds,
      formattedTime: days > 0
        ? `${days}d ${hours}h ${minutes}m ${seconds}s`
        : hours > 0
        ? `${hours}h ${minutes}m ${seconds}s`
        : minutes > 0
        ? `${minutes}m ${seconds}s`
        : `${seconds}.${String(ms).padStart(3, '0')}s`,
      transferRateBytes: (bps / 8) / (1024 * 1024) // in MB/s
    };
  }, [fileSize, sizeUnit, speedVal, speedUnit, includeOverhead]);

  const setSpeedPreset = (val, unit) => {
    setSpeedVal(val);
    setSpeedUnit(unit);
  };

  return (
    <div className="bg-navy-900 border border-slate-800 rounded-2xl p-6 shadow-2xl">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-6 border-b border-slate-800/80">
        <div>
          <h3 className="text-xl font-bold text-white flex items-center gap-2">
            Network Bandwidth & Transfer Time Estimator
            <span className="text-[11px] font-mono px-2 py-0.5 rounded-full bg-cyan-500/10 text-cyan-400 border border-cyan-500/30">
              Throughput Model
            </span>
          </h3>
          <p className="text-xs text-slate-400 mt-0.5">
            Accurately predicts data transmission duration across WAN, LAN, and Cloud interconnects.
          </p>
        </div>

        {/* Speed Presets */}
        <div className="flex flex-wrap items-center gap-1.5 text-xs">
          <span className="text-slate-500 text-[11px] mr-1">Speeds:</span>
          <button
            onClick={() => setSpeedPreset(50, 'Mbps')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
          >
            4G (50M)
          </button>
          <button
            onClick={() => setSpeedPreset(100, 'Mbps')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
          >
            FastEth (100M)
          </button>
          <button
            onClick={() => setSpeedPreset(1, 'Gbps')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
          >
            Gigabit (1G)
          </button>
          <button
            onClick={() => setSpeedPreset(10, 'Gbps')}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 transition"
          >
            10G DC
          </button>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
        {/* File Size Input */}
        <div>
          <label className="block text-xs font-semibold uppercase tracking-wider text-slate-300 mb-2">
            File / Backup Payload Size
          </label>
          <div className="flex gap-2">
            <input
              type="number"
              min="0.1"
              step="any"
              value={fileSize}
              onChange={(e) => setFileSize(e.target.value)}
              className="flex-1 bg-navy-950 border border-slate-700 focus:border-electric-400 rounded-xl px-4 py-2.5 font-mono text-white outline-none"
            />
            <select
              value={sizeUnit}
              onChange={(e) => setSizeUnit(e.target.value)}
              className="bg-navy-950 border border-slate-700 focus:border-electric-400 rounded-xl px-3 py-2.5 font-mono text-cyan-300 outline-none"
            >
              <option value="MB">MB</option>
              <option value="GB">GB</option>
              <option value="TB">TB</option>
            </select>
          </div>
        </div>

        {/* Link Speed Input */}
        <div>
          <label className="block text-xs font-semibold uppercase tracking-wider text-slate-300 mb-2">
            Network Throughput Bandwidth
          </label>
          <div className="flex gap-2">
            <input
              type="number"
              min="0.1"
              step="any"
              value={speedVal}
              onChange={(e) => setSpeedVal(e.target.value)}
              className="flex-1 bg-navy-950 border border-slate-700 focus:border-electric-400 rounded-xl px-4 py-2.5 font-mono text-white outline-none"
            />
            <select
              value={speedUnit}
              onChange={(e) => setSpeedUnit(e.target.value)}
              className="bg-navy-950 border border-slate-700 focus:border-electric-400 rounded-xl px-3 py-2.5 font-mono text-cyan-300 outline-none"
            >
              <option value="Kbps">Kbps</option>
              <option value="Mbps">Mbps</option>
              <option value="Gbps">Gbps</option>
            </select>
          </div>
        </div>
      </div>

      {/* Checkbox for Overhead */}
      <div className="mt-4 flex items-center justify-between text-xs text-slate-400 border-t border-slate-800/60 pt-4">
        <label className="flex items-center gap-2 cursor-pointer select-none">
          <input
            type="checkbox"
            checked={includeOverhead}
            onChange={(e) => setIncludeOverhead(e.target.checked)}
            className="rounded accent-electric-500 w-4 h-4 cursor-pointer"
          />
          <span>Include ~8% TCP/IP Protocol Framing & ACK Overhead (Enterprise Realism)</span>
        </label>
        <span className="text-slate-500 font-mono hidden sm:inline">
          Theoretical Max: ~{(result ? result.transferRateBytes.toFixed(2) : 0)} MB/s
        </span>
      </div>

      {/* Output Metric Banner */}
      {result && (
        <div className="mt-6 p-5 rounded-2xl bg-gradient-to-r from-blue-950/60 via-navy-950 to-cyan-950/40 border border-electric-500/30 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
          <div className="flex items-center gap-4">
            <div className="w-12 h-12 rounded-xl bg-electric-500/20 border border-electric-400/40 flex items-center justify-center text-cyan-300">
              <Clock className="w-6 h-6" />
            </div>
            <div>
              <span className="text-xs text-slate-400 block uppercase tracking-wider">Estimated Transfer Time</span>
              <span className="text-2xl sm:text-3xl font-extrabold text-white font-mono tracking-tight">
                {result.formattedTime}
              </span>
            </div>
          </div>

          <div className="text-left sm:text-right font-mono text-xs text-slate-300 space-y-1">
            <div>Total Seconds: <span className="text-cyan-400 font-bold">{Math.round(result.totalSeconds).toLocaleString()} s</span></div>
            <div>Effective Throughput: <span className="text-emerald-400 font-bold">{result.transferRateBytes.toFixed(2)} MB/s</span></div>
          </div>
        </div>
      )}
    </div>
  );
};
