import React, { useState, useMemo } from 'react';
import { Copy, Check, RefreshCw } from 'lucide-react';

export const HashUtility = () => {
  const [inputVal, setInputVal] = useState('RTechLab-Student-2026');
  const [isDecodeMode, setIsDecodeMode] = useState(false);
  const [copiedKey, setCopiedKey] = useState(null);

  const outputs = useMemo(() => {
    try {
      if (!inputVal) return { base64: '', hex: '', binary: '', url: '', error: null };

      if (isDecodeMode) {
        // Base64 Decode mode with UTF-8 safe handling
        try {
          const raw = atob(inputVal.trim());
          let decoded = raw;
          try {
            decoded = decodeURIComponent(escape(raw));
          } catch {
            // fallback to raw if not encoded UTF-8
          }
          return {
            base64Decoded: decoded,
            error: null
          };
        } catch {
          return { error: 'Invalid Base64 string for decoding.' };
        }
      }

      // Encode mode
      const base64 = btoa(unescape(encodeURIComponent(inputVal)));
      const url = encodeURIComponent(inputVal);

      // Hex string
      let hex = '';
      for (let i = 0; i < inputVal.length; i++) {
        hex += inputVal.charCodeAt(i).toString(16).padStart(2, '0') + ' ';
      }

      // Binary string
      let binary = '';
      for (let i = 0; i < inputVal.length; i++) {
        binary += inputVal.charCodeAt(i).toString(2).padStart(8, '0') + ' ';
      }

      return {
        base64,
        hex: hex.trim(),
        binary: binary.trim(),
        url,
        charCount: inputVal.length,
        byteCount: new Blob([inputVal]).size,
        error: null
      };
    } catch {
      return { error: 'Error processing input string.' };
    }
  }, [inputVal, isDecodeMode]);

  const copyToClipboard = (text, key) => {
    navigator.clipboard.writeText(text);
    setCopiedKey(key);
    setTimeout(() => setCopiedKey(null), 2000);
  };

  return (
    <div className="bg-navy-900 border border-slate-800 rounded-2xl p-6 shadow-2xl">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-6 border-b border-slate-800/80">
        <div>
          <h3 className="text-xl font-bold text-white flex items-center gap-2">
            Base64, Hex & Payload Inspector
            <span className="text-[11px] font-mono px-2 py-0.5 rounded-full bg-emerald-500/10 text-emerald-400 border border-emerald-500/30">
              Security Tool
            </span>
          </h3>
          <p className="text-xs text-slate-400 mt-0.5">
            Convert strings to Base64 (HTTP Basic Auth), Hex, Binary, and URL encoding instantly.
          </p>
        </div>

        {/* Mode Toggle */}
        <button
          onClick={() => {
            setIsDecodeMode(!isDecodeMode);
            setInputVal(isDecodeMode ? 'RTechLab-Student-2026' : (outputs.base64 || ''));
          }}
          className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-navy-950 hover:bg-slate-800 text-slate-300 text-xs border border-slate-800 transition"
        >
          <RefreshCw className="w-3.5 h-3.5 text-cyan-400" />
          <span>Switch to {isDecodeMode ? 'Encode Mode' : 'Base64 Decode Mode'}</span>
        </button>
      </div>

      {/* Input */}
      <div className="mt-6">
        <div className="flex justify-between items-center mb-2">
          <label className="text-xs font-semibold uppercase tracking-wider text-slate-300">
            {isDecodeMode ? 'Base64 Encoded Input' : 'Plain Text String'}
          </label>
          {!isDecodeMode && outputs.charCount !== undefined && (
            <span className="text-[11px] font-mono text-slate-400">
              {outputs.charCount} chars | {outputs.byteCount} bytes
            </span>
          )}
        </div>
        <textarea
          rows={2}
          value={inputVal}
          onChange={(e) => setInputVal(e.target.value)}
          placeholder={isDecodeMode ? 'Paste Base64 encoded payload...' : 'Enter text string to encode...'}
          className="w-full bg-navy-950 border border-slate-700 focus:border-electric-400 rounded-xl px-4 py-2.5 font-mono text-sm text-white outline-none resize-none"
        />
      </div>

      {/* Outputs */}
      {outputs.error ? (
        <div className="mt-4 p-3 bg-red-950/40 border border-red-500/30 rounded-xl text-red-300 text-xs">
          {outputs.error}
        </div>
      ) : isDecodeMode ? (
        <div className="mt-4 p-4 rounded-xl bg-navy-950 border border-slate-800">
          <div className="flex justify-between items-center mb-1">
            <span className="text-xs text-slate-400 uppercase font-semibold">Decoded Plain Text</span>
            <button
              onClick={() => copyToClipboard(outputs.base64Decoded, 'dec')}
              className="text-slate-400 hover:text-white p-1"
            >
              {copiedKey === 'dec' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
            </button>
          </div>
          <pre className="font-mono text-sm text-emerald-400 whitespace-pre-wrap break-all">
            {outputs.base64Decoded || '(empty)'}
          </pre>
        </div>
      ) : (
        <div className="mt-4 space-y-3">
          {/* Base64 */}
          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800">
            <div className="flex justify-between items-center mb-1">
              <span className="text-[11px] text-slate-400 uppercase font-semibold">Base64 (RFC 4648)</span>
              <button
                onClick={() => copyToClipboard(outputs.base64, 'b64')}
                className="text-slate-400 hover:text-white p-1"
              >
                {copiedKey === 'b64' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
              </button>
            </div>
            <div className="font-mono text-xs text-cyan-300 break-all select-all">
              {outputs.base64 || '—'}
            </div>
          </div>

          {/* Hex */}
          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800">
            <div className="flex justify-between items-center mb-1">
              <span className="text-[11px] text-slate-400 uppercase font-semibold">Hexadecimal (Byte Stream)</span>
              <button
                onClick={() => copyToClipboard(outputs.hex, 'hex')}
                className="text-slate-400 hover:text-white p-1"
              >
                {copiedKey === 'hex' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
              </button>
            </div>
            <div className="font-mono text-xs text-purple-300 break-all select-all">
              {outputs.hex || '—'}
            </div>
          </div>

          {/* URL Encoded */}
          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800">
            <div className="flex justify-between items-center mb-1">
              <span className="text-[11px] text-slate-400 uppercase font-semibold">URL Percent-Encoded</span>
              <button
                onClick={() => copyToClipboard(outputs.url, 'url')}
                className="text-slate-400 hover:text-white p-1"
              >
                {copiedKey === 'url' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
              </button>
            </div>
            <div className="font-mono text-xs text-amber-300 break-all select-all">
              {outputs.url || '—'}
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
