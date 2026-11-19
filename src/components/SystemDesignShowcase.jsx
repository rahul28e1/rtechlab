import React from 'react';
import { Link } from 'react-router';
import { Route, Network, TrendingUp, Database, Timer, Calculator, Vote, Layers, ArrowRight, Sparkles } from 'lucide-react';
import { toolsByCategory } from '../data/toolCatalog';

const SIMULATORS = toolsByCategory('system-design');
const FEATURED = SIMULATORS.filter((tool) => tool.featured).slice(0, 4);

// Icon and colour belong to the simulator, not to its position in the grid, so
// a reordered or newly featured catalog entry keeps its own identity.
const LOOKS = {
  'request-journey': { icon: Route, badgeColor: 'border-emerald-500/30 text-emerald-400 bg-emerald-500/10' },
  'load-balancer-sim': { icon: Network, badgeColor: 'border-amber-500/30 text-amber-400 bg-amber-500/10' },
  'autoscaling-simulator': { icon: TrendingUp, badgeColor: 'border-cyan-500/30 text-cyan-400 bg-cyan-500/10' },
  'cache-simulator': { icon: Database, badgeColor: 'border-purple-500/30 text-purple-400 bg-purple-500/10' },
  'rate-limiter': { icon: Timer, badgeColor: 'border-rose-500/30 text-rose-400 bg-rose-500/10' },
  'capacity-estimator': { icon: Calculator, badgeColor: 'border-sky-500/30 text-sky-400 bg-sky-500/10' },
  'quorum-calculator': { icon: Vote, badgeColor: 'border-teal-500/30 text-teal-400 bg-teal-500/10' },
};

const FALLBACK_LOOK = { icon: Layers, badgeColor: 'border-slate-500/30 text-slate-400 bg-slate-500/10' };

export function SystemDesignShowcase() {
  return (
    <section className="py-20 px-6 max-w-6xl mx-auto border-t border-white/[0.08]">
      <div className="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12">
        <div>
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-electric-500/10 border border-electric-500/30 text-electric-400 text-xs font-semibold mb-4">
            <Sparkles className="w-3.5 h-3.5" aria-hidden="true" />
            <span>Interactive Lab</span>
          </div>
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-white">
            System Design Simulators
          </h2>
          <p className="mt-2 text-slate-400 text-sm sm:text-base max-w-2xl">
            Latency, load balancing, autoscaling and caching — the numbers an interview answer depends on,
            running live in your browser instead of memorised from a slide.
          </p>
        </div>

        <Link
          to="/system-design"
          className="inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-white text-black font-semibold text-sm hover:bg-slate-200 transition shrink-0 shadow-lg shadow-white/10"
        >
          <span>Launch all {SIMULATORS.length} simulators</span>
          <ArrowRight className="w-4 h-4" />
        </Link>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {FEATURED.map((sim) => {
          const { icon: Icon, badgeColor } = LOOKS[sim.slug] || FALLBACK_LOOK;
          return (
            <Link
              key={sim.slug}
              to={`/tools/${sim.slug}`}
              className="group relative bg-[#101012] hover:bg-[#141418] border border-white/[0.08] hover:border-white/20 rounded-2xl p-6 transition-all duration-300 flex flex-col justify-between"
            >
              <div>
                <div className="flex items-center justify-between mb-4">
                  <span className={`text-[10px] font-mono px-2.5 py-1 rounded-full border ${badgeColor}`}>
                    {sim.tags[0].toUpperCase()}
                  </span>
                  <div className="w-9 h-9 rounded-xl bg-white/[0.04] border border-white/10 flex items-center justify-center text-slate-300 group-hover:text-white transition">
                    <Icon className="w-4 h-4" aria-hidden="true" />
                  </div>
                </div>

                <h3 className="text-lg font-bold text-white group-hover:text-electric-300 transition-colors">
                  {sim.name}
                </h3>
                <p className="mt-2 text-xs sm:text-sm text-slate-400 leading-relaxed">{sim.blurb}</p>
              </div>

              <div className="mt-6 pt-4 border-t border-white/[0.06] flex items-center justify-between gap-3">
                <span className="text-[11px] font-mono text-slate-500">{sim.tags.join(' • ')}</span>
                <span className="inline-flex items-center gap-1 text-xs font-semibold text-electric-400 group-hover:text-electric-300 transition shrink-0">
                  Simulate
                  <ArrowRight className="w-3.5 h-3.5 group-hover:translate-x-1 transition-transform" aria-hidden="true" />
                </span>
              </div>
            </Link>
          );
        })}
      </div>
    </section>
  );
}
