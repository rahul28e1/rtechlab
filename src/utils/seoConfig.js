/**
 * Canonical Site URL resolver for RTechLab.
 * Ensures the site URL remains configurable via VITE_SITE_URL,
 * gracefully falling back to browser window.location.origin during development,
 * and only using a placeholder fallback in non-browser environments.
 */
export const getSiteUrl = () => {
  if (typeof import.meta !== 'undefined' && import.meta.env && import.meta.env.VITE_SITE_URL) {
    return import.meta.env.VITE_SITE_URL.replace(/\/$/, '');
  }
  if (typeof window !== 'undefined' && window.location && window.location.origin) {
    return window.location.origin;
  }
  return 'https://rtechlab.com';
};
