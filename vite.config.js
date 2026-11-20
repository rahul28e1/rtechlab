import { reactRouter } from '@react-router/dev/vite';
import { defineConfig, loadEnv } from 'vite';

const devApiPlugin = () => ({
  name: 'dev-api-plugin',
  configureServer(server) {
    server.middlewares.use(async (req, res, next) => {
      const url = new URL(req.url, 'http://localhost');
      if (url.pathname === '/api/site-status') {
        const { default: handler } = await import('./api/site-status.js');
        res.status = (code) => { res.statusCode = code; return res; };
        res.json = (data) => {
          res.setHeader('Content-Type', 'application/json');
          res.end(JSON.stringify(data));
        };
        req.query = Object.fromEntries(url.searchParams.entries());
        return handler(req, res);
      }
      if (url.pathname === '/api/register-student') {
        let body = '';
        req.on('data', (chunk) => { body += chunk; });
        req.on('end', async () => {
          try {
            req.body = body ? JSON.parse(body) : {};
          } catch {
            req.body = {};
          }
          const { default: handler } = await import('./api/register-student.js');
          res.status = (code) => { res.statusCode = code; return res; };
          res.json = (data) => {
            res.setHeader('Content-Type', 'application/json');
            res.end(JSON.stringify(data));
          };
          return handler(req, res);
        });
        return;
      }
      if (url.pathname === '/api/create-order') {
        let body = '';
        req.on('data', (chunk) => { body += chunk; });
        req.on('end', async () => {
          try {
            req.body = body ? JSON.parse(body) : {};
          } catch {
            req.body = {};
          }
          const { default: handler } = await import('./api/create-order.js');
          res.status = (code) => { res.statusCode = code; return res; };
          res.json = (data) => {
            res.setHeader('Content-Type', 'application/json');
            res.end(JSON.stringify(data));
          };
          return handler(req, res);
        });
        return;
      }
      if (url.pathname === '/api/verify-payment') {
        let body = '';
        req.on('data', (chunk) => { body += chunk; });
        req.on('end', async () => {
          try {
            req.body = body ? JSON.parse(body) : {};
          } catch {
            req.body = {};
          }
          const { default: handler } = await import('./api/verify-payment.js');
          res.status = (code) => { res.statusCode = code; return res; };
          res.json = (data) => {
            res.setHeader('Content-Type', 'application/json');
            res.end(JSON.stringify(data));
          };
          return handler(req, res);
        });
        return;
      }
      next();
    });
  },
});

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), '');
  Object.assign(process.env, env);

  return {
    plugins: [devApiPlugin(), reactRouter()],
    resolve: {
      alias: {
        '~': '/src',
      },
    },
  };
});
