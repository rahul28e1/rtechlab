import React, { useMemo, useState } from 'react';
import { Callout, Panel } from './toolUi';

const FORMULAS = [
  { name: 'XLOOKUP', category: 'Lookup', syntax: '=XLOOKUP(lookup_value, lookup_array, return_array, [if_not_found])', example: '=XLOOKUP(A2, Sheet2!A:A, Sheet2!C:C, "Not found")', note: 'Replaces VLOOKUP and INDEX/MATCH. Works left or right, and has a built-in not-found value.' },
  { name: 'VLOOKUP', category: 'Lookup', syntax: '=VLOOKUP(lookup_value, table_array, col_index, [range_lookup])', example: '=VLOOKUP(A2, $A$2:$D$100, 4, FALSE)', note: 'Column number is counted inside the table. FALSE = exact match; use it almost always.' },
  { name: 'INDEX + MATCH', category: 'Lookup', syntax: '=INDEX(return_range, MATCH(lookup_value, lookup_range, 0))', example: '=INDEX(C:C, MATCH(A2, A:A, 0))', note: 'Still the fastest in very large sheets and works on older Excel versions.' },
  { name: 'IF', category: 'Logic', syntax: '=IF(test, value_if_true, value_if_false)', example: '=IF(B2>=40, "Pass", "Fail")', note: 'Nest with IFS instead once you pass two conditions.' },
  { name: 'IFS', category: 'Logic', syntax: '=IFS(test1, value1, test2, value2, …)', example: '=IFS(B2>=90,"A", B2>=75,"B", B2>=40,"C", TRUE,"Fail")', note: 'Evaluated in order, so put the highest grade first.' },
  { name: 'AND / OR', category: 'Logic', syntax: '=AND(cond1, cond2)  |  =OR(cond1, cond2)', example: '=IF(AND(B2>40, C2="Present"), "Eligible", "No")', note: 'Returns TRUE/FALSE; combine with IF for readable rules.' },
  { name: 'COUNTIF', category: 'Counting', syntax: '=COUNTIF(range, criteria)', example: '=COUNTIF(C:C, "Delhi")', note: 'Criteria can use wildcards: "Del*" matches Delhi and Dehradun.' },
  { name: 'COUNTIFS', category: 'Counting', syntax: '=COUNTIFS(range1, crit1, range2, crit2, …)', example: '=COUNTIFS(C:C,"Delhi", D:D,">500")', note: 'Every pair is an AND condition.' },
  { name: 'SUMIF / SUMIFS', category: 'Maths', syntax: '=SUMIF(range, criteria, [sum_range])  |  =SUMIFS(sum_range, range1, crit1, …)', example: '=SUMIFS(E:E, C:C, "Delhi", D:D, ">2026-01-01")', note: 'In SUMIFS the sum range comes first — the classic mistake in exams.' },
  { name: 'SUBTOTAL', category: 'Maths', syntax: '=SUBTOTAL(function_num, range)', example: '=SUBTOTAL(9, E2:E500)', note: 'Function 9 = SUM and ignores rows hidden by a filter, unlike SUM.' },
  { name: 'ROUND / ROUNDUP / ROUNDDOWN', category: 'Maths', syntax: '=ROUND(number, digits)', example: '=ROUND(A2/3, 2)', note: 'Use ROUND for money; formatting alone does not change the stored value.' },
  { name: 'TEXT', category: 'Text', syntax: '=TEXT(value, format_text)', example: '=TEXT(TODAY(), "dd-mmm-yyyy")', note: 'Turns a date or number into display text — the result is no longer a real date.' },
  { name: 'CONCAT / TEXTJOIN', category: 'Text', syntax: '=TEXTJOIN(delimiter, ignore_empty, text1, …)', example: '=TEXTJOIN(", ", TRUE, A2:A10)', note: 'Ampersand (&) still works for two or three pieces; TEXTJOIN handles ranges.' },
  { name: 'LEFT / RIGHT / MID', category: 'Text', syntax: '=MID(text, start_num, num_chars)', example: '=MID(A2, 4, 5)', note: 'Strings are 1-indexed: MID("ABCDE",1,2) returns "AB".' },
  { name: 'TRIM / CLEAN', category: 'Text', syntax: '=TRIM(text)', example: '=TRIM(A2)', note: 'Removes extra spaces; CLEAN removes non-printable characters from imported data.' },
  { name: 'SUBSTITUTE', category: 'Text', syntax: '=SUBSTITUTE(text, old_text, new_text, [instance])', example: '=SUBSTITUTE(A2, " ", "")', note: 'Case-sensitive and replaces all occurrences unless you name an instance.' },
  { name: 'TEXTSPLIT', category: 'Text', syntax: '=TEXTSPLIT(text, col_delimiter, [row_delimiter])', example: '=TEXTSPLIT(A2, ",")', note: 'Excel 365 only — spills into multiple cells, no Power Query needed.' },
  { name: 'LEN', category: 'Text', syntax: '=LEN(text)', example: '=LEN(A2)', note: 'Counts characters including spaces; useful for validating phone numbers.' },
  { name: 'UNIQUE', category: 'Dynamic arrays', syntax: '=UNIQUE(range)', example: '=UNIQUE(C2:C500)', note: 'Spills a de-duplicated list. Combine with SORT for a clean dropdown source.' },
  { name: 'FILTER', category: 'Dynamic arrays', syntax: '=FILTER(range, include, [if_empty])', example: '=FILTER(A2:E500, C2:C500="Delhi", "No rows")', note: 'The modern replacement for copy + filter. Result updates automatically.' },
  { name: 'SORT / SORTBY', category: 'Dynamic arrays', syntax: '=SORT(range, [sort_index], [order])', example: '=SORT(A2:C100, 3, -1)', note: 'Order −1 is descending; SORTBY sorts by another range entirely.' },
  { name: 'SEQUENCE', category: 'Dynamic arrays', syntax: '=SEQUENCE(rows, [columns], [start], [step])', example: '=SEQUENCE(12,1,1,1)', note: 'Builds serial numbers or date series without dragging.' },
  { name: 'LET', category: 'Advanced', syntax: '=LET(name1, value1, …, calculation)', example: '=LET(total, SUM(E:E), tax, total*0.18, total+tax)', note: 'Names a value once instead of repeating the same formula six times.' },
  { name: 'LAMBDA', category: 'Advanced', syntax: '=LAMBDA(param1, …, calculation)', example: '=LAMBDA(x, x*0.18)(A2)', note: 'Write your own function, then save it in Name Manager for the whole workbook.' },
  { name: 'IFERROR', category: 'Error handling', syntax: '=IFERROR(value, value_if_error)', example: '=IFERROR(A2/B2, 0)', note: 'Hides #DIV/0! and #N/A. Prefer a meaningful text result over 0 in reports.' },
  { name: 'PIVOTBY / GROUPBY', category: 'Advanced', syntax: '=PIVOTBY(row_fields, col_fields, values, function)', example: '=PIVOTBY(C2:C500, , E2:E500, SUM)', note: 'Formula version of a PivotTable — Excel 365 Insider builds only.' },
  { name: 'EOMONTH / TODAY', category: 'Date & time', syntax: '=EOMONTH(start_date, months)', example: '=EOMONTH(TODAY(), 0)', note: 'Last day of the month — the base of almost every salary or invoice sheet.' },
  { name: 'NETWORKDAYS', category: 'Date & time', syntax: '=NETWORKDAYS(start_date, end_date, [holidays])', example: '=NETWORKDAYS(A2, B2, Holidays!A:A)', note: 'Counts working days only; include a holiday list or the answer will be wrong.' },
  { name: 'DATEDIF', category: 'Date & time', syntax: '=DATEDIF(start_date, end_date, "Y")', example: '=DATEDIF(A2, TODAY(), "Y")', note: 'Undocumented but supported: gives exact age or tenure in years, months or days.' },
  { name: 'CONDITIONAL FORMATTING (formula)', category: 'Formatting', syntax: 'Home → Conditional Formatting → New Rule → Use a formula', example: '=$E2>5000', note: 'Lock the column, not the row ($E2), so the rule applies across the whole row.' },
  { name: 'DATA VALIDATION (list)', category: 'Formatting', syntax: 'Data → Data Validation → List', example: 'Source: =Departments  (a named range)', note: 'Use a named range, not a typed list, so the dropdown updates itself.' },
];

const SHORTCUTS = [
  { app: 'Excel', keys: 'Ctrl + T', action: 'Convert a range into a real Table (auto-expanding, structured references).' },
  { app: 'Excel', keys: 'Ctrl + Shift + L', action: 'Toggle AutoFilter on the current range.' },
  { app: 'Excel', keys: 'Alt + =', action: 'AutoSum the column above the active cell.' },
  { app: 'Excel', keys: 'Ctrl + ;', action: 'Insert today’s date as a static value.' },
  { app: 'Excel', keys: 'Ctrl + Shift + ;', action: 'Insert the current time.' },
  { app: 'Excel', keys: 'F4', action: 'Cycle absolute/relative references ($A$1 → A$1 → $A1 → A1).' },
  { app: 'Excel', keys: 'Ctrl + D / Ctrl + R', action: 'Fill down / fill right from the cell above or to the left.' },
  { app: 'Excel', keys: 'Ctrl + Shift + ↓', action: 'Select to the last non-empty cell in the column.' },
  { app: 'Excel', keys: 'Alt + E, S, V', action: 'Paste Special (values only is the daily one).' },
  { app: 'Excel', keys: 'Ctrl + Page Up / Page Down', action: 'Move between worksheet tabs.' },
  { app: 'Excel', keys: 'Ctrl + Shift + +', action: 'Insert rows, columns or cells.' },
  { app: 'Excel', keys: 'Ctrl + 1', action: 'Open Format Cells — number, alignment, protection.' },
  { app: 'Excel', keys: 'Ctrl + Arrow keys', action: 'Jump to the edge of the data block.' },
  { app: 'Excel', keys: 'Alt + H + O + I', action: 'Auto-fit column width.' },
  { app: 'Excel', keys: 'Ctrl + Shift + $ / % / #', action: 'Apply currency / percentage / date format instantly.' },
  { app: 'Word', keys: 'Ctrl + Shift + C / V', action: 'Copy formatting from one block, paste it onto another.' },
  { app: 'Word', keys: 'F4', action: 'Repeat the last action — the most underused key in Office.' },
  { app: 'Word', keys: 'Ctrl + Alt + 1 / 2 / 3', action: 'Apply Heading 1 / 2 / 3 for a navigable document.' },
  { app: 'Word', keys: 'Shift + F5', action: 'Jump back to where you last edited.' },
  { app: 'Word', keys: 'Ctrl + Enter', action: 'Insert a page break.' },
  { app: 'Word', keys: 'Ctrl + Shift + 8', action: 'Show paragraph marks and spacing (the real cause of weird layout).' },
  { app: 'Word', keys: 'Alt + Shift + ↑ / ↓', action: 'Move a paragraph or list item up or down.' },
  { app: 'Word', keys: 'Ctrl + K', action: 'Insert a hyperlink.' },
  { app: 'Word', keys: 'Ctrl + Shift + N', action: 'Reset selection to Normal style.' },
  { app: 'PowerPoint', keys: 'Ctrl + M', action: 'New slide using the same layout.' },
  { app: 'PowerPoint', keys: 'Ctrl + Shift + G', action: 'Group selected objects.' },
  { app: 'PowerPoint', keys: 'Alt + Shift + ↑ / ↓', action: 'Reorder slides in the pane.' },
  { app: 'PowerPoint', keys: 'F5 / Shift + F5', action: 'Start the show from the beginning / from the current slide.' },
  { app: 'PowerPoint', keys: 'Ctrl + D', action: 'Duplicate the selected object or slide.' },
  { app: 'PowerPoint', keys: 'Ctrl + Shift + C / V', action: 'Copy and paste formatting between shapes.' },
  { app: 'PowerPoint', keys: 'Ctrl + G', action: 'Group objects so they scale together.' },
  { app: 'PowerPoint', keys: 'Alt + F10', action: 'Open the Selection Pane — rename or hide overlapping objects.' },
  { app: 'Outlook', keys: 'Ctrl + Shift + M', action: 'New message.' },
  { app: 'Outlook', keys: 'Ctrl + R / Ctrl + Shift + R', action: 'Reply / reply all.' },
  { app: 'Outlook', keys: 'Ctrl + Shift + V', action: 'Move the selected mail to a folder.' },
  { app: 'Outlook', keys: 'Ctrl + Alt + Q', action: 'Jump to the Mail view.' },
  { app: 'Outlook', keys: 'Ctrl + Q', action: 'Mark as read.' },
  { app: 'Outlook', keys: 'Alt + S', action: 'Send the message.' },
  { app: 'Outlook', keys: 'Ctrl + Shift + G', action: 'Open the search-with-options dialog.' },
  { app: 'All Office apps', keys: 'F12', action: 'Save As — never overwrite the original by accident.' },
  { app: 'All Office apps', keys: 'Ctrl + F1', action: 'Collapse or pin the ribbon for a bigger workspace.' },
  { app: 'All Office apps', keys: 'Ctrl + Shift + F1', action: 'Full screen: hide the ribbon entirely.' },
  { app: 'All Office apps', keys: 'Alt + Q', action: 'Search commands by name — faster than hunting through tabs.' },
];

const TABS = [
  { id: 'formulas', label: 'Excel formulas' },
  { id: 'shortcuts', label: 'Shortcuts' },
];

export const OfficeToolkit = () => {
  const [tab, setTab] = useState('formulas');
  const [query, setQuery] = useState('');
  const [app, setApp] = useState('All');

  const apps = useMemo(() => ['All', ...new Set(SHORTCUTS.map((item) => item.app))], []);

  const formulas = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return FORMULAS;
    return FORMULAS.filter((item) =>
      [item.name, item.category, item.syntax, item.example, item.note].join(' ').toLowerCase().includes(q),
    );
  }, [query]);

  const shortcuts = useMemo(() => {
    const q = query.trim().toLowerCase();
    return SHORTCUTS.filter((item) => {
      const matchesApp = app === 'All' || item.app === app;
      const matchesQuery = !q || [item.keys, item.action, item.app].join(' ').toLowerCase().includes(q);
      return matchesApp && matchesQuery;
    });
  }, [query, app]);

  const [copied, setCopied] = useState('');
  const copy = (text) => {
    if (typeof navigator !== 'undefined' && navigator.clipboard) {
      navigator.clipboard.writeText(text);
      setCopied(text);
      setTimeout(() => setCopied(''), 1500);
    }
  };

  return (
    <div className="space-y-5">
      <Panel>
        <div className="flex flex-wrap items-center gap-2">
          {TABS.map((item) => (
            <button
              key={item.id}
              type="button"
              onClick={() => setTab(item.id)}
              className={`rounded-xl px-3.5 py-1.5 text-xs font-semibold transition ${tab === item.id ? 'bg-electric-600 text-white' : 'border border-slate-700 bg-navy-950 text-slate-400 hover:text-white'}`}
            >
              {item.label}
            </button>
          ))}
          <input
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder={tab === 'formulas' ? 'Try "lookup", "if", "sum", "date"…' : 'Try "paste", "filter", "slide"…'}
            className="ml-auto w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2 font-mono text-xs text-white outline-none focus:border-electric-400 sm:w-72"
          />
        </div>

        {tab === 'shortcuts' && (
          <div className="mt-3 flex flex-wrap gap-1.5">
            {apps.map((item) => (
              <button
                key={item}
                type="button"
                onClick={() => setApp(item)}
                className={`rounded-md border px-2 py-1 text-[11px] transition ${app === item ? 'border-electric-500 text-white' : 'border-slate-800 text-slate-400 hover:text-white'}`}
              >
                {item}
              </button>
            ))}
          </div>
        )}
      </Panel>

      {tab === 'formulas' && (
        <div className="space-y-2">
          {formulas.length === 0 && (
            <Panel>
              <p className="text-xs text-slate-400">No formula matches “{query}”. Try a function name like XLOOKUP or a category like Lookup.</p>
            </Panel>
          )}
          {formulas.map((item) => (
            <Panel key={item.name} className="p-4 sm:p-4">
              <div className="flex flex-wrap items-center gap-2">
                <h3 className="font-mono text-sm font-bold text-white">{item.name}</h3>
                <span className="rounded-md border border-slate-700 px-1.5 py-0.5 text-[10px] uppercase tracking-wider text-slate-400">{item.category}</span>
              </div>
              <p className="mt-2 font-mono text-[11px] text-cyan-300">{item.syntax}</p>
              <div className="mt-2 flex items-start justify-between gap-3 rounded-lg border border-slate-800 bg-navy-950 px-3 py-2">
                <code className="break-all font-mono text-[11px] text-emerald-300">{item.example}</code>
                <button type="button" onClick={() => copy(item.example)} className="flex-shrink-0 text-[10px] uppercase tracking-wider text-slate-500 hover:text-white">
                  {copied === item.example ? 'copied' : 'copy'}
                </button>
              </div>
              <p className="mt-2 text-[11px] leading-relaxed text-slate-400">{item.note}</p>
            </Panel>
          ))}
        </div>
      )}

      {tab === 'shortcuts' && (
        <Panel>
          <div className="divide-y divide-slate-800/80">
            {shortcuts.length === 0 && <p className="py-3 text-xs text-slate-400">No shortcut matches that search.</p>}
            {shortcuts.map((item) => (
              <div key={item.app + item.keys} className="flex flex-col gap-1 py-2 sm:flex-row sm:items-center sm:justify-between">
                <div className="flex items-center gap-3">
                  <kbd className="rounded-md border border-slate-700 bg-navy-950 px-2 py-1 font-mono text-[11px] text-cyan-300">{item.keys}</kbd>
                  <span className="text-xs text-slate-300">{item.action}</span>
                </div>
                <span className="text-[10px] uppercase tracking-wider text-slate-500 sm:ml-4">{item.app}</span>
              </div>
            ))}
          </div>
        </Panel>
      )}

      <Callout tone="info">
        Practise three shortcuts at a time until they are muscle memory. In an interview or a timed test, speed on the sheet matters as much as the formula itself.
      </Callout>
    </div>
  );
};

export default OfficeToolkit;
