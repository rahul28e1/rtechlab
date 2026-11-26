import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router';
import { LanguageContext } from './LanguageContextInstance';
import { translations } from '../data/translations';

export const LanguageProvider = ({ children }) => {
  const location = useLocation();

  const [language, setLanguage] = useState(() => {
    if (typeof window === 'undefined') return 'en';
    if (window.location.pathname.startsWith('/hi')) return 'hi';
    return window.localStorage.getItem('rtechlab_lang') || 'en';
  });

  // Automatically synchronize language state with URL route changes
  useEffect(() => {
    if (location && location.pathname) {
      if (location.pathname.startsWith('/hi')) {
        setLanguage('hi');
      } else {
        setLanguage('en');
      }
    }
  }, [location?.pathname]);

  useEffect(() => {
    if (typeof window !== 'undefined') window.localStorage.setItem('rtechlab_lang', language);
    if (typeof document !== 'undefined') {
      document.documentElement.lang = language;
    }
  }, [language]);

  const toggleLanguage = () => {
    setLanguage(prev => (prev === 'en' ? 'hi' : 'en'));
  };

  const t = (path) => {
    const keys = path.split('.');
    let current = translations[language] || translations['en'];
    for (const key of keys) {
      if (current && current[key] !== undefined) {
        current = current[key];
      } else {
        // Fallback to English
        let fallback = translations['en'];
        for (const fKey of keys) {
          if (fallback && fallback[fKey] !== undefined) {
            fallback = fallback[fKey];
          } else {
            return path;
          }
        }
        return fallback;
      }
    }
    return current;
  };

  return (
    <LanguageContext.Provider value={{ language, setLanguage, toggleLanguage, t }}>
      {children}
    </LanguageContext.Provider>
  );
};
