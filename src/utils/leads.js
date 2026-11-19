export const LEAD_KEY = 'rtechlab_lead_v1';
const ENDPOINT = import.meta.env.VITE_LEAD_ENDPOINT || '';

export const isLeadCaptureConfigured = () => Boolean(ENDPOINT);

export const saveLeadLocally = (payload) => {
  try {
    const existing = JSON.parse(window.localStorage.getItem(LEAD_KEY) || '[]');
    const list = Array.isArray(existing) ? existing : [existing];
    list.push({ ...payload, at: Date.now() });
    window.localStorage.setItem(LEAD_KEY, JSON.stringify(list.slice(-50)));
  } catch {
    // storage can be blocked; submission still attempts the network call
  }
};

export const submitLead = async (payload) => {
  saveLeadLocally(payload);

  if (!ENDPOINT) return { ok: false, reason: 'not-configured' };

  try {
    const response = await fetch(ENDPOINT, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
      body: JSON.stringify({
        ...payload,
        source: 'rtechlab-site',
        page: window.location.pathname,
        submittedAt: new Date().toISOString(),
      }),
    });
    return { ok: response.ok, status: response.status };
  } catch {
    return { ok: false, reason: 'network' };
  }
};
