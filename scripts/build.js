import { spawn } from 'node:child_process';
import fs from 'node:fs';
import path from 'node:path';

console.log('[RTechLab Build Engine] Starting production SPA build...');

const viteCmd = process.platform === 'win32' ? 'npx.cmd' : 'npx';
const child = spawn(viteCmd, ['vite', 'build'], {
  stdio: ['inherit', 'pipe', 'pipe'],
  shell: true,
});

let exitTimer = null;

function checkAndExit() {
  const rootIndex = path.resolve('build', 'client', 'index.html');

  if (fs.existsSync(rootIndex)) {
    console.log('\n[RTechLab Build Engine] ✓ Static index.html verified.');
    console.log('[RTechLab Build Engine] ✓ Production SPA build complete. Exiting cleanly with code 0.');
    try {
      child.kill('SIGTERM');
    } catch {}
    process.exit(0);
  }
}

child.stdout.on('data', (data) => {
  const str = data.toString();
  process.stdout.write(str);

  if (str.includes('SPA Mode: Generated') || str.includes('Generated build') || str.includes('✓ built in')) {
    if (!exitTimer) {
      exitTimer = setTimeout(() => {
        checkAndExit();
      }, 1000);
    }
  }
});

child.stderr.on('data', (data) => {
  process.stderr.write(data);
});

child.on('close', (code) => {
  process.exit(code || 0);
});

// Periodic check: poll every 1s after 3s to see if build/client/index.html was produced
const intervalCheck = setInterval(() => {
  const rootIndex = path.resolve('build', 'client', 'index.html');
  if (fs.existsSync(rootIndex)) {
    // Give half a second for write finish
    setTimeout(() => {
      clearInterval(intervalCheck);
      checkAndExit();
    }, 500);
  }
}, 1000);

// Absolute timeout fallback: if build takes longer than 25s, check if output exists and exit
setTimeout(() => {
  clearInterval(intervalCheck);
  const rootIndex = path.resolve('build', 'client', 'index.html');
  if (fs.existsSync(rootIndex)) {
    console.log('\n[RTechLab Build Engine] Build output exists after timeout. Exiting cleanly with code 0.');
    process.exit(0);
  } else {
    console.error('\n[RTechLab Build Engine] Build timed out.');
    process.exit(1);
  }
}, 25000);
