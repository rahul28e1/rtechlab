#!/usr/bin/env node
/**
 * RTechLab Lifetime Updates Broadcast Engine
 * 
 * Automatically queries all captured payments from Razorpay for a specific subject,
 * filters unique student emails, and dispatches the new Edition update via Gmail SMTP.
 * 
 * Usage:
 *   node scripts/broadcast-update.cjs --subject=ccna --edition=2 --dry-run
 *   node scripts/broadcast-update.cjs --subject=ccna --edition=2 --file=CCNA-200-301-English-Edition-2.pdf
 */

const fs = require('fs');
const path = require('path');
const Razorpay = require('razorpay');
const nodemailer = require('nodemailer');

// Load environment variables from .env
function loadEnv() {
  const envPath = path.resolve(process.cwd(), '.env');
  if (fs.existsSync(envPath)) {
    const lines = fs.readFileSync(envPath, 'utf8').split('\n');
    for (const line of lines) {
      const trimmed = line.trim();
      if (trimmed && !trimmed.startsWith('#')) {
        const idx = trimmed.indexOf('=');
        if (idx > -1) {
          const k = trimmed.slice(0, idx).trim();
          const v = trimmed.slice(idx + 1).trim().replace(/^["']|["']$/g, '');
          if (!process.env[k]) process.env[k] = v;
        }
      }
    }
  }
}
loadEnv();

// Parse CLI flags
const args = process.argv.slice(2);
const options = {};
for (const arg of args) {
  if (arg.startsWith('--')) {
    const [k, v] = arg.slice(2).split('=');
    options[k] = v === undefined ? true : v;
  }
}

const targetSubject = options.subject || 'ccna';
const targetEdition = options.edition || '2';
const isDryRun = !!options['dry-run'];
const newFileName = options.file || `${targetSubject.toUpperCase()}-Edition-${targetEdition}.pdf`;
const newDownloadUrl = options.url || `https://rtechlab.vercel.app/downloads/${newFileName}`;

console.log('=================================================================');
console.log('🚀 RTechLab Lifetime Updates Broadcast Engine');
console.log('=================================================================');
console.log(`Target Subject:  ${targetSubject}`);
console.log(`New Edition:     Edition ${targetEdition}`);
console.log(`Download URL:    ${newDownloadUrl}`);
console.log(`Mode:            ${isDryRun ? 'DRY-RUN (Simulated, no emails sent)' : 'LIVE DISPATCH'}`);
console.log('-----------------------------------------------------------------');

async function main() {
  const key_id = process.env.RAZORPAY_KEY_ID;
  const key_secret = process.env.RAZORPAY_KEY_SECRET;
  const gmailUser = process.env.GMAIL_USER || 'rahul.28e1@gmail.com';
  const gmailPass = (process.env.GMAIL_APP_PASSWORD || '').replace(/["'\s]/g, '');

  if (!key_id || !key_secret) {
    console.error('❌ Error: RAZORPAY_KEY_ID or RAZORPAY_KEY_SECRET missing in .env');
    process.exit(1);
  }

  const razorpay = new Razorpay({ key_id, key_secret });

  console.log('🔍 Fetching captured transactions from Razorpay...');
  let hasMore = true;
  let skip = 0;
  const limit = 100;
  const studentsMap = new Map();

  while (hasMore) {
    const res = await razorpay.payments.all({ count: limit, skip });
    const items = res.items || [];
    if (items.length === 0) break;

    for (const p of items) {
      if (p.status !== 'captured') continue;
      const notes = p.notes || {};
      const sub = (notes.subject || '').toLowerCase();
      
      // Check if this payment matches target subject
      if (sub === targetSubject.toLowerCase() || targetSubject === 'all') {
        const studentEmail = (notes.studentEmail || p.email || '').toLowerCase().trim();
        const studentName = notes.studentName || 'Student';
        const phone = notes.studentPhone || p.contact || '';
        const lang = notes.language || 'en';

        if (studentEmail && studentEmail.includes('@') && !studentsMap.has(studentEmail)) {
          studentsMap.set(studentEmail, {
            name: studentName,
            email: studentEmail,
            phone,
            lang,
            paidAmount: p.amount / 100,
            originalPaymentId: p.id,
            purchaseDate: new Date(p.created_at * 1000).toLocaleDateString('en-IN')
          });
        }
      }
    }

    if (items.length < limit) {
      hasMore = false;
    } else {
      skip += limit;
    }
  }

  const eligibleStudents = Array.from(studentsMap.values());
  console.log(`\n✓ Found ${eligibleStudents.length} eligible students who previously purchased ${targetSubject.toUpperCase()}:`);
  eligibleStudents.forEach((s, idx) => {
    console.log(`  ${idx + 1}. ${s.name} (${s.email}) — Original Order: ${s.originalPaymentId} on ${s.purchaseDate}`);
  });

  if (eligibleStudents.length === 0) {
    console.log('\n⚠️ No students found for this subject. Ensure subject matches notes.subject.');
    return;
  }

  if (isDryRun) {
    console.log('\n🔍 DRY RUN COMPLETE. Remove --dry-run to broadcast emails.');
    return;
  }

  if (!gmailPass) {
    console.error('❌ Error: GMAIL_APP_PASSWORD missing in .env. Cannot dispatch emails.');
    process.exit(1);
  }

  const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: { user: gmailUser, pass: gmailPass }
  });

  await transporter.verify();
  console.log('\n✓ Gmail SMTP Verified. Starting automated broadcast dispatch...');

  let successCount = 0;
  for (const student of eligibleStudents) {
    const emailSubject = `🎉 Lifetime Free Upgrade: Your ${targetSubject.toUpperCase()} Edition ${targetEdition} Is Ready!`;
    const emailHtml = `
      <div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background: #0b0c10; color: #ffffff; padding: 24px; border-radius: 12px; max-width: 600px; margin: 0 auto; border: 1px solid rgba(255,255,255,0.1);">
        <div style="text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 16px; margin-bottom: 20px;">
          <h1 style="color: #10b981; margin: 0; font-size: 22px;">🎉 Lifetime Free Update Activated</h1>
          <p style="color: #9ca3af; margin: 4px 0 0; font-size: 13px;">Official Release · Edition ${targetEdition} Upgrade</p>
        </div>
        <p style="font-size: 15px;">Dear <strong>${student.name}</strong>,</p>
        <p style="color: #d1d5db; line-height: 1.6; font-size: 14px;">
          As guaranteed during your initial enrollment, all future revisions and major upgrades of RTechLab notes are <strong>100% free forever</strong> for our students.
        </p>
        <p style="color: #d1d5db; line-height: 1.6; font-size: 14px;">
          We have just released <strong>${targetSubject.toUpperCase()} — Edition ${targetEdition}</strong> with updated industrial case studies, syllabus enhancements, and new interview vaults.
        </p>

        <div style="background: rgba(16, 185, 129, 0.08); border: 2px solid #10b981; padding: 20px; border-radius: 12px; margin: 24px 0; text-align: center;">
          <h3 style="color: #10b981; margin-top: 0; font-size: 17px; text-transform: uppercase;">📥 Download Edition ${targetEdition} (₹0 Free Upgrade)</h3>
          <div style="margin: 16px 0;">
            <a href="${newDownloadUrl}" download style="display: block; background: #10b981; color: #000000; font-weight: 900; font-size: 15px; padding: 14px 20px; border-radius: 8px; text-decoration: none; box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);">
              ⚡ 1-CLICK DIRECT DOWNLOAD (EDITION ${targetEdition})
            </a>
          </div>
          <p style="color: #9ca3af; font-size: 11px; margin: 0;">Direct offline file download. No website login required.</p>
        </div>

        <div style="background: rgba(255,255,255,0.03); border: 1px solid rgba(255,255,255,0.08); padding: 14px; border-radius: 8px; font-size: 12px; color: #9ca3af; line-height: 1.6;">
          <p style="margin: 0;"><strong>Original Order Reference:</strong> ${student.originalPaymentId} · Registered to: ${student.email}</p>
        </div>

        <div style="text-align: center; margin-top: 24px; font-size: 11px; color: #6b7280;">
          RTechLab Technical Academy · Official Digital Publications · Author: Rahul Patel
        </div>
      </div>
    `;

    try {
      await transporter.sendMail({
        from: `"Rahul Sir · RTechLab" <${gmailUser}>`,
        to: student.email,
        replyTo: gmailUser,
        subject: emailSubject,
        html: emailHtml
      });
      console.log(`  ✓ Sent Edition ${targetEdition} to ${student.name} (${student.email})`);
      successCount++;
    } catch (err) {
      console.error(`  ❌ Failed sending to ${student.email}:`, err.message);
    }
  }

  console.log(`\n🎉 Broadcast Complete! Successfully dispatched to ${successCount}/${eligibleStudents.length} students.`);
}

main().catch(console.error);
