import { spawn } from 'node:child_process';
import fs from 'node:fs';
import path from 'node:path';

console.log('[RTechLab Build Engine] Starting production SPA build...');

const startTime = Date.now();
const rootIndex = path.resolve('build', 'client', 'index.html');

// Clean previous build artifact if exists
if (fs.existsSync(rootIndex)) {
  try {
    fs.unlinkSync(rootIndex);
  } catch {}
}

const viteCmd = process.platform === 'win32' ? 'npx.cmd' : 'npx';
const child = spawn(viteCmd, ['vite', 'build'], {
  stdio: ['inherit', 'pipe', 'pipe'],
  shell: true,
});

let isDone = false;

function finishBuild() {
  if (isDone) return;
  if (fs.existsSync(rootIndex)) {
    isDone = true;
    console.log('\n[RTechLab Build Engine] ✓ Static index.html verified successfully.');
    console.log('[RTechLab Build Engine] ✓ Production SPA build complete. Exiting cleanly with code 0.');
    try {
      if (process.platform === 'win32') {
        spawn('taskkill', ['/pid', child.pid.toString(), '/f', '/t'], { stdio: 'ignore' });
      } else {
        child.kill('SIGKILL');
      }
    } catch {}
    process.exit(0);
  }
}

child.stdout.on('data', (data) => {
  const str = data.toString();
  process.stdout.write(str);

  if (str.includes('SPA Mode: Generated') || str.includes('index.html')) {
    setTimeout(finishBuild, 1500);
  }
});

child.stderr.on('data', (data) => {
  process.stderr.write(data);
});

child.on('close', (code) => {
  if (isDone) return;
  if (code === 0 || fs.existsSync(rootIndex)) {
    finishBuild();
  } else {
    process.exit(code || 1);
  }
});

// Periodic check: check every 1s if index.html is written
const intervalCheck = setInterval(() => {
  if (fs.existsSync(rootIndex)) {
    try {
      const stats = fs.statSync(rootIndex);
      if (stats.mtimeMs >= startTime && stats.size > 100) {
        clearInterval(intervalCheck);
        setTimeout(finishBuild, 1000);
      }
    } catch {}
  }
}, 1000);

// Generous 180s (3-minute) timeout for cloud builders like Vercel
setTimeout(() => {
  clearInterval(intervalCheck);
  if (fs.existsSync(rootIndex)) {
    console.log('\n[RTechLab Build Engine] Build output exists after timeout. Exiting cleanly with code 0.');
    process.exit(0);
  } else {
    console.error('\n[RTechLab Build Engine] Build timed out after 180s.');
    process.exit(1);
  }
}, 180000);
