#!/usr/bin/env python3
"""
synthesize_quicklearn_audio.py
Synthesizes English and Hindi voice narration for RTechLab QuickLearn: 5 Important Networking Ports.
"""

import asyncio
import subprocess
from pathlib import Path
import edge_tts

PROJECT_ROOT = Path(__file__).resolve().parent.parent
AUDIO_DIR = PROJECT_ROOT / "video-engine" / "public" / "audio" / "quicklearn"
AUDIO_DIR.mkdir(parents=True, exist_ok=True)
FFMPEG = PROJECT_ROOT / "video-engine" / "node_modules" / "@remotion" / "compositor-win32-x64-msvc" / "ffmpeg.exe"

VOICE_EN = "en-US-ChristopherNeural"
VOICE_HI = "hi-IN-MadhurNeural"

SCRIPTS = {
    "quicklearn_ports_en": {
        "voice": VOICE_EN,
        "text": (
            "Think of an IP address as a building address, and ports as the specific doors inside! "
            "Here are five essential ports every engineer must know. "
            "Port 22 is SSH, secure remote access to manage servers. "
            "Port 53 is DNS, translating domain names into IP addresses. "
            "Port 80 is HTTP, transmitting unencrypted web traffic in plain text. "
            "Port 443 is HTTPS, protecting all modern web data with strong encryption. "
            "And Port 3306 is MySQL, connecting backend apps to relational databases. "
            "Follow RTechLab for practical technology! Learn, practice, innovate."
        )
    },
    "quicklearn_ports_hi": {
        "voice": VOICE_HI,
        "text": (
            "इंटरनेट पर आईपी एड्रेस एक बिल्डिंग का पता है, और पोर्ट्स उस बिल्डिंग के अलग-अलग कमरों के दरवाज़े हैं! "
            "ये हैं पांच ज़रूरी नेटवर्किंग पोर्ट्स। "
            "पोर्ट 22 SSH है, रिमोट सर्वर को सुरक्षित रूप से मैनेज करने के लिए। "
            "पोर्ट 53 DNS है, जो वेबसाइट नामों को आईपी एड्रेस में बदलता है। "
            "पोर्ट 80 HTTP है, जो बिना एन्क्रिप्शन के सादा वेब डेटा भेजता है। "
            "पोर्ट 443 HTTPS है, जो आधुनिक वेब ट्रैफिक को सुरक्षित रखता है। "
            "और पोर्ट 3306 MySQL डेटाबेस से कनेक्ट करने का स्टैंडर्ड पोर्ट है। "
            "प्रैक्टिकल टेक्नोलॉजी सीखने के लिए RTechLab को सब्सक्राइब करें!"
        )
    }
}

async def generate_audio():
    print("[*] Generating QuickLearn voice narration...")
    for key, item in SCRIPTS.items():
        out_file = AUDIO_DIR / f"{key}.mp3"
        comm = edge_tts.Communicate(item["text"], item["voice"], rate="+4%")
        await comm.save(str(out_file))
        
        # Probe duration using ffmpeg
        cmd = [
            str(FFMPEG), "-i", str(out_file),
            "-f", "null", "-"
        ]
        res = subprocess.run(cmd, stderr=subprocess.PIPE, stdout=subprocess.PIPE, text=True)
        # Parse Duration from stderr
        for line in res.stderr.splitlines():
            if "Duration:" in line:
                dur_str = line.split("Duration:")[1].split(",")[0].strip()
                # format HH:MM:SS.xx
                h, m, s = dur_str.split(":")
                dur_secs = float(h) * 3600 + float(m) * 60 + float(s)
                frames = int(dur_secs * 30) + 45 # 1.5s padding at end
                print(f"  [+] {key}.mp3: Duration = {dur_secs:.2f}s ({frames} frames @ 30fps) - {out_file.stat().st_size} bytes")
                break

if __name__ == "__main__":
    asyncio.run(generate_audio())
