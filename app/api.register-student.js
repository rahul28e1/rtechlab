import fs from 'node:fs';
import path from 'node:path';

// Server-side action to register student leads, save to persistent storage,
// and optionally dispatch an automated delivery email via Resend or Google Sheets.
export async function action({ request }) {
  if (request.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  try {
    const data = await request.json();
    const {
      name = '',
      email = '',
      phone = '',
      language = 'en',
      subject = 'fundamentals',
      subjectTitle = 'Computer Fundamentals',
      plan = 'bundle',
      price = 149,
    } = data;

    if (!email || !email.includes('@')) {
      return new Response(JSON.stringify({ error: 'Valid email is required' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const timestamp = new Date().toISOString();
    const dataDir = path.resolve(process.cwd(), 'data');
    if (!fs.existsSync(dataDir)) {
      fs.mkdirSync(dataDir, { recursive: true });
    }

    // 1. Append to local CSV for zero-dependency local ledger
    const csvPath = path.join(dataDir, 'student_leads.csv');
    const csvRow = `"${timestamp}","${name.replace(/"/g, '""')}","${email.replace(/"/g, '""')}","${phone.replace(/"/g, '""')}","${language}","${subject}","${plan}","${price}"\n`;

    if (!fs.existsSync(csvPath)) {
      fs.writeFileSync(csvPath, 'Timestamp,Name,Email,Phone,Language,Subject,Plan,Price\n', 'utf8');
    }
    fs.appendFileSync(csvPath, csvRow, 'utf8');

    // 2. Append to JSON array
    const jsonPath = path.join(dataDir, 'student_leads.json');
    let leadsList = [];
    if (fs.existsSync(jsonPath)) {
      try {
        leadsList = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
      } catch {
        leadsList = [];
      }
    }
    leadsList.push({ timestamp, name, email, phone, language, subject, subjectTitle, plan, price });
    fs.writeFileSync(jsonPath, JSON.stringify(leadsList, null, 2), 'utf8');

    let emailSent = false;
    let emailStatus = 'Saved to database';

    // Helper to resolve Resend API key reliably
    let resendKey = process.env.RESEND_API_KEY;
    let fromEmail = process.env.EMAIL_FROM || 'RTechLab Publishing <onboarding@resend.dev>';
    if (!resendKey) {
      try {
        const envPath = path.resolve(process.cwd(), '.env');
        if (fs.existsSync(envPath)) {
          const envContent = fs.readFileSync(envPath, 'utf8');
          const keyMatch = envContent.match(/^RESEND_API_KEY\s*=\s*(.*)$/m);
          if (keyMatch) resendKey = keyMatch[1].trim();
          const fromMatch = envContent.match(/^EMAIL_FROM\s*=\s*(.*)$/m);
          if (fromMatch) fromEmail = fromMatch[1].trim();
        }
      } catch {}
    }

    // 3. Optional: Trigger Resend API if API Key is configured
    if (resendKey) {
      try {
        const baseUrl = process.env.VITE_SITE_URL || 'https://rtechlab.com';
        const downloadUrl = language === 'hi'
          ? `${baseUrl}/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf`
          : `${baseUrl}/downloads/Computer-Fundamentals-English-Edition-1.pdf`;

        const bundleZipUrl = `${baseUrl}/downloads/RTechLab-Computer-Fundamentals-Premium-Suite-Edition-1.zip`;

        const emailHtml = `
          <div style="font-family: Arial, sans-serif; background: #0b0c10; color: #ffffff; padding: 24px; border-radius: 12px; max-width: 600px; margin: 0 auto;">
            <div style="text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 16px; margin-bottom: 20px;">
              <h1 style="color: #10b981; margin: 0; font-size: 24px;">RTechLab Official Digital Delivery</h1>
              <p style="color: #9ca3af; margin: 4px 0 0; font-size: 14px;">Authorized Industrial Notes · 2027 Edition 1</p>
            </div>
            <p>Hello <strong>${name || 'Student'}</strong>,</p>
            <p>Thank you for choosing RTechLab! Your digital access for <strong>${subjectTitle} (${language === 'hi' ? 'हिंदी Edition 1' : 'English Edition 1'})</strong> is ready.</p>
            
            <div style="background: rgba(16, 185, 129, 0.1); border: 1px solid rgba(16, 185, 129, 0.3); padding: 16px; border-radius: 8px; margin: 20px 0;">
              <h3 style="color: #10b981; margin-top: 0;">📥 Direct Download Links:</h3>
              <p style="margin: 8px 0;"><a href="${downloadUrl}" style="color: #38bdf8; font-weight: bold; text-decoration: underline;">👉 Download Core Master Edition (${language === 'hi' ? 'हिंदी Edition 1' : 'English Edition 1'})</a></p>
              ${plan === 'bundle' ? `<p style="margin: 8px 0;"><a href="${bundleZipUrl}" style="color: #34d399; font-weight: bold; text-decoration: underline;">👉 Download Complete 5-in-1 Suite (.ZIP Bundle - 30 MB)</a></p>` : ''}
            </div>

            <p style="color: #9ca3af; font-size: 12px; line-height: 1.5;">
              <strong>Lifetime Updates Guarantee:</strong> Whenever our core engineering team publishes minor corrections or yearly technical updates, you will receive the upgraded edition directly on this email at zero extra cost.
            </p>
            <hr style="border: none; border-top: 1px solid rgba(255,255,255,0.1); margin: 24px 0;" />
            <p style="color: #6b7280; font-size: 11px; text-align: center;">
              RTechLab Core Systems · Author: Rahul Patel · <a href="${baseUrl}" style="color: #9ca3af;">${baseUrl}</a>
            </p>
          </div>
        `;

        const resendRes = await fetch('https://api.resend.com/emails', {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${resendKey}`,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            from: fromEmail,
            to: [email],
            subject: `[RTechLab] Your ${subjectTitle} (${language === 'hi' ? 'हिंदी' : 'English'}) Digital Access`,
            html: emailHtml,
          }),
        });

        const resData = await resendRes.json();
        if (resendRes.ok) {
          emailSent = true;
          emailStatus = `Email dispatched (ID: ${resData.id})`;
        } else {
          emailStatus = `Resend: ${resData.message || 'Validation error'}`;
        }
      } catch (e) {
        console.error('Failed to send email via Resend:', e);
        emailStatus = `Error: ${e.message}`;
      }
    }

    return new Response(JSON.stringify({
      success: true,
      emailSent,
      emailStatus,
      record: { name, email, language, plan },
      message: 'Student registered successfully',
    }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (err) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
}
