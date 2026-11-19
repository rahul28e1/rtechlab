#!/usr/bin/env python3
"""
RTechLab Master Audio & Subtitle Synthesizer for Episodes 02 to 07
Generates broadcast-quality bilingual narration (English & Hindi) using edge-tts:
- English: en-US-ChristopherNeural
- Hindi: hi-IN-MadhurNeural
Generates synchronized MP3 audio and WebVTT (.vtt) / SubRip (.srt) subtitles.
"""

import asyncio
import edge_tts
import json
import os
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
AUDIO_OUT_DIR = PROJECT_ROOT / "video-engine" / "public" / "audio"
SUBTITLE_OUT_DIR = PROJECT_ROOT / "video-engine" / "public" / "subtitles"
AUDIO_OUT_DIR.mkdir(parents=True, exist_ok=True)
SUBTITLE_OUT_DIR.mkdir(parents=True, exist_ok=True)

VOICE_EN = "en-US-ChristopherNeural"
VOICE_HI = "hi-IN-MadhurNeural"

# Master Narration Scripts for EP02 to EP07 (Factual, Educational, Result-First)
EPISODES_SCRIPTS = {
    "ep02": {
        "title": "Underwater Internet Cables",
        "en": (
            "If you drop a phone in the middle of the Atlantic, it is lost forever. "
            "Yet ninety-nine percent of all planetary data, Zoom calls, and cloud backups "
            "stream through glass fibers lying on that exact ocean floor, under five thousand meters of freezing salt water! "
            "Over five hundred and fifty active cable systems span 1.4 million kilometers across the globe. "
            "In the deep ocean, the cable is only seventeen millimeters thick—the size of a garden hose—because deep abyss has zero human disturbance. "
            "Near shallow shores, heavy steel armor wraps the core to protect against forty-ton anchors and fishing trawlers. "
            "Every eighty kilometers, titanium repeaters amplify the laser pulses, powered by a single copper tube carrying ten thousand volts! "
            "The Internet is not a cloud in the sky—it is a physical network of light under the sea. "
            "Learn, practice, and innovate with RTechLab!"
        ),
        "hi": (
            "अगर आपका फोन समुद्र के बीच में गिर जाए, तो वह हमेशा के लिए खो जाता है। "
            "लेकिन दुनिया का निन्यानवे प्रतिशत इंटरनेट डेटा, वीडियो कॉल्स और क्लाउड फाइल्स "
            "उसी समुद्र की गहराई में बिछी कांच की फाइबर केबल्स से होकर गुजरती हैं! "
            "दुनिया भर में 550 से ज्यादा केबल सिस्टम 14 लाख किलोमीटर में फैले हैं। "
            "गहरे समुद्र में यह केबल सिर्फ 17 मिलीमीटर पतली होती है, क्योंकि वहां इंसानी दखल नहीं होता। "
            "लेकिन किनारों के पास जहाजों के लंगर से बचाने के लिए इस पर स्टील की मोटी आर्मरिंग की जाती है। "
            "हर अस्सी किलोमीटर पर रिपीटर्स लेजर सिग्नल को बूस्ट करते हैं, जिन्हें दस हजार वोल्ट की बिजली दी जाती है! "
            "इंटरनेट कोई बादल नहीं, समुद्र के नीचे रोशनी का एक भौतिक नेटवर्क है। "
            "RTechLab के साथ सीखें, अभ्यास करें और नवाचार करें!"
        )
    },
    "ep03": {
        "title": "DNS Domain Name System",
        "en": (
            "You type google.com and within twenty milliseconds, the page opens. "
            "Computers cannot understand letters; they only understand binary IP addresses. "
            "How does your browser convert words into numbers so fast? Meet DNS: the phonebook of the Internet. "
            "First, your browser checks its local cache. If missing, it queries a Recursive Resolver at your ISP. "
            "The resolver asks one of thirteen Root Server clusters, which directs it to the Dot Com Top-Level Domain server. "
            "Finally, the Authoritative Name Server provides the exact IP address. "
            "Millions of queries happen every second, cached securely using TTL. "
            "Master modern networking with RTechLab!"
        ),
        "hi": (
            "आप ब्राउज़र में google.com टाइप करते हैं और बीस मिलीसेकंड में पेज खुल जाता है। "
            "कंप्यूटर अक्षरों को नहीं, केवल बाइनरी आईपी एड्रेस को समझते हैं। "
            "तो ब्राउज़र इन नामों को इतनी तेजी से नंबरों में कैसे बदलता है? यह काम करता है DNS, यानी इंटरनेट की फोनबुक। "
            "सबसे पहले आपका कंप्यूटर लोकल कैश चेक करता है। वहां न मिलने पर रिक्वेस्ट आपके आईएसपी के पास जाती है। "
            "आईएसपी रूट सर्वर से पूछता है, रूट सर्वर डॉट कॉम सर्वर पर भेजता है, और वहां से सटीक आईपी एड्रेस मिलता है। "
            "यह पूरी प्रक्रिया कुछ ही मिलीसेकंड में पूरी हो जाती है। "
            "प्रैक्टिकल नेटवर्किंग सीखने के लिए RTechLab को सब्सक्राइब करें!"
        )
    },
    "ep04": {
        "title": "Data Packets (How Video Travels)",
        "en": (
            "When you watch a 4K video, the file is not sent in one single piece. "
            "If a one-gigabyte file dropped a single bit midway, you would have to restart from zero! "
            "Instead, networking protocols chop every video into millions of tiny chunks called Data Packets. "
            "Each packet has an IP header with source and destination addresses, sequence numbers, and payload. "
            "Packets travel across different global routers independently and reassemble in perfect order at your screen using TCP! "
            "Result first, technology explained simply with RTechLab."
        ),
        "hi": (
            "जब आप 4K वीडियो देखते हैं, तो वह पूरी फाइल एक साथ आपके फोन पर नहीं आती। "
            "अगर बीच में एक भी बिट मिस हो जाए, तो पूरी फाइल दोबारा डाउनलोड करनी पड़ेगी! "
            "इसलिए नेटवर्क प्रोटोकॉल हर वीडियो को लाखों छोटे टुकड़ों में बांट देते हैं, जिन्हें डेटा पैकेट्स कहते हैं। "
            "हर पैकेट में सेंडर और रिसीवर का आईपी एड्रेस और सीक्वेंस नंबर होता है। "
            "ये पैकेट्स अलग-अलग रास्तों से सफर करते हैं और आपके फोन पर टीसीपी के ज़रिए सही क्रम में जुड़ जाते हैं! "
            "टेक्नोलॉजी को आसान भाषा में समझने के लिए RTechLab से जुड़े रहें।"
        )
    },
    "ep05": {
        "title": "BGP Internet Routing",
        "en": (
            "How does data know the fastest way across fifty thousand interconnected networks? "
            "There is no central computer directing the world's internet traffic. "
            "Instead, the Border Gateway Protocol, or BGP, acts as the world's global GPS. "
            "Autonomous Systems announce available IP prefixes to their neighbors. "
            "When a fiber cable is cut, BGP automatically recalculates alternative routes in seconds, keeping the world connected. "
            "Practical technology education by RTechLab and IANT Palanpur."
        ),
        "hi": (
            "डेटा को कैसे पता चलता है कि पचास हजार नेटवर्कों के बीच सबसे तेज रास्ता कौन सा है? "
            "पूरी दुनिया के इंटरनेट ट्रैफिक को कंट्रोल करने वाला कोई एक सेंट्रल कंप्यूटर नहीं है। "
            "यह काम करता है बीजीपी, यानी बॉर्डर गेटवे प्रोटोकॉल—इंटरनेट का ग्लोबल जीपीएस। "
            "सभी नेटवर्क अपने रास्ते एक-दूसरे को बताते हैं। "
            "जब कोई केबल कट जाती है, तो बीजीपी तुरंत नया रास्ता खोज लेता है ताकि इंटरनेट कभी बंद न हो। "
            "RTechLab और आईएएनटी पालनपुर के साथ सीखें प्रैक्टिकल नेटवर्किंग।"
        )
    },
    "ep06": {
        "title": "Optical Fiber (Light Carrying Data)",
        "en": (
            "Inside every internet cable lies a thread of pure silica glass thinner than a human hair. "
            "How does light stay trapped inside a bent glass tube without leaking out? "
            "The secret is Total Internal Reflection. "
            "When light hits the boundary between core and cladding at an angle greater than the critical angle, "
            "it bounces one hundred percent inward, racing at two hundred thousand kilometers per second! "
            "Explore deep-tech engineering with RTechLab."
        ),
        "hi": (
            "इंटरनेट की हर केबल के अंदर इंसान के बाल से भी पतली शुद्ध कांच की एक नली होती है। "
            "लेकिन जब केबल मुड़ती है, तो रोशनी बाहर क्यों नहीं निकलती? "
            "इसका राज़ है टोटल इंटरनल रिफ्लेक्शन। "
            "जब लेज़र लाइट एक खास एंगल पर कोर और क्लैडिंग से टकराती है, तो वह बाहर निकलने के बजाय अंदर ही रिफ्लेक्ट होती है "
            "और दो लाख किलोमीटर प्रति सेकंड की रफ्तार से आगे बढ़ती है! "
            "RTechLab के साथ टेक्नोलॉजी को प्रैक्टिकल बनाएं।"
        )
    },
    "ep07": {
        "title": "Data Centers (Where Your Video Lives)",
        "en": (
            "Where does your data actually sleep? Inside mega facilities called hyperscale data centers. "
            "Rows of thousands of enterprise blade servers operate around the clock with redundant power grids, "
            "diesel generators, and advanced closed-loop chilled water cooling systems. "
            "When you request a file, it wakes a solid-state drive in a server hall and streams to your device in milliseconds. "
            "Learn, practice, and innovate with RTechLab!"
        ),
        "hi": (
            "आपका डेटा असल में कहाँ सुरक्षित रहता है? हाइपरस्केल डेटा सेंटर्स की विशाल इमारतों में। "
            "हजारों सर्वर चौबीसों घंटे बिना रुके चलते हैं। इनके लिए बैकअप जनरेटर, "
            "और अत्याधुनिक लिक्विड कूलिंग सिस्टम लगे होते हैं ताकि सर्वर गर्म न हों। "
            "जैसे ही आप कोई फाइल मांगते हैं, सर्वर रूम की एसएसडी एक्टिव होती है और मिलीसेकंड में डेटा आपके पास पहुंचता है। "
            "प्रैक्टिकल कंप्यूटर साइंस के लिए RTechLab से जुड़े रहें!"
        )
    }
}

async def synthesize_one(ep_key, lang, script_text):
    voice = VOICE_HI if lang == "hi" else VOICE_EN
    mp3_path = AUDIO_OUT_DIR / f"{ep_key}_{lang}.mp3"
    vtt_path = SUBTITLE_OUT_DIR / f"{ep_key}_{lang}.vtt"
    srt_path = SUBTITLE_OUT_DIR / f"{ep_key}_{lang}.srt"
    
    print(f"[*] Synthesizing {ep_key.upper()} ({lang.upper()}) using {voice}...")
    comm = edge_tts.Communicate(script_text, voice, rate="+0%", pitch="+0Hz")
    
    cues = []
    with open(mp3_path, "wb") as f_mp3:
        async for chunk in comm.stream():
            if chunk["type"] == "audio":
                f_mp3.write(chunk["data"])
            elif chunk["type"] in ("WordBoundary", "SentenceBoundary"):
                start_s = chunk["offset"] / 10_000_000.0
                dur_s = chunk["duration"] / 10_000_000.0
                text = chunk.get("text", "")
                cues.append({
                    "start": round(start_s, 3),
                    "end": round(start_s + dur_s, 3),
                    "text": text
                })
                
    # Generate clean WebVTT and SRT subtitles
    sentences = [c for c in cues if len(c.get("text", "").split()) > 2]
    if not sentences:
        sentences = cues
        
    def sec_to_vtt(t):
        hrs = int(t // 3600)
        mins = int((t % 3600) // 60)
        secs = t % 60
        return f"{hrs:02d}:{mins:02d}:{secs:06.3f}"

    def sec_to_srt(t):
        hrs = int(t // 3600)
        mins = int((t % 3600) // 60)
        secs = int(t % 60)
        milli = int(round((t - int(t)) * 1000))
        return f"{hrs:02d}:{mins:02d}:{secs:02d},{milli:03d}"

    # Write VTT
    with open(vtt_path, "w", encoding="utf-8") as f_vtt:
        f_vtt.write("WEBVTT\n\n")
        for i, s in enumerate(sentences, 1):
            f_vtt.write(f"{i}\n{sec_to_vtt(s['start'])} --> {sec_to_vtt(s['end'])}\n{s['text']}\n\n")

    # Write SRT
    with open(srt_path, "w", encoding="utf-8") as f_srt:
        for i, s in enumerate(sentences, 1):
            f_srt.write(f"{i}\n{sec_to_srt(s['start'])} --> {sec_to_srt(s['end'])}\n{s['text']}\n\n")

    size_kb = mp3_path.stat().st_size / 1024
    print(f"  [+] Created: {mp3_path.name} ({size_kb:.1f} KB) & subtitles ({vtt_path.name})")
    return {
        "mp3": str(mp3_path),
        "vtt": str(vtt_path),
        "srt": str(srt_path),
        "size_kb": size_kb
    }

async def synthesize_all():
    results = {}
    for ep_key, data in EPISODES_SCRIPTS.items():
        results[ep_key] = {}
        results[ep_key]["en"] = await synthesize_one(ep_key, "en", data["en"])
        results[ep_key]["hi"] = await synthesize_one(ep_key, "hi", data["hi"])
    print("\n[+] All Audio & Subtitle Assets Synthesized Successfully!")
    return results

if __name__ == "__main__":
    asyncio.run(synthesize_all())
