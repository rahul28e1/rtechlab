import { useEffect, useState, Fragment } from 'react';
import { createFromReadableStream } from 'react-dom/server';
import { getData } from '../ApiClient';
import { formatDownloadLinks } from '../feeds/rss';
import { SUPPORTED_RSS_FEEDS, getRssUrlForPage } from './RssFeedList';

function parseRssFeedData(rssItems, title, lastBuildDate, url) {
  return {
    title,
    url,
    lastBuildDate,
    items: rssItems.map(item => ({
      title: item.title || item.title,
      url: item.url || item.url,
      description: item.description || '',
      content: item.content || '',
      categories: item.categories || [],
      author: item.author || '',
      date: item.date || '',
      enclosure: null
    }))
  };
}

function RssFeedListElement({ type, lang, url, page, title, lastBuildDate }) {
  const [feed, setFeed] = useState();
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    const feedUrl = url || 'https://rtechlab.com/notes/rss.xml';
    getData(feedUrl).then(data => {
      const parsed = parseRssFeedData(
        data.items || [],
        data.title || title || 'RTechLab',
        data.lastBuildDate || lastBuildDate,
        data.url || feedUrl
      );
      setFeed(parsed);
      setLoaded(true);
    });
  }, [url, type, lang, title, lastBuildDate]);

  if (!loaded || !feed) return null;

  return (
    <section className="rss-feed-list">
      <header className="rss-feed-list__header">
        <h2 className="rss-feed-list__title">{feed.title}</h2>
        <div className="rss-feed-list__meta">
          <time className="rss-feed-list__updated" dateTime={feed.lastBuildDate}>
            {new Date(feed.lastBuildDate).toLocaleDateString(undefined, {
              year: 'numeric',
              month: 'long',
              day: 'numeric'
            })}
          </time>
        </div>
      </header>

      <div className="rss-feed-list__items">
        {feed.items.map((item, index) => (
          <article key={index} className="rss-feed-list__item">
            <h3 className="rss-feed-list__item-title">
              <a href={item.url} className="rss-feed-list__item-link" target="_blank" rel="noopener noreferrer">
                {item.title}
              </a>
            </h3>

            {item.description && (
              <div className="rss-feed-list__item-description">
                {item.description}
              </div>
            )}

            {item.enclosure && (
              <a
                href={item.enclosure.url}
                className="rss-feed-list__item-enclosure"
                download={item.enclosure.url.split('/').pop()}
              >
                {item.enclosure.title || 'Download'}
              </a>
            )}

            {item.date && (
              <time className="rss-feed-list__item-date" dateTime={item.date}>
                {new Date(item.date).toLocaleDateString(undefined, {
                  year: 'numeric',
                  month: 'short',
                  day: 'numeric'
                })}
              </time>
            )}
          </article>
        ))}
      </div>
    </section>
  );
}

export function RssFeedList({ type, lang, page, title, lastBuildDate }) {
  const [feedData, setFeedData] = useState(null);

  useEffect(() => {
    const loadFeed = async () => {
      const feedUrl = await getRssUrlForPage({ lang, page });
      const { url: finalUrl, params, feed } = await getData(feedUrl);
      setFeedData({
        url: finalUrl,
        params,
        feed
      });
    };

    loadFeed();
  }, [type, lang, page, title, lastBuildDate]);

  if (!feedData) return null;

  return (
    <RssFeedListElement
      type={type}
      lang={lang}
      url={feedData.url}
      page={page}
      title={title}
      lastBuildDate={lastBuildDate}
      feed={feedData.feed}
    />
  );
}
