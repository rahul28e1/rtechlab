import React, { useMemo, useState } from 'react';
import { Callout, Field, Panel, Stat } from './toolUi';
import { InfoList } from './kit';

const columnLetter = (index) => {
  let value = index;
  let label = '';
  while (value >= 0) {
    label = String.fromCharCode((value % 26) + 65) + label;
    value = Math.floor(value / 26) - 1;
  }
  return label;
};

const columnIndex = (letter) => {
  let value = 0;
  for (const char of letter.toUpperCase()) value = value * 26 + (char.charCodeAt(0) - 64);
  return value;
};

export const VlookupConverter = () => {
  const [formula, setFormula] = useState('=VLOOKUP(A2, Sheet2!A:D, 4, FALSE)');

  const result = useMemo(() => {
    const raw = (formula || '').trim().replace(/^=/, '');
    const match = /^VLOOKUP\((.*)\)$/i.exec(raw);
    if (!match) return { error: 'Paste a formula that starts with =VLOOKUP(…).' };

    // Split arguments at top level commas only.
    const args = [];
    let depth = 0;
    let current = '';
    for (const char of match[1]) {
      if (char === ',' && depth === 0) {
        args.push(current.trim());
        current = '';
        continue;
      }
      if (char === '(') depth += 1;
      if (char === ')') depth -= 1;
      current += char;
    }
    if (current.trim()) args.push(current.trim());
    if (args.length < 3) return { error: 'VLOOKUP needs at least three arguments: lookup value, table, column index.' };

    const [lookup, table, indexRaw, rangeLookup] = args;
    const colIndex = Number(indexRaw);
    const sheetMatch = /^(.*!)?\$?([A-Z]{1,2})\$?(\d*):\$?([A-Z]{1,2})\$?(\d*)$/i.exec(table);
    if (!sheetMatch) return { error: 'Could not read the table range. Use a range like Sheet2!A:D or $A$1:$D$100.' };

    const sheet = sheetMatch[1] || '';
    const startCol = sheetMatch[2].toUpperCase();
    const endCol = sheetMatch[4].toUpperCase();
    const startRow = sheetMatch[3];
    const endRow = sheetMatch[5];
    const targetCol = columnLetter(columnIndex(startCol) + (Number.isFinite(colIndex) ? colIndex - 1 : 0));
    const lookupRange = startRow ? `${sheet}${startCol}${startRow}:${startCol}${endRow}` : `${sheet}${startCol}:${startCol}`;
    const returnRange = startRow ? `${sheet}${targetCol}${startRow}:${targetCol}${endRow}` : `${sheet}${targetCol}:${targetCol}`;
    const exact = String(rangeLookup || '').toUpperCase().includes('FALSE') || rangeLookup === '0';
    const converted = `=XLOOKUP(${lookup}, ${lookupRange}, ${returnRange}, "Not found")`;

    return {
      converted,
      parts: [
        { label: 'Lookup value', value: lookup },
        { label: 'Lookup range', value: lookupRange },
        { label: 'Return range', value: returnRange },
        { label: 'Match mode', value: exact ? 'Exact (0)' : 'Exact — XLOOKUP always defaults to exact' },
        { label: 'Original column index', value: `${indexRaw} → ${targetCol}` },
        { label: 'Table ends at', value: `${startCol}:${endCol}` },
      ],
      warning: !exact ? 'Your VLOOKUP used approximate match. XLOOKUP needs ,-1 or ,1 as the fifth argument for that behaviour.' : null,
    };
  }, [formula]);

  return (
    <div className="space-y-5">
      <Panel>
        <Field label="Your VLOOKUP">
          <textarea
            rows={3}
            value={formula}
            onChange={(event) => setFormula(event.target.value)}
            className="w-full resize-y rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-xs text-white outline-none focus:border-electric-400"
          />
        </Field>

        {result.error ? (
          <div className="mt-4"><Callout tone="error">{result.error}</Callout></div>
        ) : (
          <>
            <div className="mt-4 rounded-xl border border-slate-800 bg-navy-950 p-3">
              <span className="text-[10px] uppercase tracking-wider text-slate-500">XLOOKUP equivalent</span>
              <code className="mt-1 block break-all font-mono text-xs text-emerald-300">{result.converted}</code>
            </div>
            <div className="mt-3 grid gap-2">
              {result.parts.map((part) => (
                <div key={part.label} className="flex items-center justify-between gap-3 rounded-lg border border-slate-800 bg-navy-950 px-3 py-2 text-[11px]">
                  <span className="text-slate-500">{part.label}</span>
                  <span className="font-mono text-slate-200">{part.value}</span>
                </div>
              ))}
            </div>
            {result.warning && <div className="mt-3"><Callout tone="warn">{result.warning}</Callout></div>}
          </>
        )}
      </Panel>
      <InfoList
        title="Why XLOOKUP is worth learning"
        items={[
          'It can look to the left — VLOOKUP cannot.',
          'Inserting a column does not break it; VLOOKUP’s column number silently shifts.',
          'The fourth argument is a readable not-found value instead of a #N/A error.',
          'XLOOKUP exists in Excel 365, Excel 2021 and LibreOffice 24.2+; older versions need INDEX + MATCH.',
        ]}
      />
    </div>
  );
};

export const DateCalculator = () => {
  const [start, setStart] = useState('2026-01-01');
  const [end, setEnd] = useState('2026-12-31');

  const result = useMemo(() => {
    const from = new Date(start);
    const to = new Date(end);
    if (Number.isNaN(from.getTime()) || Number.isNaN(to.getTime())) return { error: 'Pick a valid start and end date.' };
    if (to < from) return { error: 'The end date must be after the start date.' };
    const dayMs = 86400000;
    const calendarDays = Math.round((to - from) / dayMs) + 1;

    let workingDays = 0;
    for (let time = from.getTime(); time <= to.getTime(); time += dayMs) {
      const day = new Date(time).getDay();
      if (day !== 0 && day !== 6) workingDays += 1;
    }

    let years = to.getFullYear() - from.getFullYear();
    let months = to.getMonth() - from.getMonth();
    let days = to.getDate() - from.getDate();
    if (days < 0) {
      months -= 1;
      const previousMonth = new Date(to.getFullYear(), to.getMonth(), 0).getDate();
      days += previousMonth;
    }
    if (months < 0) {
      years -= 1;
      months += 12;
    }

    return {
      calendarDays,
      workingDays,
      weekendDays: calendarDays - workingDays,
      span: `${years} y ${months} m ${days} d`,
      years,
    };
  }, [start, end]);

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-2">
          <Field label="Start date">
            <input type="date" value={start} onChange={(event) => setStart(event.target.value)} className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400" />
          </Field>
          <Field label="End date">
            <input type="date" value={end} onChange={(event) => setEnd(event.target.value)} className="w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400" />
          </Field>
        </div>

        {result.error ? (
          <div className="mt-4"><Callout tone="error">{result.error}</Callout></div>
        ) : (
          <>
            <div className="mt-5 grid gap-3 sm:grid-cols-4">
              <Stat label="Calendar days" value={result.calendarDays} tone="text-cyan-300" />
              <Stat label="Working days" value={result.workingDays} tone="text-emerald-400" />
              <Stat label="Weekend days" value={result.weekendDays} />
              <Stat label="Exact span" value={result.span} />
            </div>
            <div className="mt-4 space-y-2">
              {[
                { label: 'Calendar days', value: `=B2-A2` },
                { label: 'Working days', value: '=NETWORKDAYS(A2,B2)' },
                { label: 'Working days with holidays', value: '=NETWORKDAYS(A2,B2,Holidays!A:A)' },
                { label: 'Age or tenure in years', value: '=DATEDIF(A2,B2,"Y")' },
                { label: 'Exact years/months/days', value: '=DATEDIF(A2,B2,"Y")&"y "&DATEDIF(A2,B2,"YM")&"m "&DATEDIF(A2,B2,"MD")&"d"' },
                { label: 'End of the month', value: '=EOMONTH(A2,0)' },
              ].map((item) => (
                <div key={item.label} className="flex flex-col gap-1 rounded-lg border border-slate-800 bg-navy-950 px-3 py-2 text-[11px] sm:flex-row sm:items-center sm:justify-between">
                  <span className="text-slate-500">{item.label}</span>
                  <code className="font-mono text-cyan-300">{item.value}</code>
                </div>
              ))}
            </div>
            <p className="mt-3 text-[11px] text-slate-500">
              NETWORKDAYS excludes Saturday and Sunday. Indian offices often work Saturdays, so subtract those manually or pass a custom holiday list.
            </p>
          </>
        )}
      </Panel>
    </div>
  );
};

const parseCsv = (text) => {
  const rows = [];
  let row = [];
  let cell = '';
  let quoted = false;
  for (let index = 0; index < text.length; index += 1) {
    const char = text[index];
    if (quoted) {
      if (char === '"' && text[index + 1] === '"') { cell += '"'; index += 1; }
      else if (char === '"') quoted = false;
      else cell += char;
      continue;
    }
    if (char === '"') { quoted = true; continue; }
    if (char === ',') { row.push(cell); cell = ''; continue; }
    if (char === '\n') { row.push(cell); rows.push(row); row = []; cell = ''; continue; }
    if (char === '\r') continue;
    cell += char;
  }
  if (cell || row.length) { row.push(cell); rows.push(row); }
  return rows.filter((items) => items.some((item) => item.trim() !== ''));
};

export const CsvJson = () => {
  const [mode, setMode] = useState('csv-to-json');
  const [input, setInput] = useState('name,role,tools\nRahul,Founder,CCNA\nPriya,Student,Linux');

  const result = useMemo(() => {
    try {
      if (mode === 'csv-to-json') {
        const rows = parseCsv(input);
        if (rows.length < 2) return { error: 'Include a header row and at least one data row.' };
        const headers = rows[0].map((header) => header.trim());
        const objects = rows.slice(1).map((row) => {
          const item = {};
          headers.forEach((header, index) => { item[header] = (row[index] || '').trim(); });
          return item;
        });
        return { output: JSON.stringify(objects, null, 2), count: objects.length };
      }
      const parsed = JSON.parse(input);
      if (!Array.isArray(parsed)) return { error: 'JSON must be an array of objects to become CSV rows.' };
      const headers = Array.from(new Set(parsed.flatMap((item) => Object.keys(item))));
      const lines = [headers.join(',')];
      parsed.forEach((item) => {
        lines.push(headers.map((header) => {
          const value = item[header] === undefined || item[header] === null ? '' : String(item[header]);
          return /[",\n]/.test(value) ? `"${value.replace(/"/g, '""')}"` : value;
        }).join(','));
      });
      return { output: lines.join('\n'), count: parsed.length };
    } catch (error) {
      return { error: error.message };
    }
  }, [input, mode]);

  return (
    <div className="space-y-5">
      <Panel>
        <div className="mb-3 flex flex-wrap gap-2">
          {[
            { id: 'csv-to-json', label: 'CSV → JSON' },
            { id: 'json-to-csv', label: 'JSON → CSV' },
          ].map((item) => (
            <button key={item.id} type="button" onClick={() => setMode(item.id)} className={`rounded-xl px-3.5 py-1.5 text-xs font-semibold transition ${mode === item.id ? 'bg-electric-600 text-white' : 'border border-slate-700 text-slate-400'}`}>
              {item.label}
            </button>
          ))}
          {result.output && (
            <button type="button" onClick={() => { if (navigator.clipboard) navigator.clipboard.writeText(result.output); }} className="ml-auto rounded-xl border border-slate-700 px-3 py-1.5 text-xs text-slate-300 hover:text-white">
              Copy output
            </button>
          )}
        </div>
        <div className="grid gap-3 lg:grid-cols-2">
          <Field label={mode === 'csv-to-json' ? 'CSV input' : 'JSON input'}>
            <textarea rows={12} value={input} onChange={(event) => setInput(event.target.value)} className="w-full resize-y rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-[11px] text-white outline-none focus:border-electric-400" />
          </Field>
          <Field label="Output">
            <pre className="h-[276px] overflow-auto rounded-xl border border-slate-800 bg-navy-950 p-3 font-mono text-[11px] text-emerald-300">{result.output || ''}</pre>
          </Field>
        </div>
        {result.error ? (
          <div className="mt-3"><Callout tone="error">{result.error}</Callout></div>
        ) : (
          <p className="mt-3 text-[11px] text-slate-500">{result.count} rows converted · commas and quotes are escaped automatically</p>
        )}
      </Panel>
      <InfoList
        title="Using this in real work"
        items={[
          'Export an Excel sheet as CSV, convert to JSON, then paste it into an API test.',
          'Keep the header row in the first line — it becomes the JSON keys.',
          'Numbers stay strings here; cast them in code if the API expects numbers.',
          'Nothing is uploaded, so student marksheets and salary data stay on your machine.',
        ]}
      />
    </div>
  );
};
