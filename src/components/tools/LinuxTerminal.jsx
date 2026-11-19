import React, { useState, useRef, useEffect } from 'react';
import { Terminal, CornerDownLeft, Trash2, Play } from 'lucide-react';
import { sampleTerminalCommands } from '../../data/tools';

export const LinuxTerminal = () => {
  const [history, setHistory] = useState([
    {
      command: 'uname -a',
      output: sampleTerminalCommands['uname -a']
    },
    {
      command: 'ip a',
      output: sampleTerminalCommands['ip a']
    }
  ]);
  const [inputVal, setInputVal] = useState('');
  const [isRunning, setIsRunning] = useState(false);
  const bottomRef = useRef(null);
  const inputRef = useRef(null);

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [history]);

  const executeCommand = (cmdToRun) => {
    const rawCmd = (cmdToRun !== undefined ? cmdToRun : inputVal).trim();
    if (!rawCmd) return;

    if (rawCmd.toLowerCase() === 'clear') {
      setHistory([]);
      setInputVal('');
      return;
    }

    setIsRunning(true);
    setInputVal('');

    const lower = rawCmd.toLowerCase();

    // Check custom commands or simulated dynamic outputs
    setTimeout(() => {
      let outputText = '';

      if (sampleTerminalCommands[lower]) {
        outputText = sampleTerminalCommands[lower];
      } else if (lower.startsWith('ping')) {
        const host = rawCmd.split(' ')[1] || '8.8.8.8';
        outputText = `PING ${host} (${host}) 56(84) bytes of data.
64 bytes from ${host}: icmp_seq=1 ttl=118 time=14.2 ms
64 bytes from ${host}: icmp_seq=2 ttl=118 time=13.8 ms
64 bytes from ${host}: icmp_seq=3 ttl=118 time=14.5 ms
64 bytes from ${host}: icmp_seq=4 ttl=118 time=13.9 ms

--- ${host} ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3004ms
rtt min/avg/max/mdev = 13.821/14.103/14.512/0.264 ms`;
      } else if (lower.startsWith('traceroute')) {
        const host = rawCmd.split(' ')[1] || 'rtechlab.com';
        outputText = `traceroute to ${host} (104.21.56.88), 30 hops max, 60 byte packets
 1  gateway.rtechlab.local (192.168.10.1)  0.421 ms  0.380 ms  0.355 ms
 2  10.250.0.1 (10.250.0.1)  4.120 ms  4.095 ms  4.081 ms
 3  182.79.140.21 (airtel-backbone.in)  11.230 ms  11.198 ms  11.170 ms
 4  cloudflare.rtechlab.com (104.21.56.88)  13.412 ms  13.380 ms  13.355 ms`;
      } else if (lower === 'whoami') {
        outputText = 'student';
      } else if (lower === 'date') {
        outputText = new Date().toUTCString();
      } else if (lower.startsWith('chmod')) {
        outputText = `[✓] Applied file mode permissions: ${rawCmd}`;
      } else {
        outputText = `bash: ${rawCmd.split(' ')[0]}: command not found. Type 'help' to see available sandbox commands.`;
      }

      setHistory((prev) => [...prev, { command: rawCmd, output: outputText }]);
      setIsRunning(false);
      inputRef.current?.focus();
    }, 150);
  };

  const handleKeyDown = (e) => {
    if (e.key === 'Enter') {
      executeCommand();
    }
  };

  return (
    <div className="bg-[#050914] border border-slate-800 rounded-2xl overflow-hidden shadow-2xl flex flex-col font-mono text-xs">
      {/* Top Bar with window dots */}
      <div className="bg-[#0B1120] px-4 py-2.5 border-b border-slate-800/80 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <div className="w-2.5 h-2.5 rounded-full bg-red-500/80" />
          <div className="w-2.5 h-2.5 rounded-full bg-yellow-500/80" />
          <div className="w-2.5 h-2.5 rounded-full bg-green-500/80" />
          <span className="text-slate-300 font-sans text-xs font-medium ml-1.5 flex items-center gap-1.5">
            <Terminal className="w-3.5 h-3.5 text-cyan-400" />
            Linux Terminal Simulator (Ubuntu 24.04 CLI Sandbox)
          </span>
        </div>

        <div className="flex items-center gap-3">
          <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-blue-950/80 text-blue-300 border border-blue-800/50 hidden sm:inline">
            Client-Side Sandbox
          </span>
          <button
            onClick={() => setHistory([])}
            className="text-slate-400 hover:text-white transition flex items-center gap-1 font-sans text-xs"
            title="Clear screen"
          >
            <Trash2 className="w-3.5 h-3.5" />
            Clear
          </button>
        </div>
      </div>

      {/* Suggested Quick Commands */}
      <div className="bg-[#080E1C] px-4 py-2 border-b border-slate-800/50 flex flex-wrap items-center gap-2">
        <span className="text-[11px] text-slate-500 font-sans flex items-center gap-1">
          <Play className="w-3 h-3 text-electric-400" /> Quick test:
        </span>
        {['ip a', 'ifconfig', 'ping 8.8.8.8', 'traceroute rtechlab.com', 'cat /etc/os-release', 'ls -la', 'netstat', 'help'].map((cmd) => (
          <button
            key={cmd}
            onClick={() => executeCommand(cmd)}
            className="px-2 py-0.5 rounded bg-slate-900 hover:bg-slate-800 text-cyan-300 hover:text-white border border-slate-700/60 transition text-[11px]"
          >
            {cmd}
          </button>
        ))}
      </div>

      {/* Terminal Screen Body */}
      <div
        className="p-4 h-[340px] overflow-y-auto space-y-3 cursor-text selection:bg-electric-600 selection:text-white"
        onClick={() => inputRef.current?.focus()}
      >
        <div className="text-slate-500 pb-2 border-b border-slate-800/40">
          Welcome to the RTechLab Interactive Linux Terminal Simulator. Type <span className="text-cyan-400 font-bold">help</span> to view commands.
        </div>

        {history.map((item, idx) => (
          <div key={idx} className="space-y-1">
            <div className="flex items-center gap-2 text-slate-300">
              <span className="text-emerald-400 font-semibold">student@rtechlab</span>
              <span className="text-slate-600">:</span>
              <span className="text-cyan-400">~</span>
              <span className="text-slate-400">$</span>
              <span className="text-white font-medium">{item.command}</span>
            </div>
            {item.output && (
              <pre className="text-slate-300 pl-4 whitespace-pre-wrap leading-relaxed text-[11px]">
                {item.output}
              </pre>
            )}
          </div>
        ))}

        {/* Active prompt row */}
        <div className="flex items-center gap-2 text-slate-300 pt-1">
          <span className="text-emerald-400 font-semibold">student@rtechlab</span>
          <span className="text-slate-600">:</span>
          <span className="text-cyan-400">~</span>
          <span className="text-slate-400">$</span>
          <input
            ref={inputRef}
            type="text"
            value={inputVal}
            onChange={(e) => setInputVal(e.target.value)}
            onKeyDown={handleKeyDown}
            disabled={isRunning}
            placeholder={isRunning ? 'Executing...' : 'Type command here...'}
            className="flex-1 bg-transparent text-white outline-none border-none font-mono text-xs focus:ring-0 p-0"
            autoFocus
          />
          <button
            onClick={() => executeCommand()}
            disabled={isRunning || !inputVal.trim()}
            className="text-slate-500 hover:text-cyan-400 transition"
          >
            <CornerDownLeft className="w-3.5 h-3.5" />
          </button>
        </div>

        <div ref={bottomRef} />
      </div>

      {/* Simulator Disclaimer Footer */}
      <div className="bg-[#080E1C] px-4 py-2 border-t border-slate-800/80 flex items-center justify-between text-[11px] text-slate-500 font-sans">
        <span>Safe browser simulation (Not connected to remote production server)</span>
        <span className="text-slate-400 font-mono">Simulated VT100</span>
      </div>
    </div>
  );
};
