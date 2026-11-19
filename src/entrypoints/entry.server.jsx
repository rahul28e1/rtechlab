import { createRequestHandler as createRequestHandlerBase } from '@react-router/node';

interface Build {
  assets: {
    version: string;
    routes: Record<string, any>;
  };
  entry: {
    module: {
      module: string;
      clientActionModule?: string;
      clientLoaderModule?: string;
      clientMiddlewareModule?: string;
      hydrateFallbackModule?: string;
      handleDataRequest?: Function;
      handleError?: Function;
      instrumentations?: any[];
      streamTimeout?: number;
    };
    router: any;
  };
  routes: Record<string, any>;
  basename: string;
  future: any;
  routeDiscovery: any;
  allowedActionOrigins?: string[];
  ssr: boolean;
  unstable_apiServerOrigin?: string;
  subResourceIntegrity?: boolean;
  buildEnd?: Function;
}

let BUILD: Build | null = null;

function isSpaMode(request: Request) {
  return request.headers.get('x-react-router-spa-mode') === 'yes';
}

function normalizePathname(request: Request, basename: string, future: any) {
  const url = new URL(request.url);
  let pathname = url.pathname;
  const trailingSlashAwareDataRequests = future?.v8_trailingSlashAwareDataRequests === true;
  if (trailingSlashAwareDataRequests) {
    if (pathname.endsWith('/_.data')) {
      pathname = pathname.replace(/_\\.data$/, '');
    } else {
      pathname = pathname.replace(/\\.data$/, '');
    }
  } else {
    if (pathname === basename + '/_root.data') {
      pathname = basename;
    } else if (pathname.endsWith('.data')) {
      pathname = pathname.replace(/\\.data$/, '');
    }
    if (pathname !== basename && pathname.endsWith('/')) {
      pathname = pathname.slice(0, -1);
    }
  }
  const searchParams = new URLSearchParams(url.search);
  searchParams.delete('_routes');
  const search = searchParams.toString();
  return { pathname, search };
}

function getBuildTimeHeader(request: Request, headerName: string) {
  try {
    if (typeof process !== 'undefined' && process.env && process.env.IS_ROUTER_BUILD_REQUEST === 'true') {
      return request.headers.get(headerName);
    }
  } catch { /* */ }
  return null;
}

async function handleManifestRequest(build: Build, dataRoutes: any, branches: any, url: URL) {
  if (url.toString().length > 5000) {
    return new Response(null, { status: 400, statusText: 'Bad Request' });
  }
  if (build.assets.version !== url.searchParams.get('version')) {
    return new Response(null, { status: 204, headers: { 'X-Router-Revalidate-Document': 'yes' } });
  }
  const patches: Record<string, any> = {};
  const pathParam = url.searchParams.get('paths') || '';
  const paths = new Set(pathParam.split(',').filter(Boolean));
  for (const path of paths) {
    const normalizedPath = path.startsWith('/') ? path : '/' + path;
    let matches: any[];
    try {
      const handler = createStaticHandler(dataRoutes, { future: build.future, basename: build.basename });
      matches = handler.query(new Request(url.origin + normalizedPath)).matches;
    } catch { continue; }
    for (const match of matches || []) {
      const routeId = match.route.id;
      const route = build.routes[routeId];
      if (route) patches[routeId] = route;
    }
  }
  return Response.json(patches, { headers: { 'Cache-Control': 'public, max-age=31536000, immutable' } });
}

async function handleSingleFetchRequest(build: Build, staticHandler: any, request: Request, normalizedPath: string, loadContext: any, handleError: (err: unknown) => void) {
  const handlerUrl = new URL(request.url);
  handlerUrl.pathname = normalizedPath;
  const isMutationMethod = ['POST', 'PUT', 'PATCH', 'DELETE'].includes(request.method);
  let result;
  try {
    result = isMutationMethod
      ? await singleFetchAction(build, staticHandler, request, handlerUrl, loadContext, handleError)
      : await singleFetchLoaders(build, staticHandler, request, handlerUrl, loadContext, handleError);
  } catch (err) {
    handleError?.(err);
    return new Response(null, { status: 500 });
  }
  return result instanceof Response ? result : new Response(String(result), { headers: { 'Content-Type': 'application/json' } });
}

async function singleFetchAction(build: Build, staticHandler: any, request: Request, handlerUrl: URL, loadContext: any, handleError: (err: unknown) => void) {
  const origin = request.headers.get('origins');
  const requestUrl = new URL(request.url);
  if (origin && origin !== requestUrl.origin) {
    const allowedOrigins = Array.isArray(build.allowedActionOrigins) ? build.allowedActionOrigins : [];
    if (allowedOrigins && !allowedOrigins.some((allowedOrigin) => {
      if (allowedOrigin.endsWith('.')) {
        const domainParts = origin.split('.');
        const patternParts = allowedOrigin.split('.');
        return domainParts.length === patternParts.length - 1 && patternParts.slice(1).every((p, i) => domainParts[i] === p);
      }
      return allowedOrigin === origin;
    })) {
      handleError?.(new Error('Forbidden'));
      return new Response(null, { status: 403 });
    }
  }
  if (!request.signal.aborted) {
    const body = request.body ? await request.text() : '';
    handlerUrl.searchParams.set('body', body);
    handlerUrl.searchParams.set('method', request.method);
    for (const [key, value] of request.headers) {
      handlerUrl.searchParams.append('header.' + key, value);
    }
  }
  const queryResult = await staticHandler.query(new Request(handlerUrl.toString(), { headers: request.headers, signal: request.signal }), {
    requestContext: loadContext,
    generateMiddlewareResponse: build.future?.v8_middleware ? async (query: any) => {
      try {
        const innerResult = await query(new Request(handlerUrl.toString(), { headers: request.headers, signal: request.signal }));
        return innerResult;
      } catch (err) { return err; }
    } : undefined,
    normalizePath: (r: any) => ({ pathname: r.pathname.replace(/\/$/, '') || '/' }),
  });
  return queryResult instanceof Response ? queryResult : new Response(String(queryResult), { headers: { 'Content-Type': 'application/json' } });
}

async function singleFetchLoaders(build: Build, staticHandler: any, request: Request, handlerUrl: URL, loadContext: any, handleError: (err: unknown) => void) {
  const routesParam = handlerUrl.searchParams.get('_routes');
  const loadRouteIds = routesParam ? new Set(routesParam.split(',')) : null;
  const queryResult = await staticHandler.query(new Request(handlerUrl.toString(), { headers: request.headers, signal: request.signal }), {
    requestContext: loadContext,
    filterMatchesToLoad: (m: any) => !loadRouteIds || loadRouteIds.has(m.route.id),
    generateMiddlewareResponse: build.future?.v8_middleware ? async (query: any) => {
      try {
        const innerResult = await query(new Request(handlerUrl.toString(), { headers: request.headers, signal: request.signal }));
        return innerResult;
      } catch (err) { return err; }
    } : undefined,
    normalizePath: (r: any) => ({ pathname: r.pathname.replace(/\/$/, '') || '/' }),
  });
  return queryResult instanceof Response ? queryResult : new Response(String(queryResult), { headers: { 'Content-Type': 'application/json' } });
}

export default async function handleRequest(request: Request): Promise<Response> {
  if (!BUILD) {
    BUILD = await loadBuild();
  }
  const handler = createRequestHandler(BUILD, 'production');
  return handler(request);
}
