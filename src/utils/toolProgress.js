// Remembers which tools a student has opened, so the hub can show progress.
// Browser-only storage: nothing is sent to a server and no account is needed.
const KEY = 'rtechlab-tool-progress';

export const getTriedTools = () => {
  if (typeof window === 'undefined') return [];
  try {
    const raw = window.localStorage.getItem(KEY);
    const parsed = raw ? JSON.parse(raw) : [];
    return Array.isArray(parsed) ? parsed.filter((slug) => typeof slug === 'string') : [];
  } catch {
    return [];
  }
};

export const markToolTried = (slug) => {
  if (typeof window === 'undefined' || !slug) return;
  const current = getTriedTools();
  if (current.includes(slug)) return;
  try {
    window.localStorage.setItem(KEY, JSON.stringify([...current, slug]));
  } catch {
    // Private mode or storage full: progress simply is not saved.
  }
};
