import React, { useState, useMemo } from 'react';
import {
  Binary,
  Copy,
  Check,
  RotateCcw,
  Sparkles,
  ArrowLeftRight,
  BookOpen,
  Info,
  ShieldCheck,
  Cpu
} from 'lucide-react';
import { useLanguage } from '../../context/LanguageContext';

export const BinaryConverter = ({ isStandalone = false }) => {
  const { language } = useLanguage();

  // Active input base: 'decimal' | 'binary' | 'hex'
  const [activeBase, setActiveBase] = useState('decimal');
  const [inputValue, setInputValue] = useState('255');
  const [paddingBits, setPaddingBits] = useState('8'); // 'none' | '8' | '16' | '32'
  const [grouping, setGrouping] = useState('4'); // 'none' | '4' | '8'
  const [copiedKey, setCopiedKey] = useState(null);

  // Conversion presets
  const presets = [
    { label: '255 (Byte 0xFF)', base: 'decimal', val: '255' },
    { label: '1024 (1 KiB)', base: 'decimal', val: '1024' },
    { label: '65535 (Max Port / Word)', base: 'decimal', val: '65535' },
    { label: '4294967295 (Max 32-bit)', base: 'decimal', val: '4294967295' },
    { label: '0xDEADBEEF', base: 'hex', val: 'DEADBEEF' },
    { label: '10101010 (Alternating)', base: 'binary', val: '10101010' },
    { label: '-42 (Signed Negative)', base: 'decimal', val: '-42' },
    { label: '9007199254740991 (MAX_SAFE)', base: 'decimal', val: '9007199254740991' }
  ];

  // Helper copy function
  const copyToClipboard = (text, key) => {
    navigator.clipboard.writeText(text);
    setCopiedKey(key);
    setTimeout(() => setCopiedKey(null), 2000);
  };

  // Parsing and conversion calculation using BigInt to eliminate floating point errors
  const calculation = useMemo(() => {
    const raw = inputValue.trim();
    if (!raw) {
      return {
        error: language === 'hi' ? 'कृपया कोई मान दर्ज करें।' : 'Please enter a value to convert.'
      };
    }

    let bigVal = 0n;
    let isNegative = false;

    try {
      if (activeBase === 'decimal') {
        if (!/^-?[0-9]+$/.test(raw)) {
          return {
            error: language === 'hi'
              ? 'अमान्य दशमलव मान: केवल 0-9 अंक और ऋणात्मक चिह्न (-) मान्य हैं।'
              : 'Invalid decimal number: Only digits 0-9 and an optional leading minus sign (-) are allowed.'
          };
        }
        if (raw.startsWith('-')) {
          isNegative = true;
          bigVal = BigInt(raw.slice(1));
        } else {
          bigVal = BigInt(raw);
        }
      } else if (activeBase === 'binary') {
        const cleanBin = raw.replace(/\s+/g, '').replace(/^0b/i, '');
        if (!/^[01]+$/.test(cleanBin)) {
          return {
            error: language === 'hi'
              ? 'अमान्य बाइनरी मान: केवल 0 और 1 अंक मान्य हैं।'
              : 'Invalid binary number: Only 0 and 1 digits are allowed.'
          };
        }
        bigVal = BigInt('0b' + cleanBin);
      } else if (activeBase === 'hex') {
        const cleanHex = raw.replace(/\s+/g, '').replace(/^0x/i, '');
        if (!/^[0-9a-fA-F]+$/.test(cleanHex)) {
          return {
            error: language === 'hi'
              ? 'अमान्य हेक्साडेसिमल मान: केवल 0-9 और A-F अक्षर मान्य हैं।'
              : 'Invalid hexadecimal number: Only digits 0-9 and letters A-F are allowed.'
          };
        }
        bigVal = BigInt('0x' + cleanHex);
      }
    } catch {
      return {
        error: language === 'hi' ? 'मान को पार्स करने में त्रुटि।' : 'Could not parse input integer.'
      };
    }

    // Calculations for positive and negative integers
    const decStr = isNegative ? `-${bigVal.toString(10)}` : bigVal.toString(10);
    const rawBin = bigVal.toString(2);
    const rawHex = bigVal.toString(16).toUpperCase();
    const rawOct = bigVal.toString(8);

    // Padding binary
    let paddedBin = rawBin;
    if (paddingBits !== 'none') {
      const targetLen = parseInt(paddingBits, 10);
      if (rawBin.length < targetLen) {
        paddedBin = rawBin.padStart(targetLen, '0');
      }
    }

    // Grouping binary
    let formattedBin = paddedBin;
    if (grouping === '4') {
      // Group every 4 bits from right to left
      const rem = paddedBin.length % 4;
      const firstPart = rem > 0 ? paddedBin.slice(0, rem) + ' ' : '';
      const rest = paddedBin.slice(rem).match(/.{1,4}/g)?.join(' ') || '';
      formattedBin = (firstPart + rest).trim();
    } else if (grouping === '8') {
      const rem = paddedBin.length % 8;
      const firstPart = rem > 0 ? paddedBin.slice(0, rem) + ' ' : '';
      const rest = paddedBin.slice(rem).match(/.{1,8}/g)?.join(' ') || '';
      formattedBin = (firstPart + rest).trim();
    }

    // Padded hex
    let paddedHex = rawHex;
    if (paddingBits === '8' && rawHex.length < 2) paddedHex = rawHex.padStart(2, '0');
    if (paddingBits === '16' && rawHex.length < 4) paddedHex = rawHex.padStart(4, '0');
    if (paddingBits === '32' && rawHex.length < 8) paddedHex = rawHex.padStart(8, '0');

    // Two's Complement for Fixed Word Sizes (8, 16, 32 bits)
    const computeTwosComp = (bits) => {
      const mask = (1n << BigInt(bits)) - 1n;
      const maxUnsigned = mask;
      const minSigned = -(1n << BigInt(bits - 1));
      const maxSigned = (1n << BigInt(bits - 1)) - 1n;

      if (isNegative) {
        if (bigVal > (1n << BigInt(bits - 1))) {
          return { inRange: false, msg: `Underflow: exceeds -${1n << BigInt(bits - 1)} limit` };
        }
        // Two's complement of -x is (2^bits - x)
        const complement = (1n << BigInt(bits)) - bigVal;
        const bin = complement.toString(2).padStart(bits, '0');
        const hex = complement.toString(16).toUpperCase().padStart(bits / 4, '0');
        return {
          inRange: true,
          unsignedVal: complement.toString(10),
          signedVal: `-${bigVal.toString(10)}`,
          bin,
          hex,
          minSigned: minSigned.toString(10),
          maxSigned: maxSigned.toString(10)
        };
      } else {
        if (bigVal > maxUnsigned) {
          return { inRange: false, msg: `Overflow: exceeds ${maxUnsigned.toString(10)} limit` };
        }
        const bin = bigVal.toString(2).padStart(bits, '0');
        const hex = bigVal.toString(16).toUpperCase().padStart(bits / 4, '0');
        const isSignedNegative = (bigVal & (1n << BigInt(bits - 1))) !== 0n;
        const signedVal = isSignedNegative
          ? (bigVal - (1n << BigInt(bits))).toString(10)
          : bigVal.toString(10);

        return {
          inRange: true,
          unsignedVal: bigVal.toString(10),
          signedVal,
          bin,
          hex,
          minSigned: minSigned.toString(10),
          maxSigned: maxSigned.toString(10)
        };
      }
    };

    const word8 = computeTwosComp(8);
    const word16 = computeTwosComp(16);
    const word32 = computeTwosComp(32);

    // ASCII byte character preview if within 32-126 range
    let asciiChar = null;
    if (!isNegative && bigVal >= 32n && bigVal <= 126n) {
      asciiChar = String.fromCharCode(Number(bigVal));
    } else if (!isNegative && (bigVal === 9n || bigVal === 10n || bigVal === 13n)) {
      asciiChar = bigVal === 9n ? '\\t (Tab)' : bigVal === 10n ? '\\n (Newline)' : '\\r (Carriage Return)';
    }

    // Mathematical Steps Generation
    let steps = [];
    if (activeBase === 'binary') {
      // Binary to Decimal step-by-step
      const bitsArr = rawBin.split('');
      const terms = [];
      let total = 0n;
      const len = bitsArr.length;
      bitsArr.forEach((bit, idx) => {
        const power = BigInt(len - 1 - idx);
        const weight = 1n << power;
        if (bit === '1') {
          total += weight;
          terms.push({ bit, power: power.toString(), weight: weight.toString(), active: true });
        } else {
          terms.push({ bit, power: power.toString(), weight: weight.toString(), active: false });
        }
      });
      steps = {
        type: 'bin-to-dec',
        terms,
        formula: terms.filter(t => t.active).map(t => `${t.weight}`).join(' + ') + ` = ${total.toString(10)}`
      };
    } else if (activeBase === 'decimal' && !isNegative) {
      // Decimal to Binary (Successive division by 2)
      const divisions = [];
      let curr = bigVal;
      let count = 0;
      while (curr > 0n && count < 24) {
        const quotient = curr / 2n;
        const remainder = curr % 2n;
        divisions.push({
          dividend: curr.toString(10),
          quotient: quotient.toString(10),
          remainder: remainder.toString()
        });
        curr = quotient;
        count++;
      }
      steps = {
        type: 'dec-to-bin',
        divisions,
        truncated: curr > 0n
      };
    } else if (activeBase === 'hex') {
      // Hex to Decimal step-by-step
      const hexChars = rawHex.split('');
      const terms = [];
      let total = 0n;
      const len = hexChars.length;
      hexChars.forEach((char, idx) => {
        const power = BigInt(len - 1 - idx);
        const digitVal = BigInt(parseInt(char, 16));
        const weight = 16n ** power;
        const subtotal = digitVal * weight;
        total += subtotal;
        terms.push({
          char,
          digitVal: digitVal.toString(10),
          power: power.toString(),
          weight: weight.toString(10),
          subtotal: subtotal.toString(10)
        });
      });
      steps = {
        type: 'hex-to-dec',
        terms,
        formula: terms.map(t => `${t.digitVal}×(16^${t.power})`).join(' + ') + ` = ${total.toString(10)}`
      };
    }

    return {
      decStr,
      rawBin,
      rawHex,
      rawOct,
      formattedBin,
      paddedHex,
      isNegative,
      word8,
      word16,
      word32,
      asciiChar,
      steps,
      bitCount: rawBin.length,
      error: null
    };
  }, [inputValue, activeBase, paddingBits, grouping, language]);

  // Handle Bitboard Interactive Toggle (8-bit or 16-bit)
  const handleToggleBit = (bitIndex) => {
    // bitIndex 0 is LSB (1), 7 is MSB (128)
    try {
      const currentVal = calculation.error ? 0n : BigInt(calculation.decStr);
      const mask = 1n << BigInt(bitIndex);
      const newVal = currentVal ^ mask;
      if (activeBase === 'decimal') setInputValue(newVal.toString(10));
      else if (activeBase === 'binary') setInputValue(newVal.toString(2));
      else if (activeBase === 'hex') setInputValue(newVal.toString(16).toUpperCase());
    } catch {
      // ignore
    }
  };

  const handleCopyReport = () => {
    if (calculation.error) return;
    const report = `RTechLab Number System Conversion Report
Decimal:      ${calculation.decStr}
Binary:       ${calculation.formattedBin} (${calculation.bitCount} bits)
Hexadecimal:  0x${calculation.paddedHex}
Octal:        0o${calculation.rawOct}
${calculation.asciiChar ? `ASCII:        '${calculation.asciiChar}'\n` : ''}
Fixed-Width Word Values:
• 8-Bit Byte:   Unsigned: ${calculation.word8.inRange ? calculation.word8.unsignedVal : 'N/A'}, Signed (Two's Comp): ${calculation.word8.inRange ? calculation.word8.signedVal : 'N/A'} (0x${calculation.word8.inRange ? calculation.word8.hex : 'N/A'})
• 16-Bit Word:  Unsigned: ${calculation.word16.inRange ? calculation.word16.unsignedVal : 'N/A'}, Signed: ${calculation.word16.inRange ? calculation.word16.signedVal : 'N/A'} (0x${calculation.word16.inRange ? calculation.word16.hex : 'N/A'})
• 32-Bit DWord: Unsigned: ${calculation.word32.inRange ? calculation.word32.unsignedVal : 'N/A'}, Signed: ${calculation.word32.inRange ? calculation.word32.signedVal : 'N/A'} (0x${calculation.word32.inRange ? calculation.word32.hex : 'N/A'})
`;
    copyToClipboard(report, 'full-report');
  };

  const handleReset = () => {
    setActiveBase('decimal');
    setInputValue('255');
    setPaddingBits('8');
    setGrouping('4');
  };

  return (
    <div className={`bg-navy-900 border border-slate-800 rounded-2xl ${isStandalone ? 'p-6 sm:p-8' : 'p-6'} shadow-2xl space-y-6`}>
      {/* Top Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-5 border-b border-slate-800">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-xl bg-electric-500/10 border border-electric-500/30 flex items-center justify-center text-electric-400 flex-shrink-0">
            <Binary className="w-5 h-5" />
          </div>
          <div>
            <h3 className="text-xl font-bold text-white flex items-center gap-2">
              Number System Converter
              <span className="text-[11px] font-mono px-2 py-0.5 rounded-full bg-cyan-500/10 text-cyan-400 border border-cyan-500/30">
                Arbitrary Precision (BigInt)
              </span>
            </h3>
            <p className="text-xs text-slate-400">
              Bidirectional conversion between Binary (Base 2), Decimal (Base 10), and Hexadecimal (Base 16) with Two's Complement.
            </p>
          </div>
        </div>

        {/* Global Action Controls */}
        <div className="flex items-center gap-2">
          <button
            onClick={handleReset}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-navy-950 hover:bg-slate-800 text-slate-300 hover:text-white border border-slate-700/80 text-xs transition"
            title="Reset to default (255)"
          >
            <RotateCcw className="w-3.5 h-3.5" />
            <span>Reset</span>
          </button>

          {!calculation.error && (
            <button
              onClick={handleCopyReport}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-electric-600 hover:bg-electric-500 text-white font-semibold text-xs transition shadow-sm"
              title="Copy formatted conversion report"
            >
              {copiedKey === 'full-report' ? (
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

      {/* Preset Quick-Buttons */}
      <div className="flex flex-wrap items-center gap-1.5 text-xs">
        <span className="text-slate-500 text-[11px] mr-1 flex items-center gap-1">
          <Sparkles className="w-3 h-3 text-cyan-400" /> Presets:
        </span>
        {presets.map((p, idx) => (
          <button
            key={idx}
            onClick={() => {
              setActiveBase(p.base);
              setInputValue(p.val);
            }}
            className="px-2.5 py-1 rounded-md bg-navy-950 hover:bg-slate-800 text-slate-300 border border-slate-800 hover:border-slate-700 transition"
          >
            {p.label}
          </button>
        ))}
      </div>

      {/* Primary Input Controls */}
      <div className="space-y-3">
        {/* Base Selector Tabs */}
        <div className="flex items-center gap-2">
          <span className="text-xs font-semibold uppercase tracking-wider text-slate-400 mr-1">
            Input Number System:
          </span>
          <div className="inline-flex rounded-xl bg-navy-950 p-1 border border-slate-800">
            <button
              onClick={() => setActiveBase('decimal')}
              className={`px-3 py-1 rounded-lg text-xs font-semibold transition ${
                activeBase === 'decimal'
                  ? 'bg-electric-600 text-white shadow-sm'
                  : 'text-slate-400 hover:text-white'
              }`}
            >
              Decimal (Base 10)
            </button>
            <button
              onClick={() => setActiveBase('binary')}
              className={`px-3 py-1 rounded-lg text-xs font-semibold transition ${
                activeBase === 'binary'
                  ? 'bg-electric-600 text-white shadow-sm'
                  : 'text-slate-400 hover:text-white'
              }`}
            >
              Binary (Base 2)
            </button>
            <button
              onClick={() => setActiveBase('hex')}
              className={`px-3 py-1 rounded-lg text-xs font-semibold transition ${
                activeBase === 'hex'
                  ? 'bg-electric-600 text-white shadow-sm'
                  : 'text-slate-400 hover:text-white'
              }`}
            >
              Hexadecimal (Base 16)
            </button>
          </div>
        </div>

        {/* Input Field with Base Indicator */}
        <div className="relative">
          <div className="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none text-slate-500 font-mono text-sm">
            {activeBase === 'decimal' ? 'DEC:' : activeBase === 'binary' ? 'BIN:' : 'HEX: 0x'}
          </div>
          <input
            type="text"
            value={inputValue}
            onChange={(e) => setInputValue(e.target.value)}
            placeholder={
              activeBase === 'decimal'
                ? 'Enter decimal integer (e.g. 255 or -42)'
                : activeBase === 'binary'
                ? 'Enter binary digits (e.g. 11111111 or 1010)'
                : 'Enter hex digits (e.g. FF or DEADBEEF)'
            }
            className="w-full bg-navy-950 border border-slate-700 focus:border-electric-400 focus:ring-1 focus:ring-electric-400 rounded-xl pl-20 pr-4 py-3 font-mono text-base text-white outline-none transition"
          />
        </div>

        {/* Format & Display Customizations */}
        <div className="flex flex-wrap items-center justify-between gap-3 text-xs pt-1">
          <div className="flex items-center gap-3">
            <div className="flex items-center gap-1.5">
              <span className="text-slate-400">Pad Binary:</span>
              <select
                value={paddingBits}
                onChange={(e) => setPaddingBits(e.target.value)}
                className="bg-navy-950 text-slate-300 border border-slate-700 rounded-lg px-2 py-1 outline-none text-xs"
              >
                <option value="none">Raw (No Pad)</option>
                <option value="8">8-Bit (Byte)</option>
                <option value="16">16-Bit (Word)</option>
                <option value="32">32-Bit (DWord)</option>
              </select>
            </div>

            <div className="flex items-center gap-1.5">
              <span className="text-slate-400">Grouping:</span>
              <select
                value={grouping}
                onChange={(e) => setGrouping(e.target.value)}
                className="bg-navy-950 text-slate-300 border border-slate-700 rounded-lg px-2 py-1 outline-none text-xs"
              >
                <option value="none">None</option>
                <option value="4">4-Bit Nibbles (0000 0000)</option>
                <option value="8">8-Bit Bytes</option>
              </select>
            </div>
          </div>

          {!calculation.error && (
            <div className="text-slate-400 font-mono text-[11px]">
              Raw Bit Length: <span className="text-cyan-400 font-bold">{calculation.bitCount} bits</span>
            </div>
          )}
        </div>
      </div>

      {/* Error Message */}
      {calculation.error && (
        <div className="p-3.5 bg-red-950/40 border border-red-500/40 rounded-xl text-red-300 text-xs flex items-center gap-2">
          <Info className="w-4 h-4 text-red-400 flex-shrink-0" />
          <span>{calculation.error}</span>
        </div>
      )}

      {/* Main Results Display Grid */}
      {!calculation.error && (
        <div className="space-y-5">
          {/* Main 3 Synchronized Cards */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-3.5">
            {/* Decimal Card */}
            <div className="p-4 rounded-xl bg-navy-950/80 border border-slate-800 hover:border-slate-700 transition space-y-2">
              <div className="flex items-center justify-between">
                <span className="text-[11px] font-bold text-slate-400 uppercase tracking-wider">
                  Decimal (Base 10)
                </span>
                <button
                  onClick={() => copyToClipboard(calculation.decStr, 'dec')}
                  className="text-slate-500 hover:text-white p-1"
                  title="Copy decimal"
                >
                  {copiedKey === 'dec' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                </button>
              </div>
              <div className="text-xl sm:text-2xl font-bold font-mono text-cyan-300 break-all select-all">
                {calculation.decStr}
              </div>
              <span className="text-[10px] text-slate-500 block">
                Standard Human Denary Notation
              </span>
            </div>

            {/* Binary Card */}
            <div className="p-4 rounded-xl bg-navy-950/80 border border-slate-800 hover:border-slate-700 transition space-y-2">
              <div className="flex items-center justify-between">
                <span className="text-[11px] font-bold text-slate-400 uppercase tracking-wider">
                  Binary (Base 2)
                </span>
                <button
                  onClick={() => copyToClipboard(calculation.formattedBin, 'bin')}
                  className="text-slate-500 hover:text-white p-1"
                  title="Copy binary"
                >
                  {copiedKey === 'bin' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                </button>
              </div>
              <div className="text-lg sm:text-xl font-bold font-mono text-electric-300 break-all select-all tracking-wider">
                {calculation.formattedBin}
              </div>
              <span className="text-[10px] text-slate-500 block">
                Prefix: <code className="text-slate-400">0b</code> | Radix: 2
              </span>
            </div>

            {/* Hexadecimal Card */}
            <div className="p-4 rounded-xl bg-navy-950/80 border border-slate-800 hover:border-slate-700 transition space-y-2">
              <div className="flex items-center justify-between">
                <span className="text-[11px] font-bold text-slate-400 uppercase tracking-wider">
                  Hexadecimal (Base 16)
                </span>
                <button
                  onClick={() => copyToClipboard('0x' + calculation.paddedHex, 'hex')}
                  className="text-slate-500 hover:text-white p-1"
                  title="Copy hex"
                >
                  {copiedKey === 'hex' ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                </button>
              </div>
              <div className="text-xl sm:text-2xl font-bold font-mono text-amber-300 break-all select-all">
                0x{calculation.paddedHex}
              </div>
              <span className="text-[10px] text-slate-500 block">
                Octal: <code className="text-slate-300">0o{calculation.rawOct}</code>
                {calculation.asciiChar && (
                  <span className="ml-2 text-emerald-400">| ASCII: '{calculation.asciiChar}'</span>
                )}
              </span>
            </div>
          </div>

          {/* Interactive 8-Bit Interactive Register / Bitboard */}
          <div className="p-4 rounded-xl bg-navy-950 border border-slate-800 space-y-3">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-2">
                <Cpu className="w-4 h-4 text-electric-400" />
                <span className="text-xs font-bold text-white uppercase tracking-wider">
                  Interactive 8-Bit Hardware Register (Click bits to toggle)
                </span>
              </div>
              <span className="text-[11px] text-slate-400 font-mono">
                Byte Range: 0 to 255
              </span>
            </div>

            {/* Bitboard Grid: 8 boxes, weights 128 to 1 */}
            <div className="grid grid-cols-8 gap-1.5 sm:gap-2 text-center font-mono">
              {[7, 6, 5, 4, 3, 2, 1, 0].map((bitPos) => {
                const weight = 1 << bitPos;
                const isBitSet = !calculation.isNegative && (BigInt(calculation.decStr) & (1n << BigInt(bitPos))) !== 0n;
                return (
                  <button
                    key={bitPos}
                    onClick={() => handleToggleBit(bitPos)}
                    className={`p-2 sm:p-2.5 rounded-lg border transition-all ${
                      isBitSet
                        ? 'bg-electric-600/30 border-electric-400 text-electric-200 shadow-md shadow-electric-600/20'
                        : 'bg-navy-900 border-slate-800 text-slate-500 hover:border-slate-700 hover:text-slate-300'
                    }`}
                    title={`Bit position ${bitPos} (Weight: ${weight}) - Click to toggle`}
                  >
                    <div className="text-[10px] text-slate-400 mb-0.5">
                      2<sup>{bitPos}</sup>
                    </div>
                    <div className="text-[10px] text-slate-500 mb-1 font-semibold">
                      {weight}
                    </div>
                    <div className={`text-base sm:text-lg font-bold ${isBitSet ? 'text-white' : 'text-slate-600'}`}>
                      {isBitSet ? '1' : '0'}
                    </div>
                  </button>
                );
              })}
            </div>
            <div className="flex justify-between items-center text-[10px] text-slate-500 px-1 font-mono">
              <span>MSB (Most Significant Bit - Pos 7)</span>
              <span>LSB (Least Significant Bit - Pos 0)</span>
            </div>
          </div>

          {/* Fixed-Width Word Representations (8, 16, 32 Bits & Two's Complement) */}
          <div className="p-4 rounded-xl bg-navy-950 border border-slate-800 space-y-3">
            <h4 className="text-xs font-bold text-white uppercase tracking-wider flex items-center gap-2">
              <ArrowLeftRight className="w-4 h-4 text-cyan-400" />
              Fixed-Width Hardware Architecture & Two's Complement
            </h4>

            <div className="overflow-x-auto">
              <table className="w-full text-left font-mono text-xs">
                <thead className="bg-navy-900 text-slate-400 uppercase text-[10px] border-b border-slate-800">
                  <tr>
                    <th className="py-2.5 px-3">Bit Width</th>
                    <th className="py-2.5 px-3">Hex Encoding</th>
                    <th className="py-2.5 px-3">Binary Bitstream</th>
                    <th className="py-2.5 px-3">Unsigned Value</th>
                    <th className="py-2.5 px-3 text-cyan-300">Signed (Two's Comp)</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-800/60 text-slate-300">
                  {/* 8-bit Byte */}
                  <tr>
                    <td className="py-2.5 px-3 font-bold text-white">8-Bit (Byte)</td>
                    <td className="py-2.5 px-3 text-amber-300">
                      {calculation.word8.inRange ? `0x${calculation.word8.hex}` : <span className="text-red-400">{calculation.word8.msg}</span>}
                    </td>
                    <td className="py-2.5 px-3 text-slate-400 tracking-wider">
                      {calculation.word8.inRange ? calculation.word8.bin.match(/.{1,4}/g).join(' ') : '—'}
                    </td>
                    <td className="py-2.5 px-3">
                      {calculation.word8.inRange ? calculation.word8.unsignedVal : '—'}
                    </td>
                    <td className="py-2.5 px-3 font-semibold text-cyan-300">
                      {calculation.word8.inRange ? calculation.word8.signedVal : '—'}
                    </td>
                  </tr>

                  {/* 16-bit Word */}
                  <tr>
                    <td className="py-2.5 px-3 font-bold text-white">16-Bit (Word)</td>
                    <td className="py-2.5 px-3 text-amber-300">
                      {calculation.word16.inRange ? `0x${calculation.word16.hex}` : <span className="text-red-400">{calculation.word16.msg}</span>}
                    </td>
                    <td className="py-2.5 px-3 text-slate-400 tracking-wider">
                      {calculation.word16.inRange ? calculation.word16.bin.match(/.{1,4}/g).join(' ') : '—'}
                    </td>
                    <td className="py-2.5 px-3">
                      {calculation.word16.inRange ? calculation.word16.unsignedVal : '—'}
                    </td>
                    <td className="py-2.5 px-3 font-semibold text-cyan-300">
                      {calculation.word16.inRange ? calculation.word16.signedVal : '—'}
                    </td>
                  </tr>

                  {/* 32-bit DWord */}
                  <tr>
                    <td className="py-2.5 px-3 font-bold text-white">32-Bit (DWord)</td>
                    <td className="py-2.5 px-3 text-amber-300">
                      {calculation.word32.inRange ? `0x${calculation.word32.hex}` : <span className="text-red-400">{calculation.word32.msg}</span>}
                    </td>
                    <td className="py-2.5 px-3 text-slate-400 tracking-wider">
                      {calculation.word32.inRange ? calculation.word32.bin.match(/.{1,4}/g).join(' ') : '—'}
                    </td>
                    <td className="py-2.5 px-3">
                      {calculation.word32.inRange ? calculation.word32.unsignedVal : '—'}
                    </td>
                    <td className="py-2.5 px-3 font-semibold text-cyan-300">
                      {calculation.word32.inRange ? calculation.word32.signedVal : '—'}
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

          {/* Mathematical Step-by-Step Proof */}
          {calculation.steps && (
            <div className="p-4 rounded-xl bg-navy-950 border border-slate-800 space-y-3">
              <h4 className="text-xs font-bold text-white uppercase tracking-wider flex items-center gap-2">
                <BookOpen className="w-4 h-4 text-electric-400" />
                Step-by-Step Mathematical Proof
              </h4>

              {/* Binary to Decimal Expansion */}
              {calculation.steps.type === 'bin-to-dec' && (
                <div className="space-y-3 text-xs">
                  <p className="text-slate-400">
                    Positional sum of active bit weights (powers of 2):
                  </p>
                  <div className="overflow-x-auto">
                    <table className="w-full text-left font-mono text-[11px]">
                      <thead className="bg-navy-900 text-slate-400 uppercase text-[10px]">
                        <tr>
                          <th className="py-1.5 px-2">Bit</th>
                          <th className="py-1.5 px-2">Position (i)</th>
                          <th className="py-1.5 px-2">Power (2ⁱ)</th>
                          <th className="py-1.5 px-2">Calculation</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-800/40">
                        {calculation.steps.terms.map((t, i) => (
                          <tr key={i} className={t.active ? 'text-cyan-300 font-semibold' : 'text-slate-600'}>
                            <td className="py-1 px-2">{t.bit}</td>
                            <td className="py-1 px-2">{t.power}</td>
                            <td className="py-1 px-2">{t.weight}</td>
                            <td className="py-1 px-2">{t.bit} × {t.weight} = {t.active ? t.weight : '0'}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                  <div className="p-2.5 rounded-lg bg-navy-900 text-cyan-300 font-mono text-xs border border-slate-800">
                    <strong>Sum Formula:</strong> {calculation.steps.formula}
                  </div>
                </div>
              )}

              {/* Decimal to Binary Successive Division */}
              {calculation.steps.type === 'dec-to-bin' && (
                <div className="space-y-2 text-xs">
                  <p className="text-slate-400">
                    Successive integer division by 2 (remainders read from bottom to top give the binary bits):
                  </p>
                  <div className="overflow-x-auto">
                    <table className="w-full text-left font-mono text-[11px]">
                      <thead className="bg-navy-900 text-slate-400 uppercase text-[10px]">
                        <tr>
                          <th className="py-1.5 px-2">Dividend</th>
                          <th className="py-1.5 px-2">÷ 2 = Quotient</th>
                          <th className="py-1.5 px-2 text-cyan-300 font-bold">Remainder (Bit)</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-800/40 text-slate-300">
                        {calculation.steps.divisions.map((d, i) => (
                          <tr key={i}>
                            <td className="py-1 px-2">{d.dividend}</td>
                            <td className="py-1 px-2">{d.quotient}</td>
                            <td className="py-1 px-2 text-cyan-300 font-bold">{d.remainder}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                  {calculation.steps.truncated && (
                    <div className="text-[10px] text-slate-500 italic">
                      * Truncated for large values; binary output contains full bits.
                    </div>
                  )}
                </div>
              )}

              {/* Hexadecimal to Decimal Expansion */}
              {calculation.steps.type === 'hex-to-dec' && (
                <div className="space-y-3 text-xs">
                  <p className="text-slate-400">
                    Positional sum of hexadecimal digit values multiplied by powers of 16:
                  </p>
                  <div className="overflow-x-auto">
                    <table className="w-full text-left font-mono text-[11px]">
                      <thead className="bg-navy-900 text-slate-400 uppercase text-[10px]">
                        <tr>
                          <th className="py-1.5 px-2">Hex Char</th>
                          <th className="py-1.5 px-2">Value</th>
                          <th className="py-1.5 px-2">Power (16ⁱ)</th>
                          <th className="py-1.5 px-2">Calculation</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-800/40 text-slate-300">
                        {calculation.steps.terms.map((t, i) => (
                          <tr key={i} className="text-amber-300">
                            <td className="py-1 px-2 font-bold">{t.char}</td>
                            <td className="py-1 px-2">{t.digitVal}</td>
                            <td className="py-1 px-2">16^{t.power} = {t.weight}</td>
                            <td className="py-1 px-2">{t.digitVal} × {t.weight} = {t.subtotal}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                  <div className="p-2.5 rounded-lg bg-navy-900 text-amber-300 font-mono text-xs border border-slate-800">
                    <strong>Sum Formula:</strong> {calculation.steps.formula}
                  </div>
                </div>
              )}
            </div>
          )}
        </div>
      )}

      {/* Educational & Practical Technical Notes (Bilingual) */}
      <div className="pt-6 border-t border-slate-800 text-xs text-slate-400 space-y-4">
        <h4 className="text-white font-bold text-sm flex items-center gap-2">
          <BookOpen className="w-4 h-4 text-electric-400" />
          {language === 'hi' ? 'कंप्यूटर विज्ञान एवं नेटवर्किंग में नंबर सिस्टम का महत्व' : 'Engineering Fundamentals: Why IT & Networking Use Hex & Binary'}
        </h4>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-3 text-xs">
          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-cyan-300 block">4 Bits = 1 Hex Character (Nibble)</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? 'हेक्साडेसिमल का आधार 16 (2⁴) है। प्रत्येक हेक्स अक्षर ठीक 4 बाइनरी बिट्स को दर्शाता है, जिससे 48-बिट MAC एड्रेस और 128-बिट IPv6 एड्रेस को लिखना और याद रखना आसान हो जाता है।'
                : 'Since 16 = 2⁴, exactly four binary bits correspond to one hexadecimal digit. This enables compact representation of MAC addresses, IPv6 addresses, and memory dumps.'}
            </p>
          </div>

          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-purple-300 block">Two\'s Complement (द्वि-पूरक पद्धति)</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? 'कंप्यूटर हार्डवेयर में ऋणात्मक संख्याओं को स्टोर करने का मानक तरीका। सबसे बाईं बिट (MSB) 1 होने पर संख्या ऋणात्मक होती है, और CPU जोड़-घटाव के लिए एक ही सर्किटरी का उपयोग कर पाता है।'
                : 'Standard method for signed integer arithmetic in modern CPUs. The MSB acts as the sign flag, eliminating the need for separate subtraction hardware.'}
            </p>
          </div>

          <div className="p-3.5 rounded-xl bg-navy-950 border border-slate-800 space-y-1">
            <strong className="text-emerald-300 block">BigInt Integer Precision</strong>
            <p className="text-slate-400 leading-relaxed text-[11px]">
              {language === 'hi'
                ? 'मानक जावास्क्रिप्ट फ्लोट नंबर 9,007,199,254,740,991 के बाद सटीक नहीं रहते। RTechLab का यह टूल बिगइन्ट (BigInt) का उपयोग करता है जिससे किसी भी बड़े पूर्णांक में शून्य त्रुटि रहती है।'
                : 'JavaScript standard numbers lose IEEE 754 precision past 2⁵³-1. RTechLab implements arbitrary-precision BigInt arithmetic to guarantee bit-exact results for 64-bit and larger integers.'}
            </p>
          </div>
        </div>

        {/* Client-Side Safety Disclosures */}
        <div className="p-3 rounded-xl bg-blue-950/20 border border-blue-800/30 text-[11px] text-slate-400 flex items-center gap-2">
          <ShieldCheck className="w-4 h-4 text-emerald-400 flex-shrink-0" />
          <span>
            <strong>Local Browser Execution:</strong> All numerical calculations and bit manipulations run 100% locally on your device in pure JavaScript. No data is transmitted across the network.
          </span>
        </div>
      </div>
    </div>
  );
};
