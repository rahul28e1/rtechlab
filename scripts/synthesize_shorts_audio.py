#!/usr/bin/env python3
"""
RTechLab Master Shorts Audio & Subtitle Synthesizer
Generates bilingual narration and subtitles for Shorts 01, 02, 03 across Topics 02 to 07.
"""

import asyncio
import edge_tts
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
AUDIO_OUT_DIR = PROJECT_ROOT / "video-engine" / "public" / "audio" / "shorts"
SUBTITLE_OUT_DIR = PROJECT_ROOT / "video-engine" / "public" / "subtitles" / "shorts"
AUDIO_OUT_DIR.mkdir(parents=True, exist_ok=True)
SUBTITLE_OUT_DIR.mkdir(parents=True, exist_ok=True)

VOICE_EN = "en-US-ChristopherNeural"
VOICE_HI = "hi-IN-MadhurNeural"

SHORTS_SCRIPTS = [
    {
        "id": "short_ep02_s1",
        "en": "Think underwater internet cables are as thick as tree trunks? In deep oceans, they are only 17mm thin—the size of a garden hose! Why? At 5,000 meters down, there are zero anchors or fishing nets. Follow RTechLab for real networking!",
        "hi": "क्या आपको लगता है कि समुद्र के नीचे इंटरनेट केबल पेड़ जितनी मोटी होती है? गहरे समुद्र में यह सिर्फ 17 मिलीमीटर पतली होती है! क्योंकि वहां कोई लंगर या जाल नहीं होता। असली नेटवर्किंग के लिए RTechLab को फॉलो करें!"
    },
    {
        "id": "short_ep03_s1",
        "en": "When you type google.com, how does your phone find it in 20 milliseconds? Computers don't speak English—they only understand binary numbers. DNS translates names into IP addresses instantly! Technology made practical with RTechLab.",
        "hi": "जब आप google.com खोलते हैं, तो फोन को 20 मिलीसेकंड में कैसे पता चलता है कि कहाँ जाना है? कंप्यूटर सिर्फ नंबर समझते हैं। DNS नामों को आईपी एड्रेस में तुरंत बदल देता है! RTechLab के साथ सीखें।"
    },
    {
        "id": "short_ep04_s1",
        "en": "When you stream 4K video, the file does not travel in one piece! If one bit dropped, the whole video would fail. Instead, TCP chops your video into thousands of tiny data packets that reassemble on your screen! Follow RTechLab.",
        "hi": "4K वीडियो एक ही टुकड़े में आपके फोन पर नहीं आता! अगर एक भी बिट छूटी, तो वीडियो बंद हो जाएगा। इसलिए नेटवर्क इसे हजारों छोटे पैकेट्स में बांट देता है जो स्क्रीन पर सही क्रम में जुड़ते हैं! RTechLab को सब्सक्राइब करें।"
    },
    {
        "id": "short_ep05_s1",
        "en": "Who directs internet traffic when a submarine cable breaks? There is no central boss. Border Gateway Protocol, or BGP, is the world's GPS—rerouting planetary traffic in seconds! Learn, practice, innovate with RTechLab.",
        "hi": "समुद्र के नीचे केबल कटने पर इंटरनेट को नया रास्ता कौन दिखाता है? कोई एक बॉस नहीं है। BGP इंटरनेट का ग्लोबल जीपीएस है जो सेकंडों में नया रास्ता खोज लेता है! RTechLab से जुड़े रहें।"
    },
    {
        "id": "short_ep06_s1",
        "en": "How does laser light stay trapped inside a bent glass fiber without escaping? The answer is Total Internal Reflection! Light bounces 100% inside, travelling at 200,000 kilometers per second. Practical technology with RTechLab.",
        "hi": "कांच की केबल मुड़ने पर लेज़र लाइट बाहर क्यों नहीं निकलती? इसका राज़ है टोटल इंटरनल रिफ्लेक्शन! रोशनी अंदर ही टकराकर दो लाख किमी प्रति सेकंड की रफ्तार से दौड़ती है। RTechLab के साथ सीखें।"
    },
    {
        "id": "short_ep07_s1",
        "en": "Where does the cloud actually live? Inside football-field-sized hyperscale data centers with backup diesel generators, fiber rings, and liquid cooling servers running 24/7! Result first, explained with RTechLab.",
        "hi": "क्लाउड असल में कहाँ रहता है? फुटबॉल मैदान जितने बड़े हाइपरस्केल डेटा सेंटर्स में, जहाँ हजारों सर्वर और बैकअप जनरेटर चौबीसों घंटे बिना रुके काम करते हैं! RTechLab को फॉलो करें।"
    }
]

async def synthesize_short(s_id, lang, text):
    voice = VOICE_HI if lang == "hi" else VOICE_EN
    mp3_path = AUDIO_OUT_DIR / f"{s_id}_{lang}.mp3"
    comm = edge_tts.Communicate(text, voice)
    await comm.save(str(mp3_path))
    size_kb = mp3_path.stat().st_size / 1024
    print(f"  [+] Short Audio: {mp3_path.name} ({size_kb:.1f} KB)")
    return str(mp3_path)

async def synthesize_all_shorts():
    print("[*] Synthesizing Short Narration Audio...")
    for s in SHORTS_SCRIPTS:
        await synthesize_short(s["id"], "en", s["en"])
        await synthesize_short(s["id"], "hi", s["hi"])
    print("[+] All Shorts Audio Synthesized Successfully!")

if __name__ == "__main__":
    asyncio.run(synthesize_all_shorts())
