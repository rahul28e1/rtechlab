import { useEffect } from 'react';
import { getSiteUrl } from '../utils/seoConfig';

/**
 * Lightweight, zero-dependency Dynamic SEO Head Manager for RTechLab
 * Injects Title, Description, Canonical URL, OpenGraph, Twitter Cards, Hreflang alternates, and JSON-LD schemas.
 */
export const SEOHead = ({
  title,
  description,
  canonicalPath = '',
  type = 'website',
  ogImage = '/brand/rtechlab-master.png',
  jsonLd = null,
  lang = 'en',
  alternateEn = null,
  alternateHi = null,
  noIndex = false
}) => {
  useEffect(() => {
    // 1. Set Title & HTML Lang
    if (title) document.title = title;
    if (document.documentElement) {
      document.documentElement.lang = lang;
    }

    // Helper to update or create <meta> tag
    const setMetaTag = (attribute, attrValue, content) => {
      if (!content) return;
      let el = document.querySelector(`meta[${attribute}="${attrValue}"]`);
      if (!el) {
        el = document.createElement('meta');
        el.setAttribute(attribute, attrValue);
        document.head.appendChild(el);
      }
      el.setAttribute('content', content);
    };

    // Robots indexing directive
    if (noIndex) {
      setMetaTag('name', 'robots', 'noindex, nofollow');
    } else {
      setMetaTag('name', 'robots', 'index, follow');
    }

    // Helper to update or create <link> tag
    const setLinkTag = (rel, href, extraAttr = {}) => {
      let selector = `link[rel="${rel}"]`;
      if (extraAttr.hreflang) {
        selector += `[hreflang="${extraAttr.hreflang}"]`;
      }
      let el = document.querySelector(selector);
      if (!href) {
        if (el) el.remove();
        return;
      }
      if (!el) {
        el = document.createElement('link');
        el.setAttribute('rel', rel);
        document.head.appendChild(el);
      }
      el.setAttribute('href', href);
      Object.keys(extraAttr).forEach((k) => el.setAttribute(k, extraAttr[k]));
    };

    // Calculate Dynamic / Configurable Base URL
    const siteBase = getSiteUrl();

    const fullCanonical = canonicalPath ? `${siteBase}${canonicalPath}` : window.location.href;
    const fullOgImage = ogImage.startsWith('http') ? ogImage : `${siteBase}${ogImage}`;

    // 2. Standard Metadata
    if (description) {
      setMetaTag('name', 'description', description);
    }

    // 3. Open Graph Tags
    setMetaTag('property', 'og:title', title);
    setMetaTag('property', 'og:description', description);
    setMetaTag('property', 'og:type', type);
    setMetaTag('property', 'og:url', fullCanonical);
    setMetaTag('property', 'og:image', fullOgImage);
    setMetaTag('property', 'og:site_name', 'RTechLab');
    setMetaTag('property', 'og:locale', lang === 'hi' ? 'hi_IN' : 'en_US');

    // 4. Twitter Card Tags
    setMetaTag('name', 'twitter:card', 'summary_large_image');
    setMetaTag('name', 'twitter:title', title);
    setMetaTag('name', 'twitter:description', description);
    setMetaTag('name', 'twitter:image', fullOgImage);

    // 5. Canonical URL
    setLinkTag('canonical', fullCanonical);

    // 6. Hreflang Alternates (if provided)
    if (alternateEn) {
      setLinkTag('alternate', `${siteBase}${alternateEn}`, { hreflang: 'en' });
      setLinkTag('alternate', `${siteBase}${alternateEn}`, { hreflang: 'x-default' });
    }
    if (alternateHi) {
      setLinkTag('alternate', `${siteBase}${alternateHi}`, { hreflang: 'hi' });
    }

    // 7. Inject JSON-LD Schema
    const scriptId = 'rtechlab-jsonld';
    let scriptEl = document.getElementById(scriptId);
    if (jsonLd) {
      if (!scriptEl) {
        scriptEl = document.createElement('script');
        scriptEl.id = scriptId;
        scriptEl.type = 'application/ld+json';
        document.head.appendChild(scriptEl);
      }
      scriptEl.textContent = JSON.stringify(jsonLd);
    } else if (scriptEl) {
      scriptEl.remove();
    }

    return () => {
      // Optional cleanup on unmount
      if (scriptEl && scriptEl.parentNode) {
        scriptEl.remove();
      }
    };
  }, [title, description, canonicalPath, type, ogImage, jsonLd, lang, alternateEn, alternateHi, noIndex]);

  return null;
};
