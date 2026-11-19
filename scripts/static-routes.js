import fs from 'node:fs/promises';
import path from 'node:path';
import { createStaticHandler, createStaticRouter, StaticRouterProvider } from 'react-router';
import { renderToReadableStream } from 'react-dom/server';
import { fileURLToPath } from 'node:url';

const here = path.dirname(fileURLToPath(import.meta.url));
const dist = path.resolve(here, '../dist');
const BUILD_ASSETS_FILE = path.resolve(dist, 'react-router-manifest.json');

async function loadBuild() {
  return JSON.parse(await fs.readFile(BUILD_ASSETS_FILE, 'utf8'));
}

async function resolveUrl(build, url) {
  const handler = createStaticHandler(build.routes, { future: build.future });
  const branch = await handler.query(
    new Request(url, { headers: { accept: 'text/html' } }),
    { requestContext: {}, normalizePath: (r) => ({ pathname: r.pathname.replace(/\/$/, '') || '/' }) },
  );
  return branch;
}

async function renderUrl(build, branch, url) {
  const router = createStaticRouter(
    build.routes,
    branch,
  );
  const context = { router, url };
  const stream = await renderToReadableStream(
    <StaticRouterProvider router={router} context={context} hydrate={false} />,
    {
      bootstrapScripts: ['/assets/entry.client.js'],
      onError(error) {
        console.error(error);
      },
    },
  );

  if (isbot(request.headers.get('user-agent') || '')) {
    await stream.allReady;
  }

  const html = await new Response(stream).text();
  return html;
}

async function writeHtml(url, html) {
  const normalized = url.replace(/\/$/, '') || '/';
  const file = path.resolve(dist, normalized, 'index.html');
  await fs.mkdir(path.dirname(file), { recursive: true });
  await fs.writeFile(file, html, 'utf8');
}

async function buildStaticPages() {
  const build = await loadBuild();
  const urls = [
    '/',
    '/about',
    '/privacy',
    '/terms',
    '/disclaimer',
    '/editorial-policy',
    '/contact',
    '/notes',
    '/notes/sample',
    '/tools/subnet-calculator',
    '/tools/dns-lookup',
    '/tools/ip-address-info',
    '/tools/binary-converter',
    '/tools/port-reference',
    '/tools/protocol-explorer',
    '/system-design',
    '/tutorials',
    '/episodes/how-the-internet-works',
  ];

  let written = 0;
  let failed = 0;

  for (const url of urls) {
    try {
      const branch = await resolveUrl(build, url);
      if (!branch || branch.length === 0) {
        console.warn('No match for', url);
        failed += 1;
        continue;
      }
      const html = await renderUrl(build, branch, url);
      await writeHtml(url, html);
      written += 1;
      console.log('rendered', url);
    } catch (err) {
      console.error('failed', url, err.message);
      failed += 1;
    }
  }

  console.log(`Static prerender complete: ${written} rendered, ${failed} failed`);
  return { written, failed };
}

buildStaticPages().catch((err) => {
  console.error(err);
  process.exit(1);
});
