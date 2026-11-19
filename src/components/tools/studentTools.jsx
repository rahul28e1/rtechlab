import React, { useEffect, useMemo, useState } from 'react';
import { Callout, CopyValue, Field, Panel, SectionTitle, Stat, inputClass, selectClass } from './toolUi';

// Student-facing utilities: typing practice, a study timer, essay word counts,
// grade maths, citations and an exam countdown. Everything is local and works
// offline — nothing is uploaded, so students can use these on shared lab PCs.

// Read the clock once when the module loads, so no component calls Date.now()
// during render (that is impure and warns under the React compiler).
const PAGE_LOADED_AT = Date.now();

const btn = 'rounded-full border border-slate-700 px-3 py-1.5 text-[11px] font-semibold text-slate-300 transition hover:text-white';
const btnActive = 'rounded-full bg-emerald-500 px-3 py-1.5 text-[11px] font-bold text-black';
const textareaClass =
  'w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none transition focus:border-electric-400';

// ── 1. Typing speed test ────────────────────────────────────────────────────
const PASSAGES = [
  'A subnet mask separates the network part of an address from the host part, so every device on a link can tell whether a destination is local or has to be routed.',
  'When a browser asks for a page it first resolves the name through DNS, opens a TCP connection, negotiates TLS, and only then sends the HTTP request.',
  'A cache helps only when the same data is requested again before it expires, which is why the hit rate matters far more than the cache size on its own.',
];

export const TypingSpeedTest = () => {
  const [passageIndex, setPassageIndex] = useState(0);
  const [typed, setTyped] = useState('');
  const [startedAt, setStartedAt] = useState(null);
  const [finishedAt, setFinishedAt] = useState(null);
  const [now, setNow] = useState(PAGE_LOADED_AT);

  const passage = PASSAGES[passageIndex];

  useEffect(() => {
    if (!startedAt || finishedAt) return undefined;
    const id = setInterval(() => setNow(Date.now()), 200);
    return () => clearInterval(id);
  }, [startedAt, finishedAt]);

  const elapsed = startedAt ? Math.max(0.1, ((finishedAt || now) - startedAt) / 1000) : 0;
  const correct = useMemo(
    () => typed.split('').filter((char, index) => char === passage[index]).length,
    [typed, passage],
  );
  const errors = typed.length - correct;
  const wpm = elapsed > 0 ? Math.round(correct / 5 / (elapsed / 60)) : 0;
  const accuracy = typed.length > 0 ? Math.round((correct / typed.length) * 100) : 100;
  const finished = Boolean(finishedAt);

  const restart = () => {
    setPassageIndex((index) => (index + 1) % PASSAGES.length);
    setTyped('');
    setStartedAt(null);
    setFinishedAt(null);
    setNow(Date.now());
  };

  const handleChange = (event) => {
    const value = event.target.value.slice(0, passage.length);
    setTyped(value);
    if (!startedAt) setStartedAt(Date.now());
    if (value.length >= passage.length && !finishedAt) setFinishedAt(Date.now());
  };

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Type the line below exactly. Speed, accuracy and mistakes update as you type.">
          Typing speed test
        </SectionTitle>

        <div className="rounded-xl border border-slate-800 bg-navy-950 p-4 font-mono text-sm leading-7">
          {passage.split('').map((char, index) => {
            const typedChar = typed[index];
            const state =
              typedChar === undefined
                ? index === typed.length
                  ? 'text-white bg-electric-500/20'
                  : 'text-slate-500'
                : typedChar === char
                  ? 'text-emerald-400'
                  : 'text-red-400 bg-red-500/20';
            return (
              <span key={index} className={state}>
                {char}
              </span>
            );
          })}
        </div>

        <div className="mt-4">
          <textarea
            className={`${textareaClass} h-24 resize-none`}
            value={typed}
            onChange={handleChange}
            placeholder="Click here and start typing the line above…"
            spellCheck={false}
            disabled={finished}
          />
        </div>

        <div className="mt-4 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <Stat label="Speed" value={`${wpm} WPM`} tone="text-emerald-400" hint="words per minute, five characters each" />
          <Stat label="Accuracy" value={`${accuracy}%`} tone={accuracy < 90 ? 'text-amber-300' : 'text-white'} hint={`${errors} wrong character${errors === 1 ? '' : 's'}`} />
          <Stat label="Progress" value={`${Math.round((typed.length / passage.length) * 100)}%`} hint={`${typed.length} of ${passage.length} characters`} />
          <Stat label="Time" value={`${elapsed.toFixed(1)} s`} hint={finished ? 'run finished' : 'timer runs while you type'} />
        </div>

        <div className="mt-4 flex flex-wrap items-center gap-2">
          <button type="button" onClick={restart} className={btn}>
            {finished ? 'Next line' : 'Restart with another line'}
          </button>
          {finished && (
            <span className="text-[11px] text-slate-400">
              {wpm >= 40 ? 'Good pace — 40 WPM is a comfortable office speed.' : 'Keep going: 25–30 WPM is normal while learning to touch type.'}
            </span>
          )}
        </div>

        <div className="mt-4">
          <Callout tone="info">
            Accuracy first, speed second. A 98% accurate 35 WPM typist finishes real work faster than an 85% accurate 55 WPM typist, because every typo costs a correction.
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

// ── 2. Pomodoro timer ───────────────────────────────────────────────────────
const DEFAULT_FOCUS_MINUTES = 25;

// The focus block follows the slider; the two breaks keep their classic lengths
// because that ratio is what makes the method work.
const TIMER_MODES = [
  { id: 'focus', label: 'Focus' },
  { id: 'short', label: 'Short break', minutes: 5 },
  { id: 'long', label: 'Long break', minutes: 15 },
];

const modeMinutes = (id, focusMinutes) =>
  id === 'focus' ? focusMinutes : TIMER_MODES.find((item) => item.id === id).minutes;

export const PomodoroTimer = () => {
  const [mode, setMode] = useState('focus');
  const [focusMinutes, setFocusMinutes] = useState(DEFAULT_FOCUS_MINUTES);
  const [remaining, setRemaining] = useState(DEFAULT_FOCUS_MINUTES * 60);
  const [running, setRunning] = useState(false);
  const [completed, setCompleted] = useState(0);
  const [focusedSeconds, setFocusedSeconds] = useState(0);

  const total = modeMinutes(mode, focusMinutes) * 60;

  useEffect(() => {
    if (!running) return undefined;
    const id = setInterval(() => {
      setRemaining((value) => Math.max(0, value - 1));
      if (mode === 'focus') setFocusedSeconds((value) => value + 1);
    }, 1000);
    return () => clearInterval(id);
  }, [running, mode]);

  // Completion lives in an effect, not inside the updater, so a re-render can
  // never count the same block twice.
  useEffect(() => {
    if (!running || remaining > 0) return;
    setRunning(false);
    if (mode === 'focus') setCompleted((count) => count + 1);
  }, [remaining, running, mode]);

  const chooseMode = (id) => {
    setMode(id);
    setRemaining(modeMinutes(id, focusMinutes) * 60);
    setRunning(false);
  };

  const changeFocusMinutes = (minutes) => {
    setFocusMinutes(minutes);
    if (mode !== 'focus') return;
    setRunning(false);
    setRemaining(minutes * 60);
  };

  // Pressing Start on a finished block restarts that block; without this the
  // completion effect fires again and counts a second block for the same zero.
  const toggleRunning = () => {
    if (!running && remaining === 0) {
      setRemaining(total);
      setRunning(true);
      return;
    }
    setRunning((value) => !value);
  };

  const reset = () => {
    setRemaining(total);
    setRunning(false);
  };

  const minutes = Math.floor(remaining / 60);
  const seconds = remaining % 60;
  const progress = total > 0 ? ((total - remaining) / total) * 100 : 0;

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Work in 25-minute blocks with a 5-minute break. Long enough to focus, short enough to start.">
          Pomodoro study timer
        </SectionTitle>

        <div className="flex flex-wrap gap-2">
          {TIMER_MODES.map((item) => (
            <button key={item.id} type="button" onClick={() => chooseMode(item.id)} className={mode === item.id ? btnActive : btn}>
              {item.label} · {modeMinutes(item.id, focusMinutes)} min
            </button>
          ))}
        </div>

        <div className="mt-6 rounded-2xl border border-slate-800 bg-navy-950 p-6 text-center">
          <div className="font-mono text-6xl font-bold tracking-tight text-white">
            {String(minutes).padStart(2, '0')}:{String(seconds).padStart(2, '0')}
          </div>
          <div className="mx-auto mt-4 h-2 w-full max-w-md overflow-hidden rounded-full bg-slate-800">
            <div className="h-full bg-emerald-500 transition-all duration-500" style={{ width: `${progress}%` }} />
          </div>
          <p className="mt-3 text-[11px] uppercase tracking-wider text-slate-500">
            {running ? 'running — leave the phone face down' : remaining === 0 ? 'block finished' : 'ready when you are'}
          </p>
        </div>

        <div className="mt-4 flex flex-wrap items-center gap-2">
          <button type="button" onClick={toggleRunning} className={btnActive}>
            {running ? 'Pause' : 'Start'}
          </button>
          <button type="button" onClick={reset} className={btn}>
            Reset
          </button>
          <button
            type="button"
            onClick={() => {
              // Only skipping a focus block completes one; a skipped break does not.
              if (mode === 'focus') setCompleted((count) => count + 1);
              chooseMode(mode === 'focus' ? 'short' : 'focus');
            }}
            className={btn}
          >
            Skip block
          </button>
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-3">
          <Stat label="Blocks completed" value={completed} tone="text-emerald-400" hint={`one block is ${focusMinutes} focused minutes`} />
          <Stat
            label="Focused time"
            value={focusedSeconds >= 3600 ? `${(focusedSeconds / 3600).toFixed(1)} h` : `${Math.floor(focusedSeconds / 60)} min`}
            hint="time actually run in focus mode"
          />
          <Stat label="Break due" value={remaining === 0 ? 'now' : `${minutes} min`} hint="stand up, look far away, drink water" />
        </div>

        <div className="mt-4">
          <Field
            label={`Focus block length — ${focusMinutes} minutes`}
            hint="Changing it restarts the focus block. 25 min suits revision, 45–50 min suits long assignments."
          >
            <div className="flex items-center gap-3">
              <input
                type="range"
                min={5}
                max={90}
                step={5}
                className="w-full cursor-pointer accent-emerald-500"
                value={focusMinutes}
                onChange={(event) => changeFocusMinutes(Number(event.target.value))}
              />
              <span className="w-16 shrink-0 text-right font-mono text-xs text-white">{focusMinutes} min</span>
            </div>
          </Field>
        </div>

        <div className="mt-4">
          <Callout>
            Four blocks with short breaks and one long break is a classic 2-hour study cycle. Close every other tab before you start — a 25-minute block with three interruptions is really three 8-minute blocks.
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

// ── 3. Word & character counter ────────────────────────────────────────────
const toTitleCase = (value) =>
  value.replace(/\w\S*/g, (word) => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase());

export const WordCounter = () => {
  const [text, setText] = useState('');

  const stats = useMemo(() => {
    const trimmed = text.trim();
    const words = trimmed ? trimmed.split(/\s+/).filter(Boolean) : [];
    const sentences = trimmed ? trimmed.split(/[.!?]+/).filter((part) => part.trim()).length : 0;
    const paragraphs = trimmed ? trimmed.split(/\n{2,}/).filter((part) => part.trim()).length : 0;
    const longest = words.reduce((best, word) => (word.length > best.length ? word : best), '');
    return {
      words: words.length,
      characters: text.length,
      charactersNoSpaces: text.replace(/\s/g, '').length,
      sentences,
      paragraphs,
      readMinutes: Math.max(1, Math.round(words.length / 200)),
      speakMinutes: Math.max(1, Math.round(words.length / 130)),
      longest,
      avgWord: words.length ? (words.join('').length / words.length).toFixed(1) : '0',
    };
  }, [text]);

  const applyCase = (transform) => setText((value) => transform(value));

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Paste your assignment to check the word limit before you submit it.">
          Word and character counter
        </SectionTitle>

        <textarea
          className={`${textareaClass} h-56 resize-y`}
          value={text}
          onChange={(event) => setText(event.target.value)}
          placeholder="Paste or type your essay, report or answer here…"
        />

        <div className="mt-4 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <Stat label="Words" value={stats.words} tone="text-emerald-400" hint="split on spaces, as exam portals count them" />
          <Stat label="Characters" value={stats.characters} hint={`${stats.charactersNoSpaces} without spaces`} />
          <Stat label="Sentences" value={stats.sentences} hint={`${stats.paragraphs} paragraph${stats.paragraphs === 1 ? '' : 's'}`} />
          <Stat label="Reading time" value={`${stats.readMinutes} min`} hint={`${stats.speakMinutes} min if read aloud`} />
        </div>

        <div className="mt-4 grid gap-3 sm:grid-cols-2">
          <div className="rounded-xl border border-slate-800 bg-navy-950 p-3.5">
            <span className="block text-[11px] uppercase tracking-wider text-slate-500">Longest word</span>
            <span className="mt-1 block truncate font-mono text-sm text-white">{stats.longest || '—'}</span>
          </div>
          <div className="rounded-xl border border-slate-800 bg-navy-950 p-3.5">
            <span className="block text-[11px] uppercase tracking-wider text-slate-500">Average word length</span>
            <span className="mt-1 block font-mono text-sm text-white">{stats.avgWord} characters</span>
          </div>
        </div>

        <div className="mt-4 flex flex-wrap gap-2">
          <button type="button" className={btn} onClick={() => applyCase((value) => value.toUpperCase())}>UPPER CASE</button>
          <button type="button" className={btn} onClick={() => applyCase((value) => value.toLowerCase())}>lower case</button>
          <button type="button" className={btn} onClick={() => applyCase(toTitleCase)}>Title Case</button>
          <button type="button" className={btn} onClick={() => applyCase((value) => value.replace(/\s+/g, ' ').trim())}>Clean spaces</button>
          <button type="button" className={btn} onClick={() => setText('')}>Clear</button>
        </div>

        <div className="mt-4">
          <Callout tone={stats.words > 500 ? 'warn' : 'info'}>
            {stats.words > 500
              ? 'Long answer: check the marking scheme — most written exams reward points, not length. Trim repeated sentences before you trim examples.'
              : 'Counts update as you type. "Clean spaces" removes double spaces and stray line breaks, which is usually what makes a college portal reject a pasted answer.'}
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

// ── 4. CGPA / percentage calculator ─────────────────────────────────────────
const GRADE_OPTIONS = [
  { label: 'O — 10', points: 10 },
  { label: 'A+ — 9', points: 9 },
  { label: 'A — 8', points: 8 },
  { label: 'B+ — 7', points: 7 },
  { label: 'B — 6', points: 6 },
  { label: 'C — 5', points: 5 },
  { label: 'P — 4', points: 4 },
  { label: 'F — 0', points: 0 },
];

const DEFAULT_SUBJECTS = [
  { id: 1, name: 'Subject 1', credits: 4, points: 9 },
  { id: 2, name: 'Subject 2', credits: 3, points: 8 },
  { id: 3, name: 'Subject 3', credits: 3, points: 10 },
];

export const GradeCalculator = () => {
  const [subjects, setSubjects] = useState(DEFAULT_SUBJECTS);
  const [multiplier, setMultiplier] = useState(9.5);
  const [cgpa, setCgpa] = useState(7.5);

  const totals = useMemo(() => {
    const credits = subjects.reduce((sum, subject) => sum + (Number(subject.credits) || 0), 0);
    const points = subjects.reduce((sum, subject) => sum + (Number(subject.credits) || 0) * (Number(subject.points) || 0), 0);
    return { credits, points, sgpa: credits ? points / credits : 0 };
  }, [subjects]);

  const update = (id, patch) =>
    setSubjects((rows) => rows.map((row) => (row.id === id ? { ...row, ...patch } : row)));

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Add each subject with its credits and grade. SGPA and the percentage equivalent are calculated the way most Indian universities do it.">
          SGPA, CGPA and percentage
        </SectionTitle>

        <div className="space-y-2">
          {subjects.map((subject) => (
            <div key={subject.id} className="grid gap-2 sm:grid-cols-[1fr_90px_150px_40px]">
              <input
                className={inputClass}
                value={subject.name}
                onChange={(event) => update(subject.id, { name: event.target.value })}
                placeholder="Subject name"
              />
              <input
                type="number"
                min={0}
                max={10}
                className={inputClass}
                value={subject.credits}
                onChange={(event) => update(subject.id, { credits: Number(event.target.value) || 0 })}
                title="Credits"
              />
              <select
                className={selectClass}
                value={subject.points}
                onChange={(event) => update(subject.id, { points: Number(event.target.value) })}
              >
                {GRADE_OPTIONS.map((option) => (
                  <option key={option.points} value={option.points}>
                    {option.label}
                  </option>
                ))}
              </select>
              <button
                type="button"
                onClick={() => setSubjects((rows) => rows.filter((row) => row.id !== subject.id))}
                className="rounded-xl border border-slate-700 text-xs text-slate-400 hover:text-red-300"
                title="Remove subject"
              >
                ✕
              </button>
            </div>
          ))}
        </div>

        <div className="mt-3">
          <button
            type="button"
            className={btn}
            onClick={() =>
              setSubjects((rows) => [
                ...rows,
                { id: Math.max(0, ...rows.map((row) => row.id)) + 1, name: `Subject ${rows.length + 1}`, credits: 3, points: 8 },
              ])
            }
          >
            + Add subject
          </button>
        </div>

        <div className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <Stat label="Total credits" value={totals.credits} hint="credits × grade points, summed" />
          <Stat label="SGPA" value={totals.sgpa.toFixed(2)} tone="text-emerald-400" hint={`${totals.points} grade points`} />
          <Stat label="Percentage" value={`${(totals.sgpa * multiplier).toFixed(1)}%`} hint={`SGPA × ${multiplier}`} />
          <Stat label="Verdict" value={totals.sgpa >= 8 ? 'Distinction' : totals.sgpa >= 6 ? 'First class' : totals.sgpa > 0 ? 'Pass' : '—'} tone={totals.sgpa >= 8 ? 'text-emerald-400' : 'text-white'} hint="typical Indian university bands" />
        </div>

        <div className="mt-5 grid gap-4 sm:grid-cols-2">
          <Field label="CGPA conversion factor" hint="CBSE and many universities use 9.5; check your own handbook.">
            <input
              type="number"
              step={0.1}
              min={5}
              max={11}
              className={inputClass}
              value={multiplier}
              onChange={(event) => setMultiplier(Number(event.target.value) || 9.5)}
            />
          </Field>
          <Field label="Convert a CGPA to percentage" hint="Useful for forms that ask for a percentage only.">
            <input
              type="number"
              step={0.01}
              min={0}
              max={10}
              className={inputClass}
              value={cgpa}
              onChange={(event) => setCgpa(Math.min(10, Number(event.target.value) || 0))}
            />
          </Field>
        </div>

        <div className="mt-4 grid gap-3 sm:grid-cols-2">
          <Stat label="Percentage for that CGPA" value={`${(cgpa * multiplier).toFixed(2)}%`} tone="text-cyan-300" />
          <Stat label="CGPA for 75%" value={(75 / multiplier).toFixed(2)} hint={`75 ÷ ${multiplier}`} />
        </div>

        <div className="mt-4">
          <Callout tone="info">
            SGPA weights every subject by its credits, so a 4-credit subject moves your score twice as much as a 2-credit one. Most universities multiply CGPA by 9.5 for a percentage, but a few use (CGPA − 0.75) × 10 — always check the handbook before filling a form.
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

// ── 5. Citation generator ───────────────────────────────────────────────────
const MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

export const CitationGenerator = () => {
  const [author, setAuthor] = useState('Sharma, R.');
  const [title, setTitle] = useState('How DNS resolves a domain name');
  const [site, setSite] = useState('RTechLab');
  const [year, setYear] = useState('2026');
  const [url, setUrl] = useState('https://rtechlab.com/tutorials/dns-how-domain-names-resolve');
  const [accessed, setAccessed] = useState(new Date(PAGE_LOADED_AT).toISOString().slice(0, 10));

  const accessedDate = new Date(`${accessed}T00:00:00`);
  const accessedHuman = Number.isNaN(accessedDate.getTime())
    ? 'today'
    : `${accessedDate.getDate()} ${MONTHS[accessedDate.getMonth()]} ${accessedDate.getFullYear()}`;

  const citations = [
    {
      label: 'APA 7',
      value: `${author}. (${year}). ${title}. ${site}. ${url}`,
    },
    {
      label: 'MLA 9',
      value: `${author}. "${title}." ${site}, ${year}, ${url}. Accessed ${accessedHuman}.`,
    },
    {
      label: 'IEEE',
      value: `${author}, "${title}," ${site}, ${year}. [Online]. Available: ${url}`,
    },
    {
      label: 'Chicago',
      value: `${author}. "${title}." ${site}. Accessed ${accessedHuman}. ${url}.`,
    },
  ];

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Fill the fields once and copy the reference in the style your college asks for.">
          Citation generator
        </SectionTitle>

        <div className="grid gap-4 sm:grid-cols-2">
          <Field label="Author" hint="Surname first for APA: Sharma, R.">
            <input className={inputClass} value={author} onChange={(event) => setAuthor(event.target.value)} />
          </Field>
          <Field label="Title of the page or article">
            <input className={inputClass} value={title} onChange={(event) => setTitle(event.target.value)} />
          </Field>
          <Field label="Website or publisher">
            <input className={inputClass} value={site} onChange={(event) => setSite(event.target.value)} />
          </Field>
          <Field label="Year published">
            <input className={inputClass} value={year} onChange={(event) => setYear(event.target.value)} />
          </Field>
          <Field label="URL">
            <input className={inputClass} value={url} onChange={(event) => setUrl(event.target.value)} />
          </Field>
          <Field label="Date you accessed it">
            <input type="date" className={inputClass} value={accessed} onChange={(event) => setAccessed(event.target.value)} />
          </Field>
        </div>

        <div className="mt-5 space-y-2">
          {citations.map((citation) => (
            <div key={citation.label} className="rounded-xl border border-slate-800 bg-navy-950 p-3">
              <div className="mb-1.5 flex items-center justify-between">
                <span className="text-[11px] font-bold uppercase tracking-wider text-slate-400">{citation.label}</span>
              </div>
              <p className="mb-2 text-xs leading-relaxed text-slate-200">{citation.value}</p>
              <CopyValue label="copy" value={citation.value} />
            </div>
          ))}
        </div>

        <div className="mt-4">
          <Callout>
            Cite the page you actually read, not the search result. Keep the accessed date — a URL can change, and a marker can see whether the reference was plausible for the assignment date.
          </Callout>
        </div>
      </Panel>
    </div>
  );
};

// ── 6. Exam countdown & study load ──────────────────────────────────────────
export const ExamCountdown = () => {
  const [examDate, setExamDate] = useState('');
  const [chapters, setChapters] = useState(10);
  const [hoursPerDay, setHoursPerDay] = useState(3);
  const [today] = useState(PAGE_LOADED_AT);

  const values = useMemo(() => {
    if (!examDate) return null;
    const target = new Date(`${examDate}T00:00:00`);
    if (Number.isNaN(target.getTime())) return null;
    const start = new Date(today);
    start.setHours(0, 0, 0, 0);
    const days = Math.round((target - start) / 86400000);
    const studyDays = Math.max(0, days - 1); // keep the day before for revision
    return {
      days,
      weeks: Math.floor(Math.max(0, days) / 7),
      hours: studyDays * hoursPerDay,
      perChapter: chapters > 0 ? (studyDays * hoursPerDay) / chapters : 0,
      late: days < 0,
    };
  }, [today, examDate, chapters, hoursPerDay]);

  return (
    <div className="space-y-5">
      <Panel>
        <SectionTitle hint="Turn a date into a daily plan: how many days are left, and how many hours each chapter gets.">
          Exam countdown planner
        </SectionTitle>

        <div className="grid gap-4 sm:grid-cols-3">
          <Field label="Exam date">
            <input type="date" className={inputClass} value={examDate} onChange={(event) => setExamDate(event.target.value)} />
          </Field>
          <Field label="Chapters or units left">
            <input
              type="number"
              min={1}
              max={100}
              className={inputClass}
              value={chapters}
              onChange={(event) => setChapters(Math.max(1, Number(event.target.value) || 1))}
            />
          </Field>
          <Field label="Realistic study hours per day" hint="Count focused hours, not hours at the desk.">
            <input
              type="number"
              min={1}
              max={16}
              step={0.5}
              className={inputClass}
              value={hoursPerDay}
              onChange={(event) => setHoursPerDay(Math.max(1, Number(event.target.value) || 1))}
            />
          </Field>
        </div>

        {!values && (
          <div className="mt-5">
            <Callout>Pick an exam date to see the plan.</Callout>
          </div>
        )}

        {values && (
          <>
            <div className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
              <Stat
                label="Days left"
                value={values.days}
                tone={values.late ? 'text-red-300' : values.days <= 7 ? 'text-amber-300' : 'text-emerald-400'}
                hint={values.late ? 'this date has passed' : `${values.weeks} full week${values.weeks === 1 ? '' : 's'}`}
              />
              <Stat label="Study hours available" value={`${values.hours} h`} hint="one day kept free for revision" />
              <Stat label="Hours per chapter" value={`${values.perChapter.toFixed(1)} h`} tone={values.perChapter < 1 ? 'text-red-300' : 'text-white'} hint={chapters + ' chapters'} />
              <Stat
                label="Daily target"
                value={values.days > 0 ? `${(chapters / Math.max(1, values.days - 1)).toFixed(1)} ch/day` : '—'}
                hint="chapters to cover each day"
              />
            </div>

            <div className="mt-4">
              <Callout tone={values.late ? 'error' : values.perChapter < 1 ? 'warn' : 'ok'}>
                {values.late
                  ? 'That date is in the past. Change the exam date, or use this to log how the plan actually went.'
                  : values.perChapter < 1
                    ? `Under an hour per chapter is tight. Either raise the daily hours, cut the chapter list to the high-weight ones, or start with past papers instead of re-reading.`
                    : `${values.perChapter.toFixed(1)} hours per chapter is workable: one chapter, one practice set, one revision note. Book the last day for a full past paper under exam conditions.`}
              </Callout>
            </div>
          </>
        )}
      </Panel>
    </div>
  );
};
