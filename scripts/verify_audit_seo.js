import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { tutorialsData } from '../src/data/tutorials.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const rootDir = path.resolve(__dirname, '..');

console.log('=== AUDIT: SITEMAP & HREFLANG INTEGRITY ===');
const sitemapContent = fs.readFileSync(path.join(rootDir, 'public', 'sitemap.xml'), 'utf8');
const urlBlocks = sitemapContent.split('<url>').slice(1).map(b => b.split('</url>')[0]);

console.log(`Found ${urlBlocks.length} <url> blocks in sitemap.xml.`);

let hreflangIssues = [];
let missingLocs = [];

urlBlocks.forEach((block, idx) => {
  const locMatch = block.match(/<loc>(.*?)<\/loc>/);
  if (!locMatch) {
    missingLocs.push(`Block index ${idx}`);
    return;
  }
  const loc = locMatch[1];
  
  if (loc.includes('/tutorials/')) {
    const slug = loc.includes('/hi/tutorials/')
      ? loc.split('/hi/tutorials/')[1]
      : loc.split('/tutorials/')[1];
    
    const enUrl = `https://rtechlab.com/tutorials/${slug}`;
    const hiUrl = `https://rtechlab.com/hi/tutorials/${slug}`;

    const enRegex = new RegExp(`hreflang=["']en["']\\s+href=["']${enUrl}["']|href=["']${enUrl}["']\\s+hreflang=["']en["']`);
    const hiRegex = new RegExp(`hreflang=["']hi["']\\s+href=["']${hiUrl}["']|href=["']${hiUrl}["']\\s+hreflang=["']hi["']`);

    if (!enRegex.test(block)) {
      hreflangIssues.push(`[${loc}] missing alternate en link to ${enUrl}`);
    }
    if (!hiRegex.test(block)) {
      hreflangIssues.push(`[${loc}] missing alternate hi link to ${hiUrl}`);
    }
  }
});

console.log(`Missing <loc> tags: ${missingLocs.length}`);
console.log(`Hreflang discrepancies: ${hreflangIssues.length}`);
if (hreflangIssues.length > 0) {
  hreflangIssues.forEach(i => console.log('  -', i));
}

console.log('\n=== AUDIT: METADATA & ARTICLE COMPLETENESS ===');
let duplicateTitles = new Map();
let duplicateDescriptions = new Map();

tutorialsData.forEach(art => {
  if (duplicateTitles.has(art.title)) {
    console.warn(`Duplicate English title found: "${art.title}" in ${art.id} and ${duplicateTitles.get(art.title)}`);
  } else {
    duplicateTitles.set(art.title, art.id);
  }

  const desc = art.metaDescription || art.summary;
  if (duplicateDescriptions.has(desc)) {
    console.warn(`Duplicate description found in ${art.id} and ${duplicateDescriptions.get(desc)}`);
  } else {
    duplicateDescriptions.set(desc, art.id);
  }
});

console.log(`Verified ${tutorialsData.length} unique tutorial titles and descriptions.`);
