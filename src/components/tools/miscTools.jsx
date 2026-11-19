import React, { useEffect, useRef, useState } from 'react';
import { Callout, CopyValue, Field, Panel, SectionTitle, Stat, inputClass } from './toolUi';

// Two small utilities that do not fit a calculator: Morse code (encoding plus
// real audio tones) and Unix timestamps (the format every log line uses).

const btn = 'rounded-full border border-slate-700 px-3 py-1.5 text-[11px] font-semibold text-slate-300 transition hover:text-white';
const btnActive = 'rounded-full bg-emerald-500 px-3 py-1.5 text-[11px] font-bold text-black';
const textareaClass =
  'w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm leading-6 text-white outline-none transition focus:border-electric-400';

// ── 1. Morse code translator ────────────────────────────────────────────────
const MORSE = {
  A: '.-', B: '-...', C: '-.-.', D: '-..', E: '.', F: '..-.', G: '--.', H: '....',
  I: '..', J: '.---', K: '-.-', L: '.-..', M: '--', N: '-.', O: '---', P: '.--.',
  Q: '--.-', R: '.-.', S: '...', T: '-', U: '..-', V: '...-', W: '.--', X: '-..-',
  Y: '-.--', Z: '--..', 0: '-----', 1: '.----', 2: '..---', 3: '...--', 4: '....-',
  5: '.....', 6: '-....', 7: '--...', 8: '---..', 9: '----.', '.': '.-.-.-', ',': '--..--',
  '?': '..--..', "'": '.----.', '!': '-.-.--', '/': '-..-.', '(': '-.--.', ')': '-.--.-',
  '&': '.-...', ':': '---...', ';': '-.-.-.', '=': '-...-', '+': '.-.-.', '-': '-....-',
  _: '..--.-', '"': '.-..-.', $: '...-..-', '@': '.--.-.',
};
const MORSE_REVERSE = Object.fromEntries(Object.entries(MORSE).map(([char, code]) => [code, char]));

const encodeMorse = (text) =>
  text
    .toUpperCase()
    .split(/\s+/)
    .filter(Boolean)
    .map((word) =>
      word
        .split('')
        .map((char) => MORSE[char] || '?')
        .join(' '),
    )
    .join(' / ');

// Rough on-air duration: a dot is 1 unit, a dash 3, plus the gaps between them.
const morseSeconds = (code, wpm) => {
  let units = 0;
  for (const symbol of code) {
    if (symbol === '.') units += 2;
    else if (symbol === '-') units += 4;
    else if (symbol === ' ') units += 2;
    else if (symbol === '/') units += 6;
  }
  return Math.round(units * (1.2 / wpm));
};

// Decoding is non-destructive: an unknown group is reported back instead of
// being turned into "?", and the caller never rewrites the box you are typing
// in. That is what used to mangle half-typed dots and dashes.
const decodeMorse = (code) => {
  const groups = code.trim() ? code.trim().split(/\s*\/\s*/) : [];
  const words = [];
  let ok = true;
  for (const group of groups) {
    const letters = [];
    for (const symbol of group.trim().split(/\s+/).filter(Boolean)) {
      const letter = MORSE_REVERSE[symbol];
      if (letter === undefined) {
        ok = false;
        continue;
      }
      letters.push(letter);
    }
    words.push(letters.join(''));
  }
  return { text: words.join(' '), ok };
};

export const MorseTranslator = () => {
  const [text, setText] = useState('SOS RTECHLAB');
  const [morseInput, setMorseInput] = useState(() => encodeMorse('SOS RTECHLAB'));
  const [wpm, setWpm] = useState(15);
  const [pitch, setPitch] = useState(620);
  const [playing, setPlaying] = useState(false);
  const audioRef = useRef(null);
  const timerRef = useRef(null);

  const morse = morseInput;
  const decoded = decodeMorse(morse);
  const wordCount = morse.trim() ? morse.split('/').length : 0;

  // Plain text is the source of truth for that box; the morse box keeps exactly
  // what was typed, and only feeds the plain text once every group decodes.
  const changeText = (value) => {
    setText(value);
    setMorseInput(encodeMorse(value));
  };

  const changeMorse = (value) => {
    setMorseInput(value);
    const result = decodeMorse(value);
    if (result.ok) setText(result.text);
  };

  useEffect(
    () => () => {
      if (audioRef.current) audioRef.current.close();
      if (timerRef.current) clearTimeout(timerRef.current);
    },
    [],
  );

  const stop = () => {
    if (audioRef.current) {
      audioRef.current.close();
      audioRef.current = null;
    }
    if (timerRef.current) clearTimeout(timerRef.current);
    setPlaying(false);
  };

  const play = () => {
    stop();
    const AudioContextClass = typeof window !== 'undefined' ? window.AudioContext || window.webkitAudioContext : null;
    if (!AudioContextClass) return;
    const context = new AudioContextClass();
    audioRef.current = context;
    // One dot is 1200/wpm milliseconds; a dash is three dots, gaps one dot.
    const unit = 1.2 / wpm;
    let at = context.currentTime + 0.1;
    const gain = context.createGain();
    gain.gain.value = 0.12;
    gain.connect(context.destination);

    for (const symbol of morse) {
      if (symbol === '.' || symbol === '-') {
        const length = symbol === '.' ? unit : unit * 3;
        const oscillator = context.createOscillator();
        oscillator.type = 'sine';
        oscillator.frequency.value = pitch;
        oscillator.connect(gain);
        oscillator.start(at);
        oscillator.stop(at + length);
        at += length + unit;
      } else if (symbol === ' ') {
        at += unit * 2;
      } else if (symbol === '/') {
        at += unit * 4;
      }
    }

    const totalMs = (at - context.currentTime) * 1000 + 200;
    setPlaying(true);
    timerRef.current = setTimeout(stop, totalMs);
  };

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Type text to hear it in Morse, or paste dots and dashes to read them back.">
          Morse code translator and player
        </SectionTitle>

        <div className="grid gap-4 sm:grid-cols-2">
          <Field label="Plain text" hint="A–Z, 0–9 and common punctuation">
            <textarea className={`${textareaClass} h-24 resize-none`} value={text} onChange={(event) => changeText(event.target.value)} />
          </Field>
          <Field label="Morse code" hint="Use a space between letters and / between words">
            <textarea
              className={`${textareaClass} h-24 resize-none`}
              value={morseInput}
              onChange={(event) => changeMorse(event.target.value)}
              spellCheck={false}
            />
          </Field>
        </div>

        {!decoded.ok && (
          <p className="mt-2 text-[11px] text-amber-300">
            Some groups in the code box are not valid Morse yet — the plain text keeps the last complete translation.
          </p>
        )}

        <div className="mt-4 grid gap-4 sm:grid-cols-2">
          <Field label={`Speed — ${wpm} WPM`} hint="20 WPM is a typical beginner certificate target">
            <input
              type="range"
              min={5}
              max={35}
              className="w-full cursor-pointer accent-electric-500"
              value={wpm}
              onChange={(event) => setWpm(Number(event.target.value))}
            />
          </Field>
          <Field label={`Tone — ${pitch} Hz`} hint="600–800 Hz is the easiest range to hear">
            <input
              type="range"
              min={300}
              max={1000}
              step={10}
              className="w-full cursor-pointer accent-electric-500"
              value={pitch}
              onChange={(event) => setPitch(Number(event.target.value))}
            />
          </Field>
        </div>

        <div className="mt-4 flex flex-wrap items-center gap-2">
          <button type="button" onClick={playing ? stop : play} className={btnActive}>
            {playing ? 'Stop' : '▶ Play tones'}
          </button>
          <button type="button" onClick={() => { changeText('SOS'); stop(); }} className={btn}>SOS</button>
          <button type="button" onClick={() => { changeText('HELLO WORLD'); stop(); }} className={btn}>HELLO WORLD</button>
          <button type="button" onClick={() => { changeText(''); stop(); }} className={btn}>Clear</button>
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-3">
          <Stat label="Characters" value={text.replace(/\s/g, '').length} hint="letters and digits encoded" />
          <Stat label="Morse symbols" value={morse.split('').filter((char) => char === '.' || char === '-').length} hint={`${wordCount} word${wordCount === 1 ? '' : 's'}`} />
          <Stat label="Transmission time" value={`${morseSeconds(morse, wpm)} s`} hint="roughly, at this speed" />
        </div>

        <div className="mt-4">
          <CopyValue label="copy morse" value={morse} />
        </div>

        <div className="mt-4">
          <Callout>
            Morse is the oldest digital code still in use: dot and dash map exactly to 1 and 0. Radio operators still test it with SOS (… --- …) because it is short and unmistakable — a good reminder that a good protocol is the one that survives a bad channel.
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

// ── 2. Unix timestamp converter ─────────────────────────────────────────────
const pad = (value) => String(value).padStart(2, '0');

// Captured once at module load; components must not call Date.now() in render.
const PAGE_LOADED_AT = Date.now();

const toLocalInput = (ms) => {
  const date = new Date(ms);
  return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())}T${pad(date.getHours())}:${pad(date.getMinutes())}`;
};

const relative = (ms) => {
  const diff = ms - Date.now();
  const abs = Math.abs(diff);
  const units = [
    { label: 'day', size: 86400000 },
    { label: 'hour', size: 3600000 },
    { label: 'minute', size: 60000 },
    { label: 'second', size: 1000 },
  ];
  for (const unit of units) {
    if (abs >= unit.size) {
      const value = Math.round(abs / unit.size);
      return `${value} ${unit.label}${value === 1 ? '' : 's'} ${diff > 0 ? 'from now' : 'ago'}`;
    }
  }
  return 'now';
};

export const TimestampConverter = () => {
  const [ms, setMs] = useState(PAGE_LOADED_AT);
  const [epochInput, setEpochInput] = useState(() => String(Math.floor(PAGE_LOADED_AT / 1000)));
  const [localInput, setLocalInput] = useState(() => toLocalInput(PAGE_LOADED_AT));

  const apply = (nextMs) => {
    setMs(nextMs);
    setEpochInput(String(Math.floor(nextMs / 1000)));
    setLocalInput(toLocalInput(nextMs));
  };

  const onEpochChange = (value) => {
    setEpochInput(value);
    const number = Number(value);
    if (!Number.isFinite(number) || value.trim() === '') return;
    // Ten digits is seconds, thirteen is milliseconds — the usual confusion.
    const nextMs = String(Math.trunc(Math.abs(number))).length >= 12 ? number : number * 1000;
    setMs(nextMs);
    setLocalInput(toLocalInput(nextMs));
  };

  const onLocalChange = (value) => {
    setLocalInput(value);
    const parsed = new Date(value);
    if (Number.isNaN(parsed.getTime())) return;
    setMs(parsed.getTime());
    setEpochInput(String(Math.floor(parsed.getTime() / 1000)));
  };

  const date = new Date(ms);
  const valid = Number.isFinite(ms) && !Number.isNaN(date.getTime());

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Logs store seconds since 1970. Paste one, or pick a date, and read it in every form you need.">
          Unix timestamp converter
        </SectionTitle>

        <div className="grid gap-4 sm:grid-cols-2">
          <Field label="Unix timestamp" hint="Seconds (10 digits) or milliseconds (13 digits) both work">
            <input className={inputClass} value={epochInput} onChange={(event) => onEpochChange(event.target.value)} inputMode="numeric" />
          </Field>
          <Field label="Date and time (your timezone)">
            <input type="datetime-local" className={inputClass} value={localInput} onChange={(event) => onLocalChange(event.target.value)} />
          </Field>
        </div>

        <div className="mt-4 flex flex-wrap gap-2">
          <button type="button" className={btnActive} onClick={() => apply(Date.now())}>Now</button>
          <button type="button" className={btn} onClick={() => apply(ms + 3600000)}>+1 hour</button>
          <button type="button" className={btn} onClick={() => apply(ms - 86400000)}>−1 day</button>
          <button type="button" className={btn} onClick={() => apply(Date.UTC(2026, 0, 1))}>New Year 2026</button>
        </div>

        {valid && (
          <>
            <div className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
              <Stat label="Epoch (seconds)" value={Math.floor(ms / 1000)} tone="text-cyan-300" />
              <Stat label="Epoch (milliseconds)" value={ms} />
              <Stat label="Relative" value={relative(ms)} hint="compared to this device's clock" />
              <Stat label="UTC offset" value={-date.getTimezoneOffset() / 60 + ' h'} hint="your browser's timezone" />
            </div>

            <div className="mt-4 space-y-2">
              <CopyValue label="copy ISO" value={date.toISOString()} />
              <CopyValue
                label="copy UTC"
                value={`${date.toUTCString()}`}
              />
              <CopyValue
                label="copy local"
                value={date.toLocaleString(undefined, { dateStyle: 'full', timeStyle: 'medium' })}
              />
              <CopyValue
                label="copy IST"
                value={date.toLocaleString('en-IN', { timeZone: 'Asia/Kolkata', dateStyle: 'full', timeStyle: 'medium' })}
              />
            </div>

            <div className="mt-5 grid gap-3 sm:grid-cols-3">
              <Stat label="Day of week" value={date.toLocaleDateString(undefined, { weekday: 'long' })} />
              <Stat label="Day of year" value={Math.ceil((date - new Date(date.getFullYear(), 0, 0)) / 86400000)} />
              <Stat label="Week number (ISO)" value={Math.ceil((((date - new Date(date.getFullYear(), 0, 1)) / 86400000) + new Date(date.getFullYear(), 0, 1).getDay() + 1) / 7)} />
            </div>

            <div className="mt-4">
              <Callout>
                A 10-digit timestamp is seconds, a 13-digit one is milliseconds. Mixing them puts your data in 1970 or in the year 50000 — the single most common date bug in application logs.
              </Callout>
            </div>
          </>
        )}
      </Panel>
    </div>
  );
};
