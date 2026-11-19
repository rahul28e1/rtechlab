// Pure simulation model behind the autoscaling simulator. Kept free of React so
// the scaling rules can be tested directly in Node.

export const MAX_SERVERS = 5;
export const SERVER_RPS = 12; // requests one server serves at a healthy CPU load
const TRAVEL_SECONDS = 1.2;
const REQUEST_LIFETIME = 1.5; // 1 is arrival; the rest is time spent being served

export const createSim = () => ({
  servers: [{ cpu: 12 }, { cpu: 12 }],
  requests: [],
  spawnAcc: 0,
  traffic: 6,
  seconds: 0,
  history: [],
  historyTimer: 0,
  log: [],
  hot: 0,
  cool: 0,
  sinceEvent: 0,
  events: 0,
  nextRequestId: 1,
});

const recordEvent = (sim, kind, average) => {
  sim.hot = 0;
  sim.cool = 0;
  sim.sinceEvent = 0;
  sim.events += 1;
  sim.log.unshift({ id: `log-${sim.events}`, kind, cpu: Math.round(average), count: sim.servers.length });
  if (sim.log.length > 6) sim.log.length = 6;
};

// One frame of the simulation. Mutates `sim` in place and returns nothing.
export const stepSimulation = (sim, config, dt) => {
  sim.seconds += dt;

  // Traffic follows the stress ramp, or the slider when the ramp is off.
  const target = config.ramp ? Math.min(50, 6 + sim.seconds * 1.7) : config.traffic;
  sim.traffic += (target - sim.traffic) * Math.min(1, dt * 2.5);

  // Spawn requests at the current rate; the per-frame budget and the cap keep
  // the picture readable instead of a wall of dots.
  sim.spawnAcc += sim.traffic * dt;
  const budget = Math.min(8, Math.floor(sim.spawnAcc));
  sim.spawnAcc -= budget;
  for (let i = 0; i < budget && sim.requests.length < 160; i += 1) {
    sim.requests.push({
      id: sim.nextRequestId,
      // Round robin, so the dots spread evenly instead of chasing CPU noise.
      server: sim.nextRequestId % sim.servers.length,
      t: 0,
      y0: 196 + Math.random() * 28,
    });
    sim.nextRequestId += 1;
  }

  // Move every dot; a request is dropped once it has been served.
  for (const request of sim.requests) request.t += dt / TRAVEL_SECONDS;
  sim.requests = sim.requests.filter((request) => request.t < REQUEST_LIFETIME);

  // CPU follows the traffic each server has to absorb. Deriving it from the
  // request rate (not from the drawn dots) keeps the scaling decision stable.
  const targetCpu = Math.min(100, 8 + (sim.traffic / sim.servers.length / SERVER_RPS) * 92);
  for (const server of sim.servers) {
    server.cpu += (targetCpu - server.cpu) * Math.min(1, dt * 4);
  }

  const average = sim.servers.reduce((sum, server) => sum + server.cpu, 0) / sim.servers.length;

  // Scale out quickly, scale in slowly — the usual production asymmetry. The
  // post-event cooldown stops a fresh server from being removed immediately,
  // which would otherwise make the fleet flap between sizes.
  sim.sinceEvent += dt;
  sim.hot = average > config.threshold ? sim.hot + dt : Math.max(0, sim.hot - dt * 1.5);
  sim.cool = average < config.threshold - 32 ? sim.cool + dt : Math.max(0, sim.cool - dt * 1.5);

  if (sim.hot > 1 && sim.sinceEvent > 3 && sim.servers.length < MAX_SERVERS) {
    sim.servers.push({ cpu: 14 });
    recordEvent(sim, 'up', average);
  } else if (sim.cool > 4 && sim.sinceEvent > 8 && sim.servers.length > 1) {
    sim.servers.pop();
    // Requests aimed at the removed server finish on the first one.
    for (const request of sim.requests) {
      if (request.server >= sim.servers.length) request.server = 0;
    }
    recordEvent(sim, 'down', average);
  }

  sim.historyTimer += dt;
  if (sim.historyTimer >= 0.25) {
    sim.historyTimer = 0;
    sim.history.push({ traffic: sim.traffic, capacity: sim.servers.length * SERVER_RPS });
    if (sim.history.length > 120) sim.history.shift();
  }
};
