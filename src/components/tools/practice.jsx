import React, { useMemo, useState } from 'react';
import { portsDatabase } from '../../data/tools';

// Mobile-first practice widgets. These are what the QR codes inside the digital
// notes open, so every screen is usable on a phone in one hand: big targets,
// one question at a time, immediate feedback.

const randomInt = (min, max) => min + Math.floor(Math.random() * (max - min + 1));

const ipToParts = (ip) => ip.split('.').map(Number);
const partsToIp = (parts) => parts.join('.');

const makeSubnetQuestion = () => {
  const prefix = [24, 25, 26, 27, 28, 29, 30][randomInt(0, 6)];
  const baseOctet = [10, 172, 192, 198][randomInt(0, 3)];
  const second = baseOctet === 172 ? randomInt(16, 31) : baseOctet === 192 ? 168 : baseOctet === 198 ? 51 : randomInt(0, 200);
  const ip = `${baseOctet}.${second}.${randomInt(0, 255)}.${randomInt(1, 254)}`;
  const mask = prefix === 0 ? 0 : (0xFFFFFFFF << (32 - prefix)) >>> 0;
  const ipInt = ipToParts(ip).reduce((acc, octet) => acc * 256 + octet, 0);
  const networkInt = (ipInt & mask) >>> 0;
  const network = [24, 16, 8, 0].map((shift) => Math.floor(networkInt / Math.pow(2, shift)) % 256);
  const block = Math.pow(2, 32 - prefix);
  const broadcast = partsToIp([24, 16, 8, 0].map((shift) => Math.floor((networkInt + block - 1) / Math.pow(2, shift)) % 256));
  const askHosts = Math.random() > 0.55;
  return {
    id: Math.random(),
    prompt: askHosts ? `How many usable hosts in this /${prefix}?` : `What is the network address of ${ip}/${prefix}?`,
    context: `IP ${ip}/${prefix}`,
    answer: askHosts ? String(block - 2) : partsToIp(network),
    explain: askHosts
      ? `Block size is 2^${32 - prefix} = ${block}. Remove the network and broadcast address → ${block - 2} usable hosts.`
      : `Mask ${prefix} keeps the first bits. Block size ${block}; this address falls in the subnet starting at ${partsToIp(network)} (broadcast ${broadcast}).`,
  };
};

export const SubnetDrill = () => {
  const [question, setQuestion] = useState(() => makeSubnetQuestion());
  const [input, setInput] = useState('');
  const [feedback, setFeedback] = useState(null);
  const [score, setScore] = useState({ correct: 0, total: 0 });

  const submit = () => {
    if (!input.trim()) return;
    const correct = input.trim().replace(/\s/g, '') === question.answer;
    setFeedback({ correct });
    setScore((previous) => ({ correct: previous.correct + (correct ? 1 : 0), total: previous.total + 1 }));
  };

  const next = () => {
    setQuestion(makeSubnetQuestion());
    setInput('');
    setFeedback(null);
  };

  return (
    <div className="mx-auto max-w-md">
      <div className="rounded-2xl border border-slate-800 bg-navy-900 p-5">
        <div className="flex items-center justify-between text-[11px] uppercase tracking-wider text-slate-500">
          <span>Subnet drill</span>
          <span className="font-mono">{score.correct}/{score.total}</span>
        </div>

        <p className="mt-4 text-xs text-slate-500">{question.context}</p>
        <p className="mt-1 text-lg font-semibold leading-snug text-white">{question.prompt}</p>

        <input
          value={input}
          onChange={(event) => setInput(event.target.value)}
          onKeyDown={(event) => {
            if (event.key !== 'Enter') return;
            if (feedback) next();
            else submit();
          }}
          inputMode="text"
          autoComplete="off"
          placeholder="Your answer"
          className="mt-4 w-full rounded-xl border border-slate-700 bg-navy-950 px-4 py-3 font-mono text-base text-white outline-none focus:border-electric-400"
        />

        {feedback ? (
          <>
            <div className={`mt-3 rounded-xl border px-3.5 py-3 text-xs leading-relaxed ${feedback.correct ? 'border-emerald-500/30 bg-emerald-500/5 text-emerald-200' : 'border-red-500/30 bg-red-500/5 text-red-200'}`}>
              <strong className="block text-sm">{feedback.correct ? 'Correct' : `Answer: ${question.answer}`}</strong>
              <span>{question.explain}</span>
            </div>
            <button type="button" onClick={next} className="mt-3 w-full rounded-xl bg-electric-600 py-3 text-sm font-semibold text-white">
              Next question
            </button>
          </>
        ) : (
          <button type="button" onClick={submit} className="mt-3 w-full rounded-xl bg-electric-600 py-3 text-sm font-semibold text-white">
            Check answer
          </button>
        )}
      </div>
    </div>
  );
};

const QUIZ_PORTS = portsDatabase.filter((item) => item.port <= 1024);

const makePortQuestion = () => {
  const answer = QUIZ_PORTS[randomInt(0, QUIZ_PORTS.length - 1)];
  const options = new Set([answer.service]);
  while (options.size < 4) {
    const candidate = QUIZ_PORTS[randomInt(0, QUIZ_PORTS.length - 1)];
    options.add(candidate.service);
  }
  return {
    id: Math.random(),
    answer: answer.service,
    port: answer.port,
    protocol: answer.protocol,
    note: answer.ccnaNote,
    options: [...options].sort(() => Math.random() - 0.5),
  };
};

export const PortQuiz = () => {
  const [question, setQuestion] = useState(() => makePortQuestion());
  const [picked, setPicked] = useState(null);
  const [score, setScore] = useState({ correct: 0, total: 0 });

  const choose = (option) => {
    if (picked) return;
    setPicked(option);
    setScore((previous) => ({ correct: previous.correct + (option === question.answer ? 1 : 0), total: previous.total + 1 }));
  };

  const next = () => {
    setQuestion(makePortQuestion());
    setPicked(null);
  };

  return (
    <div className="mx-auto max-w-md">
      <div className="rounded-2xl border border-slate-800 bg-navy-900 p-5">
        <div className="flex items-center justify-between text-[11px] uppercase tracking-wider text-slate-500">
          <span>Port quiz</span>
          <span className="font-mono">{score.correct}/{score.total}</span>
        </div>

        <p className="mt-4 text-center font-mono text-5xl font-black text-white">{question.port}</p>
        <p className="mt-1 text-center text-[11px] uppercase tracking-wider text-slate-500">{question.protocol} — which service?</p>

        <div className="mt-4 space-y-2">
          {question.options.map((option) => {
            const isAnswer = option === question.answer;
            const chosen = picked === option;
            const tone = !picked
              ? 'border-slate-700 bg-navy-950 text-slate-200'
              : isAnswer
                ? 'border-emerald-500/50 bg-emerald-500/10 text-emerald-200'
                : chosen
                  ? 'border-red-500/50 bg-red-500/10 text-red-200'
                  : 'border-slate-800 bg-navy-950 text-slate-500';
            return (
              <button
                key={option}
                type="button"
                onClick={() => choose(option)}
                className={`w-full rounded-xl border px-4 py-3 text-left text-sm font-medium transition ${tone}`}
              >
                {option}
              </button>
            );
          })}
        </div>

        {picked && (
          <>
            <p className="mt-3 rounded-xl border border-slate-800 bg-navy-950 px-3.5 py-2.5 text-[11px] leading-relaxed text-slate-400">
              {question.note}
            </p>
            <button type="button" onClick={next} className="mt-3 w-full rounded-xl bg-electric-600 py-3 text-sm font-semibold text-white">
              Next port
            </button>
          </>
        )}
      </div>
    </div>
  );
};

// Small wrapper so a practice widget can be dropped into any page or note page.
export const PracticeWidget = ({ kind }) => {
  const label = useMemo(() => (kind === 'ports' ? 'Port quiz' : 'Subnet drill'), [kind]);
  return (
    <div>
      <p className="mb-3 text-center text-[11px] uppercase tracking-[0.2em] text-slate-500">{label}</p>
      {kind === 'ports' ? <PortQuiz /> : <SubnetDrill />}
    </div>
  );
};
