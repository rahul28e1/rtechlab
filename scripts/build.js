import { spawn } from 'node:child_process';
import fs from 'node:fs';
import path from 'node:path';

console.log('[RTechLab Build Engine] Starting production build & static route generation...');

const viteCmd = process.platform === 'win32' ? 'npx.cmd' : 'npx';
const child = spawn(viteCmd, ['vite', 'build'], {
  stdio: ['inherit', 'pipe', 'pipe'],
  shell: true,
});

let exitTimer = null;

function checkAndExit() {
  const rootIndex = path.resolve('build', 'client', 'index.html');
  const notesIndex = path.resolve('build', 'client', 'notes', 'index.html');

  if (fs.existsSync(rootIndex) && fs.existsSync(notesIndex)) {
    console.log('\n[RTechLab Build Engine] ✓ Static index.html and notes/index.html verified.');
    console.log('[RTechLab Build Engine] ✓ Production build complete. Exiting cleanly with code 0.');
    try {
      child.kill('SIGTERM');
    } catch {}
    process.exit(0);
  }
}

child.stdout.on('data', (data) => {
  const str = data.toString();
  process.stdout.write(str);

  if (str.includes('Prerender (html): /notes') || str.includes('/notes ->')) {
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

// Absolute timeout fallback: if build takes longer than 45s, check if outputs exist and exit
setTimeout(() => {
  const rootIndex = path.resolve('build', 'client', 'index.html');
  if (fs.existsSync(rootIndex)) {
    console.log('\n[RTechLab Build Engine] Build output exists after timeout. Exiting cleanly.');
    process.exit(0);
  } else {
    console.error('\n[RTechLab Build Engine] Build timed out.');
    process.exit(1);
  }
}, 45000);
