import { getData } from './ApiClient';
import { formatDownloadLinks } from 'feeds/rss';

const SUPPORTED_RSS_FEEDS = [
  {
    title: 'Hindi CCNA Notes RSS Feed',
    url: 'https://rtechlab.com/hi/notes/rss.xml',
    lang: 'hi'
  },
  {
    title: 'English CCNA Notes RSS Feed',
    url: 'https://rtechlab.com/notes/rss.xml',
    lang: 'en'
  }
];

function getDefaultFeedUrl() {
  return SUPPORTED_RSS_FEEDS[0].url;
}

async function getRssFeedUrl({ lang }) {
  if (!lang) return getDefaultFeedUrl();
  const match = SUPPORTED_RSS_FEEDS.find(feed => feed.lang === lang);
  return match ? match.url : getDefaultFeedUrl();
}

function chooseLanguageFromUrl(url) {
  if (url.startsWith('/hi/')) return 'hi';
  if (url.startsWith('/en/')) return 'en';
  return 'en';
}

function normalizeUrl(url) {
  return url.replace(/\/+$/, '');
}

async function buildRssItems({ type, lang, url, page, title, lastBuildDate }) {
  const rssItems = [];
  const rssParams = { type, lang, url, page, title, lastBuildDate };

  for (const feed of SUPPORTED_RSS_FEEDS) {
    const feedUrl = normalizeUrl(feed.url);
    const feedLang = feed.lang;
    const feedTitle = feed.title;

    const pageUrl = new URL(page || '/');
    if (pageUrl.pathname === '/') {
      const baseUrl = feedUrl.replace(/\/+$/, '');
      const pagePath = '/';
      rssItems.push({
        url: baseUrl + pagePath,
        title: feedTitle,
        lastBuildDate,
        rssParams
      });
    }
  }

  return {
    rssItems,
    rssParams
  };
}

function convertRssItemsToFeed({ rssItems, title, lastBuildDate, url }) {
  const items = rssItems.map(item => {
    const itemTitle = item.title || title || '';
    const itemUrl = item.url || url || '';
    const itemDate = item.lastBuildDate || lastBuildDate;

    return {
      title: itemTitle,
      url: itemUrl,
      date: itemDate,
      description: '',
      content: '',
      categories: [],
      author: '',
      commentsUrl: '',
      enclosure: null
    };
  });

  return {
    title,
    url,
    lastBuildDate,
    items
  };
}

export async function getRssFeed({ type, lang, url, page, title, lastBuildDate }) {
  const defaultUrl = getDefaultFeedUrl();
  const feedUrl = await getRssFeedUrl({ lang });
  const rssItems = await buildRssItems({
    type,
    lang,
    url: feedUrl,
    page,
    title,
    lastBuildDate
  });

  const feed = convertRssItemsToFeed({
    rssItems: rssItems.rssItems,
    title: rssItems.rssParams.title || title || 'RTechLab',
    lastBuildDate: rssItems.rssParams.lastBuildDate,
    url: rssItems.rssParams.url || feedUrl
  });

  return {
    url: feedUrl,
    params: rssItems.rssParams,
    feed
  };
}

export async function getRssFeedForPage({ type, lang, title, lastBuildDate, page }) {
  const url = await getRssFeedUrl({ lang });
  const fullPage = new URL(page, 'https://rtechlab.com/');
  return getRssFeed({
    type,
    lang,
    url,
    page: fullPage.pathname,
    title,
    lastBuildDate
  });
}

export async function getRssFeedList({ type, lang, page, title, lastBuildDate }) {
  return getRssFeed({
    type,
    lang,
    page,
    title,
    lastBuildDate
  });
}

export async function getRssUrlForPage({ lang, page }) {
  if (!page) return getDefaultFeedUrl();
  const pageUrl = new URL(page, 'https://rtechlab.com/');
  const feedUrl = pageUrl.pathname.startsWith('/hi/')
    ? 'https://rtechlab.com/hi/notes/rss.xml'
    : 'https://rtechlab.com/notes/rss.xml';
  return feedUrl;
}
