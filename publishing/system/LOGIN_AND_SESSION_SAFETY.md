# RTechLab Session & Login Safety Directives
## Zero-Trust Credential Security Policy

**Applies to:** Antigravity AI Agents, Automation Scripts, Video Publishing Subagents, and Human Operators  
**Brand:** RTechLab (@RTechLabOfficial)

---

## 1. Cardinal Security Directives

1. **NEVER Solicit or Store Passwords:**
   Under no circumstances will any AI assistant, automated script, configuration file, or log file request, record, accept, or persist passwords, security questions, or private credentials for Google, YouTube, Instagram, Meta, GitHub, or any third-party service.

2. **NEVER Bypass or Automate Two-Factor Authentication (2FA):**
   SMS OTPs, Google Authenticator codes, security keys, or biometric prompts must ONLY be handled directly and personally by Rahul Sir. Automated interception or bypass of security gates is strictly prohibited.

3. **Session Boundary Isolation:**
   When browser automation tools (e.g. Chrome DevTools, Playwright, or Puppeteer) are used:
   - They must attach to a designated debugging browser port or launch a user-supervised browser window.
   - The user (Rahul Sir) performs the initial manual sign-in and completes all 2FA checks.
   - Once authenticated, automation acts exclusively on UI navigation, metadata population, and file staging.

4. **Public Release Air-Gap:**
   No automated tool may set a video or post status to **`PUBLIC`** on initial submission:
   - YouTube: Uploads must default to **`UNLISTED`** or **`DRAFT`**.
   - Instagram: Posts and Reels must default to **`DRAFT`**.
   - Public visibility promotion requires affirmative, written approval from Rahul Sir.

5. **No Token Dumping in Logs or Repositories:**
   OAuth access tokens, refresh tokens, and session cookies must never be committed to git, written to markdown artifacts, or printed in terminal console outputs. All repository ignores (`.gitignore`) must safeguard `.env`, `credentials.json`, and session caches.

---

## 2. Emergency Revocation Protocol

If an unexpected session behavior or authorization anomaly occurs during an upload workflow:
1. Immediately terminate all active agent browser processes.
2. Visit `https://myaccount.google.com/permissions` $\to$ terminate suspicious sessions.
3. On Instagram / Meta Accounts Center $\to$ review active sessions and revoke unknown device tokens.
4. Notify Rahul Sir immediately.
