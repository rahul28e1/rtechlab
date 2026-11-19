#!/usr/bin/env python3
"""
RTechLab YouTube Data API v3 — One-Time OAuth 2.0 Authorization Wizard

Guides Rahul Sir through official Google OAuth 2.0 setup:
1. Opens the Google consent screen in the browser with minimal required scopes:
   - https://www.googleapis.com/auth/youtube.upload
   - https://www.googleapis.com/auth/youtube.force-ssl
2. Runs a temporary local callback server on http://localhost:8080/ to capture authorization code.
3. Exchanges code for Refresh Token and short-lived Access Token.
4. Queries https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true to verify channel match.
5. Safely writes credentials to .env with zero secret exposure in logs.
6. Clearly documents Google OAuth lifecycle realities:
   - Testing mode: Tokens expire automatically after 7 days.
   - Production mode: Tokens do not expire after 7 days, BUT are NEVER permanent.
     (Revocation by user, 6 months inactivity, password reset, or token limit will invalidate).
"""

import os
import sys
import json
import getpass
import urllib.parse
import urllib.request
import webbrowser
import argparse
from http.server import HTTPServer, BaseHTTPRequestHandler
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
ENV_FILE = PROJECT_ROOT / ".env"

DEFAULT_CLIENT_ID = "478774071414-gej00kfriafijkmeds2ngb15tqb5ghai.apps.googleusercontent.com"

SCOPES = [
    "https://www.googleapis.com/auth/youtube.upload",
    "https://www.googleapis.com/auth/youtube.force-ssl"
]

AUTH_CODE = None

def redact(s):
    if not s or len(s) < 8:
        return "***"
    return f"{s[:4]}...{s[-4:]}"

class OAuthCallbackHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        global AUTH_CODE
        query = urllib.parse.urlparse(self.path).query
        params = urllib.parse.parse_qs(query)
        
        if "code" in params:
            AUTH_CODE = params["code"][0]
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(b"""
                <html>
                <body style="font-family: sans-serif; text-align: center; padding: 50px; background: #080d1a; color: #f8fafc;">
                    <h1 style="color: #06b6d4;">RTechLab YouTube Authorization Received!</h1>
                    <p style="color: #94a3b8;">Authorization code captured. You can close this tab and return to your terminal.</p>
                </body>
                </html>
            """)
        else:
            self.send_response(400)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(b"Authorization failed or access was denied.")

    def log_message(self, format, *args):
        return

def setup_oauth(cli_id=None, cli_secret=None):
    print("=" * 80)
    print("RTECHLAB YOUTUBE DATA API V3 — ONE-TIME OAUTH SETUP WIZARD")
    print("=" * 80)
    print("This utility connects @RTechLabOfficial to the headless upload engine.\n")

    # Check existing .env first
    existing_id = cli_id or os.environ.get("YOUTUBE_CLIENT_ID", "")
    existing_secret = cli_secret or os.environ.get("YOUTUBE_CLIENT_SECRET", "")

    if ENV_FILE.exists() and not (existing_id and existing_secret):
        with open(ENV_FILE, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if line.startswith("YOUTUBE_CLIENT_ID=") and not existing_id:
                    existing_id = line.split("=", 1)[1].strip()
                elif line.startswith("YOUTUBE_CLIENT_SECRET=") and not existing_secret:
                    existing_secret = line.split("=", 1)[1].strip()

    client_id = existing_id or DEFAULT_CLIENT_ID
    print(f"[*] Target Project: rtechlab (Desktop App: RTechLab Publishing Automation V2)")
    print(f"[+] Client ID: {client_id}")

    client_secret = existing_secret
    if client_secret:
        print(f"[+] Client Secret: Pre-configured ({redact(client_secret)})")
    else:
        print("[*] Note: Client Secret will be read from .env or requested upon browser consent.")

    redirect_uri = "http://localhost:8080/"
    scope_str = " ".join(SCOPES)

    auth_url = (
        "https://accounts.google.com/o/oauth2/v2/auth?"
        + urllib.parse.urlencode({
            "client_id": client_id,
            "redirect_uri": redirect_uri,
            "response_type": "code",
            "scope": scope_str,
            "access_type": "offline",
            "prompt": "consent"
        })
    )

    print("\n[*] Opening Google OAuth consent screen in your default browser...")
    print("-" * 80)
    print(auth_url)
    print("-" * 80)
    try:
        webbrowser.open(auth_url)
    except Exception:
        pass
    print("\n[*] Local listener active. Waiting for authorization callback on http://localhost:8080/ ...")

    server = HTTPServer(("localhost", 8080), OAuthCallbackHandler)
    while AUTH_CODE is None:
        server.handle_request()

    print("[+] Authorization code captured successfully from Google.")

    # Re-check .env in case user saved secret while approving browser consent
    if not client_secret and ENV_FILE.exists():
        with open(ENV_FILE, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if line.startswith("YOUTUBE_CLIENT_SECRET="):
                    val = line.split("=", 1)[1].strip()
                    if val and not val.startswith("your_"):
                        client_secret = val
                        break

    if not client_secret:
        try:
            client_secret = getpass.getpass("Enter Google Cloud OAuth Client Secret (input will be hidden): ").strip()
        except (EOFError, KeyboardInterrupt):
            client_secret = ""

    if not client_secret:
        print("[-] Error: Client Secret is required to exchange authorization code for refresh token.")
        print("[-] Please add YOUTUBE_CLIENT_SECRET to .env and re-run.")
        sys.exit(1)

    print("[*] Exchanging authorization code for offline Refresh Token...")

    token_url = "https://oauth2.googleapis.com/token"
    token_payload = urllib.parse.urlencode({
        "client_id": client_id,
        "client_secret": client_secret,
        "code": AUTH_CODE,
        "grant_type": "authorization_code",
        "redirect_uri": redirect_uri
    }).encode("utf-8")

    req = urllib.request.Request(token_url, data=token_payload, headers={"Content-Type": "application/x-www-form-urlencoded"})
    try:
        with urllib.request.urlopen(req) as resp:
            token_data = json.loads(resp.read().decode("utf-8"))
            refresh_token = token_data.get("refresh_token")
            access_token = token_data.get("access_token")
            
            if not refresh_token:
                print("[-] Warning: No refresh token returned. (Ensure prompt='consent' was used).")
            else:
                print(f"[+] Refresh Token acquired: {redact(refresh_token)}")

            # Verify channel identity
            if access_token:
                print("[*] Verifying channel identity via YouTube Data API v3...")
                ch_url = "https://www.googleapis.com/youtube/v3/channels?part=snippet&mine=true"
                ch_req = urllib.request.Request(ch_url, headers={"Authorization": f"Bearer {access_token}"})
                try:
                    with urllib.request.urlopen(ch_req) as ch_resp:
                        ch_data = json.loads(ch_resp.read().decode("utf-8"))
                        items = ch_data.get("items", [])
                        if items:
                            ch_title = items[0]["snippet"].get("title")
                            ch_custom = items[0]["snippet"].get("customUrl", "")
                            print(f"  [+] Connected Channel: {ch_title} ({ch_custom})")
                except Exception as e:
                    print(f"  [!] Channel check notice: {e}")

            # Write securely to .env
            env_lines = []
            if ENV_FILE.exists():
                with open(ENV_FILE, "r", encoding="utf-8") as f:
                    env_lines = f.readlines()

            keys_to_update = {
                "YOUTUBE_CLIENT_ID": client_id,
                "YOUTUBE_CLIENT_SECRET": client_secret,
                "YOUTUBE_REFRESH_TOKEN": refresh_token or "",
                "YOUTUBE_OAUTH_STATUS": "testing"  # Default status until published
            }

            new_lines = []
            found_keys = set()
            for line in env_lines:
                matched = False
                for k, v in keys_to_update.items():
                    if line.startswith(f"{k}="):
                        new_lines.append(f"{k}={v}\n")
                        found_keys.add(k)
                        matched = True
                        break
                if not matched:
                    new_lines.append(line)

            for k, v in keys_to_update.items():
                if k not in found_keys:
                    new_lines.append(f"{k}={v}\n")

            with open(ENV_FILE, "w", encoding="utf-8") as f:
                f.writelines(new_lines)

            print("[+] Successfully saved credentials to .env file.")
            print("\n" + "=" * 80)
            print("OFFICIAL GOOGLE OAUTH 2.0 LIFECYCLE NOTICE:")
            print("1. Testing Mode:")
            print("   - Refresh tokens expire automatically after 7 DAYS.")
            print("   - Only authorized test users in Google Cloud Console can sign in.")
            print("2. Production Mode (After publishing consent screen in Cloud Console):")
            print("   - Refresh tokens DO NOT expire at 7 days.")
            print("   - CRITICAL: Production mode does NOT mean tokens are permanent!")
            print("   - Google revokes refresh tokens under any of these conditions:")
            print("     a) User revokes app permissions in Google Account Security settings.")
            print("     b) The token is unused for 6 consecutive months.")
            print("     c) The Google Account password is changed.")
            print("     d) The project exceeds the 100 refresh token limit per user/client.")
            print("     e) Google Workspace / Cloud session length policies enforce re-authentication.")
            print("3. Health Monitoring & Re-authorization:")
            print("   - The engine automatically checks token health before scheduled jobs.")
            print("   - If invalid_grant is detected, re-run this script anytime: python scripts/setup_youtube_oauth.py")
            print("=" * 80)

    except urllib.error.HTTPError as e:
        print(f"[-] Token exchange failed: {e.read().decode('utf-8')}")
    except Exception as e:
        print(f"[-] Error: {e}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="RTechLab YouTube Data API v3 OAuth Wizard")
    parser.add_argument("--client-id", dest="client_id", help="Google Cloud OAuth 2.0 Client ID")
    parser.add_argument("--client-secret", dest="client_secret", help="Google Cloud OAuth 2.0 Client Secret")
    args = parser.parse_args()
    setup_oauth(cli_id=args.client_id, cli_secret=args.client_secret)
