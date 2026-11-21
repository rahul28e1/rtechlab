import React from 'react';
import { Link } from 'react-router';

const FEATURED_REVIEWS = [
  {
    id: 1,
    name: 'Divya Sundaram',
    college: 'B.Tech ECE, Anna University Chennai',
    role: 'Cloud Support Associate',
    stars: 5,
    subject: 'Cisco CCNA 200-301',
    subjectTag: 'ccna',
    badge: '🌐 Cisco TAC Standard',
    avatarBg: 'bg-cyan-500/20 text-cyan-300',
    initials: 'DS',
    review:
      'The TAC Top 120 interview vault with senior model answers is pure gold. Interviewers were visibly impressed when I explained IPv6 SLAAC and EUI-64 correctly.',
  },
  {
    id: 2,
    name: 'Harsh Vardhan Singh',
    college: 'Polytechnic Diploma, Jaipur',
    role: 'Desktop Support Engineer at Wipro',
    stars: 5,
    subject: 'Computer Fundamentals',
    subjectTag: 'fundamentals',
    badge: '💻 Core Foundation',
    avatarBg: 'bg-emerald-500/20 text-emerald-300',
    initials: 'HS',
    review:
      'The ESD safety and hardware troubleshooting diagnostics guide helped me crack the technical interview round easily. At ₹49, this is practically free value for students.',
  },
  {
    id: 3,
    name: 'Mohd. Tariq',
    college: 'B.Com CA, Osmania University Hyderabad',
    role: 'MIS Trainee at Genpact',
    stars: 5,
    subject: 'Microsoft Office 365 Enterprise',
    subjectTag: 'office-365',
    badge: '⚡ Placement Ready',
    avatarBg: 'bg-blue-500/20 text-blue-300',
    initials: 'MT',
    review:
      'Corporate Word legal formatting and Excel Pivot tables workbook helped me pass the corporate assessment test. Excellent practical templates for non-coders.',
  },
  {
    id: 4,
    name: 'Abhishek Verma',
    college: 'B.Tech CSE, Chandigarh University',
    role: 'AI Intern at Gurugram Tech Startup',
    stars: 5,
    subject: 'Artificial Intelligence Mastery',
    subjectTag: 'ai',
    badge: '🔥 Highest CTC Track',
    avatarBg: 'bg-purple-500/20 text-purple-300',
    initials: 'AV',
    review:
      'Most courses teach prompt engineering surface-level. RTechLab covers Chain-of-Thought, ReAct frameworks, and vector search with actual code concepts. Pure industrial grade quality.',
  },
];

const UPCOMING_TRACKS = [
  {
    title: 'Linux Systems & Production Administration',
    tag: 'Core Infra',
    timeline: 'Q2 2027',
    icon: '🐧',
    summary: 'CLI Mastery, Bash Scripting, Permissions, Systemd & Server Hardening',
  },
  {
    title: 'Cyber Security, Wireshark & SOC Defense',
    tag: 'Cyber Defense',
    timeline: 'Q2 2027',
    icon: '🛡️',
    summary: 'Deep Packet Inspection, Threat Hunting, Firewalls & SOC Analyst SOPs',
  },
  {
    title: 'Cloud Architecture & DevOps Infrastructure',
    tag: 'Cloud & DevOps',
    timeline: 'Q3 2027',
    icon: '☁️',
    summary: 'AWS, Azure VPCs, Docker Containers, CI/CD & Terraform Automation',
  },
];

export function StudentReviewsWall() {
  return (
    <section className="py-16 sm:py-24 px-4 sm:px-6 lg:px-8 border-t border-white/[0.06] bg-[#070709]">
      <div className="max-w-7xl mx-auto">
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12">
          <div>
            <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-amber-500/10 border border-amber-500/20 text-amber-400 text-xs font-mono font-semibold mb-3">
              <span>⭐ 4.9/5 Rating from 1,400+ Verified Students</span>
            </div>
            <h2 className="text-3xl sm:text-4xl lg:text-5xl font-black text-white tracking-tight">
              Real Students. Real Tech Placements.
            </h2>
          </div>
          <p className="text-[#A1A1A6] text-sm sm:text-base max-w-md font-normal leading-relaxed">
            Zero fluff. Real reviews from college students and freshers who used RTechLab study handbooks to crack technical rounds.
          </p>
        </div>

        {/* 4 Reviews Cards Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-5 mb-14">
          {FEATURED_REVIEWS.map((r) => (
            <div
              key={r.id}
              className="p-6 rounded-2xl bg-[#0d0e14] border border-white/[0.08] hover:border-white/20 transition-all flex flex-col justify-between shadow-xl group hover:-translate-y-0.5"
            >
              <div>
                {/* Star rating & Subject badge */}
                <div className="flex items-center justify-between gap-2 mb-3">
                  <div className="flex items-center text-amber-400 text-xs tracking-wider">
                    {'★'.repeat(r.stars)}
                  </div>
                  <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-white/[0.05] text-[#86868B] font-semibold">
                    {r.badge}
                  </span>
                </div>

                {/* Review Text */}
                <p className="text-xs sm:text-sm text-white/90 leading-relaxed italic mb-5">
                  &ldquo;{r.review}&rdquo;
                </p>
              </div>

              {/* Student info */}
              <div className="pt-4 border-t border-white/[0.06] flex items-center gap-3">
                <div
                  className={`w-9 h-9 rounded-full ${r.avatarBg} flex items-center justify-center font-bold text-xs shrink-0 font-mono`}
                >
                  {r.initials}
                </div>
                <div className="min-w-0 flex-1">
                  <div className="flex items-center gap-1.5">
                    <span className="text-xs font-bold text-white truncate">{r.name}</span>
                    <span className="text-emerald-400 text-[10px] shrink-0" title="Verified Buyer">
                      ✓
                    </span>
                  </div>
                  <p className="text-[10px] text-emerald-400 font-medium truncate">{r.role}</p>
                  <p className="text-[10px] text-[#86868B] truncate">{r.college}</p>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* ── Upcoming Tracks Laboratory (Clean Minimalist Banner) ────────── */}
        <div className="rounded-2xl sm:rounded-3xl bg-gradient-to-r from-[#0d0f17] via-[#090b10] to-[#0d0f17] border border-white/[0.08] p-6 sm:p-8">
          <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-6 mb-6">
            <div>
              <div className="inline-flex items-center gap-1.5 px-3 py-0.5 rounded-full bg-cyan-500/10 border border-cyan-500/20 text-cyan-400 text-[11px] font-mono font-semibold mb-2">
                <span>🔬 In The RTechLab Incubator</span>
              </div>
              <h3 className="text-xl sm:text-2xl font-bold text-white tracking-tight">
                Upcoming 2027 Handbooks Under Research
              </h3>
              <p className="text-xs sm:text-sm text-[#86868B] mt-1">
                Written strictly from real production logs and enterprise Cisco/Linux standards. Currently in peer-review.
              </p>
            </div>

            <a
              href="https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center justify-center gap-2 px-5 py-2.5 rounded-xl bg-emerald-500 hover:bg-emerald-400 text-black text-xs font-extrabold transition-all shadow-md shadow-emerald-500/20 active:scale-95 shrink-0"
            >
              <span>🔔 Get Launch Alerts on WhatsApp</span>
              <span>&rarr;</span>
            </a>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            {UPCOMING_TRACKS.map((track) => (
              <div
                key={track.title}
                className="p-4 rounded-xl bg-white/[0.02] border border-white/[0.06] flex items-start gap-3.5"
              >
                <span className="text-2xl shrink-0 p-1 rounded-lg bg-white/[0.04]">
                  {track.icon}
                </span>
                <div>
                  <div className="flex items-center gap-2 mb-1">
                    <span className="text-[10px] font-mono text-cyan-400 font-semibold bg-cyan-500/10 px-2 py-0.5 rounded">
                      {track.timeline}
                    </span>
                    <span className="text-[10px] font-mono text-[#86868B]">{track.tag}</span>
                  </div>
                  <h4 className="text-xs sm:text-sm font-bold text-white tracking-tight mb-1">
                    {track.title}
                  </h4>
                  <p className="text-[11px] text-[#86868B] leading-relaxed">{track.summary}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
