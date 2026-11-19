export const C = {
  client: '#38bdf8',
  router: '#f5a623',
  switch: '#30d158',
  server: '#bf5af2',
  cloud: '#2997ff',
  ok: '#30d158',
  warn: '#ffd60a',
  danger: '#ff6b6b',
  text: '#f5f5f7',
  muted: 'rgba(255,255,255,0.42)',
};

export const SANS = '-apple-system, BlinkMacSystemFont, "Segoe UI", Inter, sans-serif';
export const MONO = 'ui-monospace, SFMono-Regular, Menlo, Consolas, monospace';

export const SCENE_W = 1200;
export const SCENE_H = 520;
export const LANE_Y = 300;
export const CAM_ASPECT = 1.85;

const MARGINS = { 1: 0, 2: 380, 3: 300, 4: 200, 5: 160 };
const CAM_H = 330;

export const positionsFor = (count) => {
  if (count === 1) return [SCENE_W / 2];
  const margin = MARGINS[count] || 140;
  const span = SCENE_W - margin * 2;
  return Array.from({ length: count }, (_, index) => margin + (span * index) / (count - 1));
};

// Frame the pair tightly: a fixed 330-unit tall window, widened only when the
// two devices sit far apart.
export const cameraFor = (a, b) => {
  const needed = Math.abs(a.x - b.x) + 190;
  const width = Math.min(Math.max(needed, CAM_H * CAM_ASPECT), SCENE_W);
  const height = CAM_H;
  const centerX = (a.x + b.x) / 2;
  const centerY = 320;
  const x = Math.max(0, Math.min(centerX - width / 2, SCENE_W - width));
  const y = Math.max(0, Math.min(centerY - height / 2, SCENE_H - height));
  return [x, y, width, height];
};
