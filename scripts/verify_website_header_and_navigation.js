import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const rootDir = path.resolve(__dirname, '..');

console.log('====================================================');
console.log('RTechLab: Website Header & Mobile Navigation Audit');
console.log('====================================================\n');

let passed = 0;
let failed = 0;

function check(desc, condition) {
  if (condition) {
    console.log(`  [PASS] ${desc}`);
    passed++;
  } else {
    console.error(`  [FAIL] ${desc}`);
    failed++;
  }
}

// 1. Source Code Verification: Navbar.jsx
const navbarPath = path.join(rootDir, 'src', 'components', 'Navbar.jsx');
const navbarSrc = fs.readFileSync(navbarPath, 'utf8');

check('Navbar imports Logo component', navbarSrc.includes("import { Logo } from './Logo'"));
check('Navbar contains desktop brand logo link', navbarSrc.includes('<Logo size="md" showTagline={false} />'));
check('Navbar contains mobile brand drawer card', navbarSrc.includes('<Logo size="md" showTagline={true} />'));
check('Navbar contains search trigger (Ctrl+K)', navbarSrc.includes('onOpenSearch'));
check('Navbar contains language switcher toggle', navbarSrc.includes('toggleLanguage'));
check('Navbar contains Start Learning CTA', navbarSrc.includes("t('nav.startLearning')"));
check('Navbar contains mobile hamburger menu button', navbarSrc.includes('setMobileMenuOpen'));
check('Navbar contains smooth-scroll navigation targets', 
  navbarSrc.includes("'hero'") && 
  navbarSrc.includes("'categories'") && 
  navbarSrc.includes("'tools'") && 
  navbarSrc.includes("'tutorials'") && 
  navbarSrc.includes("'interview'") && 
  navbarSrc.includes("'resources'") && 
  navbarSrc.includes("'about'")
);

// 2. Source Code Verification: Logo.jsx
const logoPath = path.join(rootDir, 'src', 'components', 'Logo.jsx');
const logoSrc = fs.readFileSync(logoPath, 'utf8');

check('Logo references official approved icon (/brand/rtechlab-icon.png)', logoSrc.includes('/brand/rtechlab-icon.png'));
check('Logo contains official wordmark typography (RTechLab)', logoSrc.includes('RTech') && logoSrc.includes('Lab'));
check('Logo contains official tagline (Learn • Practice • Innovate)', logoSrc.includes('Learn • Practice • Innovate'));
check('Logo supports responsive size mappings (sm, md, lg)', logoSrc.includes('sizeMap'));

// 3. Live Server Response Verification
async function checkLiveServer() {
  try {
    const res = await fetch('http://localhost:5173');
    check('Live server is running on http://localhost:5173', res.status === 200);

    const html = await res.text();
    check('HTML includes official favicon.ico', html.includes('/brand/favicon.ico'));
    check('HTML includes official favicon-32x32.png', html.includes('/brand/favicon-32x32.png'));
    check('HTML includes official favicon-192x192.png', html.includes('/brand/favicon-192x192.png'));
    check('HTML includes official master OpenGraph image (/brand/rtechlab-master.png)', html.includes('/brand/rtechlab-master.png'));
    check('HTML includes JetBrains Mono and Plus Jakarta Sans fonts', html.includes('JetBrains+Mono') && html.includes('Plus+Jakarta+Sans'));
  } catch (err) {
    console.error('Error connecting to live server:', err.message);
  }

  try {
    const resAbout = await fetch('http://localhost:5173/about');
    check('Live server responds to /about route', resAbout.status === 200);
  } catch (err) {
    console.error('Error connecting to /about route:', err.message);
  }

  console.log('\n====================================================');
  console.log(`Audit Complete: ${passed} Passed, ${failed} Failed.`);
  console.log('====================================================');
}

checkLiveServer();
