import React, { useEffect, useMemo, useRef, useState } from 'react';
import {
  Play,
  Pause,
  RotateCcw,
  ChevronLeft,
  ChevronRight,
  ChevronDown,
  Search,
  Network,
  ListOrdered,
  Layers,
  Info,
} from 'lucide-react';
import { protocolLessons } from '../../data/protocolLessons';
import {
  lessonMeta,
  lessonColors,
  stepProtocol,
  stepProtocolColor,
  stepTime,
  stepSize,
} from '../../data/protocolMeta';
import { NetworkScene } from './NetworkScene';

const PLAYBACK_MS = 1200;
const OSI_LAYERS = [1, 2, 3, 4, 5, 6, 7];

const LAYER_TABS = [
  { key: 'ALL', label: 'All' },
  { key: 'CORE', label: 'Core' },
  { key: 'APPLICATION', label: 'Application' },
  { key: 'SECURITY', label: 'Security' },
];

const layoutFields = (fields = []) => {
  let offset = 0;
  return fields.map((field, index) => {
    const bytes = (field.hex || '').trim().split(/\s+/).filter(Boolean);
    const position = offset;
    offset += bytes.length;
    return { ...field, index, bytes, position };
  });
};

const HexDump = ({ fields, activeField, onSelectField }) => {
  const flat = [];
  fields.forEach((field) => {
    field.bytes.forEach((byte) => flat.push({ byte, fieldIndex: field.index }));
  });

  if (flat.length === 0) {
    return (
      <p className="text-[11px] leading-relaxed text-[#6e6e73]">
        No binary fields decoded for this message — this exchange is textual. The headers listed beside it are still the
        fields a capture would show.
      </p>
    );
  }

  const rows = [];
  for (let i = 0; i < flat.length; i += 8) rows.push({ offset: i, bytes: flat.slice(i, i + 8) });

  return (
    <div className="rounded-xl bg-black/50 p-3 font-mono text-[11px] leading-6">
      {rows.map((row) => (
        <div key={row.offset} className="flex items-center gap-3">
          <span className="select-none text-[#48484a]">{row.offset.toString(16).padStart(4, '0').toUpperCase()}</span>
          <div className="flex flex-wrap gap-1">
            {row.bytes.map((entry, index) => (
              <button
                key={`${row.offset}-${index}`}
                onClick={() => onSelectField(entry.fieldIndex)}
                className={`rounded px-1 transition-colors duration-200 ${
                  activeField === entry.fieldIndex ? 'bg-accent text-white' : 'text-[#a1a1a6] hover:text-white'
                }`}
              >
                {entry.byte.toUpperCase()}
              </button>
            ))}
          </div>
        </div>
      ))}
    </div>
  );
};

export const ProtocolExplorer = () => {
  const [lessonId, setLessonId] = useState(protocolLessons[0].id);
  const [stepIndex, setStepIndex] = useState(0);
  const [playing, setPlaying] = useState(false);
  const [speed, setSpeed] = useState(1);
  const [view, setView] = useState('network');
  const [activeField, setActiveField] = useState(0);
  const [query, setQuery] = useState('');
  const [layerFilter, setLayerFilter] = useState('ALL');
  const [osiFilter, setOsiFilter] = useState(null);
  const [expandedLessonId, setExpandedLessonId] = useState(protocolLessons[0].id);
  const timerRef = useRef(null);

  const lesson = useMemo(
    () => protocolLessons.find((item) => item.id === lessonId) || protocolLessons[0],
    [lessonId]
  );

  const meta = lessonMeta[lesson.id] || {};
  const step = lesson.steps[stepIndex];
  const fields = useMemo(() => layoutFields(step.fields), [step]);
  const actorLabel = (id) => lesson.actors.find((actor) => actor.id === id)?.label || id;

  const protocolsInLesson = useMemo(
    () => [...new Set(lesson.steps.map((item) => stepProtocol(lesson.id, item.title)))],
    [lesson]
  );

  const selectLesson = (id) => {
    setLessonId(id);
    setStepIndex(0);
    setActiveField(0);
    setPlaying(false);
    setExpandedLessonId(id);
  };

  const goToStep = (index) => {
    setStepIndex(Math.max(0, Math.min(lesson.steps.length - 1, index)));
    setActiveField(0);
  };

  // Autoplay
  useEffect(() => {
    if (!playing) return undefined;
    timerRef.current = setTimeout(() => {
      if (stepIndex >= lesson.steps.length - 1) {
        setPlaying(false);
      } else {
        setStepIndex(stepIndex + 1);
        setActiveField(0);
      }
    }, PLAYBACK_MS / speed);
    return () => clearTimeout(timerRef.current);
  }, [playing, stepIndex, speed, lesson]);

  // Keyboard shortcuts (Ctrl+K stays reserved for site search)
  useEffect(() => {
    const onKey = (event) => {
      const target = event.target;
      const typing =
        target && (target.tagName === 'INPUT' || target.tagName === 'SELECT' || target.tagName === 'TEXTAREA');
      if (typing) return;
      if (event.code === 'Space') {
        event.preventDefault();
        setPlaying((value) => !value);
      } else if (event.key === 'ArrowRight') {
        event.preventDefault();
        setPlaying(false);
        setStepIndex(Math.min(lesson.steps.length - 1, stepIndex + 1));
        setActiveField(0);
      } else if (event.key === 'ArrowLeft') {
        event.preventDefault();
        setPlaying(false);
        setStepIndex(Math.max(0, stepIndex - 1));
        setActiveField(0);
      }
    };
    window.addEventListener('keydown', onKey);
    return () => window.removeEventListener('keydown', onKey);
  }, [stepIndex, lesson]);

  const layerCounts = useMemo(() => {
    const counts = { ALL: protocolLessons.length, CORE: 0, APPLICATION: 0, SECURITY: 0 };
    protocolLessons.forEach((item) => {
      const key = item.layer.toUpperCase();
      if (counts[key] !== undefined) counts[key] += 1;
    });
    return counts;
  }, []);

  const visibleLessons = useMemo(() => {
    const term = query.trim().toLowerCase();
    return protocolLessons.filter((item) => {
      const layerOk = layerFilter === 'ALL' || item.layer.toUpperCase() === layerFilter;
      const osiOk = !osiFilter || lessonMeta[item.id]?.osi === osiFilter;
      const searchOk =
        !term ||
        item.name.toLowerCase().includes(term) ||
        item.layer.toLowerCase().includes(term) ||
        item.summary.toLowerCase().includes(term);
      return layerOk && osiOk && searchOk;
    });
  }, [query, layerFilter, osiFilter]);

  return (
    <div className="space-y-4">
      {/* Toolbar */}
      <div className="rounded-[22px] bg-[#141416] border border-white/[0.06] px-4 py-3 flex flex-wrap items-center gap-4">
        <div className="flex items-center gap-2.5 pr-4 border-r border-white/[0.08]">
          <Layers className="w-5 h-5 text-[#2997ff]" />
          <div>
            <p className="text-[12px] font-semibold leading-none tracking-[0.14em] text-white">
              PROTOCOL EXPLORER
            </p>
            <p className="mt-1 text-[9px] leading-none tracking-[0.12em] text-[#6e6e73]">
              LEARN HOW THE INTERNET WORKS
            </p>
          </div>
        </div>

        <div className="flex items-center gap-2">
          <span className="text-[9px] tracking-[0.12em] text-[#6e6e73]">OSI LAYER</span>
          <div className="flex items-center gap-1">
            {OSI_LAYERS.map((n) => (
              <button
                key={n}
                onClick={() => setOsiFilter(osiFilter === n ? null : n)}
                className={`w-6 h-6 rounded-md text-[11px] font-medium transition-colors duration-300 ${
                  osiFilter === n
                    ? 'bg-accent text-white'
                    : 'bg-white/[0.06] text-[#a1a1a6] hover:bg-white/[0.12] hover:text-white'
                }`}
                aria-label={`Filter by OSI layer ${n}`}
              >
                {n}
              </button>
            ))}
          </div>
        </div>

        <div className="relative ml-auto w-full sm:w-60">
          <Search className="w-3.5 h-3.5 absolute left-3 top-1/2 -translate-y-1/2 text-[#6e6e73]" />
          <input
            value={query}
            onChange={(event) => setQuery(event.target.value)}
            placeholder="Search protocols"
            aria-label="Search protocols"
            className="w-full bg-black/40 rounded-full pl-8 pr-3 py-1.5 text-[12px] text-white placeholder-[#6e6e73] focus:outline-none focus:ring-2 focus:ring-accent/60"
          />
        </div>
      </div>

      {/* Dashboard grid */}
      <div className="grid grid-cols-1 xl:grid-cols-[266px_minmax(0,1fr)_236px] gap-4">
        {/* Protocol rail */}
        <aside className="order-2 xl:order-1 rounded-[22px] bg-[#141416] border border-white/[0.06] overflow-hidden flex flex-col">
          <div className="px-4 pt-4 pb-3 border-b border-white/[0.06]">
            <h3 className="text-[12px] font-semibold tracking-[0.14em] text-white">INTERNET PROTOCOLS</h3>
            <div className="mt-3 flex flex-wrap gap-1">
              {LAYER_TABS.map((tab) => (
                <button
                  key={tab.key}
                  onClick={() => setLayerFilter(tab.key)}
                  className={`rounded-full px-2.5 py-1 text-[10px] font-medium transition-colors duration-300 ${
                    layerFilter === tab.key ? 'bg-white text-black' : 'text-[#a1a1a6] hover:text-white'
                  }`}
                >
                  {tab.label} <span className="opacity-60">{layerCounts[tab.key]}</span>
                </button>
              ))}
            </div>
          </div>

          <div className="flex-1 max-h-[430px] xl:max-h-[520px] overflow-y-auto p-2 space-y-1">
            {visibleLessons.length === 0 && (
              <p className="px-3 py-4 text-[11px] text-[#6e6e73]">No protocol matches those filters.</p>
            )}

            {visibleLessons.map((item) => {
              const isActive = item.id === lesson.id;
              const isExpanded = expandedLessonId === item.id;
              return (
                <div key={item.id}>
                  <button
                    onClick={() => (isActive ? setExpandedLessonId(isExpanded ? null : item.id) : selectLesson(item.id))}
                    className={`w-full flex items-center gap-2.5 rounded-xl px-2.5 py-2 text-left transition-colors duration-300 ${
                      isActive ? 'bg-white/[0.08]' : 'hover:bg-white/[0.04]'
                    }`}
                  >
                    <span
                      className="w-2 h-2 rounded-full flex-shrink-0"
                      style={{ background: lessonColors[item.id] || '#a1a1a6' }}
                    />
                    <span className="min-w-0 flex-1">
                      <span className={`block text-[12px] ${isActive ? 'text-white' : 'text-[#d2d2d7]'}`}>
                        {item.name}
                      </span>
                      <span className="block text-[10px] text-[#6e6e73] truncate">{item.layer}</span>
                    </span>
                    <ChevronDown
                      className={`w-3.5 h-3.5 text-[#6e6e73] transition-transform duration-300 ${
                        isExpanded ? 'rotate-180' : ''
                      }`}
                    />
                  </button>

                  {isExpanded && (
                    <div className="mt-1 mb-1 space-y-0.5">
                      {item.steps.map((itemStep, index) => {
                        const isCurrent = isActive && index === stepIndex;
                        return (
                          <button
                            key={index}
                            onClick={() => {
                              selectLesson(item.id);
                              setStepIndex(index);
                              setPlaying(false);
                            }}
                            className={`w-full flex items-start gap-2 rounded-lg pl-7 pr-2 py-1.5 text-left transition-colors duration-300 ${
                              isCurrent ? 'bg-accent/15' : 'hover:bg-white/[0.04]'
                            }`}
                          >
                            <span className="mt-[2px] text-[9px] font-mono text-[#6e6e73]">{index + 1}</span>
                            <span className="min-w-0">
                              <span
                                className={`block text-[11px] truncate ${
                                  isCurrent ? 'text-white' : 'text-[#a1a1a6]'
                                }`}
                              >
                                {itemStep.title}
                              </span>
                              <span className="block text-[9px] text-[#6e6e73] truncate">
                                {item.actors.find((a) => a.id === itemStep.from)?.label} →{' '}
                                {item.actors.find((a) => a.id === itemStep.to)?.label}
                              </span>
                            </span>
                          </button>
                        );
                      })}
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        </aside>

        {/* Scene */}
        <div className="order-1 xl:order-2 rounded-[22px] bg-[#141416] border border-white/[0.06] p-3 flex flex-col min-w-0">
          <div className="flex flex-wrap items-center justify-between gap-2 px-1 pb-2">
            <div className="inline-flex items-center gap-1 rounded-full bg-black/40 p-1">
              <button
                onClick={() => setView('network')}
                className={`flex items-center gap-1.5 rounded-full px-3 py-1.5 text-[11px] font-medium transition-colors duration-300 ${
                  view === 'network' ? 'bg-white text-black' : 'text-[#a1a1a6] hover:text-white'
                }`}
              >
                <Network className="w-3.5 h-3.5" />
                Network
              </button>
              <button
                onClick={() => setView('sequence')}
                className={`flex items-center gap-1.5 rounded-full px-3 py-1.5 text-[11px] font-medium transition-colors duration-300 ${
                  view === 'sequence' ? 'bg-white text-black' : 'text-[#a1a1a6] hover:text-white'
                }`}
              >
                <ListOrdered className="w-3.5 h-3.5" />
                Sequence
              </button>
            </div>

            <span className="text-[10px] text-[#6e6e73]">
              {lesson.name} · {lesson.steps.length} messages
            </span>
          </div>

          {view === 'network' && <NetworkScene lesson={lesson} stepIndex={stepIndex} speed={speed} />}

          {view === 'sequence' && (
            <div className="rounded-[18px] bg-[#08080a] p-2 sm:p-3 max-h-[330px] overflow-y-auto space-y-1">
              {lesson.steps.map((item, index) => {
                const isCurrent = index === stepIndex;
                return (
                  <button
                    key={index}
                    onClick={() => {
                      setPlaying(false);
                      goToStep(index);
                    }}
                    className={`w-full grid grid-cols-[1fr_auto_1fr] items-center gap-3 rounded-xl px-3 py-2 text-left transition-colors duration-300 ${
                      isCurrent ? 'bg-white/[0.08]' : 'hover:bg-white/[0.04]'
                    }`}
                  >
                    <span className="text-right text-[11px] text-[#a1a1a6] truncate">{actorLabel(item.from)}</span>
                    <span className="flex items-center gap-2 w-[110px] sm:w-[170px]">
                      <span className="text-[10px] font-mono text-[#6e6e73]">
                        {String(index + 1).padStart(2, '0')}
                      </span>
                      <span className={`relative h-px flex-1 ${isCurrent ? 'bg-accent' : 'bg-white/15'}`}>
                        <span
                          className={`absolute right-0 -top-[3px] w-1.5 h-1.5 rounded-full ${
                            isCurrent ? 'bg-accent' : 'bg-white/30'
                          }`}
                        />
                      </span>
                    </span>
                    <span className="text-[11px] text-[#a1a1a6] truncate">
                      {actorLabel(item.to)}
                      <span className="ml-2 text-[10px] text-[#6e6e73]">{item.title}</span>
                    </span>
                  </button>
                );
              })}
            </div>
          )}

          <p className="mt-3 px-1 text-[12px] leading-relaxed text-[#a1a1a6] border-t border-white/[0.06] pt-3">
            <span className="font-medium text-white">
              {actorLabel(step.from)} → {actorLabel(step.to)}:
            </span>{' '}
            {step.caption}
          </p>
        </div>

        {/* Overview */}
        <aside className="order-3 rounded-[22px] bg-[#141416] border border-white/[0.06] p-4">
          <h3 className="text-[12px] font-semibold tracking-[0.14em] text-white">PROTOCOL OVERVIEW</h3>

          <div className="mt-3 flex items-center justify-between gap-2">
            <span className="text-[20px] font-semibold leading-none text-white">{lesson.name}</span>
            <span className="flex items-center gap-1.5 text-[10px] text-[#30d158]">
              <span className="w-1.5 h-1.5 rounded-full bg-[#30d158]" />
              ACTIVE
            </span>
          </div>

          <p className="mt-2 text-[11px] leading-relaxed text-[#86868b]">{lesson.summary}</p>

          <dl className="mt-4 space-y-2.5 text-[11px]">
            {[
              ['Layer', `${meta.layerNote} · OSI ${meta.osi}`],
              ['Default port', meta.port],
              ['Transport', meta.transport],
              ['Security', meta.security],
              ['Messages', `${lesson.steps.length} in this trace`],
            ].map(([label, value]) => (
              <div key={label} className="flex items-start justify-between gap-3 border-b border-white/[0.05] pb-2 last:border-0 last:pb-0">
                <dt className="text-[10px] uppercase tracking-[0.08em] text-[#6e6e73] flex-shrink-0">{label}</dt>
                <dd className="text-right text-[#d2d2d7] leading-snug">{value}</dd>
              </div>
            ))}
          </dl>
        </aside>
      </div>

      {/* Packet flow */}
      <div className="rounded-[22px] bg-[#141416] border border-white/[0.06] overflow-hidden">
        <div className="flex flex-wrap items-center justify-between gap-3 px-4 py-3 border-b border-white/[0.06]">
          <div className="flex flex-wrap items-center gap-4">
            <h3 className="text-[12px] font-semibold tracking-[0.14em] text-white">PACKET FLOW</h3>
            <div className="flex flex-wrap items-center gap-3">
              {protocolsInLesson.map((protocol) => (
                <span key={protocol} className="flex items-center gap-1.5 text-[10px] text-[#86868b]">
                  <span className="w-1.5 h-1.5 rounded-full" style={{ background: stepProtocolColor(protocol) }} />
                  {protocol}
                </span>
              ))}
            </div>
          </div>

          <div className="flex items-center gap-1.5">
            <select
              value={speed}
              onChange={(event) => setSpeed(Number(event.target.value))}
              aria-label="Playback speed"
              className="rounded-full bg-black/40 px-2.5 py-1 text-[11px] text-[#a1a1a6] focus:outline-none focus:ring-2 focus:ring-accent/60"
            >
              <option value={0.5}>0.5x</option>
              <option value={1}>1x</option>
              <option value={2}>2x</option>
            </select>

            <button
              onClick={() => {
                setPlaying(false);
                goToStep(stepIndex - 1);
              }}
              disabled={stepIndex === 0}
              className="p-1.5 rounded-full text-[#a1a1a6] hover:text-white hover:bg-white/[0.06] transition-colors duration-300 disabled:opacity-30"
              aria-label="Previous message"
            >
              <ChevronLeft className="w-4 h-4" />
            </button>

            <button
              onClick={() => setPlaying(!playing)}
              className="flex items-center gap-1.5 rounded-full bg-accent px-4 py-1.5 text-[11px] font-medium text-white transition-colors duration-300 hover:bg-[#0077ed]"
            >
              {playing ? <Pause className="w-3.5 h-3.5" /> : <Play className="w-3.5 h-3.5" />}
              {playing ? 'PAUSE' : 'PLAY'}
            </button>

            <button
              onClick={() => {
                setPlaying(false);
                goToStep(stepIndex + 1);
              }}
              disabled={stepIndex >= lesson.steps.length - 1}
              className="flex items-center gap-1 rounded-full px-2.5 py-1.5 text-[11px] text-[#a1a1a6] hover:text-white hover:bg-white/[0.06] transition-colors duration-300 disabled:opacity-30"
            >
              STEP
              <ChevronRight className="w-3.5 h-3.5" />
            </button>

            <button
              onClick={() => {
                setPlaying(false);
                goToStep(0);
              }}
              className="flex items-center gap-1 rounded-full px-2.5 py-1.5 text-[11px] text-[#a1a1a6] hover:text-white hover:bg-white/[0.06] transition-colors duration-300"
            >
              <RotateCcw className="w-3.5 h-3.5" />
              RESET
            </button>
          </div>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left min-w-[640px]">
            <thead>
              <tr className="text-[9px] uppercase tracking-[0.12em] text-[#6e6e73] border-b border-white/[0.06]">
                <th className="py-2 pl-4 pr-2 font-medium">No.</th>
                <th className="px-2 font-medium">Time</th>
                <th className="px-2 font-medium">Source</th>
                <th className="px-2 font-medium">Destination</th>
                <th className="px-2 font-medium">Protocol</th>
                <th className="px-2 font-medium">Info</th>
                <th className="px-2 pr-4 font-medium text-right">Size</th>
              </tr>
            </thead>
            <tbody>
              {lesson.steps.map((item, index) => {
                const isCurrent = index === stepIndex;
                const protocol = stepProtocol(lesson.id, item.title);
                return (
                  <tr
                    key={index}
                    onClick={() => {
                      setPlaying(false);
                      goToStep(index);
                    }}
                    className={`cursor-pointer border-b border-white/[0.04] transition-colors duration-200 ${
                      isCurrent ? 'bg-white/[0.06]' : 'hover:bg-white/[0.03]'
                    }`}
                  >
                    <td className="py-2 pl-4 pr-2">
                      <span
                        className={`flex h-5 w-5 items-center justify-center rounded-full text-[9px] font-semibold ${
                          isCurrent ? 'text-white' : 'text-black'
                        }`}
                        style={{ background: isCurrent ? '#0071e3' : stepProtocolColor(protocol) }}
                      >
                        {index + 1}
                      </span>
                    </td>
                    <td className="px-2 text-[11px] font-mono text-[#6e6e73]">{stepTime(index)}</td>
                    <td className="px-2 text-[11px] text-[#a1a1a6]">{actorLabel(item.from)}</td>
                    <td className="px-2 text-[11px] text-[#a1a1a6]">{actorLabel(item.to)}</td>
                    <td className="px-2">
                      <span className="flex items-center gap-1.5 text-[11px] text-[#d2d2d7]">
                        <span
                          className="w-1.5 h-1.5 rounded-full flex-shrink-0"
                          style={{ background: stepProtocolColor(protocol) }}
                        />
                        {protocol}
                      </span>
                    </td>
                    <td className="px-2 py-2">
                      <span className="block text-[11px] text-[#e8e8ed]">{item.title}</span>
                      <span className="block max-w-[420px] truncate text-[10px] text-[#6e6e73]">{item.caption}</span>
                    </td>
                    <td className="px-2 pr-4 text-right text-[11px] font-mono text-[#6e6e73]">{stepSize(item)}</td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </div>

      {/* Decoded packet */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
        <div className="rounded-[22px] bg-[#141416] border border-white/[0.06] p-4">
          <div className="mb-3 flex items-center justify-between gap-2">
            <h4 className="text-[12px] font-semibold tracking-[0.14em] text-white">PACKET DETAILS</h4>
            <span className="text-[10px] font-mono text-[#6e6e73]">{step.title}</span>
          </div>
          <div className="space-y-1">
            {fields.map((field) => {
              const isActive = activeField === field.index;
              return (
                <button
                  key={field.index}
                  onClick={() => setActiveField(field.index)}
                  className={`w-full rounded-xl px-3 py-2 text-left transition-colors duration-300 ${
                    isActive ? 'bg-white/[0.08]' : 'hover:bg-white/[0.04]'
                  }`}
                >
                  <span className="flex items-baseline justify-between gap-3">
                    <span className="font-mono text-[11px] text-[#86868b]">{field.name}</span>
                    <span className="text-right font-mono text-[11px] text-white break-all">{field.value}</span>
                  </span>
                  {field.note && <span className="mt-0.5 block text-[10px] text-[#6e6e73]">{field.note}</span>}
                </button>
              );
            })}
          </div>
        </div>

        <div className="rounded-[22px] bg-[#141416] border border-white/[0.06] p-4">
          <div className="mb-3 flex items-center justify-between gap-2">
            <h4 className="text-[12px] font-semibold tracking-[0.14em] text-white">BYTES ON THE WIRE</h4>
            <span className="text-[10px] text-[#6e6e73]">click a byte group</span>
          </div>
          <HexDump fields={fields} activeField={activeField} onSelectField={setActiveField} />
        </div>
      </div>

      <p className="flex items-start gap-2 text-[11px] leading-relaxed text-[#6e6e73]">
        <Info className="w-3.5 h-3.5 flex-shrink-0 mt-0.5" />
        <span>
          Illustrative trace. These are teaching scenarios generated in your browser — no packet capture, no network
          access, and no request is sent to any real host. Timestamps are synthetic and a step may group several wire
          messages.
        </span>
      </p>
    </div>
  );
};
