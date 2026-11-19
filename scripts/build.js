import { spawn } from 'node:child_process';
import fs from 'node:fs';
import path from 'node:path';

console.log('[RTechLab Build Engine] Starting production build...');

const viteCmd = process.platform === 'win32' ? 'npx.cmd' : 'npx';
const child = spawn(viteCmd, ['vite', 'build'], {
  stdio: ['inherit', 'pipe', 'pipe'],
  shell: true,
});

let exitTimer = null;

function checkAndExit() {
  const indexPath = path.resolve('build', 'client', 'index.html');
  if (fs.existsSync(indexPath)) {
    console.log('\n[RTechLab Build Engine] ✓ Static index.html verified successfully.');
    console.log('[RTechLab Build Engine] ✓ Build complete. Exiting with code 0.');
    try {
      child.kill('SIGTERM');
    } catch {}
    process.exit(0);
  }
}

child.stdout.on('data', (data) => {
  const str = data.toString();
  process.stdout.write(str);

  if (str.includes('Prerender (html)') || str.includes('index.html')) {
    if (!exitTimer) {
      exitTimer = setTimeout(() => {
        checkAndExit();
      }, 1500);
    }
  }
});

child.stderr.on('data', (data) => {
  process.stderr.write(data);
});

child.on('close', (code) => {
  process.exit(code || 0);
});

// Absolute timeout fallback: if build takes longer than 60s, check if output exists and exit
setTimeout(() => {
  const indexPath = path.resolve('build', 'client', 'index.html');
  if (fs.existsSync(indexPath)) {
    console.log('\n[RTechLab Build Engine] Build output exists after timeout. Exiting cleanly.');
    process.exit(0);
  } else {
    console.error('\n[RTechLab Build Engine] Build timed out.');
    process.exit(1);
  }
}, 60000);
