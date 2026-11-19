import asyncio
import edge_tts
from pathlib import Path
import json

AUDIO_DIR = Path("video-engine/public/audio")
SUBTITLE_DIR = Path("video-engine/public/subtitles")
DATA_DIR = Path("video-engine/src/data")

AUDIO_DIR.mkdir(parents=True, exist_ok=True)
SUBTITLE_DIR.mkdir(parents=True, exist_ok=True)
DATA_DIR.mkdir(parents=True, exist_ok=True)

VOICE_EN = "en-US-ChristopherNeural"
VOICE_HI = "hi-IN-MadhurNeural"

BATCH1_SCRIPTS = [
    {
        "id": "ep02_cable_ship_repair",
        "lang": "en",
        "text": "When an anchor cuts the Internet in the middle of the ocean, who fixes it? Over seventy percent of deep-sea cable breaks are caused by heavy ship anchors and commercial fishing nets. First, engineers pinpoint the fault from land. Optical Time-Domain Reflectometers send a laser pulse down the fiber and measure the nanosecond echo, locating the break within ten meters! Next, a specialized cable repair ship arrives on GPS coordinates and deploys an ROV submersible into the pitch-black abyss. The ROV cuts the damaged section, and heavy grappling hooks haul both severed cable ends to the surface. In an onboard cleanroom, engineers align nine-micrometer glass fibers under microscopes and fuse them together with electric arcs! A spare bight of new cable is lowered back to the ocean floor. Internet traffic is restored! Follow RTechLab for real networking."
    },
    {
        "id": "ep02_cable_ship_repair",
        "lang": "hi",
        "text": "जब समुद्र के बीच में जहाजों का लंगर इंटरनेट केबल काट देता है, तो उसे कौन ठीक करता है? समुद्र में 70% से ज्यादा केबल ब्रेक्स भारी लंगर और मछली पकड़ने वाले जालों से होते हैं। सबसे पहले इंजीनियर जमीन से ही फॉल्ट का पता लगाते हैं। ऑप्टिकल टाइम-डोमेन रिफ्लेक्टोमीटर लेज़र पल्स भेजकर नैनोसेकंड में 10 मीटर की सटीकता से ब्रेक खोज लेते हैं! फिर स्पेशल केबल रिपेयर जहाज जीपीएस लोकेशन पर पहुंचता है और गहरे समुद्र में आरओवी सबमर्सिबल भेजता है। आरओवी खराब हिस्से को काटता है और भारी हुक दोनों सिरों को खींचकर जहाज के डेक पर लाते हैं। जहाज के क्लीनरूम में इंजीनियर माइक्रोस्कोप के नीचे 9 माइक्रोमीटर के पतले ग्लास फाइबर को इलेक्ट्रिक आर्क से जोड़ते हैं! नई केबल को वापस समुद्र तल पर बिछा दिया जाता है और इंटरनेट बहाल हो जाता है! असली नेटवर्किंग के लिए RTechLab से जुड़े रहें।"
    },
    {
        "id": "ep03_cold_warm_cache",
        "lang": "en",
        "text": "Ever notice how a website loads ten times faster the second time you click it? Here is the secret of Cold Cache versus Warm Cache. When you type google.com for the very first time, your computer has never seen it before. This is a Cold Cache lookup. First, the browser checks its local memory. Nothing. It asks the operating system resolver. Still nothing. So a query packet travels across the network: from your ISP resolver, to the global Root servers, down to the dot com TLD server, and finally to Google's Authoritative Nameserver! The authoritative server returns the official IP address with a Time-To-Live. Total time: about fifteen milliseconds. But on your second visit—that is the Warm Cache! Your browser checks local RAM, finds the saved IP, and opens the page in zero milliseconds without sending a single network packet! Technology made practical with RTechLab."
    },
    {
        "id": "ep03_cold_warm_cache",
        "lang": "hi",
        "text": "क्या आपने कभी ध्यान दिया है कि कोई वेबसाइट दूसरी बार खोलने पर दस गुना तेजी से क्यों खुलती है? यह कमाल है कोल्ड कैश बनाम वार्म कैश का! जब आप पहली बार google.com टाइप करते हैं, तो कंप्यूटर के लिए यह बिल्कुल नया होता है। इसे कोल्ड कैश लुकअप कहते हैं। सबसे पहले ब्राउज़र अपनी मेमोरी चेक करता है—खाली। ऑपरेटिंग सिस्टम चेक करता है—खाली। फिर रिक्वेस्ट नेटवर्क पर दौड़ती है: आपके आईएसपी से ग्लोबल रूट सर्वर, फिर डॉट कॉम सर्वर, और अंत में गूगल के अथॉरिटेटिव सर्वर तक! वहां से आईपी एड्रेस मिलता है और इसमें लगते हैं करीब 15 मिलीसेकंड। लेकिन जब आप दोबारा क्लिक करते हैं, तो वह होता है वार्म कैश! ब्राउज़र बिना किसी नेटवर्क कॉल के सीधे रैम से 0 मिलीसेकंड में आईपी उठा लेता है! RTechLab के साथ सीखें प्रैक्टिकल नेटवर्किंग।"
    }
]

async def synthesize_item(item):
    s_id = item["id"]
    lang = item["lang"]
    text = item["text"]
    voice = VOICE_HI if lang == "hi" else VOICE_EN
    
    mp3_path = AUDIO_DIR / f"{s_id}_{lang}.mp3"
    vtt_path = SUBTITLE_DIR / f"{s_id}_{lang}.vtt"
    js_cues_path = DATA_DIR / f"cues_{s_id}_{lang}.js"
    
    print(f"[*] Synthesizing {s_id}_{lang}.mp3...")
    comm = edge_tts.Communicate(text, voice)
    
    cues = []
    with open(mp3_path, "wb") as f_mp3:
        async for chunk in comm.stream():
            if chunk["type"] == "audio":
                f_mp3.write(chunk["data"])
            elif chunk["type"] in ("WordBoundary", "SentenceBoundary"):
                start_s = chunk["offset"] / 10_000_000.0
                dur_s = chunk["duration"] / 10_000_000.0
                t = chunk.get("text", "")
                cues.append({
                    "start": round(start_s, 3),
                    "end": round(start_s + dur_s, 3),
                    "startFrame": int(round(start_s * 30)),
                    "endFrame": int(round((start_s + dur_s) * 30)),
                    "text": t
                })
                
    # Group into readable subtitle phrases (3-7 words)
    grouped = []
    curr_words = []
    curr_start = None
    curr_end = None
    
    for c in cues:
        if curr_start is None:
            curr_start = c["start"]
        curr_words.append(c["text"])
        curr_end = c["end"]
        
        # Break on punctuation or after 6 words
        if c["text"].endswith((".", "!", "?", "।", "—")) or len(curr_words) >= 6:
            sentence_text = " ".join(curr_words).strip()
            grouped.append({
                "start": curr_start,
                "end": curr_end,
                "startFrame": int(round(curr_start * 30)),
                "endFrame": int(round(curr_end * 30)),
                "text": sentence_text
            })
            curr_words = []
            curr_start = None
            curr_end = None
            
    if curr_words:
        sentence_text = " ".join(curr_words).strip()
        grouped.append({
            "start": curr_start,
            "end": curr_end,
            "startFrame": int(round(curr_start * 30)),
            "endFrame": int(round(curr_end * 30)),
            "text": sentence_text
        })
        
    # Write VTT
    with open(vtt_path, "w", encoding="utf-8") as f_vtt:
        f_vtt.write("WEBVTT\n\n")
        for i, g in enumerate(grouped, 1):
            def fmt(t):
                m = int(t // 60)
                s = t % 60
                return f"00:{m:02d}:{s:06.3f}"
            f_vtt.write(f"{i}\n{fmt(g['start'])} --> {fmt(g['end'])}\n{g['text']}\n\n")
            
    # Write JS cues module
    var_name = f"CUES_{s_id.upper()}_{lang.upper()}"
    with open(js_cues_path, "w", encoding="utf-8") as f_js:
        f_js.write(f"export const {var_name} = {json.dumps(grouped, ensure_ascii=False, indent=2)};\n")
        
    print(f"  [+] Saved {mp3_path.name} & {js_cues_path.name} ({len(grouped)} cues)")

async def main():
    for item in BATCH1_SCRIPTS:
        await synthesize_item(item)
    print("\n[+] Batch 1 Audio & Subtitles Synthesized!")

if __name__ == "__main__":
    asyncio.run(main())
