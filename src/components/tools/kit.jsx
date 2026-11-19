import React, { useMemo, useState } from 'react';
import { Callout, Field, Panel, Stat } from './toolUi';

// A tiny declarative engine for calculator-style tools.
// A tool declares fields + a compute(values) function; the engine renders the
// form, the live result grid and any note. This keeps ~30 simple tools readable
// and consistent instead of 30 bespoke layouts.

const controlClass =
  'w-full rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-white outline-none focus:border-electric-400';

const renderField = (field, value, onChange) => {
  if (field.type === 'select') {
    return (
      <select value={value} onChange={(e) => onChange(field.numeric ? Number(e.target.value) : e.target.value)} className="w-full cursor-pointer rounded-xl border border-slate-700 bg-navy-950 px-3.5 py-2.5 font-mono text-sm text-cyan-300 outline-none">
        {field.options.map((option) => (
          <option key={String(option.value)} value={option.value}>
            {option.label}
          </option>
        ))}
      </select>
    );
  }
  if (field.type === 'text') {
    return <input value={value ?? ''} onChange={(e) => onChange(e.target.value)} placeholder={field.placeholder} className={controlClass} />;
  }
  if (field.type === 'checkbox') {
    return (
      <label className="flex cursor-pointer items-center gap-2 py-2.5 text-xs text-slate-300">
        <input type="checkbox" checked={Boolean(value)} onChange={(e) => onChange(e.target.checked)} className="h-4 w-4 accent-electric-500" />
        <span>{field.checkboxLabel || field.label}</span>
      </label>
    );
  }
  return (
    <input
      type="number"
      min={field.min}
      max={field.max}
      step={field.step || 'any'}
      value={value ?? ''}
      onChange={(e) => onChange(e.target.value)}
      className={controlClass}
    />
  );
};

export function FormTool({ fields, compute, children }) {
  const [values, setValues] = useState(() =>
    Object.fromEntries(fields.map((field) => [field.key, field.default ?? ''])),
  );

  const result = useMemo(() => {
    try {
      return compute(values) || {};
    } catch (error) {
      return { error: error.message || 'Could not compute a result with these inputs.' };
    }
  }, [values, compute]);

  return (
    <div className="space-y-5">
      <Panel>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {fields.map((field) => (
            <Field key={field.key} label={field.label} hint={field.hint}>
              {renderField(field, values[field.key], (next) =>
                setValues((prev) => ({ ...prev, [field.key]: next })),
              )}
            </Field>
          ))}
        </div>

        {result.error && (
          <div className="mt-4">
            <Callout tone="error">{result.error}</Callout>
          </div>
        )}

        {!result.error && result.stats?.length > 0 && (
          <div className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
            {result.stats.map((stat) => (
              <Stat key={stat.label} label={stat.label} value={stat.value} hint={stat.hint} tone={stat.tone} />
            ))}
          </div>
        )}

        {!result.error && result.lines?.length > 0 && (
          <div className="mt-4 space-y-2">
            {result.lines.map((line) => (
              <div key={line.label} className="flex items-center justify-between gap-3 rounded-xl border border-slate-800 bg-navy-950 px-3.5 py-2.5 text-xs">
                <span className="text-slate-400">{line.label}</span>
                <span className="font-mono text-slate-100">{line.value}</span>
              </div>
            ))}
          </div>
        )}

        {!result.error && result.note && (
          <div className="mt-4">
            <Callout tone={result.noteTone || 'info'}>{result.note}</Callout>
          </div>
        )}
      </Panel>
      {children}
    </div>
  );
}

export const InfoList = ({ title, items }) => (
  <Panel>
    <h2 className="mb-3 text-sm font-bold uppercase tracking-wider text-slate-300">{title}</h2>
    <ul className="space-y-2 text-xs leading-relaxed text-slate-400">
      {items.map((item) => (
        <li key={item} className="flex gap-2">
          <span className="text-electric-400">•</span>
          <span>{item}</span>
        </li>
      ))}
    </ul>
  </Panel>
);

export const StatGrid = ({ items }) => (
  <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
    {items.map((item) => (
      <Stat key={item.label} label={item.label} value={item.value} hint={item.hint} tone={item.tone} />
    ))}
  </div>
);

