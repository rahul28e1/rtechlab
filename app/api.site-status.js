// Server-side status check for the "Is it up?" tool.
// A browser cannot read a cross-origin response, so the check runs on our own
// server (this resource route) and returns plain JSON. check-host.net is used
// for the multi-location view because it answers from several countries, which
// is what separates "the site is down" from "the site is down for me".

const TIMEOUT_MS = 9000;

const normalise = (input) => {
  const value = (input || '').trim();
  if (!value) return null;
  const withScheme = /^https?:\/\//i.test(value) ? value : `https://${value}`;
  try {
    const url = new URL(withScheme);
    if (url.protocol !== 'http:' && url.protocol !== 'https:') return null;
    return url;
  } catch {
    return null;
  }
};

const reasonFor = (error) => {
  if (error.name === 'AbortError' || error.name === 'TimeoutError') {
    return `No response within ${TIMEOUT_MS / 1000} seconds`;
  }
  const code = error.cause?.code || '';
  if (code === 'ENOTFOUND' || code === 'EAI_AGAIN') {
    return 'Domain does not resolve — check the spelling of the address';
  }
  if (code === 'ECONNREFUSED') return 'Connection refused — nothing is listening on this port';
  if (code === 'ECONNRESET' || code === 'ETIMEDOUT') return 'Connection timed out or was reset before any response';
  if (code.startsWith('ERR_TLS') || code === 'CERT_HAS_EXPIRED' || code === 'UNABLE_TO_VERIFY_LEAF_SIGNATURE') {
    return `TLS/certificate problem (${code})`;
  }
  return `Connection failed${code ? ` (${code})` : ''}`;
};

const fetchJson = async (url) => {
  const response = await fetch(url, {
    headers: { Accept: 'application/json', 'User-Agent': 'RTechLab-Uptime-Check/1.0' },
    signal: AbortSignal.timeout(7000),
  });
  if (!response.ok) throw new Error(`check-host ${response.status}`);
  return response.json();
};

// check-host.net answers from several countries, which is how "down for me" is
// separated from "down for everyone". It is best-effort: if it is slow or rate
// limited, the tool still shows the direct server result.
const fromCheckHost = async (target) => {
  try {
    const startJson = await fetchJson(
      `https://check-host.net/check-http?host=${encodeURIComponent(target)}&max_nodes=3`,
    );
    const requestId = startJson.request_id;
    if (!requestId) return null;

    let resultJson = null;
    for (let attempt = 0; attempt < 3; attempt += 1) {
      await new Promise((resolve) => setTimeout(resolve, 1500));
      resultJson = await fetchJson(`https://check-host.net/check-result/${requestId}`);
      if (resultJson && Object.values(resultJson).every((value) => value !== null)) break;
    }
    if (!resultJson) return null;

    return Object.entries(resultJson)
      .map(([node, value]) => {
        const entry = Array.isArray(value) ? value[0] : null;
        const up = Array.isArray(entry) ? Boolean(entry[0]) : false;
        const seconds = Array.isArray(entry) ? entry[1] : null;
        return {
          node,
          country: node.slice(0, 2).toUpperCase(),
          up,
          time: typeof seconds === 'number' ? Math.round(seconds * 1000) : null,
        };
      })
      .slice(0, 6);
  } catch {
    return null;
  }
};

export async function loader({ request }) {
  const url = new URL(request.url);
  const target = normalise(url.searchParams.get('host'));
  if (!target) {
    return Response.json({ error: 'Enter a website such as example.com' }, { status: 400 });
  }

  const started = Date.now();
  let status = 0;
  let ok = false;
  let message = '';
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), TIMEOUT_MS);

  try {
    const response = await fetch(target.toString(), {
      method: 'GET',
      redirect: 'follow',
      signal: controller.signal,
      headers: { 'User-Agent': 'RTechLab-Uptime-Check/1.0 (+https://rtechlab.io)' },
    });
    status = response.status;
    ok = status > 0 && status < 500;
    await response.body?.cancel();
  } catch (error) {
    message = reasonFor(error);
  } finally {
    clearTimeout(timer);
  }

  const responseMs = Date.now() - started;
  const nodes = ok || status ? await fromCheckHost(target.hostname) : null;

  return Response.json(
    {
      host: target.hostname,
      url: target.toString(),
      ok,
      status,
      responseMs,
      message,
      checkedAt: new Date().toISOString(),
      nodes,
    },
    { headers: { 'Cache-Control': 'no-store' } },
  );
}
