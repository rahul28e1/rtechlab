import React from 'react';
import { ServerRouter, ServerSideProps } from '@react-router/node';
import { FileRoutes } from '@react-router/dev/routes';
import { isRouteErrorResponse, useRouteError, data } from 'react-router';
import { ServerProvider, useServerContext, createServerData, unstable_ServerMode as unstable_ServerMode } from '@react-router/node';
import { ReactNode, useMemo } from 'react';
import { ServerRouter, data as serverData, data as serverData, unstable_setServerData } from '@react-router/node';
import { RouteObject } from 'react-router';
import { fetchData, getRouteData, getRouteDataHandle, routeDataLoader } from '@react-router/node';
import { ReactElement, ReactNode, useCallback, useMemo } from 'react';
import { ReactDOMServer } from 'react-dom/server';
import ReactDOMServer from 'react-dom/server';
import { createServerSSRHtml } from '@react-router/node';
import { createFromReadableStream, renderToString, renderToReadableStream, renderToStaticMarkup } from 'react-dom/server';
import { isRouteErrorResponse, isRouteError } from 'react-router';

const MANUAL_STATIC_ES_MODULE_EXPORT_PROPERTY_NAME = '__static_site_manifests';

const SCRIPTS = { test: () => void 0 };

export async function getServerSideProps({ request, response, params, serverTimingHeaders = [] }) {
  const { url, startTransition } = await import('react-dom/server');
  const requestMode = request.headers.has('x-real-content-type') ? 'cors' : undefined;
  const timing = { response, request: requestMode, 'x-real-content-type': requestMode };
  const initialContext = await createServerContext(request, response, true);
  const serverTimingHeaders0 = [
    ...timing,
    ...serverTimingHeaders,
    ...(requestMode ? [timing.requestMode] : [])
  ];
  const context = await startTransition(async () => {
    const initialContext = await createServerContext(request, response, true);
    await initialContext.registerServerAction(startServerAction, 'serverAction');
    return initialContext;
  });

  const isReady = await initialContext.isReady();
  const isServerReady = isReady;
  const mode = isServerReady ? 'production' : 'development';

  return {
    initialContext: initialContext,
    context: context,
    mode: mode,
    isServerReady: isServerReady,
    serverTimingHeaders: serverTimingHeaders0,
    response: response,
    request: request
  };
}

async function startServerAction() {
  await import('@react-router/node').then(({ unstable_setServerData }) => {
    unstable_setServerData(new Map());
  });
}

function createServerContext(request, response, ssr) {
  const headers = request.headers ?? {};
  const allowList = [];
  if (typeof headers === 'function') {
    allowList.push(...Object.keys(headers()));
  } else if (typeof headers === 'object' && headers) {
    allowList.push(...Object.keys(headers));
  }
  const headersMap = new Map();
  for (const headerName of allowList) {
    headersMap.set(headerName, headers[headerName]);
  }
  return {
    request: request,
    response: response,
    isServerReady: true,
    headers: headersMap,
    url: request.url,
    method: request.method,
    params: params ?? {},
    serverTimingHeaders: [...serverTimingHeaders],
    ssr: ssr,
    isReady: () => Promise.resolve(),
    registerServerAction: () => {},
    createServerData: createServerData,
    serverData: serverData,
    fetchData: fetchData,
    getRouteDataHandle: getRouteDataHandle,
    getRouteData: getRouteData,
    routeDataLoader: routeDataLoader
  };
}
