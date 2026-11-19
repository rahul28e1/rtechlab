// Cache maths for the cache simulator. It lives outside the component so the
// TTL and eviction rules can be tested without a browser.
//
// `random` is the source of request keys. The component passes a seeded
// generator, so the same settings always produce the same numbers.

const DATASET = 5000;
const REQUESTS = 600;
const HOT_KEYS = 20; // the small set of keys that carries most traffic

export const simulateCache = ({ cacheSize, ttl, hotShare, rps, dbMs, random, requests = REQUESTS, dataset = DATASET }) => {
  const step = 1000 / Math.max(1, rps); // ms between requests
  const cache = new Map(); // key -> storedAt, in least-recently-used-first order
  let now = 0;
  let hits = 0;
  let misses = 0;
  const timeline = [];

  for (let index = 0; index < requests; index += 1) {
    now += step;
    const hot = random() < hotShare / 100;
    const key = hot ? Math.floor(random() * HOT_KEYS) : Math.floor(random() * dataset);
    const storedAt = cache.get(key);
    // TTL 0 is "no expiry" in the UI, so it must not age entries out at all.
    const fresh = storedAt !== undefined && (ttl === 0 || now - storedAt <= ttl * 1000);
    if (fresh) {
      hits += 1;
      cache.delete(key); // re-insert, so the Map stays ordered by recency
      cache.set(key, storedAt);
    } else {
      misses += 1;
      cache.delete(key);
      cache.set(key, now);
      while (cache.size > cacheSize) cache.delete(cache.keys().next().value);
    }
    if ((index + 1) % 100 === 0) timeline.push({ hits, misses });
  }

  const hitRate = hits / requests;
  return {
    hitRate,
    avgLatency: hitRate * 2 + (1 - hitRate) * dbMs,
    noCacheLatency: dbMs,
    dbQueriesPerSecond: Math.round((1 - hitRate) * rps),
    memoryMb: (cacheSize * 120) / 1024 / 1024, // ~120 bytes per cached entry
    hits,
    misses,
    timeline,
    requests,
  };
};
